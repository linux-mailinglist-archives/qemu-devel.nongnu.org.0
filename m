Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311D06A4699
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:00:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfuZ-0000g2-Im; Mon, 27 Feb 2023 10:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWfuX-0000Ox-1p
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pWfuV-0006cg-Bw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 10:59:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677513570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bvP4onGfIKSgvrhagbREcTib5S75SUYcHaG7vHhhr0k=;
 b=cyE/PZQ2rC7mbwagAIGrCo9vN8xWkTlTD+voQS4sTTmqkYlv+xi0vdPPay7YgCbe5/w66o
 oYR6C/cT8M5IP18yvyVIZsJzAqKsLHq1FifFjZiSC0NtsHjOAKP5mNazLjod0NLFy0Brgm
 S/aoxfvCA89cwscav+wjD0X202vjW+s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-GyDLNyXaNkucM64tRQM7zg-1; Mon, 27 Feb 2023 10:59:29 -0500
X-MC-Unique: GyDLNyXaNkucM64tRQM7zg-1
Received: by mail-wr1-f70.google.com with SMTP id
 1-20020a056000154100b002c54d9b8312so956700wry.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 07:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bvP4onGfIKSgvrhagbREcTib5S75SUYcHaG7vHhhr0k=;
 b=AilxDrY21HCylnL9P9SUd1JmNKzbsBu6UHpuw1ZQkgAUL69JzufIJmRKvOcmjwkrI0
 Q//GCK/e/3UKLmcVqSmDaXr6zypUzyt1DjpCLot8eRJtC/0IR025NiO0MPXB1tKW20J0
 Ef9h8irsq58lhC0NHsoNhl+w8cBuxD78dMesgoaldsv45nU3PoRTUYmhgqlGWUhv8iph
 h1iFTLhyrlLxmEmcfZk6jkAEHcn2K4zejADjHbkM3pP7vMLecGSwLbKaQnO3Sim0WasX
 HFKotsvD/Os6PbSGuQH8Gj9EWpuzcv90yZUHkC6FzlhDoYap4WT6pkf9cR8rweneZtuz
 2ESQ==
X-Gm-Message-State: AO0yUKVyXt0AT27AJ9TrVFkSgeoP3rRjA03TpUEqQ9rqCq/bfOVgz32m
 BbraqxckG/rpXp1eRf8mNIVJY3rjSJk0+twTCBVeb0HUKO9XX7gKCDwuvLWppL90yB2kY1RU/7B
 csnV0ANyfOdhdjYw=
X-Received: by 2002:a5d:66ce:0:b0:2c5:c71:4a84 with SMTP id
 k14-20020a5d66ce000000b002c50c714a84mr18772887wrw.68.1677513568241; 
 Mon, 27 Feb 2023 07:59:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/PHZAJsMchn+AVGGBC3m+o39Zj8gpt+ZtTlZpXmVSxz7zeW+dqO2a8QPK1hgyvIgVahwmaSw==
X-Received: by 2002:a5d:66ce:0:b0:2c5:c71:4a84 with SMTP id
 k14-20020a5d66ce000000b002c50c714a84mr18772873wrw.68.1677513567869; 
 Mon, 27 Feb 2023 07:59:27 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228?
 (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de.
 [2003:cb:c703:1f00:7816:2307:5967:2228])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a5d6044000000b002c53f6c7599sm7484670wrt.29.2023.02.27.07.59.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 07:59:27 -0800 (PST)
Message-ID: <ebf795d9-9cbb-dda4-cf10-b83e52678a4f@redhat.com>
Date: Mon, 27 Feb 2023 16:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Reply: [PATCH] virtio-balloon: optimize the virtio-balloon on the
 ARM platform.
Content-Language: en-US
To: Yangming <yangming73@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "wangzhigang (O)" <wangzhigang17@huawei.com>,
 "zhangliang (AG)" <zhangliang5@huawei.com>, xiqi <xiqi2@huawei.com>
References: <6d5f8a599b6a41de8885434e6bb91c9a@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <6d5f8a599b6a41de8885434e6bb91c9a@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

> Optimize the virtio-balloon feature on the ARM platform by adding
> a variable to keep track of the current hot-plugged pc-dimm size,
> instead of traversing the virtual machine's memory modules to count
> the current RAM size during the balloon inflation or deflation
> process. This variable can be updated only when plugging or unplugging
> the device, which will result in an increase of approximately 60%
> efficiency of balloon process on the ARM platform.
> 
> We tested the total amount of time required for the balloon inflation process on ARM:
> inflate the balloon to 64GB of a 128GB guest under stress.
> Before: 102 seconds
> After: 42 seconds
> 
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> Signed-off-by: Ming Yang yangming73@huawei.com
> ---
>   hw/mem/pc-dimm.c           |  2 ++
>   hw/virtio/virtio-balloon.c | 33 +++++----------------------------
>   include/hw/boards.h        |  1 +
>   3 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 50ef83215c..192fc7922c 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -81,6 +81,7 @@ void pc_dimm_plug(PCDIMMDevice *dimm, MachineState *machine)
>   
>       memory_device_plug(MEMORY_DEVICE(dimm), machine);
>       vmstate_register_ram(vmstate_mr, DEVICE(dimm));
> +    machine->device_memory->dimm_size += vmstate_mr->size;
>   }
>   
>   void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
> @@ -90,6 +91,7 @@ void pc_dimm_unplug(PCDIMMDevice *dimm, MachineState *machine)
>   
>       memory_device_unplug(MEMORY_DEVICE(dimm), machine);
>       vmstate_unregister_ram(vmstate_mr, DEVICE(dimm));
> +    machine->device_memory->dimm_size -= vmstate_mr->size;
>   }

Ahh, missed that my previous comment was not addressed: we only want to 
track "real" DIMMs, not NVDIMMs.

-- 
Thanks,

David / dhildenb


