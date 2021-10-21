Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE5436190
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 14:25:13 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdX8C-0002yx-Ei
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 08:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdX61-0002Ac-4n
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:22:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdX5w-0001n0-BM
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 08:22:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634818970;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M7fZ4sLOfXtyVuJNylgXOqsn+vvrIOUYxDjwbNlfPZE=;
 b=Aa4Cc+BBB9eLOrSQ6Q/nSt3dY+RpuGtUq/W9E1VKXFkjfm1HnbftgDKw/N0FCiYMNtVPQ2
 rSyIWAM+lYwa7u/FiJ8blq9dTpx3+51wHqfRMOllqvTvcJ7v+CFFuctSzYiSYWkwMxiPHJ
 vS03yHogeyjIJb/vU/kDp7b5040QVJs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-875ovHySOGK9GXmLNshuAQ-1; Thu, 21 Oct 2021 08:22:49 -0400
X-MC-Unique: 875ovHySOGK9GXmLNshuAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 v10-20020a1cf70a000000b00318203a6bd1so248958wmh.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 05:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=M7fZ4sLOfXtyVuJNylgXOqsn+vvrIOUYxDjwbNlfPZE=;
 b=ObTikXvnBg26QE9jtwNtcGI3du1y3l5fZaAv0gMP6YtkKlnPAOqZ9NfChz6UEV0v1I
 yLrglUK+grAUPdBW7PGZi7/kqCMygSbDZemiXyz+xn7rfA9ZfggB6w1EADYTDfiFBo+S
 L2hcJbsTWRlF5Xmk23SE6oN0tqKelkvhFu6PnGkuwioTM8ZW0kXYmxMpg1kNqMlPD8FG
 JUf1r7lMywh2I9s7jQGvdxgaZbwRAzwoTHHgvk7DKPErpWuzibYD7laiXughfVut1PCh
 IKYGzBtqxcVo4WQR2osmiHLACKAgX6/rgdlmelVR7+JBnvQZ6Bhp12pD199tvNSS24u+
 t+nw==
X-Gm-Message-State: AOAM531EKYNq/zP/U3JfeB25AvR0omsIlROpChyRR8+Lo7As94lSd8b8
 rFCeCbmrM4zbKxkPnMsnwPrijnlzcgdjm4znE5/bOgFElYPg9EGTB3fRs1s60v3Jts6cbyoLsfz
 6rZoLm3DfUyxY87U=
X-Received: by 2002:a7b:c856:: with SMTP id c22mr6260862wml.178.1634818968284; 
 Thu, 21 Oct 2021 05:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkkM+KWTNqXtbJJ87GaeJ+KV80Cx0qRXyPDrgctbJIVNGyyLMxFED/QvjMM5TZX03g3JC6Lg==
X-Received: by 2002:a7b:c856:: with SMTP id c22mr6260833wml.178.1634818968082; 
 Thu, 21 Oct 2021 05:22:48 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id i9sm499886wmb.22.2021.10.21.05.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 05:22:47 -0700 (PDT)
Subject: Re: [PATCH 5/8] pci: Add pci_for_each_root_bus()
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211021104259.57754-1-peterx@redhat.com>
 <20211021104259.57754-6-peterx@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <92b98c65-5acb-acc2-6968-c9066c54b0b6@redhat.com>
Date: Thu, 21 Oct 2021 14:22:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211021104259.57754-6-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.867, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index a7e81f04d3..9e490d8969 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -474,6 +474,8 @@ void pci_for_each_device_under_bus_reverse(PCIBus *bus,
>                                             void *opaque);
>  void pci_for_each_bus_depth_first(PCIBus *bus, pci_bus_ret_fn begin,
>                                    pci_bus_fn end, void *parent_state);
> +/* Call `fn' for each pci root bus on the system */
nit: @fn ?
> +void pci_for_each_root_bus(pci_bus_fn fn, void *opaque);
>  PCIDevice *pci_get_function_0(PCIDevice *pci_dev);
>  
>  /* Use this wrapper when specific scan order is not required. */
with the  pci_root_bus_args struct type renamed as David suggested
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


