Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B138793D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 14:54:00 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lizEU-0006dq-V2
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 08:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz43-0004MJ-Uv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:11 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:46889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz42-0005Rl-78
 for qemu-devel@nongnu.org; Tue, 18 May 2021 08:43:11 -0400
Received: by mail-ej1-x62b.google.com with SMTP id u21so14250318ejo.13
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MstKIDzUGYb1CKYtX3TdsGP5sNf5d3btFYZeYsGSpYg=;
 b=WVl19FzyTcPzJAdr1ebyLdmAchcbH2Aczdyu7L0E9VI7ObSO5eK5O0EoiiTEoxkfw+
 GYX3wOAk4s9BoTtcJrfdjtX093+RcnipmrnbS/uphia582j3IDZnSX5nAYDzFHqJ6ogb
 69oahZVO7OWmiMqdOGuIIX59rdynqM0dHmXBEIzJ2m0kyDvE/lgw8aWi5NMBCGxctoXL
 16IDmm+3i/L8winGci0ly874fTSBN2DaOd7s+glEMYSGMELPBSiWpPOO+7lL+sNAEyol
 nAH6vroy62I6Ln2EMcNUGEGsXDM+2QVU0DrEk/pPOHkMaaSW6y61NbQHMFstUHC+xIi6
 QdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MstKIDzUGYb1CKYtX3TdsGP5sNf5d3btFYZeYsGSpYg=;
 b=elSgB4S8k323zkUpulRET2PBjGOFnKhNPgCfym3INVVc1wQqMi+8pB4xA4Xc7RjKbK
 RJ7sQaNFKFrXae1SDbwA+XPY+dCCsganoZjms7vmgRiRjtw1SpORPAtMXZ5xtz5v/lUI
 63s31TGJbJALxVwvaqJ6dj0zv6dCPkotRsE+2BfEyV0rwVyXdR1FMGLpwD1rnEL2YFEk
 /ZdHoRQRXy+F5RQ5hnn7p5vt+ppVPbCw2hMuQCs9KNDpOJU1oBQ4zacz3mW+IoKnVls/
 RZfqAO2K7ptlG98WLOt3toFr/0xY0vFleMjb1yx378u8ECjh7Jzy1Kyp9C74+rRMDEUe
 mfFQ==
X-Gm-Message-State: AOAM530kYMmeZPVdTO7N40O8jSb+aHQMH5oOng/GzkxDlOeW4fYB3bv7
 AaS+cEZOotorNleV6KAXoYunZKOl7Hi/OyqVCu3hCA==
X-Google-Smtp-Source: ABdhPJyJt7HtMO0ZyF+kT2VMFhYWRmnkJDjBl8EEgPVIu7qgdfZk6RkXHCjTyzQGkH0PAMSUzBB2+tzCyaS3xIaq/AA=
X-Received: by 2002:a17:906:d8cb:: with SMTP id
 re11mr5856511ejb.482.1621341785408; 
 Tue, 18 May 2021 05:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-10-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:42:49 +0100
Message-ID: <CAFEAcA_Qb3hxMQD1YpEbmm-4RV=vqPrBaM6b-nD8FzOKEnW07w@mail.gmail.com>
Subject: Re: [PATCH v1 09/11] target/arm: Implement bfloat widening fma
 (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Apr 2021 at 01:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is BFMLAL{B,T} for both AArch64 AdvSIMD and SVE,
> and VFMA{B,T}.BF16 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

