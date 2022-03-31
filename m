Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83F4ED8BE
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 13:54:39 +0200 (CEST)
Received: from localhost ([::1]:33644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtNu-0005qW-Dk
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 07:54:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtGJ-000259-An
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:46:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nZtGH-0005Q5-KB
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 07:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648727202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rG3OyC1Cr/aE5F4ZUj2+8PA1ZNO78n8Kim9gw1TVbWY=;
 b=As3LH46K57ydvqT8rO+m06U3yecdSGHZDn7TnLr8j+6WcGRcusaNhoiHxXDaObENpN9R4J
 3vlICdSSw9TgrMaAVz6fIKvIb6K+bIf7jWpHEayrJJYgQLIm7XYdLatMb01Aj6jwBC5R5L
 CLzFcKSVbte4dulES7XpKWmfe5N79xw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-YwiTTVQeNG2aceUah3WJ3A-1; Thu, 31 Mar 2022 07:46:41 -0400
X-MC-Unique: YwiTTVQeNG2aceUah3WJ3A-1
Received: by mail-ed1-f69.google.com with SMTP id
 s9-20020a50d489000000b00418d556edbdso14786091edi.4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 04:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rG3OyC1Cr/aE5F4ZUj2+8PA1ZNO78n8Kim9gw1TVbWY=;
 b=so80nrO3LBONLe9wkLDBQm6YLMWkaTEWnhynfyea/y3/a8rhL5mn+1m45ETnnoKbqC
 B68d/4GOSdES13669i+m1E24nSd7YKPIyqfkCUGV50iutjBD1yi0vkxKGVUSvT/6+dse
 MoSXI0TDyarnKmaSUd4I20aB2zg34LYf6ZiW/KXO+znev++yzWiezEQknNsqOgxVo5Ka
 LiJ/CT7PgF841pGk6HzY4sFGiI4/vuWWfZL4OkLMW+A34+3VznwozXtKseuGz2ilEKsO
 hZELfblITsbc/D5D9xhQObmpl4n8eTMQ/aY7GtElYxKLXDu8xa5BEACQ4BSDV/U9xf4V
 m3GQ==
X-Gm-Message-State: AOAM530TFUkxMIGEkMJ/auWP3iapETXYI8phrhwMPu5V7FKBdzhvXlrU
 3yb3vjIp3KvVp2B3zZ55QBEn4G3/QcFj6Oz9iM529jxnhd2kNMlyyilEEnjnIIw+m3/eq+WrUZG
 D6ikDEEVyzAZxVFM=
X-Received: by 2002:a17:907:9623:b0:6de:c0fb:8acc with SMTP id
 gb35-20020a170907962300b006dec0fb8accmr4470338ejc.380.1648727199700; 
 Thu, 31 Mar 2022 04:46:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwruZQRx/Tvb3K3nv1dYDkx4WHXxrwn1qOtvpA9Y3TgGr8BA0kDvXQyyq+L0A+XLEJNJOY8nA==
X-Received: by 2002:a17:907:9623:b0:6de:c0fb:8acc with SMTP id
 gb35-20020a170907962300b006dec0fb8accmr4470317ejc.380.1648727199459; 
 Thu, 31 Mar 2022 04:46:39 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm9206194eje.183.2022.03.31.04.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 04:46:39 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:46:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Maxim Davydov <maxim.davydov@openvz.org>
Subject: Re: [PATCH v1 2/9] pci: add null-pointer check
Message-ID: <20220331134637.6f45d33e@redhat.com>
In-Reply-To: <20220328211539.90170-3-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-3-maxim.davydov@openvz.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, armbru@redhat.com,
 crosa@redhat.com, qemu-devel@nongnu.org, lizhijian@fujitsu.com,
 f4bug@amsat.org, wangyanan55@huawei.com, marcandre.lureau@redhat.com,
 chen.zhang@intel.com, jsnow@redhat.com, pbonzini@redhat.com, ani@anisinha.ca,
 den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 29 Mar 2022 00:15:32 +0300
Maxim Davydov <maxim.davydov@openvz.org> wrote:

> Call pci_bus_get_w64_range can fail with the segmentation fault. For
> example, this can happen during attempt to get pci-hole64-end

>" immediately after initialization"
this too vague, pls provide a better description 
and is possible a reproducer.

> 
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
> ---
>  hw/pci-host/i440fx.c | 17 +++++++++++------
>  hw/pci-host/q35.c    | 17 +++++++++++------
>  2 files changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index e08716142b..71a114e551 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -158,10 +158,12 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
>      PCIHostState *h = PCI_HOST_BRIDGE(obj);
>      I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>      Range w64;
> -    uint64_t value;
> +    uint64_t value = 0;
>  
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    }
>      if (!value && s->pci_hole64_fix) {
>          value = pc_pci_hole64_start();
>      }
> @@ -191,10 +193,13 @@ static void i440fx_pcihost_get_pci_hole64_end(Object *obj, Visitor *v,
>      I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
>      uint64_t hole64_start = i440fx_pcihost_get_pci_hole64_start_value(obj);
>      Range w64;
> -    uint64_t value, hole64_end;
> +    uint64_t value = 0;
> +    uint64_t hole64_end;
>  
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    }
>      hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
>      if (s->pci_hole64_fix && value < hole64_end) {
>          value = hole64_end;
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index ab5a47aff5..d679fd85ef 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -124,10 +124,12 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
>      PCIHostState *h = PCI_HOST_BRIDGE(obj);
>      Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>      Range w64;
> -    uint64_t value;
> +    uint64_t value = 0;
>  
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
> +    }
>      if (!value && s->pci_hole64_fix) {
>          value = pc_pci_hole64_start();
>      }
> @@ -157,10 +159,13 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
>      Q35PCIHost *s = Q35_HOST_DEVICE(obj);
>      uint64_t hole64_start = q35_host_get_pci_hole64_start_value(obj);
>      Range w64;
> -    uint64_t value, hole64_end;
> +    uint64_t value = 0;
> +    uint64_t hole64_end;
>  
> -    pci_bus_get_w64_range(h->bus, &w64);
> -    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    if (h->bus) {
> +        pci_bus_get_w64_range(h->bus, &w64);
> +        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
> +    }
>      hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
>      if (s->pci_hole64_fix && value < hole64_end) {
>          value = hole64_end;


