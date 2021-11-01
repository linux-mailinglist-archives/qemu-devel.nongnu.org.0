Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB52442074
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:04:42 +0100 (CET)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcbp-0004Sn-Gp
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDu-0000qO-E0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhbDq-00034s-Q1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:35:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id d3so29164937wrh.8
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cIfF9Q5jtqgHSiOEzayE5kDcB0EcnOzj/tcoXqeCSWc=;
 b=Yl4FYgtQ1qDSSsuTJ9fMIRZSFp+niJGkMLksxm1818MTesESzkg/sg3cXtHYncNGIe
 8la4TyMsNh5nnMqHuFIrAtj8nAMAQD/qluZ8ymmnD8RUEipxI5ooTgN/z35hBk3u7OkW
 UjGBNpom/0i07gnnvcC0wGMLp7/V2K0yYLC9mJcf9875C0TM5bC/8zHZGbK0DZjKy1Kx
 Xf+fGvDOwoO8D6sIc9pUXNcYc347kHccyyRvnSkktMo5FmBJpxDT/YtzzVL+O7qXw0Dn
 JWZx1VHYims8OXVyGKlDm8ItMO9darXlvRit9m/9yxnjIhysCj+z+CqT3oO6ZrOOrVQK
 qXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cIfF9Q5jtqgHSiOEzayE5kDcB0EcnOzj/tcoXqeCSWc=;
 b=XNtNpveqY0PFLJIUVP4NoaOIaMmBBnkX5bMXm/6+CCaRZP+7cBOqNHBrP70tQ0xmYo
 AlgDibKuZ2vuXYq/+F9LkC6eFSz8nPij7edKGdzz6U0df5APaYO9qKkspDPLk/7JmbXS
 B5bVUYXG/F1uwVkpenadZ1QpAE7lzQNBm1/OKowhT1b5Y/ZG77Po6OcFE0CTQebjue1r
 w5g+wk2gR2WJHrZrhq/DBYaBuILJK+G4BQgpajCfaYELQiX4+p3os/wVmQaI3xzSpiNZ
 Ygx2ESXX7DNlt+P4QDhkIm1tmt9HBvjxWkfkUp1DjtwW0p6hI+kn4tPyh9tP8msQlso+
 JoHw==
X-Gm-Message-State: AOAM532Wa0gcrBqreTFh7zvQtpMKcRNheXjIKcjVIZTSdrDFkDPboFGX
 psVanh4/toqpwGaTkbmlc9gI0Nxj2RYhp7nnDRiLbg==
X-Google-Smtp-Source: ABdhPJwJfmM7y8yZ/WAmtzHiP443g6nfG69rX3P23XqeD7n+wt9vQ3LSmM5xFqixxZxruxFwmBLfOrf/8YW6PibQIY0=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr30103820wrf.302.1635788149416; 
 Mon, 01 Nov 2021 10:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
 <20211021183956.920822-4-wuhaotsh@google.com>
In-Reply-To: <20211021183956.920822-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:35:38 +0000
Message-ID: <CAFEAcA_aCve9VWBGHoZyzTGZNrX16gFZoioQTYC+Crs9NwbpWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: venture@google.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Oct 2021 at 19:40, Hao Wu <wuhaotsh@google.com> wrote:
>
> The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
> fixes that in the module, and also lower the IRQ when the guest
> is done handling an interrupt event from the ADC module.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture<venture@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

