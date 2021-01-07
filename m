Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230E2EC9DB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:10:50 +0100 (CET)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxNZQ-0005mV-Vv
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxNY2-0004vn-Du
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:09:23 -0500
Received: from relay64.bu.edu ([128.197.228.104]:45789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxNY0-0001rn-2a
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:09:21 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10758J1W009767
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 7 Jan 2021 00:08:23 -0500
Date: Thu, 7 Jan 2021 00:08:19 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 5/7] fuzz: set bits in operand of write/out to zero
Message-ID: <20210107050819.heon7dfgfmhko4uw@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB17458E59681E482B73EDC9A6FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB17458E59681E482B73EDC9A6FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Simplifying the crash cases by opportunistically setting bits in operands of
> out/write to zero may help to debug, since usually bit one means turn on or
> trigger a function while zero is the default turn-off setting.
> 
> Tested Bug 1908062.
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 39 ++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 378a7ccec6..70ac0c5366 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -164,6 +164,42 @@ def remove_minimizer(newtrace, outpath):
>          i += 1
>  
>  
> +def set_zero_minimizer(newtrace, outpath):
> +    # try setting bits in operands of out/write to zero
> +    i = 0
> +    while i < len(newtrace):
> +        if (not newtrace[i].startswith("write ") and not
> +           newtrace[i].startswith("out")):
> +           i += 1
> +           continue
> +        # write ADDR SIZE DATA
> +        # outx ADDR VALUE
> +        print("\nzero setting bits: {}".format(newtrace[i]))
> +
> +        prefix = " ".join(newtrace[i].split()[:-1])
> +        data = newtrace[i].split()[-1]
> +        data_bin = bin(int(data, 16))
> +        data_bin_list = list(data_bin)
> +
> +        for j in range(2, len(data_bin_list)):
> +            prior = newtrace[i]
> +            if (data_bin_list[j] == '1'):
> +                data_bin_list[j] = '0'
> +                data_try = hex(int("".join(data_bin_list), 2))
> +                # It seems qtest only accepts padded hex-values.
> +                if len(data_try) % 2 == 1:
> +                    data_try = data_try[:2] + "0" + data_try[2:-1]
> +
> +                newtrace[i] = "{prefix} {data_try}\n".format(
> +                        prefix=prefix,
> +                        data_try=data_try)
> +
> +                if not check_if_trace_crashes(newtrace, outpath):
> +                    data_bin_list[j] = '1'
> +                    newtrace[i] = prior
> +        i += 1
> +
> +
>  def minimize_trace(inpath, outpath):
>      global TIMEOUT
>      with open(inpath) as f:
> @@ -184,7 +220,10 @@ def minimize_trace(inpath, outpath):
>          old_len = len(newtrace)
>          remove_minimizer(newtrace, outpath)
>          newtrace = list(filter(lambda s: s != "", newtrace))
> +    assert(check_if_trace_crashes(newtrace, outpath))
>  
> +    # set zero minimizer
> +    set_zero_minimizer(newtrace, outpath)
>      assert(check_if_trace_crashes(newtrace, outpath))
>  
>  
> -- 
> 2.25.1
> 

