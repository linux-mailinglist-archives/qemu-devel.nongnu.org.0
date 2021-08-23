Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11153F4F5C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:18:23 +0200 (CEST)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDaY-0006rd-F7
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDZc-0006A9-D0
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:17:24 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:34342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDZa-0004Uh-U0
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:17:24 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ot2-20020a17090b3b4200b0019127f8ed87so328047pjb.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wABsd2g6fvmhWoEL/ArRVcYITDLwh5iz0lo5QpfQF/k=;
 b=emjHnkDnLKw7iahHufTQX4h03la8eRx9sNjannGOPWqc9iwJVt6SBYvg/1sMX/qpfx
 +v1DCqkrQYXrLTDjc3oBbWzVE7XOXXS1yBn7WQJ1tIWQCAct7lObUBeo4aXZ9aVsdba1
 xv2dhC0hano2FyYF1snKhb/3/VG6tsKXUokZ7Kf5Pwe/jloekTAg18HNFpe8zfMDNKER
 LWQNd1N7xEt0UG8wnwXFHlacvBiu7XXGlhMUQtljCdhAKZ2EmzjOg3K8fCYAL+Yt7Hz6
 sSPzMJS6x1TUxT78PT85ByNSNYO5h7AdjT+C5iQfgG59Pw1xX8VVkQh3d+ntSDYprpxA
 6TbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wABsd2g6fvmhWoEL/ArRVcYITDLwh5iz0lo5QpfQF/k=;
 b=i1bf/J3T5lhfQAjP6RpKosZsMTx16a1N36clmNmnBqM1Buh8S6y/ykrwTcu75L44RG
 TO5eqzE0uPdeEF3mxgunJ49zLfMVBWk+BZQv2qZaBxA5n0SI3cuaVbF1g06ZMeIVpzbZ
 YPCJJ1M28IUA8mdngDh+jKwXvFz1IPJzLhj2U3gWnHUSm2sI3hkW1bfwzdsM0DYl/iE0
 ddc2Z6mA8qR4EdymOfamO05a0MLDBTNZwPd8OTSMN0LwlDK+oCCUMp58F1dn6Pn5jw+J
 +ibisFx1LXDPMPDDasbhcFQGusufPR95csSyrNkburtxzn+K5YcMhNFfJPdkjpU1Tyin
 4p2A==
X-Gm-Message-State: AOAM532JRhXcHKKN9ucnwEH2QX11UsDTvf3p3stvAC+qxn1+69pgMyu6
 a2Lrh364o2a8LBNBljFtQ6Sp8Q==
X-Google-Smtp-Source: ABdhPJzSw3RT/DRTByOc5pQJt6cGrj+esk3VlDO3s4LzXaTJdKuofMz89dGHTxWdS0fI/2FDdV/9yQ==
X-Received: by 2002:a17:90a:d590:: with SMTP id
 v16mr21020512pju.205.1629739040988; 
 Mon, 23 Aug 2021 10:17:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id o10sm18225487pgp.68.2021.08.23.10.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:17:20 -0700 (PDT)
Subject: Re: [PATCH v3 07/15] target/riscv: Add instructions of the
 Zbc-extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-8-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ba8483c-5705-c173-f4b7-6212085223c4@linaro.org>
Date: Mon, 23 Aug 2021 10:17:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-8-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> +static bool trans_clmulh(DisasContext *ctx, arg_clmulr *a)
> +{
> +    REQUIRE_ZBC(ctx);
> +
> +    /* Perform a clmulr ... */
> +    gen_arith(ctx, a, gen_helper_clmulr);
> +
> +    /* ... then shift the result 1 bit to the right. */
> +    TCGv dst = tcg_temp_new();
> +    gen_get_gpr(dst, a->rd);
> +    tcg_gen_shri_tl(dst, dst, 1);
> +    gen_set_gpr(a->rd, dst);
> +    tcg_temp_free(dst);

I think it would be better to place the shift into a helper, so that you leave all of the 
gpr manipulation to gen_arith.

E.g.

static void gen_clmulh(TCGv dst, TCGv src1, TCGv src2)
{
     gen_helper_clmulr(dst, src1, src2);
     tcg_gen_shri_tl(dst, dst, 1);
}


r~

