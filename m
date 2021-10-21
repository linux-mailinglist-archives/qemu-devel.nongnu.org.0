Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F75B43666C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:39:03 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mda9m-000838-D4
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx5-0000Ft-Le
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:55 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx3-0002az-IT
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:55 -0400
Received: by mail-pl1-x631.google.com with SMTP id i1so629087plr.13
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n/Pvx/0svSuMmT8RY9aB1ty9PqQ7g1AslPNBWP29bj4=;
 b=IZkgbko5fuzLbo+t9lofjVjBRx3O1FNT6lYKUHkO4DFgHcY2zFU1SHEXhwJbsQiE82
 501peJCttK2CWxkblzku8Suqv6Dx5TPgh2O+vgQ21Rj+bBUR+Nom+MOYfXmauUu/fm+Y
 nJDJ96RD9dasfekVVE5BvJzhWeH05Bua9JcTI+HubEr8kq+3MyLZuFYwUxTe8/e7AcLd
 Q5FybFfFqiGbm3TS2Oc9Xh/4vXZXhFZ6UiC+4F8KHFVKWjEOTSjHqiL/f9icMTjpfErP
 UQo1yilSPUp0URy1Z3xhZ/z+o/ADeACJaouwS0Ce8nHFdjx3x2X+gIKmHNPCa2Ig5fY0
 FaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n/Pvx/0svSuMmT8RY9aB1ty9PqQ7g1AslPNBWP29bj4=;
 b=EcEUSWYN4GEo0tvC+F96ur05/zCvWO46cZZcqxV1M5YkMaoGcbC6D8sv6LFG7cLrj6
 q3Yj/YmHe8UtdbHGEEzwsqP+YHvdL/WBla48T2IzhAcsGZC+3edUmyagZRaYjtSTKjo0
 58sPP0H1klrowUeod+rbmfBfEP5RrF2Ghpl90Pqc/UI7f6R/JtxQMVu3eg/6+57kYEuI
 vDgoLcqeSEBrWZjPpjt18Eeke4T3tMP9Sw1M+B5NSqu1MnuBw64ggaAJ5QeAbkitNb76
 ZXbFYNyhBz8efmc7QPiQXAsgEmF562foWFCJQZHgKg6fcv4exTr0JYXqFmu62XF0oZlg
 dxRQ==
X-Gm-Message-State: AOAM531KId5P+A+5+wEMCV/0KOgkl24Sd9M0W2RoLttwOBMBVVKnFrS2
 CJsZORmZiocF+qXREUem1QZ0t8ydp1HdTQ==
X-Google-Smtp-Source: ABdhPJwo92IBhyhs6QSMFixTxM4tafxvtt4rjltSBAwnHtGlVWP4ti8CujKDJ0xabG4Ps605A1GsSw==
X-Received: by 2002:a17:903:234d:b0:13f:3180:626a with SMTP id
 c13-20020a170903234d00b0013f3180626amr5869978plh.49.1634829952126; 
 Thu, 21 Oct 2021 08:25:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/19] device_tree: Add qemu_fdt_add_path
Date: Thu, 21 Oct 2021 08:25:35 -0700
Message-Id: <20211021152541.781175-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Andrew Jones <drjones@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
also adds all missing subnodes from the given path. We'll use it
in a coming patch where we will add cpu-map to the device tree.

And we also tweak an error message of qemu_fdt_add_subnode().

Co-developed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211020142125.7516-3-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 8a2fe55622..ef060a9759 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
 int qemu_fdt_add_subnode(void *fdt, const char *name);
+int qemu_fdt_add_path(void *fdt, const char *path);
 
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b621f63fba..3965c834ca 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
     retval = fdt_add_subnode(fdt, parent, basename);
     if (retval < 0) {
-        error_report("FDT: Failed to create subnode %s: %s", name,
-                     fdt_strerror(retval));
+        error_report("%s: Failed to create subnode %s: %s",
+                     __func__, name, fdt_strerror(retval));
         exit(1);
     }
 
@@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
     return retval;
 }
 
+/*
+ * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
+ * all missing subnodes from the given path.
+ */
+int qemu_fdt_add_path(void *fdt, const char *path)
+{
+    const char *name;
+    const char *p = path;
+    int namelen, retval;
+    int parent = 0;
+
+    if (path[0] != '/') {
+        return -1;
+    }
+
+    while (p) {
+        name = p + 1;
+        p = strchr(name, '/');
+        namelen = p != NULL ? p - name : strlen(name);
+
+        retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
+        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
+            error_report("%s: Unexpected error in finding subnode %.*s: %s",
+                         __func__, namelen, name, fdt_strerror(retval));
+            exit(1);
+        } else if (retval == -FDT_ERR_NOTFOUND) {
+            retval = fdt_add_subnode_namelen(fdt, parent, name, namelen);
+            if (retval < 0) {
+                error_report("%s: Failed to create subnode %.*s: %s",
+                             __func__, namelen, name, fdt_strerror(retval));
+                exit(1);
+            }
+        }
+
+        parent = retval;
+    }
+
+    return retval;
+}
+
 void qemu_fdt_dumpdtb(void *fdt, int size)
 {
     const char *dumpdtb = current_machine->dumpdtb;
-- 
2.25.1


