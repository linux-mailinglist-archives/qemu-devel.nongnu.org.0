Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BC4436013
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:18:07 +0200 (CEST)
Received: from localhost ([::1]:33508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdW5G-0006E9-D5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdW2V-0005Fs-1o
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:15:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdW2P-0003up-3F
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634814907;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g/WG+wLrAjf/4LffKuRQtmX2u6rBuUhEbX8s3ndMwr4=;
 b=fXhJ6UO4cpSJCzM6hN93IF41IRc1mAoEOo1xycf5D7h8T+9PbkcteYVRVyVZR9DFpncWbb
 Y4iWwgxlhdhvAlKPFbSU5i/tEIbKCaM1afbfGh15BImUuezKo4hSBn0pfwoR46lkE1Lu1K
 z2kx7Tl2RGZPv21tAGVWPbSMg06lH5U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-eRh82HBPNuadGfXu9hcY1g-1; Thu, 21 Oct 2021 07:15:06 -0400
X-MC-Unique: eRh82HBPNuadGfXu9hcY1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 p3-20020a05600c204300b0030daa138dfeso79168wmg.9
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=g/WG+wLrAjf/4LffKuRQtmX2u6rBuUhEbX8s3ndMwr4=;
 b=EKcASo4/hEj5zsXQGDZNAWR+PrwdVikv0I/9TdFCLXZ6QOZM4bsVknGOGgpV/qaouK
 wotxAmtZjB6MwBTQ3MZdaXIpbTxkYpD2lZtdSc+6Bpl0OkV6jTtqUGt9yhls73icG0D2
 3SIuZ/tdk58EHkjaAGbyhQK+HG6WxkKFs78Yd/e+JD1VeIFWfr+4pHcScLqnKRMhrcFm
 lVBIBVSGhe1litOYg/w1FduUuW96gH6HOB0FgLhhgoJAAyEz//+gaq/TsmEybM/uolFk
 uHxwVKq1oRXtqt0xx5Q5Qdv93G0Leie0lCNb4lM0K00Ai+pDmOKDyzR1lxN9Y+aPf21U
 a/qw==
X-Gm-Message-State: AOAM53271y8K2YOuS1Iak4IthUKYexSdAVnTsgSE2cz2vVPrQT0KCEdV
 dYqucOgr0wl6qqgteRmCEj5r/ISbhdzQtyQ5BRvIKmyPOggMgFw2vqLumqUAw6fjKl4IZ/jjR/o
 ySpoQ89A77Nb2XAw=
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr5904968wmc.128.1634814905367; 
 Thu, 21 Oct 2021 04:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNuhfPEuBJIgZLpvd7EQcaTofMG3Z9zxm4UOViMqS3vf9h3KBU1vcs4R2Ajpu11ZmGIwXZAQ==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr5904917wmc.128.1634814905106; 
 Thu, 21 Oct 2021 04:15:05 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id f8sm29725wrj.41.2021.10.21.04.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:15:04 -0700 (PDT)
Subject: Re: [PATCH 1/8] pci: Define pci_bus_dev_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-2-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <f9531d03-e6ca-50ce-22c7-3616fae9d6fc@redhat.com>
Date: Thu, 21 Oct 2021 13:15:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-2-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 10/21/21 12:42 PM, Peter Xu wrote:
> It's used in quite a few places of pci.c and also in the rest of the code base.
> Define such a hook so that it doesn't need to be defined all over the places.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 14 ++++----------
>  include/hw/pci/pci.h |  7 ++++---
>  2 files changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 186758ee11..1ab2b78321 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1655,9 +1655,7 @@ static const pci_class_desc pci_class_descriptions[] =
>  };
>  
>  static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
> -                                                  void (*fn)(PCIBus *b,
> -                                                             PCIDevice *d,
> -                                                             void *opaque),
> +                                                  pci_bus_dev_fn fn,
>                                                    void *opaque)
>  {
>      PCIDevice *d;
> @@ -1672,8 +1670,7 @@ static void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>  }
>  
>  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
> -                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
> -                         void *opaque)
> +                                 pci_bus_dev_fn fn, void *opaque)
>  {
>      bus = pci_find_bus_nr(bus, bus_num);
>  
> @@ -1683,9 +1680,7 @@ void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
>  }
>  
>  static void pci_for_each_device_under_bus(PCIBus *bus,
> -                                          void (*fn)(PCIBus *b, PCIDevice *d,
> -                                                     void *opaque),
> -                                          void *opaque)
> +                                          pci_bus_dev_fn fn, void *opaque)
>  {
>      PCIDevice *d;
>      int devfn;
> @@ -1699,8 +1694,7 @@ static void pci_for_each_device_under_bus(PCIBus *bus,
>  }
>  
>  void pci_for_each_device(PCIBus *bus, int bus_num,
> -                         void (*fn)(PCIBus *b, PCIDevice *d, void *opaque),
> -                         void *opaque)
> +                         pci_bus_dev_fn fn, void *opaque)
>  {
>      bus = pci_find_bus_nr(bus, bus_num);
>  
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 7fc90132cf..8e2d80860b 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -401,6 +401,8 @@ typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
>  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
>  
> +typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
> +
>  bool pci_bus_is_express(PCIBus *bus);
>  
>  void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
> @@ -458,11 +460,10 @@ static inline int pci_dev_bus_num(const PCIDevice *dev)
>  
>  int pci_bus_numa_node(PCIBus *bus);
>  void pci_for_each_device(PCIBus *bus, int bus_num,
> -                         void (*fn)(PCIBus *bus, PCIDevice *d, void *opaque),
> +                         pci_bus_dev_fn fn,
>                           void *opaque);
>  void pci_for_each_device_reverse(PCIBus *bus, int bus_num,
> -                                 void (*fn)(PCIBus *bus, PCIDevice *d,
> -                                            void *opaque),
> +                                 pci_bus_dev_fn fn,
>                                   void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus,
>                                    void *(*begin)(PCIBus *bus, void *parent_state),
There is another candidate in
hw/ppc/pegasos2.c:    void (*dtf)(PCIBus *bus, PCIDevice *d, FDTInfo *fi);
but this may be coverted later by the maintainer of this file.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


