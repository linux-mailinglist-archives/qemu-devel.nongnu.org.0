Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F18693AA4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLCl-0005Sj-KJ; Sun, 12 Feb 2023 17:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCk-0005Rp-1X
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLCi-00041p-Cz
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id o36so7556816wms.1
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/FK4XDdiJG7RHelAiRbUeIilzHxima3ZnBYQtTcGTM=;
 b=Pl/YOU5sCUDXy9RjtOx6r+bcOaYy7Iq7XoPUh++c3bxi6GFvxkiI0uneFr4HwxhXIc
 j7hvJ9WGwjmKNCDDBlaMygLGHtV4fSsSn0vu+bxdX9eMt685+ZOmvxbKAGpSA7ZXJrEI
 FciKrPg8YFGoIJYzvEP6H5mZBqyvi8CWQMxLr0YGCMRHfdxSaxQSuPB5xWd2oDE0ZYD0
 auakyNFUI6tprd8HjA2iDXpLJHwz+O67dIhA1cMU52bwq+3O/mzvkk1SJC91wuyO8sq0
 CR1BiKKCp2zZtLOstX22i4da227YJ6BmWPz2WPU7LMNyWJIIA1hDnV2CcLd7S5KEt57f
 J0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/FK4XDdiJG7RHelAiRbUeIilzHxima3ZnBYQtTcGTM=;
 b=LyS2WvKQo2KXKohJHALMQlW+1FwoFzkjkEeeb8j5slJKi6qkEaSasjqcz57ZsOSKRT
 NFGXMOMgT1zKtXsiih+IZJsWQyIWskjMQj6V1R/JuS6jBQ56yL4wJWt5637IICFze06T
 OBaNH3DlaXiun+9/vKNjudXuk0v90o3LKOf74fJxNws7juI3Ofyb3vdr9dAUhDezz25q
 RghJNv5+rH3oVXfyU2zlYnu8MWV+BVl83OnBjoGVv41OmZA7xYM0FgjJQ/dZGfTBHUey
 1k1TJtT/5hdu6j1JnD1Kk5mGnGVuLpIJqI7Bm30JShVghrC3Hi7Ji8kHHl75APPab5KM
 ci2A==
X-Gm-Message-State: AO0yUKW8tka9Iz2vHgnDvpcWj9+R2AevSzNMdmesfNIQwZlGUSRd6eHV
 fSvgG8iaK/cHTycj9jNeLNBg8Q==
X-Google-Smtp-Source: AK7set9AHbXl8hfBqiLLt4rwgSl6LAL9ryXlTL1jjQF9APwkOIGnK8WH4nBitAYEfRh3gYQQ4Cs6Dw==
X-Received: by 2002:a05:600c:2b46:b0:3dc:557f:6123 with SMTP id
 e6-20020a05600c2b4600b003dc557f6123mr17732128wmf.1.1676242335157; 
 Sun, 12 Feb 2023 14:52:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm16780161wmq.28.2023.02.12.14.52.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 05/19] hw/char/serial-pci-multi: Replace DO_UPCAST() by
 PCI_MULTISERIAL()
Date: Sun, 12 Feb 2023 23:51:30 +0100
Message-Id: <20230212225144.58660-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Use the PCI_MULTISERIAL() QOM type-checking macro to avoid the few
DO_UPCAST(PCIMultiSerialState) calls.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/serial-pci-multi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index cd5af24bd2..6f4491210d 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -58,7 +58,7 @@ struct PCIMultiSerialState {
 
 static void multi_serial_pci_exit(PCIDevice *dev)
 {
-    PCIMultiSerialState *pci = DO_UPCAST(PCIMultiSerialState, dev, dev);
+    PCIMultiSerialState *pci = PCI_MULTISERIAL(dev);
     SerialState *s;
     int i;
 
@@ -97,11 +97,10 @@ static size_t multi_serial_get_port_count(PCIDeviceClass *pc)
     g_assert_not_reached();
 }
 
-
 static void multi_serial_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-    PCIMultiSerialState *pci = DO_UPCAST(PCIMultiSerialState, dev, dev);
+    PCIMultiSerialState *pci = PCI_MULTISERIAL(dev);
     SerialState *s;
     size_t i, nports = multi_serial_get_port_count(pc);
 
@@ -190,9 +189,8 @@ static void multi_4x_serial_pci_class_initfn(ObjectClass *klass, void *data)
 
 static void multi_serial_init(Object *o)
 {
-    PCIDevice *dev = PCI_DEVICE(o);
-    PCIMultiSerialState *pms = DO_UPCAST(PCIMultiSerialState, dev, dev);
-    size_t i, nports = multi_serial_get_port_count(PCI_DEVICE_GET_CLASS(dev));
+    PCIMultiSerialState *pms = PCI_MULTISERIAL(o);
+    size_t i, nports = multi_serial_get_port_count(PCI_DEVICE_GET_CLASS(o));
 
     for (i = 0; i < nports; i++) {
         object_initialize_child(o, "serial[*]", &pms->state[i], TYPE_SERIAL);
-- 
2.38.1


