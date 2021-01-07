Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5AF2EC95A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 05:21:03 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxMnG-0005Wl-4o
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 23:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxMm1-0004cB-2K
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:19:45 -0500
Received: from relay64.bu.edu ([128.197.228.104]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxMlz-0003lr-80
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:19:44 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1074JGS4012739
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 6 Jan 2021 23:19:19 -0500
Date: Wed, 6 Jan 2021 23:19:16 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 2/7] fuzz: double the IOs to remove for every loop
Message-ID: <20210107041916.zy7xtzbbdurnowdc@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB17455D5C7EBFF7D9D7510A4DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB17455D5C7EBFF7D9D7510A4DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
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
> Instead of removing IO instructions one by one, we can try deleting multiple
> instructions at once. According to the locality of reference, we double the
> number of instructions to remove for the next round and recover it to one
> once we fail.
> 
> This patch is usually significant for large input.
> 
> Test with quadrupled trace input at:
>   https://bugs.launchpad.net/qemu/+bug/1890333/comments/1
> 
> Patched 1/6 version:
>   real  0m45.904s
>   user  0m16.874s
>   sys   0m10.042s
> 
> Refined version:
>   real  0m11.412s
>   user  0m6.888s
>   sys   0m3.325s
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 33 +++++++++++++++---------
>  1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index aa69c7963e..0b665ae657 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -85,19 +85,28 @@ def minimize_trace(inpath, outpath):
>  
>      i = 0
>      newtrace = trace[:]
> -    # For each line
> +    remove_step = 1
>      while i < len(newtrace):
> -        # 1.) Try to remove it completely and reproduce the crash. If it works,
> -        # we're done.
> -        prior = newtrace[i]
> -        print("Trying to remove {}".format(newtrace[i]))
> -        # Try to remove the line completely
> -        newtrace[i] = ""
> +        # 1.) Try to remove lines completely and reproduce the crash.
> +        # If it works, we're done.
> +        if (i+remove_step) >= len(newtrace):
> +            remove_step = 1
> +        prior = newtrace[i:i+remove_step]
> +        for j in range(i, i+remove_step):
> +            newtrace[j] = ""
> +        print("Removing {lines} ...".format(lines=prior))
>          if check_if_trace_crashes(newtrace, outpath):
> -            i += 1
> +            i += remove_step
> +            # Double the number of lines to remove for next round
> +            remove_step *= 2
>              continue
> -        newtrace[i] = prior
> -
> +        # Failed to remove multiple IOs, fast recovery
> +        if remove_step > 1:
> +            for j in range(i, i+remove_step):
> +                newtrace[j] = prior[j-i]
> +            remove_step = 1
> +            continue
> +        newtrace[i] = prior[0] # remove_step = 1
>          # 2.) Try to replace write{bwlq} commands with a write addr, len
>          # command. Since this can require swapping endianness, try both LE and
>          # BE options. We do this, so we can "trim" the writes in (3)
> @@ -118,7 +127,7 @@ def minimize_trace(inpath, outpath):
>                  if(check_if_trace_crashes(newtrace, outpath)):
>                      break
>              else:
> -                newtrace[i] = prior
> +                newtrace[i] = prior[0]
>  
>          # 3.) If it is a qtest write command: write addr len data, try to split
>          # it into two separate write commands. If splitting the write down the
> @@ -151,7 +160,7 @@ def minimize_trace(inpath, outpath):
>                  if check_if_trace_crashes(newtrace, outpath):
>                      i -= 1
>                  else:
> -                    newtrace[i] = prior
> +                    newtrace[i] = prior[0]
>                      del newtrace[i+1]
>          i += 1
>      check_if_trace_crashes(newtrace, outpath)
> -- 
> 2.25.1
> 

