Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E956693AAD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDb-0007Wh-74; Sun, 12 Feb 2023 17:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDP-00077x-UJ
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:00 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDO-00042R-7n
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:59 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r2so10433742wrv.7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fFJZ77WSAVqad3LkANpNigYGzQiA4H6qXd/MoajMgS8=;
 b=sjFwxDe7UqfbeNZWTLvlmLb43ESJ/3mpJNv9oESocdgYm+N9vI4H+XrjZYePxbIt8Z
 /4lbXmez1wWo/0QK928kLQgqbG4kIeQ5ykN81kFY8zglZJlxzug8Lqqui5GRGZQEMqQl
 tJ210DI8Oy6j4vsv6oacLMZMhxSguB5PTFv8iHHajE2P74G295F56xwOp35+bvvZ5Ko1
 otg4dwJRWKIt9i2GthTubQNrcsgsRjbGbJzaamvay9/SMxgILe5830Re+xydvEGfo9bG
 8c8mOKlQF08q83sr4Ue4gIev0U3fDMuu72wsKEQTR1ynU3/m2EljkVttoXzcn2Hs5Z4g
 HGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fFJZ77WSAVqad3LkANpNigYGzQiA4H6qXd/MoajMgS8=;
 b=PhFTxyK+s7Lgs1UgBTVAvWPXZq3cl9Th+z/3R4/UnbAz6S4buAh6ONBpGwNJ/QE0uK
 fH1hOIFFIg4euNxkWpoSb3P4oLjrHCOgSPQl7JFPpL7BdTxe6FzqdVcIK+sx2KUI8LlP
 sQB7F+8yl5KTyAfw1B7QKjjGG2nrOFw80UoHuAlVcn7raM8Uq4pKXxo3lUmW6og32rlI
 VyK2oLaJyTkrp5OFjf0xpiNoiRGVUw1tpfCuerE2SYUTnaGTbFUj5Ax9947RA0LCDJXE
 cuMHYNgVAMdDiHaQEBuxTGhDvGDr7ivcUKb6wCk4YVqZ99gMAQvVJkZY6eAO7INLlqGw
 /jnA==
X-Gm-Message-State: AO0yUKWobor9zjU+waLQ/i6ELDh+x59C1zNJN7C/sv9t5ZoNclPCOU6+
 ogVJte9G1eVmx/+dvvbaXoflOQ==
X-Google-Smtp-Source: AK7set/8pY69OZ3kC7uNGqf+up4M5rXbGlfy2lLUv7YjemUzsH+zD/TC+ZDogqFXgibQQSfa0jIl/g==
X-Received: by 2002:a5d:4ed0:0:b0:2c5:55a1:4b2 with SMTP id
 s16-20020a5d4ed0000000b002c555a104b2mr1945358wrv.49.1676242377498; 
 Sun, 12 Feb 2023 14:52:57 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a1-20020adff7c1000000b002c54a2037d1sm6918724wrq.75.2023.02.12.14.52.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 13/19] hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by
 SCSI_BUS()
Date: Sun, 12 Feb 2023 23:51:38 +0100
Message-Id: <20230212225144.58660-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Replace accesses to qdev->parent_bus by qdev_get_parent_bus(qdev).
Use the SCSI_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-bus.c     | 12 ++++++------
 include/hw/scsi/scsi.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index 3127cd7273..29b65a9b54 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -104,7 +104,7 @@ static void scsi_device_unrealize(SCSIDevice *s)
 int scsi_bus_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
                        size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(dev)));
     int rc;
 
     assert(cmd->len == 0);
@@ -250,7 +250,7 @@ static bool scsi_bus_check_address(BusState *qbus, DeviceState *qdev, Error **er
 static void scsi_qdev_realize(DeviceState *qdev, Error **errp)
 {
     SCSIDevice *dev = SCSI_DEVICE(qdev);
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(qdev));
     bool is_free;
     Error *local_err = NULL;
 
@@ -705,7 +705,7 @@ SCSIRequest *scsi_req_alloc(const SCSIReqOps *reqops, SCSIDevice *d,
 SCSIRequest *scsi_req_new(SCSIDevice *d, uint32_t tag, uint32_t lun,
                           uint8_t *buf, size_t buf_len, void *hba_private)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
     const SCSIReqOps *ops;
     SCSIDeviceClass *sc = SCSI_DEVICE_GET_CLASS(d);
     SCSIRequest *req;
@@ -1353,7 +1353,7 @@ int scsi_req_parse_cdb(SCSIDevice *dev, SCSICommand *cmd, uint8_t *buf,
 
 void scsi_device_report_change(SCSIDevice *dev, SCSISense sense)
 {
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, dev->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(dev)));
 
     scsi_device_set_ua(dev, sense);
     if (bus->info->change) {
@@ -1698,7 +1698,7 @@ static int put_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field, JSONWriter *vmdesc)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(s)));
     SCSIRequest *req;
 
     QTAILQ_FOREACH(req, &s->requests, next) {
@@ -1726,7 +1726,7 @@ static int get_scsi_requests(QEMUFile *f, void *pv, size_t size,
                              const VMStateField *field)
 {
     SCSIDevice *s = pv;
-    SCSIBus *bus = DO_UPCAST(SCSIBus, qbus, s->qdev.parent_bus);
+    SCSIBus *bus = SCSI_BUS(qdev_get_parent_bus(DEVICE(s)));
     int8_t sbyte;
 
     while ((sbyte = qemu_get_sbyte(f)) > 0) {
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 6ea4b64fe7..eb558c145a 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -177,7 +177,7 @@ static inline void scsi_bus_init(SCSIBus *bus, size_t bus_size,
 
 static inline SCSIBus *scsi_bus_from_device(SCSIDevice *d)
 {
-    return DO_UPCAST(SCSIBus, qbus, d->qdev.parent_bus);
+    return SCSI_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
 SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
-- 
2.38.1


