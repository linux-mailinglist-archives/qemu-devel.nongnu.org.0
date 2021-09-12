Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B597407E2B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:53:40 +0200 (CEST)
Received: from localhost ([::1]:60220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRnW-0005e4-Qr
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRkm-0004HM-H9
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:50:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRke-0006WJ-P5
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:50:48 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so4854305wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0EtWPYQ+ew/9Q4FfVGlFPzdy4w+vGCJxjXs8arJqEd4=;
 b=lC2wiZUaRrb+357YqzNRjHexrfGzn8dq3zeIxSRFJk8Th3kCkH7aJ6pWFgRyW/xa8A
 aDuaaidRxACIz2SFmz0asfWZyymHc9w6qC2sAfYGSvX2iVodPLFhzLnpeB+98WVlwWGb
 SgQMcEW6lUi2rANYzhPNXWW4lrszvo3CtXh3MYzXitDSD8I8JVw58Dkoa5/wLuyv7Q26
 QsQTxed8EyOGkEg6O7kdu6wu0H1J3rawR2njYjjd/s7Fc2npjTb5gW0xXzDBmZwfrTSU
 2+HV1sqBfdmZCIAT3z8aHk+PU1sKwppR8SbqHGWcQWRX9MEtwYFlevQFVjrvCjWYOd7T
 2hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EtWPYQ+ew/9Q4FfVGlFPzdy4w+vGCJxjXs8arJqEd4=;
 b=Xk6qhEvcZt1sltQXqhiLj//76d41f/K7x3HBzht58YoADMqIei0VN9cENtCsJiP4xO
 mwtPAnGxYPAsFnB6jcVq2QF+Fc99ieVHj7utim7TvcE4Kc7d5FJ0BNBbUm4YUwz1Rvse
 n+5aVj49aqh4mcQTyy+snMgIfWrE2gT9TxRkx5d3b28yB4JsNa2WCLZA1RxHXTwUGt/b
 iabwyaPwL4dTF4Qr7qDglbLS8Yo1MbCqicGnRLoBlY5eIbMsqt/CQSc9ienfHiEB+M9d
 oaWbcuN1GNryVTaLpoZTDxIQuoF7YSA8wmzsDlPF7RJTMT7tUyddQdIyc2QnP36nyQDa
 1SuA==
X-Gm-Message-State: AOAM530mCq030e5h8m4+Ym1C9TXM4d+zZIBSWUv4UY14twdPiiAcPio9
 xHlkFcyscRoVQf7s0X0zYULV4F1kmIA=
X-Google-Smtp-Source: ABdhPJyE96kxt72Ac5YObquSNlWnbdxooSqX6b9rbwWCxAf3qM6JXCHCWL9eBdoHd6p93AbcSbRNVA==
X-Received: by 2002:a05:600c:b41:: with SMTP id k1mr5499944wmr.4.1631461839202; 
 Sun, 12 Sep 2021 08:50:39 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id q11sm4535345wmc.41.2021.09.12.08.50.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:50:38 -0700 (PDT)
Subject: Re: [PATCH 02/20] nubus-device: expose separate super slot memory
 region
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <68bd423d-caf6-53eb-f68b-68c14a1e82a9@amsat.org>
Date: Sun, 12 Sep 2021 17:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/12/21 9:48 AM, Mark Cave-Ayland wrote:
> According to "Designing Cards and Drivers for the Macintosh Family" each physical
> nubus slot can access 2 separate address ranges: a super slot memory region which
> is 256MB and a standard slot memory region which is 16MB.
> 
> Currently a Nubus device uses the physical slot number to determine whether it is
> using a standard slot memory region or a super slot memory region rather than
> exposing both memory regions for use as required.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-device.c  | 36 ++++++++++++++++++------------------
>  include/hw/nubus/nubus.h |  1 +
>  2 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
> index be01269563..36203848e5 100644
> --- a/hw/nubus/nubus-device.c
> +++ b/hw/nubus/nubus-device.c
> @@ -168,26 +168,26 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      nd->slot = nubus->current_slot++;
> -    name = g_strdup_printf("nubus-slot-%d", nd->slot);
> -
> -    if (nd->slot < NUBUS_FIRST_SLOT) {
> -        /* Super */
> -        slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> -
> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name,
> -                           NUBUS_SUPER_SLOT_SIZE);
> -        memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
> -                                    &nd->slot_mem);
> -    } else {
> -        /* Normal */
> -        slot_offset = nd->slot * NUBUS_SLOT_SIZE;
> -
> -        memory_region_init(&nd->slot_mem, OBJECT(dev), name, NUBUS_SLOT_SIZE);
> -        memory_region_add_subregion(&nubus->slot_io, slot_offset,
> -                                    &nd->slot_mem);
> -    }
>  
> +    /* Super */
> +    slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> +
> +    name = g_strdup_printf("nubus-super-slot-%x", nd->slot);
> +    memory_region_init(&nd->super_slot_mem, OBJECT(dev), name,
> +                        NUBUS_SUPER_SLOT_SIZE);
> +    memory_region_add_subregion(&nubus->super_slot_io, slot_offset,
> +                                &nd->super_slot_mem);
> +    g_free(name);
> +
> +    /* Normal */
> +    slot_offset = nd->slot * NUBUS_SLOT_SIZE;
> +
> +    name = g_strdup_printf("nubus-slot-%x", nd->slot);

I'd rather use "nubus-standard-slot-%x" or "nubus-normal-slot-%x"
to differentiate from super-bus. (This also applies to variable
names and trace events in this series).

Anyway,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

