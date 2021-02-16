Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F431CB12
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:27:20 +0100 (CET)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0Nr-0004mr-Kd
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0MA-0004Da-Au
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:25:35 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0M6-0003Yn-Ae
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:25:32 -0500
Received: by mail-ej1-x62b.google.com with SMTP id g5so13016456ejt.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vQN8Jp0Lg1pQZzgeCJ9p6l+tibrhd72tY4e/WdrrSWM=;
 b=Jch2w385yr3s0B8yI/AIvRBAXeBB1wwj5l90V9YgKcTXzwVteYTuSBeHUrhlXAPLT/
 s1E7G7Omm4fRnu9M507wsutg/XWOueSxmUD7bSuS4s/24xb3FSt5OSZYwhhl/8YoGpii
 CbzNGMssKKMFyuWl5bXP3R1hVFhHQ4I35lKyX/qJze0xma/3RIUQsk/1WL5jU/Zi/fXR
 TxwGn5wYZjpmJRlls1MCQ3hWwN9Nly2Zd3s3+CpFR2QmCONnSgtR9xGE6TZkRVCQX/8I
 1O98zDM08HqvCOoi5+P5IsRJFAzQvgcSabooBObRYDZLMTHQKSQMWd3yL5xsVgjBXVPE
 fOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQN8Jp0Lg1pQZzgeCJ9p6l+tibrhd72tY4e/WdrrSWM=;
 b=duyi8gLEiZE9i3EvmQ93/y+xlFnIhgMLbcx/Dh6EyKwahh9ZzZpME9Dyg3FKFJpF9Q
 BhIyAdeWIQtMoNJOveaANCvKzZooQ50mqYjr1omVGtRr4fZybCvz/vrMbsEaJSKmHFmd
 isIXJrl8GiILyn8NYWZmCYk8FBQWjgScPO3i2YBEbyao87a/tu7aOKh10WQ72jS/PHjU
 bwI8ZHeEDcu6FRl+gCs29gKiHg7713+LoVJhRovk9Fxbkbk0P9VhSO58CGaWPlHrGpP/
 OCn1bRJ18S50kxbBvfhuvT2vPkRYO7aqUF7Y9mokeMJ9En9wV90C139Rd6WM2rAepWdO
 h3tA==
X-Gm-Message-State: AOAM531jxfnCHjCrlEE35fIXhmSGFoSie0wLC+XXrhIGgZ+jlY1e2P93
 qy63rTn0hvuxHE81CmyURLa8kr9c5dGN05vBDAo9Uw==
X-Google-Smtp-Source: ABdhPJxGfoqnziSNNUXrF0ZxGweLiaMUykdFyjMUOqdKxutNEHn1/SNf+FzxNT/xhya01emyV4uflmg9A5nyf8qn+xE=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr19914919ejg.382.1613481928313; 
 Tue, 16 Feb 2021 05:25:28 -0800 (PST)
MIME-Version: 1.0
References: <20201102163336.115444-1-alxndr@bu.edu>
In-Reply-To: <20201102163336.115444-1-alxndr@bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 13:25:17 +0000
Message-ID: <CAFEAcA9d=ZTXzK+u5rjFvkiA53izTBq5Hm5VwQ9=WEAZX+TRJg@mail.gmail.com>
Subject: Re: [PATCH] qtest: add a reproducer for LP#1878642
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Nov 2020 at 16:35, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> https://bugs.launchpad.net/qemu/+bug/1878642
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>
> Based-on: <20200717151705.18611-1-f4bug@amsat.org>
>
> The added testcase will fail, unless this ^^^ patch is applied.
>
>  tests/qtest/fuzz-test.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tests/qtest/fuzz-test.c b/tests/qtest/fuzz-test.c
> index 2f38bb1ec2..9cb4c42bde 100644
> --- a/tests/qtest/fuzz-test.c
> +++ b/tests/qtest/fuzz-test.c
> @@ -34,6 +34,19 @@ static void test_lp1878263_megasas_zero_iov_cnt(void)
>      qtest_quit(s);
>  }
>
> +static void test_lp1878642_pci_bus_get_irq_level_assert(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-M pc-q35-5.0 "
> +                   "-nographic -monitor none -serial none "
> +                   "-d guest_errors -trace pci*");
> +
> +    qtest_outl(s, 0xcf8, 0x8400f841);
> +    qtest_outl(s, 0xcfc, 0xebed205d);
> +    qtest_outl(s, 0x5d02, 0xebed205d);
> +}

Hi; I just noticed this, but why does this test case pass
"-trace pci*" to QEMU? It doesn't look like it does anything to
try to capture the trace output, which thus winds up just going
to the stdout/stderr of the "make check" run. Similarly I'm not
sure '-d guest_errors' is going to do anything helpful unless
you take steps to capture the output and check it.

thanks
-- PMM

