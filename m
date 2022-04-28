Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1AD51327C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 13:31:30 +0200 (CEST)
Received: from localhost ([::1]:44440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2Mr-0000EV-ON
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 07:31:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1fb-0005Ts-Fw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:46:49 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:36414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1fZ-0001tI-OK
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:46:47 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7b815ac06so48379627b3.3
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g1swU2QWRvH/jTmnfVgrRGpaDz13vnGddtZ6Gypatfc=;
 b=VhTe0XI3bK7prnbybItD6lJ4CJhl42DcSGIreSq1zRpoxavnYesMXnqufggAUAXxAh
 gReZ9yfBznPbn13PJEe9o7kB+9GEp/lg09Mj6xHwk+TqDqbffP79UtnMum7IRqcX25pP
 iqducKe/R1klahfbuKLLFKO1kR2QXFa/jrRhGU5OcRgonyZ+ZIe5dwPc1HpzPuQNAlvQ
 Tw0KrD+8ByTL3tcjxaVE6P4TDGnioYBcwuQQOfKX/qS4QHk7igdicfO+NmDH0I3N+94H
 I4ORii3M18tmrfcWx0KtknjQau+COk3b+Un5eJLNlM0E5j9A0zy66C28mSgOg9hGMCI6
 tMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g1swU2QWRvH/jTmnfVgrRGpaDz13vnGddtZ6Gypatfc=;
 b=aZFWzOn7weB22JjhoqBSGEJtuUxqV/CJNQU84k/PgCS2SnnPhMSXsYSXct2IMwYSiD
 X+rVSknYl84c/q0aV91efyvztNgCM3U2k9oyIxWFIIckU3fu7tSCn5AVj6mVALVThOv5
 Hr81eifGWairhvxe9ir86kl6GI5hpNVUe2l0ZPyUXwas+T253UXKGsWlyDkXv7PGCyDL
 Awkfq+NpCPYjPgXWRayLhNXYiHEBigR02Qqiq71xfbC+76qiWxM6aSdu1G5RypZEozLi
 SF9+xyFM3mlJ51m5MYg/M6WS0DdrG9zagprnmRHHJDo5MQHsd22X298FeOXkogzprWsQ
 Lqkw==
X-Gm-Message-State: AOAM5301cb02yEwvv/OGb6EQCWRiy2X3/K8Acybaljykmn//P1au1qRq
 B0v+enM17KuVA29o0HAirsHb7SDeQYvI82KYwD28nQ==
X-Google-Smtp-Source: ABdhPJw6QmaRKLKRR/z/zZ5tpbzcG4lMRg2iChQ+WmM8NXhWBGAfj/0svlhWwFW7TjA16/5KWwAQI/2qoitVZnUPfls=
X-Received: by 2002:a81:5584:0:b0:2f7:d7b6:d910 with SMTP id
 j126-20020a815584000000b002f7d7b6d910mr23162145ywb.469.1651142804430; Thu, 28
 Apr 2022 03:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-42-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:46:33 +0100
Message-ID: <CAFEAcA-xTs8gCHbr95K5OazWOEHCaH62aLP971bZQWzaYzu=ag@mail.gmail.com>
Subject: Re: [PATCH 41/47] target/arm: Use tcg_constant in WHILE
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 18:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

