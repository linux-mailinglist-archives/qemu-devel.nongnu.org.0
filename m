Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A84D46D8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:27:55 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHta-0002lF-63
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxq-0006Ka-Ie
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:14 -0500
Received: from [2607:f8b0:4864:20::42c] (port=33513
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxo-00083n-A6
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:28:13 -0500
Received: by mail-pf1-x42c.google.com with SMTP id s42so4890849pfg.0
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMOimEYkivNn0EOtJQFRq+oOiueoNqaCGaU7AEWQQss=;
 b=Byn5Go+LYQ2Av8Mi3qz+Sgft9F2TIfzHppda4474BXPpc/YF00oQaTNplQ4nLg4s6s
 hN81MvLAtXwaxAlB6QDXkjukpR+jTQapcQ9odadgwkv+NqRsFO4+Nkd00467hFQoWul/
 jMBoc/GT05z3+LkGF8nPbG1XxJiJ14V7chtG5Xgd6RL8p1F5MpMSb1f/Tjn9z/yCY0Pq
 7fJRkqxSs/5PjzgiMgyobduEgknCUDyEjPNx8AEk7y4TSQqqbDfj6aOuE9rdHBgTsdYt
 9LpMdbhMsF10nKZKYTfjV0V1FhA6LKneMcfJwuTOC4zfycXwC/3wVZAPKwY0JxPH4dQ8
 poCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMOimEYkivNn0EOtJQFRq+oOiueoNqaCGaU7AEWQQss=;
 b=wYzhODRRP2Qhn6GbxVK7yQ8zQE5Z6gxNnYoqkdfUwki0HC+48ZL1uwbNhnq5AbXZ8Y
 oYFWyKzWlsUV4XZgNHsAtGnflg4uGMRJr8x28Tj3keICCifFcrlT+1ArSWpqEVH3Xq1W
 vkkYJ27XgRQuO0a9ciZfQT4+VB+GO1HkirISUwLg03l7yzcJZ+IcxuxZKoHqrHtLlmHd
 RyEaG/EMGp+rcD7kfe/D/fya45f0j7HEToLAK3KQKwX/28qINLgr8X7CE1nqBjzc4kWg
 aV4NTI+AlRAHYZVdJ7TV1oXxKwQer3As9xO8JA7z+9OQbGwVHsI7RFO0SPRWCPYXbuun
 m43A==
X-Gm-Message-State: AOAM532I3JuLY6nv53K9Ik2cxp5OUS4xMN/NaWixo2zT+10BVpsKcQWr
 Cua7PltO/sRtMP1FDfzYEnvtXW7Y5P2LyA==
X-Google-Smtp-Source: ABdhPJx278faL2dcaWDpAEzYZRQocjV5AnwdEshwSqeJAbRv/WM3Nq6ADJqkmHzpvAryPF06ssqnEg==
X-Received: by 2002:a63:724b:0:b0:378:7967:e45c with SMTP id
 c11-20020a63724b000000b003787967e45cmr3753719pgn.602.1646911690234; 
 Thu, 10 Mar 2022 03:28:10 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:28:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 38/48] target/nios2: Use tcg_gen_lookup_and_goto_ptr
Date: Thu, 10 Mar 2022 03:27:15 -0800
Message-Id: <20220310112725.570053-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lookup_and_goto_ptr for indirect chaining between TBs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6f31b6cc50..f7bab0908b 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -163,7 +163,7 @@ static void gen_goto_tb(DisasContext *dc, int n, uint32_t dest)
         tcg_gen_exit_tb(tb, n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
     dc->base.is_jmp = DISAS_NORETURN;
 }
@@ -174,7 +174,7 @@ static void gen_jumpr(DisasContext *dc, int regno, bool is_call)
     if (is_call) {
         tcg_gen_movi_tl(dest_gpr(dc, R_RA), dc->base.pc_next);
     }
-    tcg_gen_exit_tb(NULL, 0);
+    tcg_gen_lookup_and_goto_ptr();
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


