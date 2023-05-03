Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095666F5519
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:45:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu92s-0006uz-49; Wed, 03 May 2023 05:45:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pu92p-0006tX-G6
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:45:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1pu92n-0002Kb-7d
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:45:07 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34375Pm4027372; Wed, 3 May 2023 09:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=8cBgRNoWo1hKHvkzv28UBkVY+0V1RoXCR8vLGVIxh/k=;
 b=g7WZ6z80i1mDEvIrwv4MwJr0/1hiRNeewXcIS99LbIVHGdjYzkPDXMhx3/ozVSLd5ghE
 mwlpH4FhrW9G01mpJ1kRfLDUGZ29KCXaYaCqs+0p+BIfj1LoylZh4mI+XuRdjIAXARfe
 Bbg/wku5fLq/WMBZlAvHVZX/KCI0nSh5i1cAIDHBYYqUJO53hF9t52okjTPdftyablkt
 IlABUPFyxaXnvwf0SUYlQ04Q2XbbabkE+gDHY4+kaIJFVtx5oawJUC5HaTL5slwKkDfQ
 oo+zbZgx6SF1FxBJJierliKAgtxZ36qiSXUxeN3IZNB3GXmLZ0xPE8U8VSxcqCLq+vWC zQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbjwn8ak7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 09:45:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3439ixai029104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 3 May 2023 09:44:59 GMT
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 3 May 2023
 02:44:59 -0700
Date: Wed, 3 May 2023 10:44:57 +0100
From: Jamie Iles <quic_jiles@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
CC: Jamie Iles <quic_jiles@quicinc.com>, <qemu-devel@nongnu.org>,
 <pbonzini@redhat.com>, <philmd@linaro.org>, <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Message-ID: <ZFItGQ5o67WuOwYp@JILES.na.qualcomm.com>
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: qHXK9ccmO9TXDSzMgYKD9Pcya2Y5iFf4
X-Proofpoint-ORIG-GUID: qHXK9ccmO9TXDSzMgYKD9Pcya2Y5iFf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_06,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030081
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_jiles@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Richard,

On Sat, Apr 29, 2023 at 10:28:03AM +0100, Richard Henderson wrote:
> On 4/27/23 03:09, Jamie Iles wrote:
> > From: Jamie Iles <jiles@qti.qualcomm.com>
> > 
> > The round-robin scheduler will iterate over the CPU list with an
> > assigned budget until the next timer expiry and may exit early because
> > of a TB exit.  This is fine under normal operation but with icount
> > enabled and SMP it is possible for a CPU to be starved of run time and
> > the system live-locks.
> > 
> > For example, booting a riscv64 platform with '-icount
> > shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
> > has timers enabled and starts performing TLB shootdowns.  In this case
> > we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
> > 1.  As we enter the TCG loop, we assign the icount budget to next timer
> > interrupt to CPU 0 and begin executing where the guest is sat in a busy
> > loop exhausting all of the budget before we try to execute CPU 1 which
> > is the target of the IPI but CPU 1 is left with no budget with which to
> > execute and the process repeats.
> > 
> > We try here to add some fairness by splitting the budget across all of
> > the CPUs on the thread fairly before entering each one.  The CPU count
> > is cached on CPU list generation ID to avoid iterating the list on each
> > loop iteration.  With this change it is possible to boot an SMP rv64
> > guest with icount enabled and no hangs.
> > 
> > New in v3 (address feedback from Richard Henderson):
> >   - Additional patch to use QEMU_LOCK_GUARD with qemu_cpu_list_lock where
> >     appropriate
> >   - Move rr_cpu_count() call to be conditional on icount_enabled()
> >   - Initialize cpu_budget to 0
> > 
> > Jamie Iles (2):
> >    cpu: expose qemu_cpu_list_lock for lock-guard use
> >    accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
> 
> It appears as if one of these two patches causes a failure in replay, e.g.
> 
>   https://gitlab.com/rth7680/qemu/-/jobs/4200609234#L4162
> 
> Would you have a look, please?

I was out on vacation and it looks like this job got cleaned up, but was 
this a mutex check failing for the replay mutex and/or iothread mutex?  
If so then the following patch fixes it for me which I can include in a 
v4

Thanks,

Jamie


diff --git i/accel/tcg/tcg-accel-ops-icount.c w/accel/tcg/tcg-accel-ops-icount.c
index e1e8afaf2f99..3d2cfbbc9778 100644
--- i/accel/tcg/tcg-accel-ops-icount.c
+++ w/accel/tcg/tcg-accel-ops-icount.c
@@ -114,13 +114,13 @@ void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget)
     g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
     g_assert(cpu->icount_extra == 0);
 
+    replay_mutex_lock();
+
     cpu->icount_budget = MIN(icount_get_limit(), cpu_budget);
     insns_left = MIN(0xffff, cpu->icount_budget);
     cpu_neg(cpu)->icount_decr.u16.low = insns_left;
     cpu->icount_extra = cpu->icount_budget - insns_left;
 
-    replay_mutex_lock();
-
     if (cpu->icount_budget == 0) {
         /*
          * We're called without the iothread lock, so must take it while
diff --git i/replay/replay.c w/replay/replay.c
index c39156c52221..0f7d766efe81 100644
--- i/replay/replay.c
+++ w/replay/replay.c
@@ -74,7 +74,7 @@ uint64_t replay_get_current_icount(void)
 int replay_get_instructions(void)
 {
     int res = 0;
-    replay_mutex_lock();
+    g_assert(replay_mutex_locked());
     if (replay_next_event_is(EVENT_INSTRUCTION)) {
         res = replay_state.instruction_count;
         if (replay_break_icount != -1LL) {
@@ -85,7 +85,6 @@ int replay_get_instructions(void)
             }
         }
     }
-    replay_mutex_unlock();
     return res;
 }
 

