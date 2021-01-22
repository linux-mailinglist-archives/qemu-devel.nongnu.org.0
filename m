Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345A3004E4
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:09:36 +0100 (CET)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2x83-0003UE-CK
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x4X-000829-Ff
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:05:57 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2x4R-0003if-Qk
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:05:57 -0500
Received: by mail-ej1-x629.google.com with SMTP id gx5so7811631ejb.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yFrKLdd8zhMzyz4BPJ+zMbVXNOx1ub5XV6ppCJfcLc=;
 b=IrZtBrqWOB6+zrIAcZm748gbMQqRNpTAw2ZphUDoPRIBGVsYX6ENKwY06JCAddXQWF
 q5M7jh60uWLKN3WZOVAGgsoMU114iIMt/+4OGOxYU3jRo8NuTirhQXq0Go/twg+5/6b2
 zgl5tf0rcZrQ7smZBe5r7DZ9fuEMIFiQ54o0dtNYgZc5KVUfqjBE+l7SM0V44c0kxOjv
 9bN/8Kwa77SYJC40VAbM0+L9cgVq0VO3IJcp3KHJ2Pqb4ib1z+v0ryythAEaJBXoqJNS
 U7TfIyJ3hrHPQKsOtwAWOSqMIZZxX7oocFX+eLpllqaWjyWaDq+iP/vHHo8OQ+y6WBWZ
 vvYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yFrKLdd8zhMzyz4BPJ+zMbVXNOx1ub5XV6ppCJfcLc=;
 b=FEkofg0/0ZlRtDPKn1crgBPTYXKG5cGezSrC6a8hyBil3VxQup/kH4mvcMlQYr7WWq
 1XW5SGkqPP+nG3q2G6ROW7925t0Fkvs6l9eKscy3Bv/fnB3Rix2el2A8i1tg862ZfOAx
 SkUuuMm9TbPnzvubrRHVF6xH50eROX2IBs3orTpL9wv0iYqJffc5HqMvAU+2vMgGCRFn
 PnvNaYWLyibo9l23LythU5qABbIViJttIin0ApaKCsGkboup/G2DmNHB4BenofNr8FM3
 dy7vlEvU/WMVMLy+4T0c/eGxjkmCSMjeb534V9A/IDCeBWg+prpg4oGkYtMg0qr3xjDk
 jVOA==
X-Gm-Message-State: AOAM531p67DzsMv9ieR902EK1nodwLPPkINXPMnQLYodRt3LVGI/mRqI
 /NMJ00Y1hUfuNqS560Rm5OeV72hZFLWQ4baYhbrHRXWZrCU=
X-Google-Smtp-Source: ABdhPJyfsibzbYkl6UOgd+b/FfwRqcvFDNf0gBVmBxocF1VJZj5t8oxc/2r7tWBODqfxwoFBaU1iR6LZ9kfdXLfzWWY=
X-Received: by 2002:a17:906:3d4a:: with SMTP id
 q10mr3089746ejf.85.1611324350392; 
 Fri, 22 Jan 2021 06:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-20-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 14:05:39 +0000
Message-ID: <CAFEAcA-6TVj0iZXMGs0N2Km=qvasW_TTGoamFGwkhwP0ED8EKQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/21] target/arm: Add allocation tag storage for user
 mode
To: Richard Henderson <richard.henderson@linaro.org>
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the now-saved PAGE_ANON and PAGE_MTE bits,
> and the per-page saved data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

