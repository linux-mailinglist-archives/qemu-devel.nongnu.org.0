Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20114439758
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 15:19:25 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mezsq-0008Hp-7n
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 09:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mezqf-0006Av-Py
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:17:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mezqd-0003cv-UX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 09:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635167826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=39InTYrt85GPVG/kl+vToxekaZ9C2eiPvSX8fuYQGts=;
 b=MHMidsfEb4soP0QufCFShEHmqODrFJ+Bc4qm5phzIuFMj17teMbf87fNKhqGzo0GoZ4qPJ
 ECbC94dlAjD9goeK3Jk5vhPdzBkdk9PpzkqqYX5DlA0W3W/ktP0AcxSphaF0YZDiC9QEuv
 nd0vLnWgHsk1PZCA9oyVQtB12Tjt1Do=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-x6EBaJUTPhiqnt5lPtMjxg-1; Mon, 25 Oct 2021 09:17:01 -0400
X-MC-Unique: x6EBaJUTPhiqnt5lPtMjxg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f63-20020a1c3842000000b0032a621260deso3491619wma.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=39InTYrt85GPVG/kl+vToxekaZ9C2eiPvSX8fuYQGts=;
 b=KjZbnNioLM0gsRlWTGoiwU64W5u9p+Stp6TxOG5teZ1uMk0kwD4sgMCgtWBpcjtyFN
 Wb3kwaqfAFCzy3rpsAwYfef8ML7CSo21xlkTC+gYjzUl1Ap2IKvHuFWrdmf4HTYo2ACc
 DToQMZ0I4e96wMRODcSlTe+UpWALmyRGPJv2K4fY7nX0nb0DX/P+MeCVG+Ua3IMHm1ZZ
 Q11WE60SVEo2QcCaSeX3v6TNmoK8uQb/C7p3NCe9gJG+MOoTS747gyZhcf89PaT2/sc7
 AmT74itKj3Dgr4D/d372swe/RHTVv2lLYMo0QWjy8PnsGe3UDjAuL+Wxq8PoRgiPjmXV
 bPQA==
X-Gm-Message-State: AOAM533xLpUfBz7W4xhjIHNadSW8SIthiUrIa23kPAaNssyGleaXeWsq
 3uqZQG6xLpZO8z4nfnkGoZ6PlPHW2pGUmZ7xdtQyVGQxpDpl8ekj9Y83SZ1ah1bBvb1kfbRtD4+
 TzQTnIRdAdNL0HFg=
X-Received: by 2002:a5d:5915:: with SMTP id v21mr23502384wrd.270.1635167820145; 
 Mon, 25 Oct 2021 06:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqr2JMoT+LHM3Sm5PWib6XV7bp5Xoz/G90LQYi+6jfKsoLIz9pvKIaiDwnQbYFsDlLjTmwNA==
X-Received: by 2002:a5d:5915:: with SMTP id v21mr23502341wrd.270.1635167819947; 
 Mon, 25 Oct 2021 06:16:59 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:bfd4:918:2bfe:a2a5:6abe])
 by smtp.gmail.com with ESMTPSA id p1sm5614806wmq.23.2021.10.25.06.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 06:16:59 -0700 (PDT)
Date: Mon, 25 Oct 2021 09:16:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 5/8] pci: Add pci_for_each_root_bus()
Message-ID: <20211025091435-mutt-send-email-mst@kernel.org>
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-6-peterx@redhat.com>
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

On Thu, Oct 21, 2021 at 06:42:56PM +0800, Peter Xu wrote:
> Add a helper to loop over each root bus of the system, either the default root
> bus or extended buses like pxb-pcie.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  hw/pci/pci.c         | 26 ++++++++++++++++++++++++++
>  include/hw/pci/pci.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 4a84e478ce..1623bc9099 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -2097,6 +2097,32 @@ void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>      }
>  }
>  
> +typedef struct {
> +    pci_bus_fn fn;
> +    void *opaque;
> +} pci_root_bus_args;
> +

coding style violation

> +static int pci_find_root_bus(Object *obj, void *opaque)
> +{
> +    pci_root_bus_args *args = opaque;
> +
> +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> +
> +        if (bus) {
> +            args->fn(bus, args->opaque);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque)
> +{
> +    pci_root_bus_args args = { .fn = fn, .opaque = opaque };
> +
> +    object_child_foreach_recursive(object_get_root(), pci_find_root_bus, &args);
> +}
>  
>  PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn)
>  {


How about adding an API with a type filter to the qom core?
E.g.
object_child_foreach_type_recursive getting a type.


> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index a7e81f04d3..9e490d8969 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                             void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
> +/* Call `fn' for each pci root bus on the system */
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
> -- 
> 2.32.0


