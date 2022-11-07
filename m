Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5709D620343
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxS-00023h-5z; Mon, 07 Nov 2022 17:51:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxH-0001qD-Vo
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxG-000401-Jq
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:50:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=ge7fbI563gq3W/mUOD+1j62ptGOaGzS6DsPUuBpFQMDwRlHvz+ddx2wPrwl3ewNO8HHNkV
 LNzsnUrwwAUWBsnn0k5x/QUhFfIaYkB1+lRiDhT6pu5gNM/RSveWm4/rIsjlPEbW2eXE8T
 X/0C54Hb5z/9S+4z0c90/qxhQ04bgac=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-EIW3vi9LN82XFoHgZmOo4Q-1; Mon, 07 Nov 2022 17:50:56 -0500
X-MC-Unique: EIW3vi9LN82XFoHgZmOo4Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso11495627qkb.23
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u5w7CZvyWmbkUiTzBcO0zP8z+AAuQB0yroUM/lTFU5g=;
 b=NsTf0tIX7sMgKpBGvoR7UBPqjfVFSZgs0PcEtFXeaRrVLzT8sTsUV37VbBIR34tXnR
 pkX5ZTHcFfyjstXUhBhEWyhp08PUYrJ0qcydawp9PQvCZvNsR0ViwhyuteKu9tfU3cCs
 LKMrMrPi5YzaN+xo8UO62vBevtpVwMSvmXhUcOIScOErUL86bpwhKdTeyY/ksDe++yCc
 kEyvoh1pUEGFa8a6ukC8Iiss1L1L0pcMGtPvFEezS0APvFx7TbsgtNH5SbASYZ+WWLM1
 v9kfjbYIWnmBya3yCCv/p9uE2MvzzjI/z7GJrKJJheYIlPK8LOhcZHYDH9hqG6G2nQbC
 TrFQ==
X-Gm-Message-State: ACrzQf3KGiFXkpIf2iNWD3TpDxn/s+h2u6tipCbHSGbOLgCYM/dLxXXA
 E/DSI3ezOEKkvQ28U5RJgjAgrcsSKy66t51ZGcGlxr0CP1LHFcQ7DeTH3Jo9XEl9kqCqha3AJlH
 yblLCSNcLX5NXTo6Q4HFdrRYAwjjWp2OzIHAN41TJ7GKhIzDdg1WRNpNSQZXD
X-Received: by 2002:a05:622a:4ccc:b0:3a5:4070:1f7e with SMTP id
 fa12-20020a05622a4ccc00b003a540701f7emr27454067qtb.472.1667861456090; 
 Mon, 07 Nov 2022 14:50:56 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6qHiWjBwohAJRJeij0IwLTIqq8K7IEx/V7b2gYphtz4Mls+kzngA9isnTIyVaKzPXAwhurAw==
X-Received: by 2002:a05:622a:4ccc:b0:3a5:4070:1f7e with SMTP id
 fa12-20020a05622a4ccc00b003a540701f7emr27454048qtb.472.1667861455800; 
 Mon, 07 Nov 2022 14:50:55 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 fd7-20020a05622a4d0700b0039a372fbaa5sm6917995qtb.69.2022.11.07.14.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:50:55 -0800 (PST)
Date: Mon, 7 Nov 2022 17:50:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v4 41/83] virtio-net: enable vq reset feature
Message-ID: <20221107224600.934080-42-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
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

From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Add virtqueue reset feature for virtio-net

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-Id: <20221017092558.111082-16-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index e68daf51bb..8b32339b76 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -788,6 +788,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     }
 
     if (!get_vhost_net(nc->peer)) {
+        virtio_add_feature(&features, VIRTIO_F_RING_RESET);
         return features;
     }
 
-- 
MST


