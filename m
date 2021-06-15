Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4713A7AAE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:33:16 +0200 (CEST)
Received: from localhost ([::1]:33690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5Rb-0003Lr-Ou
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Q5-0002NZ-OW
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:31:41 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Q3-0001rn-T8
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:31:41 -0400
Received: by mail-ed1-x533.google.com with SMTP id b11so50178616edy.4
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhnyIJSVX8uEKXtyoOSwoavjixcHE5JLLaNhBIG+ZWU=;
 b=jLtmpgIOgetNOqQ7SyMso3152gDht20LL5E4mkTyPxhte7B/CVQuhhJn9I2NRehGrr
 gHNeQbG+FwHpe+cKLoSH+8nZN2f6W/E7rIqq04Kep8olqX+HE4sN9hiBLSxoJuwmLEBs
 P5TbmohkKLBNpRIdmK3EXpgvilZneqoLuBoai7Vz0Jb/gaCud6w55VUAyY92CcMPZZgw
 8eMxx8RNv6GpASW1wZ8QcJ+jYM9wsTLafLSEVQxHY4sNCJmoEk9yM2bd9RWd2OXHxmUP
 /MhLu+hcp8QPixTVr8Hs++DiVF/DXLUAnXAWikZqlg+jJxhHq5mXhvQT0Mv9jaHifvB1
 lJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhnyIJSVX8uEKXtyoOSwoavjixcHE5JLLaNhBIG+ZWU=;
 b=CNerZeJOxEXsjtIJtC/SH/emU6NDq4JYpvdr410ARqGiwRz8sgDOPu0o7pER62F7yR
 rUX5to1IgF6xWabbhVidWer60oX9xVMLq41RMH2/Q2fe9Q1NziQALFCTq6y5bmQ2YfgI
 Vk9o2AwHji7vfqgdcHDeT3xeAQcFdpmmOEhLTAh/POZzi9jwTdPlBKHzrcgOG9TUo2vr
 XpqjP+MHp5OMNdBLKYRd/7kPjx1lbjacchw8iFTKZ/rU3aKm1B584SOVa52pleja3zjU
 nFXuVfWfrP1prHdJDDgLDEV4Lmna/9jS3yLUksyYflKfo7wV2z0yQSeg0E76MRh+Qc/Y
 Pq5w==
X-Gm-Message-State: AOAM532bvNm0Yy1tvT0oQY89FHv7qMNtfz3zKxixANSd+x6kf2MDbh9V
 cb00MW0tjPFl1kZNJq2Lq7MZRMwQaSKMN5bThd/xJA==
X-Google-Smtp-Source: ABdhPJxpcbkXoMICMXhNXObXC06zjw6JIA5+uRwe8GDYIUjlXbpJviNjo0hqPxDRF5taRA9KtHLm+2cpEidMgRlPoBs=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr22366203eds.146.1623749498257; 
 Tue, 15 Jun 2021 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-20-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-20-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:31:03 +0100
Message-ID: <CAFEAcA880Kgb5GtKEQQpnD=fAwfm1Cs1Sjfc4L5S0ETkjm-CWA@mail.gmail.com>
Subject: Re: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>
> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
> including this one. However, Windows breaks on boot when we do this. Instead,
> let's return an error code.
>
> With this patch applied I can successfully boot the current Windows 10
> Insider Preview in HVF.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v7 -> v8:
>
>   - fix checkpatch
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 65c33e2a14..be670af578 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -931,6 +931,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>          cpu_synchronize_state(cpu);
>          if (!hvf_handle_psci_call(cpu)) {
>              advance_pc = true;
> +        } else if (env->xregs[0] == QEMU_SMCCC_TC_WINDOWS10_BOOT) {
> +            /* This special SMC is called by Windows 10 on boot. Return error */
> +            env->xregs[0] = -1;
> +            advance_pc = true;
>          } else {
>              trace_hvf_unknown_smc(env->xregs[0]);
>              hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());

Where can I find documentation on what this SMC call is and what
it's supposed to do ?

thanks
-- PMM

