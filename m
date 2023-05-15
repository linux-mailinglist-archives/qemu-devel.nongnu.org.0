Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312D702FFF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 16:36:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIB-0007Wp-Ss; Mon, 15 May 2023 10:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xi-Iy
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGV-0004wG-NG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:33:43 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1aaf706768cso98044685ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161210; x=1686753210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2X0vEktAU9CIzOCMmP9cn2Oif9GXs/gZcvny2bfDX8=;
 b=S3dWbWCLjrZXoFH7472Pjl+571El8373lbF7dk4WJUBI0rTU4i/Txyf1n6UtCmu9VI
 QJ8yRupr+THchXWcWJxfW4Hr3+ZwVWxXsNI+iv6mztqxf+0kh/YWpUB2cfmJH4ec/bCy
 tL8thNR7atdDRtk/mSwY7biLgi3k341i/iY3tATsOw/6z+2NAr9geDxnqeX1bFZPahrR
 Hu+swDy7z+63Ep017ZIVZF1YzWG8tTCiMZ0y3wlP2EZLWlbvlqnuOZnqAdQXXHqMXNUP
 IcLys6D2LzbECBqyPVRRcEqgzai1tlNB8s2K4sgp/mImJIb67VFe39FFepjLujY39ZOL
 85yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161210; x=1686753210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2X0vEktAU9CIzOCMmP9cn2Oif9GXs/gZcvny2bfDX8=;
 b=Uy4mqyXgg5VXWxoRXGl+B84DFkpzKXHbjY99dZQGsu/yGsZ3j6emqa2ToYzKALM4M4
 leT+53joPCRSbTbtTrmuV8YW7THQYCk1A7ezWq8ZxarHLBrXAYQtnyxG9iNBrFaoNYmy
 lHMV5+6q4wgyMmf7v35RR4B0BckDad4qzll3xND1J4HfslxonULFmOLvti7xnPKY39P+
 wpY/rpUMzzJreTVulvikAwF7JmR1vjoXyXdpkiGSNruUQvlK53MGsRc+J/ap0iNcxqwl
 6ZIU0BRsjAVmvnL2ZkHgj2YsD3klmglCjoSfhI6kX45aEFVahdf1mI4/aaUsbVn0MrOI
 aE9Q==
X-Gm-Message-State: AC+VfDy0VGt1IRI+iePO6/fr1F/Iwf2KNR34GoEFVLs2m5GTpfe/J6QH
 L9ZB8ITq7a8UzcAPRtiCmrjEM8g/ZgJGE6w0ACU=
X-Google-Smtp-Source: ACHHUZ4GKNRW3A13UROrBOrhNtjBGv3PBgbHbVehNEyhu8kwqwU8wMhUKrALR34X6qJZ/urUvdZ2Tg==
X-Received: by 2002:a17:902:da8f:b0:1aa:e739:4092 with SMTP id
 j15-20020a170902da8f00b001aae7394092mr47032971plx.52.1684161210351; 
 Mon, 15 May 2023 07:33:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 18/54] tcg/loongarch64: Use full load/store helpers in
 user-only mode
Date: Mon, 15 May 2023 07:32:37 -0700
Message-Id: <20230515143313.734053-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d1bc29826f..e651ec5c71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -783,7 +783,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  * Load/store helpers for SoftMMU, and qemu_ld/st implementations
  */
 
-#if defined(CONFIG_SOFTMMU)
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
@@ -822,35 +821,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-#endif /* CONFIG_SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1


