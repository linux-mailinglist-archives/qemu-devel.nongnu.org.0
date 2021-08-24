Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018C83F62A6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:26:22 +0200 (CEST)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZFg-0007Pa-2i
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZCP-0001oQ-U2
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:22:53 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZCO-0002vK-Eg
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:22:53 -0400
Received: by mail-ej1-x630.google.com with SMTP id h9so45525052ejs.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=003WK7OjiAKY1emAZQQqKpUSUTBMl0m25uZau6dPmrU=;
 b=rTEoj+6j/nySiW39T3VUbasH3ka5JNWGvDtKlDYdhPGBqWjFlKXP88/aJcAZaxu9ch
 d+Ob8Iw5RrTntlaQ+GqQrCcjwaivWZwsbfnWSgk0T3lgMJRymOjLTD5bofO6m6q+BqqC
 uN45bEFhRDJAxnDCQ1ieInvLppuoDS3dZbrOY/bPopNeFf57IPUwBfBs5fOTwe4YwycQ
 ZlEwI3BbkiSPeOJeYabSO//CD3YPyD2AllTjGQ2dY7X4KvJcUL665QrH+oVhkR0Rt0zU
 3GdIxSCCt3oVFcBTHfhodIyXbOqVHXQ0a7qBaKH60Jd87e1qC3TWdP5FK9lYARTs3DhG
 NGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=003WK7OjiAKY1emAZQQqKpUSUTBMl0m25uZau6dPmrU=;
 b=eBvxvUPR/Tg4t9scuw1pavI4i6Wv+fjiWHA/2kgXIkG1AbNDgbyAVHWnSKIpo2ctk8
 Nd8aUeHWXH4L73odwAB+ysEogONUGuHwJEAk/DncCDawtKm8Aij0J1qHMszVUAsVCxPq
 eW5HagcqWKgmkKBRv/XFEq1AuYUY+y8DRkCTdix40rJvUVBt7/f4pJBi30ULjt9zSW0O
 gU3YxwqSzukt/5uikVlEsthtYB+HD5iRMAZCxqR2cF4SiNIKfgNH+hxg9B3NiOP8OV1H
 ARpGJ1tPcZwwd5B7Xoq5RvlpNqqaucToLrO52S1qSBV6v3AgEtNiekZbD39u0UmEjanS
 3WcQ==
X-Gm-Message-State: AOAM5306WkoJ7qimn203+uvUE2BgiM2YadjSDMgWHa7cFigB2q9rkH8F
 oRjRD+J1zy2j2g5M3FlQdgyZFSEWedvXO/UTC/h+wg==
X-Google-Smtp-Source: ABdhPJzeHvR6k/7+9P4gHfjrJRyGNnFt2n1CDgndFgfqsaDKCpFlsaN8M/SSXlKSDJCKJ0Fx75RFOs7z7cfLaiE4nfM=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr41482204ejy.407.1629822170656; 
 Tue, 24 Aug 2021 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-10-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:22:03 +0100
Message-ID: <CAFEAcA8N4T4y8ij_Wq8L4oMYLyi_QLuj3cJ5YMRmS_-tH=NRsQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/30] linux-user/alpha: Set TRAP_UNK for bugchk and
 unknown gentrap
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These si_codes were changed in 535906c684fca, for linux 4.17.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h   | 1 +
>  linux-user/alpha/cpu_loop.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

