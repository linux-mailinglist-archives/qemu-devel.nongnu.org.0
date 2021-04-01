Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21406350D53
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 05:56:17 +0200 (CEST)
Received: from localhost ([::1]:36818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRoRM-0003Db-2J
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 23:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoP1-0001QL-7A
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:51 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@qualcomm.com>)
 id 1lRoOx-0004r5-S5
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 23:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617249227; x=1648785227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n6j68wYMhV7h4ri3a9upiqg16kMnWYDyLD0qbnPA3HU=;
 b=mqpqUi5G8wRfOLtkPq5xf78pB6GvRtpmYRrDoxPqH8YqX3/DrhIYLjE3
 TmizHgKfZ5JgtxBDbxWZIouTHwDuTBa2EdSpwMYVajmW79nI872uYGS+I
 Wk5blH+y1TY6lBPyRWQomv545tBdb+EWVNKmlZyvnIXDPV8R5pv3bKHCM o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 31 Mar 2021 20:53:42 -0700
X-QCInternal: smtphost
Received: from vu-tsimpson-aus.qualcomm.com (HELO
 vu-tsimpson1-aus.qualcomm.com) ([10.222.150.1])
 by ironmsg01-sd.qualcomm.com with ESMTP; 31 Mar 2021 20:53:41 -0700
Received: by vu-tsimpson1-aus.qualcomm.com (Postfix, from userid 47164)
 id BBC81110F; Wed, 31 Mar 2021 22:53:40 -0500 (CDT)
From: Taylor Simpson <tsimpson@quicinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/21] Hexagon (target/hexagon) change variables from int
 to bool when appropriate
Date: Wed, 31 Mar 2021 22:53:18 -0500
Message-Id: <1617249213-22667-7-git-send-email-tsimpson@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=199.106.114.38;
 envelope-from=tsimpson@qualcomm.com; helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: ale@rev.ng, philmd@redhat.com, tsimpson@quicinc.com,
 richard.henderson@linaro.org, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/cpu_bits.h  |  2 +-
 target/hexagon/decode.c    | 80 +++++++++++++++++++++++-----------------------
 target/hexagon/insn.h      | 21 ++++++------
 target/hexagon/op_helper.c |  8 ++---
 target/hexagon/translate.c |  6 ++--
 target/hexagon/translate.h |  2 +-
 6 files changed, 60 insertions(+), 59 deletions(-)

diff --git a/target/hexagon/cpu_bits.h b/target/hexagon/cpu_bits.h
index 96af834..96fef71 100644
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
diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index 65d97ce..dffe1d1 100644
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
diff --git a/target/hexagon/insn.h b/target/hexagon/insn.h
index 5756a1d..2e34591 100644
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
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
index 7ac8554..1d91fa2 100644
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
index 49ec8b7..0468422 100644
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
diff --git a/target/hexagon/translate.h b/target/hexagon/translate.h
index 0ecfbd7..97b12a7 100644
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
-- 
2.7.4


