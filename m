Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA6B2C5D9E
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:48:43 +0100 (CET)
Received: from localhost ([::1]:52996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiP86-00007o-Ku
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiP7E-00082N-LT
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:47:48 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiP7B-0004s3-Up
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 16:47:48 -0500
Received: by mail-ed1-x541.google.com with SMTP id y4so3705594edy.5
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 13:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DttXur++On+IvHWUrI5foPQFwrfhjzniznKAB6nVKy4=;
 b=iBLH3L8OmdsivWaan/fYFxVIcih9Pztek54UAeUDwuuIQowhRxCjwLv4wa04sevVbd
 wts+qGJf99SEYpy8SKkmY4MpBMnF8VXhaYJD9RuspQzJaV9tpmyT824c0Wdd8z7NPqwh
 6N0bWJa1BMyc4g3+UinEdpnT/BvucEQcxiEPn/E51YT7BYoH2UJyK2v6V/nV6VqaALgD
 Ei4x+TukjCdy+drbvNTUg0OKy0zWi1syBkhtEdawEJE6DnNXIPNyBD3KNgIKDmCzBM0X
 kHB8O30tCQ72HYdtmiRlNUVBWKBeDYdpVhqrscyCXsM4+OAEBzjcWMD6xSR3eGBjnwVU
 rvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DttXur++On+IvHWUrI5foPQFwrfhjzniznKAB6nVKy4=;
 b=oMWv9ZVsgnIUDNl1hnOox/hGs+FsR3OJ+UAPHKjoAXTLnV6laUqevwlehtKdpUs1Sf
 /f7toO3MwSJMWcrzsw5t6wGgjwILh2MaQwnpzr79KkcPqGFdJklClJdaWYQxqrAjEnIV
 KP50LtgP0LPyOwH22xQRgb/uecAX/lYYdwzv2sQHFzBujQgYDF2ELAOxqLLysA0Kzl6D
 MNDyGWE4SVUdtbU2j/EssKdlJhWkYbQjIRvelK1gFTAiUX5KeToLRkk6u7FX/UuvLnZ6
 Ul2Ejmz8f7OrSIOGZxda/dZe0N4cjD1b2wYZ1j0EXCAaIJy7aKp0ei4ZCiIgzvVLWzJa
 GEbw==
X-Gm-Message-State: AOAM533y4fVkMl7rf997Fh2TtXWcLzAgNyLNHgW/ilf0QGcgE3eded+x
 M8Mf/0kTiq5cgkMiAUJR5nbDEuMxPeNW40mO37vZaQ==
X-Google-Smtp-Source: ABdhPJyCydBSClVAzN/DPOk8IAsHGNgqLyi1dQgoPO0iI5lrk6xkm4IKODM05jN8yaLnVIO3ixfjVDHX66XsfwmeIEA=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr4389585edt.36.1606427263662;
 Thu, 26 Nov 2020 13:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
In-Reply-To: <20201126213600.40654-5-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 21:47:32 +0000
Message-ID: <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 21:36, Alexander Graf <agraf@csgraf.de> wrote:
>
> We are going to reuse the TCG PSCI code for HVF. This however means that we
> need to ensure that CPU register state is synchronized properly between the
> two worlds.
>
> So let's make sure that at least on the PSCI on call, the secondary core gets
> to sync its registers after reset, so that changes also propagate.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/arm-powerctl.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index b75f813b40..256f7cfdcd 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -15,6 +15,7 @@
>  #include "arm-powerctl.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
> +#include "sysemu/hw_accel.h"
>
>  #ifndef DEBUG_ARM_POWERCTL
>  #define DEBUG_ARM_POWERCTL 0
> @@ -66,6 +67,8 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>      cpu_reset(target_cpu_state);
>      target_cpu_state->halted = 0;
>
> +    cpu_synchronize_state(target_cpu_state);
> +
>      if (info->target_aa64) {
>          if ((info->target_el < 3) && arm_feature(&target_cpu->env,
>                                                   ARM_FEATURE_EL3))

This looks weird. The CPU was off, so not running anything.
Why doesn't the state we set up here get synchronized to
HVF as part of the normal enter-guest-code process that we
do when we do whatever HVF's equivalent of KVM_RUN is ?

Also, we change more bits of CPU state later in this function,
so if we do need to manually sychronize in this function this
doesn't seem like the right place...

thanks
-- PMM

