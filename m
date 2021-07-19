Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6823CD1F9
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:34:54 +0200 (CEST)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Qbt-0007Vw-Jz
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5QYM-0004Kz-KG
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:31:14 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:36540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5QYK-000218-Um
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:31:14 -0400
Received: by mail-ej1-x635.google.com with SMTP id nd37so27858672ejc.3
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zvh479EqRvwDdfRuKls8u+B1aH64zJ3cJoMVr7x2GlM=;
 b=QE3eEUmKCootzIHwRd9sWg9qyq6OPCTCFgNlpmWTZpyUFXbXgVtXmQz42J+FcufHVW
 DT7gwUMr1AlTSDMYDhJcQUFke9SECF0WnM6Qgm98+/cigZPNR0bAPOFuxqNaMQYTIVeA
 6EX8z4cCt5427SQYT8pFJvNQk3Z+RfzLQmhGLSpATg+oCa00Kzq9riajoP++Zbx8ATmO
 1JmhBS432hUiMpN8yc5OcagNysW8G4BKzbt8GST3tjMrwaEggNWCrUp4GJt3P9pdXooo
 xvgcCYuNc8sNWlaDTMJJ66mZ7HBfk+/Q0qno5+0/BpMJd7LKzrjZRV8+PSG22U7o+Ati
 bHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zvh479EqRvwDdfRuKls8u+B1aH64zJ3cJoMVr7x2GlM=;
 b=POaG7OuSitX0Xm127hQGuko0MuHG+rRJfLV4pfzyOPkpJG/x7w/0BiVqAh0liMcPxF
 +nhIHwWDbzzExOtLvtdCM4ZzDzdY4MyFxxhsOKzSeGbibDCu+a295yb8ezn9WJAhnN+G
 MPGhrujd0TJxE3DDRseJmO08SJ5ePbgA1rlc0m1Nqm1Xxoal3yL/yKRECYw5ELJcgxIC
 UwNDBZeOr6XtHiTdzhxHIQPna+k5uxjIMFWgmQkLdM+Gyi6P2/iCWNcJfJFqkyCzyqJC
 N2wXyVpxO+1nHMzJJdjBIO8CGsNcJ0UHjkmxk/GNAGVPIbWIncNJjw9qo8ktSJEvkfae
 ll8w==
X-Gm-Message-State: AOAM5313cMnzgW7QA8Tag4ndj5V6yOe6RFCli7LyrsIpmayBsLsTIqsm
 C/S/9xi0nJvNMJhCfoaIyZ87ZPka0M6OyZAT1UoKtA==
X-Google-Smtp-Source: ABdhPJyodEnjciUd09AMk6QT+AbtFseNbPcp4bGXXOjQcwj7kHIihwE4nEDI2gBYkyt6x2sSh7OZhycTkaHW42IaK9Q=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr26000464ejy.407.1626690671286; 
 Mon, 19 Jul 2021 03:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-14-richard.henderson@linaro.org>
In-Reply-To: <20210717221851.2124573-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 11:30:30 +0100
Message-ID: <CAFEAcA-6-N0AC3ptqNRN2WYw0MjpFjBk0Avywk6+RWHR4HUFtA@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] accel/tcg: Encode breakpoint info into tb->cflags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Having this data in cflags means that hashing takes care
> of selecting a TB with or without exceptions built in.
> Which means that we no longer need to flush all TBs.
>
> This does require that we single-step while we're within a page
> that contains a breakpoint, so it's not yet ideal, but should be
> an improvement over some corner-case slowdowns.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/404
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

