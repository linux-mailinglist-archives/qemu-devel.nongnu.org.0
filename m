Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E8407F1E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:07:11 +0200 (CEST)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTsk-0007EJ-IB
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTWF-0003Xo-QT
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:43:55 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTWD-0006NB-51
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:43:55 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso5251169wms.3
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uvX8kfnVvjbbsdkAUhB0CoYDYqSr1+veTs4bld1+dls=;
 b=V2SRhbsOniyScPT/LQgFyiXAADWM0CNxFvBTyR+sdAuPlAP6tIXJ8D7U3N8ZdvOBdY
 886qu0vsGmt6eDD08LnuYcCgSuvaSiKSEQHKxROxb9mF8Fc1+hsjCLTYcvV+SLsrTKMP
 anRNfj6EIqn3ypWcjt9XfAgnK3eHJMTmxYppybGHPGkLiVA+T+njuOITxy2PInkMXKKD
 NAeLDaK7Vyq/Qdd+brpw1+9IUKAbo6cARuNpuSeT7qHMYJmEU5Sdv57abeZAlJVMWwdM
 6GniK6ykmuwomDjoU95BZskPrNWImwmnQDvL+pJFkZ+locnezPvP8Cg/Kh5h/z5+RDJf
 J1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uvX8kfnVvjbbsdkAUhB0CoYDYqSr1+veTs4bld1+dls=;
 b=JKnW9gdkwkS/gHLh9r8kA0ovg3HkZz0EUih6nixBmFj9TxC6CeTJKMGM9xvFxkfjBG
 TpbcHDcIqZ0irA9qtKwcSzjMOV6eCMGoYPOBudxdLUYYq2j7iHtkD0iRhfqS7gPVe5R/
 bNsNAo5Cazaj7IKVdeJ3TW2enH7V0iT8RZlCyKzX/iW14x8bif6Rp2DWuPNNEJBBMroR
 0e4xzcanBYQG2luMRX0CneOiR71/xkIX8QDoC0YeM/1zY42BslbgJ+Bu4pqDAAqJ4nPu
 Il8bJ+PoLXuEKgdxzWyaSSxweasSFBM5qntHS4hjNB58EQfqiIfhPpjyXxwh49t7Vgm+
 LZ3g==
X-Gm-Message-State: AOAM530pocKDHDu6keg7s/vVxwqu1kt0DPX3xCMIJS5enSkXZW3ojUIR
 G/zEO6QF/TJdsv2WZNpynDY=
X-Google-Smtp-Source: ABdhPJzkwStdXDiV4O3R10XTZI90WxF+q1jIVJ7Fg+8eWKk6hFxRGTtgv3hPZU+WN8Hb4B7ww2W4dA==
X-Received: by 2002:a7b:cbc6:: with SMTP id n6mr69008wmi.118.1631468631331;
 Sun, 12 Sep 2021 10:43:51 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z5sm4734355wmf.33.2021.09.12.10.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 10:43:50 -0700 (PDT)
Subject: Re: [PATCH 16/20] nubus-bridge: embed the NubusBus object directly
 within nubus-bridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-17-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <33438013-86d1-41d9-45f6-a1cc73e75cfa@amsat.org>
Date: Sun, 12 Sep 2021 19:43:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-17-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> Since nubus-bridge is a container for NubusBus then it should be embedded
> directly within the bridge device using qbus_create_inplace().
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c              | 2 +-
>  hw/nubus/mac-nubus-bridge.c | 7 ++++---
>  hw/nubus/nubus-bridge.c     | 3 ++-
>  include/hw/nubus/nubus.h    | 2 +-
>  4 files changed, 8 insertions(+), 6 deletions(-)

> diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
> index c16cfc4ab3..c23d5d508d 100644
> --- a/hw/nubus/mac-nubus-bridge.c
> +++ b/hw/nubus/mac-nubus-bridge.c
> @@ -18,18 +18,19 @@ static void mac_nubus_bridge_init(Object *obj)
>      MacNubusBridge *s = MAC_NUBUS_BRIDGE(obj);
>      NubusBridge *nb = NUBUS_BRIDGE(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    NubusBus *bus = &nb->bus;
>  
>      /* Macintosh only has slots 0x9 to 0xe available */
> -    nb->bus->slot_available_mask = 0x7e00;
> +    bus->slot_available_mask = 0x7e00;

Re-reading I'd use MAKE_64BIT_MASK(9, 6)
or eventually MAKE_64BIT_MASK(9, 0xe - 0x6 + 1).

