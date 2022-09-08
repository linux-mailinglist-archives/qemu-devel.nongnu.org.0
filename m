Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BAE5B2716
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:47:51 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNV8-00018t-5z
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOV-0004b4-67; Thu, 08 Sep 2022 15:40:59 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:36787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOT-0007Bv-MW; Thu, 08 Sep 2022 15:40:58 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 6-20020a9d0106000000b0063963134d04so13043623otu.3; 
 Thu, 08 Sep 2022 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=Sp52kS5cCBWsjDRCbYGLfZTCvJjDfSex5naJaO9XnG6/fVfucmvsWIxkuUVmyWG9vt
 WSRbSTiPNEq5SLXuY02JxujO623J8E1YOa571P4zqvVm9MSQb9TCDB+F6XbKLrBm9xlD
 l40obpo+KaLmWwfgfVbLjhbvCiMSiLmWqxQYd4iA8eQ/wUWW7cloJC/ziaQpHmNxxjLJ
 WbpLjf05rZOs8n743G59EloDUmymGGRdD4FCmS9Rjdqob9aXBmzeARWKdRs04tKhks20
 SukGtg7aEnDQ6wKrklzxSVeq9jLHVNzxJl6oEPmBaELRJCJeP1QRjzpgw0e3YTtDHQvC
 1OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mGG3U2Luf4I4urQShsm1RjBsPx5YCf60/nn93DboxwM=;
 b=sUo+PvK0uIMUHjejUnjh84xbDQgxE0F5R8ukY0Umu+dU8jLFpn7OmHJT7tX48Dfphm
 XO2tvZi0clexeIYM7QD0OsgREveCK5xhTPzwbLFyxl/PjzyHU+ww8s7FnKQ1JiTdv6nA
 LIGXYsvpvcqoEMSN4IHkII/B8vno1eBfAnnNa/5uX6sNy1tYO9LKlpE/rNcUnbp6drmA
 1X85CJcJCJ5qZYDpls8qxLVq4N/mSvobai7S1L5WQTn5TgGDpJrU/lBH1sxUhdai+XyW
 QHLy4r/9ICwSWD+3uLGcTaPGtDxtGk40RQSLbK7O3IclpSudeuXbjiqIuWd2sy/1GcSN
 GUdQ==
X-Gm-Message-State: ACgBeo0YRflsK8cBQ0kki8OIkIsZMEFfHtsoDcgpXLiZppfcr2De0zOW
 i4N+FzasTtLJnc4q5twglqVPNwl8WSUsqQ==
X-Google-Smtp-Source: AA6agR6F8lElzXdKfA56F1b8kpGvqjVXE7IuEdVr5kHp2O9gMvyXbxLNfWxY3LnNneneh5T+jTPhxA==
X-Received: by 2002:a05:6830:631c:b0:638:c121:463a with SMTP id
 cg28-20020a056830631c00b00638c121463amr3951803otb.39.1662666055990; 
 Thu, 08 Sep 2022 12:40:55 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v7 04/14] hw/ppc: set machine->fdt in
 ppce500_load_device_tree()
Date: Thu,  8 Sep 2022 16:40:30 -0300
Message-Id: <20220908194040.518400-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908194040.518400-1-danielhb413@gmail.com>
References: <20220908194040.518400-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This will enable support for 'dumpdtb' QMP/HMP command for the e500
machine.

Cc: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 32495d0123..ea5f947824 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,6 +47,8 @@
 #include "hw/i2c/i2c.h"
 #include "hw/irq.h"
 
+#include <libfdt.h>
+
 #define EPAPR_MAGIC                (0x45504150)
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
@@ -600,7 +602,16 @@ done:
         cpu_physical_memory_write(addr, fdt, fdt_size);
     }
     ret = fdt_size;
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for the
+     * 'dumpdtb' QMP/HMP command.
+     *
+     * The FDT is re-created during reset, so free machine->fdt
+     * to avoid leaking the old FDT.
+     */
+    g_free(machine->fdt);
+    machine->fdt = fdt;
 
 out:
     g_free(pci_map);
-- 
2.37.2


