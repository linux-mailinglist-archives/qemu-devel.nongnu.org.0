Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9302682FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 15:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMr0f-0004qj-Nr; Tue, 31 Jan 2023 08:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr0a-0004qO-9I
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMr0Y-0007Uf-9R
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 08:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675172949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1SQGRXVqvhY8RO6zomhVT8hd1gS0VbcXgeu/DKbdig=;
 b=iVcApj5i1SurYgWYeQdT2l1gsErsCY4bJXZz7FZlzJBTGZfBs79u+QZ6NWatyoOO0U5t5W
 +seSf6oOVr/vByDR3a4KbRz6k6J6qxZCBOiWhkWVlbmvkdwl1o0+4ifu9uWkuFhXnaZLyY
 t7N34b9xmpY8tAcCl8Ym495IKG5jb/A=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-avzyXywPNSOkUyUSRIXs1w-1; Tue, 31 Jan 2023 08:49:07 -0500
X-MC-Unique: avzyXywPNSOkUyUSRIXs1w-1
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so4675317qtj.13
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 05:49:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/1SQGRXVqvhY8RO6zomhVT8hd1gS0VbcXgeu/DKbdig=;
 b=1r5C6c8E3IQT+7kKQHX1KAwfW4s7aKUgWmyZrvPVyd2PhEinheb4jGdFx4WvDmcGMx
 hOTi5EJY16EOkx5JsWAxJ30h8mDG5g5Hw4YTDT0eNsxzd2uYCzApTfqgkWkjsTFkWwFi
 w03w3sO3/d9PD1h1zUzdMshjjyFzmiRev+6VLfDGXLu7r5jmaik9k5+mw0zgtzKhI9Mv
 c7E4FrLS1HR7oCW8tm3Dtq9XcLSBD+ZVL5wC29SqmdDhXhwMan17aZN538UUNr4mlVVu
 Uz8I5YZ/ksoxjoIlflx98yltZxR2csZ5o0CtuvwEXkfs7ArenmXT0CnIFG0r0EB8Pcyi
 BKVQ==
X-Gm-Message-State: AFqh2kqhOso5XICpGKVxNVyVgvr/CSJ4Hf7DtHR2AbIqDgHiKpq9wBx/
 nGgJr3Bv7qlJL/+/1/P7m6hlDOqQ5vQCziFiPDlphbYT0mA0x7ess26T80a2hQgqoWxl0g5F25j
 B4GY+Ta+BWbAHaxk=
X-Received: by 2002:a05:622a:4d88:b0:3b6:2f3f:2713 with SMTP id
 ff8-20020a05622a4d8800b003b62f3f2713mr82309146qtb.25.1675172947405; 
 Tue, 31 Jan 2023 05:49:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+n0+8/kik1kKPwfGNjBad4AuZ08YfP5RGeuH4FwG0zwgSNOreaFEv+mfpf0NjSiASrRc1tQ==
X-Received: by 2002:a05:622a:4d88:b0:3b6:2f3f:2713 with SMTP id
 ff8-20020a05622a4d8800b003b62f3f2713mr82309114qtb.25.1675172947149; 
 Tue, 31 Jan 2023 05:49:07 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 jt9-20020a05622aa00900b003b80fdaa14dsm9902844qtb.73.2023.01.31.05.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 05:49:06 -0800 (PST)
Message-ID: <6caefbfd-ec62-3841-641e-774d8984029e@redhat.com>
Date: Tue, 31 Jan 2023 14:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/20] hw/i386/pc_q35: Reuse machine parameter
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
 <20230131115326.12454-4-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230131115326.12454-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/pc_q35.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 83c57c6eb1..351ef25f69 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
>       pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>                      pci_hole64_size);
>   
> -    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
> +    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>                                OBJECT(ram_memory), NULL);
>       object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,

Reviewed-by: Thomas Huth <thuth@redhat.com>


