Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A80567B310
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:13:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKefH-0003YS-Un; Wed, 25 Jan 2023 07:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKefF-0003XN-Kl
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:14:05 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKefD-0007wd-Nv
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 07:14:05 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h12so12847372wrv.10
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 04:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rn2nY+ltckL/Mu2HykNzQ4ItNDcSSA4bLTDc9nzYREU=;
 b=o8eVf2szFH4lGql5a79SRVBwmNOB/OIFMHYw2DgCEKpTQoOY+1Y754Zu0UN5nmLTR9
 yCyp/Yjj0mErrRToYW+g4gFRTHXCB7w+um98v108lzxJRg7WLtiYv/2LorNMvTO1ytXL
 lyqq5NFq+YE6HZV9+jHxOzCwrr7mbGbx+OR82SaiHWCoUzPwZHvCupaSrw91GUT2F1UF
 O4W9uwEiXqiWuNPAcwAUbepPIR3XBye2OdnOUK7Cye+LrVEqiWzKUelrq1Zqd4VpN/H9
 7ebs841udGCcnLQ0eHovJmK2mL/FxH3o/y74rrboHe2tjXUbSDrhKAA4ycQI2EVXciVr
 q5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rn2nY+ltckL/Mu2HykNzQ4ItNDcSSA4bLTDc9nzYREU=;
 b=NwPHZ42KtQnnw/80vPvxQQ5WbsdWFjNVJ+GJ3THH8/okJ+ll3OyAhLyebFKsvuk+Dz
 /Fxwdu6UVZZosauZuImOj9EFjSrK1oG45JGKcMVmW3+SmwVcfRdBKQqcctVNmxmd6rIn
 RTKHtPGu52QlVjiPwU6pEp7eYnfnA3K186i2b3ZmfRwfgfh/JOr0thE3T9gv8DHKshAg
 TqBcH/W8T8TizY6mjbcqSSL3a+XM7ziUPw6D1i/pbsxbdLIeZzA9sS7eLOTgWv01SvF3
 M+xZcAF9sHxH86h239qZepdp/gSkeCbJXraJNv0O3EXSQX/QPj1HDlfzA4+MyLQvfj9J
 jEdw==
X-Gm-Message-State: AFqh2kpGutHRcrXPYB01p1r8NkzL8l9zeX64eqlYHmi0YDjjoONtVNKV
 rwc2lfU1SPP7xfHsN2tsrAuNyw==
X-Google-Smtp-Source: AMrXdXu4Gwt/+Tw5KUELUP0dB0zv3Znwl5ESMx3Pzt+eEhu2tgqxl9FsLoRg4Ps2OtTOq3TelmUl1Q==
X-Received: by 2002:adf:dd01:0:b0:289:773c:59ee with SMTP id
 a1-20020adfdd01000000b00289773c59eemr25932818wrm.6.1674648841932; 
 Wed, 25 Jan 2023 04:14:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d6acd000000b002bc7f64efa3sm4160252wrw.29.2023.01.25.04.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 04:14:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3DF21FFB7;
 Wed, 25 Jan 2023 12:14:00 +0000 (GMT)
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth
 <thuth@redhat.com>, qemu-arm@nongnu.org, Niek Linnenbank
 <nieklinnenbank@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>, Rob Herring
 <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka
 <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU)
 by object_new(ARMCPU)
Date: Wed, 25 Jan 2023 11:58:23 +0000
In-reply-to: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Message-ID: <87sffyreuv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
>>
>> Replace the ARMCPU field in DigicState by a reference to
>> an allocated ARMCPU. Instead of initializing the field
>> with object_initialize(), allocate it with object_new().
>>
>> As we don't access ARMCPU internal fields or size, we can
>> move digic.c from arm_ss[] to the more generic softmmu_ss[].
>
> I'm not really a fan of this, because it moves away
> from a standard coding pattern we've been using for
> new QOM 'container' devices, where all the sub-components
> of the device are structs embedded in the device's own
> struct. This is as opposed to the old style which tended
> to use "allocate memory for the sub-component and have
> pointers to it". It means the CPU object is now being
> treated differently from all the timers, UARTs, etc.

I think you can certainly make the argument that CPU's have always been
treated separately because we pass it around as an anonymous pointer all
the time. We currently can't support two concrete CPU types in the same
structure. For example zyncmp has:

  struct XlnxZynqMPState {
      /*< private >*/
      DeviceState parent_obj;

      /*< public >*/
      CPUClusterState apu_cluster;
      CPUClusterState rpu_cluster;
      ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
      ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];

which only works because A/R cpus are the same underlying type. However
when we want to add Microblaze how would we do it?

Is the main problem preventing us from including multiple cpu.h
definitions that we overload CPUArch and CPUArchState? What are the
implications if we convert them to fully anonymous pointer types?

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

