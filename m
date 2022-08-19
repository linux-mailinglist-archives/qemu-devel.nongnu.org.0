Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B65993A6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:44:22 +0200 (CEST)
Received: from localhost ([::1]:50470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsvl-0007AQ-KQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseg-0002M8-QA
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:42 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOsee-0002mF-Oc
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:42 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 s31-20020a17090a2f2200b001faaf9d92easo6401076pjd.3
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=x19w7YfjB2h5oqwKEQEJIlPdiLtoIpQZ8bzoyerjNiU=;
 b=x3AnRLgh42tz7kLYNwNWqMXuPeqOytRLrrz7c193IvW/VsNoMwYZd/ftwSPHA84Mlr
 agTuSj3JCR8n7Ilpov8gsJumCK8jLiMqltflCXru6142c8dyBUZVGUfyyO/s0jSujlko
 ZmO2gh1VRTiwEx88BLaGp0f274BWjIEyFh6YJaQo94xnvl0wv97TjGPRsBIffhhtP9zl
 SwVy9MptYOX8NzwRR9pn7Yk2Qa2E1wrq1rtW6wrZKC2qepCS7NrnWLKUmlfFgaI2pbR1
 w8Mvx784Eono8H92WfNIQ7zANtxscFcVvqC+4dbG/3eoXKPcV6bviwLcypLLf7IQIVS4
 uUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=x19w7YfjB2h5oqwKEQEJIlPdiLtoIpQZ8bzoyerjNiU=;
 b=wy13lhDB0PyVjVfoXRf4qARR+OKDOxPh7eeaz7V60VmxyO51i1/aDUu/JAaXUz7gX/
 NODDkDJFYO7CaCJpYjzlWXeGnQ2goMIN3GnyK8g/BW1VOFvaX2RZjc2FHEnypMQk56F9
 fYgs55dOIgkKXcahi16oovggJ3SX5mCXxeOZKjG0vvar/C0EtpdHj9DaA6yOYrnB4bQg
 9Lo6LCgQuSqWR9pwN8lsbABTg5rXUAR1rx42Ojym7jVuvE5jeE8c2NZsLSDtblX+rSOR
 9gJMw0KEAp9ZaPx/Gs1SEby9b7I5JfHTHx1A68TZ6IAtWmY/3kZNjiU0m8dJzS2hShwV
 K4ZA==
X-Gm-Message-State: ACgBeo3oAG+J/c5YpzeMDpJXbJWYg1MXVMjqYUqoHteMb9g61ZNXKnmC
 I3YK7kp0cXoeVdo523YXgSZqOSG6ywWM3A==
X-Google-Smtp-Source: AA6agR7foEo/7M4C5ONOhvXQ8qEDEFguwnR+u/cXygoPZXDo9PsMwRUqDkwblXY+sMGxeAexNOqEBw==
X-Received: by 2002:a17:90b:4c8c:b0:1fa:c44f:473a with SMTP id
 my12-20020a17090b4c8c00b001fac44f473amr7587509pjb.195.1660879600002; 
 Thu, 18 Aug 2022 20:26:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 20/21] target/riscv: Add MAX_INSN_LEN and insn_len
Date: Thu, 18 Aug 2022 20:26:14 -0700
Message-Id: <20220819032615.884847-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These will be useful in properly ending the TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 38666ddc91..a719aa6e63 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1022,6 +1022,14 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
+/* The specification allows for longer insns, but not supported by qemu. */
+#define MAX_INSN_LEN  4
+
+static inline int insn_len(uint16_t first_word)
+{
+    return (first_word & 3) == 3 ? 4 : 2;
+}
+
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /*
@@ -1037,7 +1045,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     };
 
     /* Check for compressed insn */
-    if (extract16(opcode, 0, 2) != 3) {
+    if (insn_len(opcode) == 2) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
-- 
2.34.1


