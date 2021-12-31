Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96924823E7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:05:05 +0100 (CET)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Gee-0004hZ-H5
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:05:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1n3GbO-00028R-JV
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:01:48 -0500
Received: from [2a00:1450:4864:20::42d] (port=39554
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1n3GbM-0007VG-LC
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:01:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id s1so55647604wra.6
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BL8/TWkAupwdyxVwELhQQlXf4+MtyEpEvt0cYWPu9Fs=;
 b=H7Gi4UQO4VDKv/8Ng9QwvwszpHFxzTeFKLNdAFmtvS9fqqvcIBBsQ1ppZpIzGtrHy2
 fC3Nd+zW3A/QFBPdxsoiuCyqGxfPOnoQFbuQz9NbSpZ0noDQbcahThMbCK7wEW7I4t6z
 I9KXCx3H7e2bKXP0PA4zuuOgwvcYeasxgYQL1AWJxBwTu6EMXvaNfx+xb/7s63sxvqIr
 ALjM+4ZLPfdkdMOovLKx4E5i+ajy3OHt8uJaeYHCArIeknFuTDxCl4x/gI487hTYFW8b
 SLML9m67tij/ww9/e90ddFJVcas1Xr0MH2jyVUHWOr73iVCwE+hqVbc8w8WyiX2uPRBN
 qJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BL8/TWkAupwdyxVwELhQQlXf4+MtyEpEvt0cYWPu9Fs=;
 b=SI02vTCbs6TLJvHjXspdLHdCxsotnysa1hpx2NZ3Wwm619nAzQz3weGcP42DGGTP2g
 s3cI5vb5/nQAOswUHy+DDaLsna290hxAaPpU3fPmUTPhbeaZRk+6TRv7nJnIswFc0JxE
 ZIyUAIx6g/xRpEWipREZXDj3ANsbshF5uc0GiTjIHz2203EKPjn37KRm5619nSqEn5Gq
 X4SZ4ZxAQyZhdrXWepcrkq4ejzx6oV5FnUsGC58r0g/x6552V0RPpai7uzjMK0/P4rGw
 adO5BOwnrpSuq8R7AlYCtb6BSKIZ3E62koTxIunU6n+Ug4cMtTPzt2GUqT6fFTdg1OXC
 4LWQ==
X-Gm-Message-State: AOAM533skRt2OSmW0jpFYVK1Q7zLm0WDlE8MUQqbkgb73/ukAO9n/rJS
 MjxBeQzoqafauphxOBsz47dPBQPVpmvTfg==
X-Google-Smtp-Source: ABdhPJzhQhvhPKk6o0cOpfw1dSKVnIzhrA9TvJ3e8y//XUFHareMbdjYCJMvdfFeNY1eV+AFGhLKvg==
X-Received: by 2002:adf:aa9d:: with SMTP id h29mr28452592wrc.120.1640952097363; 
 Fri, 31 Dec 2021 04:01:37 -0800 (PST)
Received: from lb01399.pb.local (p5b0a8250.dip0.t-ipconnect.de. [91.10.130.80])
 by smtp.gmail.com with ESMTPSA id c8sm26466343wrp.40.2021.12.31.04.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:01:37 -0800 (PST)
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC] virtio_pmem: enable live migration support
Date: Fri, 31 Dec 2021 13:01:27 +0100
Message-Id: <20211231120127.22394-1-pankaj.gupta.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) AC_FROM_MANY_DOTS=3, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>, riel@surriel.com,
 mst@redhat.com, david@redhat.com, dgilbert@redhat.com, pankaj.gupta@ionos.com,
 stefanha@redhat.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>>

Enable live migration support for virtio-pmem device.
Tested this: with live migration on same host.

Need suggestion on below points to support virtio-pmem live migration
between two separate host systems:

- There is still possibility of stale page cache page at the
  destination host which we cannot invalidate currently as done in 1]
  for write-back mode because virtio-pmem memory backend file is mmaped
  in guest address space and invalidating corresponding page cache pages
  would also fault all the other userspace process mappings on the same file.
  Or we make it strict no other process would mmap this backing file?

  -- In commit 1] we first fsync and then invalidate all the pages from destination
     page cache. fsync would sync the stale dirty page cache page, Is this the right
     thing to do as we might end up in data discrepency?

- Thinking, alternatively if we transfer active corresponding guest page cache
  pages information from active LRU list source to destination host and refault
  those pages. This would also help to enable hot page cache in destination host
  for the guest and solve stale page cache issue as well. How we can achieve this
  so that we make sure we get rid of all the stale page cache pages in destination
  host?

  Looking for suggestions on recommended and feasible solution we can implement?
  Thank you!

1] dd577a26ff ("block/file-posix: implement bdrv_co_invalidate_cache() on Linux")

Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
---
 hw/virtio/virtio-pmem.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index d1aeb90a31..a19619a387 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -123,6 +123,7 @@ static void virtio_pmem_realize(DeviceState *dev, Error **errp)
     }
 
     host_memory_backend_set_mapped(pmem->memdev, true);
+    vmstate_register_ram(&pmem->memdev->mr, DEVICE(pmem));
     virtio_init(vdev, TYPE_VIRTIO_PMEM, VIRTIO_ID_PMEM,
                 sizeof(struct virtio_pmem_config));
     pmem->rq_vq = virtio_add_queue(vdev, 128, virtio_pmem_flush);
@@ -133,6 +134,7 @@ static void virtio_pmem_unrealize(DeviceState *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIOPMEM *pmem = VIRTIO_PMEM(dev);
 
+    vmstate_unregister_ram(&pmem->memdev->mr, DEVICE(pmem));
     host_memory_backend_set_mapped(pmem->memdev, false);
     virtio_delete_queue(pmem->rq_vq);
     virtio_cleanup(vdev);
@@ -157,6 +159,16 @@ static MemoryRegion *virtio_pmem_get_memory_region(VirtIOPMEM *pmem,
     return &pmem->memdev->mr;
 }
 
+static const VMStateDescription vmstate_virtio_pmem = {
+    .name = "virtio-pmem",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static Property virtio_pmem_properties[] = {
     DEFINE_PROP_UINT64(VIRTIO_PMEM_ADDR_PROP, VirtIOPMEM, start, 0),
     DEFINE_PROP_LINK(VIRTIO_PMEM_MEMDEV_PROP, VirtIOPMEM, memdev,
@@ -171,6 +183,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
     VirtIOPMEMClass *vpc = VIRTIO_PMEM_CLASS(klass);
 
     device_class_set_props(dc, virtio_pmem_properties);
+    dc->vmsd = &vmstate_virtio_pmem;
 
     vdc->realize = virtio_pmem_realize;
     vdc->unrealize = virtio_pmem_unrealize;
-- 
2.25.1


