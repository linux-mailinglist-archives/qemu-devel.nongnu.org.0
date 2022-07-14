Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FF3575106
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 16:43:37 +0200 (CEST)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC040-0006dS-AL
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 10:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC019-0002hK-JT
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:40:39 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC017-0001oN-2M
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 10:40:38 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id 75so3565711ybf.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oIc470HtpfblUvG6GfNwrecnOEh3+GQdhPGTNYKIECY=;
 b=KoGXyKaDNj67v6ty3zSjCFENdSH4STDab8LbfjSBcQPK8pqQacvO3+eVFLXHEYW6iY
 hnCzLviqyre/SaV028iQUcNHMoBljZ2kLlbG9ve8THrA6uOEH6zD4TtcneQxx0gpQ9g8
 F1erTdZIybpM2ZJhVGYaJfLYx53hfRY0t5VKHs929seoJxrduGKcv0U0d2wwy+sMBfUL
 3WHo1hMbe6u+PGOIQqGKPMrZrgbwYM+osl6gMsD5aQdV/oDO3zyMUBXTDnjdQ6QvYj2V
 DaPzPe3RQEv1BeJY0vXx2O2o06vO40VChgfSF+CJyzh3Ym4gqTGrFjExci+0JsFMKVW/
 3TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oIc470HtpfblUvG6GfNwrecnOEh3+GQdhPGTNYKIECY=;
 b=bIGlGwpmTx2Fj8ZyBe4IMjm4q5RyDr5MpJQJofVKjdGn6R23UXM4vbgTdCXequUzJ3
 4Su9WAif+rzXKdL8icggO0azVsGrE2m0O6LQsLexP3J8lrHNdKZ3Brs5fEIdjnPP73UT
 MBuGnAKlzNb3wIvmJcSw1alPYVJ7zAH+77UG55VZ/7wAakXeFNdtmyU1ozKpsYJfHaeY
 eMTVw8G8r3aef67I47asypv1cSu62aC6wtXCclUk1/ArGDuDPpL0LvWqnNMFw1XQrbzo
 V1kJcCpae9ezMrXt16ceHr9WioCfA+iIFjb6geKJtv1lQUt8gyxyC1fn/CN8GgyeLnfx
 MHVQ==
X-Gm-Message-State: AJIora+4flN6w+DzfUH1BiUmDfMIMFWsnvoUUYFvznmvQInnC1vcfveL
 N08MNEFU0oSyqdzOLv2wIGSis6KgiZUqBVfihZHQ0w==
X-Google-Smtp-Source: AGRyM1tWiN3fW8uduyRJKNQD6BVjFrHWb5xstPD+Tgo5ixv9Rovu0iqIe6zmfOeXhFjDfIb81KlyJ+Rmxfs6ASYO5jY=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr9502762ybj.479.1657809635469; Thu, 14
 Jul 2022 07:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220713045848.217364-1-richard.henderson@linaro.org>
In-Reply-To: <20220713045848.217364-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 15:39:56 +0100
Message-ID: <CAFEAcA_f=YOWRk078WWkoCKAt+ccEUc3csDcpwO7FwZMNsu0gA@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Two SME fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, broonie@kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Wed, 13 Jul 2022 at 05:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Ho hum.  Let a feature loose on users and they find bugs.  Mark noticed
> that the wrong value was being picked up for VL when SVE is disabled.
> I had run the same test but failed to notice the vector length wasn't
> as expected, though the test otherwise produced expected results.
>
>



Applied to target-arm.next, thanks.

-- PMM

