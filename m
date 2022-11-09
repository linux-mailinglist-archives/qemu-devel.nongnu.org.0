Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D2622AA5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 12:37:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osjMW-0008KY-Rc; Wed, 09 Nov 2022 06:35:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1osjMU-0008IO-Pi; Wed, 09 Nov 2022 06:35:18 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1osjMI-00071O-H2; Wed, 09 Nov 2022 06:35:18 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 ja4-20020a05600c556400b003cf6e77f89cso2519842wmb.0; 
 Wed, 09 Nov 2022 03:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FPx0waf55UEgZwXyqqagdDKJJCFfsMAc8aLtD5HI970=;
 b=FbGtY/B8puhYAYRst3EpLz5SEC/sGRl3tr++X9AY5e5FuToXU1YcGwFXS4xzjtt3Fa
 gLoamp0SReNVrF8ppi0Utfd3WmMokgnbDlNyFjt1beoP7mHpxCfU/H6rePYfxJ3yAGjq
 0uDZxjXQ2mk7oN3jbYufHTH2VhO4kpdEqGLsSxazlD9Duoh7qrmXzdBooMs+98YaYZwA
 iQuSWBusoHc2dtHKANY+jNZNrbytx8uaj3LOaU1sSgiSQ0ZK+DINOL9ZI983HXQgD9Nu
 bZomOv1Xe1P4ecbSKKSWizPNNC1Im3JwqPUJ6Qkfs4Pu2DJyWvAvhRi9jtP3G4fSocH/
 +gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FPx0waf55UEgZwXyqqagdDKJJCFfsMAc8aLtD5HI970=;
 b=t7MgynOtwaGJqULRt2FwbadM1FFFd3NvAT2QZrpKgPwplBAlajz6aVQnE7ynPtz4/z
 MHYCKPMWv0YcG7ZHkzEQwBiqjeQwOsX9Md5n9qrn/Z6bw+wwRfcn0z5CWZJLrwW1aN3v
 PQEvbdWvpy5tla6NVLsQPe4eRiULaFkCWWSKYEvT0e92WIkOYYUaj2+4MGs1xPLNcla5
 Hm+AbDsrZLl9sZAz/B4bWdB3HW8P2eJKSyDNG1Y3R/kvgOGmrx0nJ54IEdPGtbSCTAdz
 6/vn0Fia/libu0lnpEx6OBQKljrDXmVcJW54wIqgqwt3ERX7NXMJTMeX/HYpZ7AaHaqu
 F5fw==
X-Gm-Message-State: ACrzQf2RGjvjmh38lbEeUNtcDTx4KHML3MRzaaOaW9Z8VsBPEh5FX5ba
 6GYc2d6Dtdafw7830tHbgJeV9u+k0tUMGQOaD1I=
X-Google-Smtp-Source: AMsMyM45MTwl5lMlh1d8ui60xgw4kbx9TuRE3pjvXi1GyWL4cL/pOozIyFBG8xdvMhPqu3/HKwDu5QQaoDhban4Ogjo=
X-Received: by 2002:a1c:19c4:0:b0:3b4:a1da:76c3 with SMTP id
 187-20020a1c19c4000000b003b4a1da76c3mr49788239wmz.106.1667993703957; Wed, 09
 Nov 2022 03:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
 <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
 <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
In-Reply-To: <CAFEAcA9jVVQhouS7uhmh+gMs328M_0r9Nz3npzrbmBoVhS+=TA@mail.gmail.com>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Wed, 9 Nov 2022 12:34:53 +0100
Message-ID: <CAF8_6KmzX=wbGwoYstC7OAJqTnXK0DKiFXM435hcFqszm7+4QQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>, qemu-devel@nongnu.org, dirty@apple.com, 
 r.bolshakov@yadro.com, "open list:ARM cores" <qemu-arm@nongnu.org>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> In my version, I added the sw breakpoints to `hvf_vcpu_state` so they would
> follow each CPU, but it's effectively a copy of the global set of breakpoints.

Ah, I missed this field, and it seems the proper one to use. I'll switch
to this.

> Moving it to `hvf_arch_update_guest_debug` would probably be best. Having it in
> `hvf_arch_init_vcpu` would mean that it's always enabled. In some corner-cases,
> that might have an adverse effect.

I agree, I'll move it to 'hvf_arch_update_guest_debug()'.

> I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
> documentation, you should subtract 1 instead, given the value 0 is reserved:
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index dbc3605f6d..80a583cbd1 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
> {
> ARMCPU *arm_cpu = ARM_CPU(cpu);
>
> - max_hw_bps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
> + max_hw_bps = extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
> hw_breakpoints =
> g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
>
> - max_hw_wps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
> + max_hw_wps = extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
> hw_watchpoints =
> g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
> return;
>
> But the documentation is a bit ambiguous on that. Maybe we can test it?

I tested this again and indeed adding 1 is correct. Thanks Peter for
also pointing out 'arm_num_brps()' and 'arm_num_wrps()', I'll switch to
those.

