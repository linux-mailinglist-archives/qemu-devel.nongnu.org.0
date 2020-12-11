Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0DF2D79DF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:53:18 +0100 (CET)
Received: from localhost ([::1]:56976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkjN-0001TA-L8
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkSe-0007yW-6J
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:36:01 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knkSb-0001Oc-Ao
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:35:59 -0500
Received: by mail-ed1-x544.google.com with SMTP id v22so9763186edt.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 07:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=63G5y3EwCA1Fk9RLyqiZH89/eHjiCrdaeTHbpxtZ3BI=;
 b=j3m9Ert8KtMTCJY5Zy8MTCUKdjZSPGLaMeCD9ZXIHfDQQoJcF/EhiwKWqKqEFb241m
 C1w+4dCbXcTSGzPET32ig45DKz8v93Y80Y0iytX4CKM7H/cnqay0l+OzmzslRY9GZ4OO
 x3Spu5sOvZOWrcmZ0bsSbklxr0ZvAoUTqsGiyZXAWRmRKfFwfFQb7MhTbnGn0WTjZHPO
 769Uc9J3HrKJZBcWAlKNOw1uBiHhtG28/ZAYlMhkPp9RYs8nADeWCOtcA4KQrSSvCtUu
 44kRSakBr42EiJRRVopgvAkggT3nGakvKVIZNwEZKmgwqNCj5cl910pk/PSsR8giE3St
 6qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=63G5y3EwCA1Fk9RLyqiZH89/eHjiCrdaeTHbpxtZ3BI=;
 b=JAbPrrYk8x+N+UJ9jPqOXcO8MxUO5KXuSZ7V/Io5T8impN7hu2qtKYC0Esvq8wd7g9
 Le9g0G29kn3+AQ/yjH/R3TGW1/sgY+i5wgE0K+XYWLJSFIl4YckV4br9T/7PaycB4xNn
 ndEqSeLUdwVGtSgAGLASv77b7pDN5Os8F27u3yoKStCkrmmiyeT3q/iFryhZheQSYKxE
 qkMZ50y8Rv5lnJ5tNITjcGld4aTJNO7dGGSNooBJNxP1mZEj1HWZrbMtpOXKEGQUPyQk
 3WUzRQ982U02/Dy1tBveUfPPq/C4Q47ns6qpfkuKLQ+JLd52Fj8pLBXaiFpCfZ4fAmzi
 3BgA==
X-Gm-Message-State: AOAM533/gtTrcq2QsL8cnmffPWMu4e3fA/kmbeYxpqJgbwVbxt/Y9v2s
 rvwsldU5pqB00RTbLcHnTWK534XwgQTiun7H878PdQ==
X-Google-Smtp-Source: ABdhPJy2ztYBk6PA/ZNnomuf7Ksk55EErbAPvzyI7z4H/krQVX20vY/Bh1ZxhqKk6ram4ytMvnYZuOujPUgp10qsHrI=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr12272700edw.52.1607700955307; 
 Fri, 11 Dec 2020 07:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20201211152426.350966-1-thuth@redhat.com>
 <20201211152426.350966-2-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-2-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 15:35:44 +0000
Message-ID: <CAFEAcA9DN6GHHLEYTHUkiywmwWN-iHTiTHG2N0Bp7rr8J6ne1A@mail.gmail.com>
Subject: Re: [PATCH 01/12] disas/libvixl: Fix fall-through annotation for GCC
 >= 7
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:24, Thomas Huth <thuth@redhat.com> wrote:
>
> For compiling with -Wimplicit-fallthrough we need to fix the
> fallthrough annotations in the libvixl code. This is based on
> the following upstream vixl commit by Martyn Capewell:
>
>  https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337
>
>  "GCC 7 enables switch/case fallthrough checking, but this fails in
>   VIXL, because the annotation we use is Clang specific.
>
>   Also, fix a missing annotation in the disassembler."
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Let's not block -Wimplicit-fallthrough on either updating
our vixl or deciding what we're doing with disassembly more
generally...

thanks
-- PMM

