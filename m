Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950E55BE44
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:49:57 +0200 (CEST)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Ai-0000gE-2w
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kZ-0002sN-DT
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kX-0003xB-4r
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:54 -0400
Received: by mail-pj1-x1029.google.com with SMTP id l2so10194605pjf.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=rDzqmofjl4o98bp+xn1VuN1Q8v0nCh/xUhzrCMEqK/teEdEpqEyuNefE09ALI9d0sx
 8wI+TdkeqFEUvweY+mNlnD0EeyEtKC8a+GS0vParPXMv/rjacvpAW/30xRYYy23ebKYw
 LunZOOpFdhvT3DehNPa6kAFYv36JaSJhLe3pdZMGy/wiB9s8U0byXLwAVF5rAuYIMSlI
 7I0iLlxzIlncM/441iqepljy8hI3P9VPJxSmmK84OpbLdBONduKSejvDEliCSIoBFj4q
 91sF9VN3pobXF/EIrWtrUioxz50nVRiupACfX7B3BFktYfzH0mmv69ctnbOq1B2cClG9
 bf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=MjLRawW2a9jCCZlDpS8YNvu/lTniRSW0au/YALcAf+Ej8jzgQ3q5veHyTuhTDMa3nR
 E31PPCfFRWID7BIHIBqX0114LLO+cD0rNQ7Rkvv4z/YNIspKCX62e4UwDuxC/X3QqaaT
 frZXoLVAA9GbN4D5UxQjB46iMJt0ukVa8r1XvZMB8Mvo6s+DWj+KeXG4mWlMaNUZpfZ4
 brMetrJOxLc/FmIc2B8m4KYDN8eGJISYkFH1BHUKam09n9AT3KtYZBXVn4XLqERoDhXV
 P7V5gDflPlLWDhSU6XdXOA/R1vb3xjXyEeF4/lSDd0OvDwsvwiBDTcuu3tKMV0Y7HFGQ
 4fGw==
X-Gm-Message-State: AJIora+GY366TgLrW66q0SxZ/aGTpyoCLxJ4VmKo10BQYmDbd9y8gjV6
 +oBbELuDyI8BrWzXGuqS5woIeEh/Y6tW/g==
X-Google-Smtp-Source: AGRyM1smO3xpfqKjxN3DXHrSd9IPWaTcre+PBw9skAy/51+IaY17K5Tl4deAsWe62DLmWnh5gfGz+Q==
X-Received: by 2002:a17:902:e382:b0:16a:23a0:9530 with SMTP id
 g2-20020a170902e38200b0016a23a09530mr3000637ple.128.1656390170373; 
 Mon, 27 Jun 2022 21:22:50 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Tue, 28 Jun 2022 09:51:09 +0530
Message-Id: <20220628042117.368549-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1


