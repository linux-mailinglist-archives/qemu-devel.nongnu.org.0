Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7421562B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 13:16:35 +0200 (CEST)
Received: from localhost ([::1]:45444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsP6w-0003FO-Ur
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 07:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsP65-0002ji-F9
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:15:41 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsP63-0006uJ-DZ
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:15:41 -0400
Received: by mail-io1-xd41.google.com with SMTP id i25so38996118iog.0
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlyPj1KofBzntEv32O1a/3aj97/YSpS2IBpqM6+XB98=;
 b=S7D1vG2yzwulMYxD5pXxjiMxvrgrCeDzg0oU+G1aAadA3CAA0oVXVTBQzIEsmbx89x
 41q+9/xd+b6xXQ0gZVuUVcaS1Wg+yO0xI2kEbQyq/LwyCXJZSa6LLg9aGUJ3N9B6Z3LY
 IFB8u0oIHgWl8r9gJZ/uHUaE4wDv3RDn7qMWd2NbxsIRW6pLdi0ZJWZ8bdaWcH2KJZIz
 IkZ/R+cHCN5oSqEKRMrBHvJuoGDs6tqvF5/FwKrr1ISmtHRCU6XDHe0fAFC/EcJPXWtn
 8MT62tjrQ9EKIediEZl68OJfZJ3jZFyE3rYSEEy+o/WxDktv9qI+F0LvdCzJX+vo9Bcn
 mjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlyPj1KofBzntEv32O1a/3aj97/YSpS2IBpqM6+XB98=;
 b=K1/bo1dyFT85Rtj7AjVYD9yS9oVzcvwUFzgLqVpy8H+qMUkcQp4qmVSK7IZfJMYLKp
 O1PYRwb1bsv0UgBugkSj2BnhWmjdTgvRrDM2iErWrS5Lx24mylYBgLhGatoPIH4av+Y2
 8OQ6vvtjFZPY9DKVEnxffq7UYcwXcRIf1k/SBQKeqc83lW5vXRRyMecSJ8wiMuwWo/vK
 ky4Srd2q7fTYdAi2XS3JtlfhSqz5A/4guDxibosB6ONh+Zm5z7YDDs9V4fFklEhhENgF
 iC3wwat0ZZi+3dOS5eY0C35KTUNJSfUU61RYlnoj3iJvpQAcQ4Fq2UrmQgjlaEBv3XjK
 4wUw==
X-Gm-Message-State: AOAM5309sWRwNx1ovcBtPiosUHZa6u+AZX8tYhyoPwlYYTVY4qUJD2de
 CM9+4cJxriqOcLI+PgNNfKOD8e7QDFVa/FvQvxulNw==
X-Google-Smtp-Source: ABdhPJxp4hyBBZReyOkIK9uDtPkpvaGlpjJN8qregJsuJ84wZW+XXadwEGYJDWULQAJibOdjAtgkhEPHhE3dQmAi4j8=
X-Received: by 2002:a02:9182:: with SMTP id p2mr5643623jag.69.1594034138161;
 Mon, 06 Jul 2020 04:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200520172800.8499-1-richard.henderson@linaro.org>
 <20200520172800.8499-6-richard.henderson@linaro.org>
In-Reply-To: <20200520172800.8499-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 12:15:27 +0100
Message-ID: <CAFEAcA9Lm2+hAEsaSYM2x7Q_gVV6a5edD1BBwjavwthnvk71xA@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] tests/tcg/aarch64: Add bti smoke test
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d41;
 envelope-from=peter.maydell@linaro.org; helo=mail-io1-xd41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020 at 18:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This test requires gcc 10 for -mbranch-protection=standard.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v9: Expect and require gcc 10.
> ---
>  tests/tcg/aarch64/bti-1.c         | 62 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/bti-crt.inc.c   | 51 +++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  7 ++++
>  tests/tcg/configure.sh            |  4 ++
>  4 files changed, 124 insertions(+)
>  create mode 100644 tests/tcg/aarch64/bti-1.c
>  create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

