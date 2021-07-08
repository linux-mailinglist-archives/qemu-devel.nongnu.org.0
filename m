Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A363BFA12
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:27:17 +0200 (CEST)
Received: from localhost ([::1]:33794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1T7c-0005cx-6y
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T08-0005Xe-Qh
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:19:32 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T07-0006tQ-9X
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:19:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id x12so8229361eds.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=z7jiTI68EncpbZkbtrM9cc1BU2t9sVJneF060444JF8=;
 b=iPdatBp3OWaDvrZZN0Ji8sMvaLSCFWNCp+UJqLHprFeTKLNRQhaCR9t2dQdjGrT/gA
 gij9m72B7LAyBvCIDRqRT5Ze+gWCkWNJ/2LYAJKCfNePCxzGg/sqjvXvDZDIQZddmxyi
 p2uAOI3n2ZwttBDKhPomL4agTDaZzfhMzSFa50e9tRutGBlV/o77aPdaL/Lyx3M5ltx6
 uEEjBHSCHM9eHdqzn14qDBc9s+D6/lQfwF+R5OLikc9mIrX0Qgfeseg7iH+MZXmjZasU
 pYj4xBm8E/mEgGXUbja3ILQeFVLYl5LnzvJD6zt9FQtJZQQdZUiPjXwMc1THEm4sT4DN
 pKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z7jiTI68EncpbZkbtrM9cc1BU2t9sVJneF060444JF8=;
 b=ZNorqZfxtc9/qg6vy9quM5WxSPxAp3f795UkGxKF4XScoocFok1ngLKhZZpvkyHz4d
 wKQ5belqga7weR/Du2C4lCG3CTuEnwswLT6SND0DJgYuLQZfgdIiVRLkqm1jhMDwJJE5
 GJ4ay2sINPgM4v0+58d7FtHaIffZQCfg2uJC0zTl0zoDCEcrBA+7mTZ1OVGQXMeXDEb7
 EVrTUwpl+Ie/227txZyzUwtZtBrKaISeMNQKdcDNQJCWFwDbtRgp/I01buXl8gLjX6nJ
 kmv4l6wT0cYsbZTWlcW1xIkmiwvfHbyYcjqG8YTHbZCthCMypa75gq5hzrPkixM0A4o6
 ixZA==
X-Gm-Message-State: AOAM532oPQXBOMuD2ahR4xFM6IQ7B00LcPtaA7wISRH4nWuaxFmyKO9Y
 f1z6M3R+EqLn6FT1a0QD7XIKHVNnyXLsZ7H1NW7z4Q==
X-Google-Smtp-Source: ABdhPJySw//wEKBDUVwFQbLyl2WFHE1mPawIfxakbuhNS9dbXUioVXn+8grjOtieSQKrt/q9by3F0nxf0M3gqvycTFo=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr6682206edp.251.1625746770039; 
 Thu, 08 Jul 2021 05:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-16-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:18:51 +0100
Message-ID: <CAFEAcA9E892YGhvL8+61Pv1a8m1wGgE=Kx7yo5tOJoHf7S+4FA@mail.gmail.com>
Subject: Re: [PATCH v2 15/28] target/mips: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just use translator_use_goto_tb directly at the one call site,
> rather than maintaining a local wrapper.
>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 17 ++---------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

