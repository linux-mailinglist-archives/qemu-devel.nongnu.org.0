Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6663C352B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:35:05 +0200 (CEST)
Received: from localhost ([::1]:49150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F0S-0005Dx-FJ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExJ-0004wg-RA
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExI-0002CB-0v
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id y17so13140004pgf.12
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VN95zM/QiA1dKqmcNx9SH5nqAvJGbQXCoyX6bpKYZ80=;
 b=xwApZ3sXPHwhMQLPV31hIAce4ZF4vSuX2WMx0cgfJeditQZIT/JV8M1OibGCCek0Z+
 X0LJ+AyM6q1TOM6Q080db4hcmtMgXOK7pUXr3v9fKUc/J5k0cdf8gRtkqR/6iPNQbJ2c
 ZS9RAznldlgrFTW6vumK9T4euxhpPX13gJfyOqy8zS/bEkKUt87VFLEYPSaCzwtqjVDz
 1LNZ5CFm2aAQfhl2kJWuC36SdC6ll5PbwTN5zfpgrYGBT5ueApxqCOF/5DrZ+myMQ80S
 jN6sWITDEG/fau8VbwiIbsfwF67THHZudk4PW50/nMAxO0QX68iOV7AOxOw8Dud2ZWOB
 uDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VN95zM/QiA1dKqmcNx9SH5nqAvJGbQXCoyX6bpKYZ80=;
 b=KDAzLAERM0sFQwD2+J+0IoT/5Q99JIKyk1ubxkJIkqIs//syNUte7lUcKXpXe16rI0
 6jWcL2fybzyiUBbbpsUWzouWco/z7i4sLrFTu2ybL+pRSapJZ17Qn8IM0GJGV8RpMCGN
 Lq3UMRQp/IPZrIRqcxDQZJfgk77i6yA93PCq4lU28hvuCM8HfnPgfbA/vABELQEqhmdE
 gEWJcWCXUiMRL5FRyPqyD2dzWRls/v661/uoCUvdHeDRScrRpfjd3aFWq+4iy+VvWARt
 i9sxxp4wdGZKoWMxeXtjBkt1h9rgztK5RjCL7qMyP9NSaaMml7T7Q0hjsH2zmBv9AJzc
 gh2w==
X-Gm-Message-State: AOAM531EBCh1HHKyUzwWPsS312wEcythqvVpqOO4UeUp46gMoPB0/E1t
 nXWiGDTVk9SozLFFiQ9N/cMtZziLn/ZXXw==
X-Google-Smtp-Source: ABdhPJzPGQmqAbKOQVPL5JFqmvSKnFbGdar07i/Nho9x97hOjv8LNth7FHh7cTEdicUraopbz1JKCA==
X-Received: by 2002:a63:5946:: with SMTP id j6mr45108065pgm.0.1625931106894;
 Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/41] accel/tcg: Hoist tcg_tb_insert() up above tb_link_page()
Date: Sat, 10 Jul 2021 08:31:05 -0700
Message-Id: <20210710153143.1320521-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Liren Wei <lrwei@bupt.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liren Wei <lrwei@bupt.edu.cn>

TranslationBlocks not inserted into the corresponding region
tree shall be regarded as partially initialized objects, and
needs to be finalized first before inserting into QHT.

Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
Message-Id: <f9fc263f71e11b6308d8c1fbc0dd366bf4aeb532.1625404483.git.lrwei@bupt.edu.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7929a7e320..75e4d06557 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1657,6 +1657,13 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         return tb;
     }
 
+    /*
+     * Insert TB into the corresponding region tree before publishing it
+     * through QHT. Otherwise rewinding happened in the TB might fail to
+     * lookup itself using host PC.
+     */
+    tcg_tb_insert(tb);
+
     /* check next page if needed */
     virt_page2 = (pc + tb->size - 1) & TARGET_PAGE_MASK;
     phys_page2 = -1;
@@ -1675,9 +1682,9 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
         qatomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
         tb_destroy(tb);
+        tcg_tb_remove(tb);
         return existing_tb;
     }
-    tcg_tb_insert(tb);
     return tb;
 }
 
-- 
2.25.1


