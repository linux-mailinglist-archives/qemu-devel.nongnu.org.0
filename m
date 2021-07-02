Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB613BA4EB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 23:02:43 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzQJ7-0004tb-Mv
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 17:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lzQHN-0003iK-Ce; Fri, 02 Jul 2021 17:00:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uweigand@de.ibm.com>)
 id 1lzQHK-00021a-1Y; Fri, 02 Jul 2021 17:00:53 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 162KXfRl157949; Fri, 2 Jul 2021 17:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XnOaqTdhfHG9ZfcazTc3zhACoez8Or0+6PRI5RDTdko=;
 b=PAy82ge2eFtClySYApq4mKx7yziYpH3ys9FOOhlT7T9RZe/OCJlJWZG8+qMWYHLY1NSK
 oqBtTmlCEyTBNsW/f6X0NuLjmwSbFMZQJhL2w2kYHKe7gr275T5uR9hDhJALFR9fc/4i
 VUX64KzGSOGrHin3ls7lygIZQihHa0byRfKSrX5WggtLuK4b3QTDAXpL/A3kQcF+1kZR
 uamKtHGvHV97U35jTZ4LtnbhYTA7p8w43BCsTavcvpb142rtwo0IgIJUX5aYfMu+HuuV
 x8F56TjVnfzQ9zdYJuTM0tZt7gXrDC5l0HJCEiGJr4YcCpnVQL0NgVF3tDVbDFavcq8s 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j9ng0tbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:00:46 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 162L0C5v075438;
 Fri, 2 Jul 2021 17:00:45 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39j9ng0tar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 17:00:45 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 162Kwlt4006840;
 Fri, 2 Jul 2021 21:00:43 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 39h19bh16a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Jul 2021 21:00:43 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 162L0dSI32768344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 2 Jul 2021 21:00:39 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 833D64203F;
 Fri,  2 Jul 2021 21:00:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F3B842045;
 Fri,  2 Jul 2021 21:00:39 +0000 (GMT)
Received: from oc3748833570.ibm.com (unknown [9.145.159.224])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  2 Jul 2021 21:00:39 +0000 (GMT)
Received: by oc3748833570.ibm.com (Postfix, from userid 1000)
 id EECD0D8030E; Fri,  2 Jul 2021 23:00:38 +0200 (CEST)
Date: Fri, 2 Jul 2021 23:00:38 +0200
From: Ulrich Weigand <uweigand@de.ibm.com>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v5 0/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
Message-ID: <20210702210038.GA8031@oc3748833570.ibm.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <87a6n5j976.fsf@redhat.com>
 <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <3624d483-dd11-6464-bbfd-ed2921b2fcfe@vivier.eu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MR3Bs2iTSVsp4X2OBJ0vGfLfyJjJlqAv
X-Proofpoint-ORIG-GUID: YTsUl8uJoV4gIpwmc4S7msFmmyWG5zXU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-02_10:2021-07-02,
 2021-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107020104
Received-SPF: pass client-ip=148.163.158.5; envelope-from=uweigand@de.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Andreas Krebbel <krebbel@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 02, 2021 at 02:01:47PM +0200, Laurent Vivier wrote:
> Le 02/07/2021 à 12:34, Cornelia Huck a écrit :
> > On Wed, Jun 23 2021, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> > 
> >> qemu-s390x puts a wrong value into SIGILL's siginfo_t's psw.addr: it
> >> should be a pointer to the instruction following the illegal
> >> instruction, but at the moment it is a pointer to the illegal
> >> instruction itself. This breaks OpenJDK, which relies on this value.
> >> A similar problem exists for SIGFPE and SIGTRAP.
> >>
> >> Patch 1 fixes the issue, patch 2 adds a test.
> >>
> >> v1: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06592.html
> >> v1 -> v2: Use a better buglink (Cornelia), simplify the inline asm
> >>           magic in the test and add an explanation (David).
> >>
> >> v2: https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06649.html
> >> v2 -> v3: Fix SIGSEGV handling (found when trying to run valgrind under
> >>           qemu-user).
> >>
> >> v3: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg00299.html
> >> v3 -> v4: Fix compiling the test on Ubuntu 20.04 (Jonathan).
> >>
> >> v4: https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05848.html
> >> v4 -> v5: Greatly simplify the fix (Ulrich).
> >>
> >> Note: the compare-and-trap SIGFPE issue is being fixed separately.
> >> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg05690.html
> >>
> >> Ilya Leoshkevich (2):
> >>   target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr reporting
> >>   tests/tcg/s390x: Test SIGILL and SIGSEGV handling
> >>
> >>  linux-user/s390x/cpu_loop.c     |   5 +
> >>  tests/tcg/s390x/Makefile.target |   1 +
> >>  tests/tcg/s390x/signal.c        | 165 ++++++++++++++++++++++++++++++++
> >>  3 files changed, 171 insertions(+)
> >>  create mode 100644 tests/tcg/s390x/signal.c
> > 
> > What's the status of this and
> > <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>? linux-user
> > is not really my turf, but it would be sad if this fell through the
> > cracks.
> > 
> 
> If from the S390x point of view they are correct, I can collect them via linux-user.

It's certainly correct that SIGILL, SIGFPE and SIGTRAP are delivered with psw.addr
pointing *after* the faulting instruction, that forms in effect part of the kernel
ABI on s390x.  We're planning to document this in the next revision of the ABI
document, see here: https://github.com/IBM/s390x-abi/issues/2

I can also confirm that this patch fixes the problems I was seeing when running
the s390x wasmtime JIT under qemu.

Bye,
Ulrich

-- 
  Dr. Ulrich Weigand
  GNU/Linux compilers and toolchain
  Ulrich.Weigand@de.ibm.com

