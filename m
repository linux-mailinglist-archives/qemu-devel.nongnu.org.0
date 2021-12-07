Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E82D46BD8A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 15:24:53 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mubOm-00077z-1V
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 09:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mubLM-0005Ir-Ex
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:21:20 -0500
Received: from [2a00:1450:4864:20::430] (port=40929
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mubLK-0003gE-Qo
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 09:21:20 -0500
Received: by mail-wr1-x430.google.com with SMTP id t9so29796768wrx.7
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 06:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m70ivHZrGLjiucxSRk+L68pGwtbi/W1C+9qD32cGhvA=;
 b=TEKtQnjQnpRapN4EwQMIGsIBzAbBiSQppP1pwMEPcY0evKNjwVv5mhdDxb1133zct5
 bj7u3CizuY2xNOjTw3tN+Hq0gJuZlU8RbQEwvmpR+cj3la7L5qf+WiiwW6Ay6QYZvrfc
 oN/4CP1dHBdMrKRnyCG0T+d6fNLHbnTA34oIgVuVJ5eF8UnVl22MxrHW4wOf92NgTwOS
 NvW7w/hFNSbJA3jDzOsAaCKZ8ep2epg6k/XVfYU23RB4zEiERTjG6OkvzSqMai2Xkne1
 5rJ8Ixagu857mD6GrKI8MuYADPLv4lLSWihMynU0uf8wBX1dI8x9BPtIn8f3gZ7OEg4y
 KrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m70ivHZrGLjiucxSRk+L68pGwtbi/W1C+9qD32cGhvA=;
 b=pCcS453L9+GklWmoECtgz8eLTyl+oOdSbt8YTdx6FMfRHa1/Bxdk4pcjtO+FiRXjyT
 CHoy4hqmFoV873JwjnalxQQfLQD6UNJrf0taNNIURJC6lVJgqynECAaCpQxsh6YU1ZI5
 Eott/g1Pn09J60Ynj1z7Nic6Zg8VcimdHyHzrTEiRRNsNO0i2UN5G0ormoWq7nKzj6Zv
 dC2cgz9c4F8SfcAwyhdQgYI5VGO7cYgMwqvIx1BmEIXwQRj5d4zdXGsJHIpj4TjTWP4X
 Etab9HRvhQNS9mdoRnUE3kRMV5BTlKMJsIZ/f4D5aHunSaJKnNmfhd8FB0mMFHuzZTtF
 OYoQ==
X-Gm-Message-State: AOAM530rsx5B1OnT9Si63GCDJ8IZRT1o9NarANkigW41uSflmtj90q6R
 CzcUh/NNJmIONoXrkJjGterjKQ2GzyoX5LLLu1Zpfg==
X-Google-Smtp-Source: ABdhPJxj0MHX4YWNP4t327sPVr2jnFMD4M1aIzrf7nKUHBy1HygKKeCvn9H8tDwGi6BO1ZLdxsJURf96bzbukWwTD60=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr50901740wrz.87.1638886876930; 
 Tue, 07 Dec 2021 06:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
In-Reply-To: <20211207094427.3473-1-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 14:21:06 +0000
Message-ID: <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: shashi.mallela@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Dec 2021 at 09:44, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> According to the "Arm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and 4" (version G: page 345
> for aarch64 or 509 for aarch32):
> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
> ICH_HCR.EOIcount is non-zero.
>
> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> wrongly set and MISR value was wrong.
>
> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> the maintenance interrupt was constantly fired. It happens since patch
> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
> which fixed another bug about maintenance interrupt (most significant
> bits of misr, including this one, were ignored in the interrupt trigger).
>
> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> The gic doc is available here:
> https://developer.arm.com/documentation/ihi0069/g
>
> v2: identical resend because subject screw-up (sorry)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I won't try to put this into 6.2 unless you have a common guest
that runs into this bug.

thanks
-- PMM

