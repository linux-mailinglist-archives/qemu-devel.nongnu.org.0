Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB9F432EAD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 08:54:50 +0200 (CEST)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcj1N-0005rY-57
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 02:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciyw-0003ji-EH
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:52:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mciyu-0005au-NL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 02:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634626335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XuQHXmL6R1pi0a1t4ZiQyR3jrT50fLlEOPbfg5NPHrU=;
 b=MteubiAvKgTwlSEBXa4sgOJY0c/I0AfvxkttbuB4rKRW75FzJpO6dLRNyhFYjXnQpJMHml
 aIalbGHhos8oxfkugAJmlZZHfxtxpysXMp9BxB8msmLEIVWohC2HIym8pS6LplFzjK4qDL
 /MkiuQHt/TIxhim1PqxiNhP0cDKWjvM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-Q7EGHYbJNXqCVSU91dJhAA-1; Tue, 19 Oct 2021 02:52:12 -0400
X-MC-Unique: Q7EGHYbJNXqCVSU91dJhAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 d16-20020a1c1d10000000b0030d738feddfso777525wmd.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 23:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XuQHXmL6R1pi0a1t4ZiQyR3jrT50fLlEOPbfg5NPHrU=;
 b=UMSPPH/J80R+FJeQjWn4u/J6dhkONBA656TuV9NNpjYaKBdNXJyzXZC55yZv5KcotI
 ZKIG1oRNBAXP4y0ZuHW5jXmxav0YYlC1vG4YAFhH9M1AWHLcqeKsw5HrW+Iqzdbobmcx
 Tu0SuyUMcS5RSdcWs3vXnDV7T0UnNvfTa2ycGKFw/2NqHwWshHbcvJ4wY3ikW3imuplk
 uXa/LEpw4Gdnn/oGDrkHCLi4LcqbOmWDC0tyQ95qQEIEaZ+T/cgCETg25yOBkenzbvs+
 rg554lJDutuT5E8tIHmeWdcbeC5fmuQ6fg5aFzr3mH8q/bzvcTeRPjii8mz1L/+dJniv
 5u7g==
X-Gm-Message-State: AOAM531RlnLarALs+C1ghrNcOsG4msAFu6Z0eRK2c6LwINyOszQlKyNe
 fk3bV1Gd0ud0aupFGUIt1axdCNE2wAvE2xMI9gSbxXghE0zRW6RL3eLEyuPLfQBBCSB0tEj652S
 BHQQmP/Wv/asQ2Po=
X-Received: by 2002:a05:600c:209:: with SMTP id 9mr4048223wmi.42.1634626330850; 
 Mon, 18 Oct 2021 23:52:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweSlXkewz4jv/U3MuZIaPtSYdNNusEAiFRutjRMRMk2sH/Y6lyd9a1jso0P2FjBLrZBNR8uw==
X-Received: by 2002:a05:600c:209:: with SMTP id 9mr4048210wmi.42.1634626330686; 
 Mon, 18 Oct 2021 23:52:10 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id a2sm16554155wrq.9.2021.10.18.23.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:52:10 -0700 (PDT)
Date: Tue, 19 Oct 2021 02:52:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Subject: Re: [PATCH v9 04/10] vhost: add new call back function for config
 interrupt
Message-ID: <20211019025041-mutt-send-email-mst@kernel.org>
References: <20210930023348.17770-1-lulu@redhat.com>
 <20210930023348.17770-5-lulu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930023348.17770-5-lulu@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: jasowang@redhat.com, dgilbert@redhat.com, qemu-devel@nongnu.org,
 arei.gonglei@huawei.com, kraxel@redhat.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 10:33:42AM +0800, Cindy Lu wrote:
> To support the config interrupt, we need to
> add a new call back function for config interrupt.
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Pls make commit log more informative.
Doing what? Called back when?


> ---
>  include/hw/virtio/vhost-backend.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 8475c5a29d..e732d2e702 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -126,6 +126,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
>  
>  typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
>  
> +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> +                                       int fd);
>  typedef struct VhostOps {
>      VhostBackendType backend_type;
>      vhost_backend_init vhost_backend_init;
> @@ -171,6 +173,7 @@ typedef struct VhostOps {
>      vhost_vq_get_addr_op  vhost_vq_get_addr;
>      vhost_get_device_id_op vhost_get_device_id;
>      vhost_force_iommu_op vhost_force_iommu;
> +    vhost_set_config_call_op vhost_set_config_call;
>  } VhostOps;
>  
>  extern const VhostOps user_ops;
> -- 
> 2.21.3


