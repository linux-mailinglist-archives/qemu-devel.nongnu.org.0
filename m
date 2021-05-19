Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CA3895B0
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:44:25 +0200 (CEST)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRBA-0004Eb-GC
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyk-0004Ed-72
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:34 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:41597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyY-0005lO-C9
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:33 -0400
Received: by mail-oi1-x22f.google.com with SMTP id c3so13977025oic.8
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8VIKm9TP9R9oeV0rPUDGQSAoAin6wclJNR1errvIaDs=;
 b=njwVGGVfHfsTCzmj2UZdKfKnTV/n2TZK77JDZDVqdtHXeWJhJqW/vtCsPITGRhBCdX
 /vWTnzMAvhI/joyazkkp/wI2ljKwNerrsuuiKIHj+22wZXYrFq9msWYkDyTnkDJpTGv9
 SxNv5oKC1tnhmSO/jT/EZ2YkfgjglvLFtDN+QXoTdgiZNG5+/BMKmOmlo4/sAdRCvwWE
 w68U0pVuV7+Ejz+YAgqSYdKYs5CNkSa2T2keeiWvfHRMv28GWGo0/ytPbc0ZLWSJ3U2u
 ZivKj4pwub3pD8qcXh4Bh17dp6AOgkHCTrfWWfez0yW/D/wVVJVt8YyrZlnMW0qpuWOy
 P0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8VIKm9TP9R9oeV0rPUDGQSAoAin6wclJNR1errvIaDs=;
 b=VZMByBpAs+xqq7CabceovtkfQOPYDvLtnE+DKp8JPGVwyNu5RYyypT9gCWWdKdmLE+
 8xjeQsNJynF03dnk6yo4zCmIGEcemKLC35l6WRETOxDWOYvDoGlAXsuAO8Cjo6O1cRMC
 i4lE6NMP16CCNVi2v8hyL624V0PJp1zA1qt86RoSWQoJ4G/ITPvozTTJCyzd+lRMOijc
 b9k+Ecz3WtkEIAPFcOT6mbk2x1iybGRg06xghzW93r7CzGTY0RMOWD4OekTH1qr+/tRK
 6j6CejZwBwVGLHY+Z+Y8nk++6jZEFA3dWQBXk5em3rwpZh6r7qqNdZu30Rkw+BA6L741
 kBYw==
X-Gm-Message-State: AOAM531xdJvS3b1+9xVup0Hl4y3+9LsH2F8P8cTHzMxAYr3YmiPGKGjf
 9vJFl8oti2JdqMaoBNlegy8hOjbeWqu/wsUu
X-Google-Smtp-Source: ABdhPJwgd55qo9P3GbXcDLyo6nApgeBfsBhSg0lDZyeUhEIcbvyGsFycEhjecAz5IUcTLilzunpNkA==
X-Received: by 2002:a05:6808:128b:: with SMTP id
 a11mr531117oiw.88.1621449080026; 
 Wed, 19 May 2021 11:31:20 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/50] target/i386: Reorder DisasContext members
Date: Wed, 19 May 2021 13:30:28 -0500
Message-Id: <20210519183050.875453-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
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

Sort all of the single-byte members to the same area
of the structure, eliminating 8 bytes of padding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-29-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 226fb62ccb..5c321b338e 100644
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


