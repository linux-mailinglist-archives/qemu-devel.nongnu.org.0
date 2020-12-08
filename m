Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A486B2D32C3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:43:39 +0100 (CET)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmite-0003xx-LT
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:43:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikb-00052L-No
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikU-0004jS-S9
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcDsWwFf1VSLW/JLtS3fVtqy9UgBR89UFwruerLljvk=;
 b=gelANe75yxtCkefr3Zt2jZrgq1n4bn/aW9IxszbnbjnaZST3kDEJlYDh7SC4GXinA3xej/
 yBbEapZibTTjh9Uqe3egk3jc+ugLnnqqGScGVMJMCf8NwryJXWMYNAC51is+1PTtPQegZJ
 oyqoNVfVVEDr3gQarV7fbPXsSrFPRMQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-dt9Ps8a6PkCQHwzHoIh_Mw-1; Tue, 08 Dec 2020 14:34:04 -0500
X-MC-Unique: dt9Ps8a6PkCQHwzHoIh_Mw-1
Received: by mail-wr1-f70.google.com with SMTP id r11so4693345wrs.23
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bcDsWwFf1VSLW/JLtS3fVtqy9UgBR89UFwruerLljvk=;
 b=psDt8BH703XvAQuuGuhi0sf2qXaa0Llb8iQPSQxlN6wjgMb4uOkB7m2vUlQUpDspYh
 Aw6gEkDt31PPsbh9qrB0ZkahF4fHkYkNv9TDTVQPP9X/yx8dib5gcoktoFS39dGRd2De
 CqIB538sBSpVtfCooJW8ViKBlqjRjob/O5mZJih9wWAbikX2Lt6GHJIspuOIyStF7jmt
 9s6Ev293LOQc+T7nQeommnvD41INMspoT4mtadQyVI19a88feJrsBwQFobSOl8BvZ0P9
 w/8mJxPF2HaMDeQ6zotR7C9tVKqkSJZ8WZ4ERRLKQuXZ8LM5ATm+bGHKEjweX6ezerD+
 rRKw==
X-Gm-Message-State: AOAM530pW28QO1yj768aMYeMCfGcFCmf36wZGGPgy25Byrf2DPe9fMus
 /VpgbsepflIKsC7cbX85c8AUKnUg6rudCujrwQ5l0kGsdE++8FhFtFvlSmGWTgzNr/Wi7TYR07t
 2X2fb3IKH7ze03T6B4HiIrpODTx9UNT8tdpdOB7wE7waaMw0sEWxORT4bdX8f
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr5110817wmg.145.1607456043039; 
 Tue, 08 Dec 2020 11:34:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC1UWeAh12Gc2314UzpOvuaqhw8/INQeFNxiF1w0SQ3iDctAFtwBMpbIdpfOhFBp0wZZIQ7A==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr5110803wmg.145.1607456042838; 
 Tue, 08 Dec 2020 11:34:02 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id s1sm16850471wrv.97.2020.12.08.11.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:02 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/66] virtio: reset device on bad guest index in virtio_load()
Message-ID: <20201208193307.646726-8-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 John Levon <john.levon@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Levon <john.levon@nutanix.com>

If we find a queue with an inconsistent guest index value, explicitly mark the
device as needing a reset - and broken - via virtio_error().

There's at least one driver implementation - the virtio-win NetKVM driver - that
is able to handle a VIRTIO_CONFIG_S_NEEDS_RESET notification and successfully
restore the device to a working state. Other implementations do not correctly
handle this, but as the VQ is not in a functional state anyway, this is still
worth doing.

Signed-off-by: John Levon <john.levon@nutanix.com>
Message-Id: <20201120185103.GA442386@sent>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index ceb58fda6c..eff35fab7c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3161,12 +3161,15 @@ int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id)
             nheads = vring_avail_idx(&vdev->vq[i]) - vdev->vq[i].last_avail_idx;
             /* Check it isn't doing strange things with descriptor numbers. */
             if (nheads > vdev->vq[i].vring.num) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "VQ %d size 0x%x Guest index 0x%x "
-                              "inconsistent with Host index 0x%x: delta 0x%x",
-                              i, vdev->vq[i].vring.num,
-                              vring_avail_idx(&vdev->vq[i]),
-                              vdev->vq[i].last_avail_idx, nheads);
+                virtio_error(vdev, "VQ %d size 0x%x Guest index 0x%x "
+                             "inconsistent with Host index 0x%x: delta 0x%x",
+                             i, vdev->vq[i].vring.num,
+                             vring_avail_idx(&vdev->vq[i]),
+                             vdev->vq[i].last_avail_idx, nheads);
+                vdev->vq[i].used_idx = 0;
+                vdev->vq[i].shadow_avail_idx = 0;
+                vdev->vq[i].inuse = 0;
+                continue;
             }
             vdev->vq[i].used_idx = vring_used_idx(&vdev->vq[i]);
             vdev->vq[i].shadow_avail_idx = vring_avail_idx(&vdev->vq[i]);
-- 
MST


