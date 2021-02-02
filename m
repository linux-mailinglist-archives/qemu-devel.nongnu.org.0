Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C930BC20
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 11:36:35 +0100 (CET)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6t2w-000734-8s
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 05:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t1O-00064Y-QA
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:58 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t1L-0005wY-G9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:34:58 -0500
Received: by mail-ej1-x629.google.com with SMTP id i8so12683299ejc.7
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHgFUnW1wQrVoTK6VJEdmulKhIcN39KNGoL+iGbz+pY=;
 b=UoyqLA8CMc96TpllXgKucZSL3t2k6x3bXrfaSzKzNQuP5RWhd40WbUTUOibuz7eu5m
 KuSQafyKFUzXmQKeIq0fyrBJELjbk2RT3zbo6DVWXorX512UTK78QLNuXrw0kFMsJCt1
 ETDAW/fl59v6BmSOr4HIBCLIMxcsZujSGqg6RYaecZ29mkQZLhDQfVE31AjC8hagCc2o
 EHU7wgPlv/TBvJDWQZk58WKpH18+JSI2U6wvHaioFGzhU8zJ6sp+rJGx+kEGAg7448lQ
 KjUKFWbpRwrt5sJ6ukQo4bPlJeRjh1tk+CwfBALlrRMkLiAM2NIszLN6ZOdH2luCzUli
 dpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHgFUnW1wQrVoTK6VJEdmulKhIcN39KNGoL+iGbz+pY=;
 b=lUB6EJ8T9orHDhWNQZVJjJN+lvkiD4dvN9B8u88mz2Mjv4r/1UcgxrMvGy6uz8crDq
 NAEWkTGWDslbFOcHJWBw5yoDD3D0MR85L8qhuqkHvw6vE0pgUmwwOXgaUjYChzN1x1uw
 eQPQIGFnORzmSq9cd7FeIu9f+z3NWXLw9Rvzp5/w6o/o/0RLu+AhEzFD5/MKvlr7Ntwm
 BymD+gHBA1m2Ff5XKaTLkz1OPS296xA9hBCxGZbztKpNA35ptdsi1NZkBReQ/3WPfiEK
 FNg91nLrG+Hqr3PZwZf8zuUI187F53XaO3jKbTpqvdz1EiXmZCEOHTamTH/VQ8DxyiSD
 G9+A==
X-Gm-Message-State: AOAM532tLeXexkYIurmYmRL65w63TffDqpVWZeZIION+CZEanZx2zPeT
 XUJ60ApILFJwkw2iMzELkC8DFLiLvgvmmWjGa1pFTw==
X-Google-Smtp-Source: ABdhPJxOrJUKHukTq6gnOT+/gPkl7vTOwWcyAPwxF5ZskwsPILaNxYfka78YaotQDcxrAYgy7D3gzh7DLjDWV/vJxYE=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr22595226ejd.250.1612262093898; 
 Tue, 02 Feb 2021 02:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-2-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-2-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:34:42 +0000
Message-ID: <CAFEAcA-n1oXYkQA0XTVNp+rfgFRZSviao2FTSBvOibfbX24a9w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hw/intc: don't bail out gicv3 model init for
 revision 4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> As a first step towards GICv4 compatibility, add support for gic revision 4
> to GICv3 driver (i.e. don't bail out if revision 4 is encountered).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..7365d24873 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -315,7 +315,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>       * conditions. However, in future it could be used, for example, if we
>       * implement GICv4.
>       */
> -    if (s->revision != 3) {
> +    if (s->revision != 3 && s->revision != 4) {
>          error_setg(errp, "unsupported GIC revision %d", s->revision);
>          return;
>      }

This change is obviously not-for-upstream; we can't allow the GIC
to be configured to a revision that we don't actually implement
correctly.

thanks
-- PMM

