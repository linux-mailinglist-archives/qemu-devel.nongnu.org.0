Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF493641F8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 14:47:44 +0200 (CEST)
Received: from localhost ([::1]:57432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYTJX-000112-1D
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 08:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTHg-00083P-Ia
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:45:48 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:46018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYTHe-0002VU-O7
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:45:48 -0400
Received: by mail-ej1-x635.google.com with SMTP id sd23so44049144ejb.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sv9j8dcxEc6wXtTNRbe2rX+iPyC8tU9lgWbMtiVd+24=;
 b=cxJ+knlCQRSVBj03oav5jzTEou+471yOSOiP4siL05Xt+4oNW2a5K0/VMGF3fdyBD6
 hTrVSboUgS37zKKLwY/pX8xdvUTGKldbXtXBz4OyJsEoG8B4vVo54P8DKONbgOx41U7g
 RVwnLqmm6HtqJnIdZPcGgcCN37ir9JUmCSF762rlrpOpUNUJ5OLMl3ayzjF3lQaw4NDe
 uyruHwt1dKSqc9Zztp5djpXyG61dYqMtRlOkGrN/H+0DZ3UdTslPYqvd0ZfPame5J7rl
 Ti8AED4c9cb2XdXRsW0TgOIWOyZgaeiUgiK87cmW1svXxzGG12G10grDKKppbV7fLyYV
 K/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sv9j8dcxEc6wXtTNRbe2rX+iPyC8tU9lgWbMtiVd+24=;
 b=a/Aroa2R2ZcFKzFC+AEhuAiZTRYiPN7d2fzC8JTd52UhmCT/XdCg0temL8mFbEzE2i
 /PvWvRS5PXYZdX2AN6r6a78OUnOdYaFDgF4WAIzw56rD6t116QSMrFTAMac4g8wNITRG
 mk4WcpfIpXzspubUMQw+7aIOGQozx2N1YS0Ccb8SDwPyxnVPg7Xg1cyGLt0WCF/aB6T9
 f7j7uXgo9DtX24U9QuYAAwBNzYt8MOAxk8Ywr0zDHyJctv0VHRCbQAOdkmrDZ4HwnYYg
 36lNjWAazm4iNS/hQBEZaNqSgXqqJzyicykzWG+BiOv6jJDNoVR6n1Z3pfHMJDVlGaHR
 KgeA==
X-Gm-Message-State: AOAM532palRHfaAxizHtZRXWWJFrgA2JeZk2DikE9T7n0Dj37iyEg3iM
 MXbsqS9eBnEddH6Zvi2gmitcn/XRqmSnivJRhh3YcA==
X-Google-Smtp-Source: ABdhPJzYduoYqfhOrxysVLsKuyf47FDFA7NWFpduzbgtdR85YIXPtW3naZt4NqSo9v8lDI4JO/lJvY2LEdQXQ7KwUNY=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr21729457ejc.407.1618836344624; 
 Mon, 19 Apr 2021 05:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210401024152.203896-1-shashi.mallela@linaro.org>
 <20210401024152.203896-8-shashi.mallela@linaro.org>
In-Reply-To: <20210401024152.203896-8-shashi.mallela@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 13:44:53 +0100
Message-ID: <CAFEAcA-gqyn3GKWpxGed_7ehPfYP6pW8TQ4zSAVf+P88SWTZDA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 1 Apr 2021 at 03:41, Shashi Mallela <shashi.mallela@linaro.org> wrote:
>
> Included creation of ITS as part of SBSA platform GIC
> initialization.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> ---
>  hw/arm/sbsa-ref.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

