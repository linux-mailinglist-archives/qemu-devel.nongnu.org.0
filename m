Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7616F401D07
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 16:32:59 +0200 (CEST)
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNFgA-0007j6-Ip
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 10:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFcQ-0003gk-Lk
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:29:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mNFcP-0006hH-3p
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 10:29:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630938544;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdAJhWc1ZkuHYWytK95knAAaKg7XwLD9shbQFRWo1EQ=;
 b=V8se8Gz2Vn8/QvK8IFJEARtF/D3hJyidE6ETkdgbHL82BuNRoVVpRcZlb9SHgkt4meSrVr
 P57q99HMAY7fbt+7mHR5qHizSkj3vwdIyeOn6CNJezRX1QKUJZQFr7Ox/8oYwZSE1nqL/q
 TsM582taPSt9Yqna3SFUMPAlHYnJTQY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-U3AbtYb5MWOV5l1g9q0Zjg-1; Mon, 06 Sep 2021 10:29:01 -0400
X-MC-Unique: U3AbtYb5MWOV5l1g9q0Zjg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so2400642wmj.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 07:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MdAJhWc1ZkuHYWytK95knAAaKg7XwLD9shbQFRWo1EQ=;
 b=lEPTH6z8PK+/F/xVwh8Pq3LxENeHyQeGobm7QHuzE4+e5sqtIwd2RaZ6hxY3lC1N/r
 5NOWSY4Qrqe0JuC0sLs92HbEtFbn7lHR3hH/5vV5AAZfdRgaNmIoTYwpKjG6JS7v+3f+
 Of4D7R0J7f6FBoprh7+5qQv95UGNFNMDw654+9VfCz+BlBwaY4JcaZjzuwclSWy1Iy9W
 lD/OOHw9jjiJF5kC5bDA6dM/SnbXmm9UHlH58d7uYCakFl4eLT0j0tZ4yjMfvteWGHMT
 8tvRATYQ+6n/6X2H4RiQE+s9zSmLeogyhGADmiJZGCCG/ISQAgGiui07wME4A+gkJv7w
 prpw==
X-Gm-Message-State: AOAM531zPWHP6MFvwrQZOx7V81LhyEOsru+Jf141KGbqOghZRQP6touF
 87O61fwjPlbtHLoaTyPVvxEpW7zVvEOYBZ1j3k4dAAhfT1GCtgkM21EXnA/KjUH8Ih1CwHhafNj
 Agqf4UY/7oWAOzjM=
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr12022534wmm.55.1630938539970; 
 Mon, 06 Sep 2021 07:28:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ9A+O74VWiXWkWV/WhylijIkGtOJH6tTpr1nT7rlvyCibQwSvRgAlf99xIH922o6Q6jGNng==
X-Received: by 2002:a05:600c:4152:: with SMTP id
 h18mr12022519wmm.55.1630938539768; 
 Mon, 06 Sep 2021 07:28:59 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id c9sm8036245wrf.77.2021.09.06.07.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 07:28:59 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-6-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <d209ec52-775e-bf25-fc00-5d9aeb2d65ef@redhat.com>
Date: Mon, 6 Sep 2021 16:28:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210903143208.2434284-6-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jean,
On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

You may add
Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
as the problem already exists with dt.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b4598d3fe6..5ca225291f 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2475,6 +2475,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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


