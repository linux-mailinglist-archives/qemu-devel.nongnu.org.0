Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633B566A05D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:24:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIt-0003Iu-0u; Fri, 13 Jan 2023 10:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMII-00035k-Ps
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIG-0006an-9g
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:37 -0500
Received: by mail-wm1-x32f.google.com with SMTP id ja17so15555647wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZCPnB5fIDxgYUOaNTTWB4sTJHEXcsZDKFFOWxxesng=;
 b=Qlr3Kh+fhzvy5CB2CkMtIai2G7HmFr3XjRI7jT6PTGOpcL79+CVZuEMdzpwtimkch+
 eoxXL1PZ0IWuc3leNFClsF+tW2pfa3142F7MeXZbt0eZTIKrpTV91x370TxJn9LbVk/9
 kkwHAf9vloMmpsGNKqaI8ht7KQlrv881nqd5OXK6Zs9XbvIMDpFUhfpKK9BDAOjwIk7K
 0LaoZySkJnXYIorhg2IzsdNDyF8UseHcYRYai1QgBz4aw7Wz6ValEuV7/dCxe7VynuTo
 e6PIF6m9UJ0bfYJnxP3J3Qndzj5MxbW0jreRvBxeHNW2sW8h6pmNyg1uy/8ra7ZvBWIc
 5b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZCPnB5fIDxgYUOaNTTWB4sTJHEXcsZDKFFOWxxesng=;
 b=0VzotO6llwORJ4Io9K01AFpbYs+PaG7jN2kzV50c6ThcLT/ZGlEoZP8kFNElNjFKIK
 k/ZeC8FcuQHT4Wsf9bAgBovOvXLJ5LKwQ8lEFrOskv+bhYafVO7SKic+G1W17HXCaxUC
 ILhq0OF0hpcRo+/6KSBafHx4B4hAb9v9SKCqYQ0VivCey1CL/04joJq/axCvkTbiU0jx
 2W/P1Wh+hftnw1db+LbLVbGJIh+DoK3ObCrDPJATkX9w/2SWJ+/9nfF9LhjgclB/Pc6a
 nBBThMAfKeLdhTnW5rJ7tzjoZ23vRC7lt/UnzUkEAEcs/E55vGxHYIKUxmfAnVm7w/CX
 i7tg==
X-Gm-Message-State: AFqh2kqUmiHbYWmhZLQMMdIZo54mVU4moT6Yx3cj7sUuFUqR7WwsCg1+
 X5mzQdHxiQ289Mtu+UxNoS1ny5ZKV2rrEWLb
X-Google-Smtp-Source: AMrXdXsThB3s5Rw6Z1hdLOe0V3j6ZcbB75JIVsjratZi/beP0TYvJvZ57L38fZDrfAdMGA1Cqp/j2g==
X-Received: by 2002:a05:600c:1c2a:b0:3d9:f217:6f6b with SMTP id
 j42-20020a05600c1c2a00b003d9f2176f6bmr105890wms.33.1673624913666; 
 Fri, 13 Jan 2023 07:48:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cfa622a18asm29162279wmb.3.2023.01.13.07.48.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 37/46] hw/core/qdev-properties-system: Allow the 'slew' policy
 only on x86
Date: Fri, 13 Jan 2023 16:45:23 +0100
Message-Id: <20230113154532.49979-38-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

From: Thomas Huth <thuth@redhat.com>

The 'slew' tick policy is currently enforced to be only available on
x86 via some "#ifdef TARGET_I386" statements in mc146818rtc.c. We
want to get rid of those #ifdefs, so we need a different way of
checking whether the policy is allowed or not. Using the setter
function in hw/core/qdev-properties-system.c seems to be a good
place, so let's add a check here.

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Message-Id: <20230110095351.611724-3-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties-system.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 54a09fa9ac..d42493f630 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -33,6 +33,7 @@
 #include "net/net.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pcie.h"
+#include "hw/i386/x86.h"
 #include "util/block-helpers.h"
 
 static bool check_prop_still_unset(Object *obj, const char *name,
@@ -558,13 +559,38 @@ void qdev_set_nic_properties(DeviceState *dev, NICInfo *nd)
 
 /* --- lost tick policy --- */
 
+static void qdev_propinfo_set_losttickpolicy(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    Property *prop = opaque;
+    int *ptr = object_field_prop_ptr(obj, prop);
+    int value;
+
+    if (!visit_type_enum(v, name, &value, prop->info->enum_table, errp)) {
+        return;
+    }
+
+    if (value == LOST_TICK_POLICY_SLEW) {
+        MachineState *ms = MACHINE(qdev_get_machine());
+
+        if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
+            error_setg(errp,
+                       "the 'slew' policy is only available for x86 machines");
+            return;
+        }
+    }
+
+    *ptr = value;
+}
+
 QEMU_BUILD_BUG_ON(sizeof(LostTickPolicy) != sizeof(int));
 
 const PropertyInfo qdev_prop_losttickpolicy = {
     .name  = "LostTickPolicy",
     .enum_table  = &LostTickPolicy_lookup,
     .get   = qdev_propinfo_get_enum,
-    .set   = qdev_propinfo_set_enum,
+    .set   = qdev_propinfo_set_losttickpolicy,
     .set_default_value = qdev_propinfo_set_default_value_enum,
 };
 
-- 
2.38.1


