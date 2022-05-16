Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC8528451
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:40:28 +0200 (CEST)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqa1S-0004Bp-VT
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9j-0002uj-Io
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY9i-0005pg-3o
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UHGGaFTQEvvsEKv7hmkjH6Y6C6gtUrxY2Yx4FiVtqx4=;
 b=XBki13ubVE20aO9ekNFjAWFJrVu6TKXdZoCn0DS/pfr3WgsOPdLqqA/yhdXD9o0hbEtiMj
 ju9UAKtkXxENazojjv2WHcnkVX97v5j9tXMET0dqfQc930HxYxMZEf/rDu+3dAaCfuAYZu
 Z4lP5IWsT1pZL7MnvpnhMouk1uRpblM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-leIANNP_PaymM9WborPhiw-1; Mon, 16 May 2022 06:40:48 -0400
X-MC-Unique: leIANNP_PaymM9WborPhiw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r186-20020a1c2bc3000000b00396fee62505so641742wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UHGGaFTQEvvsEKv7hmkjH6Y6C6gtUrxY2Yx4FiVtqx4=;
 b=k/lkn+WN3deGM93H08Urn/GQ3Gs6ph02Lgp7zht3k857puHjwMe4ADiAaYWiKEdFTF
 xFcoBzXLmSesd2vt+SLNAywob9kK5mwZbTKzVBEnc/E8o1yzOJwqBZONSzVTuc8rREW/
 Q+F5Jb+Fy2rk2U/LGMpO0GPtQwTKKl3UAPy8wJpc1+3+pU/v/sHEnYwpzPKcaZUtB5x0
 1EmI68vAobjyA/UdrxneCtgTpACyQgLCRd3P4cU6+sk38cwyjPxsxk563idKMPBuvVkr
 +U4+sZDuRvVvbBk4mIE6JT1jlwy0fD6f85id1PghUi8qavdtPkr3RFRqd3bzdvS1NHbf
 r1eA==
X-Gm-Message-State: AOAM5319029ji9pwL9O1oMPNYafXZqrVbIkzrEqbUwhm3QjKxqLExnYD
 YuxnXxCuR5rLb9z1WyqEcO7YBArn6PzfKSyOycaQhiiVmtBJzB0Z9abklBxyZfbIwujyK7qIh+4
 SvAy2sML22MvoD5i4+SPkfYlmA3a50YEMvnSF61aoIN7O/7jbtopYXNmYha8d
X-Received: by 2002:a7b:c8c7:0:b0:394:9e02:baa with SMTP id
 f7-20020a7bc8c7000000b003949e020baamr25728082wml.26.1652697647093; 
 Mon, 16 May 2022 03:40:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOlPk4sUxR4WgSgs1aw58hUsDP/X/1TgAZmuwelxFU4ThapP7ybxF3j693yZmRbgK4QqVmvw==
X-Received: by 2002:a7b:c8c7:0:b0:394:9e02:baa with SMTP id
 f7-20020a7bc8c7000000b003949e020baamr25728066wml.26.1652697646873; 
 Mon, 16 May 2022 03:40:46 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 i7-20020adfa507000000b0020d012692dbsm6439866wrb.18.2022.05.16.03.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:40:46 -0700 (PDT)
Date: Mon, 16 May 2022 06:40:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 88/91] vhost-net: fix improper cleanup in vhost_net_start
Message-ID: <20220516095448.507876-89-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Si-Wei Liu <si-wei.liu@oracle.com>

vhost_net_start() missed a corresponding stop_one() upon error from
vhost_set_vring_enable(). While at it, make the error handling for
err_start more robust. No real issue was found due to this though.

Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <1651890498-24478-5-git-send-email-si-wei.liu@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index df0f050548..ccac5b7a64 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -381,6 +381,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
+                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
@@ -390,7 +391,8 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
 
 err_start:
     while (--i >= 0) {
-        peer = qemu_get_peer(ncs , i);
+        peer = qemu_get_peer(ncs, i < data_queue_pairs ?
+                                  i : n->max_queue_pairs);
         vhost_net_stop_one(get_vhost_net(peer), dev);
     }
     e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
-- 
MST


