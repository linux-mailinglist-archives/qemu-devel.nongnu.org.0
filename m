Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F7153E462
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 14:32:18 +0200 (CEST)
Received: from localhost ([::1]:34612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyBu4-0008UA-Ss
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBmk-0003yu-Kh
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:24:42 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:39488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBmj-0000rb-71
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 08:24:42 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2f83983782fso141106117b3.6
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9KquZqQKJqPdMBV+cYemE94zMrosLHxV8r2qmsniTuc=;
 b=XKADugigHr1PNWXUJiEVFtQ5dD26nD7wYz+Irmnidhdunk7a2jQNn00aZeSlauYxsH
 bNVOA0MCb2gWKtEQpjd6oqJt7RwTDhr0fAzY9br6UlztHs2LSy/lIV/568rjQusiSSPu
 sfAzw8MCrnrPJFlbn9Xjg26KfFQvKzD3ebPkr5qao9BWN19KD7ie3nptl+4vrGV3r76P
 dGQCIx0fYRYm1tCOh/7ggk4MrStRHUUI1oKILF3wvdxt5MydDavAinxjbGJVZ3T3Gdli
 GRsgYNf6Wsme2UvN6KkT9jZlOnkmP52VZ7XOA3hjlKg+AlnX0yL974d0eE7vJ23suXxG
 gcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9KquZqQKJqPdMBV+cYemE94zMrosLHxV8r2qmsniTuc=;
 b=OiGUn3sGsALougq1DYFgA69DCJPNlJb65GyjauDDedviJpQggvOablfarmw59fTvDE
 QdsqfHi+ionExtax0fycER38ImiHj9p+F1iv5zXKGrmK6n2lY/wKDD532PSnLNeLbI9Y
 SyXCfAbn7X50rIPHHuAPmchiBprTnlXcf3uVtCxgQoDhr5l5ZB8co6pgX3ldmW8fIlIY
 mrhIYz7mO/2kJupa/nHMZnCZZHBil6xYnPai1wqKqmMfnYSUdA+OGqy5KP/mW3Ad7bCc
 iA1Nlh415Bix+ClhQW+ZeCz0bgum3zpw5rSQ/SAdTdCfgNzUXquOJuhqW2zXJnRAvCUr
 mtJw==
X-Gm-Message-State: AOAM532RpUx/fLRGa4HywPhfdFDGWQashLotpoB7XujOe08Ax7LHMP5s
 R4viMiWoSs0ymySbcdJNg3G+uNjU7YL1Tk2WYRKCLQ==
X-Google-Smtp-Source: ABdhPJxIHkMkU0wNzkJkD8mZYm08V+kaOZSrlqpjSt7K3C9IHU/w3m6sHUTlR/1CymFlhPbtQBmvjCJKQpXCCKTvA20=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr25267263ywc.329.1654518280211; Mon, 06
 Jun 2022 05:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-8-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:24:29 +0100
Message-ID: <CAFEAcA8bZjvQhK_DVBV+bOqqTzEDy270hj1zQR1puvgUSZCXyg@mail.gmail.com>
Subject: Re: [PATCH 07/71] target/arm: Use el_is_in_host for sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 2 Jun 2022 at 22:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The ARM pseudocode function CheckNormalSVEEnabled uses this
> predicate now, and I think it's a bit clearer.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

