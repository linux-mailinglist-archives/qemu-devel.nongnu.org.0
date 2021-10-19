Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A41B4334EF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:43:31 +0200 (CEST)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnWj-0006e6-MO
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnB3-0000f3-3Z
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAz-0002dJ-KA
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8WUvKS8fdXJA9x2sA/adDQPr/E4an91R5a8EOdVOfhc=;
 b=FhcreCOYH0R79ocuZ2rtQ7A956zqHITB1TiiuWYm6wrEi86q9hEv4ZSyykMvg+70uU95jp
 1YIjQOhiAOBUPZTSI3og+uayla+qfVpwmptba1kOMBmOPXErEedH4ldK6Sqc6zhf4ow/+n
 xTO1sAAjcWwAsLY+uUIzPssio+cdI2I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-nUhennd1N_CcEJD_XmpiqA-1; Tue, 19 Oct 2021 07:20:56 -0400
X-MC-Unique: nUhennd1N_CcEJD_XmpiqA-1
Received: by mail-ed1-f70.google.com with SMTP id
 u17-20020a50d511000000b003daa3828c13so17257495edi.12
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8WUvKS8fdXJA9x2sA/adDQPr/E4an91R5a8EOdVOfhc=;
 b=o/S07QQOnKMooVWNzjaB6KXHNtwwBrvePxHhGkrTnLR1D5lBkYsZsXOV1JgCZNNCMt
 gZBP78qefXgfXvhEq+h3934yT0xb3N/fsthrzovnysbHO6roVIUOkPv7DnOorJjCnFT2
 BTgoEOKUmYQy3Y7LyE+njVrNM3UfwmL1Z3OYqzTTwAkNfR4OxbaXPskjACz7nOpqHjiA
 8XyRYmTypph01BtUcAmS2reFSTMiTk2zrFjEx4mC80EI5TqazspSK8mgrUWh+DNO4f0d
 LSEgbKZgQLVQy9kAAd7cW4QvtoKV/IM97EMonOPKxnEvm7qXGIzMpH0nHlhceUwmhCuB
 lJkw==
X-Gm-Message-State: AOAM531wksYBZ58WULKi71dCdK0MlTe+Wyjyue8W/sXk6jVsYRpan9Uw
 8giyhlqQWKAmUPk9KWJ8yZTdLe+qauL8CcVmwzM2a3WraJOC3IX+uvs/KJaInGxL8lgzmV4Neat
 3IQ24/j3bqLFE2L/O6D+awp2SpUo+soCdFTPtkkb03tSqBBmu//DVelA4LmxG
X-Received: by 2002:a17:907:2156:: with SMTP id
 rk22mr36578443ejb.64.1634642454506; 
 Tue, 19 Oct 2021 04:20:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHgjdXgVhdMwdjXL8JesTPdNM4H1aKPo9EEvo/JLVNBA62Ogcaa7cXfLn6l5AsDTTBpgOGHg==
X-Received: by 2002:a17:907:2156:: with SMTP id
 rk22mr36578423ejb.64.1634642454332; 
 Tue, 19 Oct 2021 04:20:54 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id h10sm603745edk.41.2021.10.19.04.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:53 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/29] vhost-user: fix duplicated notifier MR init
Message-ID: <20211019111923.679826-26-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>,
 Peter Maydell <peter.maydell@linaro.org>, tiwei.bie@intel.com,
 Xueming Li <xuemingl@nvidia.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xueming Li <xuemingl@nvidia.com>

In case of device resume after suspend, VQ notifier MR still valid.
Duplicated registrations explode memory block list and slow down device
resume.

Fixes: 44866521bd6e ("vhost-user: support registering external host notifiers")
Cc: tiwei.bie@intel.com
Cc: qemu-stable@nongnu.org
Cc: Yuwei Zhang <zhangyuwei.9149@bytedance.com>

Signed-off-by: Xueming Li <xuemingl@nvidia.com>
Message-Id: <20211008080215.590292-1-xuemingl@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 2c8556237f..bf6e50223c 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1526,8 +1526,9 @@ static int vhost_user_slave_handle_vring_host_notifier(struct vhost_dev *dev,
 
     name = g_strdup_printf("vhost-user/host-notifier@%p mmaps[%d]",
                            user, queue_idx);
-    memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
-                                      page_size, addr);
+    if (!n->mr.ram) /* Don't init again after suspend. */
+        memory_region_init_ram_device_ptr(&n->mr, OBJECT(vdev), name,
+                                          page_size, addr);
     g_free(name);
 
     if (virtio_queue_set_host_notifier_mr(vdev, queue_idx, &n->mr, true)) {
-- 
MST


