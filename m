Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAC05F9D1D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:54:36 +0200 (CEST)
Received: from localhost ([::1]:56134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqQd-00022j-E9
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ohqNo-0006Y3-V2; Mon, 10 Oct 2022 06:51:40 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1ohqNa-0000eT-75; Mon, 10 Oct 2022 06:51:40 -0400
Received: by mail-lj1-x22c.google.com with SMTP id f9so12760786ljk.12;
 Mon, 10 Oct 2022 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=06aLaxq3675XzXlY7/PQRcT3VQ1fG48d2IlEq856Mbk=;
 b=qe/KxdcPT/CBAi8+eMnaDdVzT++SMOiS6bOFu7loawYT5QgFT0MbZoVcXXw0TaocHl
 M9guESScUq+odfQyrL6jx/3N1VxxV7dRbY2Z0tPBO6pG74p6Oc1+GWtUMoLGJiMXnV2t
 YawQsQUgJYAIX2T181OBjeeJ6qw1NXHocB1V8N91gvJFlhvIyaaNBsgOoBv66lODCAsq
 kR4G86ZB/qaeh8AmDjL60YbFA6ZG49Nz7Ilw1f2FpqccEhd0dG+2UocT/Nv8m/jLC6aU
 fBwTkFvk0bLebVOkl7ZQQiGt6NTr9wvKiT7Weh0yo/H0yDS4IhVJv+EkaqFs6Gr5rICC
 VuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=06aLaxq3675XzXlY7/PQRcT3VQ1fG48d2IlEq856Mbk=;
 b=0RbvaFPrCIQDhtGcKrCwx0QcuelczLPTRNZkHXsHF4rY5BeSQmZkf6gMj5XlIWPc0D
 UR33taPDf1E1FoU/ZpHp3hBayjPLYv6U6XEw9XKDeyLu5vnJ2nXwql6yBQK39n9NRVwJ
 QLGai3w5gVF+DIi6CWBC/YlEcYK666p3qqZFKtNYcL26aZgfxKnrMiox8BRPMiqURcvc
 ev6jJMr1EYnePNH1227lN3hkcWTW+g+6ZjOx5Lwx9ImNQnQiJkI7JM42Iqt77veJfjcA
 f4DVSeAhaTC4ICAMrBuyw01WgEmoA7Lf2yYiTfP4jXMutBtpBhxv41dXvfgG8AKAS30J
 ozfw==
X-Gm-Message-State: ACrzQf2jHGEqjvusCJCT14/ZRWTx8bIglp5fIEeYDRVgd7z5LRMklgBx
 QUVZpJMZv6PCoixqLKQTkSo=
X-Google-Smtp-Source: AMsMyM6akT+8P3Jz8KCiVPIdM4qb3W/AwPURQzDjP5kZz5rwRcERquhkeXCw13SH6DHwn0XC/87EDg==
X-Received: by 2002:a2e:8552:0:b0:26f:b0c6:f1b with SMTP id
 u18-20020a2e8552000000b0026fb0c60f1bmr420556ljj.165.1665399082540; 
 Mon, 10 Oct 2022 03:51:22 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a056512360700b004996fbfd75esm1373307lfs.71.2022.10.10.03.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 03:51:22 -0700 (PDT)
Date: Mon, 10 Oct 2022 12:51:20 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>, Iris Chen <irischenlj@fb.com>
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
Message-ID: <20221010105120.GA30024@fralle-msi>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org>
 <20221007144431.GE20384@fralle-msi>
 <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
 <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -1016
X-Spam_score: -101.7
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-101.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=no autolearn_force=no
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

Hi  Cedric,

On [2022 Oct 10] Mon 11:58:40, Michael Walle wrote:
> Am 2022-10-10 08:23, schrieb Cédric Le Goater:
> > On 10/7/22 16:44, Francisco Iglesias wrote:
> 
> > > > --- a/hw/block/m25p80.c
> > > > +++ b/hw/block/m25p80.c
> > > > @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
> > > >       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
> > > >       { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10,
> > > > 512, 0),
> > > >         .sfdp_read = m25p80_sfdp_mx25l25635e },
> > > > +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10,
> > > > 512, 0),

I think I missed the (ER_4K | ER_32K) flags above (in case we go for a v4 we 
can add it in). 

> > > 
> > > I think I'm not seeing the extended id part in the datasheet I've
> > > found so
> > > might be that you can switch to just INFO and _ext_id 0 above
> > 
> > This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID
> > twice for
> > mx25l25635e") to fix a real breakage on HW.
> 
> From my experience, the ID has a particular length, at least three bytes
> and if you read past that length for some (all?) devices the id bytes just
> get repeated. I.e. the counter in the device will just wrap to offset 0
> again. If you want to emulate the hardware correctly, you would have to
> take that into consideration.

If we decide to go with Michael's proposal above you can use '0' on the
'extended_id' and enable 's->data_read_loop = true' when reading the ID.

Best regards,
Francisco

> But I don't think it's worth it, OTOH there seems to be some broken
> software which rely on that (undefined?) behavior.
> 
> -michael


