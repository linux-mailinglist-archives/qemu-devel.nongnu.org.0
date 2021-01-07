Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19CE2EC9B1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 05:55:07 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxNKE-0002rk-E9
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 23:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxNJT-0002Qb-1f
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:54:19 -0500
Received: from relay64.bu.edu ([128.197.228.104]:45380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxNJQ-0003MW-Si
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 23:54:18 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1074rSZG032311
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 6 Jan 2021 23:53:32 -0500
Date: Wed, 6 Jan 2021 23:53:28 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 4/7] fuzz: loop the remove minimizer and refactoring
Message-ID: <20210107045328.owso2kow2gvqbdzq@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB17457CC3B59A47C3005560DCFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB17457CC3B59A47C3005560DCFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
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
> Now we use a one-time scan and remove strategy in the remval minimizer,
> which is not suitable for timing dependent instructions.
> 
> For example, instruction A will indicate an address where the config
> chunk locates, and instruction B will make the configuration active. If
> we have the following instruction sequence:
> 
> ...
> A1
> B1
> A2
> B2
> ...
> 
> A2 and B2 are the actual instructions that trigger the bug.
> 
> If we scan from top to bottom, after we remove A1, the behavior of B1
> might be unknowable, including not to crash the program. But we will
> successfully remove B1 later cause A2 and B2 will crash the process
> anyway:
> 
> ...
> A1
> A2
> B2
> ...
> 
> Now one more trimming will remove A1.
> 
> In the perfect case, we would need to be able to remove A and B (or C!) at
> the same time. But for now, let's just add a loop around the minimizer.
> 
> Since we only remove instructions, this iterative algorithm is converging.
> 
> Tested with Bug 1908062.
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Small note below, but otherwise:
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 41 +++++++++++++++---------
>  1 file changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 1a26bf5b93..378a7ccec6 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -71,21 +71,9 @@ def check_if_trace_crashes(trace, path):
>      return False
>  
>  
> -def minimize_trace(inpath, outpath):
> -    global TIMEOUT
> -    with open(inpath) as f:
> -        trace = f.readlines()
> -    start = time.time()
> -    if not check_if_trace_crashes(trace, outpath):
> -        sys.exit("The input qtest trace didn't cause a crash...")
> -    end = time.time()
> -    print("Crashed in {} seconds".format(end-start))
> -    TIMEOUT = (end-start)*5
> -    print("Setting the timeout for {} seconds".format(TIMEOUT))
> -
> -    i = 0
> -    newtrace = trace[:]
> +def remove_minimizer(newtrace, outpath):

Maybe a different name for this function?
e.g. minimize_each_line or minimize_iter

-Alex

>      remove_step = 1
> +    i = 0
>      while i < len(newtrace):
>          # 1.) Try to remove lines completely and reproduce the crash.
>          # If it works, we're done.
> @@ -174,7 +162,30 @@ def minimize_trace(inpath, outpath):
>                      newtrace[i] = prior[0]
>                      del newtrace[i+1]
>          i += 1
> -    check_if_trace_crashes(newtrace, outpath)
> +
> +
> +def minimize_trace(inpath, outpath):
> +    global TIMEOUT
> +    with open(inpath) as f:
> +        trace = f.readlines()
> +    start = time.time()
> +    if not check_if_trace_crashes(trace, outpath):
> +        sys.exit("The input qtest trace didn't cause a crash...")
> +    end = time.time()
> +    print("Crashed in {} seconds".format(end-start))
> +    TIMEOUT = (end-start)*5
> +    print("Setting the timeout for {} seconds".format(TIMEOUT))
> +
> +    newtrace = trace[:]
> +
> +    # remove minimizer
> +    old_len = len(newtrace) + 1
> +    while(old_len > len(newtrace)):
> +        old_len = len(newtrace)
> +        remove_minimizer(newtrace, outpath)
> +        newtrace = list(filter(lambda s: s != "", newtrace))
> +
> +    assert(check_if_trace_crashes(newtrace, outpath))
>  
>  
>  if __name__ == '__main__':
> -- 
> 2.25.1
> 

