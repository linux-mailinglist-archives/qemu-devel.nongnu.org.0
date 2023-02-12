Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEC3693AA2
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCw-0005lj-JO; Sun, 12 Feb 2023 17:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCu-0005fx-Li
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:28 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCt-000437-0O
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id k3so2816855wrv.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmW3+j4CxzNplehiqaRULW7t0qame5JDIOTexmpxrH0=;
 b=bz0ChdXwolRU0I6j2tBywUYDzVv/7C1zU/gwIncr4FPc+dK61rSwCtD87lVZYPmZnq
 c6SJZAdkcpaIwBSraLgfwZie0C13RYKINpaj7/B7/tFkMPqNnwlYNqDhLJdKSZMTI7wQ
 3u3aJPEyv8OenL/Kv9SBAZT9W1MeCtOCHeG4ij7aNqP2UbpgIrqGy0RRW3R0ZcgMzsZk
 xIm1Q1npoCfhdsRa4ZwN4YJ5KLNGTUzJDA5jYP4AvWgEN3Tn5q1szOnu6JF4R6RLivxK
 DjPiFf/roN2VEfkOENHvpNwgA+VMCPW2H8ljKIO5Eq4cxq3vXIMEAuV+uiuIkKLJ1qgC
 I+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mmW3+j4CxzNplehiqaRULW7t0qame5JDIOTexmpxrH0=;
 b=KFlaOi0/aPVqRqCv49SoFd5ktqgWlq2nu3bptEaDqrQc0FjFqLqrEX/fGb9xFoeZjw
 pgi5Vq+TbUCRNG/xckd1Gk0tLWZUKwG20MauyD84GwjxHGIjPW86Bj8ijaJD6x+NHQbJ
 CBw/sZ+hwBnCEECb4dNnYq0ui6bkY26xl1bUvBOcnwjNJ3xWANS/fzs7Nwnf5EaogJme
 WHUHUjv2CbLllQItM+ZZOojpPsC1DtDbUT28Dwfa6K2H0Ra8xjWP/AHZF3FESaYLEQK5
 aNqOzZnQ9a4j2V4/o8S1izxrgtp/7j/Pmvj6TpNKcSaaXG6PiBqaJTfAnCZdDmaA5CJx
 HXjA==
X-Gm-Message-State: AO0yUKUoP2ghGjAGOswtOwoz8+UxMRuxmAaprKrc8Rhhf2E/+sGksS2L
 rc3lhoGQpD3u/SJdjn70+fb6rA==
X-Google-Smtp-Source: AK7set/eLBZ25Cxi1Di7cSG+M8RDogwjajcam+RPf2ZPFBoEofawbIUzEQRVEJR5x0TdOZ6aM3Wpsg==
X-Received: by 2002:adf:decf:0:b0:2c3:f250:f202 with SMTP id
 i15-20020adfdecf000000b002c3f250f202mr21023961wrn.22.1676242345839; 
 Sun, 12 Feb 2023 14:52:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a5d58fa000000b002c5526680cbsm3478694wrd.92.2023.02.12.14.52.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 07/19] hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
Date: Sun, 12 Feb 2023 23:51:32 +0100
Message-Id: <20230212225144.58660-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Use the IDE_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/qdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index c96a25e955..a168643266 100644
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
-    IDEBus *bus = DO_UPCAST(IDEBus, qbus, dev->qdev.parent_bus);
+    IDEBus *bus = IDE_BUS(qdev_get_parent_bus(DEVICE(dev)));
     IDEState *s = bus->ifs + dev->unit;
     int ret;
 
-- 
2.38.1


