Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974026FF367
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:50:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px6gv-0001Z3-GS; Thu, 11 May 2023 09:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px6gn-0001Wt-Ko
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:50:39 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1px6gj-00009m-DQ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:50:35 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so27783125e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683813032; x=1686405032;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pvAhG8el9HnDBEjEjTJvbQ+lctDntGbJsfvLRC7yqR8=;
 b=dYxybYXlApBZi8frZzQTvYU0kc5EvbiJklJg0NrTDv0AAitAaKyHeYGietCDCV8DKO
 HK38xCOMBEatVLGgVl8EpCSdkT+Vjb2gmvXFxV9TALKF1eI7cV7pS7JD9eUIWjcEzuTo
 vsGn01MRKg54zG4mpfzH7hNIxtNCwxvXptBiK/0GcInWGrF0pdA/WC8npwfTKImfsuVP
 qx9xowDIQJneCZqqB1vZtlZ1mzA7fpcFIHzLVCa2xY4XzQk88a4XPS8KPAjZMcYlpGjT
 ce7BbszE4y1lNGNyK1vJ9gEFjFkN4ABW6g0/UmOwrJsJXckc0SONT4Luwj2Jr7LvqhBx
 B4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683813032; x=1686405032;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pvAhG8el9HnDBEjEjTJvbQ+lctDntGbJsfvLRC7yqR8=;
 b=e3Ah/FnqX4LcyrBi/Y2rAAfASe+vBWtvyHaJmkvX6WUOy3Xm2cVXjVzt9MjCUwcmO5
 rynCtE0n/gXgaLzN99AmtVsXS6adko6YGNO4kMNbUSa+oKfYeMXnilVXYlo/07COUQ+9
 GkE7f6nCzFsQxQobIHMkRUTtGrBiKHtnUcYh8B32tMVJYUYyMfXK0f9KwqLmZUa83gGA
 /zoDKOUou3xq0/FMvgJvTL6cRN5Y7BdDthgGYl6jSZbtIkg2yLVAcnqaeTAiDLBJa7fn
 Ndagxt9cIyiQSwzNAZc0b+RGwxtR86aXQ5hJ4SiLXCGLng4xQB98akcsAHSx0ZHJtdsC
 bDnw==
X-Gm-Message-State: AC+VfDyhRghTjCY36+L7+gMNTWDRG9xs8YMPcantRfEeR+8WQ4KJsVCl
 /3TOb7oQq/h0Y9+abaZoSXDNEg==
X-Google-Smtp-Source: ACHHUZ7rQZBJwdA24GuoHl0swxIl5ucZlIBYo49+ts1Z0UQON6CJEVn9tv8Xq5X5/5ildVGrbTnWPA==
X-Received: by 2002:a7b:cbd0:0:b0:3f4:ebfb:7413 with SMTP id
 n16-20020a7bcbd0000000b003f4ebfb7413mr1762127wmi.32.1683813031798; 
 Thu, 11 May 2023 06:50:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b003f18b942338sm25694505wmc.3.2023.05.11.06.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 06:50:31 -0700 (PDT)
Message-ID: <2d36555a-b5c6-ac21-c1d3-a8668a05a7eb@linaro.org>
Date: Thu, 11 May 2023 15:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] softmmu/ioport.c: QOMify MemoryRegionPortioList
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230419151652.362717-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/4/23 17:16, Mark Cave-Ayland wrote:
> The aim of QOMification is so that the lifetime of the MemoryRegionPortioList
> structure can be managed using QOM's in-built refcounting instead of having to
> handle this manually.
> 
> Due to the use of an opaque pointer it isn't possible to model the new
> TYPE_MEMORY_REGION_PORTIO_LIST directly using QOM properties, however since
> use of the new object is restricted to the portio API we can simply set the
> opaque pointer (and the heap-allocated port list) internally.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   softmmu/ioport.c | 25 ++++++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)


>   static uint64_t unassigned_io_read(void *opaque, hwaddr addr, unsigned size)
>   {
> @@ -228,7 +233,8 @@ static void portio_list_add_1(PortioList *piolist,
>       unsigned i;
>   
>       /* Copy the sub-list and null-terminate it.  */
> -    mrpio = g_malloc0(sizeof(MemoryRegionPortioList));
> +    mrpio = MEMORY_REGION_PORTIO_LIST(
> +                object_new(TYPE_MEMORY_REGION_PORTIO_LIST));

Shouldn't we need to replace the g_free() call by object_unref()
in portio_list_destroy()?

>       mrpio->portio_opaque = piolist->opaque;
>       mrpio->ports = g_malloc0(sizeof(MemoryRegionPortio) * (count + 1));
>       memcpy(mrpio->ports, pio_init, sizeof(MemoryRegionPortio) * count);
> @@ -298,3 +304,16 @@ void portio_list_del(PortioList *piolist)
>           memory_region_del_subregion(piolist->address_space, &mrpio->mr);
>       }
>   }


