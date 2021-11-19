Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C620457809
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 22:15:45 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moBEV-0000FX-NU
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 16:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBC2-0007t0-S8; Fri, 19 Nov 2021 16:13:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3436
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBC0-0004Ln-Sc; Fri, 19 Nov 2021 16:13:10 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLBx3M025006; 
 Fri, 19 Nov 2021 21:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZuRSrU/7DZw7SX+6emPgnOVKOdXEtcQASpOA21cJUNM=;
 b=gZwzIZkgOjLbHBvtueuJhcD+W0Eq2DuA5dkSlbEVu+tnIhOneGwyZ7YNxMFKtQqsNFh7
 Yfo4VRHGznLqCgYP4ivoR2JpcqW/11rESfTZ2SMX4AOjr4+oqUsGS0hnjcnX8qn+PT41
 0bH5fgL00xX/Q4upIoeJsIdw5QGB07xvDKyYRXlvNWNRDOUizuSB6wsLQXzYs0q2arBD
 onUbN0hiJf7jYoc3ltGKEebV+0C7SIA8ReD1anIAHE+SkudkOpHQGEdpBWn3HaWztNis
 OXfzNxXm1IVtIZzJF+dKGF3TAFCR96gogLvfcVbsPUBYkHBgntzM7UmtZOaCyipBybyz 4Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cekmfg0qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:13:05 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJLCVB7029512;
 Fri, 19 Nov 2021 21:13:04 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cekmfg0qj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:13:04 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJL3FFl008433;
 Fri, 19 Nov 2021 21:13:04 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 3ca50dndw7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:13:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJLD2Ih58917150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 21:13:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDDDB28059;
 Fri, 19 Nov 2021 21:13:02 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7C3428066;
 Fri, 19 Nov 2021 21:13:00 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.117.31])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 19 Nov 2021 21:13:00 +0000 (GMT)
Message-ID: <d4a9f99fd6bb496ced7216958b8642a720af4354.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v3 2/2] s390x: Implement the USER_SIGP_BUSY capability
From: Eric Farman <farman@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>
Date: Fri, 19 Nov 2021 16:12:59 -0500
In-Reply-To: <13499d9f-652b-ea75-4ad7-32a347297a55@redhat.com>
References: <20211110204528.1378524-1-farman@linux.ibm.com>
 <20211110204528.1378524-3-farman@linux.ibm.com>
 <13499d9f-652b-ea75-4ad7-32a347297a55@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 12ZDJclro5vJP5bEnv92GGhvy1Ve4io3
X-Proofpoint-ORIG-GUID: y0J5X5XWifrGSZLRt9WM1YTsNTvlsfei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_15,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-11-11 at 10:01 +0100, David Hildenbrand wrote:
> On 10.11.21 21:45, Eric Farman wrote:
> > With the USER_SIGP capability, the kernel will pass most (but not
> > all)
> > SIGP orders to userspace for processing. But that means that the
> > kernel
> > is unable to determine if/when the order has been completed by
> > userspace,
> > and could potentially return an incorrect answer (CC1 with status
> > bits
> > versus CC2 indicating BUSY) for one of the remaining in-kernel
> > orders.
> > 
> > With a new USER_SIGP_BUSY capability, userspace can tell the kernel
> > when
> > it is started processing a SIGP order and when it has finished,
> > such that
> > the in-kernel orders can be returned with the BUSY condition
> > between the
> > two IOCTLs.
> > 
> > Let's use the new capability in QEMU.
> 
> This looks much better. A suggestion on how to make it even simpler
> below.
> 
> >      }
> >      si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
> > @@ -375,6 +378,10 @@ static int handle_sigp_single_dst(S390CPU
> > *cpu, S390CPU *dst_cpu, uint8_t order,
> >          return SIGP_CC_BUSY;
> >      }
> >  
> > +    if (s390_cpu_set_sigp_busy(dst_cpu) == -EBUSY) {
> > +        return SIGP_CC_BUSY;
> > +    }
> 
> I'd assume we want something like this instead:

Hi David,

My apologies, this suggestion got lost and I only noticed it while
updating the cover-letter for v4. I do like these ideas and need to
spend some time trying them, so am making a note to revisit once the
interface settles down.

Cheers,
Eric

> 
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -355,6 +355,12 @@ static void sigp_sense_running(S390CPU *dst_cpu,
> SigpInfo *si)
>      }
>  }
>  
> +static bool sigp_dst_is_busy(S390CPU *dst_cpu)
> +{
> +    return dst_cpu->env.sigp_order != 0 ||
> +           s390_cpu_set_sigp_busy(dst_cpu) == -EBUSY;
> +}
> +
>  static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu,
> uint8_t order,
>                                    uint64_t param, uint64_t
> *status_reg)
>  {
> @@ -369,7 +375,7 @@ static int handle_sigp_single_dst(S390CPU *cpu,
> S390CPU *dst_cpu, uint8_t order,
>      }
>  
>      /* only resets can break pending orders */
> -    if (dst_cpu->env.sigp_order != 0 &&
> +    if (sigp_dst_is_busy(dst_cpu) &&
>          order != SIGP_CPU_RESET &&
>          order != SIGP_INITIAL_CPU_RESET) {
>          return SIGP_CC_BUSY;
> 
> 
> 
> 
> But as raised, it might be good enough (and simpler) to
> special-case SIGP STOP * only, because pending SIGP STOP that could
> take
> forever and is processed asynchronously is AFAIU the only real case
> that's
> problematic. We'll also have to handle the migration case with SIGP
> STOP,
> so below would be my take (excluding the KVM parts from your patch)
> 
> 
> 
> diff --git a/slirp b/slirp
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0
> +Subproject commit a88d9ace234a24ce1c17189642ef9104799425e0-dirty
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index ccdbaf84d5..6ead62d1fd 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -114,7 +114,7 @@ static void s390_cpu_reset(CPUState *s,
> cpu_reset_type type)
>      DeviceState *dev = DEVICE(s);
>  
>      scc->parent_reset(dev);
> -    cpu->env.sigp_order = 0;
> +    s390_cpu_set_sigp_busy(cpu, 0);
>      s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>  
>      switch (type) {
> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
> index 37a076858c..d4ad2534a5 100644
> --- a/target/s390x/machine.c
> +++ b/target/s390x/machine.c
> @@ -41,6 +41,14 @@ static int cpu_post_load(void *opaque, int
> version_id)
>          tcg_s390_tod_updated(CPU(cpu), RUN_ON_CPU_NULL);
>      }
>  
> +    /*
> +     * Make sure KVM is aware of the BUSY SIGP order, reset it the
> official
> +     * way.
> +     */
> +    if (cpu->env.sigp_order) {
> +        s390_cpu_set_sigp_busy(cpu, cpu->env.sigp_order);
> +    }
> +
>      return 0;
>  }
>  
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-
> internal.h
> index 1a178aed41..690cadef77 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -402,6 +402,7 @@ void s390x_translate_init(void);
>  
>  
>  /* sigp.c */
> +void s390_cpu_set_sigp_busy(S390CPU *cpu, uint8_t sigp_order);
>  int handle_sigp(CPUS390XState *env, uint8_t order, uint64_t r1,
> uint64_t r3);
>  void do_stop_interrupt(CPUS390XState *env);
>  
> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
> index 51c727834c..9640267124 100644
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -27,6 +27,33 @@ typedef struct SigpInfo {
>      uint64_t *status_reg;
>  } SigpInfo;
>  
> +void s390_cpu_set_sigp_busy(S390CPU *cpu, uint8_t sigp_order)
> +{
> +    /*
> +     * For now we only expect one of these orders that are processed
> +     * asynchronously, or clearing the busy order.
> +     */
> +    g_assert(sigp_order == SIGP_STOP || sigp_order ==
> SIGP_STOP_STORE_STATUS ||
> +             !sigp_order);
> +    if (kvm_enabled()) {
> +        /*
> +         * Note: We're the only ones setting/resetting a CPU in KVM
> busy, and
> +         * we always update the state in KVM when updating the state
> +         * (cpu->env.sigp_order) in QEMU.
> +         */
> +        if (sigp_order)
> +            kvm_s390_vcpu_set_sigp_busy(cpu);
> +        else
> +            kvm_s390_vcpu_reset_sigp_busy(cpu);
> +    }
> +    cpu->env.sigp_order = sigp_order;
> +}
> +
> +static bool s390x_cpu_is_sigp_busy(S390CPU *cpu)
> +{
> +    return cpu->env.sigp_order != 0;
> +}
> +
>  static void set_sigp_status(SigpInfo *si, uint64_t status)
>  {
>      *si->status_reg &= 0xffffffff00000000ULL;
> @@ -119,7 +146,7 @@ static void sigp_stop(CPUState *cs,
> run_on_cpu_data arg)
>          s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>      } else {
>          /* execute the stop function */
> -        cpu->env.sigp_order = SIGP_STOP;
> +        s390_cpu_set_sigp_busy(cpu, SIGP_STOP);
>          cpu_inject_stop(cpu);
>      }
>      si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
> @@ -137,7 +164,7 @@ static void sigp_stop_and_store_status(CPUState
> *cs, run_on_cpu_data arg)
>  
>      switch (s390_cpu_get_state(cpu)) {
>      case S390_CPU_STATE_OPERATING:
> -        cpu->env.sigp_order = SIGP_STOP_STORE_STATUS;
> +        s390_cpu_set_sigp_busy(cpu, SIGP_STOP_STORE_STATUS);
>          cpu_inject_stop(cpu);
>          /* store will be performed in do_stop_interrup() */
>          break;
> @@ -369,7 +396,7 @@ static int handle_sigp_single_dst(S390CPU *cpu,
> S390CPU *dst_cpu, uint8_t order,
>      }
>  
>      /* only resets can break pending orders */
> -    if (dst_cpu->env.sigp_order != 0 &&
> +    if (s390x_cpu_is_sigp_busy(dst_cpu) &&
>          order != SIGP_CPU_RESET &&
>          order != SIGP_INITIAL_CPU_RESET) {
>          return SIGP_CC_BUSY;
> @@ -485,7 +512,7 @@ void do_stop_interrupt(CPUS390XState *env)
>      if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>          s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
>      }
> -    env->sigp_order = 0;
> +    s390_cpu_set_sigp_busy(cpu, 0);
>      env->pending_int &= ~INTERRUPT_STOP;
>  }
>  
> 
> 
> We can optimize in s390_cpu_set_sigp_busy() to not trigger an ioctl
> if not necessary based on the old value of env->sigp_order. Only the
> migration path needs some tweaking then.
> 


