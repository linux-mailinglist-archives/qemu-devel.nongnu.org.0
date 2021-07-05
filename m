Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765F43BC241
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:25:41 +0200 (CEST)
Received: from localhost ([::1]:46116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0SLk-0003WG-25
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0SKe-000283-PN; Mon, 05 Jul 2021 13:24:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0SKc-0006fx-Ey; Mon, 05 Jul 2021 13:24:32 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165H3SSO065360; Mon, 5 Jul 2021 13:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=qOWZcksF0z36mEwp5O+ZZkj+PdldHNyVlnKC2/EdAgE=;
 b=lOHQohed2zTxE2CEt7A9opz+mJAnTQHA1aLqUJU82WeMK/iX25/IKe0OgzzonALWaKi5
 0EJpo2d9HylcBte9sv6jt32MBryiNwWNUxBQorT4r3/N+Hjg4tPn1HOk8L/atRHlQmgZ
 xST2/hDjjuMTnVS2I3P64spYa7su4wiLymx+HXS0IVN9zkbqwu+7OVM2YURSWF2yIzt7
 R4p/0+JU51+LG2z3cgYVh2FhR3tnl2zBuIEvVhc75vsiRAa20tyBbWzHaRiEUViMM3Ou
 osw2afitRKmpfziCExRgI6zHprepCHFYEOxrfRriad0QPqI4SAAfRN2rX/4D7RE83c+M pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m3xmuuak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 13:24:26 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 165H3Yw1066006;
 Mon, 5 Jul 2021 13:24:25 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m3xmuu9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 13:24:25 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 165HEk9B013178;
 Mon, 5 Jul 2021 17:24:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 39jf5hgg4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 17:24:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 165HMW7X36962578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Jul 2021 17:22:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 730B3A4051;
 Mon,  5 Jul 2021 17:24:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01A64A4057;
 Mon,  5 Jul 2021 17:24:19 +0000 (GMT)
Received: from sig-9-145-62-121.uk.ibm.com (unknown [9.145.62.121])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Jul 2021 17:24:18 +0000 (GMT)
Message-ID: <3694d1e29d7b1d00b60235360a54abf4b9ca4dea.camel@linux.ibm.com>
Subject: Re: [PATCH v5 1/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Date: Mon, 05 Jul 2021 19:24:18 +0200
In-Reply-To: <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <20210623023250.3667563-2-iii@linux.ibm.com>
 <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: syz_IsOuPFnjK3-ujbq-1pLvNbdKSmQ-
X-Proofpoint-GUID: thulBTfSJRKWOnLLS3laiaTETprDnDWB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_09:2021-07-02,
 2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050091
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

On Mon, 2021-07-05 at 11:36 +0200, David Hildenbrand wrote:
> On 23.06.21 04:32, Ilya Leoshkevich wrote:
> > For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
> > instruction, and at the instruction for other signals. Currently
> > under
> > qemu-user it always points at the instruction.
> > 
> > Fix by advancing psw.addr for these signals.
> > 
> > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
> > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> > ---
> >   linux-user/s390x/cpu_loop.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/linux-user/s390x/cpu_loop.c b/linux-
> > user/s390x/cpu_loop.c
> > index 30568139df..230217feeb 100644
> > --- a/linux-user/s390x/cpu_loop.c
> > +++ b/linux-user/s390x/cpu_loop.c
> > @@ -133,6 +133,11 @@ void cpu_loop(CPUS390XState *env)
> >   
> >           do_signal_pc:
> >               addr = env->psw.addr;
> > +            /*
> > +             * For SIGILL, SIGFPE and SIGTRAP the PSW must point
> > after the
> > +             * instruction.
> > +             */
> > +            env->psw.addr += env->int_pgm_ilen;
> 
> We also reach this path via EXCP_DEBUG. How can we expect 
> env->int_pgm_ilen to contain something sensible in that case?

You are right, this breaks breakpoints after getting any PGM exception
(they turn into "Program received signal SIGTRAP, Trace/breakpoint
trap." instead of the usual "Breakpoint N").

We don't need a PSW rewind here, since it's already incremented
throught the following sequence:

1) GDB asks QEMU to set a breakpoint using a $Z0 packet.
2) translator_loop() notices the breakpoint and calls
   s390x_tr_breakpoint_check().
3) s390x_tr_breakpoint_check() sets DisasContextBase.is_jmp to
   DISAS_PC_STALE and increments DisasContextBase.pc_next by 2.
4) translator_loop() calls s390x_tr_tb_stop().
5) s390x_tr_tb_stop() calls update_psw_addr(), so the JITed code
   increments the PSWA by 2 as well.
6) s390x_tr_tb_stop() calls gen_exception(EXCP_DEBUG).

What do you think about the following amend?

--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
         case EXCP_DEBUG:
             sig = TARGET_SIGTRAP;
             n = TARGET_TRAP_BRKPT;
-            goto do_signal_pc;
+            /*
+             * For SIGTRAP the PSW must point after the instruction,
which it
+             * already does thanks to s390x_tr_tb_stop(). si_addr
doesn't need
+             * to be filled.
+             */
+            addr = 0;
+            goto do_signal;
         case EXCP_PGM:
             n = env->int_pgm_code;
             switch (n) {
@@ -134,8 +140,7 @@ void cpu_loop(CPUS390XState *env)
         do_signal_pc:
             addr = env->psw.addr;
             /*
-             * For SIGILL, SIGFPE and SIGTRAP the PSW must point after
the
-             * instruction.
+             * For SIGILL and SIGFPE the PSW must point after the
instruction.
              */
             env->psw.addr += env->int_pgm_ilen;
         do_signal:

Best regards,
Ilya


