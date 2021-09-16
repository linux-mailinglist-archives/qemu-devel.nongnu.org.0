Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08D40D79A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:42:09 +0200 (CEST)
Received: from localhost ([::1]:44902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoqG-0006YI-Oz
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQokX-0004XS-RH
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:36:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQokW-0002XK-75
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 06:36:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so4145552wms.2
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 03:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NcLrLiyAx2zAlc7k55RenM7WEQcuMaYD2d1TWyu98zQ=;
 b=hXdb/mzXgtqAjtkqBul0SlmDDcw4qEWFg8ZqhIqyek3Gb65mEhPJ8BKyBPAM/vaBXW
 pnQTKdiavnIybbFCm5YlFgiIm80F2IjAWzRlndfIQviA5JLnE3iyK3YK6j1yNtxXsSU5
 kJraLSi2asc/gAeNfF7iddCxGTG46QqK4nmz8PS/l0qJ5vl79FfqYPvuRawujs7Qauj0
 QAMgCmXX42dqTtoxXsE692HJb7a2HZERKr84r/eJ3cMbo8Dt1yM4xva5EcMvGm0ZqSpC
 Grlvj/Ju3x9wN71mFXmiqCtqzEEfgxW27UsvC6RVeBKAHJpkA+DX+VCgRzdHpsvMu+yR
 Tj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NcLrLiyAx2zAlc7k55RenM7WEQcuMaYD2d1TWyu98zQ=;
 b=YBBXsfEYDra25Md+loPopHcFxr5UW7zHJGtKH64t2xgQvBZm524/ZRa9bC4RyUcCxI
 NkQ98IA1He0ANjzbmT4JKzVYBR9awjlLs5uL+j/DZLtWu2HmLwadMBdUxCX6uN7uumne
 fZn1+25PF2IKpOMVOm9k1N/66GhUT5kBzsMWJbK1PfcTXlEohV9S7yvPpsVx10lijmgA
 KHGWbngntXY0m+QwUHMWqWNRqj/2AjGjJizPvVsBbI47griR8lzVPRau7uAIvrTZyDRk
 ibVENlsjYMqUOiByIwWyEN4RCmzFW0K6otRqgXsgKzepZmgYSOP9e7G6s3J9eXTixi40
 8AbA==
X-Gm-Message-State: AOAM5323T8O+n++w77uUTDD8W0P6ulkWkaU/OSpr+eeORRTZxh0DGZBI
 8oVo7uHmtim5tcyBzj4dwA4=
X-Google-Smtp-Source: ABdhPJy8aqE9wmdQZ4kHbptq1pPNw1OYnYEblxUZvYXF50k3FETqXEIX5AFl5rnSjj+2xjsBtVe0jA==
X-Received: by 2002:a05:600c:1c11:: with SMTP id
 j17mr9441650wms.138.1631788570743; 
 Thu, 16 Sep 2021 03:36:10 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id m2sm6996383wmm.3.2021.09.16.03.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 03:36:10 -0700 (PDT)
Subject: Re: [PATCH v3 04/20] nubus: use bitmap to manage available slots
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-5-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e854c0a0-8733-0ae2-0358-ad6050de000f@amsat.org>
Date: Thu, 16 Sep 2021 12:36:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210916100554.10963-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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

On 9/16/21 12:05 PM, Mark Cave-Ayland wrote:
> Convert nubus_device_realize() to use a bitmap to manage available slots to allow
> for future Nubus devices to be plugged into arbitrary slots from the command line.
> 
> Update mac_nubus_bridge_init() to only allow slots 0x9 to 0xe on a Macintosh
> machines as documented in "Desigining Cards and Drivers for the Macintosh Family".
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/mac-nubus-bridge.c |  3 +++
>  hw/nubus/nubus-bus.c        |  2 +-
>  hw/nubus/nubus-device.c     | 29 +++++++++++++++++++++++++----
>  include/hw/nubus/nubus.h    |  4 ++--
>  4 files changed, 31 insertions(+), 7 deletions(-)

> -    if (nubus->current_slot < NUBUS_FIRST_SLOT ||
> -            nubus->current_slot > NUBUS_LAST_SLOT) {
> -        error_setg(errp, "Cannot register nubus card, not enough slots");
> +    if (nd->slot < NUBUS_FIRST_SLOT || nd->slot > NUBUS_LAST_SLOT) {
> +        error_setg(errp, "Cannot register nubus card, slot must be "
> +                         "between %d and %d", NUBUS_FIRST_SLOT,
> +                         NUBUS_LAST_SLOT);
>          return;
>      }
>  
> -    nd->slot = nubus->current_slot++;
> +    nubus->slot_available_mask &= ~BIT(nd->slot);

Having slot_available_mask an unsigned long (instead of
uint32_t) we could use the clearer:

       clear_bit(nd->slot, &nubus->slot_available_mask);

Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  
>      /* Super */
>      slot_offset = (nd->slot - 6) * NUBUS_SUPER_SLOT_SIZE;
> diff --git a/include/hw/nubus/nubus.h b/include/hw/nubus/nubus.h
> index 357f621d15..8ff4736259 100644
> --- a/include/hw/nubus/nubus.h
> +++ b/include/hw/nubus/nubus.h

>  #define TYPE_NUBUS_DEVICE "nubus-device"
> @@ -36,7 +36,7 @@ struct NubusBus {
>      MemoryRegion super_slot_io;
>      MemoryRegion slot_io;
>  
> -    int current_slot;
> +    uint32_t slot_available_mask;
>  };
>  
>  struct NubusDevice {
> 


