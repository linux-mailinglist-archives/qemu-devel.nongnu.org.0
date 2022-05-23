Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3775530EB9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:52:47 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7YE-0007No-99
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7U3-0005LI-3e
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:48:27 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:41832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7U1-0000Np-DE
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:48:26 -0400
Received: by mail-yb1-xb31.google.com with SMTP id x2so24845721ybi.8
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fBtc7BXtI/ftVZMF3jNVYifsDzdCNO9+l2YdWvaMhGE=;
 b=oKEWj5tkJ1zASJAY0eSMgWk7FkBMNImckFwioMmg3t46W0LIHLdLa73rb2+ej99gGg
 zkcEL1zyw6rPqyv0vr8Z928SQXijv0uJ5HZ599kDJccPfTlfQ3MEy9pdWc1LQGotZ1xU
 EnKAgxP9AGTb9uPbpoR6J/ptN5aj//iJV9Jt+nO4M8tf2xNjIqA1CH0Q801CqVTyBWbV
 bdUUT4HQcC4XcV597S75sODXj0nmvYdUqY0xxgZnLST/3d/vqIopc0rFRTQJ1xLlSz47
 +ZZXd2Wb0ii7eWftrq5OOsygb0adV24vbU1HEzJcZKBTeCB4oa6uHwhZlTInGSKznIEC
 HaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBtc7BXtI/ftVZMF3jNVYifsDzdCNO9+l2YdWvaMhGE=;
 b=BSP3eFUoP0P9/AckJTuWsvdAwKByt++WMy5gIzDtVxUOXTwE0C1W7208HUoWvqYnvB
 Qsy7tMSOU93ApoYseebnV+jxI9RKL31FohecNV2dsMXSe4eF4KMqJ/RS60z631LNUTep
 nlX0rfb1odyLlwwXCnIw8I+qZFh8VAmc1sknA7rXUJAc82SbTnpvUq7wjnn/PxxWdDEP
 MoolomgCBJd4rqyKHfrz+jgdUQgXLFKv7xWCJokWudKfYW1LYwK0xurcasgZbT0YJblR
 sAldc3CiqTJtYt1MrHVOySvRi+OfMiuvH7HnCQnstFC6YYpSz+gRqCmmICi9lpEelbzZ
 9hgQ==
X-Gm-Message-State: AOAM531+8ddak5gtGfSOyMMMnkgLWnn/07xcIzs6YFGcvr4/52wByQvw
 Q1Db2jrxpNeyL7Au9qllPlHsEppSsbbrYAJJFPne9Q==
X-Google-Smtp-Source: ABdhPJxP3tRXEFGoE1DaeQWO9Vydj8liL1TRXla4ibFn2uyPGQcfCyNO2xH0yNgQMs6f1jkp3iBevf/H8jhsm7c39PU=
X-Received: by 2002:a5b:c08:0:b0:64f:de42:5ecc with SMTP id
 f8-20020a5b0c08000000b0064fde425eccmr5067087ybq.85.1653310104396; Mon, 23 May
 2022 05:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-19-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:48:13 +0100
Message-ID: <CAFEAcA_bgE7+5P97vksC0net-tW=EDHymfVC4SwXMV919N+epQ@mail.gmail.com>
Subject: Re: [PATCH v3 18/49] semihosting: Split is_64bit_semihosting per
 target
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split the function into multiple implementations per arch.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

