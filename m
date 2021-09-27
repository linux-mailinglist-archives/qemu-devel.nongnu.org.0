Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B0419595
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:58:26 +0200 (CEST)
Received: from localhost ([::1]:38724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUr9F-00008w-C8
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqn6-0003iu-Jp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:35:33 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUqn2-0005KB-A2
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:35:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id k7so113730wrd.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIGp4El0H5rmc3iDgZk2iLxv0S+fHQLhFxcOHFU6tZk=;
 b=vef+AvXIZ00aGDhX4xZJN/ArwCLMNIQWEAe82hatV8Dj897ZLZ7IhYVs3kLffs+cnr
 R4c7WU16KJHWCZ59KK5CQ0nS0ptxS7QpnCwpxXngB9kJVgXdZq/XFfyWALY0e+HvXSUv
 Yot/HG4h/AhVOkcCRBnLIdXlzRdlVHu2R1D9df1nIMTht+lzMW3rbzETn2TJ6+YzENYB
 qxjSdgMmotFUVIrrKalwwcKOr3RgJp/gvhpmJ3JrSEUppxvrtvU+vlLEh2PfBs26tHT1
 jmt4p5s2eR6O6cbgKoWTQws7563I65BN7ynmXZEKS1NV9ROqwPeIR4kpsUh7v1QkhmDb
 3eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIGp4El0H5rmc3iDgZk2iLxv0S+fHQLhFxcOHFU6tZk=;
 b=FKq3kKewQRr89YuIyBHsekbNw+DjYwq2syAAn19cp84y8XhkdHUBCWgYRxwQbBLl6j
 j1Pn1x00kUvfyrgNtXXK7J1eipjq3+7rJjWHZBhysPC+Ne4KQUtuPk+JbBdb/01R/w/F
 wQ+nd0YrYyihqQHfLcAEzw1XhfU82fUrV6guX+Lq6qhFpE8Q3DzH0Ro+4aKeKJCCLX2I
 4+EcVl/azJtLsJbnzZYzvAK9qUsHdPVg8FDJc1x3jn86SgUZzzDEdn+uP3uNGkCcpk08
 sa0LcC4kdK4DLbc9/hrZ/UmzZxw2XHOqgZ89vN9xovHgBMo7Om3TCQ7qwdcnzt3HYT1D
 xLLA==
X-Gm-Message-State: AOAM533c+2wUKhaz8SECta1kszw49fDLyAmXGUrP1ecTrc5Km8fgOf8j
 IzQBRUux22UDv0OYHxjKrCPEkQsEHDdjJa3oFnV8fg==
X-Google-Smtp-Source: ABdhPJxOgmpFixvwPb5zVdoHhNHp6PYkSdkvUF6eFL5roBSeQ7eRCRbwsQYzOmL/isiYC/6JpHr9jPMzqMwFe6r84kE=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr19375701wrn.275.1632749726957; 
 Mon, 27 Sep 2021 06:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210924165926.752809-1-richard.henderson@linaro.org>
 <20210924165926.752809-22-richard.henderson@linaro.org>
In-Reply-To: <20210924165926.752809-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 14:34:33 +0100
Message-ID: <CAFEAcA9X4TpbYAYK2oYPDabUyRrQwy1xCjm9+30tCztev+suZw@mail.gmail.com>
Subject: Re: [PATCH v3 21/27] linux-user/ppc: Implement setup_sigtramp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 17:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create and record the two signal trampolines.
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/ppc/target_signal.h |  2 ++
>  linux-user/ppc/signal.c        | 34 ++++++++++++++++++----------------
>  2 files changed, 20 insertions(+), 16 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

