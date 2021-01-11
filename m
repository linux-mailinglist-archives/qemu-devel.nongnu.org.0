Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC792F0B57
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 04:02:35 +0100 (CET)
Received: from localhost ([::1]:57840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kynTW-00050P-B1
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 22:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kynR6-0004QX-18
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:00:04 -0500
Received: from relay68.bu.edu ([128.197.228.73]:52386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kynR3-0001FK-CM
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 22:00:03 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10B2xUbP011374
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 10 Jan 2021 21:59:33 -0500
Date: Sun, 10 Jan 2021 21:59:30 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v7 1/7] fuzz: accelerate non-crash detection
Message-ID: <20210111025930.zltuluspij5oh4yd@mozz.bu.edu>
References: <SYCPR01MB3502023A4AFC1E75DC3747ACFCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <SYCPR01MB350261980788DDAFE5F45E06FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYCPR01MB350261980788DDAFE5F45E06FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
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

On 210110 2119, Qiuhao Li wrote:
> We spend much time waiting for the timeout program during the minimization
> process until it passes a time limit. This patch hacks the CLOSED (indicates
> the redirection file closed) notification in QTest's output if it doesn't
> crash.
> 
> Test with quadrupled trace input at:
>   https://bugs.launchpad.net/qemu/+bug/1890333/comments/1
> 
> Original version:
>   real	1m37.246s
>   user	0m13.069s
>   sys	0m8.399s
> 
> Refined version:
>   real	0m45.904s
>   user	0m16.874s
>   sys	0m10.042s
> 
> Note:
> 
> Sometimes the mutated or the same trace may trigger a different crash
> summary (second-to-last line) but indicates the same bug. For example, Bug
> 1910826 [1], which will trigger a stack overflow, may output summaries
> like:
> 
> SUMMARY: AddressSanitizer: stack-overflow
> /home/qiuhao/hack/qemu/build/../softmmu/physmem.c:488 in
> flatview_do_translate
> 
> or
> 
> SUMMARY: AddressSanitizer: stack-overflow
> (/home/qiuhao/hack/qemu/build/qemu-system-i386+0x27ca049) in __asan_memcpy
> 
> Etc.
> 
> If we use the whole summary line as the token, we may be prevented from
> further minimization. So in this patch, we only use the first three words
> which indicate the type of crash:
> 
> SUMMARY: AddressSanitizer: stack-overflow
> 
> [1] https://bugs.launchpad.net/qemu/+bug/1910826
> 
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 43 +++++++++++++++++-------
>  1 file changed, 31 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 5e405a0d5f..97f1201747 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -29,8 +29,14 @@ whether the crash occred. Optionally, manually set a string that idenitifes the
>  crash by setting CRASH_TOKEN=
>  """.format((sys.argv[0])))
>  
> +deduplication_note = """\n\
> +Note: While trimming the input, sometimes the mutated trace triggers a different
> +type crash but indicates the same bug. Under this situation, our minimizer is
> +incapable of recognizing and stopped from removing it. In the future, we may
> +use a more sophisticated crash case deduplication method.
> +\n"""
> +
>  def check_if_trace_crashes(trace, path):
> -    global CRASH_TOKEN
>      with open(path, "w") as tracefile:
>          tracefile.write("".join(trace))
>  
> @@ -41,18 +47,32 @@ def check_if_trace_crashes(trace, path):
>                             trace_path=path),
>                            shell=True,
>                            stdin=subprocess.PIPE,
> -                          stdout=subprocess.PIPE)
> -    stdo = rc.communicate()[0]
> -    output = stdo.decode('unicode_escape')
> -    if rc.returncode == 137:    # Timed Out
> -        return False
> -    if len(output.splitlines()) < 2:
> -        return False
> -
> +                          stdout=subprocess.PIPE,
> +                          encoding="utf-8")
> +    global CRASH_TOKEN
>      if CRASH_TOKEN is None:
> -        CRASH_TOKEN = output.splitlines()[-2]
> +        try:
> +            outs, _ = rc.communicate(timeout=5)
> +            CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])
> +        except subprocess.TimeoutExpired:
> +            print("subprocess.TimeoutExpired")
> +            return False
> +        print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
> +        global deduplication_note
> +        print(deduplication_note)
> +        return True
>  
> -    return CRASH_TOKEN in output
> +    for line in iter(rc.stdout.readline, b''):
> +        if "CLOSED" in line:
> +            return False
> +        if CRASH_TOKEN in line:
> +            return True
> +        # We reach the end of stdout and there is no "CLOSED" or CRASH_TOKEN
> +        # Usually this is caused by a different type of crash
> +        if line == "":
> +            return False
> +
> +    return False
>  
>  
>  def minimize_trace(inpath, outpath):
> @@ -66,7 +86,6 @@ def minimize_trace(inpath, outpath):
>      print("Crashed in {} seconds".format(end-start))
>      TIMEOUT = (end-start)*5
>      print("Setting the timeout for {} seconds".format(TIMEOUT))
> -    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
>  
>      i = 0
>      newtrace = trace[:]
> -- 
> 2.25.1
> 

