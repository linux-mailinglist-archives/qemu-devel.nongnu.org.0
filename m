Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC826AED3A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbaq-0006Ui-AW; Tue, 07 Mar 2023 12:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaj-0006Pu-7Z
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbah-0000I1-NQ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:12 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bo22so14023566pjb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HOK54ZQcFWT8pHkFcvcSWvkzGAnMCfCEOzJyAfh6Z2U=;
 b=m+GzaROSnDYgyfu3BOzcyjGVCDFfk/ndaiqkSffCHPmB/41JvBPSqMFfbytUboO5qO
 fsPgSjjLjCAs9XYDZFN5r0YVDQ8D0rApGTKRzHFmnBZ3uqz0h/xiY8Zu6hjINyTtaWxX
 5FinVszExQQbBVd7KIZoEH0viRubO6iWk5Df9+e/2+gzLitCgX4u08Z7w8C+PVmJwv6c
 mEISpa9vOlmxs8adikCR/QE0krappJRnMwx5JMyZeLIxIxgWWQr8HC6IR9kQYqq2+oNJ
 yZmkDLD4jYmvggs9paEpZvS9A9HtQKDsqaSwi8gu3rCuOOket2BfbH2jRdtBCQupEWoc
 BnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOK54ZQcFWT8pHkFcvcSWvkzGAnMCfCEOzJyAfh6Z2U=;
 b=547FGm8CAs9iNzwC8j/eFStD9x91iqmm4iWwNowTdkkqLSBF7AYr0IXpQmlu7LQy1M
 4miNsGyt2LxBfGe68n5M7I9VDZJ7h5nTLhPZAFljQPCOUItTA1LkCVIQM71i4x++plOQ
 Xyfe34Bx9s11PP3XMl76Guc59EBXgZHX7lj9PVI9JsbZYjDquj4H+tIjpyLto2cuIvsT
 cPBfUYQV7VXJSwmddnzJT++vdoE9raArrN86c1gOWfF3U7ZGTJMr28kAflQFN3EARaV7
 t8Bb3DZFF7OJU82tmWckccz+sERDUzZ5fHDMPHAlzRNTJdo0VkNXMvrX6JY3LmH8x+TJ
 DBxA==
X-Gm-Message-State: AO0yUKVBx9dmXk3g108uS0sZW+FSYLs78EtY9egA9Pmu0CwSBC86ucGu
 TEOrpUSo59D6jt2+pht0S+hZfNEnJ1iFd6u6Hs4=
X-Google-Smtp-Source: AK7set9pKqsejfEBcC0sbaN/FkJHylIZ4eDonwh/2VFH/eX2URLsZOQuo3dMQxfENw+n9Zjew6RqNA==
X-Received: by 2002:a17:902:ea0d:b0:199:4be8:be48 with SMTP id
 s13-20020a170902ea0d00b001994be8be48mr15874325plg.19.1678211950373; 
 Tue, 07 Mar 2023 09:59:10 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 26/67] target/microblaze: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:07 -0800
Message-Id: <20230307175848.2508955-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-12-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu-param.h | 1 -
 target/microblaze/cpu.h       | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/microblaze/cpu-param.h b/target/microblaze/cpu-param.h
index 5e54ea0108..9770b0eb52 100644
--- a/target/microblaze/cpu-param.h
+++ b/target/microblaze/cpu-param.h
@@ -28,6 +28,5 @@
 
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 3
 
 #endif
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index f66df02226..88324d0bc1 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -394,7 +394,7 @@ void mb_tcg_init(void);
 #define MMU_NOMMU_IDX   0
 #define MMU_KERNEL_IDX  1
 #define MMU_USER_IDX    2
-/* See NB_MMU_MODES further up the file.  */
+/* See NB_MMU_MODES in cpu-defs.h. */
 
 #include "exec/cpu-all.h"
 
-- 
2.34.1


