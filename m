Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED5693EA5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStr-0001B9-3N; Mon, 13 Feb 2023 02:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSto-00019Q-FM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:16 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStm-0000t0-2e
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:05:16 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o18so11066882wrj.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=md/V7qS9+MXg+4Y+2ycjl2bad9V4Bp92Z+1RWOwRBno=;
 b=PxDf/SH2ShPie6GsyT7i2RpbRLYGrgkKYImchGuWskFRsYoqJSH7lQbPOm3eAFYU79
 18r/Xy+f0XqBBjDGMNFAs/UBJtaYfvoms7YLgjf27v01gjU2XvlHoNZHPJ42XG169Og4
 21H7iUdXWn/A0d4kkP+jsfrYRMeIBBjgFQi74Xw9HwBetHgUdtovTeuTxWJGFmCq6Z0B
 2uBXbxFZrzQ+RFF1QB8P7qCywR9B3eb9zRcX7MxZYhVDYNUrW0JRY+R0nNdbEJLEDxmA
 Rq7Ue09fW/DH6THeCIo72737OK0+Y3jtGp5pFj6PqMy2DvO3i8iS4bkR6uLKo9VlqNjB
 CIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=md/V7qS9+MXg+4Y+2ycjl2bad9V4Bp92Z+1RWOwRBno=;
 b=M+8tYf9do1rKyNeTcWadLNq20C7yygnsAvVmngbdHFRIBeZU9k1CJ75ibGXmYoE2Jm
 0Aa/JDbeUHnOACau4CUm7km/eccI+vBABV8iZIA/dERH7waBKqjCPiNsLtkXvqDogfP0
 pWfec2khvkJTxw/CGiEbE5jL0e0d1dFs+iCNONXhYVFiV4wmc7pg6I90gPLmv/SaKwb1
 r5oTXA9MnGebd2niTSYE4h8ogmZRHR9whONoxzXB/L38BaAv7c3QE2E046sUxOyoTK75
 Tebt78OZkhp9VcOhReDWJ+Ux3tfYBMt/aC6Vsh7EFeSQZDWiR2cT1lXdFyQMyxy1vRlL
 27Wg==
X-Gm-Message-State: AO0yUKVpYn4xE0WE0cFBc7JfyJP5Zb976VvlfedKGVzPMpGuGy+LFLp9
 eCqeBLEI2VKkH6Zq63aSKHgFM43vyeACMKSR
X-Google-Smtp-Source: AK7set+tW1x2hijghuCuuG1y5DKtns9TyCUs9YzcCzQtSrD4XYy9g2AYNQpwm7udj7HOkmdBc8fhlA==
X-Received: by 2002:a05:6000:c8:b0:2c3:db98:3e87 with SMTP id
 q8-20020a05600000c800b002c3db983e87mr18419813wrx.20.1676271912399; 
 Sun, 12 Feb 2023 23:05:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d534f000000b002c55306f6edsm3759375wrv.54.2023.02.12.23.05.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:05:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 9/9] qdev-monitor: Use qdev_get_parent_bus() in
 bus_print_dev()
Date: Mon, 13 Feb 2023 08:04:23 +0100
Message-Id: <20230213070423.76428-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

No need to pass 'dev' and 'dev->parent_bus' when we can
retrieve 'parent_bus' with qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/qdev-monitor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 820e7f52ad..12e4899f0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -770,9 +770,9 @@ static void qdev_print_props(Monitor *mon, DeviceState *dev, Property *props,
     }
 }
 
-static void bus_print_dev(BusState *bus, Monitor *mon, DeviceState *dev, int indent)
+static void bus_print_dev(Monitor *mon, DeviceState *dev, int indent)
 {
-    BusClass *bc = BUS_GET_CLASS(bus);
+    BusClass *bc = BUS_GET_CLASS(qdev_get_parent_bus(dev));
 
     if (bc->print_dev) {
         bc->print_dev(mon, dev, indent);
@@ -811,7 +811,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev, int indent)
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props_, indent);
         class = object_class_get_parent(class);
     } while (class != object_class_by_name(TYPE_DEVICE));
-    bus_print_dev(dev->parent_bus, mon, dev, indent);
+    bus_print_dev(mon, dev, indent);
     QLIST_FOREACH(child, &dev->child_bus, sibling) {
         qbus_print(mon, child, indent);
     }
-- 
2.38.1


