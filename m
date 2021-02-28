Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07E32756D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:00:23 +0100 (CET)
Received: from localhost ([::1]:37648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVz4-0003yd-Aj
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPs-0005ij-Tr
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:00 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVPi-0007lc-37
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:00 -0500
Received: by mail-pg1-x52e.google.com with SMTP id t26so10374621pgv.3
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LaK3xHS/fvHJ2f1smHUqdXOOyUpc8PJcLS6WrecJURU=;
 b=Dm5NkehuYLOzmdU35O0j/RlAwZGbXA3HZbrc2uDP37KDD59aaKRSxGpsRJH+1B50Zv
 5/r7FZl5v0/eYA+hW3zCqYEd/kfpSjtUcAvMN9ak7ds+WtzS8EKe/hr0fMN2fKUgqUiP
 XZoNh4qEeNDUzT0FQm3i5Lit7eEvQS1sbojm764jvFf4CBeAOgP5wuDsY1nld50A56c2
 APBn0j3dDoIzhuJiSHuOQ4HX8lNo+feoHbozfFkRdEdnhBR/9zG5dg71T6W0Svj+fEgp
 YM2nrg5v2CjjYpnhuZigK6yMsztrjSOGWNzIAgKDkIGTJQjfM3zHEeS8w5Q3eUZdvlIA
 PiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LaK3xHS/fvHJ2f1smHUqdXOOyUpc8PJcLS6WrecJURU=;
 b=bqJnkd+NsToL3zLdxaRAtaMrrj3v8IRKwlRjt8Khy4ZW7d1PGImm4LOevIpDiLmPX/
 KsqnhSMgnTEGHj88XomaeHSxzD1NibfBYleKBGdsxcRgv33UVBmWBc9QbEhc9TzGDwod
 AXLftsxXRwC4rPQHBDTa5pkcXUD0Zp6wkFxu9dinsbAXXF3P4h90oIdtJVM76hnU5Pyq
 MlvWtCTDvG2Sx9WDG+yHpXtPfqO9YLc2tuknZI/b1b5Ulq2kIv+CzUUcq48DDg+XdgUk
 jApwBxlW7u7dfflSjyRMGhARCE9LDGDTcHPEajg+tjDinNLBk9GhN8mPAYH6gIe+ya0Q
 bK+w==
X-Gm-Message-State: AOAM531atkIJ7UVcqwzT1RUf/nESK57OBTCDXJuDZSmjt/dEmVM1Lxvx
 8Bp0gaIZVPxJGFsG3n42KrbQMNa5F5BBnQ==
X-Google-Smtp-Source: ABdhPJxmDozFzDShtOATNWajLr5I1OIqOmI62Lo1GHSkSF+mS8qwoOrxTBhkI/m8ecPCTSrcvt5LzQ==
X-Received: by 2002:a65:4088:: with SMTP id t8mr11463969pgp.296.1614554627590; 
 Sun, 28 Feb 2021 15:23:47 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id d24sm16257400pfn.54.2021.02.28.15.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:23:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 28/50] target/i386: Reorder DisasContext members
Date: Sun, 28 Feb 2021 15:22:59 -0800
Message-Id: <20210228232321.322053-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

Sort all of the single-byte members to the same area
of the structure, eliminating 8 bytes of padding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 36dee5c0c7..f0bc2df98c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -76,20 +76,24 @@ static TCGv_i64 cpu_bndu[4];
 typedef struct DisasContext {
     DisasContextBase base;
 
-    /* current insn context */
-    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
-    uint8_t prefix;
+    target_ulong pc;       /* pc = eip + cs_base */
+    target_ulong pc_start; /* pc at TB entry */
+    target_ulong cs_base;  /* base of CS segment */
+
     MemOp aflag;
     MemOp dflag;
-    target_ulong pc_start;
-    target_ulong pc; /* pc = eip + cs_base */
-    /* current block context */
-    target_ulong cs_base; /* base of CS segment */
+
+    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
+    uint8_t prefix;
 
 #ifndef CONFIG_USER_ONLY
     uint8_t cpl;   /* code priv level */
     uint8_t iopl;  /* i/o priv level */
 #endif
+    uint8_t vex_l;  /* vex vector length */
+    uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
+    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
+    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
 
 #ifdef TARGET_X86_64
     uint8_t rex_r;
@@ -97,16 +101,13 @@ typedef struct DisasContext {
     uint8_t rex_b;
     bool rex_w;
 #endif
-    uint8_t vex_l;  /* vex vector length */
-    uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
-    CCOp cc_op;  /* current CC operation */
-    bool cc_op_dirty;
     bool jmp_opt; /* use direct block chaining for direct jumps */
     bool repz_opt; /* optimize jumps within repz instructions */
+    bool cc_op_dirty;
+
+    CCOp cc_op;  /* current CC operation */
     int mem_index; /* select memory access functions */
     uint32_t flags; /* all execution flags */
-    uint8_t popl_esp_hack; /* for correct popl with esp base handling */
-    uint8_t rip_offset; /* only used in x86_64, but left for simplicity */
     int cpuid_features;
     int cpuid_ext_features;
     int cpuid_ext2_features;
-- 
2.25.1


