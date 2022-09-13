Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8D5B70F3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 16:38:53 +0200 (CEST)
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY73s-00064g-Kn
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 10:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tn-0003pQ-Oo
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:45900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY6tl-0006xv-95
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 10:28:26 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so9615788wmb.4
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 07:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LabXsfMoB7femwXbme12AwMySpTk+r3xGFXtank1s5U=;
 b=z8W58EH9OVRCLspmjAZGsafZeIVCIZ7w7mwgdirng21h9BV5Br3xEGwAQ6ZZCGYLtk
 YcrLxiVgWULlwGhivfvrwr09Yalj+IrrQGgSVbTD0sfdZ7R9DSX25hUVuXJf2Dt8giu9
 y542NvD6wZX4Ib6EFrDvnuOD4DUHanjWWpgJ+T7F5+1S3zyFMu5yUPzhaA+BupGwsTuh
 FTwjBRYHEcBsWghV0sJafF0fmuH5ID+ADOBofLbnm48hqccsss3AjeViN7lMRiXqflvv
 qdhqU7WNFKkOsZxkXBVxbZ9JpIyqtcyBW1Eg8vOlEq+Xbu2A9gjlwaD7X/6HPZijD9J1
 dXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LabXsfMoB7femwXbme12AwMySpTk+r3xGFXtank1s5U=;
 b=eKH1L//KpC5LLgE+rwGGRcC6aIAYSpPE0dePToFnIIh1JN7lmAkN9g+L4dWehSZEUp
 q9QH3z+Hmh1R17pBJ+sjHMD4eCUWSgwTaZkSDFTOESuQAyRSz+uMS422Cu+YSvTRI6oW
 FA+djXSQRVneRCPxsJvRlvMKOaEtTYVksFnyK4aN8iiw9+FZ6sQWogg4UcfYKje7U8DQ
 k9+LKOM7CGFOctO5RCVpsNEoHg9hXPraQWekUOSmjx/Vpyv3RmbRoZHZdrBg+5acdG+q
 Wo53PqizzRUQ+1rtxTlx3WlwLRUKJ4AigOvDdwgyBUXBxUqd1ckDyKOSUCXpsilUongG
 u8QA==
X-Gm-Message-State: ACgBeo3YmYZrnPA8fF5ORZeaDdTYpzerE14DjlGPuh8rOZLn5kyjkdeu
 kwVUy+Hn/6q0CoZkJwuOGTwRSJjrsMfPBfW8
X-Google-Smtp-Source: AA6agR72jsK4+wIZClBwJtS8CRKvUp1s+zPNLjF1a7o39+BQ/g2OzCcd3QKHQ9h7S0R0tyIWqnDasg==
X-Received: by 2002:a05:600c:34d6:b0:3b4:91fd:cfc with SMTP id
 d22-20020a05600c34d600b003b491fd0cfcmr2697359wmq.1.1663079303823; 
 Tue, 13 Sep 2022 07:28:23 -0700 (PDT)
Received: from stoup.. ([89.101.193.68]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d5951000000b00228dc37ce2asm10673165wri.57.2022.09.13.07.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 07:28:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
	mark.cave-ayland@ilande.co.uk
Subject: [PATCH 1/2] target/m68k: Fix MACSR to CCR
Date: Tue, 13 Sep 2022 15:28:17 +0100
Message-Id: <20220913142818.7802-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913142818.7802-1-richard.henderson@linaro.org>
References: <20220913142818.7802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

First, we were writing to the entire SR register, instead
of only the flags portion.  Second, we were not clearing C
as per the documentation (X was cleared via the 0xf mask).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 5098f7e570..87044382c3 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5892,8 +5892,10 @@ DISAS_INSN(from_mext)
 DISAS_INSN(macsr_to_ccr)
 {
     TCGv tmp = tcg_temp_new();
-    tcg_gen_andi_i32(tmp, QREG_MACSR, 0xf);
-    gen_helper_set_sr(cpu_env, tmp);
+
+    /* Note that X and C are always cleared. */
+    tcg_gen_andi_i32(tmp, QREG_MACSR, CCF_N | CCF_Z | CCF_V);
+    gen_helper_set_ccr(cpu_env, tmp);
     tcg_temp_free(tmp);
     set_cc_op(s, CC_OP_FLAGS);
 }
-- 
2.34.1


