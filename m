Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E92FBB58
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:39:09 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t64-0006S0-2f
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:39:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t0V-0001f0-0X
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:33:23 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t0S-0004PS-Eo
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:33:22 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g12so29094318ejf.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pL3IG3oX1M+g8Mp4tWza+AytKqVTrVVLMe8NVpUmpx4=;
 b=urL4OClMXLzO080FOzB7y+nElCQwc3UXQno4dKmECUqLI5gJHulq6rPCV1QuLhldeb
 dmWm79Wo6PxKidJHefhLMDUZmy8CCvbq1ynUip2z3vS44azTUOvVuH1l5gNQwEQapD0X
 SRqeenGCqljIUlCiB/N77aEPVdeW1G3kFVwyBl+deGiRm2wACvNkfy+fMBjPSHqXUR4b
 UwoHhaT1nRGX4Vntyvv7/OtMgJ0llNI7nEtLN8MHxQjnnB25n2FmWRM8wx4IBVzDywbh
 AJSRaAlGJuRrdwrmdB5z+KFqeLYRJcDlrz5fw/sQ2WSWHNvdCqiSgoSbbxycDwt6RZ8+
 GQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pL3IG3oX1M+g8Mp4tWza+AytKqVTrVVLMe8NVpUmpx4=;
 b=TBQVt+Ef4yRSLdUuaIxghS9smWVSjNdOQjWSf1nGiKYzMgnJf9CD+EQuSN3AEp1ghF
 vZw9QYyy41LrPtHGkOAQ2x6Lw1Y4XIYvKUsyqZABPPcP2EUWOQZNBb5oi192/KLnxVp4
 unCnmbD6+H0n/dYpx/eNhD/acrMNT/OFyfPpgzetnwTOTkUODCZg+ZUhWVK/DB3LJnYb
 2pRX6kvUFpekF51KZ6lzKWmmRFB+e5uewb9lKh1L0VlWwg/81Kg3M1Hty6oXzEFEbtu2
 /5R8ODZBtyQ1ciUtVQpfNumMIXCzINMgSKMFiso9dHgzU5TWdUN+vPOKmr9BwCf/luS/
 2zEg==
X-Gm-Message-State: AOAM53034djzziQcyJYSFRFx6ANPCq7MHgl+g9OtjnQUUsV+mzF4JVUZ
 ZkeP3Int4IqKYPfnqSG4tOEtrnk+g4v4oM1PBGBkew==
X-Google-Smtp-Source: ABdhPJw2SDzqlFvcQ4zJrdTEaP62JU4v3iNCq9EyvIjvEUIFJmDyhLawo6ahjZrk7ZKgeetIcQH6FIk0nt8E1pXCLYg=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr3495902ejt.56.1611070398463; 
 Tue, 19 Jan 2021 07:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-16-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:33:07 +0000
Message-ID: <CAFEAcA-Xq7Li8jsHOv-9KWtWtSNo_Z_1m72yX=VtTj8H8JEVpA@mail.gmail.com>
Subject: Re: [PATCH v2 15/22] tcg/arm: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target-con-set.h | 35 ++++++++++++++
>  tcg/arm/tcg-target.h         |  1 +
>  tcg/arm/tcg-target.c.inc     | 94 ++++++++++++------------------------
>  3 files changed, 68 insertions(+), 62 deletions(-)
>  create mode 100644 tcg/arm/tcg-target-con-set.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

