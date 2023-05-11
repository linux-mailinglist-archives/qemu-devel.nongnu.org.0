Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6C6FFA17
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:23:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxBs8-0001kE-6m; Thu, 11 May 2023 15:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBs5-0001jg-Ce
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:22:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxBs3-0005DR-MD
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:22:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315735514so297330815e9.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683832954; x=1686424954;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zrX02xnfh/5d3kDmovWbhcfrISmLbLxLcg3D1ApzQss=;
 b=I5lxLF6ivUqXHNNV4zF2C+9koQrGMrtKbmqfPHK7LA0qcqIocc6mCbF6Kz26ijILd2
 jCRgVCciuPQdz/OzRA6DRmZUeSPVLCpWNeieimO3ixdygdI/XEbl7WZk0B4aPkiZf/se
 a7EVLsVPfB0sNUObuvCy9KWR6Op/XNsJnTZCv1t2vqY7ZxL1Q8ZdTN00HWGXiqCJSSpI
 /er6xvB/GFuIzXQKaGvQuxvPNQQfIdNzl1h+V6etrSBganTsnAdvEDsJ58qGqlH5JutE
 EEU8S28mk+GXO+Nb9CQfU66Jl6X9T4wLh+0InpBy6tVAxbqIXRowUdnnyaL0HhLvq5lR
 g2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683832954; x=1686424954;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zrX02xnfh/5d3kDmovWbhcfrISmLbLxLcg3D1ApzQss=;
 b=ZdfZSmQsoranRNDowV1pCF1RF6PxZueCpMGJnyHE61sJiulrJGI9ymvJWK1V+wQnhi
 JeQvAZk370Gr1DoTuWsMkISOwMQcodioKgjBi0vxeRRWmlgyuVIfdQV7YVHHtRAXt8Uj
 cwlB36llIcqV3KgDsyDLuUwWQkCaDSiOquhSzUCwSokWLwgVN4ic335AsiQGJukTDw4G
 /VUn03wRDdKi5bhvgyk3/8XV27d0m1dIJ0lNDFkv96cdeWcpde3tWqVZ1WYC9xfbySQD
 +V1rynNfUG6QZ0mBKqYFJry+IsSi54KRVMYKV4bD4Ehly2usYrH2kPCQeXsrfB/ok6hM
 j/Vg==
X-Gm-Message-State: AC+VfDwL9OwQqoUbDo1F/al/OoKKG8VEldVTQg3AlMtMyXIleXUwzn8W
 jzaY2HFrqec9PyGWPLGyD+W2DzOb+KJ/t9Wo3/I=
X-Google-Smtp-Source: ACHHUZ7QU0uEbIUUbZ+aX8SZeU1t50EACmO3EQye8bD35ufDgoWvLi4Oh05hS/gKiieMjj8MweeMkA==
X-Received: by 2002:a5d:4589:0:b0:307:29a7:930a with SMTP id
 p9-20020a5d4589000000b0030729a7930amr19362810wrq.14.1683832953908; 
 Thu, 11 May 2023 12:22:33 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.186])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a056000120e00b00307c46f4f08sm3310536wrx.79.2023.05.11.12.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 May 2023 12:22:33 -0700 (PDT)
Message-ID: <0f030dfa-9c3e-b44a-584a-22deca1680f7@linaro.org>
Date: Thu, 11 May 2023 21:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] softmmu/ioport.c: make MemoryRegionPortioList owner
 of portio_list MemoryRegions
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20230419151652.362717-1-mark.cave-ayland@ilande.co.uk>
 <20230419151652.362717-4-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
In-Reply-To: <20230419151652.362717-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
> Currently when portio_list MemoryRegions are freed using portio_list_destroy() the RCU
> thread segfaults generating a backtrace similar to that below:
> 
>      #0 0x5555599a34b6 in phys_section_destroy ../softmmu/physmem.c:996
>      #1 0x5555599a37a3 in phys_sections_free ../softmmu/physmem.c:1011
>      #2 0x5555599b24aa in address_space_dispatch_free ../softmmu/physmem.c:2430
>      #3 0x55555996a283 in flatview_destroy ../softmmu/memory.c:292
>      #4 0x55555a2cb9fb in call_rcu_thread ../util/rcu.c:284
>      #5 0x55555a29b71d in qemu_thread_start ../util/qemu-thread-posix.c:541
>      #6 0x7ffff4a0cea6 in start_thread nptl/pthread_create.c:477
>      #7 0x7ffff492ca2e in __clone (/lib/x86_64-linux-gnu/libc.so.6+0xfca2e)
> 
> The problem here is that portio_list_destroy() unparents the portio_list MemoryRegions
> causing them to be freed immediately, however the flatview still has a reference to the
> MemoryRegion and so causes a use-after-free segfault when the RCU thread next updates
> the flatview.
> 
> Solve the lifetime issue by making MemoryRegionPortioList the owner of the portio_list
> MemoryRegions, and then reparenting them to the portio_list owner. This ensures that they
> can be accessed as QOM childen via the portio_list owner, yet the MemoryRegionPortioList

"children"

> owns the refcount.
> 
> Update portio_list_destroy() to unparent the MemoryRegion from the portio_list owner and
> then add a finalize() method to MemoryRegionPortioList, so that the portio_list
> MemoryRegions remain allocated until flatview_destroy() removes the final refcount upon
> the next flatview update.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   softmmu/ioport.c | 34 +++++++++++++++++++++++++++++++---
>   1 file changed, 31 insertions(+), 3 deletions(-)


> @@ -230,6 +230,8 @@ static void portio_list_add_1(PortioList *piolist,
>                                 unsigned off_low, unsigned off_high)
>   {
>       MemoryRegionPortioList *mrpio;
> +    Object *owner;
> +    char *name;
>       unsigned i;
>   
>       /* Copy the sub-list and null-terminate it.  */
> @@ -246,8 +248,25 @@ static void portio_list_add_1(PortioList *piolist,
>           mrpio->ports[i].base = start + off_low;
>       }
>   
> -    memory_region_init_io(&mrpio->mr, piolist->owner, &portio_ops, mrpio,
> +    /*
> +     * The MemoryRegion owner is the MemoryRegionPortioList since that manages
> +     * the lifecycle via the refcount
> +     */
> +    memory_region_init_io(&mrpio->mr, OBJECT(mrpio), &portio_ops, mrpio,
>                             piolist->name, off_high - off_low);
> +
> +    /* Reparent the MemoryRegion to the piolist owner */
> +    object_ref(&mrpio->mr);
> +    object_unparent(OBJECT(&mrpio->mr));

Out of this patch scope, but could this part <...

> +    if (!piolist->owner) {
> +        owner = container_get(qdev_get_machine(), "/unattached");
> +    } else {
> +        owner = piolist->owner;
> +    }
> +    name = g_strdup_printf("%s[*]", piolist->name);
> +    object_property_add_child(owner, name, OBJECT(&mrpio->mr));
> +    g_free(name);

...> be extracted as qdev_add_child()? It seems to duplicate
code from device_set_realized().

>       if (piolist->flush_coalesced_mmio) {
>           memory_region_set_flush_coalesced(&mrpio->mr);
>       }
> @@ -305,10 +324,19 @@ void portio_list_del(PortioList *piolist)
>       }
>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


