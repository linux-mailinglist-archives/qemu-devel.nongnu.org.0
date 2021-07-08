Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8493C1B25
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:42:17 +0200 (CEST)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1bmi-000569-HK
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1bic-0008Q4-Bi
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1biZ-0008Lb-NS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 17:38:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso4882021pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7ItSyYsGQ9A8At3Pt+haqUSVGcYkHH5NFOEM/YPqhl0=;
 b=ho224I1nZOS/iV0YylE4vpvOiCk3UgV6gZnYgP0jyY8NpPgkGfImIJ0o5dNlxt5qeb
 +XAoansdFcFnSzmAiYZF5WIb9Xu7S2JL+GvXdAczDILG3cJJ4ZvOYN5AwZ+0mCT0t9hQ
 2b2XLS1ywtwuEGiTai2gWRit5X6w66l7qO+eAZX6SRiJdOSe8OGLG8/kCT4wmvADUx8W
 t/vcwiegkp/pK6vlZYe5qkbKErAOWmMeJuJGkt5HjFGevZ8h2N6Sj9snz+UODsMMOTd5
 +G9ASXLgLxcylz82jsstjBrI19GSX7A19GKzXS0HXmbv/Z5lL5HRzty8CMdGeoN5Vn5K
 C1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7ItSyYsGQ9A8At3Pt+haqUSVGcYkHH5NFOEM/YPqhl0=;
 b=fiyzDaySa+b1hZDy7aQoWyJ2yjr7MZ1dmNwMRNjN7i0cgP3H737tTYht0RmaChmCA5
 QR8hHLsYCsBK4pfcLX+XAfArJjv39lxgY6c+ihcexbJ7mMgF2VKsm1ulNt2N0242/dg8
 Cl41syqgDlh43Y7Cflq4vrv987sc4yqm7OOKrCGke5rs38XYXsQetomuTBfM/GbMKMBe
 Zq4HMAI9QGnU//tgWH0Ttn8J8Scu43jR/tTu/J5xwZWSKXiPHcje6KB+5Csbvqv7I0iJ
 Wf9S/yyk4QGHq/kG3KSDvIoqbJ6CC5LfNej6PgwsPZ6ksIDnDO+HBUU80Cdw5bOWKvLd
 OJPQ==
X-Gm-Message-State: AOAM533U/Kuwq+5nfuzki/ahq+uRzEjemctX5ffa5iLa5Oib7KnOss2r
 JjW3Z3sk48TGz+JTm25bpylPR4EqS6/7qA==
X-Google-Smtp-Source: ABdhPJxRvJBpJiy/nHaN0TorYnMnlzZd4sE6dG+S/7h+AnBKPMuCFfbSIJxDlq/rPdaPScbQu4/rhA==
X-Received: by 2002:a17:90a:420b:: with SMTP id
 o11mr33272029pjg.201.1625780278246; 
 Thu, 08 Jul 2021 14:37:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g27sm4322800pgl.19.2021.07.08.14.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 14:37:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/openrisc: Use dc->zero in gen_add, gen_addc
Date: Thu,  8 Jul 2021 14:37:54 -0700
Message-Id: <20210708213754.830485-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708213754.830485-1-richard.henderson@linaro.org>
References: <20210708213754.830485-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We still need the t0 temporary for computing overflow,
but we do not need to initialize it to zero first.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 3d86bdffaa..3425fd881e 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -200,10 +200,10 @@ static void gen_ove_cyov(DisasContext *dc)
 
 static void gen_add(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 {
-    TCGv t0 = tcg_const_tl(0);
+    TCGv t0 = tcg_temp_new();
     TCGv res = tcg_temp_new();
 
-    tcg_gen_add2_tl(res, cpu_sr_cy, srca, t0, srcb, t0);
+    tcg_gen_add2_tl(res, cpu_sr_cy, srca, dc->zero, srcb, dc->zero);
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
@@ -217,11 +217,11 @@ static void gen_add(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 
 static void gen_addc(DisasContext *dc, TCGv dest, TCGv srca, TCGv srcb)
 {
-    TCGv t0 = tcg_const_tl(0);
+    TCGv t0 = tcg_temp_new();
     TCGv res = tcg_temp_new();
 
-    tcg_gen_add2_tl(res, cpu_sr_cy, srca, t0, cpu_sr_cy, t0);
-    tcg_gen_add2_tl(res, cpu_sr_cy, res, cpu_sr_cy, srcb, t0);
+    tcg_gen_add2_tl(res, cpu_sr_cy, srca, dc->zero, cpu_sr_cy, dc->zero);
+    tcg_gen_add2_tl(res, cpu_sr_cy, res, cpu_sr_cy, srcb, dc->zero);
     tcg_gen_xor_tl(cpu_sr_ov, srca, srcb);
     tcg_gen_xor_tl(t0, res, srcb);
     tcg_gen_andc_tl(cpu_sr_ov, t0, cpu_sr_ov);
-- 
2.25.1


