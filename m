Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E61436078
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 13:42:35 +0200 (CEST)
Received: from localhost ([::1]:52014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdWSw-0002uJ-8l
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 07:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdWOF-0001BV-8j
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdWOC-0002UI-PJ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 07:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634816259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ma0D28XE7zUeYYdaP4YAyHTbqHevrr1BV4DI5YE46Q=;
 b=BjXdwXMIRXV0QahG2Y4hHPZXpD5Ozna7wN95GrcSW8Pry0feIymVJsCy0lrL1rU+11IAEV
 v535gI4iltVmaszSAKl82ZeyB4uUqBgf2zE0NM7jHRUtxby+ILWR9GvJ/gzlsPeE/0yEdR
 ESHETsb8tBAIeIAbZLvkWDVGaafZrH4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-gyIlM57iP3icUZLMlUu1IQ-1; Thu, 21 Oct 2021 07:37:36 -0400
X-MC-Unique: gyIlM57iP3icUZLMlUu1IQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso3272501wmq.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 04:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2ma0D28XE7zUeYYdaP4YAyHTbqHevrr1BV4DI5YE46Q=;
 b=YgNChcg8K0GMIkRf8YYO39A9SvjQGhWR3f+5Aeux0x8Z13zhsTdt4yJEiovySr9TP4
 SIo5mDk2LYvYFqd+qjEeMdq2ZR4VLIe1p6s6Rmy2eX0Pr9WxYsnT3a145N/72Xmilhi5
 LFNQ0In00tPYmsDVRVcgHu0kVFwrHGb/KQW9ZsBFXZ6eYZnz74tVClWgKi6tDIgtVPwb
 CXgJdl9vwVjlyFiyztD/G7iwEC7QWxToBV8g+lASPZ0go7WKbAGdfZ0eN4kyIl4ZC8Fi
 xrv7Itmhkyyz/oh826mocjrpK8GrEZB7bL7gSjV7AwtGbMY+DfjtAg2tJVr9QUCI1yRf
 t7oA==
X-Gm-Message-State: AOAM533KCEOd9MDzn6nz0F+DKhyH7/dbX0W0zflE0FyvyoXcIZ1NkXUW
 /RLueFz22K09U/NBZgKqeSDrxh6ruEUnSmQIZv7mMiSZI1IedWcsFQ4nhPjLLxhdeFJOytwOAPb
 Rv27tFsdOvbsWUR0=
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr20726998wmi.181.1634816255684; 
 Thu, 21 Oct 2021 04:37:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGXSATNocHgO3bNCE5587dsYlqUajvIcfpKbSHxkdDTUIGISL46/9VlTG3Gs0JTbdLxr79fw==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr20726972wmi.181.1634816255505; 
 Thu, 21 Oct 2021 04:37:35 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id p11sm8984439wmi.0.2021.10.21.04.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 04:37:35 -0700 (PDT)
Subject: Re: [PATCH 4/8] pci: Define pci_bus_fn/pci_bus_ret_fn type
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-5-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <fcc9f7cc-b8ea-f1ae-04b4-5aea553331e2@redhat.com>
Date: Thu, 21 Oct 2021 13:37:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-5-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 10/21/21 12:42 PM, Peter Xu wrote:
> The pci_bus_fn is similar to pci_bus_dev_fn that only takes a PCIBus* and an
> opaque.  The pci_bus_ret_fn is similar to pci_bus_fn but it allows to return a
> void* pointer.
>
> Use them where proper in pci.[ch], and to be used elsewhere.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/pci/pci.c         |  6 ++----
>  include/hw/pci/pci.h | 12 +++++-------
>  2 files changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 6b834cace5..4a84e478ce 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2072,10 +2072,8 @@ static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num)
>      return NULL;
>  }
>  
> -void pci_for_each_bus_depth_first(PCIBus *bus,
> -                                  void *(*begin)(PCIBus *bus, void *parent_state),
> -                                  void (*end)(PCIBus *bus, void *state),
> -                                  void *parent_state)
> +void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
> +                                  pci_bus_fn end, void *parent_state)
>  {
>      PCIBus *sec;
>      void *state;
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 437eabe609..a7e81f04d3 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -402,6 +402,8 @@ OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
>  
>  typedef void (*pci_bus_dev_fn)(PCIBus *b, PCIDevice *d, void *opaque);
> +typedef void (*pci_bus_fn)(PCIBus *b, void *opaque);
> +typedef void* (*pci_bus_ret_fn)(PCIBus *b, void *opaque);
>  
>  bool pci_bus_is_express(PCIBus *bus);
>  
> @@ -470,17 +472,13 @@ void pci_for_each_device_under_bus(PCIBus *bus,
>  void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                             pci_bus_dev_fn fn,
>                                             void *opaque);
> -void pci_for_each_bus_depth_first(PCIBus *bus,
> -                                  void *(*begin)(PCIBus *bus, void *parent_state),
> -                                  void (*end)(PCIBus *bus, void *state),
> -                                  void *parent_state);
> +void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
> +                                  pci_bus_fn end, void *parent_state);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
>  static inline
> -void pci_for_each_bus(PCIBus *bus,
> -                      void (*fn)(PCIBus *bus, void *opaque),
> -                      void *opaque)
> +void pci_for_each_bus(PCIBus *bus, pci_bus_fn fn, void *opaque)
>  {
>      pci_for_each_bus_depth_first(bus, NULL, fn, opaque);
>  }


