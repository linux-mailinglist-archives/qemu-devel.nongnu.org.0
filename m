Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2616522B0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:34:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dgW-00024R-5f; Tue, 20 Dec 2022 09:33:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7dgT-00023a-ND
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:33:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7dgM-0000OM-4o
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671546805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=85Z1BTPkUsOlmrpsr7mN4e2fjQHx2yuy26KGVytA66s=;
 b=IDuuZvqEClxV6FSAYijF48Vpsuy7PeaHEEq33AHReHAgMaWVaZ790e0zjW/OYx1SZZGdag
 FHkHktxWMX96Mq6qWMy6XlL/FQBWgDvwgFMc1vPCBQoRuwj2xxPnu4V4SZ1JOxR/kAVLMO
 1KRlxrqiHaxl8m3lWRZjlZq1+irUvDY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-403-75Ta-L6UM1u4TJRVvwKBRQ-1; Tue, 20 Dec 2022 09:33:21 -0500
X-MC-Unique: 75Ta-L6UM1u4TJRVvwKBRQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-410f1a84ed2so143629547b3.15
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85Z1BTPkUsOlmrpsr7mN4e2fjQHx2yuy26KGVytA66s=;
 b=vJlw9UqPMEDES5KNFTb2utmZXsIZPyEJrkv5Xwt9gRlv71+dPlz5LJbKG8LJ/1+Jqo
 dwACTBN8uCXyBgd1TKICYvABjx7DXIkIfXVCYAeVWHfl6wI2v628CGmi6tIOXD0cXgDB
 nVbKrBzf6tygC8oX1KIX0Tx1+F8xZZqSvPs5JnkWlea8Dmix7tfObhjcxfN/VuIRZbst
 DZ1ysYXQqkvSny3wFijz6Nw74RhMJOQW9KfS5Ot0YZAOY5bHhKqS4eQr+tdwCVV8oGk6
 CFmQ/hcqAm+gClqU6bBytamwN1JjvxdQ6zPC8LxGZrkLNhSGsWRtF3mu3hiQ12AldhFT
 f4tw==
X-Gm-Message-State: AFqh2kpXlKexgGOzD2qrTtE7Rowkr0Bp7HHqkzV0ecdJT9wdI4S/Ilh6
 cUZ1mn7jykL72FeJQw05Uqyz0BF31Mrsyo/Nt5Fqn8kl5nCHQVpzBNC/8Tz37yf0EqctxapawU0
 w8gdxN8QZYDVND5U=
X-Received: by 2002:a05:7500:681b:b0:ea:832e:f64b with SMTP id
 hd27-20020a057500681b00b000ea832ef64bmr673405gab.2.1671546800534; 
 Tue, 20 Dec 2022 06:33:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZbf73RTnE9/oFYNwCihc1Zx9qqx2v8I4bIETdWOUqmPYtQNm2V1zaxib94nvhqKS5GSZwLA==
X-Received: by 2002:a05:7500:681b:b0:ea:832e:f64b with SMTP id
 hd27-20020a057500681b00b000ea832ef64bmr673394gab.2.1671546800113; 
 Tue, 20 Dec 2022 06:33:20 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05620a454c00b006fb112f512csm9216606qkp.74.2022.12.20.06.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:33:19 -0800 (PST)
Date: Tue, 20 Dec 2022 09:33:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v12 0/1] vhost-vdpa: add support for vIOMMU
Message-ID: <20221220093253-mutt-send-email-mst@kernel.org>
References: <20221209130805.3614970-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209130805.3614970-1-lulu@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 09, 2022 at 09:08:04PM +0800, Cindy Lu wrote:
> These patches are to support vIOMMU in vdpa device
> Verified in vp_vdpa/vdpa_sim_net driverand intel_iommu
> virtio-iommu device

Pls address comments and repost.

> changes in V3
> 1. Move function vfio_get_xlat_addr to memory.c
> 2. Use the existing memory listener, while the MR is
> iommu MR then call the function iommu_region_add/
> iommu_region_del
> 
> changes in V4
> 1.make the comments in vfio_get_xlat_addr more general
> 
> changes in V5
> 1. Address the comments in the last version
> 2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
> the memory is backed by a discard manager. So the device can have its
> own warning.
> 
> changes in V6
> move the error_report for the unpopulated discard back to
> memeory_get_xlat_addr
> 
> changes in V7
> organize the error massage to avoid the duplicate information
> 
> changes in V8
> Organize the code follow the comments in the last version
> 
> changes in V9
> Organize the code follow the comments
> 
> changes in V10
> Address the comments
> 
> changes in V11
> Address the comments
> fix the crash found in test
> 
> changes in V12
> Address the comments, squash patch 1 into the next patch
> improve the code style issue
> 
> Cindy Lu (1):
>   vhost-vdpa: add support for vIOMMU
> 
>  hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++---
>  include/hw/virtio/vhost-vdpa.h |  10 ++
>  2 files changed, 161 insertions(+), 11 deletions(-)
> 
> -- 
> 2.34.3


