Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA4519F15
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:15:38 +0200 (CEST)
Received: from localhost ([::1]:48942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDur-0003BH-AO
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:15:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmD7O-0007jp-Lj; Wed, 04 May 2022 07:24:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35172
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nmD7M-0000QS-CM; Wed, 04 May 2022 07:24:30 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244B2329019882;
 Wed, 4 May 2022 11:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=5YMFqeM3if8Dzg7K+DU8BcoV9Iw5pd1CH9ISvAlFBz8=;
 b=Rma0pRRFh4P2PkFn2OjooSNG6zXeoqjCO/auZ6wIHppL2cGo1SKOGc6DqBYm+iiuu7Rl
 Z9JzMzQ7Ep/CKNouUk1KP/9XV3ey8NOpeaHNkmNUiDbd5znbPgEGwLeBP6vcdNblMBrC
 CbDhW+bfaMQyu65cOcZTouM5CM8jO3qKl7P4hHIQQEyE5vcTy4en+KPYTDR+bgzepMtl
 yRrBQ+041ge/t636ru4n/DUXen6/9jKXG7JOZrGVAVReZRRXXzmw78heaNvdVHK9QYWi
 cn6P6NgqTUKulM3/X4G9LfYODMa8UMBJQOLPyMNDrv0HS5DdCp3uqv3znPRygyEL+nze ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fur8t0ds8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:24:26 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 244BLelQ012000;
 Wed, 4 May 2022 11:24:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fur8t0drn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:24:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 244B84FL007015;
 Wed, 4 May 2022 11:24:24 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3fttcj1px0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 11:24:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 244BOLL544106002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 4 May 2022 11:24:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9061F4203F;
 Wed,  4 May 2022 11:24:21 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35C1E42042;
 Wed,  4 May 2022 11:24:21 +0000 (GMT)
Received: from [9.171.50.79] (unknown [9.171.50.79])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  4 May 2022 11:24:21 +0000 (GMT)
Message-ID: <36a11be6e5f8c4f29e7defa24bb0aced1dacf0d1.camel@linux.ibm.com>
Subject: Re: branch-relative-long fails on s390x host (was: [PATCH]
 tests/tcg/s390x: Use a different PCRel32 notation in branch-relative-long.c)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Richard Henderson
 <richard.henderson@linaro.org>
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>
Date: Wed, 04 May 2022 13:24:20 +0200
In-Reply-To: <705bd03d34216c796fc0a73cd468a93ecc88aaf9.camel@linux.ibm.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
 <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
 <e71d638b-3c62-31db-1abd-02ba40042eab@redhat.com>
 <8543dc2de432c787770f9f01c448434ab1e30c63.camel@linux.ibm.com>
 <f7a77dcc-590c-96f5-8e92-5806f51ac0d4@redhat.com>
 <1c4e55e45a92250f93d7671b4f658e616fc1edce.camel@linux.ibm.com>
 <dc9b9d50-aa32-9483-551a-2054e31b36a4@redhat.com>
 <ceb3c159c495b79d313016bcd0e3f36f217dbd38.camel@linux.ibm.com>
 <dfddafae-3d7d-c865-2255-72e469fda5bb@redhat.com>
 <705bd03d34216c796fc0a73cd468a93ecc88aaf9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pPbtAvRoH-Ql0m6mk9cb-YTQ_5o2JNoP
X-Proofpoint-GUID: 8eI5OWMFGpeB4QAAlvSJI2uDCKkG9gby
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_03,2022-05-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205040073
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-05-04 at 12:51 +0200, Ilya Leoshkevich wrote:
> On Wed, 2022-05-04 at 12:46 +0200, Thomas Huth wrote:
> > On 04/05/2022 11.37, Ilya Leoshkevich wrote:
> > > On Wed, 2022-05-04 at 11:14 +0200, Thomas Huth wrote:
> > > > On 04/05/2022 11.07, Ilya Leoshkevich wrote:
> > > > > On Wed, 2022-05-04 at 09:01 +0200, Thomas Huth wrote:
> > > > > > On 04/05/2022 00.46, Ilya Leoshkevich wrote:
> > > > > > > On Tue, 2022-05-03 at 21:26 +0200, Thomas Huth wrote:
> > > > > > > > On 03/05/2022 11.02, Thomas Huth wrote:
> > > > > > > > > On 02/05/2022 18.48, Ilya Leoshkevich wrote:
> > > > > > > > > > Binutils >=2.37 and Clang do not accept (. -
> > > > > > > > > > 0x100000000)
> > > > > > > > > > PCRel32
> > > > > > > > > > constants. While this looks like a bug that needs
> > > > > > > > > > fixing,
> > > > > > > > > > use
> > > > > > > > > > a
> > > > > > > > > > different notation (-0x100000000) as a workaround.
> > > > > > > > > > 
> > > > > > > > > > Reported-by: Thomas Huth <thuth@redhat.com>
> > > > > > > > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > > > > > > > ---
> > > > > > > > > >      tests/tcg/s390x/branch-relative-long.c | 4 ++-
> > > > > > > > > > -
> > > > > > > > > >      1 file changed, 2 insertions(+), 2 deletions(-
> > > > > > > > > > )
> > > > > > > > > > 
> > > > > > > > > > diff --git a/tests/tcg/s390x/branch-relative-long.c
> > > > > > > > > > b/tests/tcg/s390x/branch-relative-long.c
> > > > > > > > > > index 94219afcad..8ce9f1c2e5 100644
> > > > > > > > > > --- a/tests/tcg/s390x/branch-relative-long.c
> > > > > > > > > > +++ b/tests/tcg/s390x/branch-relative-long.c
> > > > > > > > > > @@ -13,8 +13,8 @@
> > > > > > > > > >              #_name "_end:\n");
> > > > > > > > > >      DEFINE_ASM(br_r14, "br %r14");
> > > > > > > > > > -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> > > > > > > > > > -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
> > > > > > > > > > +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
> > > > > > > > > > +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
> > > > > > > > > 
> > > > > > > > > Works for me, thanks!
> > > > > > > > 
> > > > > > > > Sorry, I spoke too soon - it compiles fine, and also
> > > > > > > > runs
> > > > > > > > fine
> > > > > > > > when I
> > > > > > > > run it
> > > > > > > > natively, but when I run it through "qemu-s390x", it
> > > > > > > > crashes...
> > > > > > > > does
> > > > > > > > that
> > > > > > > > work for you?
> > > > > > > 
> > > > > > > Hi, yes, I just double-checked - it works fine for me.
> > > > > > > Could you please share the resulting test binary?
> > > > > > 
> > > > > > 
> > > > > > Sure, here it is:
> > > > > > 
> > > > > > https://people.redhat.com/~thuth/data/branch-relative-long
> > > > > > 
> > > > > >     Thomas
> > > > > 
> > > > > Your binary worked fine for me.
> > > > > 
> > > > > QEMU commit 2e3408b3cc7de4e87a9adafc8c19bfce3abec947,
> > > > > x86_64 host,
> > > > 
> > > > Oh, well, now that you've mentioned it: I was running "make
> > > > check-
> > > > tcg" on a
> > > > s390x host. It works fine on a x86, indeed. So the new problem
> > > > is
> > > > likely in
> > > > the s390x TCG host backend... Richard, could you maybe have a
> > > > look?
> > > > 
> > > >    Thomas
> > > 
> > > It worked fine on a s390x host for me as well.
> > 
> > Weird ... Did you compile qemu-s390x itself with Clang or with GCC?
> > I
> > just 
> > discovered that the crash also only happens if I compile qemu-s390x
> > with 
> > Clang - there is no crash when I compile it with GCC.
> > 
> > > Can this be related to the large mmap() that the test performs?
> > 
> > It works when I compile the test with GCC instead of Clang - so I
> > assume 
> > that the problem is somewhere else...
> > 
> >   Thomas
> > 
> 
> I see, I just used your test with the gcc-built QEMU.
> With clang-built QEMU it hangs for me on the s390x host.

Actually I've been somewhat impatient, it's not a hang, but rather
quite a long wait followed by a SEGV. So I debugged this a bit, and
apparently what happens is:

- The test zeroes out a code page with exrl+xc.

- do_helper_xc() is called. Clang generates exrl+xc combination there
  as well.

- Since there already exists a TB for the code in question, its page is
  read-only. SIGSEGV happens.

- host_signal_handler() calls host_signal_write() and it doesn't
  recognize exrl as a write. Therefore page_unprotect() is not called
  and the signal is forwarded to the test.

The following does indeed help:

--- a/linux-user/include/host/s390/host-signal.h
+++ b/linux-user/include/host/s390/host-signal.h
@@ -61,6 +61,12 @@ static inline bool host_signal_write(siginfo_t
*info, host_sigcontext *uc)
             return true;
         }
         break;
+    case 0xc6: /* RIL-b format insns */
+        switch (pinsn[0] & 0xf) {
+        case 0x0: /* EXRL */
+            return true;
+        }
+        break;
     case 0xc8: /* SSF format insns */
         switch (pinsn[0] & 0xf) {
         case 0x2: /* CSST */

While there can be false positives here, it shouldn't hurt:
for those, page_unprotect() will recognize that the page in question
does not have a corresponding TB and nothing will happen.

