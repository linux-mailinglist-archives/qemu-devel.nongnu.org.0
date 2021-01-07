Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D769E2ED425
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:17:14 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXyL-0004oG-SY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvG-0002te-NV
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:14:02 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:43654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXvF-0003R5-CP
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:14:02 -0500
Received: by mail-ej1-x62a.google.com with SMTP id jx16so10378388ejb.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AEboNhhmoWOnJWz6M0/5CIQ6xxo5Rj8KOVpbivYh7i8=;
 b=dkFemps9mfTXazMr1b80vjlFpisucCauR6m3jwTpmqjHbxPoTlKo1NbMSV7tHZDi2s
 pk8cIxhdx5tikeQS6ZmyBv1kbJ9RD/lka4WOmEHbfM2XU2v7TmhWyArZwhnFqnGYiQg+
 KBDjEwASSdxuRx+6at+FDEgot+9r1CpB9+CCHIoTtB1XCBdoQizJkxmFiSDa4B3Lhdby
 Vx+DOh5ecpA1kBD4RGiuSvNmaX2gFRPKVzpwhRZQQygBmGRYyEHN9aI8j3rU6TAMwU0J
 fjlF8NZHiLpGvq7AUiEUyXyYcEbN29jgs1gHTNPWR2x2XHGrrQz/Py+L/bV7GM/qOqei
 4C1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AEboNhhmoWOnJWz6M0/5CIQ6xxo5Rj8KOVpbivYh7i8=;
 b=Yr8oGg+BAReregqE3ssYAL3o60tlfLK9UJ0H20MvqWVfHS3YKtLj0sa7lUrtq9xyLX
 UztW6Bros6aGSgDQvPxoHrATZEAPL9iVByPnhPl9TfQl9tBux9TemtsphSPtej8RGGFz
 SXgvmH7gkudxKYDOZRylCv6upSFiei5oK7cL8TAiWbjg0XaYDWihf6eZ3BPgLYge0b3m
 meVwJp4/90adru5Ui3mZEwLH+T+DmgjglOs4TGw3cGb2k13Di9KrZ2JXmp/ZQW7CnrC3
 GCRsToKLPZb6ZmlgCOVpxE0mBxXusutw6hE8VNut/VXRfiIYIfYoSK53nIgUrIMgbhDM
 1KLQ==
X-Gm-Message-State: AOAM532yKbmaou4EdW0wdZP3/7T9NR2KjD0RdTCRtj1x0EwO44jPAB6U
 tJFMtJukDy2V7bWALN5YTKvZgIH/EDU9XNXZx/MpBA==
X-Google-Smtp-Source: ABdhPJy1f4olLur1I6XQZO1Qy7iV7zdht9o3Fv5Xe8086kdAntHM0OK3BDbKUj8VSGwmBOiHE7zV6Kquwcs82pMpPEY=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6745818ejf.407.1610036039732; 
 Thu, 07 Jan 2021 08:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-13-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:13:48 +0000
Message-ID: <CAFEAcA-krGGkfCnC9ufhOCAYYASY=v-YFqgaJfc5K34U_fiVTQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/24] target/arm: Enforce alignment for VLDM/VSTM
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-vfp.c.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

