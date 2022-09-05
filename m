Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2125AD6D4
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:48:46 +0200 (CEST)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVEL7-0006J7-GI
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVEH7-00037Z-Nd
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:44:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVEH5-0003CZ-RT
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:44:37 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285FXTBG024056;
 Mon, 5 Sep 2022 15:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kN/QZzytFH6OX8tbdAT1jGl0TpuoR6qgaTgPAY8zxx0=;
 b=rRoLzaowzPr2mmv3Dan66XxfJygvru5EoDcl8Kv6UcLo1JdHiRVy0XiAQGc2dy9GkmhJ
 UIU3NhpTk5FZYK1QALVii0TYKI9+vnuAKUBGGqa7mgr8OQrvaK6lNCEGspKmI429Gwan
 9SVhSGUHnmyEpi9pVjmQN9sgK7iN3M/cTBMQNTE1UFXKs7ePtX6TmNDqo7sbRxwN3Bot
 ULkrf0LeKM9Z1bpiwxECpB42OUQoXGLCwN6ck16OTnX8ZBwF5xFPFGmk5YvF8AkMf63j
 7eY3HIYwT6qV1O8ZR4KyFpOFU6KIWYDuYacKEWmegtaHVfOPtO0X3bJJUDifNT/WTMJF TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdkuu0d5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:44:32 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285Fb2Ld003576;
 Mon, 5 Sep 2022 15:44:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdkuu0d3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:44:31 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 285FcMeY012830;
 Mon, 5 Sep 2022 15:44:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8tn3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Sep 2022 15:44:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 285FipYm39780812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Sep 2022 15:44:51 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5F394C046;
 Mon,  5 Sep 2022 15:44:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A15C4C040;
 Mon,  5 Sep 2022 15:44:27 +0000 (GMT)
Received: from [9.171.53.58] (unknown [9.171.53.58])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Sep 2022 15:44:27 +0000 (GMT)
Message-ID: <555d2f1db45b25988f2daa2e0da5d7b0346eb2c2.camel@linux.ibm.com>
Subject: Re: [PATCH] tests/tcg/x86_64: add cross-modifying code test
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
Date: Mon, 05 Sep 2022 17:44:27 +0200
In-Reply-To: <87sfl8lt0e.fsf@linaro.org>
References: <20220902174637.1174258-1-iii@linux.ibm.com>
 <87sfl8lt0e.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ID4hMNdXfoxrIvZGJu5Kta8_rEx2mYOo
X-Proofpoint-ORIG-GUID: hAFpQqrYXA6_l1sQWyZCbH1C6Rm2zUa7
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_12,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1011 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Sat, 2022-09-03 at 10:13 +0100, Alex Bennée wrote:
> 
> Ilya Leoshkevich <iii@linux.ibm.com> writes:
> 
> > commit f025692c992c ("accel/tcg: Clear PAGE_WRITE before
> > translation")
> > fixed cross-modifying code handling, but did not add a test. The
> > changed code was further improved recently [1], and I was not sure
> > whether these modifications were safe (spoiler: they were fine).
> > 
> > Add a test to make sure there are no regressions.
> > 
> > [1]
> > https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00034.html
> > 
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > ---
> >  tests/tcg/x86_64/Makefile.target        |  6 +-
> >  tests/tcg/x86_64/cross-modifying-code.c | 80
> > +++++++++++++++++++++++++
> >  2 files changed, 85 insertions(+), 1 deletion(-)
> >  create mode 100644 tests/tcg/x86_64/cross-modifying-code.c
> > 
> > diff --git a/tests/tcg/x86_64/Makefile.target
> > b/tests/tcg/x86_64/Makefile.target
> > index b71a6bcd5e..58e7bfd681 100644
> > --- a/tests/tcg/x86_64/Makefile.target
> > +++ b/tests/tcg/x86_64/Makefile.target
> > @@ -10,6 +10,7 @@ include
> > $(SRC_PATH)/tests/tcg/i386/Makefile.target
> >  
> >  ifeq ($(filter %-linux-user, $(TARGET)),$(TARGET))
> >  X86_64_TESTS += vsyscall
> > +X86_64_TESTS += cross-modifying-code
> >  TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
> >  else
> >  TESTS=$(MULTIARCH_TESTS)
> > @@ -20,5 +21,8 @@ test-x86_64: LDFLAGS+=-lm -lc
> >  test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-
> > muldiv.h
> >         $(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> >  
> > -vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
> > +%: $(SRC_PATH)/tests/tcg/x86_64/%.c
> >         $(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
> 
> You shouldn't need to redefine the default rule when you can tweak
> the flags

Without this rule, I get:

make[1]: *** No rule to make target 'vsyscall', needed by 'all'.  Stop.

I think this is because the default rule has %.c as a dependency, and
we run from a different directory here.

> > +
> > +smc: CFLAGS+=-pthread
> > +smc: LDFLAGS+=-pthread
> 
> I think this must be from an old iteration because:
> 
> make[1]: Entering directory
> '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/x86_64-linux-user'
> cc -Wall -Werror -O0 -g -fno-strict-aliasing
> /home/alex/lsrc/qemu.git/tests/tcg/x86_64/cross-modifying-code.c -o
> cross-modifying-code -static
> /usr/bin/ld: /tmp/ccK05RAk.o: in function `main':
> /home/alex/lsrc/qemu.git/tests/tcg/x86_64/cross-modifying-code.c:64:
> undefined reference to `pthread_create'
> /usr/bin/ld: /home/alex/lsrc/qemu.git/tests/tcg/x86_64/cross-
> modifying-code.c:73: undefined reference to `pthread_join'
> collect2: error: ld returned 1 exit status
> make[1]: ***
> [/home/alex/lsrc/qemu.git/tests/tcg/x86_64/Makefile.target:25: cross-
> modifying-code] Error 1
> make[1]: Leaving directory
> '/home/alex/lsrc/qemu.git/builds/all/tests/tcg/x86_64-linux-user'
> make: *** [/home/alex/lsrc/qemu.git/tests/Makefile.include:52: build-
> tcg-tests-x86_64-linux-user] Error 2

Sorry about that, I should have tested a clean build.
I will send a v2.

Best regards,
Ilya

