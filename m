Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37A380D6A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:38:16 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhZtH-0000vR-Ip
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZW3-00060H-P1
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:16 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:34715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZVz-00075p-AP
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:14:15 -0400
Received: by mail-qt1-x836.google.com with SMTP id v4so13606053qtp.1
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xSG0WK6aqqzArID2n/deDaww/C15r1oi1z+ppOwhpzI=;
 b=HmLWvw2uLLghBDnbOAF9nksua1dSk4bDfsiZ54Jg1L4jk6GXFA33YwGADw18iBBeHY
 TxCLxmg2YGi7VAqDZKzpB4GNL2b+IMX6myJdQlLOqNQ65iGPWJnrgPL516Q4udd3kc+h
 PoOC0dKv3FlldDLeMTCvR9EusWdFYG0fuMq7x8Bnh6lT7FzR7bvcsBnBNrKIpu8dQQgl
 b2c2uKJaztIE0HL7T4gEKazJoQhjo+vt5SXKu66MZB6ukh2yv+Sf/IGQVfYZPqQtLXq5
 smYZm4NmSBbwHxk+55kj070bwOYmNxQL3N4tlDveSDoVTqibSh2G1PLmzovUxqyVxytQ
 JSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xSG0WK6aqqzArID2n/deDaww/C15r1oi1z+ppOwhpzI=;
 b=U0CKKL7Lyhpkdbs9YPIuIp++HLQ9/SRiGCpQXG/4ggP8YTxYYOOt1hBHZ4H9uxYpwE
 gFXNtzbt0mgGy4djCZI4dtU611mcBUpPmAGvxt/7jXJz1rtRbTTzTtS9C83l4OWbtqZi
 CNtAd704vO6y3coP1a8ZLixwmAkAdXinVD6cbmwo7cVguZdHelDuYhHfnGYMfWwJuzYC
 E0WsEP8UMCF/T6aKarGZaM4xtP6pyDOskEaS3/wpb6yHbFYFm5DL0chyUvtJ7VP9U/Aq
 1ke22PRkm3XAB94oTK4T0n/wyjVuWwAgTYd+AgMXXwzt3xOENNTrhBu5QXEN/pqlopeA
 NPfg==
X-Gm-Message-State: AOAM532a45kp34tcYdPpnUHx7c9KrgWpLqbqkNhxUFf53TugE9hsyb13
 0499FZwsbtwOkdlu908OxjC25W7YB1/dfeovxuw=
X-Google-Smtp-Source: ABdhPJyECpb1PgttLyb9SaP3588VRb97ZagdvPJ4C1fMlfjhDnOhklEkwjIMvLw+mOvL1yQGn4CZgA==
X-Received: by 2002:ac8:5d10:: with SMTP id f16mr42753227qtx.123.1621005249982; 
 Fri, 14 May 2021 08:14:09 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id u6sm4778966qkj.117.2021.05.14.08.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:14:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/50] target/i386: Reorder DisasContext members
Date: Fri, 14 May 2021 10:13:20 -0500
Message-Id: <20210514151342.384376-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sort all of the single-byte members to the same area
of the structure, eliminating 8 bytes of padding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d48c0f82a9..18f1c0342f 100644
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


