Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CC350A9E3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:24:08 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhdLT-0002Kc-CN
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhdJA-0000LC-Lc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 16:21:45 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nhdJ7-0004R1-Nq
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 16:21:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x1so6025721pfj.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xVf4iokWexMV030TaknTfH315kU+FmQ8wNmZdJeClU=;
 b=kuRt8ZT7HxyXI6ig5X2OhuxVuZ1KO9BSIeUbOsxHDg8kx7U1VLeabXGKVyw5D/GAYo
 GEzBXKbPg0cWfLFNCL3fp/LjwF9f5A4u9vj4jQJup2J0PONEDzOXvEk62lXowYwnm9Ia
 gJ4FikL9a8fupzU53BxOrwhevXZTbM8zSZVWVAxmmluExtbg04YBahmDG9bZEp5iJi+j
 uLs7/5nH6ACFYlICEtpJu7j92WM4AN0+Wtt9/rag10Tw03+WDeYXmAH2r2rzbDIqAYDb
 es9FIAm64GhGDcWIcrmXMO2vWsB/ZgVQYkXYFxsawuYohS5SDT7sF4ZyuzQC6Z7C6ksA
 etOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xVf4iokWexMV030TaknTfH315kU+FmQ8wNmZdJeClU=;
 b=QB9Yb8OvsYSVFWzLU9mRvNbTKWlEWz21Y3gSzFnDx8euI4VwKIjGu2G/mWhiumamLk
 qsQzlkOjU2zQeeJuGpDTwo3F/8GkEQrcsyfBERDQxj/cLqhNZM/EGp/JpIe+bkUUnUre
 L97FGFIRwrdSNhHJ2RH6nEnQNREV4AQ2YpguKCJqzJZj897iMRrtyboKXHg6MWsMTa43
 g1HnWbr8VEuoSOkOeVsHIuqAmywLRjgFXuWqZ0yp/h8t/0+Yzey6vF3owteP/EYXnlDa
 oda/nC6o43TAhPdLpUEvfCSDpY5nBHqaoJlyahGLnhY6KQ6lISynMJIdU7W3vOSZwpsw
 fANw==
X-Gm-Message-State: AOAM533fHQRMz5Ge72bhj0ef8irln3pcCaf8e17og1DIRWZ2kzyRk8Rw
 fYraFqtRYC4c+I9l69+UuDJ2zGFjOI9nKA==
X-Google-Smtp-Source: ABdhPJweU5uy/ZFExS5vJ3Tr7ZbPXhSZQAOkk8ESoMp3iA+BgEiwpvjrRHq2i5QluSRW616NCjVBTw==
X-Received: by 2002:a63:6e43:0:b0:386:4801:13a6 with SMTP id
 j64-20020a636e43000000b00386480113a6mr948971pgc.403.1650572497989; 
 Thu, 21 Apr 2022 13:21:37 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a63a747000000b003991d7d3728sm24308098pgo.74.2022.04.21.13.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 13:21:37 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: add missing tcg_temp_free to gen_window_check
Date: Thu, 21 Apr 2022 13:21:26 -0700
Message-Id: <20220421202126.364580-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pc and w are allocated with tcg_const_i32 but not freed in
gen_window_check. Add missing tcg_temp_free for pc, use tcg_constant_i32
for w.

Fixes: 2db59a76c421 ("target-xtensa: record available window in TB flags")
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b1491ed625e5..f4dac27507fd 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -572,9 +572,10 @@ static bool gen_window_check(DisasContext *dc, uint32_t mask)
 
     if (r / 4 > dc->window) {
         TCGv_i32 pc = tcg_const_i32(dc->pc);
-        TCGv_i32 w = tcg_const_i32(r / 4);
+        TCGv_i32 w = tcg_constant_i32(r / 4);
 
         gen_helper_window_check(cpu_env, pc, w);
+        tcg_temp_free(pc);
         dc->base.is_jmp = DISAS_NORETURN;
         return false;
     }
-- 
2.30.2


