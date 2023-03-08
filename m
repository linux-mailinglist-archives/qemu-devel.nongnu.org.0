Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702876AFC0B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:17:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiM2-00032Y-Dr; Tue, 07 Mar 2023 20:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLh-0002rU-TI
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiLg-0001bz-24
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iCSOV5r/QWCCL26j+7uWnJ/RqfqYZ3ThBkhFOMSpoLM=;
 b=VP7WHNFTBXMfHRpdyZ8GYTJIYNHTP20ojkWfCkYPpvhsVtVJpUxyUFKLX1K+y+OYCcCGNm
 mGMDBUsWGaEYG+Wdehniwgqln+IdXFKXHl7QQqg8GPgvfLrwPUkE/tzZ05mprtJqWynYGS
 KOFpoKuzVngRoUKf+1rxJ825nr21DNQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-ZpIh-secNoq3KAYPp-IjCA-1; Tue, 07 Mar 2023 20:12:06 -0500
X-MC-Unique: ZpIh-secNoq3KAYPp-IjCA-1
Received: by mail-ed1-f70.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso21715196edh.15
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237924;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iCSOV5r/QWCCL26j+7uWnJ/RqfqYZ3ThBkhFOMSpoLM=;
 b=Zuzpw9P19KP1a4/BsSQkqayvlxpaw8vHzVsoASILLj5QID+R5QYDLoeg7eNz8aM7Mz
 1MCXlDH2eals556TUuy4sleHxmV5gRe9C/yF0t/oL+LPouokH1EtR/0tHUJKvFe4vzJd
 Kx6Dd/oJ6Neh8ylk5vxKBzPQDLbh14/E77DxN5Nj3/g9K02tRy6ziBQMAjHlExkGLIsO
 y07q18rPpHyC2gXO/Q+Fk2Na1Pd0zT4z+4yW8379bF3b6ZbxYXmdHRTDkyyxvYtDe6Tf
 WN+3bs4XCa8WtpYq35rFQmYe83YRm5nJ0UgbVwAAQXHI3QESlhL2oue/Eha6p7oH4jv7
 fXRw==
X-Gm-Message-State: AO0yUKUHH6ankmeMrJtMjbsU3toNEW7Q168G9DAuCrhpkqAl8PIUMoFt
 95zYO/99lD/Xuehz8of17X3AaTw/mhoPNwPHmz2/nk8vlXp/0D2iTZIjViO3J/uOrOooWl0gRjP
 5hXaPCEdBfPDbk6M4WnnI/eUtY/j0HD8eOUO+DMtnB69N4lEUFnjg66KaydkKplluTSmE
X-Received: by 2002:a17:907:7daa:b0:8b1:30da:b586 with SMTP id
 oz42-20020a1709077daa00b008b130dab586mr19899571ejc.49.1678237924420; 
 Tue, 07 Mar 2023 17:12:04 -0800 (PST)
X-Google-Smtp-Source: AK7set9x5AnyRSL4lcDOzqWKdrnnfjKLP2Egq8CzYPhd6pPcPG+A+0cYnc8fmAbOIb2HdE78kVlQJw==
X-Received: by 2002:a17:907:7daa:b0:8b1:30da:b586 with SMTP id
 oz42-20020a1709077daa00b008b130dab586mr19899548ejc.49.1678237924093; 
 Tue, 07 Mar 2023 17:12:04 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 v5-20020a1709063bc500b008c327bef167sm6746961ejf.7.2023.03.07.17.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:03 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>
Subject: [PULL 24/73] vdpa: block migration if SVQ does not admit a feature
Message-ID: <57ac831865e370012496fb581a38d261cb72c5d0.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

Next patches enable devices to be migrated even if vdpa netdev has not
been started with x-svq. However, not all devices are migratable, so we
need to block migration if we detect that.

Block migration if we detect the device expose a feature SVQ does not
know how to work with.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20230303172445.1089785-13-eperezma@redhat.com>
Tested-by: Lei Yang <leiyang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index e9167977d5..48ffb67a34 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -443,6 +443,21 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
         return 0;
     }
 
+    /*
+     * If dev->shadow_vqs_enabled at initialization that means the device has
+     * been started with x-svq=on, so don't block migration
+     */
+    if (dev->migration_blocker == NULL && !v->shadow_vqs_enabled) {
+        /* We don't have dev->features yet */
+        uint64_t features;
+        ret = vhost_vdpa_get_dev_features(dev, &features);
+        if (unlikely(ret)) {
+            error_setg_errno(errp, -ret, "Could not get device features");
+            return ret;
+        }
+        vhost_svq_valid_features(features, &dev->migration_blocker);
+    }
+
     /*
      * Similar to VFIO, we end up pinning all guest memory and have to
      * disable discarding of RAM.
-- 
MST


