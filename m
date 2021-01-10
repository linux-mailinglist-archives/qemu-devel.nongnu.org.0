Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06C2F083C
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 17:03:01 +0100 (CET)
Received: from localhost ([::1]:36056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kydBD-000549-T5
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 11:02:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kyd9x-0004Xo-76
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:01:42 -0500
Received: from relay64.bu.edu ([128.197.228.104]:57478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kyd9u-0008CZ-RF
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 11:01:40 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10AG0eNM030223
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 10 Jan 2021 11:00:43 -0500
Date: Sun, 10 Jan 2021 11:00:40 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v4 1/7] fuzz: accelerate non-crash detection
Message-ID: <20210110160040.uqlohbzr3viqhyxy@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174544643E941EFC9EAA2287FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
 <SYCPR01MB35026BAE41BDF24E076ABBF1FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SYCPR01MB35026BAE41BDF24E076ABBF1FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
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

On 210110 2110, Qiuhao Li wrote:
> On Wed, 2021-01-06 at 23:18 -0500, Alexander Bulekov wrote:
> > On 201229 1240, Qiuhao Li wrote:
> > > We spend much time waiting for the timeout program during the
> > > minimization
> > > process until it passes a time limit. This patch hacks the CLOSED
> > > (indicates
> > > the redirection file closed) notification in QTest's output if it
> > > doesn't
> > > crash.
> > > 
> > > Test with quadrupled trace input at:
> > >   https://bugs.launchpad.net/qemu/+bug/1890333/comments/1
> > > 
> > > Original version:
> > >   real	1m37.246s
> > >   user	0m13.069s
> > >   sys	0m8.399s
> > > 
> > > Refined version:
> > >   real	0m45.904s
> > >   user	0m16.874s
> > >   sys	0m10.042s
> > > 
> > > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > > ---
> > >  scripts/oss-fuzz/minimize_qtest_trace.py | 41 ++++++++++++++++--
> > > ------
> > >  1 file changed, 28 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > index 5e405a0d5f..aa69c7963e 100755
> > > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > @@ -29,30 +29,46 @@ whether the crash occred. Optionally, manually
> > > set a string that idenitifes the
> > >  crash by setting CRASH_TOKEN=
> > >  """.format((sys.argv[0])))
> > >  
> > > +deduplication_note = """\n\
> > > +Note: While trimming the input, sometimes the mutated trace
> > > triggers a different
> > > +crash output but indicates the same bug. Under this situation, our
> > > minimizer is
> > > +incapable of recognizing and stopped from removing it. In the
> > > future, we may
> > > +use a more sophisticated crash case deduplication method.
> > > +\n"""
> > > +
> > >  def check_if_trace_crashes(trace, path):
> > > -    global CRASH_TOKEN
> > >      with open(path, "w") as tracefile:
> > >          tracefile.write("".join(trace))
> > >  
> > > -    rc = subprocess.Popen("timeout -s 9 {timeout}s {qemu_path}
> > > {qemu_args} 2>&1\
> > > +    proc = subprocess.Popen("timeout {timeout}s {qemu_path}
> > > {qemu_args} 2>&1\
> > 
> > Why remove the -s 9 here? I ran into a case where the minimizer got
> > stuck on one iteration. Adding back "sigkill" to the timeout can be a
> > safety net to catch those bad cases.
> > -Alex
> 
> Hi Alex,
> 
> After reviewed this patch again, I think this get-stuck bug may be
> caused by code:
> 
> -    return CRASH_TOKEN in output

Hi,
Thanks for fixing this. Strangely, I was able to fix it by swapping
the b'' for a ' ' when I was stuck on a testcase a few days ago.
                                            vvv 
> +    for line in iter(rc.stdout.readline, b''):
> +        if "CLOSED" in line:
> +            return False
> +        if CRASH_TOKEN in line:
> +            return True
> 

I think your proposed change essentially does the same?
-Alex

> I assumed there are only two end cases in lines of stdout, but while we
> are trimming the trace input, the crash output (second-to-last line)
> may changes, in which case we will go through the output and fail to
> find "CLOSED" and CRASH_TOKEN, thus get stuck in the loop above.
> 
> To fix this bug and get a more trimmed input trace, we can:
> 
> Use the first three words of the second-to-last line instead of the
> whole string, which indicate the type of crash as the token.
> 
> -        CRASH_TOKEN = output.splitlines()[-2]
> +        CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])
> 
> If we reach the end of a subprocess' output, return False.
> 
> +        if line == "":
> +            return False
> 
> I fix it in [PATCH v7 1/7] and give an example. Could you review again?
> Thanks :-)
> 
> FYI, I mentioned this situation firstly in [PATCH 1/4], where I gave a
> more detailed example:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05888.html
> 
> > 
> > >      < {trace_path}".format(timeout=TIMEOUT,
> > >                             qemu_path=QEMU_PATH,
> > >                             qemu_args=QEMU_ARGS,
> > >                             trace_path=path),
> > >                            shell=True,
> > >                            stdin=subprocess.PIPE,
> > > -                          stdout=subprocess.PIPE)
> > > -    stdo = rc.communicate()[0]
> > > -    output = stdo.decode('unicode_escape')
> > > -    if rc.returncode == 137:    # Timed Out
> > > -        return False
> > > -    if len(output.splitlines()) < 2:
> > > -        return False
> > > -
> > > +                          stdout=subprocess.PIPE,
> > > +                          encoding="utf-8")
> > > +    global CRASH_TOKEN
> > >      if CRASH_TOKEN is None:
> > > -        CRASH_TOKEN = output.splitlines()[-2]
> > > +        try:
> > > +            outs, _ = proc.communicate(timeout=5)
> > > +            CRASH_TOKEN = outs.splitlines()[-2]
> > > +        except subprocess.TimeoutExpired:
> > > +            print("subprocess.TimeoutExpired")
> > > +            return False
> > > +        print("Identifying Crashes by this string:
> > > {}".format(CRASH_TOKEN))
> > > +        global deduplication_note
> > > +        print(deduplication_note)
> > > +        return True
> > >  
> > > -    return CRASH_TOKEN in output
> > > +    for line in iter(proc.stdout.readline, b''):
> > > +        if "CLOSED" in line:
> > > +            return False
> > > +        if CRASH_TOKEN in line:
> > > +            return True
> > > +
> > > +    return False
> > >  
> > >  
> > >  def minimize_trace(inpath, outpath):
> > > @@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
> > >      print("Crashed in {} seconds".format(end-start))
> > >      TIMEOUT = (end-start)*5
> > >      print("Setting the timeout for {} seconds".format(TIMEOUT))
> > > -    print("Identifying Crashes by this string:
> > > {}".format(CRASH_TOKEN))
> > >  
> > >      i = 0
> > >      newtrace = trace[:]
> > > -- 
> > > 2.25.1
> > > 
> 

