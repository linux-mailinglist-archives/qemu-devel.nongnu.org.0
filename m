Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E752E3895D5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:52:41 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRJA-0004gN-Vc
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1j-0002ux-1F
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:39 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1g-0007Py-Md
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:38 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so12670527oto.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyRgc+Gn7oqqf/QHFgizxweLPsqaDiM3F1V+G4Xmf04=;
 b=hZnP/N1Dt2eLr/hb2J5uhosXENVCy+o6S3b2z3hByRkbVu6ucDwLyyCZjrJmOGYHgY
 fIa7Q6IkoiEBF34HqgFzfWFTIMH8jiW755uj8eEccO8DMM/PzZ61p2guHKqtzuVg2vXH
 OsdZ+VMz9UhiCocKLjPhrwVx0MRp6xz0cyDPSGYYu/JU/GKIjMmLEmGoThXfrNC/K/lD
 kaZ4FOoTMlnKtm2cX/ktPNOuDUHCKvCjka2EBCL6Vra0Dr5C16Ydtl+xKSO5HCOeiPqf
 IdXP5p4RK+yEsaRdLXV5XYY3Z4sWpt6DoHsT/oU0WBLO1ZCzX83v02vGXpOUY9CB63no
 L9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyRgc+Gn7oqqf/QHFgizxweLPsqaDiM3F1V+G4Xmf04=;
 b=AT7KDF2b2Hh1NKl75lWkQMCBfrQ17Hd95ymLcblUJw/qWlcxlxrSAX9VCYHFIJdd8f
 BiIW0UzYOAOMukQM/wa9XNcPTYMS2sgFet+dMK4e8c8olHIqngV1QYu9uzW7F2vOLbaB
 hpNEHv2OkA3dG8Biapg4pcK5TECypKKoOBOD0QGbGZh8blJFSzyiiVo0E8+D0huVoTdv
 ijFXdXq3GpDhyNSmVtoEBLeYYc2/gSRTEoSoyXlR7xD95sKGMYJNCLCUGW3QkABi4kY4
 9bh4bohZnpNdi2qHPANFxtvl+QkjsoJD2Gv9rD+wqcY57oTcZsVc5kyFoejdZDvHUHdn
 pt2g==
X-Gm-Message-State: AOAM531Ww8r9V+UaP1jCr3EauZwYGd8Rc2E8/GkGAVRR0zjqfXc5Iz5g
 UvDyA1OTioyAxraTb+Cm+tmipRkIjSIIPPCw
X-Google-Smtp-Source: ABdhPJyeppZGyk+MZlGE+L1q/C4vshRdSv1o2W5Hs/XRYIyQUhHPlNOujY1dKvtTAINUm+yYZ4nVXQ==
X-Received: by 2002:a9d:5c08:: with SMTP id o8mr651089otk.261.1621449275543;
 Wed, 19 May 2021 11:34:35 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 43/50] target/i386: Inline user cpu_svm_check_intercept_param
Date: Wed, 19 May 2021 13:30:43 -0500
Message-Id: <20210519183050.875453-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The user-version is a no-op.  This lets us completely
remove tcg/user/svm_stubs.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-44-richard.henderson@linaro.org>
---
 target/i386/cpu.h                |  8 ++++++++
 target/i386/tcg/user/svm_stubs.c | 28 ----------------------------
 target/i386/tcg/user/meson.build |  1 -
 3 files changed, 8 insertions(+), 29 deletions(-)
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 324ef92beb..e6836393f7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2146,8 +2146,16 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
 void helper_lock_init(void);
 
 /* svm_helper.c */
+#ifdef CONFIG_USER_ONLY
+static inline void
+cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
+                              uint64_t param, uintptr_t retaddr)
+{ /* no-op */ }
+#else
 void cpu_svm_check_intercept_param(CPUX86State *env1, uint32_t type,
                                    uint64_t param, uintptr_t retaddr);
+#endif
+
 /* apic.c */
 void cpu_report_tpr_access(CPUX86State *env, TPRAccess access);
 void apic_handle_tpr_access_report(DeviceState *d, target_ulong ip,
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
deleted file mode 100644
index db818f89a8..0000000000
--- a/target/i386/tcg/user/svm_stubs.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- *  x86 SVM helpers (user-mode)
- *
- *  Copyright (c) 2003 Fabrice Bellard
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "exec/helper-proto.h"
-#include "tcg/helper-tcg.h"
-
-void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
-                                   uint64_t param, uintptr_t retaddr)
-{
-}
diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
index 9eac0e69ca..3555b15bdd 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -1,6 +1,5 @@
 i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
   'misc_stubs.c',
-  'svm_stubs.c',
   'seg_helper.c',
 ))
-- 
2.25.1


