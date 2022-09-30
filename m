Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9EA5F075E
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:16:07 +0200 (CEST)
Received: from localhost ([::1]:35528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeC7q-0003ml-S8
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3V-0005er-MI; Fri, 30 Sep 2022 05:11:37 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:36685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oeC3U-0003tN-9x; Fri, 30 Sep 2022 05:11:37 -0400
Received: by mail-qk1-x72f.google.com with SMTP id i3so2433602qkl.3;
 Fri, 30 Sep 2022 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Pu7C9p9W/tyNs/PEBqneAac3T/TMdvHyb0ntaR+NlAQ=;
 b=HBiw3dJzx3YXxJndaHJv6/5fc7KlXFSAolK3iDEfAKWw7Kxir8cuoRUWS5giKsZlud
 Xl+feoOmvSY8nqbbyrTWw7yJsJddVlP/UjVo+FkzS2eT1PVAL5EcU2ZLIgAfPaXjtfWQ
 xhoEAEIPZ0ouEKQm8sC0br4uoOxTxRq3d8543kNzMALq54QeXAU14hbyvBvxeEgE7Lx4
 0QKq3hShbiEejGBpl6gYzRBLamiYCj9vAywT6nIjryMtJnMvY4ptso+zdCbYars/Xp9+
 JGBTFBbOHBBglmHh1vuBQ1cy3OIGsHduKPpbw2eceMfL3tJBNKaoRbOFDK9XxoLqLRi+
 zMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Pu7C9p9W/tyNs/PEBqneAac3T/TMdvHyb0ntaR+NlAQ=;
 b=U0etHdaHMrYDL0E2XPGHtPBqKVJpRS+1BtQqyneoopTsNVJEjnhxwT6Yegtncl0TR6
 NfYujc+4HKPpuRwCHFuGaCK5nXW4CCiLED6V79Ep9IxLO1GbCvMTxo/Bpapravjs4nhN
 rL/Bs+N6VTR4VJXj+REgQFKNecUSrsZ44ASrAg5WdUprMCwlpsu5FeYSqUa+IfUlKvSy
 RCwlp/sG1WCAYUQjs5ZDpkKyBeT3Q+hDasVo6ABFoA4nvXbO2f+NgNMBnC3kmQkKeOzu
 0JPFYzicqqt5S5Rl33xEBrIGvox1+ePIFOIOmBrlV6fRRSHwSIgnik3KCpWBCdhlQo3g
 W2Hg==
X-Gm-Message-State: ACrzQf1+q7yEd89EAR+eUgT6dS+PQMje+MxMFlCtKlgyfVzLm4GmoI22
 8kz49igaG8jlQhLD1CZBqOdO0siKJZzeyd7tmwkblfds
X-Google-Smtp-Source: AMsMyM55fV1VkRZ/wleol5pfwWC3q6pe/492q521ACcVk0vggilKInkIMcG7suv0SJyJ3SjgXwx0kN06OemRae/P1wQ=
X-Received: by 2002:ae9:e410:0:b0:6cb:e230:8df8 with SMTP id
 q16-20020ae9e410000000b006cbe2308df8mr5126016qkc.132.1664529095054; Fri, 30
 Sep 2022 02:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <20220929232339.372813-2-Jason@zx2c4.com>
In-Reply-To: <20220929232339.372813-2-Jason@zx2c4.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 30 Sep 2022 17:11:23 +0800
Message-ID: <CAEUhbmUxsOoWG+7Zk7_ZfvaKqee0omGfRhjoEHYzEzFfYzZg6w@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm: re-randomize rng-seed on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 7:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/arm/boot.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

