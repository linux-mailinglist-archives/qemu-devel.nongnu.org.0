Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC605F7AC8
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:44:46 +0200 (CEST)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpWn-00009N-7c
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogopK-0006bc-Jk; Fri, 07 Oct 2022 10:59:50 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:34469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogopI-00029C-QF; Fri, 07 Oct 2022 10:59:50 -0400
Received: by mail-lj1-x234.google.com with SMTP id bs18so6021821ljb.1;
 Fri, 07 Oct 2022 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5nykDTcSspWQFFbUGhp1l1JeZ3Ayr5wXPQIPxOxRbu4=;
 b=P9Y/OpzixNO9O8jNhfK9I2CbCjiXzvpKx9bpeJcIvgWfu+T1/0YTQDvEh8VUeFZwh2
 tFgTb5awmlziQR/9yfppOgZ75IMBDrYGvGvLx6auLs/J4ge8BeuCM86j4oAblDY29AbA
 n/t4uCuALQReaNCgFg0/ThmxmSuVys5uaCT1xVCj/+80qTowQq0f4EpqagSbC4aBiRv6
 DUo8eH4qAZl5W3nrQY/wNtTqDbaCo+2h7JKKycxuYMdQLp7gCaakkgRS54+hs/DIbfX2
 CUDTGam74x0BBf5DXFFlv3MMZRUxZjRdlccpsLirBvFfSOQHKHLV0e63MwCOhsNTt6tz
 ScuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5nykDTcSspWQFFbUGhp1l1JeZ3Ayr5wXPQIPxOxRbu4=;
 b=SQuz3ySnTHxRKHU7Jm9Qqnc7MZSNzl+jkmKgVMeacNnh8hjQ+GxoE9b0ZBTATrlsxv
 cGF+TycgnW0JhLeam/otrqu3DEYpF6baOoMavEstJRBtHwpylSHrKZd2yyZDVRN/JJgr
 DI2ZLNg/sp3Wo+bT02eBvpHNYKgp8X0rSrDuwwwStRYCZb6GAk8stnq5HmU4x0ieAMtK
 sMtFCMdiqEOG7QOvwduoZmlZz7VP/Aa9D0JncBUf8CS6Rhsn3L2vXKattkLZSfpnzWJO
 fB0N2bbpcM5g7lj4W1PBTJYzBI/50/zmm7rdpf+yWr1idyGiKczxZsfn4smq1iS5gsBG
 GRHQ==
X-Gm-Message-State: ACrzQf0AYE+MPMqjazHXlGhihvRHgjo/HfWwOXVVbUaGehTjC7N8vXlR
 sepAwr/9q5/tDPVq7MVm5oA=
X-Google-Smtp-Source: AMsMyM7vI2WlKD33KeKEkBSWd2eMIGNMG2VgPu1PQKzZOZ9bFvrn2xNkrpVz75Lo5iRdgAYZqKBSvw==
X-Received: by 2002:a2e:9606:0:b0:26e:3d2:782c with SMTP id
 v6-20020a2e9606000000b0026e03d2782cmr1919066ljh.164.1665154785999; 
 Fri, 07 Oct 2022 07:59:45 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a2ea449000000b0026c4374a2a4sm291587ljn.139.2022.10.07.07.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 07:59:45 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:59:43 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v3 5/8] m25p80: Add the mx66l1g45g SFDP table
Message-ID: <20221007145942.GF20384@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-6-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722063602.128144-6-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2022 Jul 22] Fri 08:35:59, Cédric Le Goater wrote:
> The SFDP table size is 0x200 bytes long. The mandatory table for basic
> features is available at byte 0x30 plus some more Macronix specific
> tables.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/block/m25p80_sfdp.h |  2 +-
>  hw/block/m25p80.c      |  3 +-
>  hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 87690a173c78..468e3434151b 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -19,6 +19,6 @@ extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
>  
>  extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
>  extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
> -
> +extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);

(optional -extern)

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

>  
>  #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 6b120ce65212..52df24d24751 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -240,7 +240,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
> -    { INFO("mx66l1g45g",  0xc2201b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
> +    { INFO("mx66l1g45g",  0xc2201b,      0,  64 << 10, 2048, ER_4K | ER_32K),
> +      .sfdp_read = m25p80_sfdp_mx66l1g45g },
>  
>      /* Micron */
>      { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index 70c13aea7c63..38c3ced34d2e 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -150,3 +150,71 @@ static const uint8_t sfdp_mx25l25635f[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(mx25l25635f);
> +
> +static const uint8_t sfdp_mx66l1g45g[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x02, 0xff,
> +    0x00, 0x06, 0x01, 0x10, 0x30, 0x00, 0x00, 0xff,
> +    0xc2, 0x00, 0x01, 0x04, 0x10, 0x01, 0x00, 0xff,
> +    0x84, 0x00, 0x01, 0x02, 0xc0, 0x00, 0x00, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x3f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
> +    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0xff, 0xd6, 0x49, 0xc5, 0x00,
> +    0x85, 0xdf, 0x04, 0xe3, 0x44, 0x03, 0x67, 0x38,
> +    0x30, 0xb0, 0x30, 0xb0, 0xf7, 0xbd, 0xd5, 0x5c,
> +    0x4a, 0x9e, 0x29, 0xff, 0xf0, 0x50, 0xf9, 0x85,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x7f, 0xef, 0xff, 0xff, 0x21, 0x5c, 0xdc, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0x00, 0x36, 0x00, 0x27, 0x9d, 0xf9, 0xc0, 0x64,
> +    0x85, 0xcb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xc2, 0xf5, 0x08, 0x00, 0x0c, 0x04, 0x08, 0x08,
> +    0x01, 0x00, 0x19, 0x0f, 0x01, 0x01, 0x06, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(mx66l1g45g);
> -- 
> 2.35.3
> 

