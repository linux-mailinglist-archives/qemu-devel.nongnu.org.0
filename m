Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8642382E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 08:37:24 +0200 (CEST)
Received: from localhost ([::1]:47648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY0YN-0006Oj-Bk
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 02:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0WL-00058h-Mq
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:35:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY0WH-0002Ze-8n
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633502107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=86qsO2U3rknZWIAdtZEjnGQ+SFzyDz2O3N/nqARV2BI=;
 b=VPd9M6F2BKbhS/XJum/0QCoB8Osk4EgRKxn3eB4at9d67YNyZNvpe3BlwJ/9Dlj2AwId9o
 /Kcm66WXE4h51Go0cXdUXO3uU4JNCYeHHoBmCGNN4Vquu3BuGw+rHL1F2rKZHC/XJnGLge
 txiRKBVi+0hbaCzmnqHRPFiDbDTyYH4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-baNlP4A1MX2d0fGMfblhgA-1; Wed, 06 Oct 2021 02:35:06 -0400
X-MC-Unique: baNlP4A1MX2d0fGMfblhgA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso1164304wrg.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 23:35:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86qsO2U3rknZWIAdtZEjnGQ+SFzyDz2O3N/nqARV2BI=;
 b=JuYsHn4mYQElHnoypuI94Kk6fmX/Hrcmo1aa/60UtvxF7fYofVGHPRnmSVDZN59w8a
 xf1GwmpL/Vy5YbF1TSo6vNN5Cp53MHFimPymAVtzznaDuVcRq+IfUyb8cGQdh5CSlI34
 TSdlXanLJi1GMbeI7QcXokoTcNiQORsbMlZA0sJNrTE0EtsGcfy66rUZGecmjqtZrauT
 tzvbapva7KpThnRC/uGWA7b8qmeJWaQ8eUTj/pEMfXCEqLppDGnvb3C/F0e1WPz6KQ7z
 KN5cUn6u5E4FO2RtPD8peAKP7I7RnZIM3eAKXW08bCqDJ9TUFIQE8U0+D717BW6HPQey
 MztA==
X-Gm-Message-State: AOAM532nBb0lFrqhGT+s+RJoIXszCRJvBGNc5ux3mczfvaBTQCMT2i3t
 RKaBzHMfe1ViAyGH3yo9K81Ia7xO5CnDWk/LheYhu/76ya22Xq4ZaKWMDQNnu+wBfUtwZG+dYp4
 CL2MUAIU7Drlv/uc=
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8174225wmb.136.1633502105194; 
 Tue, 05 Oct 2021 23:35:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxD+6GhR0602EdLgoRnv76Bc5hLC6IR206ASvvjrCfjSUAlcox1VelBIDFwZYoyZG93myHOdQ==
X-Received: by 2002:a1c:c906:: with SMTP id f6mr8174198wmb.136.1633502104997; 
 Tue, 05 Oct 2021 23:35:04 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id a17sm4056648wmj.48.2021.10.05.23.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 23:35:04 -0700 (PDT)
Date: Wed, 6 Oct 2021 08:35:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v4 04/11] hw/arm/virt: Reject instantiation of multiple
 IOMMUs
Message-ID: <20211006083503.758d7d6a@redhat.com>
In-Reply-To: <20211001173358.863017-5-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-5-jean-philippe@linaro.org>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  1 Oct 2021 18:33:52 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> We do not support instantiating multiple IOMMUs. Before adding a
> virtio-iommu, check that no other IOMMU is present. This will detect
> both "iommu=smmuv3" machine parameter and another virtio-iommu instance.
> 
> Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56e8fc7059..36f0261ef4 100644
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


