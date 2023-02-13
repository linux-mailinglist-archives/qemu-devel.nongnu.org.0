Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB01694F9C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:45:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdow-0002BT-Hf; Mon, 13 Feb 2023 13:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdon-0001uI-T2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:50 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdom-00005y-Ap
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o15so9957003wrc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tUBrGbpKKV7VXqQbLaZwgKrboQidPjnhwuwd1SCLF+8=;
 b=Y8Ti4NsiohEQUAwGn4nIW2vrzmlzBdyveHD0R2pymv7YcsEdcJH37KbcbKCHjxyi1c
 5eCCOHQ8SJKZs9KJT0qWswgVIHttpgaMVc47pTxTa9+BnYx8ZXLi8UZcOnCGGtOZClsr
 sbvA+kP/7kN/CqLOCvsulEYrCEGktlO19cwXU2vK+z5F4zlsQletWkRSb5S1IDS5zHni
 MX7DpJcpW9cNlKZRIjiZ1lQigU8fXOkIitpLssFx+ZaQ8L/2bXJmG2oQU6jqUPDEJTAk
 6IY6EUcK66jaoSkkjh5qZLhoEYVLPOqRdimD+To3BbYqHIDJp6p15SjS2H25lz76PD0y
 p8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tUBrGbpKKV7VXqQbLaZwgKrboQidPjnhwuwd1SCLF+8=;
 b=xjMw/4FiUS/HU9wjotVjM79QtEkXB7B5eMw8y1NqfR2OR+o3CnU9GACFZWpHGaqd0G
 TQy2HspMhEDsShVBgiUaxnoVI5PR11CEBApmTPsY595hOxtskWyebPS9u04EqNWICp2/
 7MJz/qe9ZF0JuxnyJ5eP8eRryuquteLHrrlh4oh2EphUVUnPh4jT1LJW289HONBJGr4Q
 5Jqjk2JgreHViG7Fg+ZM6ATZRm1z2qIHs8t0elpcx02lAot7JoeT3BDR7A0JVrkahiXG
 n40sPP4OX02apt+RipK/ZRvrTZOj/+EupiwjuxVD6n/+Gog2CjUqlnsuZrfiE9IjaoWL
 Tp4g==
X-Gm-Message-State: AO0yUKVlHYQSg68XEimmgtaD7BxREnZjRvaF3vHgTRwj/Lzg73Sth6qw
 kC1FWuND9WT8TlvKUtgdQnb1YWqOlBypMywa
X-Google-Smtp-Source: AK7set+kskLHDiP1Hyxq0fWbGVLWSLlCDYkSDl9OY7AR7MAuc1Luisy8En31AtlcFlkA3wdTZKt1+Q==
X-Received: by 2002:a5d:4bc3:0:b0:2c5:5184:abc with SMTP id
 l3-20020a5d4bc3000000b002c551840abcmr5918859wrt.59.1676313886940; 
 Mon, 13 Feb 2023 10:44:46 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a5d514a000000b002c3e28d0343sm10858412wrt.85.2023.02.13.10.44.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org
Subject: [PATCH v3 12/14] hw/scsi/scsi-bus: Inline two uses of
 scsi_bus_from_device()
Date: Mon, 13 Feb 2023 19:43:36 +0100
Message-Id: <20230213184338.46712-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Acked-by: Eric Farman <farman@linux.ibm.com>
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


