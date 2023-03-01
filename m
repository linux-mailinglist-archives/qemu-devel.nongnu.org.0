Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE126A6633
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCik-0003SK-IP; Tue, 28 Feb 2023 22:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002YB-EV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiW-0004LN-L7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:22 -0500
Received: by mail-pl1-x62e.google.com with SMTP id i3so12574049plg.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=mTDuWaa0izt+D40INYI4dLqISZUVExDsqLQz5Tefv0os3i97xu0fkWXYKJHyKElPvO
 CX+q0zEfYlHx5Wi+tNDpFAOw34ZtKuu8TEmM3daKM/hzBBkdZshOelNFjMDPhzvkq9dt
 nPHLLMXsqx4pZ7X+2990kYodz5goMUt0gge2dLkJrkW5SjN9qwSKjevSTb/3xVr2VTQg
 ULrJM2AjcesT8GH6+Be9Elb0gQVftYEPc/d9dp8NaX0salx4dZ4nlqoI8ry7ADlVwmYN
 Ol/jC9PGdAu45X1qg5UQnvgR6sXNVu5KGRDps7YRu2fEcxs23H5N22DjEDQs6C7Pixb6
 YK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2x/6xSpCKlYJ34/8OxjWcHuDhp8kikr1JE7fyXvIhlE=;
 b=atzCVVqcqJAD7GsJ5sn4RKNDsVUqW8/OzCIu4ML7hseqrwRw4CxHqm50RupdPb/+2x
 WUwDRk8/5huotaOvtLpDwaAj0giMz3DMjMoAo3ltydFTSVvB4bjkhO/j2OZRRmo05wuo
 JTsNBRvGA34L+kZrFsRM+RlWyOV9mPDkiP+i5MQ1N4FnVOhV6B3HIn/ecIuidfw0tH2h
 w5FWZvLXvam7yFhsFLVpP4ZTAsYkEO5+iFm/0zUDuPpZ3UfDtZG4DvR2jfqPFaB6O7+/
 w/OUPj7sxoep+PhBYrX1Nrhi7Y/5cVQ9itu7WC61HfUUsScfa1GzVg9QW55o9NVbU6Ut
 sbfg==
X-Gm-Message-State: AO0yUKWrDd0YzcrexHLbRavO32kyj1LC4u2OF4xOcuR/Cc/IiInHJztE
 abaomKFxTMX9c7Lj/me7YeSqK+GnE6hFRQhjTps=
X-Google-Smtp-Source: AK7set/cZmu3X7vj81y8fakcM0wkTEKHBc8u39nAkhLzcuojNzmqGvN3PpvoUEb6JL7G6ckm/EqOCg==
X-Received: by 2002:a17:903:230a:b0:19a:96f9:f55b with SMTP id
 d10-20020a170903230a00b0019a96f9f55bmr5970806plh.27.1677639679422; 
 Tue, 28 Feb 2023 19:01:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 55/62] target/hppa: Don't use tcg_temp_local_new
Date: Tue, 28 Feb 2023 16:56:36 -1000
Message-Id: <20230301025643.1227244-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This wasn't actually used at all, just some unused
macro re-definitions.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 0102cf451b..cee960949f 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -35,7 +35,6 @@
 #undef TCGv
 #undef tcg_temp_new
 #undef tcg_global_mem_new
-#undef tcg_temp_local_new
 #undef tcg_temp_free
 
 #if TARGET_LONG_BITS == 64
@@ -59,7 +58,6 @@
 
 #define tcg_temp_new         tcg_temp_new_i64
 #define tcg_global_mem_new   tcg_global_mem_new_i64
-#define tcg_temp_local_new   tcg_temp_local_new_i64
 #define tcg_temp_free        tcg_temp_free_i64
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i64
@@ -155,7 +153,6 @@
 #define TCGv_reg             TCGv_i32
 #define tcg_temp_new         tcg_temp_new_i32
 #define tcg_global_mem_new   tcg_global_mem_new_i32
-#define tcg_temp_local_new   tcg_temp_local_new_i32
 #define tcg_temp_free        tcg_temp_free_i32
 
 #define tcg_gen_movi_reg     tcg_gen_movi_i32
-- 
2.34.1


