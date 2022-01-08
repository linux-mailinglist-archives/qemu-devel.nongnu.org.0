Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86844880C3
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:57:56 +0100 (CET)
Received: from localhost ([::1]:57890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60zT-0000Gw-Qa
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:57:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Be-0006KH-3v
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bc-0002tE-L7
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=iA4YAe43tnJjWnAHQoS2goKIpTFjo3hEm7iKJSwYRAmiZLyL2xl4/Rla+Ky9haL/3DepLk
 e31Vr9ACr6jhAuRnWvdY/YZbv5HO3RUBgFW4VXitIYwGSNHQSNCQprH+aw8XmlcLzt30m0
 gRPVRph1+9S7kYXlmsTC7ZjofLArCm4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-P1jItX8RNJqz1XgTDP0A5A-1; Fri, 07 Jan 2022 20:06:23 -0500
X-MC-Unique: P1jItX8RNJqz1XgTDP0A5A-1
Received: by mail-wm1-f72.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so4588421wmb.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q1Ji7D0+yweIY9HegKv+oFUY7MUbO+eKtuUlITnwqZ8=;
 b=OSo0jLjZW+zmDYr6fD7j9+J31PFwncKZcH8f9TxP3lvRRfsXTNkbE5ZcZN6mAsfHZI
 Oa1EOr/0XjbrK6KqmmXSEHbblpA0XAO32zA9Z2VQreqcRhZS7o+GNrqNEYdK9tpNyGJh
 K7+tfW23lbT9QBklueW3hy8gmNDqT8W1N8yQBvcaFtd0NVQC5vBzJc4f+JwMMt+C7rla
 Eleepj4+v7SWouFdqPGTik5U6Yy1CBc1Y9ymt+5KxCWsftEuNJ2YkmKb91WkHjVF5fVi
 mxxiA0zQaQsMiQ0QkGTkMKSPEfwEJmu9Wdg6AmK1aOjMQDPkJ+7khIjL2ukuqhaH3IDa
 MBWw==
X-Gm-Message-State: AOAM530ZlkfF3g7Pm8fyqgBPgJUKzfhasydEV6IaIXy1TtTmYNQ7cR/f
 wJ7CN7gK3xobgfhaz0sQfSmDWrE9aZFbSoFaqLdPcrBCpDbkOou4UWb4KPo8f4idegKs3yIK6jQ
 x5Z+Njg0VXHIduwoALqBhxzs7gz1ah2JGwOFfR6jAbY7tQ7jYkh18/u/agMZZ
X-Received: by 2002:a1c:7517:: with SMTP id o23mr11103192wmc.120.1641603981612; 
 Fri, 07 Jan 2022 17:06:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtaXO/E4wsgx4DK1kkmUFC6cQ6LaxhS1yzdEH82dRKlNvMSABVH+SOcWbBtpSKt22eMSgtmg==
X-Received: by 2002:a1c:7517:: with SMTP id o23mr11103177wmc.120.1641603981324; 
 Fri, 07 Jan 2022 17:06:21 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id h4sm213131wrf.93.2022.01.07.17.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:20 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 50/55] hw/scsi/vhost-scsi: don't leak vqs on error
Message-ID: <20220108003423.15830-51-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


