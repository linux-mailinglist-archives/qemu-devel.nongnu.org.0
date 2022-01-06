Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC114865CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:07:02 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TPx-0002nN-LX
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfJ-0006CY-Gh
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfH-00016o-RB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=Yq8DksF0lLG6uDeRGqAbDBLZigpMSpRw06p20HgizEWES0m2q5sEt9xmdV/7nj1Tfb3Ope
 yhf25xiIwxysiRlSRwUd4YT9XUsMQ6z02Z3RypC/XqHruP25FWpBEJPq3RHgQN7fOCQG5R
 tieY0T1ahDRT2nJEQhMk328PkhD9gaE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-6DLZ0N5mMlCXpVxo72tfiQ-1; Thu, 06 Jan 2022 08:18:46 -0500
X-MC-Unique: 6DLZ0N5mMlCXpVxo72tfiQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 t1-20020a056402524100b003f8500f6e35so1942650edd.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=Xq7KM5sB1lS04KDAo/RPM00p5IJf9khD1xt/OVHP5NgCTqnov4B5eSmzmA51lArAR/
 9XDh65VH+bVaSTRm6mZNO97O7BQhdJCAVvkSc6nuhykP6I9p6npfOfdmO/zxd+xj0oez
 O9AE0C6F8wHoHRT/SY76XvMgvw3cblx0K/H5j6vg2pSm/wQheCR48dnh3nH2n+jREUXm
 WnvdTsJGd4OYEmPpbXo/q2VBKTJMlpwCNJmhCdTs7QFD6jxz/rUKS22pTiLML4RMYv2r
 5cNmOGhEyfzuaz+Q2H27mo5P6NiHITBHe0hHIzFA6P+1xeySu4AKOULUR7/wUNyQOOlE
 eqZA==
X-Gm-Message-State: AOAM531ot7l7BTs/ZC0mHF5Ct8ouAf07MXllWjRqmvH1rE8WvkPkZ0be
 nrg8y/OW0UC2F6bGwAHflsSJUItZ4YedQN/FgUYrovlJkdM2OSpi0BTriGifpFB+teBRXuC8mxJ
 mgtswy/wnxmQwW2ZVYS2h7+CxMt8Ddk3lgOdFqzckUjJ5EHxWn3dcCmH8h31a
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr58865620edc.326.1641475124847; 
 Thu, 06 Jan 2022 05:18:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcKym7+U8HQPvOOeLrkMNfjmnVEqJ45KWASMV9GoRn4qZbFP/p8y0CGFvYFeDMsUOQaT4IuQ==
X-Received: by 2002:a05:6402:4313:: with SMTP id
 m19mr58865594edc.326.1641475124674; 
 Thu, 06 Jan 2022 05:18:44 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id gt7sm485315ejc.180.2022.01.06.05.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:44 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 50/52] hw/scsi/vhost-scsi: don't leak vqs on error
Message-ID: <20220106131534.423671-51-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

vhost_dev_init calls vhost_dev_cleanup in case of an error during
initialization, which zeroes out the entire vsc->dev as well as the
vsc->dev.vqs pointer. This prevents us from properly freeing it in free_vqs.
Keep a local copy of the pointer so we can free it later.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20211129132358.1110372-1-d-tatianin@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/scsi/vhost-scsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/vhost-scsi.c b/hw/scsi/vhost-scsi.c
index 039caf2614..efb3e14d9e 100644
--- a/hw/scsi/vhost-scsi.c
+++ b/hw/scsi/vhost-scsi.c
@@ -170,6 +170,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     int vhostfd = -1;
     int ret;
+    struct vhost_virtqueue *vqs = NULL;
 
     if (!vs->conf.wwpn) {
         error_setg(errp, "vhost-scsi: missing wwpn");
@@ -213,7 +214,8 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     }
 
     vsc->dev.nvqs = VHOST_SCSI_VQ_NUM_FIXED + vs->conf.num_queues;
-    vsc->dev.vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vqs = g_new0(struct vhost_virtqueue, vsc->dev.nvqs);
+    vsc->dev.vqs = vqs;
     vsc->dev.vq_index = 0;
     vsc->dev.backend_features = 0;
 
@@ -232,7 +234,7 @@ static void vhost_scsi_realize(DeviceState *dev, Error **errp)
     return;
 
  free_vqs:
-    g_free(vsc->dev.vqs);
+    g_free(vqs);
     if (!vsc->migratable) {
         migrate_del_blocker(vsc->migration_blocker);
     }
-- 
MST


