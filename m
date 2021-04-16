Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E693623DF
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 17:26:35 +0200 (CEST)
Received: from localhost ([::1]:41722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQMc-0002vj-NT
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 11:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQLi-0002PL-SZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:25:38 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:45573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziqiaokong@gmail.com>)
 id 1lXQLh-0005mP-7e
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:25:38 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d10so19416731pgf.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GACON3BTy9hr7qXOjaU6ncMr8qk1QRhNPlSRVUXnUEU=;
 b=uDpFNQV0A8GDwRJ8DJejBYWKv1uAr7b+pCNAecqomRqWgRHNCM4HqBkBXds/y8nzPd
 sTRZERAkUPiztY97Y0G6/ALkCJqSja0OwdrkzBmP02BONIVECb9t11ah2TGBt2qLs3FY
 D0NZE7CXbmWlUqewWNByJOB/vHNsB0dgG+ZQ/MTwnrLIMrmalQX+wU2Rwrs/uoP52sJs
 xsbaxg0hoGG67EoB204QghiyvHmaHcUiU5HVi/SDIz3doS5eqqg2XwWZH4nVoSBHhRWw
 9ifynJEtIeaLozPAhytFXb4JcpQhKUGD5TC9kDYs3IHplmSS/tflRtrS7yAr7ErwIE3n
 egbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GACON3BTy9hr7qXOjaU6ncMr8qk1QRhNPlSRVUXnUEU=;
 b=AVf+JFlIdUBAC+VI3CRg8tYxmAg3r07EgpdI0tnZVul8QurjWZ9OZys/84Chyd+BLl
 KXKqUkfZYgaXFmXSS1SETfyaSsD2OoU54iwBeIRwyS/zRpHy92lskHxY7hhhIZt/hO0g
 8QpN44TUMIF99xC6pDEZsjaRn8MvYefndlG+0ZBJyPULKZNpfhnZmBDLR8AlEkGpzaZd
 iVbyb/pVseaS52QEmGM9+dvwO1shfUg+6rYHidJDoIvHillErGK/hL2tyquOPAqtEzuY
 JXc5+BnEQTyYrmamG4TFmuDsrB73+d+FjDZbY8GnUMjSeF0zYuq3TNdUuApQIOVPJWby
 rHRA==
X-Gm-Message-State: AOAM530bWqbj6GV2p3j/kjgYLELm8WpzQ2Giv5zayYo4ZQl7AF4F28Em
 QbGeWqapzPJrVOU2pYYjOb+FD+QAjsdT0RHW
X-Google-Smtp-Source: ABdhPJxJpp+jFOx1+nPAKLhSH5sgRH2wHmLIlG4zYboB1YzWC6/SYHlInpsr4SYKbv4CBc0x+db9fw==
X-Received: by 2002:a63:1d18:: with SMTP id d24mr8878718pgd.402.1618586734895; 
 Fri, 16 Apr 2021 08:25:34 -0700 (PDT)
Received: from localhost.localdomain ([104.160.18.162])
 by smtp.gmail.com with ESMTPSA id bj15sm5912502pjb.6.2021.04.16.08.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 08:25:34 -0700 (PDT)
From: Ziqiao Kong <ziqiaokong@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Set the correct env->fpip for x86 float instructions
Date: Fri, 16 Apr 2021 23:24:30 +0800
Message-Id: <20210416152429.91832-1-ziqiaokong@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=ziqiaokong@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 Ziqiao Kong <ziqiaokong@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, everyone!

This patch follows https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html and https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html

It's my first time to submit a patch to qemu. Any advice is highly welcome!

Ziqiao
---
 target/i386/tcg/fpu_helper.c | 4 ++--
 target/i386/tcg/translate.c  | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 60ed93520a..e8cbde4e1a 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2395,7 +2395,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
         cpu_stl_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stl_data_ra(env, ptr + 4, fpus, retaddr);
         cpu_stl_data_ra(env, ptr + 8, fptag, retaddr);
-        cpu_stl_data_ra(env, ptr + 12, 0, retaddr); /* fpip */
+        cpu_stl_data_ra(env, ptr + 12, env->fpip, retaddr); /* fpip */
         cpu_stl_data_ra(env, ptr + 16, 0, retaddr); /* fpcs */
         cpu_stl_data_ra(env, ptr + 20, 0, retaddr); /* fpoo */
         cpu_stl_data_ra(env, ptr + 24, 0, retaddr); /* fpos */
@@ -2404,7 +2404,7 @@ static void do_fstenv(CPUX86State *env, target_ulong ptr, int data32,
         cpu_stw_data_ra(env, ptr, env->fpuc, retaddr);
         cpu_stw_data_ra(env, ptr + 2, fpus, retaddr);
         cpu_stw_data_ra(env, ptr + 4, fptag, retaddr);
-        cpu_stw_data_ra(env, ptr + 6, 0, retaddr);
+        cpu_stw_data_ra(env, ptr + 6, env->fpip, retaddr);
         cpu_stw_data_ra(env, ptr + 8, 0, retaddr);
         cpu_stw_data_ra(env, ptr + 10, 0, retaddr);
         cpu_stw_data_ra(env, ptr + 12, 0, retaddr);
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 880bc45561..cc4398f03b 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -6337,7 +6337,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 goto unknown_op;
             }
         }
+        tcg_gen_movi_tl(s->tmp0, pc_start - s->cs_base);
+        tcg_gen_st_tl(s->tmp0, cpu_env, offsetof(CPUX86State, fpip));
         break;
+
         /************************/
         /* string ops */
 
-- 
2.25.1


