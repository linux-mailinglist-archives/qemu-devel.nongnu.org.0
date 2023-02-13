Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC86694F9D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:45:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoO-0001At-Uh; Mon, 13 Feb 2023 13:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoL-00019i-Mq
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoJ-0008TB-PA
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k3so5634959wrv.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hnCzjPfxFE+jbV/pOTQTvC2sGuBuierxSlf21esNXo=;
 b=IX9uVrlK4z4v5wHmT/ms9nRTa9td+Wtl2M9zlza8++IaYw7ZXYjHQ2VrFrHfN7KwFl
 FnxP9XhB7nBrp9qunnp67yNoGbX736q7NpdRXv3exJluCAnHZCx5UuHqDKJegR5GI/Cd
 d8ojIQYm/E+aiuHTRFEV+RUh39hLJ+ZlD5eSJsmxrhwGKpRsp2vu3f0R0+J1ZQoE+c3p
 vsVk8Y148lADz+/LkloHBZWHSqwXRqNqbLTl35a3ArLXs0hKZgNbItcbRGAHltbc94Cm
 tQ396zmUAOvHv9imYwrxaD3hg02o080qMYD/rZ4IF4NxqKt9PgLzk4Clg4ACaPcnQRfp
 kbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hnCzjPfxFE+jbV/pOTQTvC2sGuBuierxSlf21esNXo=;
 b=qxittwVlHPlGGaMJOLbWiR84Z5gOcaRfzpCytU+H39WqTbzjpCQAJlceJUCD6zEp8H
 PtagJr+wFZSRwOXu2fKmNJBt1m8HW5N+/VZnjKruFoasb12LymKKqIozG0qVT0oxIala
 6tlxc2Hg1b7G7yw85aKuhELRcZBcYsdzFw2T/UpDLbCGd6DfPI6r55ZVve0prK/oPFZK
 JQGEY13oYFhddSmgCuAgz+FfYOnMHrh8ByT3zLxizi/WsWieOaw8nUu0Kd0VfOIlhjHM
 GtWt1LY9RD1Guxvf+VmJr8NZDNzwEK0fUoVdTnqA3RyB5iqDeGDS7sts3fvWgesjonjd
 OxGw==
X-Gm-Message-State: AO0yUKVVhwzi2lWwwC2Ad+GD80I2JnR4Nxw8FfJM8/mL0gvx54L9J2e4
 GyE1mA/0sExhw+N/im86FYU2FRqC/pVO6FGZ
X-Google-Smtp-Source: AK7set/fPAAMQj/95nERDCqSiBR95w+sxR1I7ZgkvFM3+BKM5OtHu/dLh8JCdg6fNgKtjRRMFcBq2A==
X-Received: by 2002:a5d:4ec6:0:b0:2c5:587e:75ba with SMTP id
 s6-20020a5d4ec6000000b002c5587e75bamr4147313wrv.55.1676313858144; 
 Mon, 13 Feb 2023 10:44:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c445200b003de77597f16sm16158016wmn.21.2023.02.13.10.44.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 07/14] hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
Date: Mon, 13 Feb 2023 19:43:31 +0100
Message-Id: <20230213184338.46712-8-philmd@linaro.org>
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

Use the IDE_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/qdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 1ead62fd18..a168643266 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -90,7 +90,7 @@ static void ide_qdev_realize(DeviceState *qdev, Error **errp)
 {
     IDEDevice *dev = IDE_DEVICE(qdev);
     IDEDeviceClass *dc = IDE_DEVICE_GET_CLASS(dev);
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev_get_parent_bus(qdev));
+    IDEBus *bus = IDE_BUS(qdev_get_parent_bus(qdev));
 
     if (dev->unit == -1) {
         dev->unit = bus->master ? 1 : 0;
@@ -139,7 +139,7 @@ IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs)
 {
-    IDEState *s = &DO_UPCAST(IDEBus, qbus, bus)->ifs[unit];
+    IDEState *s = &IDE_BUS(bus)->ifs[unit];
 
     if (s->drive_kind != IDE_HD || !s->blk) {
         return -1;
@@ -153,7 +153,7 @@ int ide_get_geometry(BusState *bus, int unit,
 
 int ide_get_bios_chs_trans(BusState *bus, int unit)
 {
-    return DO_UPCAST(IDEBus, qbus, bus)->ifs[unit].chs_trans;
+    return IDE_BUS(bus)->ifs[unit].chs_trans;
 }
 
 /* --------------------------------- */
@@ -164,7 +164,7 @@ typedef struct IDEDrive {
 
 static void ide_dev_initfn(IDEDevice *dev, IDEDriveKind kind, Error **errp)
 {
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, qdev_get_parent_bus(DEVICE(dev)));
+    IDEBus *bus = IDE_BUS(qdev_get_parent_bus(DEVICE(dev)));
     IDEState *s = bus->ifs + dev->unit;
     int ret;
 
-- 
2.38.1


