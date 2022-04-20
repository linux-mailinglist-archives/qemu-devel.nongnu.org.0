Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53D5092EE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:37:52 +0200 (CEST)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIxM-0005f5-0J
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdh-0008BE-7q; Wed, 20 Apr 2022 18:17:33 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:43390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIdf-000660-Hq; Wed, 20 Apr 2022 18:17:32 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5e8523fcbso3501980fac.10; 
 Wed, 20 Apr 2022 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nUgJyRvX+0qJwNQ6C+GqWDKDodVzJXABOSa7o2A7gII=;
 b=FsI09hgP/WGn26N9BQz4O3RUEWgZYiqGGMoAC5yl+MVkDrICYT3GWERhPzMqAMAyFB
 6JAYlJnIlu745zBDIIbhTxjRLQw0m6c1WQyDazvRH8PxLxrVHe54cr4Fc6YndFvdmikX
 yT808yTfFc7mTHoYE+GRyyIgwE1mMwWlZsYu0xn5IHhiLXmlZbWpbcLWnfsvuOa6JKdj
 AUvwxO59ptBP2lYNFKK0Z7FnJlDtc9qr7j18brDUSBZSpxeROM3dw4fT9bFBGRMu63Db
 TzTJzuDs7qzfqXGcjgvYYKm9Yg4YY+AvmlKJW7dvHyp2UbIusUvpqqaeSpWNEpsqVv4c
 fi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nUgJyRvX+0qJwNQ6C+GqWDKDodVzJXABOSa7o2A7gII=;
 b=VwkdwBWnrhzGi6uXQaqboT96QRhA+S34MRYoUiSWzOZllo2IOU4lPgB+JwOqtqfBG3
 tUvM4OtPjmggW25I9ub7E+ZEk5k5I+CK6dD6jW3R72kgGbs3AdtUy139maqddACJWVEr
 6kxcBCVq5enG1PlljoSMnvfQ+TPmps0s9Y2Q67bkbFOneS6AFKGAbHiSVQLV0skPiRg/
 w5VkjQp2CGwyNH0jNGXDUD9R+ngsVQbYj8Vn/h6PhxIH0VbxIljrrDYwkeV8ac/NwGwx
 dJTS3J4d5xcbdHOSzHS8hZAdsuKlItucjOR2IPySFZc+umq4Ib4X5DrpN2HyrSR0CgpI
 0o5g==
X-Gm-Message-State: AOAM533oxGATiQPBdVNRLOD9rSg+e6VpgyPYFdXFLMDyQq/jgday/drd
 1qlEBPaOm/WtCTANz+l77/eEG5MANmw=
X-Google-Smtp-Source: ABdhPJz5nZQ4feGtWnpm1U/ov8ND0/jDJN4W3FmQwQKGCEB65p71plWb4THQK0VktWuJ/1lUS6VaOQ==
X-Received: by 2002:a05:6870:5802:b0:de:ce5e:33ea with SMTP id
 r2-20020a056870580200b000dece5e33eamr2545360oap.57.1650493049920; 
 Wed, 20 Apr 2022 15:17:29 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/23] spapr: Move hypercall_register_softmmu
Date: Wed, 20 Apr 2022 19:13:14 -0300
Message-Id: <20220420221329.169755-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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
Cc: peter.maydell@linaro.org, Fabiano Rosas <farosas@linux.ibm.com>,
 danielhb413@gmail.com, richard.henderson@linaro.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

I'm moving this because next patch will add more code under the ifdef
and it will be cleaner if we keep them together.

Also switch the ifdef branches to make it more convenient to add code
under CONFIG_TCG in the next patch.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20220325221113.255834-2-farosas@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 50 ++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7c8bb76f99..9b24db5e44 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1473,31 +1473,6 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
     return H_FUNCTION;
 }
 
-#ifndef CONFIG_TCG
-static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                            target_ulong opcode, target_ulong *args)
-{
-    g_assert_not_reached();
-}
-
-static void hypercall_register_softmmu(void)
-{
-    /* hcall-pft */
-    spapr_register_hypercall(H_ENTER, h_softmmu);
-    spapr_register_hypercall(H_REMOVE, h_softmmu);
-    spapr_register_hypercall(H_PROTECT, h_softmmu);
-    spapr_register_hypercall(H_READ, h_softmmu);
-
-    /* hcall-bulk */
-    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
-}
-#else
-static void hypercall_register_softmmu(void)
-{
-    /* DO NOTHING */
-}
-#endif
-
 /* TCG only */
 #define PRTS_MASK      0x1f
 
@@ -1825,6 +1800,31 @@ out_restore_l1:
     spapr_cpu->nested_host_state = NULL;
 }
 
+#ifdef CONFIG_TCG
+static void hypercall_register_softmmu(void)
+{
+    /* DO NOTHING */
+}
+#else
+static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                            target_ulong opcode, target_ulong *args)
+{
+    g_assert_not_reached();
+}
+
+static void hypercall_register_softmmu(void)
+{
+    /* hcall-pft */
+    spapr_register_hypercall(H_ENTER, h_softmmu);
+    spapr_register_hypercall(H_REMOVE, h_softmmu);
+    spapr_register_hypercall(H_PROTECT, h_softmmu);
+    spapr_register_hypercall(H_READ, h_softmmu);
+
+    /* hcall-bulk */
+    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
+}
+#endif
+
 static void hypercall_register_types(void)
 {
     hypercall_register_softmmu();
-- 
2.35.1


