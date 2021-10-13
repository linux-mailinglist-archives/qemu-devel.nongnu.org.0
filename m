Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DBF42C8AD
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:28:53 +0200 (CEST)
Received: from localhost ([::1]:55988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maizk-0003jN-6B
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitz-0003pT-Jc
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:55 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maitu-00033J-4Q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:22:55 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ls18so2884503pjb.3
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g7vb1DiY7NwJL2MkD8o8UL44MwU+VnbJvJpghPXqqyM=;
 b=PgY0dfqyKpxPmEjLOlz2Uc8zpSUmLXqkpxnppMOIn067Hc4OWaeB8/vibJyYt9VXwb
 d/4fQfHJwrq2Pvf+ZJX6kDII8yMVsvrwXxQ3NOBd3O49jZiuPsYTJrO1guQrvPVH4P7X
 4aMtO19N+aWEAzlY+QukLmb9WnyTrB2sqwIVbLuPr1lK/nTypvu2id+isOkdVyag/SzE
 IvCRI5u+k3lkYmdHWkrGomgsIVSta16XO42i7i9VtTApMx3p7cVnKe+SG/3yjXlXdeH5
 d6Dgdj0JzsYBeBJ1nqwNh1pFsOpFmanLnUrkthG46QAXbzoqDjLPvVqOIfO8sD5AxTYl
 QyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7vb1DiY7NwJL2MkD8o8UL44MwU+VnbJvJpghPXqqyM=;
 b=HpE4kDSqkwKmarlFhBux/bCusd0iH/3I5YWnmGVRGOJgnu8o+/W5XDUPMcpRFz7D0t
 uaxN3LQXUdK+wHC9+vHPJu6tcROfDksisodfqWap17IwPtjibU6yGt3325BEjr9Rf6hU
 T9YG2PwoZtXUIZRmFdMPYjJtnIMwzF7BzmCGctJ78Z1jvfSyY4e0EimTZlGUkWsXSTTR
 S6d0AgQv0jVxjyVVB81fnQx26rRAxk29ErhqIhFBr1qauflx4AWh5h7bjcKkINd79BP6
 vmEWQiEoLia+deUr3I+tR/9H7jz7zEmKIvVDYpM4LQ8FMVRx6PitxQfaxtfqpOZjby84
 383Q==
X-Gm-Message-State: AOAM531J9pYMpDAiG0JMHXl8EOuDAqqc+N/0DD7Tl0qF99U/uDI93oQa
 2dhYOU1z4l9PPCs0uaCXvkSdGcKUz2q0Gw==
X-Google-Smtp-Source: ABdhPJxte1QrSHDIjCM+67KUszg4N//6dudVu/jU7uxDVFm63/fPUBD4xX2/qQ5eU5saPXiRko7SNQ==
X-Received: by 2002:a17:90b:4a47:: with SMTP id lb7mr939129pjb.1.1634149368775; 
 Wed, 13 Oct 2021 11:22:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/15] target/hexagon: Implement cpu_mmu_index
Date: Wed, 13 Oct 2021 11:22:30 -0700
Message-Id: <20211013182239.991127-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is trivial for user-only, but still must be present.

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
index f7d043865b..f90c187888 100644
--- a/target/hexagon/cpu.h
+++ b/target/hexagon/cpu.h
@@ -141,6 +141,15 @@ static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
 #endif
 }
 
+static inline int cpu_mmu_index(CPUHexagonState *env, bool ifetch)
+{
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
 typedef struct CPUHexagonState CPUArchState;
 typedef HexagonCPU ArchCPU;
 
-- 
2.25.1


