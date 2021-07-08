Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AFB3BFA43
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 14:31:46 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1TBx-0004Qh-QD
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 08:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T91-0001Qu-25
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:28:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:39589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1T8x-0000U6-JW
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 08:28:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v1so8272847edt.6
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20K+rheX1py+s36Bbey3G3S12ajGG70059ZQfodWtNo=;
 b=ThHr7QD8pvjRY3v5LceNjXqPBSFLbJplOVrg7npNeO/IGO/VKoYoQHtK9I8THOCrnz
 VMwFYFDse2FRUmyF0F2vvL6V/HM/j0jXrwFq8gnIO17qzsWusm6rEHnc6MPHhSPVUsir
 CjEd9BWsh+xaogG3+hS63fK2Hb3/tq9cWeOdSWs1+znbYCKVBFk7ZibchlmGZ/4hp6cF
 wxtdH3qj8mMVrotEs4x3BeaLno9Yb/KgKrM2cjd5H4mglfFASjRrUpv8G5gsqh7iqbV8
 rurRdJvW7gSWDr3vvExrz5Fy9xJortsOJoa58XwuWYYHg45I3pYhIKD1mPZivfVmyyJV
 P2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20K+rheX1py+s36Bbey3G3S12ajGG70059ZQfodWtNo=;
 b=kjAZc0H3unqnOU/+qG/XKPVNq7hgeqNJooGt0w2dpkyimAr5e/fvkfr/7BWfNd0eDN
 RB7xmNI1Tec5qqc0WVbOqvE6WnoM4jIm1U9YhVBHp96aWaAXt61T4B9orFnBCu74RZSI
 v+p0/e8cS5wxchrFY0nHboc4JwRZnZWLygj89C5qYYXYlvZDkncdCDNh4UEbWoEMlpgx
 mDjBoph8w32I75+vbKVjwI2m8BIYhia025/PwQ4IK96Mm8Ngqz4kuf168OQa+7/yNeFQ
 EP84AEl0lCgAa9fUBRphoMuM0LsSGTXm6sux+IKqImwwHnn7NGVCeAVw6ZL4BJNxd5H9
 oaDA==
X-Gm-Message-State: AOAM532ia3TqNzIMzwiIPoYs9KSXBAzd3uTaADjZn+ETOnPvqhyCiSnI
 q9/aAF5aIUs5wXiZnczfCdpzuWk3CdBd/oUXSZMWzg==
X-Google-Smtp-Source: ABdhPJxkEdWdIKkdNZqet4ADacZmu/v6Blh3lwDRkFnQ4pcWH16W7k18sTIjLdMKjULuk8ybfqe3+8/UO88FFAYlqU8=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr36975405edt.100.1625747318009; 
 Thu, 08 Jul 2021 05:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-11-richard.henderson@linaro.org>
In-Reply-To: <20210630183226.3290849-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 13:27:59 +0100
Message-ID: <CAFEAcA-wBUx39Vh+zLYqwJOV+=G_hrnt-eHk5SY2wcPbKB9nng@mail.gmail.com>
Subject: Re: [PATCH v2 10/28] target/cris: Use translator_use_goto_tb
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The test for singlestepping is done in translator_use_goto_tb,
> so we may elide it from cris_tr_tb_stop.
>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 4cfe5c86d9..e33a3bb326 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -482,7 +482,7 @@ static void t_gen_swapr(TCGv d, TCGv s)
>
>  static bool use_goto_tb(DisasContext *dc, target_ulong dest)
>  {
> -    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
> +    return translator_use_goto_tb(&dc->base, dest);
>  }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

