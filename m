Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 242042EECBB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:59:37 +0100 (CET)
Received: from localhost ([::1]:58944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjs8-0001sN-59
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxjRZ-0001L5-8t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:32:09 -0500
Received: from relay68.bu.edu ([128.197.228.73]:50854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxjRX-0006YA-Dc
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:32:08 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 1084Uq1p022772
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 7 Jan 2021 23:30:55 -0500
Date: Thu, 7 Jan 2021 23:30:52 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 7/7] fuzz: heuristic split write based on past IOs
Message-ID: <20210108043052.uarsduahnnud7bfx@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174588DE27F32E918F71DA1BFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB174588DE27F32E918F71DA1BFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201229 1240, Qiuhao Li wrote:
> If previous write commands write the same length of data with the same step,
> we view it as a hint.
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 56 ++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index a681984076..6cbf2b0419 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -85,6 +85,43 @@ def check_if_trace_crashes(trace, path):
>      return False
>  
>  
> +# If previous write commands write the same length of data at the same
> +# interval, we view it as a hint.
> +def split_write_hint(newtrace, i):
> +    HINT_LEN = 3 # > 2
> +    if i <=(HINT_LEN-1):
> +        return None
> +
> +    #find previous continuous write traces
> +    k = 0
> +    l = i-1
> +    writes = []
> +    while (k != HINT_LEN and l >= 0):
> +        if newtrace[l].startswith("write "):
> +            writes.append(newtrace[l])
> +            k += 1
> +            l -= 1
> +        elif newtrace[l] == "":
> +            l -= 1
> +        else:
> +            return None
> +    if k != HINT_LEN:
> +        return None
> +
> +    length = int(writes[0].split()[2], 16)
> +    for j in range(1, HINT_LEN):
> +        if length != int(writes[j].split()[2], 16):
> +            return None
> +
> +    step = int(writes[0].split()[1], 16) - int(writes[1].split()[1], 16)
> +    for j in range(1, HINT_LEN-1):
> +        if step != int(writes[j].split()[1], 16) - \
> +            int(writes[j+1].split()[1], 16):
> +            return None
> +
> +    return (int(writes[0].split()[1], 16)+step, length)
> +
> +
>  def remove_minimizer(newtrace, outpath):
>      remove_step = 1
>      i = 0
> @@ -148,6 +185,25 @@ def remove_minimizer(newtrace, outpath):
>              length = int(newtrace[i].split()[2], 16)
>              data = newtrace[i].split()[3][2:]
>              if length > 1:
> +
> +                # Can we get a hint from previous writes?
> +                hint = split_write_hint(newtrace, i)
> +                if hint is not None:
> +                    hint_addr = hint[0]
> +                    hint_len = hint[1]
> +                    if hint_addr >= addr and hint_addr+hint_len <= addr+length:
> +                        newtrace[i] = "write {addr} {size} 0x{data}\n".format(
> +                            addr=hex(hint_addr),
> +                            size=hex(hint_len),
> +                            data=data[(hint_addr-addr)*2:\
> +                                (hint_addr-addr)*2+hint_len*2])
> +                        if check_if_trace_crashes(newtrace, outpath):
> +                            # next round
> +                            i += 1
> +                            continue
> +                        newtrace[i] = prior[0]
> +
> +                # Try splitting it using a binary approach
>                  leftlength = int(length/2)
>                  rightlength = length - leftlength
>                  newtrace.insert(i+1, "")
> -- 
> 2.25.1
> 

