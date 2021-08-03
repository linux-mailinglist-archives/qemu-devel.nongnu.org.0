Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAB93DEFDC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:16:46 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvDp-0007TH-4O
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAvAX-0004Yr-CD
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mAvAU-00018r-Qz
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627999995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EgIjOIY8FNXo0f1Emj0ne3weHhYrOSTfxSNgj5D3mi8=;
 b=Ab8w20EOdMShhZqzl43++gMKPdMS4+en+89cYEgiNzDRj3LJEQ4451ouY62RGUWti8pHe6
 nOwxDZ64dVAS7FM5oYc2aVJ0ZJxr9zY+AJD4vqzOGLBdAUWtT/DZrChF/pDM/FR3oz2fYH
 2DFwCP/0AA61INZZrTI4nMLZL4JXmH4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-bOG-XJ4DNuKaqxL-Bbw31Q-1; Tue, 03 Aug 2021 10:13:14 -0400
X-MC-Unique: bOG-XJ4DNuKaqxL-Bbw31Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 l38-20020a05600c1d26b0290259bef426efso758219wms.8
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 07:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EgIjOIY8FNXo0f1Emj0ne3weHhYrOSTfxSNgj5D3mi8=;
 b=MVNtc0Lk4NMEIF7rzD7SI5+BNN5mtwyX4JJUvZk3+EX26Rt5yaMv0bDg5078HVDSmA
 Oa9vrrxJ+xZ0q7GaXLfnLHv/A1fZlvShaiJJMImxoRF8U5eHG2WLBWkaRPanHwC0AeJj
 wqJ7cBYRNhtpsy/MdmEQ/PPOa+YZMKiChjTnIrbAr+igK26iUiERJQOdL2hT/3O0Pj5/
 31CZ8MxZtfhQLUaFV6FUL3dyzU7oFpuUnmpxE407Nca45DYamb7CkiMJ9NZGtLFKzwA3
 hTgfWHBMgV0VeLnT7EjS0Vb8VYy00RcZ7ecs6bvVc0mHXquFY/rjoh5iKAlFMbnAbMra
 ngDg==
X-Gm-Message-State: AOAM533094WHjNCPIQE5nyUVpB5bt0RtpLxtxDlZ10Buq4cbujHvBGk7
 mL7ftj/OxhxczHRh318PtCM1qzWhDP8FV1/2MMOBp407xewDAXfDjTaYezhmTLPC+xDcTcurO0M
 40SpGzxDTkyuh3mQ=
X-Received: by 2002:a5d:420c:: with SMTP id n12mr23545270wrq.58.1627999993351; 
 Tue, 03 Aug 2021 07:13:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdvtLVJrWWjCqq2qUyUyNvKl4qKRmarzSLST48uafH0rsBiBGNXTZLHoxoocNhsMjrKv0kcQ==
X-Received: by 2002:a5d:420c:: with SMTP id n12mr23545242wrq.58.1627999993126; 
 Tue, 03 Aug 2021 07:13:13 -0700 (PDT)
Received: from redhat.com ([2.55.25.136])
 by smtp.gmail.com with ESMTPSA id h25sm2647910wmp.33.2021.08.03.07.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:13:12 -0700 (PDT)
Date: Tue, 3 Aug 2021 10:13:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/ich9: add comment explaining an argument to
 acpi_pcihp_reset call
Message-ID: <20210803100859-mutt-send-email-mst@kernel.org>
References: <20210727044546.246363-1-ani@anisinha.ca>
MIME-Version: 1.0
In-Reply-To: <20210727044546.246363-1-ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 10:15:46AM +0530, Ani Sinha wrote:
> acpi_pcihp_reset() call from ich9/pm_reset() passes an unconditional truth value
> as the second argument. Added a commnet here to explain the reason why the
> argument is being passed unconditionally.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/acpi/ich9.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 778e27b659..b2e3c46075 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -281,6 +281,11 @@ static void pm_reset(void *opaque)
>      pm->smi_en_wmask = ~0;
>  
>      if (pm->use_acpi_hotplug_bridge) {
> +        /*
> +         * PCI Express root buses do not support hot-plug, for
> +         * details see docs/pcie.txt. Hence, the second argument
> +         * is unconditionally true.
> +         */
>          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
>      }


I don't see this comment as especially elluminating, sorry.

>  
> -- 
> 2.25.1


