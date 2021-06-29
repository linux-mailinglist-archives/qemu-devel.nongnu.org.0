Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE243B7018
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:29:22 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyA3V-0000UE-6d
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:29:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyA1w-0007Va-MN
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:27:44 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyA1t-0002yM-Kj
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:27:44 -0400
Received: by mail-ed1-x535.google.com with SMTP id i24so30348960edx.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nETBrensPi725UOph040JtGEoAdnt93Z9taPJeU/F+o=;
 b=TQIhTXJf5uFeSMgge+FH2O9gQvC7DhUJlpdwMjxE63o5sfcdRZhnseObXzTP0qRM8g
 KNrB2JaicD690sbtd67C02M6Sk6DVlv0y0zQAn5V2kLHZ3YRydL6er+c/e/asNBrtEa+
 TDI+gzjFysogCv1QClBT0pGWN7oyTUKQx5Q41+PZxFP4sWIhW/fRrMHXfSrgNw5G01Od
 Q3lz8pwlc+wDGb86YXML4loJeqweyfrzWycrnl3Svc9xBmdXtuxUGUAMuq4MlGgvNyUQ
 lVg7+zJAJZKZweaisJ5mJtN/Rnl8Wpb7RpP3KLfS0G7c6Rlx07COcbSWTaVXYRsNKRcR
 3u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nETBrensPi725UOph040JtGEoAdnt93Z9taPJeU/F+o=;
 b=ggvMWW7l98qZG52lD5YJXdUpce7l3BuCZcs2qmLiIG6DacP6kol+119gdso6ZNGs5Q
 nWrthCmI19pifzTaUz0qRrMGUsQS6qSeis2aGIgwWG9lwAaBRW2uGdTTnWwWShVuFf2A
 o4YanXW9S+POjbAt9WVSZZRXkY+YlGCwUeDt/lZ3DV2PBZQ3MnjlKoupfnCelUUdXqAi
 Xl8Ni79REgqqpvKe8mR2dqyuuJsLGchVagBFx/RiJzSb0U6KZo5Fe7HcgSOjz2plWIgZ
 V4h6x+GfAJ9G+zNdmyNRXMLp+wVJvaNZkLCVgmb97qQ9o/Ve6HDAh6Oqklh+I7YtR4mW
 mirA==
X-Gm-Message-State: AOAM533Go8HQq566VD4ET3Enp+PcjB/+w11i9a1cj7OcHeXpGEzQRpb+
 lRXmcHrP8FNLijtdsZypznC1rGUdmaBVVcpYDFgPtQ==
X-Google-Smtp-Source: ABdhPJzMWZjMEosf1sAXKVkb674zLg2ylVRqs1PJq3XQt5VY5qrC5Ct53NgPYrMPjB1c20ORmon0Qml7LlqIjRXiu0M=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr38683899edz.36.1624958860161; 
 Tue, 29 Jun 2021 02:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
 <20210628220810.2919600-9-richard.henderson@linaro.org>
In-Reply-To: <20210628220810.2919600-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 10:27:03 +0100
Message-ID: <CAFEAcA8jOHKcCqFhZ=M+qt-WBguiqv7j+Jwi0tAVKtYajVBN=Q@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] target/nios2: Inline handle_instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 23:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move handle_instruction into nios2_tr_translate_insn
> as the only caller.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 66 +++++++++++++++++++---------------------
>  1 file changed, 31 insertions(+), 35 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Side note: I think we could replace all the handling of dc->zero
by having load_gpr() return a tcg_constant_i32(0) for R_ZERO,
which then never needs freeing. (We never try to write back
to what we get from load_gpr().)

thanks
-- PMM

