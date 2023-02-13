Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C4694F99
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoF-00014i-5E; Mon, 13 Feb 2023 13:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoA-0000zA-FK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:10 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdo8-0008P1-KE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:10 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3521092wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yz6IoxjWNiku5kCSpBghWuT3DdtWubTdcdH43JCupO0=;
 b=jI1P/tOjW9ruO26diB/wqKvoc4LbkvFcbqid/SNBffoSTAE8C5sMngFDii/eXeDXID
 8Gg+AOi/4iEjqTyKkMG11hVagnBMxrLKPpVhoQk74yTap6wcWbjZX3D5oMZJACT2RnnV
 aQOFMecmRpsqqgDCMneXD2h7zJJFeDXCP4nwMVWwxhogdUpG63yIwW+rx/Crgrq0r08p
 Kdn48Oq5VVJ7BysstFHyujnqIOrP+p57y4ia5GPkxoOkeSn67E1CHt3Ucy5WTq3DA8Ud
 xb0iPbPDsjdBG6apMN1Ddj0zzYbq80DGcOmgrBVQVOrrdrevY3w7mHc+yXIeOcgstu+H
 CVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yz6IoxjWNiku5kCSpBghWuT3DdtWubTdcdH43JCupO0=;
 b=MigPJRKL7bvGU3gquy7TlVMTbp5TRwIY7Tq0/hshd/UDe7VJ/Cft/4k5P6fuOezqBV
 CUSE4Pzu5/BLb3hmJQFBDAFaebQGn/LBB4atGg4jJVlBYH4r6mlknNYpUSaPpWkXC/qx
 yN0dHkkTkS/774/GANZC4Bo7LIct6bFz70ZfCX+PY3/F7uFA0u/cqWYCpYsBGHuCxC5B
 LPtjqTJzRiwqZgdaErDtjSNiwoqFl/DfykIFR+EeDmLhBWfzRQrV3mOiMQk4/h7DKQav
 PMIiNn2ZUDMsP5heJTberdCK2FABJNZFFE4Wo+9J6Peb6zSMX68EWVd9C2F2Rvztv3dM
 rVIg==
X-Gm-Message-State: AO0yUKX8e3LzYkyxhVK1/vuKboxtErqLGZQxuXRlgffrw6J4+MlSwgJE
 xo7NQ/VkUSixDzNytrXG9fXDugeaCF6A1Ila
X-Google-Smtp-Source: AK7set+0Pp4E918vOEyEA7jUtXVkZeCMxMXElateD+1e4UJKmouCtmYWmVAPEdGnwUbpYe14OHoEjg==
X-Received: by 2002:a05:600c:1895:b0:3dc:4aa6:a8a9 with SMTP id
 x21-20020a05600c189500b003dc4aa6a8a9mr19187855wmp.7.1676313847532; 
 Mon, 13 Feb 2023 10:44:07 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a05600c445200b003de77597f16sm16157583wmn.21.2023.02.13.10.44.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 05/14] hw/char/serial-pci-multi: Replace DO_UPCAST() by
 PCI_MULTISERIAL()
Date: Mon, 13 Feb 2023 19:43:29 +0100
Message-Id: <20230213184338.46712-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
index 704be5c294..d660b6fa97 100644
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


