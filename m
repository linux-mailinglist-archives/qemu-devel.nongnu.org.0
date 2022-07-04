Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5250B56578E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:42:45 +0200 (CEST)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MLc-0003dT-Ct
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lpg-0000Kw-4r
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:09:45 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Lpe-0000z5-II
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:09:43 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 76so1206385ybd.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eZEcfw9Ltdyx0zX1bajhXauTmKas08xUOUf1g+AMWzU=;
 b=iKk2IAA5pidcrlrw5ymRSt2HFQCjdbzzKD8M1lHZgmam5ROpd20PPp7wJCaYWiY2+A
 fQgC1M6wdSr+SutrZ5DAZ5YKauu6DkkfcPxkWRkq/D2qsXy9MzTUO+pKGsWD/rEjLA+3
 DvytNR4Hc62DsKQ8dXJFIi0qWDL54HwjZ88er/vyOMp9nr/FSPM+BhrSIHFhvpE2yHWX
 xqHf1sREdC2pws6VtpEypAN9YEHjTrNvx7S1CLzEpH9P3RwutDfEHR7zf/MfY9dv6m/V
 6ixBts6liOqmVzsNiNl8eVakDQUOIZWFWnbyQ4osvxCMA6QgcJ6dubwtZUq6O1MlzCwV
 7BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZEcfw9Ltdyx0zX1bajhXauTmKas08xUOUf1g+AMWzU=;
 b=xU9YdcgRcRDeiyUUQAtWP8AGD1cBS9MXADdXBxW3kCbpdJGPB0l+/EmOIzXLR9/WRV
 rxWSBnPOmhfZ/xoNggOxxUGAnmzsw9aXqd69abFnGjjOOY/LLqi9fyZj2OqVwUo7Nf+O
 VnCAGjSrAgz6hWMn2gwihdPhQ+UkfkZhxPgKEvUl7OI0x8b5ECNAd0FdbxcM008BOaNq
 rDWQ1bCqVWnbAtFaDeQLV6K0Nb6JaaEfEn9smFXGpKt5ruHItl7DreP2NS84CSwkFT3e
 ABFqMvCSe3ekNI7xQzNutG9vuOpZAZVrv8g9IdR7TA5NvxFswJdTTqMt9ocCwkLelPp+
 1faQ==
X-Gm-Message-State: AJIora80mk9MqXuyE/JtQ2z7ojYKxNT2jnwo48RbP+HC9LhBE2edkUAi
 s6Z+smOvV9CyHaFk0DRkcSTC1IM7jNXOVZB58D+56w==
X-Google-Smtp-Source: AGRyM1vJ+C/pwK+FATOD0/YdwRdNjFvbePi2h/zV4kRtg6wZYtu7R2ra+cuNi763ajPr4rLHT8KYBLmURql7V/iTy2Q=
X-Received: by 2002:a25:500e:0:b0:66e:4c27:6223 with SMTP id
 e14-20020a25500e000000b0066e4c276223mr4807176ybb.85.1656940180310; Mon, 04
 Jul 2022 06:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:09:29 +0100
Message-ID: <CAFEAcA-6XVL2n01pWqT10JvPJwQ_f+O5x+T6D4tG1xf+KG=pAA@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 28 Jun 2022 at 05:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v4:
>   * Rebase on mainline (20 patches upstreamed).
>   * Adjust sve_access_check when PSTATE.SM set.
>   * Adjust sve insns to indicate not valid while streaming.
>   * Other misc adjustments per review.
>

Hi; I've reviewed as much of v4 as I'm going to now.

thanks
-- PMM

