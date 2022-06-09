Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E92545392
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:59:24 +0200 (CEST)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzMRH-0002sX-J5
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKgB-0007hC-Fo
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:06:40 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzKg9-0008T7-KK
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:06:38 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id s39so14974045ybi.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QUYL+XBF/6OrF26C4ymh5kwzvEoXvGTDXuWqTMuVFNA=;
 b=Krh07Sjk2iPF1HvfbYjKicBF4srU+MEYY7M6U8VN1YKc7t7g+AJL66XlpHpre7TbHQ
 lRoYZukfrDJXpbNKfofCiR7BvohEv4piVo978G6PoiKmWZHlZJMIKw4EiZ2Bd5siZI+k
 Sk8h9CCR4uTUkPZiEThjDflo1ZtVJe9xS4hnrFF5VzOrSF2Bb7cYNBNC1oVsJVUAE5ev
 V0Nw91VhldX43yspS3UNMasmKlPS+62hdeBF5whgkDLtZ0Y49I/t1f+PU2FPkVI9CGT7
 TqZ3SLZnjhiAG71BKMi9ovhyUUlVAjuG6ijbRb+oNEJhCOdTVfiAN/YNMdY49N705nSH
 gx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QUYL+XBF/6OrF26C4ymh5kwzvEoXvGTDXuWqTMuVFNA=;
 b=MDRJW0eZja0f7eL3zwa2h6n29ld45Z4a7sLLbw2gO3QCqZL5mQ2O9etiao2TRO0B0L
 S7dZYvYo7E0mTx4T0ALhcrWJ9ooFw0Cfne4GVdPRZR8NyyNoup0l9jr4a+ORRw01WTsE
 qpwRuX61sBbiBzn0mu4RE8P6mXMjepxcAHvlWhiO6ke58gwOKYn2GO1s5sHws2cgNlOa
 x1RqLCtRdfjPehFeZor/3smcx1velVtEN1F1EaG0t667eMlQQERW6awEfnoi44MDXo4j
 Qz5zj02CaEYPrgQZJfmmoZUNG9icV233zRtYORSZujuk+yd8F/fQ+u0T5Vr/djZX+5Si
 nxRA==
X-Gm-Message-State: AOAM531c9mmxrpxbivB5cYPq+TSv4z1IcN8MbLrjyMGCYM51cYzalHb/
 8VJYRE4dz6INkjItL0uigubuvK7OablnuE5mwU5fKQ==
X-Google-Smtp-Source: ABdhPJzapucyMRhTtXblIEAkOoq6Ln+cVG5M2JQ1xmdS0xveao0mRFK/Knpz6RasyPFL0R56EWUzAI9eCOQu3m/xVv8=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr26229314ybt.288.1654790795339; Thu, 09
 Jun 2022 09:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-14-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:06:25 +0100
Message-ID: <CAFEAcA9nPuE_LFrsmr6eKuJ4ac=LdQURyB0jt_w2n8RqOo-RBw@mail.gmail.com>
Subject: Re: [PATCH v2 13/25] target/arm: Introduce gen_exception_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 04:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create a new wrapper function that passes the default
> exception target to gen_exception_insn_el.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

