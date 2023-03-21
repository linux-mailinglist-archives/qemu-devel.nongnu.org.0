Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B06C3302
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:35:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pec9D-00086s-95; Tue, 21 Mar 2023 09:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pec8s-0007wv-ID
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:35:12 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pec8q-0006aD-SI
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:35:10 -0400
Received: by mail-pl1-x633.google.com with SMTP id z19so5596487plo.2
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679405707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rGrzFl5Bhcl+a4kQ8MCP6bco7fvFT4woifSqH8nXkvY=;
 b=m31IgdDCbgsz2GBhh+HP+A65A2xxv87w2KJTWCA9OxP3PGZG3FVYGjKBhQWpeGmP92
 Vrf68FomCrxE+HPejB2gpQsgRPFIQ1qO87Nqfqu4pYTjJw46B/xWOdGwnjBxwemI3BfW
 gY0yPdTxHue28iuHrOZnL2Ig5uzHdqEdgqtef4I+lsb+dOURJFrvkSu49jvQmuIl61af
 949ZlJQwZQ0LzdRDZBd6XPG8iqnHiKtBI/52WWOg50x3KPc2saciVY4waEVHQpR4st+Q
 FidbvBJbLY3XRG5vLIn6TZ+dl/q3APbN5/203Y4tAZtolD0orhsbSk4HJ2Ohqk3XgLw3
 Iabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405707;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rGrzFl5Bhcl+a4kQ8MCP6bco7fvFT4woifSqH8nXkvY=;
 b=R0h5fJ/Pdr2WSrsGj6uurLgrmQahzfnZ6WBNHIHI2Ordt4WKhWoCn8cfhpmKwZzFTP
 tJenhoZnv+ulNmIRK7roucru+lmKH5zrdjIIgOXFaJITDCbsVdZwu71DIfKIGB9sisEP
 17bixk9r0IS7mOM0PDHybAGuPhDwCaaM0p4ywN50ItlczrU6HhCpDGst5vQstGOSSIVq
 4gdpUVMNmCtpS6wOCDPuS+vURc3r+INE9VvGl4fEK4uVkmgza8dwxlwUQN5KPoRmVY1g
 253bX2YoKFTDjvsQPlDw/N4U0+hiSlOtoHT4tnSED3vzdtgwmCHvWstfkaQdawqhFXNE
 YyAA==
X-Gm-Message-State: AO0yUKXYQogMzoWqmslC/L0V1hLmf19ayHGyan8pRbikkOzMPdXkIHDR
 Bth5t2+JgIWSX/405vilp+6t+BYv60itrv1bSPJ9SA==
X-Google-Smtp-Source: AK7set+VnUKRBI877/jOgQSCgNKg3dBjW93Ocbk+IajkJ9WeXdWn06jy3vU/HEd1UIs0LHlCS8ZlIBCxo6RR+IWZTNs=
X-Received: by 2002:a17:902:efc6:b0:1a0:4be5:ccea with SMTP id
 ja6-20020a170902efc600b001a04be5cceamr908559plb.9.1679405707245; Tue, 21 Mar
 2023 06:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
In-Reply-To: <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Mar 2023 13:34:55 +0000
Message-ID: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
To: eric.auger@redhat.com
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, 
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 21 Mar 2023 at 13:23, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Mostafa,
>
> On 3/21/23 14:06, Mostafa Saleh wrote:
> > Hi Eric,
> >
> >>> +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
> >>> +     * size.
> >>> +     */
> >>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> >>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> >> is this working in accelerated mode?
> > I didn't try with accel, I will give it a try, but from what I see, that
> > ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> > accel/kvm-all.c, so it seems this would work for accelerated mode.
>
> yeah I ma not familiar enough with that code but it is worth to be checked.

I'm a bit unsure about fishing around in the CPU ID registers for this.
That's not what you would do in real hardware, you'd just say "the
system is supposed to configure the CPU and the SMMU correctly".

Also, there is no guarantee that CPU 0 is related to this SMMU in
particular.

> >
> >>> +
> >>>      /**
> >>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
> >>>       *       multi-level stream table
> >>> @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> >>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> >>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> >>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> >> I am not sure you can change that easily. In case of migration this is
> >> going to change the behavior of the device, no?
> > I see IDR registers are not migrated. I guess we can add them in a
> > subsection and if they were not passed (old instances) we set OAS to
> > 44.
> > Maybe this should be another change outside of this series.
> Indeed tehy are not migrated so it can lead to inconsistent behavior in
> both source and dest. This deserves more analysis to me. In case you
> would decide to migrate IDR regs this would need to be done in that
> series I think. Migration must not be broken by this series.

Jumping in here without having read much of the context, but why
would we need to migrate the ID registers? They are constant, read-only,
so they will be the same value on both source and destination.

thanks
-- PMM

