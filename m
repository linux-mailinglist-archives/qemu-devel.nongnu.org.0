Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1F65AE725
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:03:18 +0200 (CEST)
Received: from localhost ([::1]:45146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXIO-0003K1-DB
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeX-0003Fo-K9
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVeU-0005Bj-Nl
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:17:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bq9so1787697wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/5fBWGcV8KP0yYWYzeZW+deZNVZGvo9JuykELaazvaY=;
 b=v/WboH7nf7YgTog6IrOBVtOYE62pxS/CyMkZrAqDIbNgFuXqogDjumtOUJL//DLgY9
 o9Ny1g1ie23aRIKcnHH1RgvhAJkG9NRQCx/cAfZ2T+w5m0iywroVlmTZp5ekTkU8dPhR
 QZUensN4+VyWG5YuGQu1n56VLpQMP9rC24x+871XlPZd0B5JdzM8nXQp1/pPjFP/jrgJ
 fUu3tQJBIru8kCUMTSJG0kYKpVUDMWWECH0rbgdpawlzIW3Ijymo/t0MnJcEMQ7HEEgr
 tLVTheVSHQNpf9NwY/O45d/Ok/C63yGI7peVRFMmM8nxJA2zMTk115wjAk5uBKdRuaZ8
 k+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/5fBWGcV8KP0yYWYzeZW+deZNVZGvo9JuykELaazvaY=;
 b=7bHQpc3PhkvKh2h3xuhT0lbHxa+T3YnItRdG19fMv9dLY4QQiSb65Zwh+6uEPnNjCw
 791nyr+AxkNe6YCU13XPVhVVKhmjmQHxucdsy6t66gxc+MoPcU/qvZHTS27ElUK5KWuN
 hvACo3qUem5yWs0bzYe5HOVnUFpYUDXy1wub7ibSV70WubGodM3n4vFS00hWs+AkBRQ8
 IC/Qbl+AcJOMX4Wd/uYCVkBrbicgZGL+ZbwRGaVR7ZjzugxY1S7znt25V1AF/aAEtwXH
 ywLqvhXIh0aaYXqjjPqilFcLZngptVKHhCInExnZzd77GqWVVQdStEcotd47E5z1R/Hc
 43kA==
X-Gm-Message-State: ACgBeo2vtvKhNq5TNX/8lRRpEVDPSg7acEYUZvyg6CFamPSQWpDKN+bx
 X+UD9F+x1m/mX5kekRBDE+w9flFgv6Hpi1Kl
X-Google-Smtp-Source: AA6agR5YiYKa/vse6s7nwHTcHnvQKEktagq70tJaxFP6zh8xbsYU+ujaEfZ6MlaU7lHNhC/pUfV5QA==
X-Received: by 2002:a5d:4707:0:b0:226:f89a:ca3e with SMTP id
 y7-20020a5d4707000000b00226f89aca3emr13875130wrq.454.1662459473308; 
 Tue, 06 Sep 2022 03:17:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 05/26] target/s390x: Change help_goto_direct to work on
 displacements
Date: Tue,  6 Sep 2022 11:17:26 +0100
Message-Id: <20220906101747.344559-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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

In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index f8cfddc181..b6e4005670 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1145,8 +1145,10 @@ struct DisasInsn {
 /* ====================================================================== */
 /* Miscellaneous helpers, used by several operations.  */
 
-static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
+static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
 {
+    uint64_t dest = s->base.pc_next + disp;
+
     if (dest == s->pc_tmp) {
         per_branch(s, true);
         return DISAS_NEXT;
@@ -1169,7 +1171,8 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
                                  bool is_imm, int imm, TCGv_i64 cdest)
 {
     DisasJumpType ret;
-    uint64_t dest = s->base.pc_next + (int64_t)imm * 2;
+    int64_t disp = (int64_t)imm * 2;
+    uint64_t dest = s->base.pc_next + disp;
     TCGLabel *lab;
 
     /* Take care of the special cases first.  */
@@ -1185,7 +1188,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
             goto egress;
         }
         if (c->cond == TCG_COND_ALWAYS) {
-            ret = help_goto_direct(s, dest);
+            ret = help_goto_direct(s, disp);
             goto egress;
         }
     } else {
@@ -1558,7 +1561,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
     pc_to_link_info(o->out, s, s->pc_tmp);
-    return help_goto_direct(s, s->base.pc_next + (int64_t)get_field(s, i2) * 2);
+    return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
 static DisasJumpType op_bc(DisasContext *s, DisasOps *o)
-- 
2.34.1


