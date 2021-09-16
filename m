Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5840DA58
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:51:14 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqrB-0005QX-5f
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQqlR-0008DH-Ls
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:45:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mQqlQ-00023o-2s
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631796315;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLAO5ENOgWdaDWrFt1uFZvt4Uis2tSuoHxip8axgiGs=;
 b=hyv8C7MrnNKc2DX4oQrNBCOASkR1WEo/Z1L4zmx5gbzXN3BZwGYzI3lbzsKjoPBft3W7O6
 rE51skShrUg6hK5ky7AijgafMhnFoZYnvk5d8sTaEGPWpdvuaZw6wljijMICN+1B614Adt
 oweuV9Eb/3XuO3zAjZSufO66ySQLcnk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-HQPPmEeNMAmf0vvPEBPYJw-1; Thu, 16 Sep 2021 08:45:13 -0400
X-MC-Unique: HQPPmEeNMAmf0vvPEBPYJw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r5-20020adfb1c5000000b0015cddb7216fso2391499wra.3
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LLAO5ENOgWdaDWrFt1uFZvt4Uis2tSuoHxip8axgiGs=;
 b=KpjXH8kTz5uoEtCzu3wwo2sW88GHAhU9usItAE2fbOq6hXjWYJmAkO/kPC5FjZBWXD
 felLVTc53WPaBKuRv16zsVWivVAqCKU5gBdmeCqhDZnAtZxXmTrkHA9Xi1t3JBVsTa+9
 yvWdFYbEfqY0o2+gP5uJPEeYtev7GG7HtRMdi4MJtZN+cZOIf+oj371ONiqDDWh9HzPM
 GoqLGWYW352r2qxl+D2WNqwtpPKfoLSan1XTWbMMU3+8PNVkbIHTt/5Ewg7RkUHxg9X8
 3+dk1NBNTOV0faxETCVBvKk898tan9Db/PyjOfGVwwmSPe/BXdtmHXBw65TqgkCTWIuN
 bXAg==
X-Gm-Message-State: AOAM531H+pZUdOITYNAGW1FlInEh03uc7Z1kVVUzYz8w3yyLS9G/rvKO
 CL5H7vnqjOkD/IgxS7+XnUlHLvwU5n+jqGV6HbLYpnOCUsKz1PsiBkdJn6JfYZH5BrNzsmH8XQE
 H/AvB4N21xQT+bD4=
X-Received: by 2002:adf:b789:: with SMTP id s9mr5863626wre.315.1631796312768; 
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGqABLZILJhMS4W4bdgiHIeI4YfFW6t4M+ct3uIC7FGCpZH0SGFrn+TbXvUOCD3w1D7BPvAA==
X-Received: by 2002:adf:b789:: with SMTP id s9mr5863611wre.315.1631796312639; 
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id q11sm7537382wmc.41.2021.09.16.05.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 05:45:12 -0700 (PDT)
Subject: Re: [PATCH v3 04/10] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
 <20210914142004.2433568-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4f7dd188-ada5-8750-8396-ff294f526c41@redhat.com>
Date: Thu, 16 Sep 2021 14:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914142004.2433568-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,

On 9/14/21 4:19 PM, Jean-Philippe Brucker wrote:
> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
>
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f238766aa1..26069f943a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2471,6 +2471,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
>          PCIDevice *pdev = PCI_DEVICE(dev);
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          vms->iommu = VIRT_IOMMU_VIRTIO;
>          vms->virtio_iommu_bdf = pci_get_bdf(pdev);
>          create_virtio_iommu_dt_bindings(vms);


