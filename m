Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D978327560
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:53:22 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVsH-0005bI-6j
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:53:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQN-0006cB-12
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:31 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQK-00082H-VO
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:30 -0500
Received: by mail-pl1-x630.google.com with SMTP id e9so8765590plh.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H5E7k9OmH/UhmHw5sMuUJjf7Rg3ut1g/2JQo4GVdgNQ=;
 b=pmEGnKGxowTK+UcFC+rtEK3+hvwetbkr6B1LIxkOK6F1tkGMlWnjzddqPgYVRxoMfu
 ngcmvS57M+5VHb/FocBUP4C7TSFWCF+umpQWXqBVd/9eA34/rm1sxJ0h+v3RHE3n02Bo
 nTBfq6iB07trOqfOCoI2XE+uzGBrXXPe87/LmCkg/Hn1DrMZkdnzuxBZTNQEF5vd9JX4
 8ktzJxoGgp0IAxtkd542mBacp7hBdMIZRZVy0jXZdvcVhHDV4AoOHdemBPXpViz9hfOh
 aV6ghHbEr6knP/mP2b/PfoHSYJ1d9U4IOOHKq62PVsL57v1a225wPtOdBbv1vOyWGd9r
 CGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H5E7k9OmH/UhmHw5sMuUJjf7Rg3ut1g/2JQo4GVdgNQ=;
 b=WhA45lAKNipB98TlLwP2viOkjMOkHcWrnlGSxfYAZWJ1JjvIjNKyGpKEtc1y+KqLgR
 uEdAej4tqwSewKXBPM4b8OSHXbP2gVBc3k18bDcdIojKYa02g9u4i2ALdNsd0O5tDEVu
 f56PSfTsWHBCwNm0sh1Yq0oV+IAhusQqZ8w7MX5CqTpnLz+0L7rDa4Yonn/fCHU3EBnp
 mBxzljf9pRCzPE/Rg+6Dy07QH7yMZxcyzsfg5eqSo2UMM7cg/IWiUK7drLyrmhtS/ne8
 1aDrOagcc63YX9IlOvmISbesECuMHM0eWcmm4sxugXvOVSBw5vODrPdHNGno+NmaCGtd
 c1tA==
X-Gm-Message-State: AOAM530um9qz4/GKDNn30Vkkp72jpjq2qeABWuJN1JslA3EB6MmAnd7f
 3BShOlwSFpy6cYABmVi6RbQwUT2Naxv2LA==
X-Google-Smtp-Source: ABdhPJwIQ82XqSLDJOkDV0/u5GNhFv7MHK8ChX4VggGHl3Ov5PVC4Buf6K1QqEyl9prcUCWldmrVMQ==
X-Received: by 2002:a17:90a:74c6:: with SMTP id
 p6mr13926695pjl.134.1614554667785; 
 Sun, 28 Feb 2021 15:24:27 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 43/50] target/i386: Inline user cpu_svm_check_intercept_param
Date: Sun, 28 Feb 2021 15:23:14 -0800
Message-Id: <20210228232321.322053-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The user-version is a no-op.  This lets us completely
remove tcg/user/svm_stubs.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/cpu.h                |  8 ++++++++
 target/i386/tcg/user/svm_stubs.c | 28 ----------------------------
 target/i386/tcg/user/meson.build |  1 -
 3 files changed, 8 insertions(+), 29 deletions(-)
 delete mode 100644 target/i386/tcg/user/svm_stubs.c

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index a1268abe9f..70b26991dd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2129,8 +2129,16 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
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
index 345294c096..16a0be1ae6 100644
--- a/target/i386/tcg/user/meson.build
+++ b/target/i386/tcg/user/meson.build
@@ -2,6 +2,5 @@ i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
   'excp_helper.c',
   'misc_stubs.c',
   'fpu_helper.c',
-  'svm_stubs.c',
   'seg_helper.c',
 ))
-- 
2.25.1


