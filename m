Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02C2CF5DD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 21:53:31 +0100 (CET)
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klI53-0002OB-QB
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 15:53:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klFcA-0007G7-Fl; Fri, 04 Dec 2020 13:15:40 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:47738 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klFc0-0003QE-4K; Fri, 04 Dec 2020 13:15:22 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 62A68413F1;
 Fri,  4 Dec 2020 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607105714;
 x=1608920115; bh=YVGyE8TlAzd8/jfGdj6zfujGWcv13xuBM4HkZSrsiqI=; b=
 l2xUQh8wSKibMxU9ggiQlfsn0T/pwPVDHwDTdqA/38SvYxxnhYEVlKOFqyc8U7pS
 dC/+VcHkOkjMmQ20AWJBAZd0IPOwcXfaA/TME+K6JOpwanKoAjtvLjlDPaocicjY
 Jhh/EwoXsLlGZNX/WUtfHdIO0mGtvUdGeIaSdfOSjOM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i8FiuNgjj_3F; Fri,  4 Dec 2020 21:15:14 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 79A5A4139B;
 Fri,  4 Dec 2020 21:15:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 21:15:13 +0300
Date: Fri, 4 Dec 2020 21:15:36 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 08/10] arm/hvf: Add a WFI handler
Message-ID: <20201204181536.GL86904@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-9-agraf@csgraf.de>
 <20201203103949.GC7201@SPB-NB-133.local>
 <CAMn1gO4adJvkWDMV6e0Caigh7B3O5STq=S5P_F6SbWi58x22CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMn1gO4adJvkWDMV6e0Caigh7B3O5STq=S5P_F6SbWi58x22CQ@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 10:18:14AM -0800, Peter Collingbourne wrote:
> On Thu, Dec 3, 2020 at 2:39 AM Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > On Wed, Dec 02, 2020 at 08:04:06PM +0100, Alexander Graf wrote:
> > > From: Peter Collingbourne <pcc@google.com>
> > >
> > > Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> > > up on IPI.
> > >
> > > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > > [agraf: Remove unused 'set' variable, always advance PC on WFX trap]
> > > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > > ---
> > > +static void hvf_wait_for_ipi(CPUState *cpu, struct timespec *ts)
> > > +{
> > > +    /*
> > > +     * Use pselect to sleep so that other threads can IPI us while we're
> > > +     * sleeping.
> > > +     */
> > > +    qatomic_mb_set(&cpu->thread_kicked, false);
> > > +    qemu_mutex_unlock_iothread();
> >
> > I raised a concern earlier, but I don't for sure if a kick could be lost
> > right here. On x86 it could be lost.
> 
> If the signal is sent right before the pselect() it will be blocked
> i.e. left pending. With the pselect() we get an atomic unblock of
> SIG_IPI at the same time as we begin sleeping, which means that we
> will receive the signal and leave the pselect() immediately.
> 
> I think at some point macOS had an incorrect implementation of
> pselect() where the signal mask was non-atomically set in userspace
> which could lead to the signal being missed but I checked the latest
> XNU sources and it looks like the pselect() implementation has been
> moved to the kernel.
> 

Yeah, you're right here.

> > > +    pselect(0, 0, 0, 0, ts, &cpu->hvf->unblock_ipi_mask);
> > > +    qemu_mutex_lock_iothread();
> > > +}
> > > +
> > >  int hvf_vcpu_exec(CPUState *cpu)
> > >  {
> > >      ARMCPU *arm_cpu = ARM_CPU(cpu);
> > > @@ -579,6 +594,46 @@ int hvf_vcpu_exec(CPUState *cpu)
> > >          }
> > >          case EC_WFX_TRAP:
> > >              advance_pc = true;
> > > +            if (!(syndrome & WFX_IS_WFE) && !(cpu->interrupt_request &
> > > +                (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > > +
> > > +                uint64_t ctl;
> > > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CTL_EL0,
> > > +                                        &ctl);
> > > +                assert_hvf_ok(r);
> > > +
> > > +                if (!(ctl & 1) || (ctl & 2)) {
> > > +                    /* Timer disabled or masked, just wait for an IPI. */
> > > +                    hvf_wait_for_ipi(cpu, NULL);
> > > +                    break;
> > > +                }
> > > +
> > > +                uint64_t cval;
> > > +                r = hv_vcpu_get_sys_reg(cpu->hvf->fd, HV_SYS_REG_CNTV_CVAL_EL0,
> > > +                                        &cval);
> > > +                assert_hvf_ok(r);
> > > +
> > > +                int64_t ticks_to_sleep = cval - mach_absolute_time();
> >
> >
> > Apple reference recommends to use [1]:
> >
> >   clock_gettime_nsec_np(CLOCK_UPTIME_RAW)
> >
> > It, internally in Libc, invokes mach_absolute_time() [2].
> >
> > 1. https://developer.apple.com/documentation/kernel/1462446-mach_absolute_time
> > 2. https://opensource.apple.com/source/Libc/Libc-1158.1.2/gen/clock_gettime.c.auto.html
> 
> I think that recommendation is because most people want to deal with
> seconds, not ticks. In our case we specifically want ticks because
> we're comparing against a ticks value from the guest, so I don't see
> the benefit of converting from ticks to seconds and back again.
> 

Thanks for the clarifications, Peter.

Regards,
Roman

