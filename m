Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B6693EC1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxY-00016E-Fu; Mon, 13 Feb 2023 02:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxR-0000x9-UN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:02 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxQ-0001r8-CB
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:01 -0500
Received: by mail-wr1-x42d.google.com with SMTP id co8so7304162wrb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hnCzjPfxFE+jbV/pOTQTvC2sGuBuierxSlf21esNXo=;
 b=c4HfOXEF7QeK9jrqu4iQcxBupJAS4471RrUqgSPXgazXFK62u5io44A867KLehpn50
 1Cr4KeWlJCvfsmRus/6EsHOL36VkCcKo+1Z0j/rmu9IKtE47JZVWpuNJEYhux4Xtfmac
 3FdJuGtqXr5h9Dj9ja3sU/Bwn3iQml7m2XoRbQQQ4Ta+59vPEo0Sh1j4b/waGumi4CPD
 unDwEFsBxXVC/kErgiY31p6H/5H1jWNcMLpXiVC3Se1HJ1n5ACJzfEaJrwPaRG/Bosd7
 kbRH8n9KScGzlduIdPW4WMKrmDqPpd6AGodq9tkztPzCuKwzP02b1f/e6MlVVDaMww5I
 7g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hnCzjPfxFE+jbV/pOTQTvC2sGuBuierxSlf21esNXo=;
 b=qKukesQp1Y5qpJ0IP8KQF7EapH65Hf9H39821jj5GhYi8ZUFs/a8qWDanXrQ4eDkt/
 feh8V4EAQXO1dzbcG9wmngGy8JzZT0dV6CHq01qBPCAXivziAq3GlC8KUuhirkJC8ph1
 3K/Uz8t7zvNMzpVQTDXIk+JGJCbCfDmS8qzSKr8cpL012WbR6diYTE9wTPMkP0AjtJsX
 aQ4jCttJzgoHIoQOZU+qgIsSaaIfMB4gV9nrzEvDkBSqqlPU7TciPohqkLTbnGOgmKjP
 29tR1u809DXtYQFch5pOv/wMCP8JB4zkY4iwtwSaXliiuvfNnAJgu2sP1+HW2DiM+Lvp
 NKaw==
X-Gm-Message-State: AO0yUKXJYiy5bd1byVKyIF2ZSwKCeiI3ljm/19t7DSxlMLJOX+n2/AiK
 V2jVZCnEf+oq9sYVp3cJnZ+iV9cS8gFoIxEY
X-Google-Smtp-Source: AK7set+fyGsPd9HC/9bH+LIdHQdXOaNPbzZBZAqt8It1XlCiPHR3jJfOn3RrsEvOgcvj5NzTOcRImw==
X-Received: by 2002:adf:dcd2:0:b0:2c5:5a68:958 with SMTP id
 x18-20020adfdcd2000000b002c55a680958mr983845wrm.33.1676272138910; 
 Sun, 12 Feb 2023 23:08:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i8-20020a5d4388000000b002c5493a17efsm7719780wrq.25.2023.02.12.23.08.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:58 -0800 (PST)
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
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 07/19] hw/ide/qdev: Replace DO_UPCAST(IDEBus) by IDE_BUS()
Date: Mon, 13 Feb 2023 08:08:08 +0100
Message-Id: <20230213070820.76881-8-philmd@linaro.org>
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


