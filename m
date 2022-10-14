Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0805FF04F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:27:55 +0200 (CEST)
Received: from localhost ([::1]:48624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLfG-0007Xw-Oh
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ojLc3-0003dd-Bf; Fri, 14 Oct 2022 10:24:36 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:33428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ojLby-0007hV-Bz; Fri, 14 Oct 2022 10:24:33 -0400
Received: by mail-lf1-x133.google.com with SMTP id j4so7522920lfk.0;
 Fri, 14 Oct 2022 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yjgiwJEv+q5nOag4c7W5dfvE1uTTPNMygszZRo8UDug=;
 b=FHTCKZVaVRfF9Na1Y46nJtIuV5SOJy4sWAinaWdE3wub1HLomZWwasuBFeBf03utCQ
 GFG2QErXcIIdwYOmS4EqqBZxNFia9oESri4uS8aTOF3dbefBJfkA/mQSbZwG47X8p1/4
 loSlZ/PkjwWvKEXGavgqGlM2cSa8RNrFaNYWdPFiXZ2I5tndkZjyWixtwhOQNOOmJqBx
 2TEM7hx/kGmgVFnjg8sOaZ2G4GahjHdv3yWiEHRiKgidthR3+d04HIyYlTEv2kwQbYCP
 ZtFmefbrgt5zUGuI9I9qaXbr8gOnNwnsCqAAXj8zqx+yItSRLNGfYwA73qIgdYDrD7Ge
 Z2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yjgiwJEv+q5nOag4c7W5dfvE1uTTPNMygszZRo8UDug=;
 b=LuZqy1VOehQuSiIUPNOQYq89des1ZW6AWoIwwlH400LWae2hpL4aqx2XQbrjsEvQXN
 kScBKps0XEh5orSGBHmRIE7DRsvWKaSqXDEORBpAFBajuMHMJcIXm5E821cX2L4vYtuP
 YklNxgEiQ2B76UYLj4rdjkcV9XkOWYzmtC1DskINwlRX+sdjXLeFiplRUFvQLBQ/X0SM
 OI7Ch4/3pHEq/O8WQ6Zv9OvREBWxlZp7jFg2eF/C9ko1qOkOzMzJoB7qGPYZD984zJQ6
 76jhbuXIiaQ2yjuQBMixafA0E28chtXq0Z3JNNifuz33W78P5geMzrm3CEEY5GUFYScW
 iLPw==
X-Gm-Message-State: ACrzQf0L9Qyh2TTkq/Q8NLICIN+28qBbcShpU7K44NzimUenX0S/b9Gv
 4kNp7jPxtdLKgb7y8keY9t4=
X-Google-Smtp-Source: AMsMyM7n/HpoA/fH+oSbemlofeIIRaprbukTeX4RhCWFiVTCqaJLmjlsWpS7iXJZeZUzXu4M8PqFUg==
X-Received: by 2002:a05:6512:3e12:b0:48a:a64f:7228 with SMTP id
 i18-20020a0565123e1200b0048aa64f7228mr2013250lfv.159.1665757467154; 
 Fri, 14 Oct 2022 07:24:27 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a2ea211000000b0026e90b478c6sm395694ljm.114.2022.10.14.07.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:24:25 -0700 (PDT)
Date: Fri, 14 Oct 2022 16:24:23 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v4 03/10] m25p80: Add erase size for mx25l25635e
Message-ID: <20221014142422.GA1754@fralle-msi>
References: <20221013161241.2805140-1-clg@kaod.org>
 <20221013161241.2805140-4-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221013161241.2805140-4-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x133.google.com
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

On [2022 Oct 13] Thu 18:12:34, Cédric Le Goater wrote:
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/block/m25p80.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 13e7b28fd2b0..637c25d76e37 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -232,7 +232,8 @@ static const FlashPartInfo known_devices[] = {
>      { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
>      { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
>      { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
> -    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
> +    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512,
> +            ER_4K | ER_32K) },
>      { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>      { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>      { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
> -- 
> 2.37.3
> 

