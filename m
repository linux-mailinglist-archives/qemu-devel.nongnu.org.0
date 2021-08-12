Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0203EAACE
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 21:19:21 +0200 (CEST)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEGEb-00060C-0P
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 15:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEGDG-0005Kf-NT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:17:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEGDF-0000Q6-0q
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:17:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id b15so13561479ejg.10
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qSWrnz7LY9LYsKSCLB3PYE9Syt9Yg4KsUkIsqJQgiFI=;
 b=ZH/XEJHsR5vjW9KjPIlWMgAnK4InFXXAf3wZTMaEnFEqO4HORnpj0ooOPPTHrfiEAW
 Tm1+7COf0ZCv7gQBPGrRUdGvtor7P97c/sERExemMqK6E8UDc5X2Q66nRE64tR/9cYoS
 grNEznnd3o4OEIIOrvrx7Af/ZsP5Sbu7cafV1qwkusUeg+cHyRlwJ9foMJb9S9/XmfHY
 IdJSIyXO5sXY+0E3rzZYoJmBRGjbxmGNWF2Exwl/rc2HUeSIMOb5JdQAfliB/vEiNpuC
 G6egLfYbGLd29lEZRUVI89EYspWnbmkUuNNLJ/Ga+8rPohbOG39pS8/grruG7G7Nja98
 vzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qSWrnz7LY9LYsKSCLB3PYE9Syt9Yg4KsUkIsqJQgiFI=;
 b=oP0oUXmNdKhR7opmjBJW39Y9Bn2ruvEb3YA8vLUyH7vDq/hO4V84BHYRLB6virUyDb
 lOJENFfIiHy9yYh7l/X/9actEaPVyxkHhkpd2U5dAHYNXLMxpyd1+KQtdzpNZ8pLgnfJ
 hp3hoY9wN7YrfiM8mow3eNKLx4/H+7Nml5nQQyFihH9hjwcKrnv4ars2fw1LYQG4XRml
 NgZJkybPwpGnDci1Z2Vzyo50cJCHv3s0LW8ukdhj4UnJTBSx3a434R0Yb36SwJKle/Il
 euss2HqmlXw7gmqoQDKBXakRLqFmF5NvR0XOC35Ucbuq17m0YYMvkAlKKNuM+B3D8mRL
 GuBA==
X-Gm-Message-State: AOAM531/3O9nzVjIWWKaSoWQ4TtJFHjVSaxkt8JLGytYGxv9AM/5kDJc
 npMW+0iaISqO+5sJGuniiveMabVEku1dAwZjxmC4NQ==
X-Google-Smtp-Source: ABdhPJyMs1YacuqBUst17KMLYdxh5G98qrorOzggCt1R8FjZsNPQAW4UetrlYeUoCbMMJ18RPAg5yVcymXOs5Zrp1Ds=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr5107840ejy.407.1628795874988; 
 Thu, 12 Aug 2021 12:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
 <255eb0b2-26fb-7172-f603-946297ad6fe7@linaro.org>
In-Reply-To: <255eb0b2-26fb-7172-f603-946297ad6fe7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Aug 2021 20:17:09 +0100
Message-ID: <CAFEAcA9=Xv83cUvmx4Up83_GcsqrXiugXkg=b_AFvjjUfa7gHw@mail.gmail.com>
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 19:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> PIng for review, or this slips to 6.2.
>
> On 8/10/21 1:25 PM, Richard Henderson wrote:
> > We need to be able to represent VEX.W on a 32-bit host, where REX.W
> > will always be zero.  Fixes the encoding for VPSLLVQ and VPSRLVQ.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/385
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Bug report says this isn't a regression since 6.0, and reporter
says there's still issues with this fix, so I think this is
probably going to go into 6.2 anyway. At any rate, I don't
think it's sufficiently rc to make us spin an rc4 if we weren't
going to anyway.

-- PMM

