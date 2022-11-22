Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0066633F2E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:47:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUXL-000218-Jx; Tue, 22 Nov 2022 09:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUXJ-00020v-5z
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:46:09 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUXD-0003bl-Rh
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:46:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id d192so14601035pfd.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=04DWyC90euoHILa72IDqaqBASlyOf9TFDQbJ4q+rdXg=;
 b=dYt0E+WRA2g4BFjqw46qs6BxI0IqLKOADxOx/wrsJehcnjeInNiavClGky+sMHzNKR
 Y0b2q0DFRc4GnhG5OCTreK6kG+q5IU63wwvRcWLQUAXufZiQ7CyFtUnmP1AhY0K4BG42
 rHD4sFPdQ/V4JUkHqGQRNXKfxU+qgEk9Mwm0yjwFmiN+luIzAVtOviy8IzEveFYwfOMF
 lIpin70x/m9VcQhcHn8dETPVKowALsu7eNhTyQXtXuNG6tsl68kDqShsgSlhuOEQlHdx
 axxF40VG9/2VEBuEisyZtQO2lSTeFYKfpSjUXRTL0CoE2FEqLwYw20mb6FibGTU20EV6
 GaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04DWyC90euoHILa72IDqaqBASlyOf9TFDQbJ4q+rdXg=;
 b=VNl0xYuUAwmDxa7CmjDtNBZgVDFt+xRBV1BeqrsxnHksKo5tKkoVXREy0e0JqlK+6M
 C59e4aaXbmS30IBG8ZapTuOJtp9oJG6ht8BDMSfhcES8PTm4DGDXKh6/nBlww5Zr1pBG
 A2msrFRbTNrDsklD0eFUyAQmGlozO4SlptqKkxSb5t97HFOH1xKw8rSDD4hdQmHlmxBr
 H8mLrwX/ifu1lpDkl5cpXdAeOqaLdXeTEkZ2cE1ITJd4kk2+Aoj1udl8bJW3HcwNj43w
 1cad19KSELD8G0UmBASUYVpCItql3X7w9YD/KObl1uDtl/oU1AfskpC4+POr7s7mEnEN
 xfFA==
X-Gm-Message-State: ANoB5pnmZcb1dFKPJHjoPP4iDWsxkFaDqO9Y9Nrzh9Zykbe3DnrM7rFV
 d/iKxLI9rqYCGsIF03UWT9W3xulgMjwzTsNVGj+xBw==
X-Google-Smtp-Source: AA0mqf4URrD5ZJCwQMZnnfqqBWYEUCjoyt3y7iwfDTo1XW92KGaVjFj3KwmFvZcEcGiOgyWOJEAZj4T06ki3Oy57dAg=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr6323039pgr.192.1669128362348; Tue, 22
 Nov 2022 06:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20221121150819.2782817-1-tkutergin@gmail.com>
In-Reply-To: <20221121150819.2782817-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:45:50 +0000
Message-ID: <CAFEAcA-0DQf_O6i8zk4U-pO6qYhPT=zkOB_FM2xMqBxECbzO7g@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 21 Nov 2022 at 15:08, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>   cortex-a55 is one of newer armv8.2+ CPUs supporting native
>   Privileged Access Never (PAN) feature. Using this CPU
>   provides access to this feature without using fictitious "max"
>   CPU.
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>

Thanks; I've applied this to my target-arm-for-8.0 branch,
which will eventually become target-arm when 7.2 is
released in a couple of weeks.

-- PMM

