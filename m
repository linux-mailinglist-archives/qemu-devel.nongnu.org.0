Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422064F406
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:23:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IpB-0007p2-I4; Fri, 16 Dec 2022 17:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iog-0007ex-Jh
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:33 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ioe-0005BE-Eb
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:29 -0500
Received: by mail-ej1-x629.google.com with SMTP id x22so9205920ejs.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdbZRXHfDz9my/2NqwlMSDYtYDjTBgfAErVO9Fq757o=;
 b=sQpGTdNl81oqAdJPrntXviKZtH+/I5g09Vbx5/fJNm3mpQABV8GIZ+q5uC4yNWNZ79
 k32y0x+CFSx4tlaIgICAUaddRmXNDXmlpBuLi/mtCjI4R38DkaFDj273tUvRS1TTMlBu
 vlfW712xWGiRe4StWUayYbm1JULsAfr79B84zkqWVW2XGt9gpynGo22+gHEzaQhAGFZh
 8kH1TY4GCtRE3mlyazY0ChJsY0mksUkxkXjMBY78zEnHI+Aj85nGwmXJXF+TqAKB+6PJ
 nL/OjEAG9dCbSpSq4Htn5ZOE1FhoajPJgkWf9CMfQADessYMKAYSOEBKTD4UKCFpU/6w
 qtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdbZRXHfDz9my/2NqwlMSDYtYDjTBgfAErVO9Fq757o=;
 b=YGXQAiLz9guJ8AbxKsHt/+ALnPweToAJD97OABEwYl+xup2ARYg0o2HY2wgZKmcZQ2
 HBaNOH7ajKpa/vKfIiSjtQrm3LqYt7KaK01E/3ZunyZpWXgUFnZ2ScLhCtH54QpcJBQx
 xdiwXJtI1L4k6ubPlmvLi+pUlc3dbuV0HVptGbKPOASNwo2O6Mf8KsgnnfNJoZlhZDSO
 1dY1Ojaf3qXhJRQ/Td6fdIOrMNQtyHrLZzetfajQ/y9WKDVNoH/cs81dQ7cnplbX4wHU
 Gcsdg1JZaXAq1SyD2CaVj4uVHHqWBlB2pk8ZhbTcoGlwjBzfFP+Q/pjLnELlfMhn+Iss
 Wbfw==
X-Gm-Message-State: ANoB5pm0DXIkx/+48j3hE2SXgOD2DpST7dm0RIBbJae63AqDGC3n4odp
 MrSmdYjgjzjaDJXHSSU8ejk3dnmI7THcH9I0S2E=
X-Google-Smtp-Source: AA0mqf7w4Th41q3sZYqLrKys94QA51EDfCwrD1/tvUOylL9ESlfNmo/WlKIZD2r4JsiWQ+ztXfhBMw==
X-Received: by 2002:a17:906:2a8c:b0:78d:f454:3771 with SMTP id
 l12-20020a1709062a8c00b0078df4543771mr26890169eje.20.1671228266228; 
 Fri, 16 Dec 2022 14:04:26 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090676c100b007c6be268252sm1283252ejn.77.2022.12.16.14.04.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 2/5] hw/s390x/pv: Un-inline s390_pv_init()
Date: Fri, 16 Dec 2022 23:04:08 +0100
Message-Id: <20221216220411.6779-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220411.6779-1-philmd@linaro.org>
References: <20221216220411.6779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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

There is no point in having s390_pv_init() inlined.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/pv.c         | 13 +++++++++++++
 include/hw/s390x/pv.h | 14 +-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
index 8dfe92d8df..9c511369b2 100644
--- a/hw/s390x/pv.c
+++ b/hw/s390x/pv.c
@@ -26,6 +26,19 @@ static bool info_valid;
 static struct kvm_s390_pv_info_vm info_vm;
 static struct kvm_s390_pv_info_dump info_dump;
 
+int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
+{
+    if (!cgs) {
+        return 0;
+    }
+    if (kvm_enabled()) {
+        return s390_pv_kvm_init(cgs, errp);
+    }
+
+    error_setg(errp, "Protected Virtualization requires KVM");
+    return -1;
+}
+
 static int __s390_pv_cmd(uint32_t cmd, const char *cmdname, void *data)
 {
     struct kvm_pv_cmd pv_cmd = {
diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 9360aa1091..5bca5bcaf1 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -12,7 +12,6 @@
 #ifndef HW_S390_PV_H
 #define HW_S390_PV_H
 
-#include "qapi/error.h"
 #include "sysemu/kvm.h"
 
 #ifdef CONFIG_KVM
@@ -78,17 +77,6 @@ static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
 #endif /* CONFIG_KVM */
 
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-static inline int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp)
-{
-    if (!cgs) {
-        return 0;
-    }
-    if (kvm_enabled()) {
-        return s390_pv_kvm_init(cgs, errp);
-    }
-
-    error_setg(errp, "Protected Virtualization requires KVM");
-    return -1;
-}
+int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp);
 
 #endif /* HW_S390_PV_H */
-- 
2.38.1


