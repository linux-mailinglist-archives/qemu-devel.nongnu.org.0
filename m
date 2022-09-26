Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1215EA82F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:17:37 +0200 (CEST)
Received: from localhost ([::1]:48396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocovQ-0004nP-LU
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-00021R-Fr
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKD-0005e4-3Y
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id y5so10293546wrh.3
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=OSHuYNoeAhBgevG45a7IfEUr6E+OClE/MaFvqiZpjFY=;
 b=hB8QKccFUs+W/rKK6Q9jpjwcCxw+IyK3ZF+NUg9Rf6v8tdHgjuKJ35F0ehmBOdb3bx
 0It0KSv1mP4RgvXQ6ueAEyeVnJVP1Ck9E8dDvikFJiiILAuWvkCEBSjFVLFIhU59AtMf
 yQ/FBwFSK6a0bxLsuagHLQx0unb9mtj6ghoctxw4uAAQp1cU1tvIWRu7esZ6/SFeQP4V
 9jqLmnU/N/bSzOrOQQI3qb48hT/Xs/EZzYCO9nAFQIsnX9k9SUi1Gn8yvnRH2Z65Q2uc
 hN9pcQrGlGJJXonqfyMy7RTdpmoRV4aMsYyRCQauSBerXEIw9/5r8urU1eM8jOrTi0lg
 Wnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=OSHuYNoeAhBgevG45a7IfEUr6E+OClE/MaFvqiZpjFY=;
 b=EM/xWKVFkM2lZyWVS988akIEZcYvS383KjemlB/Zfg9s9EhnnrfEFqV8Y8NtDZ8oq8
 5y77l9u2IIKr2TXM9JXvqhPrZY0oPT5ebCx+ViHTAquZUQEF0pIMrg2DUQ/X5cCXsY/4
 5EX0XroLBgzQZchoigKD+U3UxkdKd3TX+I8qmMFtkTATTs3zA2mX78AAYRzTHNN5c63G
 ji2jbD7DVTqzb3sAOkcSiKc2GHtgnHdvqYwFb2AMXhQBjTkpFCZLTwqWfTGZDEV5Bj+3
 xvb3FXB4svUJU7z2cIb0hBiz+NvBZWLwl+oXLWyaH/u2OfKVLwH673hXOGhSO21c/Y14
 Nh8Q==
X-Gm-Message-State: ACrzQf23RKYuehM6BN0DaCgL38XolOc2gt2IkE1rTCnAyTSWiPJeYd28
 lzamGV34ziVg2UMvhbiCmjbEFg==
X-Google-Smtp-Source: AMsMyM526HhkvuUamx8nwjtwJoEWXYouczVNiAO/HNiW44eGKaw335K92/QCxcvc2RnrSh9yOs2SKA==
X-Received: by 2002:a05:6000:124f:b0:228:8713:ced9 with SMTP id
 j15-20020a056000124f00b002288713ced9mr13755413wrx.198.1664199546384; 
 Mon, 26 Sep 2022 06:39:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z10-20020adfec8a000000b0022afe4fb459sm14283990wrn.51.2022.09.26.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C3A0A1FFB8;
 Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Date: Mon, 26 Sep 2022 14:38:54 +0100
Message-Id: <20220926133904.3297263-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We currently have hacks across the hw/ to reference current_cpu to
work out what the current accessing CPU is. This breaks in some cases
including using gdbstub to access HW state. As we have MemTxAttrs to
describe details about the access lets extend it to mention if this is
a CPU access and which one it is.

There are a number of places we need to fix up including:

  CPU helpers directly calling address_space_*() fns
  models in hw/ fishing the data out of current_cpu
  hypervisors offloading device emulation to QEMU

I'll start addressing some of these in following patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use separate field cpu_index
  - bool for requester_is_cpu
v3
  - switch to enum MemTxRequesterType
  - move helper #define to patch
  - revert to overloading requester_id
  - mention hypervisors in commit message
  - drop cputlb tweaks, they will move to target specific code
---
 include/exec/memattrs.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..0fb5f29d25 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,6 +14,15 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
+/*
+ * Where the memory transaction comes from
+ */
+typedef enum MemTxRequesterType {
+    MEMTXATTRS_CPU,
+    MEMTXATTRS_MSI,
+} MemTxRequesterType;
+
+
 /* Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
@@ -43,7 +52,9 @@ typedef struct MemTxAttrs {
      * (see MEMTX_ACCESS_ERROR).
      */
     unsigned int memory:1;
-    /* Requester ID (for MSI for example) */
+    /* Requester type (e.g. CPU or PCI MSI) */
+    MemTxRequesterType requester_type:2;
+    /* Requester ID */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
@@ -66,6 +77,10 @@ typedef struct MemTxAttrs {
  */
 #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
 
+/* Helper for setting a basic CPU sourced transaction */
+#define MEMTXATTRS_CPU(id) ((MemTxAttrs) \
+                            {.requester_type = MEMTXATTRS_CPU, .requester_id = id})
+
 /* New-style MMIO accessors can indicate that the transaction failed.
  * A zero (MEMTX_OK) response means success; anything else is a failure
  * of some kind. The memory subsystem will bitwise-OR together results
-- 
2.34.1


