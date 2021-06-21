Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF28A3AEB2C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:24:35 +0200 (CEST)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKqo-0003W1-Tw
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKpH-0001Pq-1r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:22:59 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvKpD-0007aZ-3q
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:22:58 -0400
Received: by mail-ed1-x52e.google.com with SMTP id s6so19167928edu.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XMTdlmXKGoKoaGP6w9CtjmIbz+7NkS+NiyAwnG+7HO4=;
 b=S9ctPdlVk079P/LIFWuzmX1kHcnk/Ez6IxhrNDI7VLFF9DjOmi7mcXaitQyU1/tJIJ
 K3yvMnEfsF06Gjakj9ve91jfgkIa4Dljy9HHQw62hRtumwQJ4vt4nu20jbPzvNjlRs5p
 yXosBCZz1OUPjFjti56RX9yEaiDxX5Zryx4lmwQhoReOh0BUKylDzGHGilMjH1TrMs5U
 jxso323Uoy0Luvk670ZTcn5RsEK4dQ2SNeTVKKYDbchzGfag8+e+D4j5g2uQr8pngBNs
 7djfhrFsKsEFusbKi2Q1EXCU5FMMOtv4DAXahOX0FuP+ZYy/8SAV4mIpw/zx6PMuHK0C
 CZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XMTdlmXKGoKoaGP6w9CtjmIbz+7NkS+NiyAwnG+7HO4=;
 b=hmfqrjGSCdJxeX4RlleJ0qz0kdAFQWZrMxk0e5cEAG/3m09j/GVXUgVVC2+nzmGHXP
 B9ebO11Cgeho9biM56SYYngTx8nVNhMpQqalrjTpn9Dg5HUsGK+RXMTOlAew/TcisDVd
 N6evZHGlkWzMGZyS9px2LbxH2TScju5LUt89DJUx2m6AqtCivrSeI79p72h94xIGWGH3
 Lkiuelg0Q3E+2o9eMiQTjjMhP1O4rG9EyYr366XXBL5P+Viryi6VZFrN/6VBLmd/pRnj
 WH1ksr4hvKJ7Z94JUNIs8UgKfKIn2aHbfJge/POaAsGBZXZUCdY9jnfgtK66TbjKoZBl
 qzTw==
X-Gm-Message-State: AOAM530OMlEWKk15a78ggMZ4oHgW6HSm+BYzV9N8L+f8TDYEdBw1Z9eH
 gtpa8fFktM75VaDLB23mgtvxQrI+rNnMdmtvIpE6tQ==
X-Google-Smtp-Source: ABdhPJyGqZ8wGlJzJ3IrsakqB+iUp/0MAtnjiixeH819ZZj6lZmgu228pJduC0LC84jbwy+fT9va7OImybDPVLd6Eko=
X-Received: by 2002:a05:6402:759:: with SMTP id
 p25mr22192925edy.146.1624285373296; 
 Mon, 21 Jun 2021 07:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-7-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 15:22:17 +0100
Message-ID: <CAFEAcA-5WCpC=ZZOL5Sj8vwkac6auUF7VxRYzD3N0aRJbaYq3g@mail.gmail.com>
Subject: Re: [PATCH 06/28] tcg/ppc: Split out tcg_out_sari{32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Mon, 14 Jun 2021 at 09:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will shortly require sari in other context;
> split out both for cleanliness sake.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)

>              /* Limit immediate shift count lest we create an illegal insn.  */
> -            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
> +            tcg_out_sari32(s, args[0], args[1], args[2] & 31);

Maybe the "& 31" would be better inside tcg_out_sari32()
rather than outside it? The sari64() implementation already
implicitly ignores high bits of an overlarge shift count, so
having sari32() do the same would be more consistent.

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

