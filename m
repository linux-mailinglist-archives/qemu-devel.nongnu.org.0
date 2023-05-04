Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1A96F718A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:51:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpQ-0000ec-IO; Thu, 04 May 2023 13:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puYNP-0005rZ-U6
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:48:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1puYNO-0002VS-6i
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:48:03 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso4551825e9.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 05:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683204480; x=1685796480;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Y9RtzxHz2uJtd85gOiV7+07348jFZKXTSNCxiiZlEE=;
 b=y+WS02A/whwZz9Fdr1aff2724iBm1WLxdlb6YVs2OOvyPHvIvFpaV0P73rhiFKsWF2
 i5H/8IGT+0WL8elQGmCBksTjvSHusDDrIsmQv868prqF52ami6FaeyRw++syVTIninTk
 KnCytbvgMmpPZYiR0j66/hkOtHNP6G8FmZTHtqf/PNPCKvPjvsnIwMgObk+trdZzfulT
 +Z5sZLSRHC1A1taQIEoGTSoxh8UZk8b6Q4uOUEgDe0r2YKZ5BtxWPuKNoSPtRMqSMyBY
 qSftVIGugSwELsC/IPY7og6LJLYVZQhABVVlL3PDb2Vi+DyTZ/p8/X0+EAnMof+o75U3
 Nm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683204480; x=1685796480;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8Y9RtzxHz2uJtd85gOiV7+07348jFZKXTSNCxiiZlEE=;
 b=OxXpPrAbJT5F1Rs5jL+W8KhTdpQMrfVUFvJdb6vFXrn5bHz4w8hqhQE5thNg5vgyGI
 IkhjYMrHY6N3t8aD8vaM6Qa3MvUqY6wg5HnjLOLC4tDdoGRQJpJztu1bdsksUWVtyMsR
 LczZG5/lwSj3OhFYqRSsXbR4q0KafevloD6gjNyX+Vl/ZafVqRpCVfz59fud6LvF0iM6
 zbdoEWb5nbs90t49YBVoLRsSyPqLKamLr4/kyiZuqzzJ2a7iU0sr3ZUEMeqquH9NLkcN
 LF1dFmR1k0aUYryZvn8z0BLcWJwyH0+VmcshtAtqGP1LCbn9FZWohqmgkcj/RcAAlWBD
 lPHQ==
X-Gm-Message-State: AC+VfDxWkpYuxhHxwXDCsWODkOIvCMbkWvvuH0Fbt8mks2iT3XezpU8Y
 PXMuIHnEJL/EMnd3WkJPEVM1Qw==
X-Google-Smtp-Source: ACHHUZ71M85dPZO97/fSUMBpcGYv7E4KBzJVfe77FuVmtvDyY8smt8H7v8VjM7DUPYpMvqctmSD3Ag==
X-Received: by 2002:a05:600c:215:b0:3f1:6757:6245 with SMTP id
 21-20020a05600c021500b003f167576245mr17064504wmi.7.1683204479649; 
 Thu, 04 May 2023 05:47:59 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b003edef091b17sm4871686wmk.37.2023.05.04.05.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 05:47:59 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D1FEE1FFBA;
 Thu,  4 May 2023 13:47:58 +0100 (BST)
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG
 for semihosting
Date: Thu, 04 May 2023 13:32:58 +0100
In-reply-to: <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
Message-ID: <87cz3gs1oh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 5/3/23 21:38, Fabiano Rosas wrote:
>> When building --without-default-devices, the semihosting code will not
>> be available, so check the proper config.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>
> for this change; however, there are two more related issues:
>
> 1) you still want to leave out the code if !TCG, because KVM is not able
> to exit to userspace on semihosting calls as far as I understand

Correct.

> 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy appears in
> config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.

I think we need to be clearer in the development guide when things are
triggered by config/devices/ and when they are triggered by default
rules in Kconfig.

After Fabino's series the delta between
config/aarch64-softmmu/minimal.mk and config/aarch64-softmmu/default.mk
is pretty small.

I guess minimal.mk should be renamed to virt.mk, sbsa-ref dropped from
it (as you can't run it under KVM) and what controls which devices the
virt platform can use?

Should it be:

CONFIG_PCI_DEVICES=3Dy
CONFIG_VIRTIO_PCI=3Dy

to ensure we can plug and play all the various VirtIO bits we need for
the KVM/Xen use case?

>
> Putting things together you also need something like
>
> diff --git a/semihosting/Kconfig b/semihosting/Kconfig
> index eaf3a20ef5b2..671020a33426 100644
> --- a/semihosting/Kconfig
> +++ b/semihosting/Kconfig
> @@ -4,4 +4,5 @@ config SEMIHOSTING
>    config ARM_COMPATIBLE_SEMIHOSTING
>         bool
> +       default y if (ARM && TCG) || RISCV32 || RISCV64
>         select SEMIHOSTING
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/ar=
m-softmmu/default.mak
> index 1b49a7830c7e..5e7a17d05bf8 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -41,5 +41,4 @@ CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
>  CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/configs/devices/riscv32-softmmu/default.mak b/configs/device=
s/riscv32-softmmu/default.mak
> index d847bd5692ec..94a236c9c25b 100644
> --- a/configs/devices/riscv32-softmmu/default.mak
> +++ b/configs/devices/riscv32-softmmu/default.mak
> @@ -3,8 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>    # Boards:
>  #
> diff --git a/configs/devices/riscv64-softmmu/default.mak b/configs/device=
s/riscv64-softmmu/default.mak
> index bc69301fa4a6..3f6805944849 100644
> --- a/configs/devices/riscv64-softmmu/default.mak
> +++ b/configs/devices/riscv64-softmmu/default.mak
> @@ -3,8 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_SEMIHOSTING=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>    # Boards:
>  #
>
> Paolo
>
>> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-o=
nly build")
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
>> ---
>>   target/arm/helper.c       | 4 ++--
>>   target/arm/tcg/m_helper.c | 2 +-
>>   2 files changed, 3 insertions(+), 3 deletions(-)


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

