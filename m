Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97A693ED1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyL-0003Jb-GN; Mon, 13 Feb 2023 02:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSy3-00031h-VK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:43 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSy2-00020T-26
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8216842wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOJqX8v3/sh1eT6fwi4hqhcy8JYApnAmdmloXPtjUgo=;
 b=HzjxN4572CIY6DB37y4J/OK0KnDnerxhnEzlRuqnAOk5eZAGM3GYAF/spCfdmxDea1
 TF43+hImJjpFKyPVWUQ0QWyVi6g/R6mbezTTuskFsa74h5K6WARv1tbebLJQU4FHQt1C
 PXR91bLKnCgKtO1gt7qUlz05uQ2Mb9PUQKaRFw/StfIjIE9zjL38PGA+22mFV/XB3+R1
 x2s0Xgv3py3hznVIypu+RFEQzcCOLFV9hsKzLeAwqoThse+e8jlv6zY4Vo0QbXLXSNvN
 evyTo7tcE+zIs8J3plLwfd4GEoOg4iim33BHuGgSErXZLivAER6d4mJbIM+HXDUU+5Wr
 ViUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOJqX8v3/sh1eT6fwi4hqhcy8JYApnAmdmloXPtjUgo=;
 b=rViBdULd7y0XvtXBkSp9RHwXuVrLNwiS06ZhPrwvYePVnjVviF4S/isePIFpjmXryn
 kITozS4/eLlL+XvWhf5EXKFq4Bp5Q5L8UB/Ms1IZAduYaB9QYCZLMdwGoYpUp284z9hM
 mmiQumCgVQ4h7ba8KX+bTwPWcJ/HSV3XEMgw6XTvsHr+5IvxGORZqSHSaP5MFvqJ/CHh
 Dhq45cCrtwiKvX88QZi07RuwDv7ZqI9LQ0oW4s1InII7c+yuh8AGGbYRaNpshqqW85F4
 mi+miVxZTAvl5KDpEg4bsXoUWZ84TKrQHiMqjqZKgwPp9Krr2xKrYkPtllo83EO1MrBD
 +q3Q==
X-Gm-Message-State: AO0yUKX1N1f3HU63wOoOEt5RFtCUgtnmQzRSo7Qzo1KhNwiMSbLddM8K
 BmBTmHYRtzknuQI//ONGQ7HqUYl2Npk34T6c
X-Google-Smtp-Source: AK7set8SLQZwvD2cFCJJywK6pAHR7OQY1FZqqBEUwGHLqz7y8fGDGuasTsrQa1yd/NaSg+Mm6A71fQ==
X-Received: by 2002:a05:600c:3093:b0:3df:fbd5:690 with SMTP id
 g19-20020a05600c309300b003dffbd50690mr18109405wmn.17.1676272175642; 
 Sun, 12 Feb 2023 23:09:35 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003dc48a2f997sm15921660wmc.17.2023.02.12.23.09.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 14/19] hw/scsi/scsi-bus: Inline two uses of
 scsi_bus_from_device()
Date: Mon, 13 Feb 2023 08:08:15 +0100
Message-Id: <20230213070820.76881-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/ipl.c         | 7 ++-----
 hw/scsi/scsi-bus.c     | 2 +-
 include/hw/scsi/scsi.h | 5 -----
 3 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 8612684d48..4f7f4e60d6 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -366,11 +366,8 @@ static CcwDevice *s390_get_ccw_device(DeviceState *dev_st, int *devtype)
             ccw_dev = CCW_DEVICE(vfio_ccw_dev);
             tmp_dt = CCW_DEVTYPE_VFIO;
         } else {
-            SCSIDevice *sd = (SCSIDevice *)
-                object_dynamic_cast(OBJECT(dev_st),
-                                    TYPE_SCSI_DEVICE);
-            if (sd) {
-                SCSIBus *sbus = scsi_bus_from_device(sd);
+            if (object_dynamic_cast(OBJECT(dev_st), TYPE_SCSI_DEVICE)) {
+                SCSIBus *sbus = SCSI_BUS(qdev_get_parent_bus(dev_st));
                 VirtIODevice *vdev = (VirtIODevice *)
                     object_dynamic_cast(OBJECT(sbus->qbus.parent),
                                         TYPE_VIRTIO_DEVICE);
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index c4525515ab..ee72b86b13 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -679,7 +679,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
                             uint32_t tag, uint32_t lun, void *hba_private)
 {
     SCSIRequest *req;
-    SCSIBus *bus = scsi_bus_from_device(d);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
     BusState *qbus = BUS(bus);
     const int memset_off = offsetof(SCSIRequest, sense)
                            + sizeof(req->sense);
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index eb558c145a..e3263dec0d 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -175,11 +175,6 @@ static inline void scsi_bus_init(SCSIBus *bus, size_t bus_size,
     scsi_bus_init_named(bus, bus_size, host, info, NULL);
 }
 
-static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
-{
-    return SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
-}
-
 SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
                                       int unit, bool removable, int bootindex,
                                       bool share_rw,
-- 
2.38.1


