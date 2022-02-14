Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 886904B5E08
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 00:04:48 +0100 (CET)
Received: from localhost ([::1]:55228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJkOl-00043F-3Y
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 18:04:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJkJn-0002QU-T3; Mon, 14 Feb 2022 17:59:39 -0500
Received: from [2607:f8b0:4864:20::1034] (port=51110
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJkJm-0004J3-E7; Mon, 14 Feb 2022 17:59:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id m7so15936617pjk.0;
 Mon, 14 Feb 2022 14:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=djMmvAoZwZkTZLWwBpa3BcEG4u4pA82NqDZZ42rURNE=;
 b=M7zcwExzb1rK+L/HYTmRm02SwMqpbzvdlVp00TOZ25kZK0v89bF1+h53guBQJ6E8HK
 LzcbieVtYAd4WroEqDJqXz2X2TFVYO/IuG3wtuTOAcHOUMAAsZGptgIzkICwc/qk7WBP
 hG/ZloYsOnaTxBKvxjynZpsTR/BxIyW9l2dHEISujhc5v8S536h5WAQRoeYuOxiibiDt
 GynXQCcKuFpLaVk71bM6rUzbAo9/lL5PrLU3mrmcEPxv+MoAAI35KdObevQFv5LrEglC
 n6q3G3dKonhQKizIL8M51ihOm+SdALR81qFY+8Hr8slP9Y5AEJFaepLi59I0NSkvw9XM
 2bxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=djMmvAoZwZkTZLWwBpa3BcEG4u4pA82NqDZZ42rURNE=;
 b=fXDgYyOcFoo4syQmMnbFz7a/Vunhd8RMya0JVGSsXfNxhvBrgQTrY4fk93LkolnRWE
 iw5+sxTkTORfUMjk+9n0rBu1CbdMyyFiXl+smGcaGjYNYtMJIhVe2z0UrIAQaRE9MD3v
 zeYXGZuBw6QkYx0l3gGAjRvveEGWU0qAg59NXKdwKGP0+qz63Qzd8JLX627Q36Dm4VWL
 fEUeVJwxdeLJ+DUMbepP8fKQ6mDbJzEs92urlarZFW0FcrnzWk1pJBdvN2oqV/qpNFEJ
 rcYlk7agbF0r2MY8De3wB1FnOi8Hci5y0Emd3EAZK/wVoPBFbPkGy/oO0MeFHyRdxUK1
 6qwQ==
X-Gm-Message-State: AOAM531uLVFlNMBdS428fMMQ5kLyhy97cFTGVnMzA2giWcnQYoNJQIf7
 aYAl1mGAjeuzj6diu4OswZyadafWoR0=
X-Google-Smtp-Source: ABdhPJzgKDEM5hJC6e3hOWhudFpJa9qb5g8iHpN/hVyO8uD6M94+MtJGLr1kJXh+r/8M21RcQUz3KA==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr1047910pjb.64.1644879575730; 
 Mon, 14 Feb 2022 14:59:35 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id t15sm514141pgc.49.2022.02.14.14.59.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 14:59:35 -0800 (PST)
Date: Tue, 15 Feb 2022 08:59:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] spapr: prevent hdec timer being set up under virtual
 hypervisor
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Fabiano Rosas
 <farosas@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20220214123116.1546406-1-npiggin@gmail.com>
 <87mtitlgk2.fsf@linux.ibm.com>
 <9494ba98-1d7c-8641-285b-c7fee3ec38d1@kaod.org>
In-Reply-To: <9494ba98-1d7c-8641-285b-c7fee3ec38d1@kaod.org>
MIME-Version: 1.0
Message-Id: <1644879343.e91wwp3hqb.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from C=C3=A9dric Le Goater's message of February 15, 2022 4:05 am:
> On 2/14/22 14:32, Fabiano Rosas wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>>=20
>>> The spapr virtual hypervisor does not require the hdecr timer.
>>=20
>> Why is that? Is this not needed for an emulated powernv running KVM
>> guests?

Yeah, powernv does not use the virtual hypervisor, that's just for
pseries.

> It is now also running in the QEMU pseries machine (L0) when a
> nested is running. That's part of the implementation Nick did for
> the KVM-on-pseries-in-QEMU-TCG.
>=20
> But isn't that redundant with the cpu_ppc_hdecr_init() and
> cpu_ppc_hdecr_exit() from the RFC ? and shouldn't that be
> created only once, when the first nested is started or when
> the machine is if cap-nested-hv=3Don ?

For now I create the timer for a vcpu while it is in H_ENTER_NESTED
and destroy it when the hcall returns.

Thanks,
Nick

>=20
>>> Remove it.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   hw/ppc/ppc.c            | 2 +-
>>>   hw/ppc/spapr_cpu_core.c | 6 +++---
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>>> index 462c87dba8..a7c262db93 100644
>>> --- a/hw/ppc/ppc.c
>>> +++ b/hw/ppc/ppc.c
>>> @@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, u=
int32_t freq)
>>>       }
>>>       /* Create new timer */
>>>       tb_env->decr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_=
decr_cb, cpu);
>>> -    if (env->has_hv_mode) {
>>> +    if (env->has_hv_mode && !cpu->vhyp) {
>=20
> hmm, Can we have (env->has_hv_mode && cpu->vhyp) ?  this is confusing :/
>=20
> Thanks,
>=20
> C.
>=20
>=20
>>>           tb_env->hdecr_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu=
_ppc_hdecr_cb,
>>>                                                   cpu);
>>>       } else {
>>> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
>>> index a781e97f8d..ed84713960 100644
>>> --- a/hw/ppc/spapr_cpu_core.c
>>> +++ b/hw/ppc/spapr_cpu_core.c
>>> @@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, S=
paprMachineState *spapr,
>>>           return false;
>>>       }
>>>  =20
>>> -    /* Set time-base frequency to 512 MHz */
>>> -    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
>>> -
>>>       cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
>>>       kvmppc_set_papr(cpu);
>>>  =20
>>> +    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
>>> +    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
>>> +
>>>       if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
>>>           qdev_unrealize(DEVICE(cpu));
>>>           return false;
>>=20
>=20
>=20

