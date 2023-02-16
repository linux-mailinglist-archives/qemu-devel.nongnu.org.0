Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4C69944B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:26:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdKm-0002o8-LT; Thu, 16 Feb 2023 07:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKi-0002jz-MV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:52 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSdKg-0007yy-CG
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:25:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id y1so1692472wru.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vXaKAK994idnw+4qe0vPaymYezvQPE1zxpNZ2GlwOtY=;
 b=TYhiLdvIy3/9XqbcRntWNxRyLPiuO0xeG0JeiBg3qJFr4UXK/4jjCe5YpO1MCqhBAS
 xN2jBf77sOM5tplhAc4nm8JkJW/XDWCDDIkobOPk+YVb0A1pFPCHx9mDDAhyJHdbFYY0
 zrS2PBh2TdDwCBSRqDKlJxA2hnL9EtGY3aGcC9Hk3w8sbiJQUPS1cSs/qZYwt6MWCUYi
 mkQaM6ALL74/ItMmwtrWiJA/s/a696+u4sSjKtmDFJz4oVt/X+gBLGRn2QULUv8iq9Yk
 +Lrgm/QJ3IdInzT3ZJoChp2qrBh4niSOcO21EKYL3LAoaUM8Xv5If9Y+3Gxuecwjp1Gb
 dtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vXaKAK994idnw+4qe0vPaymYezvQPE1zxpNZ2GlwOtY=;
 b=BmHiJUUHeUoeFT+roIDhAZcDDGL3JILuFraVRbI7YXu5xvNf3qDGV1xyg4603HMjfo
 wvI+k2Z2QUodgB/2SBj5gR69x/CYcHS9mNyJgZ9S2U5v4vDVY2w0ruJEERG894UZ9XcS
 vXBxSlKnr6vOD9nMefHDQ0otPCX0Ec6WJqKw35B8pUIIgVQsH5p91P6JM8tNY9zsnY1F
 hVwij0W9ljL/GZQpFsl8WgGvMwETSODTeb3E8TTIKZFOO4+MNdyE3HNKtO2Mwme+ihC6
 VOryx/cBJVnhfc7R32OdomVTNBWbka0X31Q53B8JayOvJhVIDv/L1sWvwasBApap//Pg
 aK1g==
X-Gm-Message-State: AO0yUKU7SHZ/hE8LQ/olzzC58DCP0C0ogN6eZSXSZ7+qyRTSw64z1AqP
 OoHfliVJwP5RRBXlhcMLW/SbMgZ2xD3jcgWi
X-Google-Smtp-Source: AK7set/9ADECGe6VJDzdersNGsqgFqo0fQTJvfuHdCmrLWZoKf6OXBbBxU7Uo7Hsm4uNlGX0VPzYHQ==
X-Received: by 2002:a5d:6a8e:0:b0:2c5:561e:809b with SMTP id
 s14-20020a5d6a8e000000b002c5561e809bmr3715424wru.66.1676550349391; 
 Thu, 16 Feb 2023 04:25:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a5d46c1000000b002c57384dfe0sm1369835wrs.113.2023.02.16.04.25.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 16 Feb 2023 04:25:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 4/5] hw/nmi: Simplify nmi_monitor_handle() and do_nmi()
Date: Thu, 16 Feb 2023 13:25:23 +0100
Message-Id: <20230216122524.67212-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216122524.67212-1-philmd@linaro.org>
References: <20230216122524.67212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

Since the previous commit, object_child_foreach_recursive()'s
handler takes an Error* argument and return a boolean. We can
remove these fields from the do_nmi_s structure, which then
only contains the 'int cpu_index' field.
Directly pass 'cpu_index' as context, removing 'struct do_nmi_s'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: please double-check...

 hw/core/nmi.c | 41 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 35 deletions(-)

diff --git a/hw/core/nmi.c b/hw/core/nmi.c
index fa74c405f7..f5a6483e89 100644
--- a/hw/core/nmi.c
+++ b/hw/core/nmi.c
@@ -26,51 +26,22 @@
 #include "qemu/module.h"
 #include "monitor/monitor.h"
 
-struct do_nmi_s {
-    int cpu_index;
-    Error *err;
-    bool handled;
-};
-
-static void nmi_children(Object *o, struct do_nmi_s *ns);
-
 static bool do_nmi(Object *o, void *opaque, Error **errp)
 {
-    struct do_nmi_s *ns = opaque;
+    int *cpu_index = opaque;
     NMIState *n = (NMIState *) object_dynamic_cast(o, TYPE_NMI);
 
-    if (n) {
-        NMIClass *nc = NMI_GET_CLASS(n);
-
-        ns->handled = true;
-        if (!nc->nmi_monitor_handler(n, ns->cpu_index, &ns->err)) {
-            return false;
-        }
+    if (!n) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return false;
     }
-    nmi_children(o, ns);
 
-    return true;
-}
-
-static void nmi_children(Object *o, struct do_nmi_s *ns)
-{
-    object_child_foreach(o, do_nmi, ns, NULL);
+    return NMI_GET_CLASS(n)->nmi_monitor_handler(n, *cpu_index, errp);
 }
 
 void nmi_monitor_handle(int cpu_index, Error **errp)
 {
-    struct do_nmi_s ns = {
-        .cpu_index = cpu_index,
-        .err = NULL,
-        .handled = false
-    };
-
-    nmi_children(object_get_root(), &ns);
-    if (ns.handled) {
-        error_propagate(errp, ns.err);
-    } else {
-        error_setg(errp, QERR_UNSUPPORTED);
-    }
+    object_child_foreach_recursive(object_get_root(), do_nmi, &cpu_index, errp);
 }
 
 static const TypeInfo nmi_info = {
-- 
2.38.1


