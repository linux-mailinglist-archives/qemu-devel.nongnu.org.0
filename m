Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B8F60F3D3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:38:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzIf-0005HK-VR; Thu, 27 Oct 2022 05:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onzIT-00051t-6O
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:35:33 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onzIR-0008NS-Ka
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:35:32 -0400
Received: by mail-pf1-x42d.google.com with SMTP id m6so975722pfb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pNONiEtWJ8MKdKouCuGZb5fVAwZiitkUik81FMagC88=;
 b=RAn+XSraUBGJZ/ie61k2uqOjdbaRPRtFBlj8fglAGB1UByhU/Ql8I88VAexdUoreRw
 VOVsNwHiSdSw/Fota27brx+3lH0dqpevycqSGRP7dXtgL58COCbUCCz13aq7s/mn7pHo
 5JcwyRYrq9RqUIwjJaiwBEgGj4ackvduPRVWfWmc3z0NfIxDNXcw5TW8fi2Gv/NDtVxd
 WynE9EZZwOmuadausY129gyA+7aQ8qH1vMxJsQ9qXmipB7VGPkGT813BmypqLrnUzJ0g
 vTaYNWRuXgpss6hZHLwPRnG+K4YZ0tqye044BxKzqor/8wO3mefgYqrCHw/w9kWcB2M+
 SAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNONiEtWJ8MKdKouCuGZb5fVAwZiitkUik81FMagC88=;
 b=6zFT+MivHj48aUi09mWYc4mrTnAzTWZDjLmxqIvzldK2+WyH3D2xy2m+GP1VImL6aY
 RhIqhbQZc1YaTNKToroYUgVyGsHEA3ge8z7k3ob/hwnQufPvzOw5rFFn9DIFEkq2sjke
 cwcmiPC/YrPUiq2z5Hrm3qo7DTclQkTzJ3LUvC+EVsIqmnBs+M67HauDlFQ2wpz1L37j
 UiwPLWHocQVxnxHZBhpAGsIA5VZGFvkFO+6OOpxXCrb90/SBFHaq61C4+yN3vBYKp7f6
 y3XkuvciTSmHYwI1I0Lwt2oZBN3o7XvYiuguXPG1EzyZ1VhktadRn5trnKd5JMhSSCWY
 3ICg==
X-Gm-Message-State: ACrzQf37jvohEeQaoQIDg1g7HSgOCI9CBLUu93hLXo94nhbMK3dkPfGe
 vedwdTyCTjyxSJ4MBwxspmp0VwoeqZFGiqBE4aTBXQ==
X-Google-Smtp-Source: AMsMyM5VyhOoXCLGxgXWOG41DZDhOzGejF0ziBO7gC4ua4tI6TiV8dZZ2gXEGBnIXGWlkFcNsTUzbxH0IeyD/W1vsiU=
X-Received: by 2002:a63:85c8:0:b0:46e:c387:c85f with SMTP id
 u191-20020a6385c8000000b0046ec387c85fmr26122385pgd.105.1666863329562; Thu, 27
 Oct 2022 02:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121537.255477-1-tkutergin@gmail.com>
 <CAFEAcA-6ZyWbRvy9VOFJd0RR1h3bk9GNNzH4Uh0pznzT6RkOnA@mail.gmail.com>
 <CACKEeROBkPn0pPcH1vv4pRDFYztS3eWSLVZ3=rPN1dqopeRPng@mail.gmail.com>
In-Reply-To: <CACKEeROBkPn0pPcH1vv4pRDFYztS3eWSLVZ3=rPN1dqopeRPng@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 10:35:17 +0100
Message-ID: <CAFEAcA_X5qrMMDmJS=pkvdeuGa_Ux4aX-pkwKKHDZ2aUYBBVoA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 at 10:22, Timofey Kutergin <tkutergin@gmail.com> wrote:
> > V8 always implies V7, so we only need to check V7 here.

> From silicon perspective - yes, but as I see in qemu,
> ARM_FEATURE_V7 and ARM_FEATURE_V8 are independent bits which do not affect each
> other in arm_feature() and set_feature() so they should be tested separately.
> Did I miss something?

In arm_cpu_realizefn() there is code which sets feature flags
that are always implied by other feature flags. There we set
the V7VE flag if V8 is set, and the V7 flag if V7VE is set.
So we can rely on any v8 CPU having the V7 feature flag set.

thanks
-- PMM

