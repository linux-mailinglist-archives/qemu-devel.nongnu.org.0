Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6032F003
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:28:14 +0100 (CET)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDJF-0005Xr-Pn
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCZ-0006b1-4W
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:19 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCW-0007D5-7F
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n11-20020a05600c4f8bb029010e5cf86347so1030186wmq.1
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EVB7ePXcQjZw4uETcObG8sFKSRsuTJl6nrIlWHavPsM=;
 b=aG9oVS0J+UTQN8dM4gU8J5RpHY+hYafow5pj1sGhP/3CZSOamMIXjwFo9Y6Y0xSKmQ
 d8gRJkMZYynh49Ms6nmbLobZU4u6Rc/R7iJrkPIyp9sTn/n3+Z6vBOeUk85Zfgr/WGF7
 o8rIVRtgU7kOSGBA7/yPLazVDIqvAdo4HAd1vyBMwd8arTN4hoB7qxH2ICA2uuN1zz+n
 9THqZ+LtWITJam9ORnOzrubrUpbp2ToOVI+bA13QnxsUVH8Rz8NUfVu/Nayd4hMG1YXf
 T03feu32pmwuuFGqf8WlCo14pnCMr+AfZMK4VJZ46PkngOplwqwdfpJp3qfjAnymVDBr
 VtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EVB7ePXcQjZw4uETcObG8sFKSRsuTJl6nrIlWHavPsM=;
 b=nxVZDvCDnjaAc+iMuJNeaoZy7j6chlNIBov5LdwmMffWG1ExfWxq1jq4HX7QeBuFFh
 pEQKeuSpYDi00LarqXHTAzm6jtvJqefLgLptcccdbDoBuQjdLr6MnyqfABjo2fa5Bpny
 ksI6unyiChEERF8dvYyQodJRmLlWk6ZFRf1kszoRq70CB1MTmSael4pfU8ixfqGdvemp
 Ls6T1f3OfTAruuhu7N1A3seYlOALbit0wb3bTS2SPXNc9xzWiZ+afLRqsIES6Z05vVgR
 M8j2mfqlLd2oS62wtM/wAltzSzNTYDiPggmUT3FyUORxwNTh9FZVUy54OHWVAP8zncQk
 JVQw==
X-Gm-Message-State: AOAM533crgsGs/JY3RYlopqF5/MWB+3HuJtwn1wbk6XI8sdLxZh5NnwF
 MXK5OPdyLyJNHkL/BD34AyaWpVgRI2k=
X-Google-Smtp-Source: ABdhPJydriQOE7rQM05g+B3S0waULSetSM/u08Tovb1KocXPYf4PZ6z6UPytj+2SdsJPxsBB5XB3FQ==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr9514534wmr.179.1614961274200; 
 Fri, 05 Mar 2021 08:21:14 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 1sm5150022wmj.2.2021.03.05.08.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/mips/gt64xxx: Initialize ISD I/O memory region in
 DeviceRealize()
Date: Fri,  5 Mar 2021 17:21:02 +0100
Message-Id: <20210305162107.2233203-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISD I/O region belongs to the TYPE_GT64120_PCI_HOST_BRIDGE,
so initialize it before it is realized, not after.
Rename the region as 'gt64120-isd' so it is clearer to realize
it belongs to the GT64120 in the memory tree view.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 588e6f99301..6eb73e77057 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1196,6 +1196,14 @@ static void gt64120_reset(DeviceState *dev)
     gt64120_pci_mapping(s);
 }
 
+static void gt64120_realize(DeviceState *dev, Error **errp)
+{
+    GT64120State *s = GT64120_PCI_HOST_BRIDGE(dev);
+
+    memory_region_init_io(&s->ISD_mem, OBJECT(dev), &isd_mem_ops, s,
+                          "gt64120-isd", 0x1000);
+}
+
 PCIBus *gt64120_register(qemu_irq *pic)
 {
     GT64120State *d;
@@ -1214,8 +1222,6 @@ PCIBus *gt64120_register(qemu_irq *pic)
                                      get_system_io(),
                                      PCI_DEVFN(18, 0), 4, TYPE_PCI_BUS);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-    memory_region_init_io(&d->ISD_mem, OBJECT(dev), &isd_mem_ops, d,
-                          "isd-mem", 0x1000);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
     return phb->bus;
@@ -1270,6 +1276,7 @@ static void gt64120_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
+    dc->realize = gt64120_realize;
     dc->reset = gt64120_reset;
     dc->vmsd = &vmstate_gt64120;
 }
-- 
2.26.2


