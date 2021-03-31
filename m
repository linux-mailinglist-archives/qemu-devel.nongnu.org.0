Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70658350439
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:11:56 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdRj-00073k-At
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOq-0005OU-3P
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:38536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lRdOn-00063w-BG
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id v10so9537675pfn.5
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnE38h0nw8TlzK18LZ9xJMupeRckiPvJq2XE3VXd/tw=;
 b=YFv2roImkgrs2B6MghpbPXwn2EnnND4ZqnvGU3clX0M0TAbZ8K7sbvCwGhqGdeFBjv
 5aToT9FhSfUsb8biKaGiIFcZdS5bzo94pMqFRq48JjApsHlY5axzKapsbdHZZUYzZwKD
 O0GJiS4KV6X+tdVdqY8+v/IkIoaMr1lcW+pf3c6Y+UdaWM3/5nBFd5YxN2iN9J6T3WP4
 QJhZHiio9II1IzPwiq6AbGqsKpxr47P6G4lvg2qLfMEVNVGMHYS76F16Ca3oHq3kzlRE
 A85ew7E7/BuQlgjcf3FUmekyXko+Ndm9bKzNBqKiOzFl9F35UQPGCU/GvoAHXurdhMAV
 VEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnE38h0nw8TlzK18LZ9xJMupeRckiPvJq2XE3VXd/tw=;
 b=nZ2A2e3K6MXxQI6GBSQjaSJ6o3ey7++4kga/448HJaijHxYoYiCoxXP9EDdyAGoM+a
 DZj8/Be7djKYSHp8Q0H2Vr4OnSMkxnfXa7H/nZoG5M3sJaga7uqgRoRWJuHeANsbkHuw
 KV00TklBKyR7V+orLMy+rbiyL6wXmKQTm9bMQzx/czd31CFaCdqnzL7wBN+XsxItwgCF
 AvbB9lxAb0E1TJ7VJDtet2WjCvvaXqk9Oj7f501uCK9oeoI0okcDEbHSD1pkv6bTw0/D
 QdPc73uaZhjVXkmhgrFw8F0/stNquMynWENofp0XYQrWmNzr4dljgvyWPqodrgLy6GCd
 sgYg==
X-Gm-Message-State: AOAM533ZAY+FrVPxfexCC6P/3UGrRN8BgBNZUaDa/auJ5226oWSLVU58
 uhN2CAzPy4CIauVYBANfPX9qGWsSTm/ovw==
X-Google-Smtp-Source: ABdhPJxbE8RUZf8/fgxiUjDtpk3fcfNX5aILcYvy4nYYIWSDyH2KrEnGtJvFGMXTmotMWniOu7CtZg==
X-Received: by 2002:a63:390:: with SMTP id 138mr3964055pgd.8.1617206931293;
 Wed, 31 Mar 2021 09:08:51 -0700 (PDT)
Received: from archlinux.. ([161.81.68.216])
 by smtp.gmail.com with ESMTPSA id a13sm2886131pgm.43.2021.03.31.09.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 09:08:50 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Subject: [PATCH 3/3] pcie_root_port: reorder procedures in realize()
Date: Thu,  1 Apr 2021 00:08:35 +0800
Message-Id: <20210331160835.160670-3-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331160835.160670-1-tom.ty89@gmail.com>
References: <20210331160835.160670-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=tom.ty89@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: marcel@redhat.com, yamahata@valinux.co.jp, Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a bunch of pcie_cap_*_init() in the realize method of the
pcie root port devices that do not have return value. They can probably
be called after the slot is successfully added to an created chassis
(i.e. the slot number to use is final).
of them makes use of the slot number.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 hw/pci-bridge/pcie_root_port.c     | 10 +++++-----
 hw/pci-bridge/xio3130_downstream.c |  9 +++++----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index f1cfe9d14a..2bd2d02ccb 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -92,11 +92,6 @@ static void rp_realize(PCIDevice *d, Error **errp)
         goto err_int;
     }
 
-    pcie_cap_arifwd_init(d);
-    pcie_cap_deverr_init(d);
-    pcie_cap_slot_init(d, s);
-    pcie_cap_root_init(d);
-
     pcie_chassis_create(s->chassis);
     rc = pcie_chassis_add_slot(s);
     if (rc < 0) {
@@ -104,6 +99,11 @@ static void rp_realize(PCIDevice *d, Error **errp)
         goto err_pcie_cap;
     }
 
+    pcie_cap_arifwd_init(d);
+    pcie_cap_deverr_init(d);
+    pcie_cap_slot_init(d, s);
+    pcie_cap_root_init(d);
+
     rc = pcie_aer_init(d, PCI_ERR_VER, rpc->aer_offset,
                        PCI_ERR_SIZEOF, errp);
     if (rc < 0) {
diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 04aae72cd6..b7a92693ee 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -92,10 +92,6 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
     if (rc < 0) {
         goto err_msi;
     }
-    pcie_cap_flr_init(d);
-    pcie_cap_deverr_init(d);
-    pcie_cap_slot_init(d, s);
-    pcie_cap_arifwd_init(d);
 
     pcie_chassis_create(s->chassis);
     rc = pcie_chassis_add_slot(s);
@@ -104,6 +100,11 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
         goto err_pcie_cap;
     }
 
+    pcie_cap_flr_init(d);
+    pcie_cap_deverr_init(d);
+    pcie_cap_slot_init(d, s);
+    pcie_cap_arifwd_init(d);
+
     rc = pcie_aer_init(d, PCI_ERR_VER, XIO3130_AER_OFFSET,
                        PCI_ERR_SIZEOF, errp);
     if (rc < 0) {
-- 
2.31.1


