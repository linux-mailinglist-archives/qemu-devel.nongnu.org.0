Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6EF4087BE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 11:06:27 +0200 (CEST)
Received: from localhost ([::1]:47972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhv0-00036R-J9
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 05:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhkK-000130-2B
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:55:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhkG-00027h-BU
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:55:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so13427871wrn.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1c2/lceSHhulHQ3IFfXauC+rXyjeaXeZ0GjcuFQNEw=;
 b=iIu9h/k68X9a715NXjqNQCjfjRU5FRt2ixlAqEz/kOy5YmePyJg9zjEfBjbBG1DJM/
 AzJfoY3d6rwz+Az+4mT1X1My7e4bVqk/iQ0GyRsN4CZ51RXq2iudY0+jlCHa6BByXVsX
 Nihcl0vyC4kPY21qOlE9aAYu6Xlqk318WAgOiQw3Xv0UHzrJM2uVmD5nneDr4wr8LWix
 4DJWq3pCgsGvEfI4lQxoU8kZgm4ZRtCJ0N2YU/MChizIHQoOjbBCpDkiJ4KNQ5nApB5u
 WZ2cum1c0g3xZdDZUTB3Qq5CQLrkvqWTxO/4j/SOCOlOAq0ldfb9dFzgPnWutJlFWM06
 SmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1c2/lceSHhulHQ3IFfXauC+rXyjeaXeZ0GjcuFQNEw=;
 b=qbL0oC2l9mYIykThq1Adse/upYplC1JvrUnzO5UqIWgwzbal5riuYC/NkZBpdI1ZWZ
 wWrMKuKoVzJJgPK3UxMs//aQ/W3pMScfmfF0AGt7paW6JZH8P4G5JsKKHNMeFrfWZm1j
 yHvrNHZTFTOYSw304z/Af5piw24aHoFxFt3MwmrDwaU1IsGMb2HDzv1GTXwQWacd0YVU
 CLBV1m6c6liQ8tIhGFiYzNvZeykFGAnOjvfCWJmd9zDNJVhJ89l+nEouZI0xWlq05yXU
 /JFCj+ETQsA75lcyyDrk1JalS0Mc4AwhwRh/uZEoS3bSPqNKAjl5U4fg8xW2O+7rRsiQ
 H5zw==
X-Gm-Message-State: AOAM533nV+/KGoG60i/hoQ3enyTA2nV8UlClK622EraLEIRjDIEPuCvv
 criCTlJv9pPp91HLD5qkJTmwa5JDEGvGKLxmq2YJRg==
X-Google-Smtp-Source: ABdhPJyDgq/OKfn9bor4Q5K6oSRIrRaMljYzXvYJDbxJZ45s+nv/Z00BL16X18zjGjIzsJkv/yUrE4c+idlw2o2EDJc=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr11012380wrq.263.1631523318882; 
 Mon, 13 Sep 2021 01:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-8-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:54:28 +0100
Message-ID: <CAFEAcA8BybrfxNxkWbEjxji4DvDumr6Otb_RK_f84Dt_TWXfpA@mail.gmail.com>
Subject: Re: [PATCH v9 07/11] hvf: arm: Implement PSCI handling
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

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
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
>
> ---
>
> v6 -> v7:
>
>   - This patch integrates "arm: Set PSCI to 0.2 for HVF"
>
> v7 -> v8:
>
>   - Do not advance for HVC, PC is already updated by hvf
>   - Fix checkpatch error
>
> v8 -> v9:
>
>   - Use new hvf_raise_exception() prototype
>   - Make cpu_off function void
>   - Add comment about return value, use -1 for "not found"
>   - Remove cpu_synchronize_state() when halted
> ---
>  target/arm/cpu.c            |   4 +-
>  target/arm/hvf/hvf.c        | 127 ++++++++++++++++++++++++++++++++++--
>  target/arm/hvf/trace-events |   1 +
>  3 files changed, 126 insertions(+), 6 deletions(-)

Something in here should be checking whether the insn the guest
used matches the PSCI conduit configured for the VM, ie
what arm_is_psci_call() does after your patch 10.

-- PMM

