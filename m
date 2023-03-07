Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8946AED24
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbJ-0007QO-Pn; Tue, 07 Mar 2023 12:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbau-0006fW-Jp
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:26 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbar-0000Kw-P3
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so17407557pjh.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ImLB6Rh5nw6ztijPbZ883h2yMXE/Z5Lmh08GEzH/LHI=;
 b=WmkiY0pCuIcvRKikPGdMVEG7WLfL8yPbkbmWE1UJUM8qBA50mP9UkWd0kq6p53nsZz
 Xa/FLU3wGl06pagVCZT7NSsP3Px3h5KrSPY+rYHOr88+IL8WLcQlSTmsyY/yQmpBoSsv
 kFjyaGDiSNkBS7TIgAogzpCKCOJM0ZGVJglFJPwplKPkrcbR9LrpbpfWONQfCahKY/bU
 8vxA7+DxzIa35FI5186L6xVQ7j9eXEbRCtX6fMu/EcFQrmdSbyI8rs67F+vNGW0FlY2t
 d/pybgiDCEZEGOPLFCCpJ+diJFP3lnE+CdC3hqAtV9AG7XyQJmqI+DzfV9J6v2aJeQMj
 NE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ImLB6Rh5nw6ztijPbZ883h2yMXE/Z5Lmh08GEzH/LHI=;
 b=YxO4fEg1Ko3guqIh1mUCRyBRXFzAjoyPPpLLys6E13Dx5jr23KQbP/q61awcdT5QcE
 DBTw2dvlAiYAGnLIU0H61OPX5ETbhqUhLXC5pJ70TSwI27yOahNACkpNBNaadqIjyBwi
 vIJGgndy6aUuJcygLkerMyaiHDqRLTJ9PMTKR9olKAJh8atFkFLDz1LJYqRr7dyZ9IxV
 aXn+IJW8VAerpBeSWVSmpmhkH90HxBE3g6IVdOcGNwHCVn/Vw21bne6DGS9b37h+Iq8q
 mKNiVhaBRNZOS0VNvIvnOlBci1Ql7JvzXgHRzYYlvZ3ub3qxvGD4aliiZEt9kshPCwLw
 UEGA==
X-Gm-Message-State: AO0yUKVDaHp8WJhy51Z84bTfhnOND/41t3lRFvCHxsqgzU8AiTts+37F
 RkzknlaYAFOJGFgjk/MuFDCfsVRkxynpgZ9nyx0=
X-Google-Smtp-Source: AK7set/yPKaYA1/UohXW1Db/sYalFoBEzbQzsbRPjWal4SbaKWIvjLc+J1wOPGJNZTMW5Gfb17I5Hg==
X-Received: by 2002:a17:902:d543:b0:19b:22c2:26a1 with SMTP id
 z3-20020a170902d54300b0019b22c226a1mr15523195plf.9.1678211959988; 
 Tue, 07 Mar 2023 09:59:19 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 38/67] include/exec: Remove guards around `NB_MMU_MODES`
Date: Tue,  7 Mar 2023 09:58:19 -0800
Message-Id: <20230307175848.2508955-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Message-Id: <20230306175230.7110-24-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 7d9e1f50d8..e230bb59f5 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -56,9 +56,7 @@
  * Fix the number of mmu modes to 16, which is also the maximum
  * supported by the softmmu tlb api.
  */
-#ifndef NB_MMU_MODES
 #define NB_MMU_MODES 16
-#endif
 
 #define TARGET_LONG_SIZE (TARGET_LONG_BITS / 8)
 
-- 
2.34.1


