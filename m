Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0F65316A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynL-0005Vv-Dm; Wed, 21 Dec 2022 08:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymk-0005Lt-JM
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymi-0004G2-Us
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cx0TIlndDoT8P4nGa11uUR++EVtgkygMRNcFhsFzOiU=;
 b=N6yK7e3zXWUHGmYIubmU2yPf/csN6oYH0phuvSrLYAmHrAcCFkq/FRoQK7hua0NBok2h4p
 9HvnIam/D0uzfOV02YqfI3ILEmEXs3oFRUDuQ9GVmL8Pdyo8fGzziJE71i8nLSi6MxbHN0
 muRmohpXRP+ff8IO4i+IEAXpD9qRIns=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-zapXTNbXP_q9N8QDkP2lIQ-1; Wed, 21 Dec 2022 08:05:23 -0500
X-MC-Unique: zapXTNbXP_q9N8QDkP2lIQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so2881351wra.17
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cx0TIlndDoT8P4nGa11uUR++EVtgkygMRNcFhsFzOiU=;
 b=oLdW9kEazCyV3O73KksCMPWt1PGiznss1qKD3OOu0PP12OzYDXpkkJhJYLnLO/6V/A
 MkkakQoDIQGgWUhSNbUMytBSat+AYbsgWtbsxFr7yM5Ix3RdRdVF0+KjQ/GIeIof1TWX
 kTr2tfZpECGZ5Kn8Uf6ZL0r75P9nVruXIBGwk1SesutX0ZL8STUrs63gdXTvVqPaVEtF
 vrxmw9aHiiVXJOlrJknnSrJPyckthSQO//UizaG5RLW/te7cb+UjXTIcVqYc0yYNsotv
 GwB6a+Jn+MOtVSDAypDCGjcgASINPTBwJuXrzAJ5vODHO2aDJoH9aOpQtxnXKwW/Zbes
 /B+Q==
X-Gm-Message-State: AFqh2koRj03eEk+heQZ4+RrvAixAMrZCR2qQXMdgRw7DCTNFR0+46FZk
 tp9pRu63ABoQTZ4Q01TdfHcAyqgh8sMuJcSPCflKmJ9fDZNiO0mpAEp0iOqfrU3ZfzF7PgRizNQ
 fcxL7+dVM1R70E0SzrJ+E5ptV08InpsS3osqQoF1rndlSJf2EeYED5FsaP5e+
X-Received: by 2002:adf:e2c6:0:b0:26d:f5d2:4efa with SMTP id
 d6-20020adfe2c6000000b0026df5d24efamr383895wrj.21.1671627920832; 
 Wed, 21 Dec 2022 05:05:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5379xcPte/1U46ggMGG37Z/pc7g07t4zURK8AheXr8FeskwiTfUHHSWX61kE1FfjzJMM2jQ==
X-Received: by 2002:adf:e2c6:0:b0:26d:f5d2:4efa with SMTP id
 d6-20020adfe2c6000000b0026df5d24efamr383877wrj.21.1671627920558; 
 Wed, 21 Dec 2022 05:05:20 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bt19-20020a056000081300b002302dc43d77sm15178321wrb.115.2022.12.21.05.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:19 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 16/41] vdpa: add vhost_vdpa_net_valid_svq_features
Message-ID: <20221221130339.1234592-17-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

It will be reused at vdpa device start so let's extract in its own
function.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-6-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 260e474863..2c0ff6d7b0 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -107,6 +107,22 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
     return s->vhost_net;
 }
 
+static bool vhost_vdpa_net_valid_svq_features(uint64_t features, Error **errp)
+{
+    uint64_t invalid_dev_features =
+        features & ~vdpa_svq_device_features &
+        /* Transport are all accepted at this point */
+        ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
+                         VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
+
+    if (invalid_dev_features) {
+        error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
+                   invalid_dev_features);
+    }
+
+    return !invalid_dev_features;
+}
+
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
 {
     uint32_t device_id;
@@ -676,15 +692,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
     if (opts->x_svq) {
         struct vhost_vdpa_iova_range iova_range;
 
-        uint64_t invalid_dev_features =
-            features & ~vdpa_svq_device_features &
-            /* Transport are all accepted at this point */
-            ~MAKE_64BIT_MASK(VIRTIO_TRANSPORT_F_START,
-                             VIRTIO_TRANSPORT_F_END - VIRTIO_TRANSPORT_F_START);
-
-        if (invalid_dev_features) {
-            error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
-                       invalid_dev_features);
+        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
             goto err_svq;
         }
 
-- 
MST


