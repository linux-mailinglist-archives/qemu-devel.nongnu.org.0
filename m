Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB983AEC82
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLvz-00017P-77
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:33:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLuM-0000PL-Hj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:32:18 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLuK-0006dY-DL
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:32:18 -0400
Received: by mail-ej1-x636.google.com with SMTP id nb6so29399738ejc.10
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+LULoKTkiwqaF8EG1KdkrE2cIqPtPYwE50nLH3Ou88M=;
 b=rztMVbf2mw6u9DGHpsELZzj1rPqwzowWsjt62lGNjINBYNV5ocuaGAgDkkQ07gKJAK
 3WroU0Xo1t6mPrhymXICa5GNpjEF1vBYAR02n2YALzLk5KODtGif95d60gQ8RCQXmg6l
 59w864aVI/QGoV39ocIupecFjJt3mjlTb35L0e55NbBlIN6imZzXWhvtXOzaoy28I1L6
 O6K5XByB+K982r4pEpjf2Km/oLE/i7lJNUFwbPrnbp2Avrqc9xxjMtNtTEQZRdaMLcLS
 DYYiiM1q5qivfnLcvfr1jsFxfStFdo5B6uLZLq00nB/Wjv+98uYh9zqled5AROO2o4DU
 BzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+LULoKTkiwqaF8EG1KdkrE2cIqPtPYwE50nLH3Ou88M=;
 b=brHjUzDgZnSL1vWH9YRTe8R6O6BbxwrJ/+tr1vhHUQ1r9m+Wi/EvwCqSKGzLv12fZE
 RXVHtQuTQlQVoXX4+guUh6uYsfiQeGWKj06OMWfDxz8WP2fn+ScDZCCOVR7zO3eDEWtv
 ClVmpF9Jg+qvwVkI7rbwITuQ2I1VLDM4d6W6Lbh1k+G68KI/Fsnd5pGZoKZZ6Y9G2KsI
 uGGEY8v6LL33JCX/Y9mnZnQ1o+iInNqWm6uSfXmOyn8umUOctAyP8Cb3dpNhC7Uqpj1I
 rYBbZIB4tLXhTsZRy+2wq1QUvaLliNqksET4aU/+pyya/VFuZ2VpM4ta+nk4tH2R4IO1
 Jlyg==
X-Gm-Message-State: AOAM532howBdugNgK9aJYjkAh81Pjvrgysf5A3fOH1mDMe9vHbkL+FTx
 S7w09bcHhuaVqTQ2jWtjO7VpZhtmkMrCRCWbFmQ4/g==
X-Google-Smtp-Source: ABdhPJzzChPQ5/Asz1Z2Yc9PYmpIiQBrwGQaKdIQDjXfncKjQwoSpMwKomdqxqH7qvzN1UTR05XjHpoOvMZu8ayYI7s=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr23844925ejc.85.1624289534130; 
 Mon, 21 Jun 2021 08:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-27-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:31:38 +0100
Message-ID: <CAFEAcA8S0dQxcNViBCgHgqdZdbQsHurPNHfNKUXeq9Jb2szPcQ@mail.gmail.com>
Subject: Re: [PATCH 26/28] tcg/arm: Unset TCG_TARGET_HAS_MEMORY_BSWAP
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that the middle-end can replicate the same tricks as tcg/arm
> used for optimizing bswap for signed loads and for stores, do not
> pretend to have these memory ops in the backend.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.h     |   2 +-
>  tcg/arm/tcg-target.c.inc | 214 ++++++++++++++-------------------------
>  2 files changed, 77 insertions(+), 139 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

