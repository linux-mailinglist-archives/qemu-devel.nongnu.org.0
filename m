Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB794693ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyH-00033u-Bd; Mon, 13 Feb 2023 02:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxy-0002uc-2V
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:34 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxv-0001zZ-PM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:33 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m10so2143228wrn.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbFFSEwuPaiVjYWiGHnO40wk80nlXCVErHPDaxFN7V8=;
 b=h0AXilZPMuuifXWn6Ugjch0fjOxNNFm1Ku88Ao8UPtppFwS1pd0kCUN61yO05g8WzJ
 clunATwYD3FpW5rnhw4E2Tz70teBS8BxJcmVJiIbJ3a3YS6fOcMGnKpnGA580CKNyzfc
 DMSKnNyTE66DfLvHAiRG9bxgvhYPXcmxlEUvDc9mP24cEzKNL9jGWxLxnn0vZkYvzAXp
 ws3rNFRUjRIEdnvrC1GQo0tp+1ZfRd+zRMHTtMBOTd+9w6/Q5NBaRjAbHzhcnYUlZuxZ
 ui0UCTEfPj+c4M2WVywtLVBA3vLao6vER2mLi1k8jxX/jTJ2o6Gaxp14EE6fbPT5w0ai
 SLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbFFSEwuPaiVjYWiGHnO40wk80nlXCVErHPDaxFN7V8=;
 b=39Mk1eWk3QKjaM9boUEMtET4LsxmRkUDBfN2BW34w58tgv8uoDCYr47yH/CzdFUeCa
 Q0MXdykABbIDN2r1NG7urk0TASKBkumjcjOro0J0BrUvd375ASyICpBE+FDQnvA1L3MQ
 HaEtXYaz9ssWqP/rm5Ju+BkzjqgGxUSsNUWgZEBZmaHA2Dewg+hLtP3ut1jz4II8ccCx
 YuHogu4Xfdh/KNF2TTH0decX3JJiVOSxvvOVsPOam3mrlTCuVeXEvjLcjjVKvg3IAtQT
 0igdaPHK5PmnM0m+QdtIPisr8ft87MTIyIS9sFE5uYpN8QVF8yuNZ0G/Z2aXLl/Ujx8t
 Ushw==
X-Gm-Message-State: AO0yUKXmKrQG1cPuz31l8ddD5OXMdCSI8zjx++gSV4J51jXuhISGLMu5
 TL+JoedQPYK4kkzYbHMMEcfzEznI7Y6xYBeS
X-Google-Smtp-Source: AK7set//54TWnKyJOpH/E5VH31ajw8WjdMIgmWviM6p0g+re53hGWIKZG/ic5Dx6ghesw6W9jBlcVA==
X-Received: by 2002:adf:ec0b:0:b0:2c5:5ef8:fa36 with SMTP id
 x11-20020adfec0b000000b002c55ef8fa36mr256695wrn.70.1676272170305; 
 Sun, 12 Feb 2023 23:09:30 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff94d000000b002be099f78c0sm9634618wrr.69.2023.02.12.23.09.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:29 -0800 (PST)
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
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v2 13/19] hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by
 SCSI_BUS()
Date: Mon, 13 Feb 2023 08:08:14 +0100
Message-Id: <20230213070820.76881-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
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

Use the SCSI_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-bus.c     | 12 ++++++------
 include/hw/scsi/scsi.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 7b2a82b335..c4525515ab 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -104,7 +104,7 @@ static void scsi_device_unrealize(SCSIDevice *s)
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                        size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(dev)));
     int rc;
 
     assert(cmd->len == 0);
@@ -250,7 +250,7 @@ static bool scsi_bus_check_address(BusState *qbus, DeviceState *qdev, Error **er
 static void scsi_qdev_realize(DeviceState *qdev, Error **errp)
 {
     SCSIDevice *dev = SCSI_DEVICE(qdev);
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(qdev));
     bool is_free;
     Error *local_err = NULL;
 
@@ -705,7 +705,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
                           uint8_t *buf, size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(d)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
     const SCSIReqOps *ops;
     SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(d);
     SCSIRequest *req;
@@ -1353,7 +1353,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     scsi_device_set_ua(dev, sense);
     if (bus->info->change) {
@@ -1698,7 +1698,7 @@ static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field, JSONWriter *vmdesc)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(s)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(s)));
     SCSIRequest *req;
 
     QTAILQ_FOREACH(req, &s->requests, next) {
@@ -1726,7 +1726,7 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(s)));
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(s)));
     int8_t sbyte;
 
     while ((sbyte = qemu_get_sbyte(f)) > 0) {
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 843dde8851..eb558c145a 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -177,7 +177,7 @@ static inline void scsi_bus_init(SCSIBus *bus, size_t bus_size,
 
 static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
 {
-    return DO_UPCAST(SCSIBus, qbus, qdev_get_parent_bus(DEVICE(d)));
+    return SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
 SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
-- 
2.38.1


