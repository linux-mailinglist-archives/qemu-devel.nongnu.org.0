Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4006E3D0F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 02:57:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poD9m-0002FO-Pp; Sun, 16 Apr 2023 20:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdr-000099-Fp
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 19:18:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1poBdn-0004Gw-8j
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 19:18:43 -0400
Received: by mail-pl1-x633.google.com with SMTP id w1so978861plg.6
 for <qemu-devel@nongnu.org>; Sun, 16 Apr 2023 16:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681687118; x=1684279118; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+HtEU0/Wc6vKHqd8Q8lwulnseoHN5QX+DPdOc5pQJE=;
 b=nS/LIdbcmTv33n4ufUT2OANSYU5H4PBgtK+8k1XrBHD0HeM7aSJvRIi+urR1coTMQb
 g5trxTB3eAAc4pkjP1hoIa8zf9ibbCLxei45cN7q935Dn1cqrZUt7n7BfT7rWqkOwzDV
 1dqnKNrfL/Vtp4RR4cl7lE4AFqswjed9fgCIpRGHZNFQTsQb6pDEx934BXKMAWvQslcA
 egSsJOcxZIEScc+Rp8TSqVHrj6qRb1Dqp9Ngx/4VLPsEBQigN+pVosd6jPOrk3245+Eq
 +ZkTCOuJx9zKOiuHA9+x224jZzQ2r5uc94Rdo86TCirZ4NlMi5IbcQCwtv6FaXHhjeTC
 /Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681687118; x=1684279118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+HtEU0/Wc6vKHqd8Q8lwulnseoHN5QX+DPdOc5pQJE=;
 b=TtIK3U76qEU9Em1p8uJtcIp0eo/VghznNzpORqcQ6Jn/6UH+ECTraqseviSuM9TH16
 1xI1tepBqbXZd3+0SRXaXYbUzvdBHJAkeX9I89nisESDyLNWFGQeQENlwUNLgdqmFoZs
 OMbK3NppCemNs3P2v04JfBITR6FHW/iiG9NTNVQRMuv4teJay3Ut3ab4XL1ItquqBpCj
 Qh2GakUNlp8T6xQQbXkXGuMaV6KwjwKTqj7Id3WwfwdNCzcYtUNsFDFOV0HZVF8WK2Pb
 C6VKbXdoa44xxe567xZuDgW2B50KD1H3zLnXjhZ1VKT4CIer9Ykc4e01MwEW9iacZUq8
 z6bA==
X-Gm-Message-State: AAQBX9cQJgvoqtFA6sKadl2fjsQCvDGn7rP+8Lwicesj1oqR7dyWzu7C
 Q3QBSy6rcVbcneqziT7/7sXT6A==
X-Google-Smtp-Source: AKy350b3tqZmErPXrU8QtqHYKZDmvW/MZwlZtnDVrQ3Q29jBi46NGOp0uAoeXgjYv78TK4QrfmlA2Q==
X-Received: by 2002:a17:902:7409:b0:1a1:bede:5e54 with SMTP id
 g9-20020a170902740900b001a1bede5e54mr9936352pll.59.1681687117777; 
 Sun, 16 Apr 2023 16:18:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:1800:f680:20ea:ba1c:5673:16e6])
 by smtp.gmail.com with ESMTPSA id
 jl3-20020a170903134300b001a6b02659c0sm3087847plb.159.2023.04.16.16.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 16:18:37 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 2/8] hw/riscv: define capabilities of CBQRI controllers
Date: Sun, 16 Apr 2023 16:20:44 -0700
Message-Id: <20230416232050.4094820-3-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416232050.4094820-1-dfustini@baylibre.com>
References: <20230416232050.4094820-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dfustini@baylibre.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Apr 2023 20:55:43 -0400
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

From: Nicolas Pitre <npitre@baylibre.com>

Define structs to represent the hardware capabilities of capacity and
bandwidth controllers according to the RISC-V Capacity and Bandwidth QoS
Register Interface (CBQRI).

Link: https://github.com/riscv-non-isa/riscv-cmqri/blob/main/riscv-cbqri.pdf
Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 include/hw/riscv/cbqri.h | 81 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 include/hw/riscv/cbqri.h

diff --git a/include/hw/riscv/cbqri.h b/include/hw/riscv/cbqri.h
new file mode 100644
index 000000000000..b43a3572dd7e
--- /dev/null
+++ b/include/hw/riscv/cbqri.h
@@ -0,0 +1,81 @@
+/*
+ * RISC-V Capacity and Bandwidth QoS Register Interface
+ * URL: https://github.com/riscv-non-isa/riscv-cbqri
+ *
+ * Copyright (c) 2023 BayLibre SAS
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_RISCV_CBQRI_H
+#define HW_RISCV_CBQRI_H
+
+#include "qemu/typedefs.h"
+
+#define RISCV_CBQRI_VERSION_MAJOR   0
+#define RISCV_CBQRI_VERSION_MINOR   1
+
+/* Capacity Controller hardware capabilities */
+typedef struct RiscvCbqriCapacityCaps {
+    uint16_t nb_mcids;
+    uint16_t nb_rcids;
+
+    uint16_t ncblks;
+
+    bool supports_at_data:1;
+    bool supports_at_code:1;
+
+    bool supports_alloc_op_config_limit:1;
+    bool supports_alloc_op_read_limit:1;
+    bool supports_alloc_op_flush_rcid:1;
+
+    bool supports_mon_op_config_event:1;
+    bool supports_mon_op_read_counter:1;
+
+    bool supports_mon_evt_id_none:1;
+    bool supports_mon_evt_id_occupancy:1;
+} RiscvCbqriCapacityCaps;
+
+/* Bandwidth Controller hardware capabilities */
+typedef struct RiscvCbqriBandwidthCaps {
+    uint16_t nb_mcids;
+    uint16_t nb_rcids;
+
+    uint16_t nbwblks;
+    uint16_t mrbwb;
+
+    bool supports_at_data:1;
+    bool supports_at_code:1;
+
+    bool supports_alloc_op_config_limit:1;
+    bool supports_alloc_op_read_limit:1;
+
+    bool supports_mon_op_config_event:1;
+    bool supports_mon_op_read_counter:1;
+
+    bool supports_mon_evt_id_none:1;
+    bool supports_mon_evt_id_rdwr_count:1;
+    bool supports_mon_evt_id_rdonly_count:1;
+    bool supports_mon_evt_id_wronly_count:1;
+} RiscvCbqriBandwidthCaps;
+
+DeviceState *riscv_cbqri_cc_create(hwaddr addr,
+                                   const RiscvCbqriCapacityCaps *caps,
+                                   const char *instance_name);
+DeviceState *riscv_cbqri_bc_create(hwaddr addr,
+                                   const RiscvCbqriBandwidthCaps *caps,
+                                   const char *instance_name);
+
+void example_soc_cbqri_init(void);
+
+#endif
-- 
2.34.1


