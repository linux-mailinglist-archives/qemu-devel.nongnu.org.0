Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A3353F43E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 05:00:41 +0200 (CEST)
Received: from localhost ([::1]:57576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPSS-0004fz-JV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 23:00:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG6-00078m-4S
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG2-0000Gf-BW
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so14193990pjt.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9sduqmZOJTOFPInX5kBPwJ1DQBTH1uy7cOYRBrDTuaM=;
 b=gcunhvgicin5IT+6Iih8IhEdEAoA79K3pKRGYVRMSCY1h6R4oWtcRf4vk6ZnNyK0ko
 LApMcM+4yU2ex5kS1HvvJXZstLr5OwFkZLsnCdg21dX5oNe5IOF2CZ4nyszdVMJrlJ3K
 CcMKDckNyPLwVdNsCGH4oPC6aSmsv0Sxz0alcnPMLCuudlHacG3k3lI/ZL0tLGY4P+zr
 kkIdnKnt4498nn4WQv7TxbBxCAheba92XVwZYCgm+5bvc0qJ1GhhR2ItL89yXuokd8vi
 wrVwYWCREJr32D4p5xNATyX6IV2pQADdka/aDiObyPOXflDNpGA1c+KuqwhSbrPmCXfK
 32cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9sduqmZOJTOFPInX5kBPwJ1DQBTH1uy7cOYRBrDTuaM=;
 b=kah8N0KXeC72KlC1Lz6maL4+4IRLmE3qd6Wpnv+Sipw0AVWNmtG7/zB9ioM4MzvO5c
 bxtieXhnIoZlgrxWwysM0rfIIxbNinYBxrhOQq71BHJz7aK3wdTTqoRDwWK0T/pUVRyd
 wre+fmWwJ7WlD8r4sSp2Ca7KOYNJ/DbASzGPpCpIgfkV2RxrCZ/SyHToT92Bk0pDsGqg
 DClUduDrlwoIWnT3zgf8yq7b2rhiC/FwU9J+ZvF1q/5J4nCWjNf7Kaz4p47BBMPVtC6K
 DxxsIX96DvQzFYqMwUSzKlC2WopvPz0Rv0DrUJn8ur8xtjZx4TCl57w6+dqB9saHnVF/
 XjMw==
X-Gm-Message-State: AOAM533t0l/7ySd9+Ax6U0WmoDOvS4klLdUPGtH/NbhfgbSdpwLBc8IM
 MbTfuQgEQYsvUG8frXU4GyoVO5rs0hIiZA==
X-Google-Smtp-Source: ABdhPJy1j0QY1FopKxsysJrT0vtgwYPLKMtiG2qxfwaHQkWReyno287PsRCq856uAK8nMkycEpOL9w==
X-Received: by 2002:a17:90a:e7c7:b0:1e6:8093:3fc2 with SMTP id
 kb7-20020a17090ae7c700b001e680933fc2mr29335173pjb.7.1654570069517; 
 Mon, 06 Jun 2022 19:47:49 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 16/25] target/arm: Move gen_exception to translate.c
Date: Mon,  6 Jun 2022 19:47:25 -0700
Message-Id: <20220607024734.541321-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This function is not required by any other translation file.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h | 8 --------
 target/arm/translate.c | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 4a93cac65f..d7a9acf5a9 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -328,14 +328,6 @@ static inline void gen_ss_advance(DisasContext *s)
     }
 }
 
-static inline void gen_exception(int excp, uint32_t syndrome,
-                                 uint32_t target_el)
-{
-    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
-                                          tcg_constant_i32(syndrome),
-                                          tcg_constant_i32(target_el));
-}
-
 static inline void gen_exception_advsimdfp_access(DisasContext *s,
                                                   uint32_t syndrome)
 {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b8a8972bac..fc5eafaeeb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1086,6 +1086,13 @@ static void gen_exception_internal_insn(DisasContext *s, uint32_t pc, int excp)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
+static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
+{
+    gen_helper_exception_with_syndrome_el(cpu_env, tcg_constant_i32(excp),
+                                          tcg_constant_i32(syndrome),
+                                          tcg_constant_i32(target_el));
+}
+
 static void gen_exception_insn_el_v(DisasContext *s, uint64_t pc, int excp,
                                     uint32_t syn, TCGv_i32 tcg_el)
 {
-- 
2.34.1


