Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DBA6CA551
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 15:13:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgmeY-0006MR-8C; Mon, 27 Mar 2023 09:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeG-0006Ir-KS; Mon, 27 Mar 2023 09:12:32 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgmeF-000164-4G; Mon, 27 Mar 2023 09:12:32 -0400
Received: by mail-pl1-x630.google.com with SMTP id f22so4264177plr.0;
 Mon, 27 Mar 2023 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679922749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyq0pQCVaR7tQ5J0BWrgvGNg57mKGgj/17nqWtHTu0w=;
 b=NfMUhAGcDPtZhc0wAMeo0Rw+AO5n+bpkAb2N9kmOrNWW5atfBrmp8BJKwHyVwJtivB
 dMY1TITv6c5/Ei4XyZn4z6RSe/G8ulmYN1fvLfQURVukWSFQfe9JakMtNJaWYw0C+cFQ
 4XSfC/uDj9vkJMV5mP+Oc0ZQoszoMi6jMi/5764GbvAsx2kBLAYou650EtlvdCGt9Ci4
 /y9dKqnLaruO9lxMHKHKSZCU+9cq6aVW1KOht9DljAQciR56VFYk5gnreoSG2oy139cn
 DL8HILuVxrHaeqSi1N+eow3BGt/+0V+OHaKqB7OswZd0Rq/zbIF/43pHMgE6evj6Key7
 1fFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679922749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyq0pQCVaR7tQ5J0BWrgvGNg57mKGgj/17nqWtHTu0w=;
 b=Cu6rVerXOzNMcg6geOruesssaL5pv6skcoiGqZ5h1w2NKZnH349vcukGjWM6dSA39B
 6T1uDiBeRy5cbQZLBxWSaBsRTZUbbdk48Vymfy4/mi8PqMaC7p332Qd4UB0FJri7S1LR
 /4VEz9puRXo4mLo0Yso7uiZxVzEqOFcwNgpVdwPQGZ7p/jE42+jVQFP/+TYJZXjBX/nW
 PYE3JzGlemFE0Tv7YFt+lN9g2FolcNMxcief+vPP+gVm1SjKvncor540/Xab15gZ4hEJ
 iSBcafYjX+wok5R7pOBa4Ftxze0rtMrqXuJeTck9+8ZkZAhBN2qglDzDYnAKGVw8Zqr/
 Qabg==
X-Gm-Message-State: AAQBX9eqhqCFQ2QLHPhQyscgEmJeAKq9yR3670a7+Gybyn008PK3bLQY
 WDK9wjpKj9BMyJmhy4yrdZ8n4vqC6gc=
X-Google-Smtp-Source: AKy350bpwSXdF8owxT8Xkt/GzSRN4dHHuZ2aljcEWwqi0mIcfhUQxksl3Q6RZ1PE+o+m1ej0Rltinw==
X-Received: by 2002:a17:902:e749:b0:1a2:19c1:a952 with SMTP id
 p9-20020a170902e74900b001a219c1a952mr14320352plf.61.1679922748907; 
 Mon, 27 Mar 2023 06:12:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a63f50c000000b0050bcf117643sm17301638pgh.17.2023.03.27.06.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 06:12:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 2/6] target/ppc: Better CTRL SPR implementation
Date: Mon, 27 Mar 2023 23:12:14 +1000
Message-Id: <20230327131218.2721044-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327131218.2721044-1-npiggin@gmail.com>
References: <20230327131218.2721044-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The CTRL register is able to write bit zero, and that is reflected in a
bit field in the register that reflects the state of all threads in the
core.

TCG does not implement SMT, so this just requires mirroring that bit into
the first bit of the thread state field.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/translate.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 58fa509057..d699acb3d0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -413,7 +413,14 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn)
 {
-    spr_write_generic32(ctx, sprn, gprn);
+    /* This does not implement >1 thread */
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+    tcg_gen_extract_tl(t0, cpu_gpr[gprn], 0, 1); /* Extract RUN field */
+    tcg_gen_shli_tl(t1, t0, 8); /* Duplicate the bit in TS */
+    tcg_gen_or_tl(t1, t1, t0);
+    gen_store_spr(sprn, t1);
+    spr_store_dump_spr(sprn);
 
     /*
      * SPR_CTRL writes must force a new translation block,
-- 
2.37.2


