Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE5536BA2F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:41:41 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb76y-0005wR-84
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71X-0000g1-R6
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:36:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb71V-0000LZ-JN
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/SwK7FX3kH1UWtK3h3/1AavB3Zp9Tje3hQEQT9u6kU8=;
 b=hiGzoKAnB1Ng5w5DsrC7Q1ims0nE0hH27o02KjoRAk8VCkCXOP7bCwwkZCSfJXkkx1I9ZY
 7DxOc+a7MAibKoI2u4Tb18Q7r9YeY56bwlxeLpLA5p1ofZ/+HL3T95nGxVv7KzKyKOfDOM
 GU/Ma039jxOImxtTve1BEzJV25PF62E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-1ezOnmwCPDeaVWFmHyeEIg-1; Mon, 26 Apr 2021 15:35:59 -0400
X-MC-Unique: 1ezOnmwCPDeaVWFmHyeEIg-1
Received: by mail-wr1-f69.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso19549309wri.6
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/SwK7FX3kH1UWtK3h3/1AavB3Zp9Tje3hQEQT9u6kU8=;
 b=X1gvBZqDdNF5lYA0Zx+gCwoD1O6B1nUNoumoCEBkBzPjvCMpM+kDJKDCjKjzcPQ2iK
 VVwrx0ZRSh1NyXZu961JMw4D42SC/Ier/YkOTIBaMJ8VB4K7w15hwHQiuKhf6Rmgi7F1
 JzESBzCBg0Prq2qlfYJbVWHPK9rRm7hy/mtnYTqwJ6Hqxbj9OBOFLiV0lFn+U/n1DpDQ
 l9kQAghU6COBHP8EUOQcXrJ64nERlsIVYSxE4YW3sNBctAuM6pj7/Beuvx4ZFV+I4vOa
 wx2v01/+O91pDsM14SWUuUUClTq40D+3YQhsaB96vxfzF5zQGI9kX9niXsXzTz8h+3nT
 ASRw==
X-Gm-Message-State: AOAM53081QnT5V0n0ouP7QgJizpfbQeWVqSF4gncr7BsoeXgiI0Slegk
 mTmEBwxuuVj+rK3p7utP1II81yAVyzzVmSXsToGke0v8A2qc++6pUf4xdSnUv+sKcPXk2Ajo86B
 GhgHc+rq8TAlh1xkOmkvTDJUjA7dBIrGaSbLtzGpySRT9OGc8+T9V+bnF9/i2GJww
X-Received: by 2002:a1c:c911:: with SMTP id f17mr21525723wmb.45.1619465756801; 
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCXFZJfuCsZD6GeozfGMj7nTkyuZ7WzQqPIkaCKCWCw6PWoyIT0Kn90gGXuY1yLPwpzSQBTQ==
X-Received: by 2002:a1c:c911:: with SMTP id f17mr21525698wmb.45.1619465756518; 
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t63sm18527743wma.20.2021.04.26.12.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] hw/nvram: Do not build FW_CFG if not required
Date: Mon, 26 Apr 2021 21:35:20 +0200
Message-Id: <20210426193520.4115528-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the Kconfig 'FW_CFG' symbol is not selected, it is pointless
to build the fw_cfg device. Update the stubs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--
 hw/nvram/meson.build |  2 +-
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/stubs/fw_cfg.c b/stubs/fw_cfg.c
index bb1e3c8aa95..ac1e539c93f 100644
--- a/stubs/fw_cfg.c
+++ b/stubs/fw_cfg.c
@@ -1,7 +1,7 @@
 /*
  * fw_cfg stubs
  *
- * Copyright (c) 2019 Red Hat, Inc.
+ * Copyright (c) 2019,2021 Red Hat, Inc.
  *
  * Author:
  *   Philippe Mathieu-Daudé <philmd@redhat.com>
@@ -13,9 +13,54 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/nvram/fw_cfg.h"
 
-const char *fw_cfg_arch_key_name(uint16_t key)
+FWCfgState *fw_cfg_find(void)
 {
     return NULL;
 }
+
+bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
+                               const char *gen_id, Error **errp)
+{
+    error_setg(errp, "fw-cfg device not built in");
+
+    return true;
+}
+
+void fw_cfg_add_file(FWCfgState *s,  const char *filename,
+                     void *data, size_t len)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
+                              FWCfgCallback select_cb,
+                              FWCfgWriteCallback write_cb,
+                              void *callback_opaque,
+                              void *data, size_t len, bool read_only)
+{
+    g_assert_not_reached();
+}
+
+void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
+                        void *data, size_t len)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_set_order_override(FWCfgState *s, int order)
+{
+    g_assert_not_reached();
+}
+
+void fw_cfg_reset_order_override(FWCfgState *s)
+{
+    g_assert_not_reached();
+}
+
+bool fw_cfg_dma_enabled(void *opaque)
+{
+    g_assert_not_reached();
+}
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index fd2951a860f..99e12224483 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -1,7 +1,7 @@
 # QOM interfaces must be available anytime QOM is used.
 qom_ss.add(files('fw_cfg-interface.c'))
 
-softmmu_ss.add(files('fw_cfg.c'))
+softmmu_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 softmmu_ss.add(when: 'CONFIG_CHRP_NVRAM', if_true: files('chrp_nvram.c'))
 softmmu_ss.add(when: 'CONFIG_DS1225Y', if_true: files('ds1225y.c'))
 softmmu_ss.add(when: 'CONFIG_NMC93XX_EEPROM', if_true: files('eeprom93xx.c'))
-- 
2.26.3


