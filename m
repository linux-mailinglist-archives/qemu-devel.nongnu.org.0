Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7406E3BC35C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 22:21:25 +0200 (CEST)
Received: from localhost ([::1]:50384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0V5o-0004Ed-HV
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 16:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0V4d-0003D1-GE; Mon, 05 Jul 2021 16:20:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:14182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1m0V4Z-0008Gc-2d; Mon, 05 Jul 2021 16:20:11 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 165K3So2145733; Mon, 5 Jul 2021 16:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8zDVntbxzqtfcBEbVW3nn5VmI4HhZ91+NEdTffs0TQc=;
 b=XsHzLmxKWZwK9iifxCWTK3+kRGk0n8y8qmsRwlPNnAnMzD+ZUjM+VdT6X/MeEopo5WOo
 aaoV9S/1vC6TKiTINe2dDdzTYTSzV8dEptcSp7h3PbU0FJrEgTzUq5Ln7Oru3mHzG4N7
 Dnef2lISLifz64EPH6dqHBm+ISyTC0UMhivjpHCn2Ave+JvPvzFIhRjGeOo9RrCE/t5q
 eLRegDBjT9+z4XKxAqncPy7VWasw2XItFRo9uJto5em7whKwqkQTMe4sEXqUR5ucKWAb
 vKHOmXCg5Mg00s2GqxGY86ADXRTe9MjYkIf9UWZK5DIvTsOYivM7C0DZyS+2MpX3JXCG ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m82c17h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 16:20:04 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 165K40u0003370;
 Mon, 5 Jul 2021 16:20:03 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m82c17g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 16:20:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 165KHC6S007535;
 Mon, 5 Jul 2021 20:20:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 39jf5h8xhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Jul 2021 20:20:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 165KJvoY24641888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 5 Jul 2021 20:19:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37B7511C052;
 Mon,  5 Jul 2021 20:19:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B52B211C04C;
 Mon,  5 Jul 2021 20:19:56 +0000 (GMT)
Received: from sig-9-145-62-121.uk.ibm.com (unknown [9.145.62.121])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  5 Jul 2021 20:19:56 +0000 (GMT)
Message-ID: <cb16b059dbcf2202ded95044d3aed32b9510ef97.camel@linux.ibm.com>
Subject: Re: [PATCH v5 1/2] target/s390x: Fix SIGILL/SIGFPE/SIGTRAP psw.addr
 reporting
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>
Date: Mon, 05 Jul 2021 22:19:56 +0200
In-Reply-To: <59f3bbfe-c92c-6940-c008-9fc697e5a464@redhat.com>
References: <20210623023250.3667563-1-iii@linux.ibm.com>
 <20210623023250.3667563-2-iii@linux.ibm.com>
 <ce59213b-4642-63b4-32b1-4566415c3b7f@redhat.com>
 <3694d1e29d7b1d00b60235360a54abf4b9ca4dea.camel@linux.ibm.com>
 <59f3bbfe-c92c-6940-c008-9fc697e5a464@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1lkxCG-GJIrLXgobBV_RL1VL7SiCxRaJ
X-Proofpoint-GUID: xCI2-98sxsXcs0ZkilRw_WoZy2xtKVCI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-05_10:2021-07-02,
 2021-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107050107
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

On Mon, 2021-07-05 at 21:18 +0200, David Hildenbrand wrote:
> On 05.07.21 19:24, Ilya Leoshkevich wrote:
> > On Mon, 2021-07-05 at 11:36 +0200, David Hildenbrand wrote:
> > > On 23.06.21 04:32, Ilya Leoshkevich wrote:
> > > > For SIGILL, SIGFPE and SIGTRAP the PSW must point after the
> > > > instruction, and at the instruction for other signals. Currently
> > > > under
> > > > qemu-user it always points at the instruction.
> > > > 
> > > > Fix by advancing psw.addr for these signals.
> > > > 
> > > > Buglink: https://gitlab.com/qemu-project/qemu/-/issues/319
> > > > Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> > > > Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> > > > ---
> > > >    linux-user/s390x/cpu_loop.c | 5 +++++
> > > >    1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/linux-user/s390x/cpu_loop.c b/linux-
> > > > user/s390x/cpu_loop.c
> > > > index 30568139df..230217feeb 100644
> > > > --- a/linux-user/s390x/cpu_loop.c
> > > > +++ b/linux-user/s390x/cpu_loop.c
> > > > @@ -133,6 +133,11 @@ void cpu_loop(CPUS390XState *env)
> > > >    
> > > >            do_signal_pc:
> > > >                addr = env->psw.addr;
> > > > +            /*
> > > > +             * For SIGILL, SIGFPE and SIGTRAP the PSW must point
> > > > after the
> > > > +             * instruction.
> > > > +             */
> > > > +            env->psw.addr += env->int_pgm_ilen;
> > > 
> > > We also reach this path via EXCP_DEBUG. How can we expect
> > > env->int_pgm_ilen to contain something sensible in that case?
> > 
> > You are right, this breaks breakpoints after getting any PGM
> > exception
> > (they turn into "Program received signal SIGTRAP, Trace/breakpoint
> > trap." instead of the usual "Breakpoint N").
> > 
> > We don't need a PSW rewind here, since it's already incremented
> > throught the following sequence:
> > 
> > 1) GDB asks QEMU to set a breakpoint using a $Z0 packet.
> > 2) translator_loop() notices the breakpoint and calls
> >     s390x_tr_breakpoint_check().
> > 3) s390x_tr_breakpoint_check() sets DisasContextBase.is_jmp to
> >     DISAS_PC_STALE and increments DisasContextBase.pc_next by 2.
> > 4) translator_loop() calls s390x_tr_tb_stop().
> > 5) s390x_tr_tb_stop() calls update_psw_addr(), so the JITed code
> >     increments the PSWA by 2 as well.
> > 6) s390x_tr_tb_stop() calls gen_exception(EXCP_DEBUG).
> > 
> > What do you think about the following amend?
> > 
> > --- a/linux-user/s390x/cpu_loop.c
> > +++ b/linux-user/s390x/cpu_loop.c
> > @@ -64,7 +64,13 @@ void cpu_loop(CPUS390XState *env)
> >           case EXCP_DEBUG:
> >               sig = TARGET_SIGTRAP;
> >               n = TARGET_TRAP_BRKPT;
> > -            goto do_signal_pc;
> > +            /*
> > +             * For SIGTRAP the PSW must point after the instruction,
> > which it
> > +             * already does thanks to s390x_tr_tb_stop(). si_addr
> > doesn't need
> > +             * to be filled.
> > +             */
> > +            addr = 0;
> > +            goto do_signal;
> 
> Looks better to me, but I'm not an expert on signals, so I cannot tell 
> what si_addr is supposed to contain in that case.
> 

Thanks, I'll send a v6 then. I used rt_sigaction(2) man here:

    When SIGTRAP is delivered in response to a ptrace(2) event
    (PTRACE_EVENT_foo), si_addr is not populated

I think EXCP_DEBUG corresponds only to this case - there doesn't
seem to be a way to generate it without attaching gdb.


