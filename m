Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2656F5215
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:44:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qK-0002V6-Kg; Wed, 03 May 2023 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q4-0001T4-19
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q1-0001f4-6z
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3064099f9b6so310742f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098623; x=1685690623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/Qj7tc1F7aibb3Pu2TGwJN8/rpMEUEZfJL8Jw/9kFs=;
 b=WkHIEPxR2Z8H4qsSuXL2vI/pfdSv4czEfCZp0npWi/A3QQAfp3wibKMvFbiRfEL1jx
 ATCbdPxmP0w+tbJyC1TqX4jm0s2jNxUrR9I7OmTwvVXuZpq+r2MlPB0S3ep3un5V5RaO
 LXEy50PRK8/6hsN9qxjOlh7+8jV7kls9bDDpeZbzPhiEGLjR2RCAg7Enp40JkN5VlWLq
 Y69UznBbo4xW5uLU9thHqrsb5jCFNk+rzvpoTb2Jag/fqTQL7InYHLEH5ff8e37k2hUR
 PcTv3PBdWphlZRjs6zpJoa1Kgr1LDpqi25NBIcsCpxhzGLYaLv0B+9wpb9vr27zEAXyQ
 yIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098623; x=1685690623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7/Qj7tc1F7aibb3Pu2TGwJN8/rpMEUEZfJL8Jw/9kFs=;
 b=YdXh2tb7kbVkwILRlydAngrLYRY1NPEVBSmJdL7lPc8+AmPIwNixDFHnxeuWVeMRtQ
 Fzev88aVYezeGPAtrPpcn4wnt4BGQ1sSk29sAR+HNJZFWVwdc6+0EdByrfA/ofOzyMAl
 KvqrNcgn8FDSiM4b0964krbZH7Fy87ZZRxCWatqdqXmRDr4d32cLKGQCid59mcO/7hN3
 AGEH5VGuc8+Y8arhsQXL8EYKhkO9AqtaLO8YeZlDv4z2F5vchJ67j9j42LgcSv4Joiqn
 EEhQQ+amH/tGxrWkHOrjUV6kMTblUpT0LuH1rlCC8sgY3/x38DA7uVY9M51Dqn5CNLVD
 5T0Q==
X-Gm-Message-State: AC+VfDwzyk4XIUXkRiGqKn9ROrvFiegnA3EUescaR+uQhUNLYYpP8ILK
 s0ZR6CPxfvVlkqzs1DCvTiD1P2kE3cP4FgPeIgscxA==
X-Google-Smtp-Source: ACHHUZ76BPGLgFkYKMJn5WFnZztC3YbtDBMeNXHFrj56os2Iv7zTt+3MGBsIBVXancXlIGkLGI+qFQ==
X-Received: by 2002:a5d:638c:0:b0:2f6:35c3:7752 with SMTP id
 p12-20020a5d638c000000b002f635c37752mr13084778wru.57.1683098623369; 
 Wed, 03 May 2023 00:23:43 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 11/84] tcg: Add addr_type to TCGContext
Date: Wed,  3 May 2023 08:22:18 +0100
Message-Id: <20230503072331.1747057-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This will enable replacement of TARGET_LONG_BITS within tcg/.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h         | 1 +
 accel/tcg/translate-all.c | 2 ++
 tcg/tcg.c                 | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 7d6df5eabe..026b2dd362 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -558,6 +558,7 @@ struct TCGContext {
     int nb_temps;
     int nb_indirects;
     int nb_ops;
+    TCGType addr_type;            /* TCG_TYPE_I32 or TCG_TYPE_I64 */
 
     TCGRegSet reserved_regs;
     intptr_t current_frame_offset;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7b7d9a5fff..99a9d0e34f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -356,6 +356,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb_set_page_addr0(tb, phys_pc);
     tb_set_page_addr1(tb, -1);
     tcg_ctx->gen_tb = tb;
+    tcg_ctx->addr_type = TCG_TYPE_TL;
+
  tb_overflow:
 
 #ifdef CONFIG_PROFILER
diff --git a/tcg/tcg.c b/tcg/tcg.c
index b4e1e0e612..ce92336eec 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1423,6 +1423,9 @@ void tcg_func_start(TCGContext *s)
     QTAILQ_INIT(&s->ops);
     QTAILQ_INIT(&s->free_ops);
     QSIMPLEQ_INIT(&s->labels);
+
+    tcg_debug_assert(s->addr_type == TCG_TYPE_I32 ||
+                     s->addr_type == TCG_TYPE_I64);
 }
 
 static TCGTemp *tcg_temp_alloc(TCGContext *s)
-- 
2.34.1


