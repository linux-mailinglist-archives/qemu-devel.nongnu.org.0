Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C6694FAC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:47:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdop-0001tb-HW; Mon, 13 Feb 2023 13:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoi-0001qI-RV
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:45 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoh-0008Vz-6A
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:44 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n33so3342179wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbFFSEwuPaiVjYWiGHnO40wk80nlXCVErHPDaxFN7V8=;
 b=IrXHoLjJvRO9HbHPw2U4rArVJbApZYzgT816Q/pq4Jyd2LDWRJAuEVdwriT218Lzn7
 ye/qO2wqhc68fUyeCPd7xThRwUqnuN2T3yCFCnwa6gsOaR9IEufcrVOiWnnen96v6EFc
 e9ZV+oqDtSmMP9lb/+t9Ficg3RCWoRLrXwEPgfBwNLuZZzgxFHkmJJwAh7nylUCsm+IW
 7+QpvroKmoYkNWfaNE8jRpLod7LclueYvIyp93PG6fv+YWkiPYF1OtWtJHrMUG1W1m6G
 6N6sIlvxhh+kQiWM5xtP1EEB/3Pwlzme8VjPXAnjdo6crbpn3Hsd0nGOazZzVF99lVpF
 XKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbFFSEwuPaiVjYWiGHnO40wk80nlXCVErHPDaxFN7V8=;
 b=XNTVfTbjaKl2YBzchxQIbi11DbFJ8kYANzu3bvb6rqUhRbGbKXjHrSvE3rEh+LijNR
 IoxacG5Rl8aifVhUpWX/M/eYnNhmmLy9O/Q8HICR6XEg5AnQGmTU5wycjU4X1AENrywT
 p2XQdfGTvVJyJONQ4TVBg4HaRU9d/hMoRc0blqQfFH/P01enakdjMRA8atP+HlAaREYi
 oHolf3CLqWUahLfX0u6CSgPc4BKZUh+NkrOqYbMHoOX0ufyu1z0vfJf3P9nTkolyBapH
 EbLTsNUS4M4kkNgby4m2ZWkJH2NgB7XKNMfzXHdjWkCc3729hIYYYFjBELD/9FLX7N4x
 iZxw==
X-Gm-Message-State: AO0yUKXexTDu4rVbXnf6/MwY5ffIbzgKRgBzlSjbAk6lwTzCzJPj+eRQ
 Vv4MTvn6TFN8yoOqgNbRjCCJtuY1A4TELHte
X-Google-Smtp-Source: AK7set8nIPN91DREOFKQvt+K55Z1k2Vl3+XAisCdkJ3vPKfF34AlyUm6jCwAeeVdey0Kjm76r8etMw==
X-Received: by 2002:a05:600c:3403:b0:3dc:572f:edb7 with SMTP id
 y3-20020a05600c340300b003dc572fedb7mr5131983wmp.1.1676313881348; 
 Mon, 13 Feb 2023 10:44:41 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a05600c475300b003e11f280b8bsm12751880wmo.44.2023.02.13.10.44.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v3 11/14] hw/scsi/scsi-bus: Replace DO_UPCAST(SCSIBus) by
 SCSI_BUS()
Date: Mon, 13 Feb 2023 19:43:35 +0100
Message-Id: <20230213184338.46712-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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


