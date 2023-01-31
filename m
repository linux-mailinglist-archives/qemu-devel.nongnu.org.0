Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78780682E94
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:00:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMqqw-00036w-VC; Tue, 31 Jan 2023 08:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqqc-00030e-7h
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMqqa-0005Mj-0m
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:38:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675172330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CsKL8LFDr+9eMvcpykI66QvN/ZpiJF7KXn1V4M2gCP8=;
 b=JzTWHKQYWk6RmgGe4dq90L9h49+OWKQY3DCDGfGijtL99eHV72RKEY4T3/JC6PfXys8y+b
 ZF1WUBUlKqsmqqX1oHax5uq6W0VBYA3SN2D6yYz4XiyE4ACcDg2wQEvetq5jmZFBOIxFZ5
 4Ps1rL0+Nb9rYQ86agl7ivCeOILB4YY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-018JviPGMR6LS74lJgL06Q-1; Tue, 31 Jan 2023 08:38:49 -0500
X-MC-Unique: 018JviPGMR6LS74lJgL06Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 j10-20020a05620a288a00b0070630ecfd9bso9211977qkp.20
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CsKL8LFDr+9eMvcpykI66QvN/ZpiJF7KXn1V4M2gCP8=;
 b=elQllF7OLpZnR1MMQUVG6sAHUTPqnDB39uIiK9seshELHSD34jqfyH4atV9GJ5zjyC
 gNnlA6Lvly4fReqGLhAXcZrVgCFZEYsxOO0hVegBmZPuXpGgmyyrEGZdrDCKUX31C/eL
 zAmLWZgzk9eNM9ZyuoCR2AhNz5X+5Pcw01C3vDJhf5nadgcfw8EOXc9eaPzqv6rem011
 thBFG3bts+MsfFzBUKYSDJQZZVeT7zduVGwwZ3jbozuyQW2jx2581hVh8F0z/I8aPgrq
 wQk4FS20u/Oc/bsFELFfbMVLNM6QyppeMu/NUje1E9v1qJ4klHNn3UxG0nbXdx4/mp99
 wxNw==
X-Gm-Message-State: AO0yUKVEhj02f/KDfe24KouXFI4UZU1B9V18h7Nz54ugC69XsiW0niLo
 qApL9mx6IrhWtF5FKRR5K01Ycsob5x+XQl4XuODSsLDCp43r19KKWYTsa+RaF0HAvfm+RHu9FEm
 NrokUHMdiKhlq8oo=
X-Received: by 2002:ad4:5aa6:0:b0:53c:4375:22f4 with SMTP id
 u6-20020ad45aa6000000b0053c437522f4mr13482128qvg.26.1675172329088; 
 Tue, 31 Jan 2023 05:38:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZrtYXOca10MoBtzglBZ1ZzpBQAbNs7XIPMmHbYinQ6dfCwEYu8g7xR6BfMlK/KU9xHWzD9Q==
X-Received: by 2002:ad4:5aa6:0:b0:53c:4375:22f4 with SMTP id
 u6-20020ad45aa6000000b0053c437522f4mr13482086qvg.26.1675172328843; 
 Tue, 31 Jan 2023 05:38:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 v4-20020a379304000000b006cec8001bf4sm9994395qkd.26.2023.01.31.05.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:38:48 -0800 (PST)
Message-ID: <3008ba21-6d33-9944-420d-37349dd6ba25@redhat.com>
Date: Tue, 31 Jan 2023 14:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/20] hw/pci-host/q35: Inline sysbus_add_io()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org
References: <20230131115326.12454-1-shentey@gmail.com>
 <20230131115326.12454-3-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 31/01/2023 12.53, Bernhard Beschow wrote:
> sysbus_add_io() just wraps memory_region_add_subregion() while also
> obscuring where the memory is attached. So use
> memory_region_add_subregion() directly and attach it to the existing
> memory region s->mch.address_space_io which is set as an alias to
> get_system_io() by the q35 machine.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/pci-host/q35.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 26390863d6..fa05844319 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -50,10 +50,12 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
>       Q35PCIHost *s = Q35_HOST_DEVICE(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>   
> -    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
> +    memory_region_add_subregion(s->mch.address_space_io,
> +                                MCH_HOST_BRIDGE_CONFIG_ADDR, &pci->conf_mem);
>       sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_ADDR, 4);
>   
> -    sysbus_add_io(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
> +    memory_region_add_subregion(s->mch.address_space_io,
> +                                MCH_HOST_BRIDGE_CONFIG_DATA, &pci->data_mem);
>       sysbus_init_ioports(sbd, MCH_HOST_BRIDGE_CONFIG_DATA, 4);
>   
>       /* register q35 0xcf8 port as coalesced pio */

Reviewed-by: Thomas Huth <thuth@redhat.com>


