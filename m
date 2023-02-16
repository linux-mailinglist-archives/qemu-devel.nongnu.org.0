Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD52369944E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdKq-0002qT-Hw; Thu, 16 Feb 2023 07:26:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKn-0002p0-Vp
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKl-0008Bx-U3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:57 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 s13-20020a05600c45cd00b003ddca7a2bcbso1489038wmo.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J9tFPN4rdCw1nxfX8ah3wia3JiRf2r85XcvwPt3k03s=;
 b=VSStNVY4wyoxHRBnEZUdC/a8liXCq2B5GZbeXSvysmyHNULFGw+ueEaWQGs4PvMtTp
 BtAJFnhU8mgmmKZbCpdrD+K6Yz8chWrE/g5p/ixc9rV4356aizfYaru6I6a7YmUWc+Re
 tiAulQGM2prRHTZGoPyTyfbZR+Gu5fF+MmQYRGb0CGLeIK3DfTcOjOMHrQSjfNO20ogk
 NYx+QP3pg9ADZnZQ21CXeouaw3wNxOTV6LSrlpG9l5sN7cIpuxwj0KAPyz56cNXvLwvq
 0UhX/88uibER7N484m2RI29YOi6GDy1kff1htF9xxDAKJuSZpq189dDcE6UlZCc2u8+E
 X5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J9tFPN4rdCw1nxfX8ah3wia3JiRf2r85XcvwPt3k03s=;
 b=nZAQYf229/DWMKDx4ZA3d6nINnW7Iy+x7v31iWiQpX9+e6pHnQlBYz2TjMOaKNeWAj
 a+zpRf9SWDxJBKQX49jVlBFBw0f9oBZYV+eIKwgq954HsyiEPCCoGd8Ictkah7Ml6cka
 7UwJeUtEoSBrzyT29J5adg+hX0W2Sxs7mS3OGH87pQ+k0zAKuaWRhQZNlhVk5tp0tza/
 xuq0eZZzEhlAsUaIAaKaN6+x01HM25m0d2YTshqaN4HeTPD5osd6MqKqehZhs8Y6DSRD
 6ywDIKVQA/F4/pZL9qJtVfO7OeoAS50NxXmXQk8qKfyx5doiiRi28qswYHlMtlLH99C8
 MeEg==
X-Gm-Message-State: AO0yUKUDXfmeEQG5O4SDKVBmsZ10Z1Z+LWpnET9MUkzsbHzEqoAVWFQC
 m1CiATUOBlzS0ozgVgzAK9n/Idjur3rLo+F1
X-Google-Smtp-Source: AK7set8aALC2vCdiWlu02hWxTZn390yk1IXt/q8Krsu16xbkpd9lSqn5Wygdi62m7haqlwVQQ6zblA==
X-Received: by 2002:a05:600c:4d12:b0:3e2:1636:766a with SMTP id
 u18-20020a05600c4d1200b003e21636766amr655997wmp.9.1676550354304; 
 Thu, 16 Feb 2023 04:25:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c4e4100b003e0015c8618sm5280146wmq.6.2023.02.16.04.25.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
Date: Thu, 16 Feb 2023 13:25:24 +0100
Message-Id: <20230216122524.67212-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216122524.67212-1-philmd@linaro.org>
References: <20230216122524.67212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ForeachArgs::name is only used once as TYPE_IPMI_BMC.
Since the penultimate commit, object_child_foreach_recursive()'s
handler takes an Error* argument and return a boolean.
We can directly pass ForeachArgs::obj as context, removing the
ForeachArgs structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: please double-check...

 hw/ppc/pnv_bmc.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
index 05acc88a55..566284469f 100644
--- a/hw/ppc/pnv_bmc.c
+++ b/hw/ppc/pnv_bmc.c
@@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
     return IPMI_BMC(obj);
 }
 
-typedef struct ForeachArgs {
-    const char *name;
-    Object *obj;
-} ForeachArgs;
-
 static bool bmc_find(Object *child, void *opaque, Error **errp)
 {
-    ForeachArgs *args = opaque;
+    Object **obj = opaque;
 
-    if (object_dynamic_cast(child, args->name)) {
-        if (args->obj) {
-            return false;
+    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
+        if (*obj) {
+            return true;
         }
-        args->obj = child;
+        *obj = child;
     }
     return true;
 }
 
 IPMIBmc *pnv_bmc_find(Error **errp)
 {
-    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
-    int ret;
+    Object *obj = NULL;
 
-    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
-                                         &args, NULL);
-    if (ret) {
+    if (!object_child_foreach_recursive(object_get_root(), bmc_find, &obj,
+                                        NULL)) {
         error_setg(errp, "machine should have only one BMC device. "
                    "Use '-nodefaults'");
         return NULL;
     }
 
-    return args.obj ? IPMI_BMC(args.obj) : NULL;
+    return IPMI_BMC(obj);
 }
-- 
2.38.1


