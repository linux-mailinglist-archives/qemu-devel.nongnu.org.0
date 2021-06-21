Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761363AEC2D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:19:11 +0200 (CEST)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLhe-0004xx-IH
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLfw-0003DQ-Vq
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:17:25 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLfu-0006aO-Vc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:17:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id ho18so29435923ejc.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=of3Qpfh7qbuGMwskVi7sbCWqVZPThsKBenlq4EQ1Rew=;
 b=QjLFn/jOtLinDmQq/ZlRmP/eogrfcNCEFdDjZCssbjGjehViGXscJoBdEBrkaL4S/l
 FoBcN8YR9AZLaDOlfjFTm1aejCL3uZK6KP96FEbfuv1ArPsOdRDyqQkgOali4I0UtxKq
 K7tOH1y+t/ouVuvsMEnGRFsAkQslgxGIKDAb6mGvDaZ3ypajAkKjSL9gjzi8p/8NnHnA
 fus9zOdu/FZa6RkH3gZS8D0cVk5RCPmbR/VpLU6emHsWFvW83mNQMDALiXv3eGO73/ym
 G5KCNbPHXeXgFVCvMsrXYxg/8lOytgqrRwLPR2iYhdUarW0nZOEZX2m2VRe/PojDErSl
 NCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=of3Qpfh7qbuGMwskVi7sbCWqVZPThsKBenlq4EQ1Rew=;
 b=QYCHSKQpzxh78qIFdPd3wsTmABqP7jMlPxZvK8XBoTd7mLJuPChr5AVxN0SiAbFVge
 uNaS/D7/0FQqucmAzWVUAv6/UG54bk0fTPhacJquGnKhVYEg3iYrKOhfe2dgi//rVAcR
 dLhEsm69yrZQ7Aap+oeFTvV3YH7sS9ZHMpTGpzyrZpfBQICxmkIIfMpo0PXmf4zw96Pn
 6ZiIok+RekbGl51u9oNVC8DfuZpOhUeL/jrCuLd/JgINXlM4pXHZAvAK95QC2Va9k3A6
 qZHA9ABlF75QrZqZZkAsZ2m7TRKHinBd2nKTiycebzmMNxFHJohOu8ic1STZN8pzRIRg
 karg==
X-Gm-Message-State: AOAM530NapwWf8OqbTnLZKvwIARi9rLxahvV6plxIFgMupoL2GrdtEWd
 b+0Xe2HhR9Cy3yKSz5tJ7UJy47zRf92Gvny5RSnftA==
X-Google-Smtp-Source: ABdhPJxaXyiEkrUMmMa5R3k5Y1u6h5nF4lG6ZvJzQjNnbWlg5t/JjJXwLkhsS7PWwNFtJKzDFJKaVCbMncPV2fVomcQ=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr10552925ejw.382.1624288641598; 
 Mon, 21 Jun 2021 08:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-25-richard.henderson@linaro.org>
In-Reply-To: <20210614083800.1166166-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:16:46 +0100
Message-ID: <CAFEAcA-4J5zoteikdoObeRr1w3stmCZrGgiEQfDwk5V-0U7HTA@mail.gmail.com>
Subject: Re: [PATCH 24/28] target/sh4: Improve swap.b translation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 09:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove TCG_BSWAP_IZ and the preceding zero-extension.
>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sh4/translate.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/sh4/translate.c b/target/sh4/translate.c
> index 147219759b..f45515952f 100644
> --- a/target/sh4/translate.c
> +++ b/target/sh4/translate.c
> @@ -676,8 +676,7 @@ static void _decode_opc(DisasContext * ctx)
>      case 0x6008:               /* swap.b Rm,Rn */
>         {
>              TCGv low = tcg_temp_new();
> -           tcg_gen_ext16u_i32(low, REG(B7_4));
> -           tcg_gen_bswap16_i32(low, low, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
> +           tcg_gen_bswap16_i32(low, REG(B7_4), 0);
>              tcg_gen_deposit_i32(REG(B11_8), REG(B7_4), low, 0, 16);
>             tcg_temp_free(low);
>         }
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

