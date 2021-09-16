Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FCE40D9ED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:29:37 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqWG-0001Fp-V8
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqV4-0000NG-4l
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:28:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqV0-0006rv-Tl
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:28:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id i23so9234865wrb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYaVzc3bsBvi8u7PdMACZ4Dg2H84QKVVlZpDhjNAW/Y=;
 b=Mh1HiIHdHpcYyd7dMgpWJSBrHJMU94ahWOcXx7h+YKdJfyJcgpqf3ruGneF5pIUeNY
 jHM7ESz5P5f3/Hxv2wyOdMM6aaWL3H2anvBn8ldaYEOZkh0sD0Lc2txtiaWuXzJQC8ZC
 6CTHyY06CoafxZRUdGJ7VvQ7dK/pfNhuKhSWIIIErkN18OhH2MSpR8D0UoDeQEYHYCh1
 Ile+pgUf3y1CsChBmPpK7rz2VoYRJsRAGK068wdx9sSd6fHZTMlPJPG1ZLTnizTFRbEt
 j7/X5a6rAr5i5I2HoH1gnEjxNyDYZTY8IUJqyWXMgfUykw40PfMuhhb6uSD1Ouq60jC6
 NwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYaVzc3bsBvi8u7PdMACZ4Dg2H84QKVVlZpDhjNAW/Y=;
 b=aq37vQeTw+zLQttMd9DWFp66CZ5B1HD+WBKE6N0qmqRtB/S1EXtawMcd44yaFzKkG5
 wZEMm779IqBCW6h6LAycEG2laF5sxprcZuo2bgQzNOEDO9sjcKKu/F0De5huw9qCigv9
 5PBinIqRjFCEkuASNqpDKTC3imICimAKQzMA06BRow2dQ202/xEN6nYewozTZIPJqOR1
 hH/i3zASbC2oTiHnsNNqVqTTpWnpxIfPVQWX+4AEwjNl1s7X3mqyJ4e50HARJcVUl1b4
 aI3R49IyRnfnMmoO+rs03BXZNtkpla74NVjX0GODfjrMJuCvraXkZVuDTPumzIkRcs6q
 lGWQ==
X-Gm-Message-State: AOAM5325ykQjssSIKZ9ueNqUSKXjGQge+7qTgJoWYzPDkmCNnVeEUPhc
 V2XA8b23CgB8XWJU8+R2rI8uq2JOpKP7wbzaIC3O5Q==
X-Google-Smtp-Source: ABdhPJyd3uzIiaL/g/+H/62PywcsfHXK5lgLJQGEh5b6MTYUBH4U0CzLSaMqqgVSMI1rmATnW076h858zE29B7phRSo=
X-Received: by 2002:adf:f185:: with SMTP id h5mr5869605wro.302.1631795296673; 
 Thu, 16 Sep 2021 05:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-8-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:27:25 +0100
Message-ID: <CAFEAcA9JWdh_y4SPtnNOdywLkyN-L4vAqfic_LsxtgCgdTSyPQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/10] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We need to handle PSCI calls. Most of the TCG code works for us,
> but we can simplify it to only handle aa64 mode and we need to
> handle SUSPEND differently.
>
> This patch takes the TCG code as template and duplicates it in HVF.
>
> To tell the guest that we support PSCI 0.2 now, update the check in
> arm_cpu_initfn() as well.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

> +    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        /* QEMU reset and shutdown are async requests, but PSCI
> +         * mandates that we never return from the reset/shutdown
> +         * call, so power the CPU off now so it doesn't execute
> +         * anything further.
> +         */

QEMU coding standard wants the opening "/*" of a block comment on its
own line.

> @@ -898,14 +1011,29 @@ int hvf_vcpu_exec(CPUState *cpu)
>          break;
>      case EC_AA64_HVC:
>          cpu_synchronize_state(cpu);
> -        trace_hvf_unknown_hvf(env->xregs[0]);
> -        /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> -        env->xregs[0] = -1;
> +        if ((arm_cpu->psci_conduit != QEMU_PSCI_CONDUIT_HVC) ||
> +            !hvf_handle_psci_call(cpu)) {
> +            trace_hvf_unknown_hvf(env->xregs[0]);
> +            /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> +            env->xregs[0] = -1;
> +        }
>          break;
>      case EC_AA64_SMC:
>          cpu_synchronize_state(cpu);
> -        trace_hvf_unknown_smc(env->xregs[0]);
> -        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +
> +        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
> +            advance_pc = true;
> +
> +            if (!hvf_handle_psci_call(cpu)) {
> +                trace_hvf_unknown_smc(env->xregs[0]);
> +                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> +                env->xregs[0] = -1;
> +            }
> +        } else {
> +            trace_hvf_unknown_smc(env->xregs[0]);
> +            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +        }

We seem to have ended up with an odd asymmetry in the way the
code for HVC and SMC has been structured.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

