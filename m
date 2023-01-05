Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C8D65E7CB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKX-0001Lh-Iq; Thu, 05 Jan 2023 04:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKV-0001LY-Ag
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKT-0006ll-ST
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lRRvIgKN38K8nw+7jCTXmfyKQPQYxZVIReBQhF7dhhU=;
 b=bOCQX54oS/kKy6jbObluOu39h+SmtAzLZ+WoFxGD1iBk9tRP4YLXF/mWV9cE10byfAaXhk
 PaZJJNc6f1XhdifVumgRF10WEVg7TfFaNcEjt8iCN+b/CRr0WYRVlngmogvd2jHlot2DUe
 Qp5ADzqS21Nd8l6osoLUcL2NEBwQG10=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-3gW-T0TGOVOFxfhA6D0EFg-1; Thu, 05 Jan 2023 04:14:27 -0500
X-MC-Unique: 3gW-T0TGOVOFxfhA6D0EFg-1
Received: by mail-wr1-f71.google.com with SMTP id
 n13-20020adfc60d000000b0029bdfcf52eeso1710790wrg.8
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lRRvIgKN38K8nw+7jCTXmfyKQPQYxZVIReBQhF7dhhU=;
 b=3GCWYvgYLX5sL78chAZejhCEH1LDCsc83X1wkQO+cNE3o5KM1wVKcaRxr7RX9h1XWf
 2qumqg9v5aIBelon0ds63ioiBHj+uwvElljA0WIOJ68GUMGlw2i3EWrJ+S/eu1bcZYP3
 XTTXxW/RdkDeKJBjo8juI5u2eBto6Zd+EcsRDf6z/hUOhCUC2EUF2ioxzSt+81KQMA9+
 q0mKr3DX3FYDYhPhUW5U6S4ZVJ49v/kBtQrCvnKQAofh4PWPslTGwk4l226qE62YP2vs
 A7/UA1hP7gWyIvf3ktiNuk6Mpco6NaiKn3L1r/CxfL46qr6hCwqrkx0BPseG96aGJ+0i
 thKQ==
X-Gm-Message-State: AFqh2krruPJQaSdWPd/K8fd5PKjh+D7YKs1o4kGAiGlbYnCOZQu89Hrv
 lesSkG8IZrc7JzRzMGkL5AMk6YOD6H1OR3eW2DMMranjrvmsUEeYzCzRxoRLCUXyGtb0Tj/ohiB
 9L1K+9Xlb7iUP35dGaL/5GGdt80H2yO1EkoPTGVWOOj7RTNARJkPdXd6OUoM5
X-Received: by 2002:a05:600c:5113:b0:3d3:5c21:dd99 with SMTP id
 o19-20020a05600c511300b003d35c21dd99mr35134917wms.18.1672910066246; 
 Thu, 05 Jan 2023 01:14:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv80jdKk1f4Gw4M7n+xr+3wysb+3OHc2s5mJRGPXJcoTOv1/SefTkqkP6Wp+235Oq0KNqtWRg==
X-Received: by 2002:a05:600c:5113:b0:3d3:5c21:dd99 with SMTP id
 o19-20020a05600c511300b003d35c21dd99mr35134900wms.18.1672910065987; 
 Thu, 05 Jan 2023 01:14:25 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 r126-20020a1c2b84000000b003d35c845cbbsm1632027wmr.21.2023.01.05.01.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:25 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/51] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model
 has it
Message-ID: <20230105091310.263867-3-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Status part of the emulated feature. It will follow device model, so we
must copy it as long as NIC device model has it set.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20221221115015.1400889-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/virtio-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b30038d130..122eac25ee 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -183,6 +183,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
             memcpy(netcfg.mac, n->mac, ETH_ALEN);
         }
 
+        netcfg.status |= virtio_tswap16(vdev,
+                                        n->status & VIRTIO_NET_S_ANNOUNCE);
         memcpy(config, &netcfg, n->config_size);
     }
 }
-- 
MST


