Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB712E0D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 17:50:08 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krkrP-0005QZ-6B
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 11:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krkpp-0004uS-N0
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:48:29 -0500
Received: from relay64.bu.edu ([128.197.228.104]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1krkpn-0006b3-Ee
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 11:48:29 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: pool-72-93-72-163.bstnma.fios.verizon.net [72.93.72.163]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0BMGlxDB029423
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 22 Dec 2020 11:48:05 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] fuzz: refine crash detection mechanism
In-Reply-To: <ME3P282MB14924A6558A105B7FBFA579DFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14924A6558A105B7FBFA579DFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
Date: Tue, 22 Dec 2020 11:47:59 -0500
Message-ID: <87a6u5kcsg.fsf@stormtrooper.vrmnet>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Oops let me try to resend this..

Qiuhao Li <Qiuhao.Li@outlook.com> writes:

> The original crash detection method is to fork a process to test our new
> trace input. If the child process exits in time and the second-to-last line
> is the same as the first crash, we think it is a crash triggered by the same
> bug. However, in some situations, it doesn't work since it is a
> hardcoded-offset string comparison.
>
> For example, suppose an assertion failure makes the crash. In that case, the
> second-to-last line will be 'timeout: the monitored command dumped core',
>

Ah - I have not encountered this message. Are you running an
--enable-sanitizers build? I believe ASAN disables coredumps, by
default. I have to turn them on with:
ASAN_OPTIONS=abort_on_error=1:disable_coredump=0:unmap_shadow_on_exit=1

Maybe this is a matter of setting the correct env variables/disabling
coredumps?

I like the idea of switching out CRASH_TOKEN for a regex, however I am
not sure about using the hardcoded crash_patterns to perform matching:

1.) You risk missing some crash pattern. E.g. I don't think
abort()/hw_error() are covered right now.
2.) At some point ASAN/compiler-rt might change the way it outputs
crashes.

I think the current lines[-2] approach is ugly, but it is small, works
in most cases (when coredumps are disabled), and has a simple
CRASH_TOKEN fallback mechanism. We should fix the coredump problem.

Is there any way to do this without hardcoding patterns (or at least
fall-back to something if you don't find a pattern)?

-Alex

> which doesn't contain any information about the assertion failure like where
> it happened or the assertion statement. This may lead to a minimized input
> triggers assertion failure but may indicate another bug. As for some
> sanitizers' crashes, the direct string comparison may stop us from getting a
> smaller input, since they may have a different leaf stack frame.
>
> Perhaps we can detect crashes using both precise output string comparison
> and rough pattern string match and info the user when the trace input
> triggers different but a seminar output.
>
> Tested:
> Assertion failure, https://bugs.launchpad.net/qemu/+bug/1908062
> AddressSanitizer, https://bugs.launchpad.net/qemu/+bug/1907497
> Trace input that doesn't crash
> Trace input that crashes Qtest
>
> Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> ---
>  scripts/oss-fuzz/minimize_qtest_trace.py | 59 ++++++++++++++++++------
>  1 file changed, 46 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py b/scripts/oss-fuzz/minimize_qtest_trace.py
> index 5e405a0d5f..d3b09e6567 100755
> --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> @@ -10,11 +10,16 @@ import os
>  import subprocess
>  import time
>  import struct
> +import re
>
>  QEMU_ARGS = None
>  QEMU_PATH = None
>  TIMEOUT = 5
> -CRASH_TOKEN = None
> +
> +crash_patterns = ("Assertion.+failed",
> +                  "SUMMARY.+Sanitizer")
> +crash_pattern = None
> +crash_string = None
>
>  write_suffix_lookup = {"b": (1, "B"),
>                         "w": (2, "H"),
> @@ -24,13 +29,12 @@ write_suffix_lookup = {"b": (1, "B"),
>  def usage():
>      sys.exit("""\
>  Usage: QEMU_PATH="/path/to/qemu" QEMU_ARGS="args" {} input_trace output_trace
> -By default, will try to use the second-to-last line in the output to identify
> -whether the crash occred. Optionally, manually set a string that idenitifes the
> -crash by setting CRASH_TOKEN=
> +By default, we will try to search predefined crash patterns through the
> +tracing output to see whether the crash occred. Optionally, manually set a
> +string that idenitifes the crash by setting CRASH_PATTERN=
>  """.format((sys.argv[0])))
>
>  def check_if_trace_crashes(trace, path):
> -    global CRASH_TOKEN
>      with open(path, "w") as tracefile:
>          tracefile.write("".join(trace))
>
> @@ -42,17 +46,47 @@ def check_if_trace_crashes(trace, path):
>                            shell=True,
>                            stdin=subprocess.PIPE,
>                            stdout=subprocess.PIPE)
> +    if rc.returncode == 137:    # Timed Out
> +        return False
> +
>      stdo = rc.communicate()[0]
>      output = stdo.decode('unicode_escape')
>      > -    if rc.returncode == 137:    # Timed Out
> -        return False
> -    if len(output.splitlines()) < 2:
> +    output_lines = output.splitlines()
> +    # Usually we care about the summary info in the last few lines, reverse.
> +    output_lines.reverse()
> +
> +    global crash_pattern, crash_patterns, crash_string
> +    if crash_pattern is None: # Initialization
> +        for line in output_lines:
> +            for c in crash_patterns:
> +                if re.search(c, line) is not None:
> +                    crash_pattern = c
> +                    crash_string = line
> +                    print("Identifying crash pattern by this string: ",\
> +                          crash_string)
> +                    print("Using regex pattern: ", crash_pattern)
> +                    return True
> +        print("Failed to initialize crash pattern: no match.")
>          return False
>
> -    if CRASH_TOKEN is None:
> -        CRASH_TOKEN = output.splitlines()[-2]
> +    # First, we search exactly the previous crash string.
> +    for line in output_lines:
> +        if crash_string == line:
> +            return True
> +
> +    # Then we decide whether a similar (same pattern) crash happened.
> +    # Slower now :(
> +    for line in output_lines:
> +        if re.search(crash_pattern, line) is not None:
> +            print("\nINFO: The crash string changed during our minimization process.")
> +            print("Before: ", crash_string)
> +            print("After: ", line)
> +            print("The original regex pattern can still match, updated the crash string.")
> +            crash_string = line
> +            return True
>
> -    return CRASH_TOKEN in output
> +    # The input did not trigger (the same type) bug.
> +    return False
>
>
>  def minimize_trace(inpath, outpath):
> @@ -66,7 +100,6 @@ def minimize_trace(inpath, outpath):
>      print("Crashed in {} seconds".format(end-start))
>      TIMEOUT = (end-start)*5
>      print("Setting the timeout for {} seconds".format(TIMEOUT))
> -    print("Identifying Crashes by this string: {}".format(CRASH_TOKEN))
>
>      i = 0
>      newtrace = trace[:]
> @@ -152,6 +185,6 @@ if __name__ == '__main__':
>          usage()
>      # if "accel" not in QEMU_ARGS:
>      #     QEMU_ARGS += " -accel qtest"
> -    CRASH_TOKEN = os.getenv("CRASH_TOKEN")
> +    crash_pattern = os.getenv("CRASH_PATTERN")
>      QEMU_ARGS += " -qtest stdio -monitor none -serial none "
>      minimize_trace(sys.argv[1], sys.argv[2])
> --
> 2.25.1

