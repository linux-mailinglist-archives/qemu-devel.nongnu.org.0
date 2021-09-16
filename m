Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDE40D9FD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:34:13 +0200 (CEST)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqai-0004SH-Uo
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:34:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqWl-0002ab-Uo
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:30:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqWc-0007oE-CK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:30:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id d21so9170559wra.12
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CuxBkAJqqE4XRo8Zx7tw/oIvnPQCBtEbGYRJ/wbvGEE=;
 b=dKC2iLjQRfItpLeI6CNe2EQfJ9azXmP19coaCLtVTfAW6EH33SHCg1bzbZMLhTxT2B
 aVrZJNo3Uq7Imn7k7loXEhBgHqddIJCMOHNmw9wRPUDSZTMrOx0XMC5scam9/t76yewU
 WJZkhJcT/b59RGkeXg4eihl14eNzHof4e2aTLXTKfVqmso9RQ8J2qJjQ7yd7k8vPfcx+
 SzaYLqKV25a0+Z9vUtQovebeTx6l4xyzjAkV8sKCyiDESk0EcDnSWDG0gTlA9cO8OYBt
 mUv8BwmXoNhQVV5+T93Z4hl11YFatY7GHhMS8nxiwDCSAeg2ZT70A4OO3k5uCatfBVuP
 Qv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CuxBkAJqqE4XRo8Zx7tw/oIvnPQCBtEbGYRJ/wbvGEE=;
 b=1Sv/CxWHrQHFKeVLezAzIWtZmAbwlRWis857zI2nvl5wdTekEIQqV+vS5AmqU5C+Sp
 4O2I7asHdfCsU+F/ku1JUZuwthjnviulc5k2QBVx0sc6Hn1IapYd+mWHsmjgPcpg/26w
 OyEProaT/gXD0QiDD913aNFM7QEMPDrXyCwGbaXvCEKYpjg27CEJgdTWH8OU3HgocAaq
 b/2gqTeC9E09SD9YmIE05mcli6zJ5wZ0FwtqntHt4xjkghAhc3iridNqWwTEd0MGCPHc
 iXJZ/o/HZ7OCNOa9iZd/Hhv1ACfzLMGVISrDBT+A7bvj7ZDxRDgrMzsMpWz9ripCGc8n
 4F1w==
X-Gm-Message-State: AOAM5309JvAQ/70zemK+tj9945xWhvZJ1kskTQn7d0oARnU+sfmt753P
 iBl4K7yPuB0p7fGj5jwd3RNo5wgMEifAFS/uVqNVDxWTO0A=
X-Google-Smtp-Source: ABdhPJyL83qhthB170HOF7XXxhj1lyG35UdpOSIh1UY7GCNBGzF7SDeU54qeSnpkcodtitrqJ+xDxzScVL31zNWeVqA=
X-Received: by 2002:adf:f185:: with SMTP id h5mr5876721wro.302.1631795395668; 
 Thu, 16 Sep 2021 05:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-11-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:29:04 +0100
Message-ID: <CAFEAcA-QE0V4wkQeor0jZm3n13GkrHzT3z_2xwWwGnhHpYo2Pg@mail.gmail.com>
Subject: Re: [PATCH v11 10/10] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

