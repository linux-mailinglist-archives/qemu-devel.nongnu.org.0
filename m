Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765A3B09AE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 17:58:10 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvimv-0007vk-Dg
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 11:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvidj-0005JO-Iv
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:39 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvida-0005Kx-OI
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 11:48:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso1973542pjv.4
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 08:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPAbZ+NnbuJu6Y7yeuOPLB6kF5Goh866R12FC5UPwXY=;
 b=BiF+WimtNMMr3Qk/G23pq2oza8a3MBPQlT7pRnY+8O8TPkDUN9zyeVY4ZccW1153lS
 9kEVCzuLTD+MRAyda/BtPYb7eQPJMk21T9haF9K0MGpR/Wjjwaau7aoYKnJekdIxUuXU
 8iZeYqX1MKYk5UJagESlOBIAODuBVJ/AOz/sXVQf7le0k+iYab0Dl7jKAhIIr8eNegZk
 fti8NjKP6EV6lMkOxBKltyvRajFIYptQOsoyE+yT4ui5JEmt2Z6hLvX/rPvuHYXUMusZ
 dIj46+dFwK8GxOJ0ou1XMhSHU7yow2Uo2aKebAfwIiSTofTbCJ7GtbewTsI+1rFU9P0V
 T6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPAbZ+NnbuJu6Y7yeuOPLB6kF5Goh866R12FC5UPwXY=;
 b=GV126NuuCJ0BxqWkPzxTVdHcWfwp4Tx85O0MVjMPE6NabgBgqdm1IXZnnnh/fnSO2E
 1C0zj2lNKCBusLALxRkyxYDF+TxvHvFvWq2eCdI/tLBlt1A+vF2vxQM2Ky2tNaZ5KUJj
 +95ryTOEPNrsnet36HpTvP7O4rFeVgEHGLnyBSWRBXhN+wVVO1WdzBS2x8mLKktKd/At
 jwmoCuraiuUWhlb/zsdsmvfpP/b6pOVzIow0ASW+xYb8ztaHtA7ng054DS6pVVpgzTcq
 PSaPPOnmq0gj9GhGc5UDzhRP2kU7YxqKao32QbcWJieoUvORoyNEQh1NpmlZ9X4/HXQ6
 nz/g==
X-Gm-Message-State: AOAM533FA0CmKYLvH//U2Drztny773jZV04gMe3J0bMfHScKKcWn7GVU
 1P2j3JhxJnth76zUBvEKib8jYybVXi+K8Q==
X-Google-Smtp-Source: ABdhPJwrYnom5zwUXDCW5gZttoWeDI4BaUNwtWF8+ejYK73zvPlEiG+4t25xO5m1iUi8sb2EjuTRKw==
X-Received: by 2002:a17:90a:e284:: with SMTP id
 d4mr4687211pjz.124.1624376909457; 
 Tue, 22 Jun 2021 08:48:29 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x13sm2898769pjh.30.2021.06.22.08.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:48:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/15] target/cris: Use tcg_gen_lookup_and_goto_ptr
Date: Tue, 22 Jun 2021 08:48:17 -0700
Message-Id: <20210622154820.1978982-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622154820.1978982-1-richard.henderson@linaro.org>
References: <20210622154820.1978982-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can use this in gen_goto_tb and for DISAS_JUMP
to indirectly chain to the next TB.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index f58f6f2e5e..ea6efe19d9 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -546,7 +546,7 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
         tcg_gen_exit_tb(dc->base.tb, n);
     } else {
         tcg_gen_movi_tl(env_pc, dest);
-        tcg_gen_exit_tb(NULL, 0);
+        tcg_gen_lookup_and_goto_ptr();
     }
 }
 
@@ -3352,6 +3352,8 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         tcg_gen_movi_tl(env_pc, npc);
         /* fall through */
     case DISAS_JUMP:
+        tcg_gen_lookup_and_goto_ptr();
+        break;
     case DISAS_UPDATE:
         /* Indicate that interupts must be re-evaluated before the next TB. */
         tcg_gen_exit_tb(NULL, 0);
-- 
2.25.1


