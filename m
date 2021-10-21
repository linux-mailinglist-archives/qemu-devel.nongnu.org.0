Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B5436396
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 15:56:57 +0200 (CEST)
Received: from localhost ([::1]:41726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdYYy-0006n7-Nm
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 09:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYWR-0005GR-Vk
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mdYWO-00074t-Vj
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 09:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634824456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhF0SY9PHDqTfFm24g0QML/ciZDfF6UC0iRTlq5Px6o=;
 b=a4PQXCDNxKb2N1NloHr4O87k5w0kqzl7dLuAQpyx3auuCnxFUVlTpdlWQcReue0T33BLVd
 qtuTQInczB4E9tH36e2jW98SGmc38pXumWQ0YG6OHiPjLxvknPhF/ZDIwj3C17MDgBjvB/
 VDIQNtK2GU3H1nX4ARi4UGTallaUoUU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-XER9XXtRMRC5mdK2Mc6OzQ-1; Thu, 21 Oct 2021 09:54:11 -0400
X-MC-Unique: XER9XXtRMRC5mdK2Mc6OzQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 z1-20020a05640235c100b003dcf0fbfbd8so426075edc.6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 06:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RhF0SY9PHDqTfFm24g0QML/ciZDfF6UC0iRTlq5Px6o=;
 b=aKpjmwecPXHA7Ez6awI5P1udFLieahCenCRZ1lJDWF1QI+tjF7Me4M5mUYqPWjag7L
 RDFXz7OIir+CBHRWlIi3CXvgmP0+aq0vI/rB7XKfNQBqo6GThaqcf5p9SxgXZZxbYG4m
 OXLwe2isp5/saJsu+8mp3eLkty79nUPHu6n4+6BFaN1SU7W/khXC8bIMeeCQAt0r/eJv
 9hUX6AdiF8PDJWmbUW7iBzNBIAN+2+qCEwc/QG0Lu0HBmQaPGu8/L1BJWID1dj5bJ0GH
 m1rZtZEXvy2wWVocZHp7u6yLQBaNqSri/msHwbIQ6rz1l6waNGPFGYvmE0u53XTWKHFT
 OPkg==
X-Gm-Message-State: AOAM532r41ZLpyPQSeSzX3YQTkMyDapatmIO9jsMePXSKeExI/5uJOGq
 GPsk57Or0ACAGtsGJ3S5DwSbCpSa6hbUkkGOvpnAaLHLnFGMc7qfm7Fbms76B5ciRwJ7FgkvpsB
 UYdwxwWQIWmhYegg=
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr7632088ejb.256.1634824450468; 
 Thu, 21 Oct 2021 06:54:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzgqXvtig29k66rjYoCDgpJ+DcppTitqiSoRBeEBf/2Bniy/GKSGsRgdKoNNBGmVKWqFqxAg==
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr7632071ejb.256.1634824450319; 
 Thu, 21 Oct 2021 06:54:10 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l23sm2577195ejn.15.2021.10.21.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 06:54:09 -0700 (PDT)
Date: Thu, 21 Oct 2021 15:54:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v5 07/12] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
Message-ID: <20211021155408.43f999ea@redhat.com>
In-Reply-To: <20211020172745.620101-8-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-8-jean-philippe@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Oct 2021 18:27:41 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
> 
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 3da7a86e37..25db8d4262 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2441,6 +2441,11 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>          hwaddr db_start = 0, db_end = 0;
>          char *resv_prop_str;
>  
> +        if (vms->iommu != VIRT_IOMMU_NONE) {
> +            error_setg(errp, "virt machine does not support multiple IOMMUs");
> +            return;
> +        }
> +
>          switch (vms->msi_controller) {
>          case VIRT_MSI_CTRL_NONE:
>              return;


