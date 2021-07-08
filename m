Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713B93BFA4E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:34:16 +0200 (CEST)
Received: from localhost ([::1]:49598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TEN-0008CY-GI
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T7i-0008O7-Cr
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:27:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T7g-0000Ls-SS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:27:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id m17so8239561edc.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0un8LFwShc0jD49fuMKHul1awuROlFdQEmwUxBOmetU=;
 b=N0nHbaEEI1dfO9ewBMIL8kV/HB86SJhkQ0hsHTciDNhOM1Y9It4VhPspwUGKjHxtBb
 +UUmYixe58/z1k71ODdKYeQ5ZX/h/NJe2ryVF3RIKz8VyOMNdf2cJQMVX3xwzLSSYXhz
 jiI3XVBCx5esmqV7sRE7s5vD/hIjKHC9CoTeGI6bhOmJzoE2g/CUGng++ruR38KVb1gp
 h7N3EnbRx2B0VeQTHcpdehJoHXtD9P/3YMLHYmZu7Y54wRpJLfChYhZ7H2xZHRdTxdP1
 NS5pHsPad3IpAg1kYdMWCa68xeGLxXg+iKVLjh5BI9AA/9VJC74L9/AQPoVkQ91BZYcL
 lZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0un8LFwShc0jD49fuMKHul1awuROlFdQEmwUxBOmetU=;
 b=Pjpj4kqlmolGbN38hQ/zQLjLwLDKZbiHh5luMr9pSlOflkoHRnABS5y1uTrd5CgCxh
 K9svgE5bmmrMxiO1BUnaj86Uuh90oHQY/xym29Ujt9zcz6s2wuBy9SumIh00yraoaqpS
 yALA2XdJ/JyCc0CxWQ1Iu6Vsc8f4KwsWZy9CZrT8EFlNyODhDnbOmgA8Grl3x/WR9nCo
 HeA2qUnaJTyKlup8xNQLsajwDRjTFnNKmtmx3aD/EcewWwFf8l/YINDfk8skcR+/pNGk
 k8L7jzl33HocOWolOAez5Gj/5WhTnY5SIldRAQuAEXjdaJLXw03/oZ3KU2wg7itJC11H
 YIvQ==
X-Gm-Message-State: AOAM532RSoDM68SE/nmsVCR/GoeS2/Uryy6HB8aFMPiWMeP8sPB3v45l
 z60GQG/Ym8nxDXfRkcLiDIepivxah8W0sesHiBgrYw==
X-Google-Smtp-Source: ABdhPJyQksktp9FBZj2r4tfb4uguOrrJJuE/xqP+pRTs7QEZE6B4de/D22gJWj3LwQlGlMOW/euJEpGVqoWBeskR8Cw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr36967608edt.100.1625747239439; 
 Thu, 08 Jul 2021 05:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-12-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:26:40 +0100
Message-ID: <CAFEAcA_Cqa5zPrNuQUOGD04Dp2_CAKN16OECrOrcEHTLDzVepw@mail.gmail.com>
Subject: Re: [PATCH v2 11/28] target/hppa: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Wed, 30 Jun 2021 at 19:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hppa/translate.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

