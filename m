Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152815AE686
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:24:21 +0200 (CEST)
Received: from localhost ([::1]:57542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWgl-0004GD-Pu
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWg-0000Cz-Bp
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWb-0003a9-3y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id b16so14658163wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=or6wOuOr4muIKcJzZ8tCVjZ2Nate1g/5N3DAWPR5ll4=;
 b=pTN8eQqFJl1qzoPoz2I8CerRmqDH/9FwJ4Ews/tYq9T3bVb0FBf481g/XFyESQB19B
 1eeTljMQ+i+pGmyspMKEidy51A7L0UWNsQPFZ6/SWDPWD2rdZpVHEPCKlMoXL3bg6TlE
 5K4gxNLv7rABnOumEzsSs3jH8WbYOB4zfNf8nzoY2++F4Ww8Oiix68ClynJCIwOnPsb7
 NSF3dJVPdHReRYHptNj4ohViLi8bvqeJ88Bz7O1CMm6KU/WKebrrlVksVLtZWtuyJaHg
 DKPnUMpelU5ChfL3Fm3W1W+apUSg/HjVP7V6RUVjuadsF/M2ESayIgo/+wYFNHLDLZFT
 OR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=or6wOuOr4muIKcJzZ8tCVjZ2Nate1g/5N3DAWPR5ll4=;
 b=ebrZdQnP2S+LF+1ScT3tUUBcNzaJj4gHNDJTG9kY1TFy6LiGWDAIysm7Q1KJ8TCWmV
 e0t+FkiyIPlpHXl5rtB9Ks8qVe491RvLLCJXly/GrOaTA5KuJBInu5H4N+K1DG8knvu5
 ypYAeLvsedL51tgIlzm0U11KLutNdKAurVepDH4grZw0ep+1hxbq7Ms/3AtHtR+V9iGI
 D89mvcX59J14oDV4FTkq+VHfjmAFXgMAL02xm3FH4mvc8LxMc4NbhH99El9KYQEnkC36
 bjRSjH33nwhvB6q32kG5CSbYpDjWW3odtcuX2kB1rl8J3krZGvUoQPDfZxowjt3xoRhv
 HFOA==
X-Gm-Message-State: ACgBeo2Q5A703QyosrMaxj0P1XhFlIWv1NTsWTdZh/6J/+zY2J1cI4s4
 QnfJ5ey9sL1hfFiT7w42cD0fRRUG2tgiDQon
X-Google-Smtp-Source: AA6agR4vg+UpPe7ocrNWGh8MEwJDu8KoRGaPp9zw9mGJ4L3yr6PQxrfrDtDQmG5Iiirm+U8oVR+xbw==
X-Received: by 2002:a05:6000:1849:b0:228:c87d:2578 with SMTP id
 c9-20020a056000184900b00228c87d2578mr3437136wri.274.1662458983654; 
 Tue, 06 Sep 2022 03:09:43 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 10/23] target/i386: USe DISAS_EOB_ONLY
Date: Tue,  6 Sep 2022 11:09:19 +0100
Message-Id: <20220906100932.343523-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

Replace lone calls to gen_eob() with the new enumerator.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a7e5bcdec7..5b77414a0a 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6800,7 +6800,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             /* add stack offset */
             gen_stack_update(s, val + (2 << dflag));
         }
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xcb: /* lret */
         val = 0;
@@ -6818,7 +6818,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(s->pc - s->cs_base));
         }
         set_cc_op(s, CC_OP_EFLAGS);
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0xe8: /* call im */
         {
@@ -7404,7 +7404,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_set_label(l1);
             gen_jmp_im(s, tval);
             gen_set_label(l2);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x130: /* wrmsr */
@@ -7445,7 +7445,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysenter(cpu_env);
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
     case 0x135: /* sysexit */
@@ -7456,7 +7456,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_exception_gpf(s);
         } else {
             gen_helper_sysexit(cpu_env, tcg_const_i32(dflag - 1));
-            gen_eob(s);
+            s->base.is_jmp = DISAS_EOB_ONLY;
         }
         break;
 #ifdef TARGET_X86_64
@@ -8539,7 +8539,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_next(s);
         gen_helper_rsm(cpu_env);
 #endif /* CONFIG_USER_ONLY */
-        gen_eob(s);
+        s->base.is_jmp = DISAS_EOB_ONLY;
         break;
     case 0x1b8: /* SSE4.2 popcnt */
         if ((prefixes & (PREFIX_REPZ | PREFIX_LOCK | PREFIX_REPNZ)) !=
-- 
2.34.1


