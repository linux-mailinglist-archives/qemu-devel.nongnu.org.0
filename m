Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2AF5F7B54
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:22:05 +0200 (CEST)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogq6t-0007c1-G7
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogpD3-0004oD-K1; Fri, 07 Oct 2022 11:24:21 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ogpD0-0005wv-I0; Fri, 07 Oct 2022 11:24:21 -0400
Received: by mail-lj1-x234.google.com with SMTP id q7so3618416ljp.3;
 Fri, 07 Oct 2022 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0JN0o2G3IrteEmQC2UgtUf4RwAqvZ5Aj5ohsTXSL5SQ=;
 b=fSUa4s8WYqq7IOP2yetL6/tgE9C1dxPsBvgaZMUL50c4zksa9TvHmYFlubL75KNfY9
 nPkOwM4V/nSu1iAk+rXFZgRQMylRdVgZdGkkeKyAu9qc2DNtgPRGFhNxeMUTdjk/GQuH
 +P9fCSy6KC5fgyh4CJ0Nf8dzt4tohN10L421R5sNdleF8R3JZqRAjWFHnZpWW0AiQzXg
 9IR95l9FWlFUVF8hngbLKM+ja0GxeI8ywokC4EiyqFpHtY4af+TnMbDCnz64TtdGgm0d
 0DDYEMvfd+B+mgC8oZMALumg0JsSbXUN0mFfcV90+gNmkm8Ga9UTPNOBhfaS2cFfiLTd
 D8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0JN0o2G3IrteEmQC2UgtUf4RwAqvZ5Aj5ohsTXSL5SQ=;
 b=ccZ219FLL41deTx5QMFqVyubDYgeV2rA93Cf4hj33YyeBBp/F6bSUSVy7K8mn16mjx
 hJcM3fL1K/T9xhjcQKcGxbJqnXmbMOu7la5pzkNqthkR6jMfA7g7WBu3QTWD82UXdQz9
 OTr2Z7zVpCDpmX2doAMU0Ab1cZnoJz3RMVoVU7PaF8gojqEKkDZC2BlEE839PcuxaB0D
 RPiwsGKHfyAzh9VajqrialPrGrBWEfgLHFDzT1T2lIJfSpgWcmS7lkoIUcixQlZ6Pmct
 dBhe5yZeW2OT46CpKDOBAdP4ywtl367YXHpFeuPbQ18hXfxdzmetSu6M9FOOi/qAdZ+m
 iBTA==
X-Gm-Message-State: ACrzQf07/4JvGyJw4p4QCHh6I/w6oj8WX5tzOsqBXCq6wknI/5DzUMSH
 dqLPDswT0h09TaphzZja02w=
X-Google-Smtp-Source: AMsMyM4hK/Ssw09rdVFSSzcKqKUcj4LbkX1CpNNPc0GzJwZL4h1IOyX8v/vBUDhZR0CY/HBAWx79sQ==
X-Received: by 2002:a2e:bd8b:0:b0:26d:e6a1:9a41 with SMTP id
 o11-20020a2ebd8b000000b0026de6a19a41mr1874793ljq.204.1665156252897; 
 Fri, 07 Oct 2022 08:24:12 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a2ea809000000b0026bca725cd0sm304321ljq.39.2022.10.07.08.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:24:12 -0700 (PDT)
Date: Fri, 7 Oct 2022 17:24:10 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: clg@kaod.org, alistair@alistair23.me, andrew@aj.id.au,
 irischenlj@fb.com, joel@jms.id.au, michael@walle.cc,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH] m25p80: Add the w25q01jvq SFPD table
Message-ID: <20221007152410.GA16213@fralle-msi>
References: <20220722063602.128144-9-clg@kaod.org>
 <20221006224424.3556372-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006224424.3556372-1-patrick@stwcx.xyz>
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

On [2022 Oct 06] Thu 17:44:24, Patrick Williams wrote:
> Generated from hardware using the following command and then padding
> with 0xff to fill out a power-of-2:
>     hexdump -v -e '8/1 "0x%02x, " "\n"' sfdp`
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  hw/block/m25p80.c      |  3 ++-
>  hw/block/m25p80_sfdp.c | 36 ++++++++++++++++++++++++++++++++++++
>  hw/block/m25p80_sfdp.h |  2 ++
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 8ba9d732a3..86343160ef 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -349,7 +349,8 @@ static const FlashPartInfo known_devices[] = {
>        .sfdp_read = m25p80_sfdp_w25q256 },
>      { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K),
>        .sfdp_read = m25p80_sfdp_w25q512jv },
> -    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K),
> +      .sfdp_read = m25p80_sfdp_w25q01jvq },
>  };
>  
>  typedef enum {
> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
> index dad3d7e64f..77615fa29e 100644
> --- a/hw/block/m25p80_sfdp.c
> +++ b/hw/block/m25p80_sfdp.c
> @@ -294,3 +294,39 @@ static const uint8_t sfdp_w25q512jv[] = {
>      0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>  };
>  define_sfdp_read(w25q512jv);
> +
> +static const uint8_t sfdp_w25q01jvq[] = {
> +    0x53, 0x46, 0x44, 0x50, 0x06, 0x01, 0x01, 0xff,
> +    0x00, 0x06, 0x01, 0x10, 0x80, 0x00, 0x00, 0xff,
> +    0x84, 0x00, 0x01, 0x02, 0xd0, 0x00, 0x00, 0xff,
> +    0x03, 0x00, 0x01, 0x02, 0xf0, 0x00, 0x00, 0xff,
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
> +    0xe5, 0x20, 0xfb, 0xff, 0xff, 0xff, 0xff, 0x3f,
> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x42, 0xbb,
> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00,
> +    0xff, 0xff, 0x40, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
> +    0x10, 0xd8, 0x00, 0x00, 0x36, 0x02, 0xa6, 0x00,
> +    0x82, 0xea, 0x14, 0xe2, 0xe9, 0x63, 0x76, 0x33,
> +    0x7a, 0x75, 0x7a, 0x75, 0xf7, 0xa2, 0xd5, 0x5c,
> +    0x19, 0xf7, 0x4d, 0xff, 0xe9, 0x70, 0xf9, 0xa5,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0x0a, 0xf0, 0xff, 0x21, 0xff, 0xdc, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +};
> +define_sfdp_read(w25q01jvq);
> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
> index 62f140a2fc..8fb1cd3f8a 100644
> --- a/hw/block/m25p80_sfdp.h
> +++ b/hw/block/m25p80_sfdp.h
> @@ -24,4 +24,6 @@ extern uint8_t m25p80_sfdp_mx66l1g45g(uint32_t addr);
>  extern uint8_t m25p80_sfdp_w25q256(uint32_t addr);
>  extern uint8_t m25p80_sfdp_w25q512jv(uint32_t addr);
>  
> +extern uint8_t m25p80_sfdp_w25q01jvq(uint32_t addr);
(optional -extern)

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> +
>  #endif
> -- 
> 2.35.1
> 

