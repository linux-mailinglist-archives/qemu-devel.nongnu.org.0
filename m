Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB63445607
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 16:08:05 +0100 (CET)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mieLU-0001AZ-UL
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 11:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mie9U-0005lE-0F; Thu, 04 Nov 2021 10:55:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:27312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mie9R-0007Dh-7s; Thu, 04 Nov 2021 10:55:39 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A4DpNPp013162; 
 Thu, 4 Nov 2021 14:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=M1U5ALvNcJkte0Xo92ERU9eSzpyM4V6pYK+qiVwyN/0=;
 b=OfWdsISAXdTXpYU+E3QeYcUbSSixYpIVqUSurZyFj9+RGR/i6unPQbiSTkvvl8iSxjHy
 xi5qTLsIrPWMNGdChMLBN3vCPh2tKKt4+h1+CsKydz//yEzOINFBBl5+xN2O4fgwTG8a
 KszkjWzRtZjgrSg1K+tXU8Un0te0CYE5MKzv6NDw+egtB54ek6j31m21A9Zy/+syGE3J
 +iM6ZxBD+4uORIy1vZLcnuy3r//N8camDhaKNmlmuwnxSN3EgHrGqrSjgwiPq0DVT49+
 2tY8cvRRyNehER/l1g7f/AaTARVvBj3MRykyZeRTrUA025eeO+BV1iAI2S1audlQ9eRh dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4gs5sfmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 14:55:33 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A4EpTxu011353;
 Thu, 4 Nov 2021 14:55:32 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4gs5sfm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 14:55:32 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A4ETLTd008969;
 Thu, 4 Nov 2021 14:55:31 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3c0wpd2nhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Nov 2021 14:55:31 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A4EtUAc10224140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Nov 2021 14:55:30 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BF15B2066;
 Thu,  4 Nov 2021 14:55:30 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17CCCB205F;
 Thu,  4 Nov 2021 14:55:29 +0000 (GMT)
Received: from farman-thinkpad-t470p (unknown [9.211.105.133])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  4 Nov 2021 14:55:28 +0000 (GMT)
Message-ID: <9f76c37fc79d40a0bf031deafc7ef4c455c4d375.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 2/2] s390x: Implement the USER_SIGP_BUSY capability
From: Eric Farman <farman@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>
Date: Thu, 04 Nov 2021 10:55:27 -0400
In-Reply-To: <227c48c0-9736-020a-bf21-f70c850c9480@redhat.com>
References: <20211102201122.3188108-1-farman@linux.ibm.com>
 <20211102201122.3188108-3-farman@linux.ibm.com>
 <227c48c0-9736-020a-bf21-f70c850c9480@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YHRtKcCeHcxlwEoZVYOWHVTSaSxjEaOr
X-Proofpoint-ORIG-GUID: Ua4MhIRfeu_C8ldlIdBP-VJUhsU3f_CK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-04_04,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111040058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 2021-11-04 at 09:23 +0100, David Hildenbrand wrote:
> On 02.11.21 21:11, Eric Farman wrote:
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
> > With a new USER_SIGP_BUSY capability, the kernel will automatically
> > flag a vcpu as busy for a SIGP order, and block further orders
> > directed
> > to the same vcpu until userspace resets it to indicate the order
> > has
> > been fully processed.
> > 
> > Let's use the new capability in QEMU.
> > 
> > Signed-off-by: Eric Farman <farman@linux.ibm.com>
> 
> [...]
> 
> > +void kvm_s390_vcpu_reset_busy(S390CPU *cpu)
> 
> kvm_s390_vcpu_reset_sigp_busy ?

Agreed.

> 
> > +{
> > +    CPUState *cs = CPU(cpu);
> > +
> > +    /* Don't care about the response from this */
> > +    kvm_vcpu_ioctl(cs, KVM_S390_VCPU_RESET_SIGP_BUSY);
> > +}
> > +
> >  bool kvm_arch_cpu_check_are_resettable(void)
> >  {
> >      return true;
> 
> [...]
> 
> >  static void sigp_sense_running(S390CPU *dst_cpu, SigpInfo *si)
> > @@ -338,12 +367,14 @@ static void sigp_sense_running(S390CPU
> > *dst_cpu, SigpInfo *si)
> >      if (!tcg_enabled()) {
> >          /* handled in KVM */
> >          set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
> > +        s390_cpu_reset_sigp_busy(dst_cpu);
> >          return;
> >      }
> >  
> >      /* sensing without locks is racy, but it's the same for real
> > hw */
> >      if (!s390_has_feat(S390_FEAT_SENSE_RUNNING_STATUS)) {
> >          set_sigp_status(si, SIGP_STAT_INVALID_ORDER);
> > +        s390_cpu_reset_sigp_busy(dst_cpu);
> >          return;
> >      }
> >  
> > @@ -353,6 +384,7 @@ static void sigp_sense_running(S390CPU
> > *dst_cpu, SigpInfo *si)
> >      } else {
> >          si->cc = SIGP_CC_ORDER_CODE_ACCEPTED;
> >      }
> > +    s390_cpu_reset_sigp_busy(dst_cpu);
> >  }
> 
> Can't we call s390_cpu_reset_sigp_busy() directly from
> handle_sigp_single_dst(),
> after the handle_sigp_single_dst() call?

Can I? Most of the orders in that routine are invoked via
"run_on_cpu(CPU(dst_cpu), ..." dispatching them to other vcpus, so I
presumed that was a stacked task. But of course, that doesn't make a
lot of sense, since it's holding that sigp lock across the duration, so
it must be a vcpu switch instead. Not sure what I was thinking at the
time, so I'll give this a try.

> 
> IIRC we could clear it in case cpu->env.sigp_order wasn't set.
> Otherwise,
> we'll have to clear it once we clear cpu->env.sigp_order -- e.g., in
> do_stop_interrupt(), but
> also during s390_cpu_reset().
> 
> We could have a helper function that sets cpu->env.sigp_order = 0 and
> clears the busy indication.
> 

Agreed, this was some of the refactoring that I had in mind looking at
this mindboggling patch.

I would love it if sigp_order weren't limited to the STOP and STOP AND
STORE STATUS orders, but I hesitate to mess with that too much, for
fear of ripples across the system.

> 
> 
> 
> >  
> >  static int handle_sigp_single_dst(S390CPU *cpu, S390CPU *dst_cpu,
> > uint8_t order,
> > @@ -420,6 +452,7 @@ static int handle_sigp_single_dst(S390CPU *cpu,
> > S390CPU *dst_cpu, uint8_t order,
> >          break;
> >      default:
> >          set_sigp_status(&si, SIGP_STAT_INVALID_ORDER);
> > +        s390_cpu_reset_sigp_busy(dst_cpu);
> >      }
> >  
> >      return si.cc;
> > @@ -444,6 +477,12 @@ int handle_sigp(CPUS390XState *env, uint8_t
> > order, uint64_t r1, uint64_t r3)
> >      int ret;
> >  
> 
> Maybe rather lookup the dst once:
> 
> if (order != SIGP_SET_ARCH) {
>     /* all other sigp orders target a single vcpu */
>     dst_cpu = s390_cpu_addr2state(env->regs[r3]);
> }
> 
> if (qemu_mutex_trylock(&qemu_sigp_mutex)) {
>     if (dst_cpu) {
>         s390_cpu_reset_sigp_busy(dst_cpu);
>     }
>     ret = SIGP_CC_BUSY;
>     goto out;
> }
> 
> switch (order) {
> case SIGP_SET_ARCH:
>     ret = sigp_set_architecture(cpu, param, status_reg);
>     break;
> default:
>     ret = handle_sigp_single_dst(cpu, dst_cpu, order, param,
> status_reg);
> }
> 
> 
> BUT, I wonder if this is fully correct.
> 
> Can't it happen that another CPU is currently processing an order for
> that very same dst_cpu and you would clear SIGP busy of that cpu
> prematurely?

Ah, yes...  I got caught up in the "this is a global lock so another
vcpu must be doing a sigp" side of things, and relying on the kernel to
make the determination that "vcpuN is already processing an order,
don't send it another one."

> 
> >      if (qemu_mutex_trylock(&qemu_sigp_mutex)) {
> > +        if (order != SIGP_SET_ARCH) {
> > +            dst_cpu = s390_cpu_addr2state(env->regs[r3]);
> > +            if (dst_cpu) {
> > +                s390_cpu_reset_sigp_busy(dst_cpu);
> > +            }
> > +        }
> >          ret = SIGP_CC_BUSY;
> >          goto out;
> >      }
> > @@ -487,6 +526,7 @@ void do_stop_interrupt(CPUS390XState *env)
> >      }
> >      env->sigp_order = 0;
> >      env->pending_int &= ~INTERRUPT_STOP;
> > +    s390_cpu_reset_sigp_busy(cpu);
> >  }
> >  
> >  void s390_init_sigp(void)
> > 
> 
> 


