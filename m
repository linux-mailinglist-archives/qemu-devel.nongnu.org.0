Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27713BB903
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 10:22:03 +0200 (CEST)
Received: from localhost ([::1]:44496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Jre-0004N6-UM
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 04:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jo3-0006MB-Gg
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m0Jnx-0005aD-L9
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 04:18:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id q17so581971wrv.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rX6VYMglzE9aU5pqhCydIFjlto7XWPVqNewVGr+9vs=;
 b=j0oRCrm8kgkwA3ux68uvEDgfthW0hNyyMSYb90ubDWvn5w05F5Nus+Gze8ZAFwE1B+
 SdQ9MseI3LH7wfcSYbm/1VBUbIKC6Xz+8MrjZkV2mI+QMjoX3SJqBamq9GMzZW/IPTGy
 ZRhYnjsJ8SqdhQ0oDlkKL4syfmDH4KxSyK1eLcC85fhivu8vkLkYHWkPMS+IlQ854p96
 4bvduKpLzrFf7M2ezWAfcYvEqR7KBc2UD4THT9z+3fPk4yvF+sVjifyYElEMk24dPMLm
 OPASZ6YK00RHdoTKN2Fl1cP0FdR95TdfQVPw1WocBJBRVoPQJADTVHjrvh+9NfUTXODu
 Z/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rX6VYMglzE9aU5pqhCydIFjlto7XWPVqNewVGr+9vs=;
 b=qIWyY1PLtoNFJDBHiJ5zcHNGHWq3Ibuv2MwN/3re4tyO8bJKUl1x5V9+h/V46TM77C
 YG68EzHzwOPOwSfHCHj5rNZ0Au9p92+4QLxVTS5A5SPs1IIoR5GizcT/sU95r3QcWN36
 gpHL1Ue38kg68JFTlrSBkFJtYegy0SlxdG8vf+sIy6lBeAgyUHKGJxlJJIw/LVlFnQEN
 kkB0ZeVRRtsvwfjFmxc6o7f+GMwH6cOtr0DNYGtl3X0sPm5usVBNJAF/AkTaIiM9Vkqg
 GZD9cH/RIsm439dBmzlujskdZoqQ0pLdAo0oL1sEVnjC09fw7KystHlMQGV6+pYM3eC+
 kI1w==
X-Gm-Message-State: AOAM5309nnumwuHCBu7oDbj3UcN/IcToCMzAPfkSiq2eEaFpfffEENDI
 QleXJiRoZgAsIWM3R+5VZPxhzvrfInSkHQ==
X-Google-Smtp-Source: ABdhPJwQW1IXt8okYkRVlw2/FMYZvYFpwHVft3BBPAanTbqpu7NR1yAQxrUsHHzzUnTew5BIQKRpVg==
X-Received: by 2002:a5d:64a1:: with SMTP id m1mr8735884wrp.210.1625473092475; 
 Mon, 05 Jul 2021 01:18:12 -0700 (PDT)
Received: from localhost.localdomain ([37.160.151.142])
 by smtp.gmail.com with ESMTPSA id n5sm3662014wri.31.2021.07.05.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 01:18:12 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/i386: Added DR6 and DR7 consistency checks
Date: Mon,  5 Jul 2021 10:18:00 +0200
Message-Id: <20210705081802.18960-3-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210705081802.18960-1-laramglazier@gmail.com>
References: <20210705081802.18960-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DR6[63:32] and DR7[63:32] are reserved and need to be zero.
(AMD64 Architecture Programmer's Manual, V2, 15.5)

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/svm.h                   | 2 ++
 target/i386/tcg/sysemu/svm_helper.c | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/i386/svm.h b/target/i386/svm.h
index adc058dc76..e54670ef12 100644
--- a/target/i386/svm.h
+++ b/target/i386/svm.h
@@ -140,6 +140,8 @@
 #define SVM_MSRPM_SIZE		(1ULL << 13)
 #define SVM_IOPM_SIZE		((1ULL << 13) + 1)
 
+#define SVM_DR_RESERVED_MASK 0xffffffff00000000U
+
 struct QEMU_PACKED vmcb_control_area {
 	uint16_t intercept_cr_read;
 	uint16_t intercept_cr_write;
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index fa701829e5..276c240f70 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -269,7 +269,13 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     env->dr[6] = x86_ldq_phys(cs,
                           env->vm_vmcb + offsetof(struct vmcb, save.dr6));
 
-    /* FIXME: guest state consistency checks */
+    if (env->dr[6] & SVM_DR_RESERVED_MASK) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
+
+    if (env->dr[7] & SVM_DR_RESERVED_MASK) {
+        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
+    }
 
     switch (x86_ldub_phys(cs,
                       env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
-- 
2.25.1


