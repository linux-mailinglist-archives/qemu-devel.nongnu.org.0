Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F914EA24A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:18:10 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwkb-0004TU-7j
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:18:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiL-0001XU-9m
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:49 -0400
Received: from [2a00:1450:4864:20::134] (port=36588
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiJ-0003p3-86
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:48 -0400
Received: by mail-lf1-x134.google.com with SMTP id bt26so26965278lfb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3HqMSA/clTPoDdP4aVujnhVnvcdeuLUE6tAeAz9JVuU=;
 b=U6KwcpitTnJEmpICCxE8RxZKMC/V+mE9+UelVwsmhskRFAZtZOkY7CEeYjVea8bSY9
 lbxZnh/cWDpRyQ7PdRgO39GzYvazNzWUqby3EpCwJcKjxUzYndsN/2IMAvovxdH0uHJs
 RzgMgx8M43eSCaD9aNAu9blbkWHgMOLyM7UmXIIfaY1pX1R0W1DOaXGQ34YU6K2tNp4s
 QHueG8Ao7KfgkqQPGVH6Zu/f3xaVJBtXw++ScJw1hCdMNCpverL1l2x7P40egQxMlJtW
 ikZyb6GxonPdNVpGPD280sUPm6P0GKrsdD0YuAahSaF43fiY6HRrOjdK0IiVTP+bXNwg
 7tTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3HqMSA/clTPoDdP4aVujnhVnvcdeuLUE6tAeAz9JVuU=;
 b=w3KtFaWzMgbuvbRfs2SYntVNdJWJ7gzTiaTZOTQHRjm000sDRtxyn6/YUpkuDZ7wf8
 GH3KZBdNMQAF4p981RHjP2rfNCBbmkVQE+TorFhAKJLVVplje7MIoovQuI/C7iECaQM/
 jNWLNY8Nw2QISyrOD4Zr/ZqhMO0Xjwtriv6i4s2SgS579XEfZaZEfwXcZ4qfgCfd+sQ3
 UFX50OrZrjjHfVRa2HLunDtrh80HMh1qdihBxTR6r0zYCGTNQSXPoS/dJAbGvU9E/RKa
 NYejOz9wITzjPKzlx7O/94k6hrmWrGh0ssVdIBPS73Ma15+gm9J3Y/QWAj0NRT3S4FP2
 uMMg==
X-Gm-Message-State: AOAM5339EaDUnulTqoWhGsXzlNv3zDVAJ9BJKzIxrFIW+dlLK8nstcOr
 l+NtAbzCnKT794P7dSrpquK+rMEzwmzBoA==
X-Google-Smtp-Source: ABdhPJyCpmZB7Ch4bAB17JknwzryvwUxDzNqWd2dptoppnJuRzncbpCAPJUrNYAn2OY2pDUaNn443A==
X-Received: by 2002:a05:6512:c29:b0:44a:865e:19c4 with SMTP id
 z41-20020a0565120c2900b0044a865e19c4mr11389792lfu.306.1648502144416; 
 Mon, 28 Mar 2022 14:15:44 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:43 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/9] pci: add null-pointer check
Date: Tue, 29 Mar 2022 00:15:32 +0300
Message-Id: <20220328211539.90170-3-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x134.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call pci_bus_get_w64_range can fail with the segmentation fault. For
example, this can happen during attempt to get pci-hole64-end immediately
after initialization.

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 hw/pci-host/i440fx.c | 17 +++++++++++------
 hw/pci-host/q35.c    | 17 +++++++++++------
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index e08716142b..71a114e551 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -158,10 +158,12 @@ static uint64_t i440fx_pcihost_get_pci_hole64_start_value(Object *obj)
     PCIHostState *h = PCI_HOST_BRIDGE(obj);
     I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
     Range w64;
-    uint64_t value;
+    uint64_t value = 0;
 
-    pci_bus_get_w64_range(h->bus, &w64);
-    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
+    if (h->bus) {
+        pci_bus_get_w64_range(h->bus, &w64);
+        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
+    }
     if (!value && s->pci_hole64_fix) {
         value = pc_pci_hole64_start();
     }
@@ -191,10 +193,13 @@ static void i440fx_pcihost_get_pci_hole64_end(Object *obj, Visitor *v,
     I440FXState *s = I440FX_PCI_HOST_BRIDGE(obj);
     uint64_t hole64_start = i440fx_pcihost_get_pci_hole64_start_value(obj);
     Range w64;
-    uint64_t value, hole64_end;
+    uint64_t value = 0;
+    uint64_t hole64_end;
 
-    pci_bus_get_w64_range(h->bus, &w64);
-    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
+    if (h->bus) {
+        pci_bus_get_w64_range(h->bus, &w64);
+        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
+    }
     hole64_end = ROUND_UP(hole64_start + s->pci_hole64_size, 1ULL << 30);
     if (s->pci_hole64_fix && value < hole64_end) {
         value = hole64_end;
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index ab5a47aff5..d679fd85ef 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -124,10 +124,12 @@ static uint64_t q35_host_get_pci_hole64_start_value(Object *obj)
     PCIHostState *h = PCI_HOST_BRIDGE(obj);
     Q35PCIHost *s = Q35_HOST_DEVICE(obj);
     Range w64;
-    uint64_t value;
+    uint64_t value = 0;
 
-    pci_bus_get_w64_range(h->bus, &w64);
-    value = range_is_empty(&w64) ? 0 : range_lob(&w64);
+    if (h->bus) {
+        pci_bus_get_w64_range(h->bus, &w64);
+        value = range_is_empty(&w64) ? 0 : range_lob(&w64);
+    }
     if (!value && s->pci_hole64_fix) {
         value = pc_pci_hole64_start();
     }
@@ -157,10 +159,13 @@ static void q35_host_get_pci_hole64_end(Object *obj, Visitor *v,
     Q35PCIHost *s = Q35_HOST_DEVICE(obj);
     uint64_t hole64_start = q35_host_get_pci_hole64_start_value(obj);
     Range w64;
-    uint64_t value, hole64_end;
+    uint64_t value = 0;
+    uint64_t hole64_end;
 
-    pci_bus_get_w64_range(h->bus, &w64);
-    value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
+    if (h->bus) {
+        pci_bus_get_w64_range(h->bus, &w64);
+        value = range_is_empty(&w64) ? 0 : range_upb(&w64) + 1;
+    }
     hole64_end = ROUND_UP(hole64_start + s->mch.pci_hole64_size, 1ULL << 30);
     if (s->pci_hole64_fix && value < hole64_end) {
         value = hole64_end;
-- 
2.31.1


