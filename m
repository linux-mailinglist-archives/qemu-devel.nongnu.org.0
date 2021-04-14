Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F77835F07E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:13:03 +0200 (CEST)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWba2-0004PI-9Z
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWbW1-0002b7-KH
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lWbVu-0007kO-6A
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618391324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6co/mOEsCfc/OZ/zwpClTmcjFCwF+L5FaxQ9fZhglE=;
 b=USWF01Q19hlrOHgD9hNxBlAFUHmqpwd8fNnvQuKBxMJCiweH9j0Zhr9Mdi5TpnzRprsO7L
 koMeXReEaNEZGflmWFBPg9/yB/sunSruePacOYNp56kZgO7C8Z9dxc1db5LEQyPNB0j30u
 6SLc5pAXKiW0gO7c3IDMhtkJR5DRm7Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-wx0gVP8yOJ6RAK-I5vG4wg-1; Wed, 14 Apr 2021 05:08:42 -0400
X-MC-Unique: wx0gVP8yOJ6RAK-I5vG4wg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c5-20020aa7d6050000b02903825f4da4f3so2948864edr.16
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 02:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l6co/mOEsCfc/OZ/zwpClTmcjFCwF+L5FaxQ9fZhglE=;
 b=YyE5iEPYSqk6V8thxnEdUJFB+VITrtEcXQ7hGxkhrZHJ4arKS1X875zcsvBY/0HWzw
 5FQMG7fraV1Y6kViof5L7gCOAo+ysODRshWE+86pAnUD5h+WqC9ll8z6Dn5YsZ783hXS
 GvOwMt+U0yEJ40PrB/YabQyUD2BxPjKdE72A8MTYTwOkmAqpr4k+ntKvKJGoqrrW4MfQ
 P+YYCkWikPI9obyi21uPrNDJ/NKfyNdx+l7EjEQNHsgYcJYVV84yRwb8ibRjtXGou1P4
 ovppSd14SBpqnr6KI+vKqUvKwXBIuWh2emzE85zL/rpO1Kb2Ra/3NuZMTMwD/oM03QQu
 SAoQ==
X-Gm-Message-State: AOAM530fy0MJORK+oEQu0H6adRBVcZQKhPY85Jb2BuSuZMmTOud5GpsB
 73pzDXreSPYw9cYvvbnoupIW1gLXiB+DteZv3r3pQjQ/zwV1oZaVoGqTkWKwj85j+wxa9IB+Rpr
 NIf010dA1M4Paon0=
X-Received: by 2002:a17:906:c82c:: with SMTP id
 dd12mr13206738ejb.132.1618391321315; 
 Wed, 14 Apr 2021 02:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFsH5pzOUvJ7x/Gddp1P8obBeywO4EetrRmORDn1Z4johtZAYwiNhDlJfYH+mvD0yfO63Vuw==
X-Received: by 2002:a17:906:c82c:: with SMTP id
 dd12mr13206721ejb.132.1618391321107; 
 Wed, 14 Apr 2021 02:08:41 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id a9sm11241771eds.33.2021.04.14.02.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:08:40 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:08:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] vhost-vdpa: Make vhost_vdpa_get_device_id() static
Message-ID: <20210414090838.e6eigueynejjzc4d@steredhat>
References: <20210413133737.1574-1-yuzenghui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413133737.1574-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: wanghaibin.wang@huawei.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 09:37:37PM +0800, Zenghui Yu wrote:
>As it's only used inside hw/virtio/vhost-vdpa.c.
>
>Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
>---
> hw/virtio/vhost-vdpa.c         | 4 ++--
> include/hw/virtio/vhost-vdpa.h | 2 --
> 2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>index 01d2101d09..8f2fb9f10b 100644
>--- a/hw/virtio/vhost-vdpa.c
>+++ b/hw/virtio/vhost-vdpa.c
>@@ -371,8 +371,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>     return 0;
> }
>
>-int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>-                                   uint32_t *device_id)
>+static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>+                                    uint32_t *device_id)
> {
>     int ret;
>     ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_DEVICE_ID, device_id);
>diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
>index 9b81a409da..28ca65018e 100644
>--- a/include/hw/virtio/vhost-vdpa.h
>+++ b/include/hw/virtio/vhost-vdpa.h
>@@ -22,6 +22,4 @@ typedef struct vhost_vdpa {
> } VhostVDPA;
>
> extern AddressSpace address_space_memory;
>-extern int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>-                                   uint32_t *device_id);
> #endif
>-- 
>2.19.1
>
>


