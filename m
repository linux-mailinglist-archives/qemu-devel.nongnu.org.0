Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826F693AAC
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDb-0007WV-7u; Sun, 12 Feb 2023 17:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDX-0007Io-2L
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:07 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDV-0004Bq-6M
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:06 -0500
Received: by mail-wr1-x42c.google.com with SMTP id k3so2817491wrv.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LKsXht54rDUTkJKqHQqtb4Pds5COe3w7PRc1ZjYr30M=;
 b=sfrz6HR9V2dqOypvsdhdHvLfc1g4znf+bLlv6r7ACKtPm236EXKEpPVNVoSHdYsiGk
 PHn90E0rROR90hXNbH5aKujTa7NKutEn5lrjA/35ay6TZEhZaE8FOK+QUpXyBoqI4Ey7
 eUQv0jrs1sl5CIrtHS4rtFdP7hlh2o/3/n7LcXbKl7Lf8AJrvsOk3kbHtv9IwSAOAqZR
 JsjuCbApn7tJ4+GD7rF6KSJuHEYqW6vnFMFngA+z4FTDYxyyV+f+AuDua4qn1A+HA3Z9
 XVtakH61+4cH4onDjryiUUqAzI6svjNro4OAFSBJ64nw3nRG92vcZ+puyyuKx/oYp2S4
 dtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LKsXht54rDUTkJKqHQqtb4Pds5COe3w7PRc1ZjYr30M=;
 b=1vB0ZY7BJCPJCw1SUWnn4x7FrqDyF638P1gdtCoQi39r3c5Md9nic9nwEn5e6HAITd
 MXwyVyAQ4wtGAbSTEOWIrh9wXI/lrJji7nqGeQHHQGAjaBr5TVORu17PpQiPSEASwkOM
 F6hpXoZ7hnmkVPft6yGStlIqE27n6thjcvkTuMDNjLtB98ayJOek5FLq5XfQ7pu2ZkyH
 GI/QKN0v1M24sp1HciiRP5LQyQmS3tR5pEHnfUlNnbUWrFVqThcU1NRStFxT3xJ9LG9H
 d/AiARo0APgNCE302VK85rH5AT2NLyInD28SjnoA6dL8teTzebBKTY9z34ZBrnOL98Ug
 vIQw==
X-Gm-Message-State: AO0yUKXiUCheaJWjVlp2knojRowvWISLDIX2E4BKJG5CMhFQ0ayFRaml
 z6ralPAgjoZzrKk8jMnyEMjWPA==
X-Google-Smtp-Source: AK7set/YeESjlCxwQY6Ed2dLVCWtvFJih1IlL54E+KgvHcVuv81F2k2+9WhBXyZp7lfKWpwlhmpnkQ==
X-Received: by 2002:adf:d08a:0:b0:236:695b:82d4 with SMTP id
 y10-20020adfd08a000000b00236695b82d4mr20256109wrh.30.1676242383050; 
 Sun, 12 Feb 2023 14:53:03 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a05600000c400b002c54737e908sm7356335wrx.91.2023.02.12.14.53.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:53:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 14/19] hw/scsi/scsi-bus: Inline two uses of
 scsi_bus_from_device()
Date: Sun, 12 Feb 2023 23:51:39 +0100
Message-Id: <20230212225144.58660-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
index 29b65a9b54..802bed2abc 100644
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


