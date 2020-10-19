Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3DE292ACC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 17:47:57 +0200 (CEST)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUXO8-0005c0-Ji
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 11:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXMP-0004N6-2n
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:46:09 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:36329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUXMN-0007QR-C5
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 11:46:08 -0400
Received: by mail-ed1-x544.google.com with SMTP id l16so10784435eds.3
 for <qemu-devel@nongnu.org>; Mon, 19 Oct 2020 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rFC0XeLIwnKIMhZjcLqywPQHSzeMuCTVI+4PTBWGZBU=;
 b=a6bFoeqJeuHxA5xVnBiYYLtsyye15o7mQjnEGPHP2B1RN/wG86AAiLYYjaOx7APTPv
 owwkBmdME5/wVU0jiTEgOc6P0aubWEU4aGRAN35C1y7i94OYBiFduk84b2RU1y/IlGtC
 8C57xptS5YCF5EJoSk+lBd59sloxX5F4HBQiUofQzDGAODFKn33AugT1lxwaCJvBIoiI
 hdM1SGxHRI36cLxjjl3Ql2vfNgicf34n7a749fvkcnovJM8ntJC/ENhEMKy0S51RDSgK
 +Nt2V78Xr21w2Vann7NA6MCNTAv6a05aAlx8uwktvhOmDj43kYtM6G9cbcxUcwY3auM+
 fM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rFC0XeLIwnKIMhZjcLqywPQHSzeMuCTVI+4PTBWGZBU=;
 b=chG/uQQ86fLDWx/Y9vZYS5rI9+STN/CRUpAgA9gsM3LQ004Q1bARwy1GVZmz7IZLKU
 Ces+Kn/rcMN5phvs52YWxkiyYJPIlZXSfL54PjIRa+FXh6UWKLDrPN/ZKJLjuYiM+a+r
 GI+UFoMHE+H1g6Vy7SLovzb7muG2VibplXp9ndgoKNNACeQojmZMK5em4iqsnJ28hQZT
 DRc7wghESfkFGOKUa0M2yn/7oPpzqmuKRBwroG2utOaMhocE/IR3H6GR37wow15BldZ/
 kkajFqrpd+cnhR7CzVXYwuKDft6BAGEK2Mrgvfu1BUDqKZvB5sf9AEojzzrkDStBwgdY
 PKfw==
X-Gm-Message-State: AOAM530M5JSbHqKKkcq+4u0M7Xi8LhYQQao92jWNT+/+gL2qEe763euI
 JMa6dE0wDTZtzijiBlPZsHwekVEDA2I2oegFTLYB+A==
X-Google-Smtp-Source: ABdhPJwBUJoeq1fEMpe3uTkaIvN+k1j04mhdDEm8i9uOFbz8p02OmxM5GDM5F9LzZiTxku+hu/jbRyDyjFnd497w3XQ=
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr451885eds.44.1603122365855;
 Mon, 19 Oct 2020 08:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20201010135759.437903-1-luc@lmichel.fr>
In-Reply-To: <20201010135759.437903-1-luc@lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Oct 2020 16:45:54 +0100
Message-ID: <CAFEAcA-F5WCv6We3V=kCV8vH79ko=KGHYWKLaxNVEd9HjFES3Q@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] raspi: add the bcm2835 cprman clock manager
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Oct 2020 at 14:57, Luc Michel <luc@lmichel.fr> wrote:
>
> v2 -> v3:
>   - patch 03: moved clock_new definition to hw/core/clock.c [Phil]
>   - patch 03: commit message typo [Clement]
>   - patch 10: clarifications around the CM_CTL/CM_DIBV mux registers.
>               reg_cm replaced with reg_ctl and reg_div. Add some
>               comments for clarity. [Phil]
>   - patch 10: fixed update_mux_from_cm not matching the CM_DIV offset
>               correctly. [Phil]
>   - patch 11: replaced manual bitfield extraction with extract32 [Phil]
>   - patch 11: added a visual representation of CM_DIV for clarity [Phil]
>   - patch 11: added a missing return in clock_mux_update.



Applied to target-arm.next, thanks.

-- PMM

