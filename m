Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DBC370D93
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:09:09 +0200 (CEST)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDiW-0008O5-V8
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKn-0001aP-OJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:37 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:46771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKf-0005CY-OR
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:37 -0400
Received: by mail-pf1-x434.google.com with SMTP id q2so2361936pfh.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yx4G4Iv5ZatKfDFJ7Be+L669qIe/zhze2py593an1Pk=;
 b=JvMPAr+dO0ZpntPqQcmTLW6ZwD4edoi5pv1gIPxQvgE3cvu9WYA3nUbOooH6iWSg4b
 Ifr6grV5Dbs6vOL9/7P9KONaW0pYYmZQ2W/ouWIx+LDkF7Rzp93oG3TgJeVDkY1c9jos
 ScVk8fsHKymqSnGY7WQBrIylbuzPEg2GkIB/1B9Q6Q65j2lKrmxISMIllhrIOEKTt9Qb
 NmS2tm16jGgUK/b2Vakf8QQZn6tzZyH4hRCCnZhd2kmcxzTH3+K4v/sziTfaNccW1ox3
 5yv+HmF+sTmD2kZglJ42FS+GJbp1MPDEsGjndODfsEp4aJULYxUhq6sbVBwNM2CmbDmj
 2t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yx4G4Iv5ZatKfDFJ7Be+L669qIe/zhze2py593an1Pk=;
 b=PZ6A8+kxyoFrFk8lunXzbdkqqjfsaf8O/aYR3Rx6ooEgGxg6PyWUn4A3xjn00KPdhu
 vYsp03cygKC3GXQJ8Xkbn3/qVOvXmRkNOKaSHI1uxvb/7O9tgHlRE0eKXsxwn/rRdUcr
 mi+UO9DLO9/H8fB4RAXWhSbSM/IGPwYKZpLGYDa6yR5fymCKNsDz34P4L6lb3/3QXdPC
 2OS/IBzof02hlk82NsmlAMIujH1HFLGIHGCX5iRmi4b1ArAchDINo1CaaQCXZg5mHuE9
 1Lfs6gyvG47dlNnXkpCiuXzSIM/2PgTpQsh54VMWOO+K88f366z1O6pYT7dFzULO/bqA
 p+Ww==
X-Gm-Message-State: AOAM5331tC2FSfhuKWS4QnBZXy7FbgkdP1vkk9pfA00ewN5G6R1P3VNs
 lBIhVgJGC9fmA0TevtmfeOjV/IIPJRM6uA==
X-Google-Smtp-Source: ABdhPJy/8DABEo2vvkJw4HgKkKH0vjaIqHd1fiyt4HC1KMzKpz9cp3FH+Fb8fQmdLAaj6jmxgUq/+g==
X-Received: by 2002:a63:dc10:: with SMTP id s16mr14464469pgg.288.1619966668485; 
 Sun, 02 May 2021 07:44:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/31] Hexagon (target/hexagon) change variables from int to
 bool when appropriate
Date: Sun,  2 May 2021 07:44:00 -0700
Message-Id: <20210502144419.1659844-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-8-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu_bits.h  |  2 +-
 target/hexagon/insn.h      | 21 +++++-----
 target/hexagon/translate.h |  2 +-
 target/hexagon/decode.c    | 80 +++++++++++++++++++-------------------
 target/hexagon/op_helper.c |  8 ++--
 target/hexagon/translate.c |  6 +--
 6 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/target/hexagon/cpu_bits.h b/target/hexagon/cpu_bits.h
index 96af834d0e..96fef71729 100644
--- a/target/hexagon/cpu_bits.h
+++ b/target/hexagon/cpu_bits.h
@@ -47,7 +47,7 @@ static inline uint32_t iclass_bits(uint32_t encoding)
     return iclass;
 }
 
-static inline int is_packet_end(uint32_t endocing)
+static inline bool is_packet_end(uint32_t endocing)
 {
     uint32_t bits = parse_bits(endocing);
     return ((bits == 0x3) || (bits == 0x0));
diff --git a/target/hexagon/insn.h b/target/hexagon/insn.h
index 5756a1d0ca..2e345912a8 100644
--- a/target/hexagon/insn.h
+++ b/target/hexagon/insn.h
@@ -40,14 +40,15 @@ struct Instruction {
 
     uint32_t iclass:6;
     uint32_t slot:3;
-    uint32_t part1:1;        /*
+    uint32_t which_extended:1;    /* If has an extender, which immediate */
+    uint32_t new_value_producer_slot:4;
+
+    bool part1;              /*
                               * cmp-jumps are split into two insns.
                               * set for the compare and clear for the jump
                               */
-    uint32_t extension_valid:1;   /* Has a constant extender attached */
-    uint32_t which_extended:1;    /* If has an extender, which immediate */
-    uint32_t is_endloop:1;   /* This is an end of loop */
-    uint32_t new_value_producer_slot:4;
+    bool extension_valid;   /* Has a constant extender attached */
+    bool is_endloop;   /* This is an end of loop */
     int32_t immed[IMMEDS_MAX];    /* immediate field */
 };
 
@@ -58,13 +59,13 @@ struct Packet {
     uint16_t encod_pkt_size_in_bytes;
 
     /* Pre-decodes about COF */
-    uint32_t pkt_has_cof:1;          /* Has any change-of-flow */
-    uint32_t pkt_has_endloop:1;
+    bool pkt_has_cof;          /* Has any change-of-flow */
+    bool pkt_has_endloop;
 
-    uint32_t pkt_has_dczeroa:1;
+    bool pkt_has_dczeroa;
 
-    uint32_t pkt_has_store_s0:1;
-    uint32_t pkt_has_store_s1:1;
+    bool pkt_has_store_s0;
+    bool pkt_has_store_s1;
 
     Insn insn[INSTRUCTIONS_MAX];
 };
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 0ecfbd7d52..97b12a7d18 100644
--- a/target/hexagon/translate.h
+++ b/target/hexagon/translate.h
@@ -36,7 +36,7 @@ typedef struct DisasContext {
     int preg_log_idx;
     DECLARE_BITMAP(pregs_written, NUM_PREGS);
     uint8_t store_width[STORES_MAX];
-    uint8_t s1_store_processed;
+    bool s1_store_processed;
 } DisasContext;
 
 static inline void ctx_log_reg_write(DisasContext *ctx, int rnum)
diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index 65d97ce64b..dffe1d1972 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -340,8 +340,8 @@ static void decode_split_cmpjump(Packet *pkt)
         if (GET_ATTRIB(pkt->insn[i].opcode, A_NEWCMPJUMP)) {
             last = pkt->num_insns;
             pkt->insn[last] = pkt->insn[i];    /* copy the instruction */
-            pkt->insn[last].part1 = 1;    /* last instruction does the CMP */
-            pkt->insn[i].part1 = 0;    /* existing instruction does the JUMP */
+            pkt->insn[last].part1 = true;      /* last insn does the CMP */
+            pkt->insn[i].part1 = false;        /* existing insn does the JUMP */
             pkt->num_insns++;
         }
     }
@@ -354,7 +354,7 @@ static void decode_split_cmpjump(Packet *pkt)
     }
 }
 
-static int decode_opcode_can_jump(int opcode)
+static bool decode_opcode_can_jump(int opcode)
 {
     if ((GET_ATTRIB(opcode, A_JUMP)) ||
         (GET_ATTRIB(opcode, A_CALL)) ||
@@ -362,15 +362,15 @@ static int decode_opcode_can_jump(int opcode)
         (opcode == J2_pause)) {
         /* Exception to A_JUMP attribute */
         if (opcode == J4_hintjumpr) {
-            return 0;
+            return false;
         }
-        return 1;
+        return true;
     }
 
-    return 0;
+    return false;
 }
 
-static int decode_opcode_ends_loop(int opcode)
+static bool decode_opcode_ends_loop(int opcode)
 {
     return GET_ATTRIB(opcode, A_HWLOOP0_END) ||
            GET_ATTRIB(opcode, A_HWLOOP1_END);
@@ -383,9 +383,9 @@ static void decode_set_insn_attr_fields(Packet *pkt)
     int numinsns = pkt->num_insns;
     uint16_t opcode;
 
-    pkt->pkt_has_cof = 0;
-    pkt->pkt_has_endloop = 0;
-    pkt->pkt_has_dczeroa = 0;
+    pkt->pkt_has_cof = false;
+    pkt->pkt_has_endloop = false;
+    pkt->pkt_has_dczeroa = false;
 
     for (i = 0; i < numinsns; i++) {
         opcode = pkt->insn[i].opcode;
@@ -394,14 +394,14 @@ static void decode_set_insn_attr_fields(Packet *pkt)
         }
 
         if (GET_ATTRIB(opcode, A_DCZEROA)) {
-            pkt->pkt_has_dczeroa = 1;
+            pkt->pkt_has_dczeroa = true;
         }
 
         if (GET_ATTRIB(opcode, A_STORE)) {
             if (pkt->insn[i].slot == 0) {
-                pkt->pkt_has_store_s0 = 1;
+                pkt->pkt_has_store_s0 = true;
             } else {
-                pkt->pkt_has_store_s1 = 1;
+                pkt->pkt_has_store_s1 = true;
             }
         }
 
@@ -422,9 +422,9 @@ static void decode_set_insn_attr_fields(Packet *pkt)
  */
 static void decode_shuffle_for_execution(Packet *packet)
 {
-    int changed = 0;
+    bool changed = false;
     int i;
-    int flag;    /* flag means we've seen a non-memory instruction */
+    bool flag;    /* flag means we've seen a non-memory instruction */
     int n_mems;
     int last_insn = packet->num_insns - 1;
 
@@ -437,7 +437,7 @@ static void decode_shuffle_for_execution(Packet *packet)
     }
 
     do {
-        changed = 0;
+        changed = false;
         /*
          * Stores go last, must not reorder.
          * Cannot shuffle stores past loads, either.
@@ -445,13 +445,13 @@ static void decode_shuffle_for_execution(Packet *packet)
          * then a store, shuffle the store to the front.  Don't shuffle
          * stores wrt each other or a load.
          */
-        for (flag = n_mems = 0, i = last_insn; i >= 0; i--) {
+        for (flag = false, n_mems = 0, i = last_insn; i >= 0; i--) {
             int opcode = packet->insn[i].opcode;
 
             if (flag && GET_ATTRIB(opcode, A_STORE)) {
                 decode_send_insn_to(packet, i, last_insn - n_mems);
                 n_mems++;
-                changed = 1;
+                changed = true;
             } else if (GET_ATTRIB(opcode, A_STORE)) {
                 n_mems++;
             } else if (GET_ATTRIB(opcode, A_LOAD)) {
@@ -466,7 +466,7 @@ static void decode_shuffle_for_execution(Packet *packet)
                  * a .new value
                  */
             } else {
-                flag = 1;
+                flag = true;
             }
         }
 
@@ -474,7 +474,7 @@ static void decode_shuffle_for_execution(Packet *packet)
             continue;
         }
         /* Compares go first, may be reordered wrt each other */
-        for (flag = 0, i = 0; i < last_insn + 1; i++) {
+        for (flag = false, i = 0; i < last_insn + 1; i++) {
             int opcode = packet->insn[i].opcode;
 
             if ((strstr(opcode_wregs[opcode], "Pd4") ||
@@ -483,7 +483,7 @@ static void decode_shuffle_for_execution(Packet *packet)
                 /* This should be a compare (not a store conditional) */
                 if (flag) {
                     decode_send_insn_to(packet, i, 0);
-                    changed = 1;
+                    changed = true;
                     continue;
                 }
             } else if (GET_ATTRIB(opcode, A_IMPLICIT_WRITES_P3) &&
@@ -495,18 +495,18 @@ static void decode_shuffle_for_execution(Packet *packet)
                  */
                 if (flag) {
                     decode_send_insn_to(packet, i, 0);
-                    changed = 1;
+                    changed = true;
                     continue;
                 }
             } else if (GET_ATTRIB(opcode, A_IMPLICIT_WRITES_P0) &&
                        !GET_ATTRIB(opcode, A_NEWCMPJUMP)) {
                 if (flag) {
                     decode_send_insn_to(packet, i, 0);
-                    changed = 1;
+                    changed = true;
                     continue;
                 }
             } else {
-                flag = 1;
+                flag = true;
             }
         }
         if (changed) {
@@ -543,7 +543,7 @@ static void decode_apply_extenders(Packet *packet)
     int i;
     for (i = 0; i < packet->num_insns; i++) {
         if (GET_ATTRIB(packet->insn[i].opcode, A_IT_EXTENDER)) {
-            packet->insn[i + 1].extension_valid = 1;
+            packet->insn[i + 1].extension_valid = true;
             apply_extender(packet, i + 1, packet->insn[i].immed[0]);
         }
     }
@@ -764,7 +764,7 @@ static void decode_add_endloop_insn(Insn *insn, int loopnum)
     }
 }
 
-static int decode_parsebits_is_loopend(uint32_t encoding32)
+static bool decode_parsebits_is_loopend(uint32_t encoding32)
 {
     uint32_t bits = parse_bits(encoding32);
     return bits == 0x2;
@@ -775,8 +775,11 @@ decode_set_slot_number(Packet *pkt)
 {
     int slot;
     int i;
-    int hit_mem_insn = 0;
-    int hit_duplex = 0;
+    bool hit_mem_insn = false;
+    bool hit_duplex = false;
+    bool slot0_found = false;
+    bool slot1_found = false;
+    int slot1_iidx = 0;
 
     /*
      * The slots are encoded in reverse order
@@ -801,7 +804,7 @@ decode_set_slot_number(Packet *pkt)
         if ((GET_ATTRIB(pkt->insn[i].opcode, A_MEMLIKE) ||
              GET_ATTRIB(pkt->insn[i].opcode, A_MEMLIKE_PACKET_RULES)) &&
             !hit_mem_insn) {
-            hit_mem_insn = 1;
+            hit_mem_insn = true;
             pkt->insn[i].slot = 0;
             continue;
         }
@@ -818,7 +821,7 @@ decode_set_slot_number(Packet *pkt)
     for (i = pkt->num_insns - 1; i >= 0; i--) {
         /* First subinsn always goes to slot 0 */
         if (GET_ATTRIB(pkt->insn[i].opcode, A_SUBINSN) && !hit_duplex) {
-            hit_duplex = 1;
+            hit_duplex = true;
             pkt->insn[i].slot = 0;
             continue;
         }
@@ -830,13 +833,10 @@ decode_set_slot_number(Packet *pkt)
     }
 
     /* Fix the exceptions - slot 1 is never empty, always aligns to slot 0 */
-    int slot0_found = 0;
-    int slot1_found = 0;
-    int slot1_iidx = 0;
     for (i = pkt->num_insns - 1; i >= 0; i--) {
         /* Is slot0 used? */
         if (pkt->insn[i].slot == 0) {
-            int is_endloop = (pkt->insn[i].opcode == J2_endloop01);
+            bool is_endloop = (pkt->insn[i].opcode == J2_endloop01);
             is_endloop |= (pkt->insn[i].opcode == J2_endloop0);
             is_endloop |= (pkt->insn[i].opcode == J2_endloop1);
 
@@ -845,17 +845,17 @@ decode_set_slot_number(Packet *pkt)
              * slot0 for endloop
              */
             if (!is_endloop) {
-                slot0_found = 1;
+                slot0_found = true;
             }
         }
         /* Is slot1 used? */
         if (pkt->insn[i].slot == 1) {
-            slot1_found = 1;
+            slot1_found = true;
             slot1_iidx = i;
         }
     }
     /* Is slot0 empty and slot1 used? */
-    if ((slot0_found == 0) && (slot1_found == 1)) {
+    if ((!slot0_found) && slot1_found) {
         /* Then push it to slot0 */
         pkt->insn[slot1_iidx].slot = 0;
     }
@@ -873,7 +873,7 @@ int decode_packet(int max_words, const uint32_t *words, Packet *pkt,
 {
     int num_insns = 0;
     int words_read = 0;
-    int end_of_packet = 0;
+    bool end_of_packet = false;
     int new_insns = 0;
     uint32_t encoding32;
 
@@ -890,7 +890,7 @@ int decode_packet(int max_words, const uint32_t *words, Packet *pkt,
          * decode works
          */
         if (pkt->insn[num_insns].opcode == A4_ext) {
-            pkt->insn[num_insns + 1].extension_valid = 1;
+            pkt->insn[num_insns + 1].extension_valid = true;
         }
         num_insns += new_insns;
         words_read++;
@@ -913,7 +913,7 @@ int decode_packet(int max_words, const uint32_t *words, Packet *pkt,
         decode_add_endloop_insn(&pkt->insn[pkt->num_insns++], 0);
     }
     if (words_read >= 3) {
-        uint32_t has_loop0, has_loop1;
+        bool has_loop0, has_loop1;
         has_loop0 = decode_parsebits_is_loopend(words[0]);
         has_loop1 = decode_parsebits_is_loopend(words[1]);
         if (has_loop0 && has_loop1) {
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 7ac85549db..1d91fa2743 100644
--- a/target/hexagon/op_helper.c
+++ b/target/hexagon/op_helper.c
@@ -948,8 +948,8 @@ static bool is_inf_prod(int32_t a, int32_t b)
 float32 HELPER(sffma_lib)(CPUHexagonState *env, float32 RxV,
                           float32 RsV, float32 RtV)
 {
-    int infinp;
-    int infminusinf;
+    bool infinp;
+    bool infminusinf;
     float32 tmp;
 
     arch_fpop_start(env);
@@ -982,8 +982,8 @@ float32 HELPER(sffma_lib)(CPUHexagonState *env, float32 RxV,
 float32 HELPER(sffms_lib)(CPUHexagonState *env, float32 RxV,
                           float32 RsV, float32 RtV)
 {
-    int infinp;
-    int infminusinf;
+    bool infinp;
+    bool infminusinf;
     float32 tmp;
 
     arch_fpop_start(env);
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 49ec8b76ed..04684221ca 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -177,7 +177,7 @@ static void gen_start_packet(DisasContext *ctx, Packet *pkt)
         ctx->store_width[i] = 0;
     }
     tcg_gen_movi_tl(hex_pkt_has_store_s1, pkt->pkt_has_store_s1);
-    ctx->s1_store_processed = 0;
+    ctx->s1_store_processed = false;
 
 #if HEX_DEBUG
     /* Handy place to set a breakpoint before the packet executes */
@@ -210,7 +210,7 @@ static void mark_implicit_reg_write(DisasContext *ctx, Insn *insn,
                                     int attrib, int rnum)
 {
     if (GET_ATTRIB(insn->opcode, attrib)) {
-        int is_predicated = GET_ATTRIB(insn->opcode, A_CONDEXEC);
+        bool is_predicated = GET_ATTRIB(insn->opcode, A_CONDEXEC);
         if (is_predicated && !is_preloaded(ctx, rnum)) {
             tcg_gen_mov_tl(hex_new_value[rnum], hex_gpr[rnum]);
         }
@@ -354,7 +354,7 @@ void process_store(DisasContext *ctx, Packet *pkt, int slot_num)
     if (slot_num == 1 && ctx->s1_store_processed) {
         return;
     }
-    ctx->s1_store_processed = 1;
+    ctx->s1_store_processed = true;
 
     if (is_predicated) {
         TCGv cancelled = tcg_temp_new();
-- 
2.25.1


