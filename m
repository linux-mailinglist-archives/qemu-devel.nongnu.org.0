Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C33E11B9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:58:32 +0200 (CEST)
Received: from localhost ([::1]:48320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBa91-0004Mt-Rn
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mBa83-0003gN-Ny; Thu, 05 Aug 2021 05:57:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17360
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1mBa80-0004US-6l; Thu, 05 Aug 2021 05:57:31 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1759XEHW143006; Thu, 5 Aug 2021 05:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=YhaAwRxenDUWdg0ea3TY+j/q2KRuPtTrxvdo0xhxgzk=;
 b=iYBdxt5uEen623TSr6mWxRl2PJi2ExEsgLsz+Ca3kKYEU2obosOIyqjJMk2ejUxgF2+F
 eqXJI5VWf76cpBuhc/7f7pg7IWIIEtlB9b9bOr5YxaoJoDWz2NDiFpetkkfX6y8c6ZI8
 Y+em/+l0cHL1YrD8WDvUEUC8e02h7NrUxpHaMgTMWz4TDkauvRL6juo5nvuOR/A6GJSC
 l1WyiYO56AVZK6391MINedSBVI/rsfFnxRH4qhbsVE9ezWqVUpDYp4S2mE0LMRA7S5PX
 j5OzbkvlTh1t4WL9ZrRZvz8wKdSo3bPhBcFLwWfof5lsRljofOmcgc162SBoC10kHM1w zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88b9rb57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:57:26 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1759pBSB010510;
 Thu, 5 Aug 2021 05:57:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a88b9rb4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:57:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1759rbQr025983;
 Thu, 5 Aug 2021 09:57:24 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x593040-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:57:24 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1759vJ1b29688286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 09:57:19 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5530042072;
 Thu,  5 Aug 2021 09:57:19 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7DA842067;
 Thu,  5 Aug 2021 09:57:18 +0000 (GMT)
Received: from sig-9-145-77-113.uk.ibm.com (unknown [9.145.77.113])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 09:57:18 +0000 (GMT)
Message-ID: <aae5893cb5d8e73c9d981a90609a9bc9bb4c9c25.camel@linux.ibm.com>
Subject: Re: [PATCH v8] tests/tcg/s390x: Test SIGILL and SIGSEGV handling
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Date: Thu, 05 Aug 2021 11:57:18 +0200
In-Reply-To: <44c8dc22-c243-6260-c6af-62fd209f21e9@redhat.com>
References: <20210804225146.154513-1-iii@linux.ibm.com>
 <44c8dc22-c243-6260-c6af-62fd209f21e9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FQpFL5GDYP-6x2iXkGSobZJuVXzWvLxo
X-Proofpoint-GUID: 3RJqMpha6PYUiFWhRQV3k_-wL3lY0QJ0
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "jonathan . albrecht" <jonathan.albrecht@linux.vnet.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-08-05 at 11:37 +0200, David Hildenbrand wrote:
> On 05.08.21 00:51, Ilya Leoshkevich wrote:
> > Verify that s390x-specific uc_mcontext.psw.addr is reported
> > correctly
> > and that signal handling interacts properly with debugging.
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> > 
> > v7: 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-08/msg00463.html
> > v7 -> v8: Another rebase needed due to the conflict with Jonathan's
> >            50e36dd61652.
> > 
> >   tests/tcg/s390x/Makefile.target               |  17 +-
> >   tests/tcg/s390x/gdbstub/test-signals-s390x.py |  76 ++++++++
> >   tests/tcg/s390x/signals-s390x.c               | 165
> > ++++++++++++++++++
> >   3 files changed, 257 insertions(+), 1 deletion(-)
> >   create mode 100644 tests/tcg/s390x/gdbstub/test-signals-s390x.py
> >   create mode 100644 tests/tcg/s390x/signals-s390x.c
> > 
> > diff --git a/tests/tcg/s390x/Makefile.target
> > b/tests/tcg/s390x/Makefile.target
> > index bd084c7840..cc64dd32d2 100644
> > --- a/tests/tcg/s390x/Makefile.target
> > +++ b/tests/tcg/s390x/Makefile.target
> > @@ -1,4 +1,5 @@
> > -VPATH+=$(SRC_PATH)/tests/tcg/s390x
> > +S390X_SRC=$(SRC_PATH)/tests/tcg/s390x
> > +VPATH+=$(S390X_SRC)
> >   CFLAGS+=-march=zEC12 -m64
> >   TESTS+=hello-s390x
> >   TESTS+=csst
> > @@ -9,3 +10,17 @@ TESTS+=pack
> >   TESTS+=mvo
> >   TESTS+=mvc
> >   TESTS+=trap
> > +TESTS+=signals-s390x
> > +
> > +ifneq ($(HAVE_GDB_BIN),)
> > +GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> > +
> > +run-gdbstub-signals-s390x: signals-s390x
> > +       $(call run-test, $@, $(GDB_SCRIPT) \
> > +               --gdb $(HAVE_GDB_BIN) \
> > +               --qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
> > +               --bin $< --test $(S390X_SRC)/gdbstub/test-signals-
> > s390x.py, \
> > +       "mixing signals and debugging on s390x")
> > +
> > +EXTRA_RUNS += run-gdbstub-signals-s390x
> > +endif
> > diff --git a/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> > b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> > new file mode 100644
> > index 0000000000..80a284b475
> > --- /dev/null
> > +++ b/tests/tcg/s390x/gdbstub/test-signals-s390x.py
> > @@ -0,0 +1,76 @@
> > +from __future__ import print_function
> > +
> > +#
> > +# Test that signals and debugging mix well together on s390x.
> > +#
> > +# This is launched via tests/guest-debug/run-test.py
> > +#
> > +
> > +import gdb
> > +import sys
> > +
> > +failcount = 0
> > +
> > +
> > +def report(cond, msg):
> > +    """Report success/fail of test"""
> > +    if cond:
> > +        print("PASS: %s" % (msg))
> > +    else:
> > +        print("FAIL: %s" % (msg))
> > +        global failcount
> > +        failcount += 1
> > +
> > +
> > +def run_test():
> > +    """Run through the tests one by one"""
> > +    illegal_op = gdb.Breakpoint("illegal_op")
> > +    stg = gdb.Breakpoint("stg")
> > +    mvc_8 = gdb.Breakpoint("mvc_8")
> > +
> > +    # Expect the following events:
> > +    # 1x illegal_op breakpoint
> > +    # 2x stg breakpoint, segv, breakpoint
> > +    # 2x mvc_8 breakpoint, segv, breakpoint
> > +    for _ in range(14):
> 
> How do we come up with the value 14?

1 (initial) + 1 (illegal op) + 2 * 3 (stg) + 2 * 3 (mvc_8).

> 
> > +        gdb.execute("c")
> > +    report(illegal_op.hit_count == 1, "illegal_op.hit_count == 1")
> > +    report(stg.hit_count == 4, "stg.hit_count == 4")
> 
> The doc above says we should see this twice, why do we see it 4
> times?

With "2x stg breakpoint, segv, breakpoint" I meant: stg break, stg
segv, stg break, stg break, stg segv, stg break.

> > +    report(mvc_8.hit_count == 4, "mvc_8.hit_count == 4")
> > +
> 
> Dito
> 
> [...]
> 
> > diff --git a/tests/tcg/s390x/signals-s390x.c
> > b/tests/tcg/s390x/signals-s390x.c
> > new file mode 100644
> > index 0000000000..dc2f8ee59a
> > --- /dev/null
> > +++ b/tests/tcg/s390x/signals-s390x.c
> > @@ -0,0 +1,165 @@
> > +#include <assert.h>
> > +#include <signal.h>
> > +#include <string.h>
> > +#include <sys/mman.h>
> > +#include <ucontext.h>
> > +#include <unistd.h>
> > +
> > +/*
> > + * Various instructions that generate SIGILL and SIGSEGV. They
> > could have been
> > + * defined in a separate .s file, but this would complicate the
> > build, so the
> > + * inline asm is used instead.
> > + */
> > +
> > +void illegal_op(void);
> > +void after_illegal_op(void);
> > +asm(".globl\tillegal_op\n"
> > +    "illegal_op:\t.byte\t0x00,0x00\n"
> > +    "\t.globl\tafter_illegal_op\n"
> > +    "after_illegal_op:\tbr\t%r14");
> > +
> > +void stg(void *dst, unsigned long src);
> > +asm(".globl\tstg\n"
> > +    "stg:\tstg\t%r3,0(%r2)\n"
> > +    "\tbr\t%r14");
> > +
> > +void mvc_8(void *dst, void *src);
> > +asm(".globl\tmvc_8\n"
> > +    "mvc_8:\tmvc\t0(8,%r2),0(%r3)\n"
> > +    "\tbr\t%r14");
> 
> I was wondering if there would be any nicer way to write this,
> like (very prototype and wrong)
> 
> 
> static void stg(void *dst, unsigned long src)
> {
>      asm volatile("stg %r3,0(%r2)\n");
> }
> 
> static void mvc_8(void *dst, void *src)
> {
>      asm volatile("mvc 0(8,%r2),0(%r3)\n");
> }

The prologue would get in the way, and I don't think gcc has
__attribute__((naked)) for s390.

> Please ignore if that just doesn't make any sense.
> 
> Nothing else jumped at me :)


