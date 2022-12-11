Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF536494EF
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:38:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG7-0006Zh-5m; Sun, 11 Dec 2022 10:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFv-0006Vz-NU
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:45 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFj-00084b-TI
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:38 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 m7-20020a9d6447000000b0066da0504b5eso5824187otl.13
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4asYNccrx+BoU0MZdEMWP1GIa6QY2NIQn/AOiNqMEuM=;
 b=PGYc+c7KPgL8q5LcoXEzzt1Mc8Xif7H1P4/oAc/ANdrBEgMPd5zypMph0Jw+GfGlfY
 ujoFKhbSq7atBBMOy7lxniQRp317tVXuziSJDQWDTgM4+HkudYK1TRlD25I6wqYMUi9n
 t3ffy/foZl0KCkUxxiy+bgH2HPN517NAZIvEGm0S9Zt7nK/F3QluKTTZVKZpmevF3KGU
 FAgE/8OtfEbBdOtJI92bzI3R8jDXfUCdoAT/mKLVxIc3ulC6BY4pqJatqrPpBf0yPCkl
 yjXQszyl2yVfmdKX5NxmHjuBngcnpPSMiVklqDRLtjas+mC7Zsd6B+uSTN7+UwKYpwXb
 d8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4asYNccrx+BoU0MZdEMWP1GIa6QY2NIQn/AOiNqMEuM=;
 b=nAi1AOOdyKRQRXtnjVyjTWj06Ir7Y6GVGfbriD/XjZNXw6lmZm7A50pWG7Pk0KNvF1
 GueIJ5LgqGLw3asxtTGUDz3EVzPM0oOvOYiilc9ZNNpICeEKcJStfV1gNd9aYR6bnGwt
 kgXGIlRejBzfksl1IxvgZaWKjhovn+qdYUfdZlRS2XVLfo1J0VuiYegWvNkAvmquz4L9
 qh1lUhyzzw+NZEHoTSkR4Hyp2nbDh+ZSy/jqAEIgcHcCxElkQY8wxHf3tzq6odiybeNn
 qTk/OrycLGVhD5wU1rtLetdjd50nskX6uqd/n3gGVCgvPZs+6n+ia89iUCKCZty+tyMa
 U/3w==
X-Gm-Message-State: ANoB5plqwfGng7pX2ZiDvjOQRAjZmCzoAMoZ4MxBjCPHrtwihQoig0sJ
 Py+f+cS7DI4n4OAubdA7KgqPDidKFn4j9GeN3Ag=
X-Google-Smtp-Source: AA0mqf5Dm0rRWKTZIEw1QvBR30x1uWajn1T2aRj3WnEsaEjDaZ/74AQl+VHZ6sS5zqpuBHDZxxAaIQ==
X-Received: by 2002:a9d:7f0d:0:b0:66c:8b9f:86ef with SMTP id
 j13-20020a9d7f0d000000b0066c8b9f86efmr6277381otq.21.1670772510851; 
 Sun, 11 Dec 2022 07:28:30 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 22/27] target/s390x: Split per_breaking_event from
 per_branch_*
Date: Sun, 11 Dec 2022 09:27:57 -0600
Message-Id: <20221211152802.923900-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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

This allows us to update gbea before other updates to psw_addr,
which will be important for TARGET_TB_PCREL.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b7c0d24d75..6006db3db2 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -353,7 +353,6 @@ static inline bool per_enabled(DisasContext *s)
 static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
         gen_helper_per_branch(cpu_env, gbea, dest);
     }
@@ -363,7 +362,6 @@ static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
 static void per_branch_disp(DisasContext *s, int64_t disp)
 {
 #ifndef CONFIG_USER_ONLY
-    gen_psw_addr_disp(s, gbea, 0);
     if (per_enabled(s)) {
         TCGv_i64 dest = tcg_temp_new_i64();
         gen_psw_addr_disp(s, dest, disp);
@@ -1153,13 +1151,14 @@ struct DisasInsn {
 
 static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    per_breaking_event(s);
+
     if (disp == s->ilen) {
         per_branch_disp(s, disp);
         return DISAS_NEXT;
     }
     if (use_goto_tb(s, s->base.pc_next + disp)) {
         update_cc_op(s);
-        per_breaking_event(s);
         tcg_gen_goto_tb(0);
         update_psw_addr_disp(s, disp);
         tcg_gen_exit_tb(s->base.tb, 0);
@@ -1173,6 +1172,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 
 static DisasJumpType help_goto_indirect(DisasContext *s, TCGv_i64 dest)
 {
+    per_breaking_event(s);
     tcg_gen_mov_i64(psw_addr, dest);
     per_branch_dest(s, psw_addr);
     return DISAS_PC_UPDATED;
@@ -1233,6 +1233,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
     }
 
     /* Branch taken.  */
+    per_breaking_event(s);
     if (is_imm) {
         gen_psw_addr_disp(s, psw_addr, disp);
     }
-- 
2.34.1


