Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0635147A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:30:23 +0200 (CEST)
Received: from localhost ([::1]:50780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvWo-0000Z2-Tu
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPG-0000m4-Cd
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:38 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006h9-U4
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:34 -0400
Received: by mail-ej1-x62d.google.com with SMTP id w3so2338949ejc.4
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TaOsaEiCDE0n3X7TNwfYFY6ptE9OcCqOSdYES7YZ86E=;
 b=gm8nyLYj/NmSHA2VPW5aTVF+eGkZ5D8o8alNXilsG9b9bUMOS9GmDCWjIiTSwPkQBh
 G6j+E4W6EXqQVsbxyz5bBgU2oIp/lREeYDKx8PNaa4wvjj3CrtxYdTkKNGs4C968HK/0
 6KeOUm26LrOOU9k+K1pmgO7HExlN01DJSu1EYyyEH/FYRgh+12kmtjIDydD35YebJNrM
 o1b+1b1wV7tSPykuZ3z7iBAy/Ucf7gsr1SHRXk+qs/GkNxb8d0WR/ORTRVF71Hj6QM/H
 P9ipQDZ7BTF7izLP1IqXbkjX4J20BduIULMA4m6gr6SCxdiXy+B3YGrWcGGzfvq3qYJc
 CJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TaOsaEiCDE0n3X7TNwfYFY6ptE9OcCqOSdYES7YZ86E=;
 b=UBlZZzirWegMN7ZYURvCjTpRpY7JJnYnzv48WTyfj0/U9ZYQZOsQBt8dXW1GIl0zXy
 60OK2oUWTpRCoM1LGgHnHynrspMXCvRMaXtoP6z5xYZrlDCD7hItWk43rwm618diMNP1
 E0eEk01DC0pLL44xLppn3lIS+iCMOb4YM6R6aPzIVJ5zhIdcmpZnn/7E4NrcSSDDYEIz
 ERSOypHQeMA4V4i38D/t7KOaTNLE9Zw0ncXwDAqO+YImnD+4OfiZcpMjeSzCL00LQLtQ
 CMnCNhboN6tFGQ3Vk8AEhQ9m+zqRYcktqYSMCY3uBcOhqgjKz5pZZYIIkDRqhUuamsHj
 xSCQ==
X-Gm-Message-State: AOAM531kGkky/U+jqyCNsbTZHEp7PQM0k5f6u9KTrVJ0GqP69xS3sTx5
 0rJz6xUjZBudclpF72TFNxpmaR8HDqc=
X-Google-Smtp-Source: ABdhPJyT1i+gOrHYECp5DwHYHoQ1qiIGJ5wZyGQLAULYEXPm1voYRNYYMqhYabUTp1A42ZKJobhAsw==
X-Received: by 2002:a17:906:701:: with SMTP id
 y1mr8363270ejb.243.1617276150228; 
 Thu, 01 Apr 2021 04:22:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] target/openrisc: fix icount handling for timer
 instructions
Date: Thu,  1 Apr 2021 13:22:19 +0200
Message-Id: <20210401112223.55711-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stafford Horne <shorne@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds icount handling to mfspr/mtspr instructions
that may deal with hardware timers.

Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-Id: <161700376169.1135890.8707223959310729949.stgit@pasha-ThinkPad-X280>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: Stafford Horne <shorne@gmail.com>
---
 target/openrisc/translate.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index c6dce879f1..a9c81f8bd5 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -884,6 +884,18 @@ static bool trans_l_mfspr(DisasContext *dc, arg_l_mfspr *a)
         gen_illegal_exception(dc);
     } else {
         TCGv spr = tcg_temp_new();
+
+        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+            if (dc->delayed_branch) {
+                tcg_gen_mov_tl(cpu_pc, jmp_pc);
+                tcg_gen_discard_tl(jmp_pc);
+            } else {
+                tcg_gen_movi_tl(cpu_pc, dc->base.pc_next + 4);
+            }
+            dc->base.is_jmp = DISAS_EXIT;
+        }
+
         tcg_gen_ori_tl(spr, cpu_R(dc, a->a), a->k);
         gen_helper_mfspr(cpu_R(dc, a->d), cpu_env, cpu_R(dc, a->d), spr);
         tcg_temp_free(spr);
@@ -898,6 +910,9 @@ static bool trans_l_mtspr(DisasContext *dc, arg_l_mtspr *a)
     } else {
         TCGv spr;
 
+        if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
+            gen_io_start();
+        }
         /* For SR, we will need to exit the TB to recognize the new
          * exception state.  For NPC, in theory this counts as a branch
          * (although the SPR only exists for use by an ICE).  Save all
-- 
2.30.1



