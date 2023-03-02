Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A826A7C8F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:27:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeFm-0002RS-Nd; Thu, 02 Mar 2023 03:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFP-0002Cc-9c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeFN-0002AC-HI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mr/+lpYnMTtiBjikeXiFvYyM8pHNwpDb7mnocI1lohU=;
 b=Zg52Sq9+P+FkpatUjEjE5cyaris9fkqzGsIIwPyfayvwOruU7MCYY8IT6D9GyuQv1MTH6S
 8dEfb8/Vj1VskYgFtV1doftcnWEgO0jO0i18IYjGp3KjvdCje5A6poiXUz3u9M2Q5meucR
 gJnte8wXVfqGySjmO1WLyBw1qVrcfzc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-IaJ3a3mJOF-fzaQPgPFH8Q-1; Thu, 02 Mar 2023 03:25:03 -0500
X-MC-Unique: IaJ3a3mJOF-fzaQPgPFH8Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 e22-20020a05600c219600b003e000facbb1so913492wme.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745501;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mr/+lpYnMTtiBjikeXiFvYyM8pHNwpDb7mnocI1lohU=;
 b=vD9GyRrNDTlBBTkyYOVYIlE9Da74aX1mnK+9wrUcXOSMKFpNbp1YL1EzazWRH8mV0+
 aLTuGKOuq9YuPSLKm8A4yi+TH6tVW0KO9I2CZUCER9J8vAjSuvmsj6EoH/jg1XDTQ4Pq
 QwuONLQzTxO+1zPes+i27whddKBL9Gkg9IG3ivJIUGWXmjkKJRkqbV9Luf/y0N2r106K
 hSzlO/VBB2dCDEZh1ni3eCub/ruzUfGWqmKt3U5CaxPtTEMMd99jhIemn7v6ipx2FV/I
 lIx58guX3dFqVgtFha/daAr0Zwi7leBrsFzrHLP1oMWCatUrQdD4/wY/YOINF70n5ymA
 P3NQ==
X-Gm-Message-State: AO0yUKUDHGxe4o5u7n2ZGO0ZDOEPshtlVKJTU0vr3x/Ppfqy+eY576dz
 0KKPmsqcWrM2juXq01ZTPCXKQTr4vUDaLdEcb/hnMaeshfnoMkv1aPropSmlk9O9/tYus9y1NBm
 jpO75fcAK7xb/5gKMEoTDeIc+pdNrtHwxOJn5VnmlBqdpGblbG6QeCy7iuvjaME7Oxg==
X-Received: by 2002:a5d:6187:0:b0:2ca:e8c2:6d25 with SMTP id
 j7-20020a5d6187000000b002cae8c26d25mr7521943wru.60.1677745501608; 
 Thu, 02 Mar 2023 00:25:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8g33orueGkXR7A1blpxKt8OE3+2AzWPiAiaDi6jZ/NIg20LEngCKw1/CfcLg62eJ7hjUyc8Q==
X-Received: by 2002:a5d:6187:0:b0:2ca:e8c2:6d25 with SMTP id
 j7-20020a5d6187000000b002cae8c26d25mr7521924wru.60.1677745501360; 
 Thu, 02 Mar 2023 00:25:01 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 h12-20020a05600c314c00b003dfee43863fsm2237031wmo.26.2023.03.02.00.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:25:00 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Dawar@redhat.com, Gautam <gautam.dawar@amd.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 09/53] virtio-net: clear guest_announce feature if no cvq
 backend
Message-ID: <20230302082343.560446-10-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Eugenio Pérez <eperezma@redhat.com>

Since GUEST_ANNOUNCE is emulated the feature bit could be set without
backend support.  This happens in the vDPA case.

However, backend vDPA parent may not have CVQ support.  This causes an
incoherent feature set, and the driver may refuse to start.  This
happens in virtio-net Linux driver.

This may be solved differently in the future.  Qemu is able to emulate a
CVQ just for guest_announce purposes, helping guest to notify the new
location with vDPA devices that does not support it.  However, this is
left as a TODO as it is way more complex to backport.

Tested with vdpa_net_sim, toggling manually VIRTIO_NET_F_CTRL_VQ in the
driver and migrating it with x-svq=on.

Fixes: 980003debddd ("vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in vhost-vdpa")
Reported-by: Dawar, Gautam <gautam.dawar@amd.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230124161159.2182117-1-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Gautam Dawar <gautam.dawar@amd.com>
Tested-by: Gautam Dawar <gautam.dawar@amd.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 hw/net/virtio-net.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..09d5c7a664 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -820,6 +820,21 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1ULL << VIRTIO_NET_F_MTU);
     }
 
+    /*
+     * Since GUEST_ANNOUNCE is emulated the feature bit could be set without
+     * enabled. This happens in the vDPA case.
+     *
+     * Make sure the feature set is not incoherent, as the driver could refuse
+     * to start.
+     *
+     * TODO: QEMU is able to emulate a CVQ just for guest_announce purposes,
+     * helping guest to notify the new location with vDPA devices that does not
+     * support it.
+     */
+    if (!virtio_has_feature(vdev->backend_features, VIRTIO_NET_F_CTRL_VQ)) {
+        virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ANNOUNCE);
+    }
+
     return features;
 }
 
-- 
MST


