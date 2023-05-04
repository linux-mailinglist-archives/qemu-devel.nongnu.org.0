Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0416F67DE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:59:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUnv-0004ji-Q3; Thu, 04 May 2023 04:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puUnm-0004j5-Ud
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:59:02 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puUnl-0004GE-DD
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:59:02 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5083bd8e226so220785a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 01:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683190739; x=1685782739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R3mSHr8LX8Jlb3iO3WxDX0U5YHuTcyztxi8aDXDMHVk=;
 b=W53RnxM4qKooiKf0a1E1rtSMY3H/E6ZGPet1wQC6m0pTURLs4qkPqCyMRSBOGHUH6Y
 wcB3Na6pgyA/N5iPa8aHwkm/hm6sc7Jhyd0hsEgy9G1v3oOtQt8DpkiUCFHz7rrrOgJ4
 SoVmZgxRy661OrycHvvdIW3G+nSUGWqCp0IwCa9QQqdycJIqkvSLWGaFzTyb3mv/9v6e
 kwO4yaPmpmTgYyYGwOPpwdf7GEPmCpeci5fuGYips3ostq+AvRXfWk2bV2nGdCan4atr
 hQppMXDCbXF2V8vMoz2+QKYG+pwPkhcGAVhQgZognIem/U5X2X6z5EUMdvGjQvv7Kbls
 G+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683190739; x=1685782739;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R3mSHr8LX8Jlb3iO3WxDX0U5YHuTcyztxi8aDXDMHVk=;
 b=PMoZ9EEvJlUVq2VRska08jWq1mPPoLaGa3gEho2KSrNVS8e99Ai6SG1SbG/UG5Uix1
 975B28yZdj+PRqmb6gR3YCBjIRUvngNbIOSdOFTMIhaBJwShPUdiU4BzLsxReOawRguf
 /QE71jhFfkimy8uaON1NTBQG/herU3c235GPA7YOT6EMbn/qbYk6Lq7TZvTObEyUCIO0
 z/Ij1VrudKZJSO9CKJ33MUYCFUPaIZZnwwi1CZ9oUbHqVSU/ZQ7YhmxF/sC+roJuf7Jj
 VaPnCwuC8J8x+W/KwdlFQaMm9i+T5AlCyGCYw4TB3J943dtiJpXfpPzP/tn+BEYvhazD
 eJXg==
X-Gm-Message-State: AC+VfDyMnDH8yvoEhM7Aw0ubZG7JleV38+mKO33qbO7W3AnZG0vtpF8P
 LJCc17F2acck0rweTCakeINoipJeFrJDMFpBTuwf7w==
X-Google-Smtp-Source: ACHHUZ7m35qj2uFEcMJ185kiR1wA9Y97qR2kWkJ/eiuIPegHBm9xaHB9FLpFyyQC8ug/RI3E5z13Q/KaWa+YsBS/BRU=
X-Received: by 2002:aa7:dac2:0:b0:506:bc26:d6a9 with SMTP id
 x2-20020aa7dac2000000b00506bc26d6a9mr1177720eds.8.1683190738910; Thu, 04 May
 2023 01:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
In-Reply-To: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 09:58:47 +0100
Message-ID: <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG for
 semihosting
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 5/3/23 21:38, Fabiano Rosas wrote:
> > When building --without-default-devices, the semihosting code will not
> > be available, so check the proper config.

I think the changes to the ifdeffery are conceptually
fine (only do semihosting if it was configured in), but
it sounds like there's a separate problem here.
Whether we need semihosting depends on the accelerator (ie
"is it TCG or not"), not on what set of devices we're building.
So the problem seems to me to be that --without-default-devices
is causing the semihosting code not to be built in.

> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> for this change; however, there are two more related issues:
>
> 1) you still want to leave out the code if !TCG, because KVM is not able
> to exit to userspace on semihosting calls as far as I understand
>
> 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
> config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

Because those are the architectures which have
"arm-compatible" semihosting ABIs ?

-- PMM

