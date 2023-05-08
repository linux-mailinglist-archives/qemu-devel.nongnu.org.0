Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782526FB2D1
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:29:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1r3-0004Tp-66; Mon, 08 May 2023 10:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw1r0-0004TL-Pm; Mon, 08 May 2023 10:28:42 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1pw1qy-00051i-Qj; Mon, 08 May 2023 10:28:42 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ac80da3443so52490021fa.0; 
 Mon, 08 May 2023 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683556118; x=1686148118;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3KLosyR4nJ1ZTNy2BQ3QB60pm7K3bxYOuITixcV0Juc=;
 b=IT2xJeU4GURYGEbglEWjVq9f+oiBjUOOhEmM8qRmOjw53g7OTsvEo0Or7zUPEI4GOm
 9gJe1WwgDT2jwIv97ASYpzskTUbnx5JeDckJ9GD1xsTduZna4RIDysliWm09i7CdzP2k
 8atZGFLkGfya1Beh1KVLjUv2ohjFN1kWzBE6rt+NngiNdOPZkKBbBWM19WLV7mu2heJk
 11Ehysruw9Czoaw3nHgUvFg2p2huu5/KYsvHL4L8ha7a3KuoIabUI62yDAyC8L432pdi
 0lZ5px4l7f9iJYl5r5JpfImtVt4B0Epm4TistV5uz+DyhG/vMmk1qLxx7mwh5ymR7Nlj
 pkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683556118; x=1686148118;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3KLosyR4nJ1ZTNy2BQ3QB60pm7K3bxYOuITixcV0Juc=;
 b=HS+55naX9sYcDeAMRHcz14jEVhqJH3//5IHcNCJXl0oyia9OU3WVLnnd31ol9N2KL1
 ECC+XcTg28mc+idGTWwEucSk+QGkfmuh0uVrKzQPUXSediNvgB7rAW3/06wYmhfCZ68V
 QGhjpBDG4spUdpCTvljpCriFj6mMbTGNqVGm/+uhBViMQ80px9n7X+OFrKTzJymUwnfz
 8nDFecgQ61wyMphIWCVVyoQMWR3STVlNRy79hSnfK6OZ/VUDTDcYH+Hkgcg6SPhiMBMA
 J69N+fDenNUBKiaW+WCp7MK7NWNrRskDsnIm1wxfNqyPo1jYLTTCSsIuUWtVn9i5N5do
 A7Dg==
X-Gm-Message-State: AC+VfDyakncvHDOTR1uMFFdo/gbkzmZpB2Vn7Opk/FVHYRQXj2Hu0Kmr
 uN5J5l4CkS3BRENjs3l+SFU=
X-Google-Smtp-Source: ACHHUZ57ijT+8ynN+QKhWSSdgixx6w11JQi3J5UK9WmjD89rcpZAwPSlMvoFqpp0Vf3T1aS4Ek4ApA==
X-Received: by 2002:a2e:9d17:0:b0:2ac:7958:ed34 with SMTP id
 t23-20020a2e9d17000000b002ac7958ed34mr2601341lji.45.1683556118273; 
 Mon, 08 May 2023 07:28:38 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a2e978c000000b002ad95392147sm297901lji.118.2023.05.08.07.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 07:28:37 -0700 (PDT)
Date: Mon, 8 May 2023 16:28:36 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 01/12] aspeed/hace: Initialize g_autofree pointer
Message-ID: <20230508142835.GB6984@fralle-msi>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508075859.3326566-2-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On [2023 May 08] Mon 09:58:48, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230421131547.2177449-1-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/misc/aspeed_hace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;
>      size_t digest_len = 0;
>      int niov = 0;
>      int i;
> -- 
> 2.40.0
> 
> 

