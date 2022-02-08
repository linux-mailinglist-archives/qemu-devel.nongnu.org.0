Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBC4AD774
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:36:40 +0100 (CET)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOnX-0002kC-0J
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNyw-0003MN-Rb
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:44:24 -0500
Received: from [2a00:1450:4864:20::436] (port=39562
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHNyv-0000mR-1T
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:44:22 -0500
Received: by mail-wr1-x436.google.com with SMTP id d27so1614654wrc.6
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cdui6zzdQ07bpf/Q+YUKrcFikizk30dEB5NkoFA90rI=;
 b=b0goZgQCUtTLFK5c98XRU15mJCsUAelAElPdWXcAUwpoCUn5lpRUzx8ctBYiWg0Hkv
 qyyFocFXugM36ttjzN2v3ngZ8AYm4ujb9/V+oVUSmApKpSPqfVdUIIabrB8X+kRT/6kw
 BN6xdZzzK9nmGXds3RmUNy139winFc0bDqgTdzNwEWTDlOeH+LJlg3ZXq2TwiRAwRCQj
 3nRfOwGM1D7cUCUxrM/aB0IEF+9LPmxFvnf8zNK2Ud8wzL0Rh+0gwDPXT1qD1JEKv8Am
 6QPL2a5HTBK5taxGbaKOjH3ypKDmfCO/4PyycsDNJQhSVxyfp0F55gR1MazliSKNJdjm
 OTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cdui6zzdQ07bpf/Q+YUKrcFikizk30dEB5NkoFA90rI=;
 b=t3l1I0kE/MJ8dolTGH+CRoHVrq32oeuDk8Hk0t0vk9hU63ulTRZO/K9GrNDQwZTpxT
 QpP+mDLDVI5qBXfuAd6Jw6tlj6k50SkXs0zJDioMAOrb44hHU3znVdPpuaUrN2J0Ku8l
 P2WiX2GwyGrHpttUf9P7BxtEfP2M3lar+F2iaq6HUL9l6sN4eGJ1tvTEBf27d53Ga+KI
 p9X7M5IYpLcH/ohfwJzoh60dO2Ge4QGLRnE1b1j5N/OHiWCWhh1jYkPyUDgqRzavhFZI
 jhZ2KGr3oV3HZSUnYLj6aCJb9WbY7vnMgYILNiML/e4Q/3KDQV2FXffy7B/dkp4HTW0L
 I2jg==
X-Gm-Message-State: AOAM531o80MkWCvzXz5Hn3tI30UJDZXuYnPsA7HFdA/O34jmquiGvWaI
 DYbeDCX2Jk+VI+KZP0B++pvk4CpbxPkND4bJ8TIjXt7QPAI=
X-Google-Smtp-Source: ABdhPJz/a2mg4ouZVrc7HEls/n0riaWQFKhyF+fRZtBgjlonHUsjg8D1q3Iee1Y7b9o68UyhPmZeq4AMCZkSgdEx95I=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr2938234wrs.295.1644317059644; 
 Tue, 08 Feb 2022 02:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20220208071710.320122-1-richard.henderson@linaro.org>
 <20220208071710.320122-3-richard.henderson@linaro.org>
In-Reply-To: <20220208071710.320122-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 10:44:08 +0000
Message-ID: <CAFEAcA-b-AmrJvRABxJrehpbLPjyvur8AwOGb-jyEJGYJQbidg@mail.gmail.com>
Subject: Re: [PATCH v6 2/8] tcg/sparc: Split out tcg_out_movi_imm32
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 07:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle 32-bit constants with a separate function, so that
> tcg_out_movi_int does not need to recurse.  This slightly
> rearranges the order of tests for small constants, but
> produces the same output.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Dropping the recursion makes this function definitely
easier to reason about.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

