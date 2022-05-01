Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CF516247
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 08:45:01 +0200 (CEST)
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl3KF-0003Mt-U8
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 02:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tr-0006tK-9i
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tn-0001IH-AK
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id d15so10293993plh.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHRhI+bX86VA6q/w81eljR54J64KB5RR2ukIj4TlNII=;
 b=E3Q64BpJDClA1H8nu5PtO0JbHilCY7GI4jNJie9eQs+c/PrJJHeBS4i2I9r8jnA23p
 KCTDp6gtpQUMFgmiDKpw4ktXBSERU4Pj2uBQj1jIRAufEygmbP9PGLbFhxaFBKf1AWLa
 sIL5Y0/wv/05ZG4EihItT71vVJd7uRfojwaIgg+avLjYmGzmksioD9vY6nthGRdiBw68
 0y5X5mz1x4LnsWi8aA7SjxGJ4XS+ZZn7S3BArF2Z2Ut7Oy1RPk/VFVm5yE0Er/TBuE+z
 J96zR94OqoJX5Z6g22GMXO7qHTjnty14/r3qia857tOjU/W6IVvt1H4x7mZAVlXevXl/
 0CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHRhI+bX86VA6q/w81eljR54J64KB5RR2ukIj4TlNII=;
 b=jzoe0k6QQRtsI4+I54R5+XmjW9KVOnUwV84zweTpXTx8ysjLLcvu7YysEvXpStoIdq
 MtqJmMgD5O7eohmGQzfD7cgmW+umoFEo2NkUhnDo7QJog7awIhDgEhREXwlWATCGWNTJ
 59PwJKduCw2rxwO2w4qBnmOdsQl8Xbs+9BKjh98dq7NdQhLPIpgc8go+2oqHuEO3kn/8
 1E/uDNUhdNHCW4vJWENFPfi1sBtQuCe+9Xioxgm+KAnmp5Y5GSukw7p/CVXCiB8gf5Gn
 MnoEMYtD1dE28zf8vUFX0jUFCeclxkiMlAlTWp+0dvNkxyYevTpS+fYs2/zPC4QuLoA0
 062Q==
X-Gm-Message-State: AOAM531QNF4WR7W+JdQBvwEK//+5Jka+JJq2qAog70zwglXuwiA0z9rm
 H93DujgrW+c2V5uvhYcu0ds2YpNJg00WZQ==
X-Google-Smtp-Source: ABdhPJzMka2M7D61gijqgR+1HgYpN1l3ftsL0RkEPpc0q91s6J9SvnDpsg4OAJ/TyUCnWI4M0mWwIQ==
X-Received: by 2002:a17:90a:6501:b0:1ca:a7df:695c with SMTP id
 i1-20020a17090a650100b001caa7df695cmr7183277pjj.152.1651384246027; 
 Sat, 30 Apr 2022 22:50:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/45] target/arm: Perform override check early in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:49:59 -0700
Message-Id: <20220501055028.646596-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Perform the override check early, so that it is still done
even when we decide to discard an unreachable cpreg.

Use assert not printf+abort.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f1fbbdb9e0..2ed07795d8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8538,6 +8538,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         g_assert_not_reached();
     }
 
+    /* Overriding of an existing definition must be explicitly requested. */
+    if (!(r->type & ARM_CP_OVERRIDE)) {
+        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
+        if (oldreg) {
+            assert(oldreg->type & ARM_CP_OVERRIDE);
+        }
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8622,20 +8630,6 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         assert(!raw_accessors_invalid(r2));
     }
 
-    /* Overriding of an existing definition must be explicitly
-     * requested.
-     */
-    if (!(r->type & ARM_CP_OVERRIDE)) {
-        const ARMCPRegInfo *oldreg = get_arm_cp_reginfo(cpu->cp_regs, key);
-        if (oldreg && !(oldreg->type & ARM_CP_OVERRIDE)) {
-            fprintf(stderr, "Register redefined: cp=%d %d bit "
-                    "crn=%d crm=%d opc1=%d opc2=%d, "
-                    "was %s, now %s\n", r2->cp, 32 + 32 * is64,
-                    r2->crn, r2->crm, r2->opc1, r2->opc2,
-                    oldreg->name, r2->name);
-            g_assert_not_reached();
-        }
-    }
     g_hash_table_insert(cpu->cp_regs, (gpointer)(uintptr_t)key, r2);
 }
 
-- 
2.34.1


