Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602F693EB9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSxJ-0000lW-9t; Mon, 13 Feb 2023 02:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxH-0000hJ-53
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:51 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxF-0001ny-Hc
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:08:50 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o18so11074366wrj.3
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t/FK4XDdiJG7RHelAiRbUeIilzHxima3ZnBYQtTcGTM=;
 b=L3aKW+LchH1HrxXhm5hLdl6Zq1Y/TuSg7p65IwM8x599O5chOKRo2cUdBzgpL519lq
 7o5tG7wWtNV57jlnCgQCq2dvCfjA0/JCaInFDFS9pTx3kZMQa0VVhuBd3mKu4bC33kz5
 l4tt4yr4z3i6sXmUpp1OX664e+uBYDiq56J30kLdmtpulGaa/YUZnbSDshHygCMdkoWW
 Rh7mNiEtbepJX76jMBqcilhlDo2iK3OuSrBlIi6NErF4rXJQJdqf1v1wL0kA0qMFOvkO
 LagTTyG4rnys7duHzgiIqiEBYPerTzXDDDxdVKoKZk77h/wpGzZxymkxJKTF7ALN7B2U
 AeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t/FK4XDdiJG7RHelAiRbUeIilzHxima3ZnBYQtTcGTM=;
 b=TMzTArKuiHH6FxwLdd5pmRlBPOv/H+YztmhG3SCqXZz01x2X8dAKXB18v2nwfxDpiN
 l6mjMpA5Fv9h+z7FbgEJ3HQ/brYMxG/iLOHGBIPmy8r7YaAx34XI6bN0MclLCODe319s
 JTlPxhuJNH7XCzksLYnqD8hpblMHyCAPi49kPZn0mYrGNeFAPKagjww9VexBxdxy9n/8
 MA6lSRMWF79pgcgy9XHFkYuiOMEkZcskmLk49z8wME6e60J1GYMN2JkO5Zyw06dSDKgz
 y/gtJLCJDPJwPw6VO+4C3NvqsgZLbowfYits29gbqRqsqUD+9GKpH/15bqPTW+Z/jMes
 u1LA==
X-Gm-Message-State: AO0yUKUV1jy7rhWRBDKt1YCfFEcJhQer83SU/Uu9Igbwi01sO4xlMdXa
 hAD7FIYeNFj085V17cSCxpFxl9c3wjM+n9Wk
X-Google-Smtp-Source: AK7set8xC9NZ7k58w3cn4+LDSvaO0CG9m/Wmpxf9i4G9HPbKKD8mZYddYnx6qNuivgBeWYNCN/Baxw==
X-Received: by 2002:adf:ffc3:0:b0:2c5:4154:9f32 with SMTP id
 x3-20020adfffc3000000b002c541549f32mr8981840wrs.65.1676272128612; 
 Sun, 12 Feb 2023 23:08:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adfe887000000b002c551f7d452sm4453690wrm.98.2023.02.12.23.08.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:08:48 -0800 (PST)
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 05/19] hw/char/serial-pci-multi: Replace DO_UPCAST() by
 PCI_MULTISERIAL()
Date: Mon, 13 Feb 2023 08:08:06 +0100
Message-Id: <20230213070820.76881-6-philmd@linaro.org>
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


