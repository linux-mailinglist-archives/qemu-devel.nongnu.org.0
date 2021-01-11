Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940D2F0B03
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 03:21:25 +0100 (CET)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kympf-0005Sc-Sh
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 21:21:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kymoo-0004gN-IC
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 21:20:30 -0500
Received: from mail-oln040092255081.outbound.protection.outlook.com
 ([40.92.255.81]:6056 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kymok-0004n0-8z
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 21:20:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfgZcD7fUCCvodQ3/+bNJUpcvYN2ldS8+HT+KtDFH/Xnc7AmY11cCW2friuKjAx0arliyZaHYfCDtqXOO33P2AgB9bb+yQbAxcrD60NKNI6ocfSFEecQ56HyX3/WzJaTYEcrKI9F1+Kz7HeVQoyl4JBsTeOhndkxzx0EJPQUYn3v/23YZwHEB8Gged8GDRvn/DWpRvNM17thj/njRZTyR7lk4izxtZ05/XreqpNBpU1tjQf/Q9qcLwDUaxR+b4HntTCX/h9flbHVFabG4IOAJZRS5L6oeGHGV99IX1KU8hpC0fKLmCw5UUm3elGoXbegG1L2x7zwEQwQQ9xj97jodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+5n9+tcmxAkEcNkWV/L0Qdc2hRxbCnyCeTNZHqBiMM=;
 b=aknYitwAoCSizjdzjxrRSdApTxX1LLHTyh+8/V9eQ7stM7VYGVPE0ceyQroBIKvGuASEx/2CLegwwFlxkqg5ob2LJxlMIXG+zAUOPjyT9nig7EOsbmqoJOA29bDStY7dQQ/crSyGZusccphtdd397kiVepWsIzOrcVRlAu90j3s5IfA9irVINWCiK4sRi+ephgMmM2EOARBtpISKDN1IMTC24DByBrSh36vLALzcYZ6n9SsNaFGE7KkZgW24HlByYcxLutee63XwqqH+SExzeMLuGd1TKKUmw/+IESRTs4hKjMb5tecnBguh82qwZxEYtfWKD46fKjyYXlueW1pnLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+5n9+tcmxAkEcNkWV/L0Qdc2hRxbCnyCeTNZHqBiMM=;
 b=YVnJ5GjfmEFi648OZOMWNBuXw5Su90xoCkHuBv7FRHlm+/bDw200w8RMcoMnYMz7R9q3jCfEjKQ7N3xKyNXLosC2HKYIoup8RSXCGOGeVIeY+790QoUvEyC9dF48x4oaIOeAcd27GYeB3WAhTeXpNBRtMo8xth+yzEgh6MPza7mzIVY0duQGig+ggHUY1WtkU6wz7Bc794/32w5a+MVeat3188Suq37rVKt6iMaiIfbKSQJ7v8wYzwiUmOco+Ta2YFhX1s9+YikgZ6uTfACs6k0z4+N5JrpzaJnyVSsdaDHXwHPiEunBSp2mD1iRyqE/l0cA+hQPp3ppPtD4nRHwzw==
Received: from HK2APC01FT017.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::40) by
 HK2APC01HT145.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::314)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 02:20:10 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com (10.152.248.54) by
 HK2APC01FT017.mail.protection.outlook.com (10.152.248.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 02:20:10 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C9727927224C28FA719C3765427D4ED1E6969E85A9D4D67E312E38E75FA767C6;
 UpperCasedChecksum:4CF9120D2EE532488CDD05F23840A198376B235F00871CC7864724E49F3E2A4D;
 SizeAsReceived:8956; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 02:20:09 +0000
Message-ID: <SYCPR01MB350211FA9AE49341ACA7135AFCAB0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v4 1/7] fuzz: accelerate non-crash detection
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Mon, 11 Jan 2021 10:19:57 +0800
In-Reply-To: <20210110160040.uqlohbzr3viqhyxy@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174544643E941EFC9EAA2287FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
 <SYCPR01MB35026BAE41BDF24E076ABBF1FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
 <20210110160040.uqlohbzr3viqhyxy@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [//PfCff5mSh/AuO73JTt40W979lsBeKy]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <e89dff6df42df542007e697dd3e3a5e8ff156521.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.19) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.2 via Frontend Transport; Mon, 11 Jan 2021 02:20:04 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: f1312ae7-efc5-47b4-901f-08d8b5d76b1d
X-MS-TrafficTypeDiagnostic: HK2APC01HT145:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6195
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vq8TnJXJ1WPXHfOwxzeqCjuWMXVDTWBLVxSqNzcG0jKrMNqWlKAUQGgENmVZ1vVcdcaeRvJVFmN4SCffohfxTk0ERCex6/JmxEiwNQgU1TdazlSewb8ql7+HvUmtGymzJ58E6DQB2Upn36MfpfW366Amk0xNwHaUV5UoZV6X4/HJ0Fsiz8Bpa4KH7F13AvhZ8VhzPRhx2fDFSfOnmXYlESk0p4nkSm9voVi/Tph6CaWraMObBtNjSkxzS9FG5w5y4AG7AGBrMgA3+sDR2SgxL989k8ROCjmk29SxgDXRkk4=
X-MS-Exchange-AntiSpam-MessageData: 7PN7pYM0YVP74xqh8z70KayXgtJwjyxikj74f8v+pVUsy9EcnNx71Ia5CMEeLXTc/Jis1Bg/jNaTFHyOU9eFdmsrUdqsrtV29CY9vwu7aC8baqYeB2ulaglCy7XXPcOxX9PlkUsc6um/9nlGnBonTQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 02:20:09.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: f1312ae7-efc5-47b4-901f-08d8b5d76b1d
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT017.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT145
Received-SPF: pass client-ip=40.92.255.81; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2021-01-10 at 11:00 -0500, Alexander Bulekov wrote:
> On 210110 2110, Qiuhao Li wrote:
> > On Wed, 2021-01-06 at 23:18 -0500, Alexander Bulekov wrote:
> > > On 201229 1240, Qiuhao Li wrote:
> > > > We spend much time waiting for the timeout program during the
> > > > minimization
> > > > process until it passes a time limit. This patch hacks the
> > > > CLOSED
> > > > (indicates
> > > > the redirection file closed) notification in QTest's output if
> > > > it
> > > > doesn't
> > > > crash.
> > > > 
> > > > Test with quadrupled trace input at:
> > > >   https://bugs.launchpad.net/qemu/+bug/1890333/comments/1
> > > > 
> > > > Original version:
> > > >   real	1m37.246s
> > > >   user	0m13.069s
> > > >   sys	0m8.399s
> > > > 
> > > > Refined version:
> > > >   real	0m45.904s
> > > >   user	0m16.874s
> > > >   sys	0m10.042s
> > > > 
> > > > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > > > ---
> > > >  scripts/oss-fuzz/minimize_qtest_trace.py | 41
> > > > ++++++++++++++++--
> > > > ------
> > > >  1 file changed, 28 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > index 5e405a0d5f..aa69c7963e 100755
> > > > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > > > @@ -29,30 +29,46 @@ whether the crash occred. Optionally,
> > > > manually
> > > > set a string that idenitifes the
> > > >  crash by setting CRASH_TOKEN=
> > > >  """.format((sys.argv[0])))
> > > >  
> > > > +deduplication_note = """\n\
> > > > +Note: While trimming the input, sometimes the mutated trace
> > > > triggers a different
> > > > +crash output but indicates the same bug. Under this situation,
> > > > our
> > > > minimizer is
> > > > +incapable of recognizing and stopped from removing it. In the
> > > > future, we may
> > > > +use a more sophisticated crash case deduplication method.
> > > > +\n"""
> > > > +
> > > >  def check_if_trace_crashes(trace, path):
> > > > -    global CRASH_TOKEN
> > > >      with open(path, "w") as tracefile:
> > > >          tracefile.write("".join(trace))
> > > >  
> > > > -    rc = subprocess.Popen("timeout -s 9 {timeout}s {qemu_path}
> > > > {qemu_args} 2>&1\
> > > > +    proc = subprocess.Popen("timeout {timeout}s {qemu_path}
> > > > {qemu_args} 2>&1\
> > > 
> > > Why remove the -s 9 here? I ran into a case where the minimizer
> > > got
> > > stuck on one iteration. Adding back "sigkill" to the timeout can
> > > be a
> > > safety net to catch those bad cases.
> > > -Alex
> > 
> > Hi Alex,
> > 
> > After reviewed this patch again, I think this get-stuck bug may be
> > caused by code:
> > 
> > -    return CRASH_TOKEN in output
> 
> Hi,
> Thanks for fixing this. Strangely, I was able to fix it by swapping
> the b'' for a ' ' when I was stuck on a testcase a few days ago.
>                                             vvv 
> > +    for line in iter(rc.stdout.readline, b''):
> > +        if "CLOSED" in line:
> > +            return False
> > +        if CRASH_TOKEN in line:
> > +            return True
> > 
> 
> I think your proposed change essentially does the same?
> -Alex

Hi Alex,

It looks like I misused the bytes type. Instead of b'', '' (the str
type) should be used here:

-    for line in iter(rc.stdout.readline, b''):
+    for line in iter(rc.stdout.readline, ''):
And you are right, if we use iter() with sentinel parameter '', it's
does the same as:

+        if line == "":
+            return False

But if we just fix the get-stuck bug here, we may fail
the assert(check_if_trace_crashes(newtrace, outpath)) check after
remove_lines() or clear_bits() since the same trace input may trigger a
different output between runs.

My solution is instead of using the whole second-to-last line as token,
we only use the the first three words which indicate the type of crash:

-        CRASH_TOKEN = output.splitlines()[-2]
+        CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])

Example: "SUMMARY: AddressSanitizer: stack-overflow"

And thus, we may a get a more trimmed input trace.

> 
> > I assumed there are only two end cases in lines of stdout, but
> > while we
> > are trimming the trace input, the crash output (second-to-last
> > line)
> > may changes, in which case we will go through the output and fail
> > to
> > find "CLOSED" and CRASH_TOKEN, thus get stuck in the loop above.
> > 
> > To fix this bug and get a more trimmed input trace, we can:
> > 
> > Use the first three words of the second-to-last line instead of the
> > whole string, which indicate the type of crash as the token.
> > 
> > -        CRASH_TOKEN = output.splitlines()[-2]
> > +        CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])
> > 
> > If we reach the end of a subprocess' output, return False.
> > 
> > +        if line == "":
> > +            return False
> > 
> > I fix it in [PATCH v7 1/7] and give an example. Could you review
> > again?
> > Thanks :-)
> > 
> > FYI, I mentioned this situation firstly in [PATCH 1/4], where I
> > gave a
> > more detailed example:
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05888.html
> > 
> > > >      < {trace_path}".format(timeout=TIMEOUT,
> > > >                             qemu_path=QEMU_PATH,
> > > >                             qemu_args=QEMU_ARGS,
> > > >                             trace_path=path),
> > > >                            shell=True,
> > > >                            stdin=subprocess.PIPE,
> > > > -                          stdout=subprocess.PIPE)
> > > > -    stdo = rc.communicate()[0]
> > > > -    output = stdo.decode('unicode_escape')
> > > > -    if rc.returncode == 137:    # Timed Out
> > > > -        return False
> > > > -    if len(output.splitlines()) < 2:
> > > > -        return False
> > > > -
> > > > +                          stdout=subprocess.PIPE,
> > > > +                          encoding="utf-8")
> > > > +    global CRASH_TOKEN
> > > >      if CRASH_TOKEN is None:
> > > > -        CRASH_TOKEN = output.splitlines()[-2]
> > > > +        try:
> > > > +            outs, _ = proc.communicate(timeout=5)
> > > > +            CRASH_TOKEN = outs.splitlines()[-2]
> > > > +        except subprocess.TimeoutExpired:
> > > > +            print("subprocess.TimeoutExpired")
> > > > +            return False
> > > > +        print("Identifying Crashes by this string:
> > > > {}".format(CRASH_TOKEN))
> > > > +        global deduplication_note
> > > > +        print(deduplication_note)
> > > > +        return True
> > > >  
> > > > -    return CRASH_TOKEN in output
> > > > +    for line in iter(proc.stdout.readline, b''):
> > > > +        if "CLOSED" in line:
> > > > +            return False
> > > > +        if CRASH_TOKEN in line:
> > > > +            return True
> > > > +
> > > > +    return False
> > > >  
> > > >  
> > > >  def minimize_trace(inpath, outpath):
> > > > @@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
> > > >      print("Crashed in {} seconds".format(end-start))
> > > >      TIMEOUT = (end-start)*5
> > > >      print("Setting the timeout for {}
> > > > seconds".format(TIMEOUT))
> > > > -    print("Identifying Crashes by this string:
> > > > {}".format(CRASH_TOKEN))
> > > >  
> > > >      i = 0
> > > >      newtrace = trace[:]
> > > > -- 
> > > > 2.25.1
> > > > 


