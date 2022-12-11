Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF76494D7
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:30:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OG5-0006YB-98; Sun, 11 Dec 2022 10:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFo-0006Rd-Bz
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFg-0007Xs-0i
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:36 -0500
Received: by mail-oi1-x233.google.com with SMTP id v82so9072456oib.4
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hn2aWC+olD3a/3u7MBKa85o65R+akJavbUiaCuhehyg=;
 b=J8LdAAuSXj26EZXicR8LdIXskfJ925erkMd8ce2dgvtrI/m+Oo+o81UIGd8Duh8HIB
 wKsGnOfvcCGBu631rBY29ex2guWrnDoH7mIFDZQArmOcNJhbCP7XsLIZIKwn3R61i+36
 1Z3pXwBfMkoSHH9yX8OkzO2sAAYuEKlBO6i9JS0/ZvBcTamZHZJ3hWFt09A40Mz4julj
 klg47YuWRMJtr5GYYsgpFaGvWfjjwJ36huxyOKxThLI4XxhwAAHh9q21AOXdFP/S+5iJ
 6TeWIah9mKmXtfJuNpUwg0NnpJu1a0T3htFa1Zw0+BMSJ4tA+jLZG3dM+FJcn6nRCo5S
 PdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hn2aWC+olD3a/3u7MBKa85o65R+akJavbUiaCuhehyg=;
 b=EkmfT80eqqNb+xByOen7cvVhrgk8/oHuiVpgNtLjl2Rm3lEnCgzU4QV5u9g3EtkVnq
 c6Xo4WrJctR0JgCiIWAi2zUBUkjvQXeFPSNc8yBPKNPc8+q/xCdYMjV0P0FL/4MtxAKY
 Z6MjKBgt4InqCNtg+AOimZ5BaK52M+HVQOJtEnONoLmoDU1JPV+ee3CbaGymKouaUHCD
 ShnXSmrH7oeW0YV/ZLddlRsx/uaOAIhnTiWHvuMhGv4ZfBsKJH+9MF8rHXpy/V52qwN4
 /MWfQp7IDwIn4fQrz3n+usqIYO4VTKDDxS2AyCEmdIDQPL3mLMbssZM2c00tE0gWUlaZ
 cgfQ==
X-Gm-Message-State: ANoB5pmfF3hxi437iru40oDg+1kwnA+oYsaABLMFFiGm9vY68SXIHZxv
 i2/1tI5WID3sPm68f5cP8wa5ap+2ST08T+8i3Cg=
X-Google-Smtp-Source: AA0mqf5sILGulRl4Vj2mSMloz0PeVJ/htcgpJ2Wc1uQHBs2N3PimZhkFCn150iAaFuLmy8lEYq+x0Q==
X-Received: by 2002:a05:6808:f93:b0:359:d1ae:7863 with SMTP id
 o19-20020a0568080f9300b00359d1ae7863mr7254926oiw.22.1670772496842; 
 Sun, 11 Dec 2022 07:28:16 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 10/27] target/s390x: Use gen_psw_addr_disp in
 pc_to_link_info
Date: Sun, 11 Dec 2022 09:27:45 -0600
Message-Id: <20221211152802.923900-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is slightly more complicated than a straight displacement
for 31 and 24-bit modes.  Dont bother with a cant-happen assert.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 4e23ae8361..f5b97fe1c4 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -176,17 +176,20 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
 
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
-    uint64_t pc = s->pc_tmp;
+    TCGv_i64 tmp;
 
-    if (s->base.tb->flags & FLAG_MASK_32) {
-        if (s->base.tb->flags & FLAG_MASK_64) {
-            tcg_gen_movi_i64(out, pc);
-            return;
-        }
-        pc |= 0x80000000;
+    if (s->base.tb->flags & FLAG_MASK_64) {
+        gen_psw_addr_disp(s, out, s->ilen);
+        return;
     }
-    assert(!(s->base.tb->flags & FLAG_MASK_64));
-    tcg_gen_deposit_i64(out, out, tcg_constant_i64(pc), 0, 32);
+
+    tmp = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, tmp, s->ilen);
+    if (s->base.tb->flags & FLAG_MASK_32) {
+        tcg_gen_ori_i64(tmp, tmp, 0x80000000);
+    }
+    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
+    tcg_temp_free_i64(tmp);
 }
 
 static TCGv_i64 psw_addr;
-- 
2.34.1


