Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4676AAAB4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 16:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYTmz-0003R2-RH; Sat, 04 Mar 2023 10:27:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmy-0003Qk-6T
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:12 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pYTmt-0008AU-3c
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 10:27:11 -0500
Received: by mail-ed1-x529.google.com with SMTP id s11so21587489edy.8
 for <qemu-devel@nongnu.org>; Sat, 04 Mar 2023 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677943625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2uxuGNb6ksFRC5cQ94kDdGIszx60jdE3syJ7+PyW08=;
 b=F1n4u/rqptZMue1/n9z6l4XuaKGGlUxAYUPl8ZXIvNIo1rECTx1fwSeiDFCW40k0qJ
 0zAR48gD1vdUdQ5J8FkxE4OHOtK0y/4pv64oCkIPQKm2jYn7ztLhBucbq7xABWSFDshA
 5/zBVWrqANkGKKpFIF9GRaRxE6rHL2HXPe4nArMS9OiQ2BD56RXRrnL1oCwsRJr5MsR6
 X5pzBELO5sZAJpHkYOLkKjz5il3WqMij7PkiXiLh4i6VNMseY9riuXgFYNCi7UhL2xtV
 9raojLZrpUBe1YBhy+8+YvLGVzqGvLxG3SBYD9RYYtV5wNzlJYeUgKImvAZZywmMbTew
 UK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2uxuGNb6ksFRC5cQ94kDdGIszx60jdE3syJ7+PyW08=;
 b=00MGLqEQgyA9V8NLt0nWgqfNyBSr2dy5lZ41R7NoeGMO3JXnGr16LW5my5C9mKOAQM
 gBQY7F64fNNUuKe+uQpwbH7wF0sVVCQGNK6ywyPEKa8Q1QrVW1Zned8O9asLrcZd6vOr
 m5cmqnux/kfsolTEZMwKc1K4wbxAis3lfWtBtETcqRAVNYYCpEUsytUUbiu41BXJAheq
 KlqKr1UDBzSjWxfUuaUrotXBWeX6TONQ9TRcCk/AH2ibhKHlQZYT2gaVDQMxonxz7e2T
 plNS/B0TSrxCJa/PIahKkJmofIX1TmeOKyoHpnJbSe5SyAe2vS7TlA/9qwE8BYgaBCKy
 h/vQ==
X-Gm-Message-State: AO0yUKU2N+Pc2BGACcA4ajscecx0gsLPvv1ZEJf28d46/2UnOYO4uvSF
 1GdJsBYjD3SuB0gX/XBdSjgygt17yUo=
X-Google-Smtp-Source: AK7set+ehTtQmbicv2ozpO9NFAVmYRLkOvUFd4OXZMXO4qr2sME19elUprZS4SkNqWixCZpq2pM8kA==
X-Received: by 2002:aa7:cfc8:0:b0:4b6:821e:1859 with SMTP id
 r8-20020aa7cfc8000000b004b6821e1859mr9201026edy.7.1677943625258; 
 Sat, 04 Mar 2023 07:27:05 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-004-175.77.183.pool.telefonica.de. [77.183.4.175])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170906398700b008dd6bf721c2sm2170540eje.106.2023.03.04.07.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:27:04 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 09/13] hw/pci-host/q35: Turn PCI hole properties into class
 properties
Date: Sat,  4 Mar 2023 16:26:44 +0100
Message-Id: <20230304152648.103749-10-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304152648.103749-1-shentey@gmail.com>
References: <20230304152648.103749-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

These properties are class properties in i440fx. No need to handle them
differently in q35.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 23df52a256..afd192cc2a 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -207,6 +207,22 @@ static void q35_host_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name = "pci";
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
+                              q35_host_get_pci_hole_start,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE_END, "uint32",
+                              q35_host_get_pci_hole_end,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
+                              q35_host_get_pci_hole64_start,
+                              NULL, NULL, NULL);
+
+    object_class_property_add(klass, PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
+                              q35_host_get_pci_hole64_end,
+                              NULL, NULL, NULL);
 }
 
 static void q35_host_initfn(Object *obj)
@@ -224,22 +240,6 @@ static void q35_host_initfn(Object *obj)
     qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
     qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
 
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_START, "uint32",
-                        q35_host_get_pci_hole_start,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE_END, "uint32",
-                        q35_host_get_pci_hole_end,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
-                        q35_host_get_pci_hole64_start,
-                        NULL, NULL, NULL);
-
-    object_property_add(obj, PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
-                        q35_host_get_pci_hole64_end,
-                        NULL, NULL, NULL);
-
     object_property_add_uint64_ptr(obj, PCIE_HOST_MCFG_SIZE,
                                    &pehb->size, OBJ_PROP_FLAG_READ);
 
-- 
2.39.2


