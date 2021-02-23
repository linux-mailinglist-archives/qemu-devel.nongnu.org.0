Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25C4322976
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:27:49 +0100 (CET)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVr2-0007l4-Re
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEVnb-0005ov-4r
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:24:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lEVnZ-0003Hr-EO
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614079452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IAVSc0A/7qDBe5MIa/4V5sIgshkGM/S6iSIXJjRWvdw=;
 b=dqpw8ZI0+VMZpBt8Y2h72BJ53IyZMiTjak0RsZzqRZ2oy6dWmFSOmnBtXxHxc5hqQ5BDAl
 s/2NeGBkwuG/C9o4eRxd14rKsIShuQHPN4DuWHYmqLrksakGN14LHeao6LHptlCMCJnPiw
 qjYIHhzhpCef9Tu/UmkOyHRLBxdzw0g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-mvTi4CF3OFaa2TeZS7N0lg-1; Tue, 23 Feb 2021 06:24:10 -0500
X-MC-Unique: mvTi4CF3OFaa2TeZS7N0lg-1
Received: by mail-wr1-f69.google.com with SMTP id l10so7201001wry.16
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:24:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IAVSc0A/7qDBe5MIa/4V5sIgshkGM/S6iSIXJjRWvdw=;
 b=QFHGIFRJJLqgznPuHS/IljakEflMCp5abs4Gx/ZdR0iG+aj8DGRgixKNxvYZzonMF4
 G5B+asSHm+Sy6XJJGlDvBNoNoJTLmqbRkETePysrfnuasIIhKKnls6bEbryE/XfX0YVL
 2I7Sf/ebKvvlYUQzdEKbr+0H+fCgUCysXQjjzPZduIlRoY/6eBqUQRyWFH38LsaZobs5
 7z/O7mVPlDzHjabrvGVM7LrLk/Spfw9QuUEXHnc/b/qLCP5BasS5EP7dmEKbpUR/YP/D
 nZzoR8kOPOw4mpKNQoHbVQbuuig4SF4hVFnCRzMu1YuPEhBztXdqiE3xF79nfeyDxpGW
 ml5g==
X-Gm-Message-State: AOAM533FejG6Vi+5kdA+goUoVJW55rsBZxqzDCBI4AtD7mk6GZL3qJ3Z
 PWXxhevKhgPdvzphTpSeC8OMkWHyKuRW1hLT4TlkSRVkJdUS6ihmDslw+zDTUEOm7Reo/fxO8bV
 q7uUH58DdzN/V3NY=
X-Received: by 2002:adf:81f7:: with SMTP id 110mr25868747wra.35.1614079449327; 
 Tue, 23 Feb 2021 03:24:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzs54541hSPKy2WkTDpYl+00Y5iQ4RoHU7BFRbby3/APvghBG2rkG19V8Y9haFlet1FRN6vg==
X-Received: by 2002:adf:81f7:: with SMTP id 110mr25868725wra.35.1614079449066; 
 Tue, 23 Feb 2021 03:24:09 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id f7sm32250383wrm.92.2021.02.23.03.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:24:08 -0800 (PST)
Date: Tue, 23 Feb 2021 12:24:06 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] virtio-blk: Respect discard granularity
Message-ID: <20210223112406.cqbujfkt7pq4zyg6@steredhat>
References: <YDPgfPiXQ9fNmGlq@stefanha-x1.localdomain>
 <20210223053616.68503-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210223053616.68503-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 02:36:16PM +0900, Akihiko Odaki wrote:
>Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>---
> hw/block/virtio-blk.c          | 8 +++++++-
> hw/core/machine.c              | 9 ++++++++-
> include/hw/virtio/virtio-blk.h | 1 +
> 3 files changed, 16 insertions(+), 2 deletions(-)
>
>diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>index bac2d6fa2b2..f4378e61182 100644
>--- a/hw/block/virtio-blk.c
>+++ b/hw/block/virtio-blk.c
>@@ -962,10 +962,14 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>     blkcfg.wce = blk_enable_write_cache(s->blk);
>     virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
>     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD)) {
>+        uint32_t discard_granularity = conf->discard_granularity;
>+        if (discard_granularity == -1 || !s->conf.report_discard_granularity) {
>+            discard_granularity = blk_size;
>+        }
>         virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
>                      s->conf.max_discard_sectors);
>         virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
>-                     blk_size >> BDRV_SECTOR_BITS);
>+                     discard_granularity >> BDRV_SECTOR_BITS);
>         /*
>          * We support only one segment per request since multiple segments
>          * are not widely used and there are no userspace APIs that allow
>@@ -1299,6 +1303,8 @@ static Property virtio_blk_properties[] = {
>                      IOThread *),
>     DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
>                       VIRTIO_BLK_F_DISCARD, true),
>+    DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
>+                     conf.report_discard_granularity, true),
>     DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
>                       VIRTIO_BLK_F_WRITE_ZEROES, true),
>     DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
>diff --git a/hw/core/machine.c b/hw/core/machine.c
>index de3b8f1b318..3ba976e5bbc 100644
>--- a/hw/core/machine.c
>+++ b/hw/core/machine.c
>@@ -33,7 +33,9 @@
> #include "migration/global_state.h"
> #include "migration/vmstate.h"
>
>-GlobalProperty hw_compat_5_2[] = {};
>+GlobalProperty hw_compat_5_2[] = {
>+    { "virtio-blk-device", "report-discard-granularity", "off" },

IIUC older machines inherit the properties set for newer machines, so I 
think only this one is enough.

Thanks,
Stefano

>+};
> const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>
> GlobalProperty hw_compat_5_1[] = {
>@@ -41,6 +43,7 @@ GlobalProperty hw_compat_5_1[] = {
>     { "vhost-user-blk", "num-queues", "1"},
>     { "vhost-user-scsi", "num_queues", "1"},
>     { "virtio-blk-device", "num-queues", "1"},
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>     { "virtio-scsi-device", "num_queues", "1"},
>     { "nvme", "use-intel-id", "on"},
>     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
>@@ -50,6 +53,7 @@ const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
> GlobalProperty hw_compat_5_0[] = {
>     { "pci-host-bridge", "x-config-reg-migration-enabled", "off" },
>     { "virtio-balloon-device", "page-poison", "false" },
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>     { "vmport", "x-read-set-eax", "off" },
>     { "vmport", "x-signal-unsupported-cmd", "off" },
>     { "vmport", "x-report-vmx-type", "off" },
>@@ -59,6 +63,7 @@ GlobalProperty hw_compat_5_0[] = {
> const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
>
> GlobalProperty hw_compat_4_2[] = {
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>     { "virtio-blk-device", "queue-size", "128"},
>     { "virtio-scsi-device", "virtqueue_size", "128"},
>     { "virtio-blk-device", "x-enable-wce-if-config-wce", "off" },
>@@ -74,6 +79,7 @@ GlobalProperty hw_compat_4_2[] = {
> const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>
> GlobalProperty hw_compat_4_1[] = {
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>     { "virtio-pci", "x-pcie-flr-init", "off" },
>     { "virtio-device", "use-disabled-flag", "false" },
> };
>@@ -83,6 +89,7 @@ GlobalProperty hw_compat_4_0[] = {
>     { "VGA",            "edid", "false" },
>     { "secondary-vga",  "edid", "false" },
>     { "bochs-display",  "edid", "false" },
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>     { "virtio-vga",     "edid", "false" },
>     { "virtio-gpu-device", "edid", "false" },
>     { "virtio-device", "use-started", "false" },
>diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
>index 214ab748229..29655a406dd 100644
>--- a/include/hw/virtio/virtio-blk.h
>+++ b/include/hw/virtio/virtio-blk.h
>@@ -41,6 +41,7 @@ struct VirtIOBlkConf
>     uint16_t num_queues;
>     uint16_t queue_size;
>     bool seg_max_adjust;
>+    bool report_discard_granularity;
>     uint32_t max_discard_sectors;
>     uint32_t max_write_zeroes_sectors;
>     bool x_enable_wce_if_config_wce;
>-- 
>2.24.3 (Apple Git-128)
>
>


