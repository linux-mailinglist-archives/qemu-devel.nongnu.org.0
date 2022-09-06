Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8E5AE62D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:05:45 +0200 (CEST)
Received: from localhost ([::1]:39128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWOm-0001lX-Bi
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWl-0000Gq-JV
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:58 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWj-0003c5-Ra
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:55 -0400
Received: by mail-wr1-x42d.google.com with SMTP id az27so14662117wrb.6
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rSER7sme+GIaasRDe61/7EyMKFpjNEQVvBAOzaCcze4=;
 b=aNUax3CR9ts3r9y2gPmUEbPMdnx1BNBDvTxe0AWwwx6i1xV/oKBaD+4RKee8B2Lb0e
 ZrWSDQzTj5d6GTkY5UngDTBtz0qLPAzFzCwYG5iONRqHLREu1x6xqGmgy6CVG/pDKDqY
 B6nxH7j7x2K4hy9jTbxbI2rj0A7gWJEJ923L741IRqMTSqli9LAy24498XynVuseOGtq
 JqgUX6LnD30RDUL16cVq78nZ+aSeaeOhieF/B11vP1qjl8ddy/cMZlFV97xKVR/tJf6a
 DHtqAcd1gESg9pwRpL63iuZeQQM71P06A+t4dFMERMGI6gTipzKd1vfGjs+0mAYeIDu8
 e8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rSER7sme+GIaasRDe61/7EyMKFpjNEQVvBAOzaCcze4=;
 b=Kf/pi2RD8zut868HAKa65lShNW8unXAIxJSsOkDq/qfN8mfzFHHspkVJuP1u6tTw8O
 93mkPOSFHukn3L2a/91yXEzpvqd3Nwo24nN++Sx5S67PGsxdPkh0hmsn12+yMo2QxNC2
 DI2mK2XDHb+7KUZaN1RsayNiK5uuUesgNpZjnx0WppGbFFuGZpDo8BmUTS6UjzXk55CG
 mIslV/fWgSbznclbSpJMWQVgza2a3uMK5MQ5eszzY7cDeSz7dzhDdkQU9wcFncuzlDpN
 dN+0fCFNfoqd8G8SuDYP8kJz52RBRP0CzPanVNaNCgQwAM6GA0ZI9cfksbGHjY8241QI
 GpYA==
X-Gm-Message-State: ACgBeo2XFhGhdcFTTBhTv+y0b1suGNNVG/2hbuvt8HK/B8KN5NhDPdZe
 tLhuSsJqt51s1wdPOzgVRhVLs4gAv7op2NDP
X-Google-Smtp-Source: AA6agR5+KiIiwpGZPiHcciLqXW11HZgNmS3JTM4iXqhn9U3bfyWC94vLqhLnfTVD5r5ogqjWOlqEWg==
X-Received: by 2002:a05:6000:1805:b0:228:60f7:4dfb with SMTP id
 m5-20020a056000180500b0022860f74dfbmr8103305wrh.351.1662458992555; 
 Tue, 06 Sep 2022 03:09:52 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 19/23] target/i386: Use gen_jmp_rel for gen_jcc
Date: Tue,  6 Sep 2022 11:09:28 +0100
Message-Id: <20220906100932.343523-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 57 ++++++++++++-------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fdd17c3cf3..e27f36e4e9 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -2373,32 +2373,14 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     }
 }
 
-static inline void gen_jcc(DisasContext *s, int b,
-                           target_ulong val, target_ulong next_eip)
+static void gen_jcc(DisasContext *s, MemOp ot, int b, int diff)
 {
-    TCGLabel *l1, *l2;
+    TCGLabel *l1 = gen_new_label();
 
-    if (s->jmp_opt) {
-        l1 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_goto_tb(s, 0, next_eip);
-
-        gen_set_label(l1);
-        gen_goto_tb(s, 1, val);
-    } else {
-        l1 = gen_new_label();
-        l2 = gen_new_label();
-        gen_jcc1(s, b, l1);
-
-        gen_jmp_im(s, next_eip);
-        tcg_gen_br(l2);
-
-        gen_set_label(l1);
-        gen_jmp_im(s, val);
-        gen_set_label(l2);
-        gen_eob(s);
-    }
+    gen_jcc1(s, b, l1);
+    gen_jmp_rel(s, ot, 0, 1);
+    gen_set_label(l1);
+    gen_jmp_rel(s, ot, diff, 0);
 }
 
 static void gen_cmovcc1(CPUX86State *env, DisasContext *s, MemOp ot, int b,
@@ -4721,7 +4703,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     int shift;
     MemOp ot, aflag, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
-    target_ulong next_eip, tval;
     bool orig_cc_op_dirty = s->cc_op_dirty;
     CCOp orig_cc_op = s->cc_op;
 
@@ -6881,22 +6862,20 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         break;
     case 0x70 ... 0x7f: /* jcc Jb */
-        tval = (int8_t)insn_get(env, s, MO_8);
-        goto do_jcc;
+        {
+            int diff = (int8_t)insn_get(env, s, MO_8);
+            gen_bnd_jmp(s);
+            gen_jcc(s, dflag, b, diff);
+        }
+        break;
     case 0x180 ... 0x18f: /* jcc Jv */
-        if (dflag != MO_16) {
-            tval = (int32_t)insn_get(env, s, MO_32);
-        } else {
-            tval = (int16_t)insn_get(env, s, MO_16);
+        {
+            int diff = (dflag != MO_16
+                        ? (int32_t)insn_get(env, s, MO_32)
+                        : (int16_t)insn_get(env, s, MO_16));
+            gen_bnd_jmp(s);
+            gen_jcc(s, dflag, b, diff);
         }
-    do_jcc:
-        next_eip = s->pc - s->cs_base;
-        tval += next_eip;
-        if (dflag == MO_16) {
-            tval &= 0xffff;
-        }
-        gen_bnd_jmp(s);
-        gen_jcc(s, b, tval, next_eip);
         break;
 
     case 0x190 ... 0x19f: /* setcc Gv */
-- 
2.34.1


