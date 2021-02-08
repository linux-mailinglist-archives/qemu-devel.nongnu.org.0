Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82A3144E0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:26:25 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GrJ-0005kL-05
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:26:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DWo-00048S-OV
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:53:02 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9DWn-0000ML-BL
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:53:02 -0500
Received: by mail-ed1-x52d.google.com with SMTP id y18so20577649edw.13
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 12:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/iwBGSAwV2FmIx1jKDQkOazVJ5u6tO1Wv1jxfot23Q=;
 b=KCY8e268sDqqC+Qbrcvh1OmPp3gAyMASXO1d9F2neui+xBd+NmxLrEHmJXub4TXJmW
 u+b+A+AHdlAmCQLOP4vpQ03bvZfx86H1RQwB7qbyOAKTNAgWARuYV+8S4E59QXN5si/7
 WmypFNExttN2TXoD7QnvqYCM4ccRAiPgK/xcpBVEZb4JinX0fmRrbuZYBtqwGcUGnwr1
 LLGPU9Kno0RVFhok5HuHUv9oH+8BACEkbho2a4sO0W12mU7q6ZQHhhg6gLWmTQV7XvQ2
 Zknqw2AMR0qG6ga+xpnm7bZmL44kBmCWk1o3H/XykALqoPpPX9kkxnv+AfZUeAR3iGkA
 vo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/iwBGSAwV2FmIx1jKDQkOazVJ5u6tO1Wv1jxfot23Q=;
 b=j0D3Vt1XePpeyCId/osYKaEnkXMikbdadK4jW7qoLhq/72QkwH+46DA9pFp/4zJ7M3
 EU1YYtFuz4VKo/BizcAPeKhW5FNrKgnCKFdSN3iQ6LOjxNNzhaJZyyfV7k6ENiEMrAma
 WqF5MpIhs9850iwNHP+Oa29adhkp7k7/8gYtWEOsmzK4kVDxNwaVYuuffdTIpwwJ09gQ
 pBFTFg7jGAkMe4k8+CpBH0io4xXiOBcoORFMOzOyGjj0kK2ppW+w/F9Ru2km2MZn0nso
 WQ+oAMxD4bNc+xO+MZzPKIyWwxCZ1dplO/OG5zeoBsaJh+gepW1qh0xT8CJe5lb0yNg7
 m4Gw==
X-Gm-Message-State: AOAM532V5+OkujuG+e4xfKWdpR5xlTDMIba1MUqF/u7tdn32Ki7CKRTC
 x/BlRn0SS2uJA4JPJeKQ6prlMsnIv/dIcAYYkcCwjWFXL3M=
X-Google-Smtp-Source: ABdhPJzO7Y9WuOJl/A2vHyxq1u7t/YrzHCXg/EfoHbI9+uEc9UVPrLG8nZyuHHTIKKSQ7JdKG7lTI2oLmoPWfZlBUU0=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr17526375ede.44.1612817579884; 
 Mon, 08 Feb 2021 12:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20210208024625.271018-1-richard.henderson@linaro.org>
 <20210208024625.271018-16-richard.henderson@linaro.org>
In-Reply-To: <20210208024625.271018-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 20:52:48 +0000
Message-ID: <CAFEAcA_dxhALWx8JF5ZFP6T19qtmdnjd5UmZSRb4VqLtQR9n6g@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] tcg/arm: Implement TCG_TARGET_HAS_rotv_vec
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Mon, 8 Feb 2021 at 04:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Implement via expansion, so don't actually set TCG_TARGET_HAS_rotv_vec.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

