Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F5435FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:58:46 +0200 (CEST)
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdVmX-0006Dw-30
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdVj3-0002V8-Lh
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:55:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mdVj1-00057G-NL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gor+3JEJjhrLsQJF2eXJ4FRyttoVPGoM1mgTggEg9KU=;
 b=LOy0zuWk/B2mIepwyf5vPIEl3kB178rrcK545jdP9HB0sGjIyOTOn/ZEE1yagaHP2fvQMX
 WoTIzRh700xnOaaeMU5ImaXIxvXzaqMGSGel74T9D2tUezduOyank78UvGbhjdwoMBMckM
 5WP0IRg+0OuFgdaRbrt96CLOCvg9YuI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Q9ZMduMzNJSwtntKKsSa-Q-1; Thu, 21 Oct 2021 06:55:05 -0400
X-MC-Unique: Q9ZMduMzNJSwtntKKsSa-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020adfa386000000b00160c4c1866eso67955wrb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gor+3JEJjhrLsQJF2eXJ4FRyttoVPGoM1mgTggEg9KU=;
 b=GI85JgFmTV7XCWk3RvCEK90M4Ezgbp9HQ16ZRCVugvCMGPK2kJ0Q272vOLSK/SqxaF
 ozL6mMupTvtDEV/0aHMMMVvjb7h2h/SArl/fftntTwc/Zpkh7riD0kjEe4FaAp1lndNq
 F/i2wlUliHdS04tH3tM/vCFjRZspDxMOaZW99lV4TsTDp62EcsaMTR38M7zhEsmPB9NS
 VXa07ksqAU160gljqwT+V9OzstNlyazTWyEBbW6IBRGJ/WZKOg5ciHqW6lOuRi9fBkVs
 7ttpF83bb5DhKN916ORA37UDrUmczqAzGIxLQDIpv2p2QP1aJZpLVjy5TRAt9RjeMPjf
 u9XQ==
X-Gm-Message-State: AOAM5311zRvGPNxGeo5OKrpibWIp5nxRX3z/3xntUIR7yNTlGCY+OfUZ
 LgyvGIMW4MlnDUAxVaG57fUijr4A5n6JnKivHVVcb5f3u1N0fv2tDFRgEC1P7R0P2413N73EeX7
 4BZPm68Cvn9iVwNs=
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5735609wmq.147.1634813704461; 
 Thu, 21 Oct 2021 03:55:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyINqkMLLKD+5PVm2kbtrz/SudYONHQ/yxSkoiGFATC6Y/ml8C8oDss3xU8pLRxyV5ga10PTw==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr5735576wmq.147.1634813704222; 
 Thu, 21 Oct 2021 03:55:04 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id c18sm4614076wrr.60.2021.10.21.03.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 03:55:03 -0700 (PDT)
Date: Thu, 21 Oct 2021 06:54:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 7/8] pci: Add pci_for_each_device_all()
Message-ID: <20211021064948-mutt-send-email-mst@kernel.org>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-8-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-8-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 21, 2021 at 06:42:58PM +0800, Peter Xu wrote:
> With all the prepared infrastructures, we can easily add one helper now to loop
> over all the existing PCI devices across the whole system.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 25 +++++++++++++++++++++++++
>  include/hw/pci/pci.h |  2 ++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 1623bc9099..5c970f0727 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2124,6 +2124,31 @@ void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
>      object_child_foreach_recursive(object_get_root(), pci_find_root_bus, &args);
>  }
>  
> +typedef struct {
> +    pci_bus_dev_fn fn;
> +    void *opaque;
> +} pci_bus_dev_args;

code style violation. CamelCase for structs pls.

> +
> +static void pci_single_bus_hook(PCIBus *bus, void *opaque)
> +{
> +    pci_bus_dev_args *args = opaque;
> +
> +    pci_for_each_device_under_bus(bus, args->fn, args->opaque);
> +}
> +
> +static void pci_root_bus_hook(PCIBus *bus, void *opaque)
> +{
> +    assert(pci_bus_is_root(bus));
> +    pci_for_each_bus(bus, pci_single_bus_hook, opaque);
> +}
> +
> +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque)
> +{
> +    pci_bus_dev_args args = { .fn = fn, .opaque = opaque };
> +
> +    pci_for_each_root_bus(pci_root_bus_hook, &args);
> +}
> +
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
>  {
>      bus = pci_find_bus_nr(bus, bus_num);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 9e490d8969..1a862d1903 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -476,6 +476,8 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
>  /* Call `fn' for each pci root bus on the system */
>  void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
> +/* Call 'fn' for each pci device on the system */
> +void pci_for_each_device_all(pci_bus_dev_fn fn, void *opaque);

Instead of hacking pci making initialization o(N^2),
can't we add a variant of object_resolve_path_type ?


>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
> -- 
> 2.32.0


