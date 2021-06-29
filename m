Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1F3B7902
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:01:18 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJv3-0002ZJ-GJ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwi-0004DU-7a
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:56 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:40457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwR-00032I-P5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:55 -0400
Received: by mail-pf1-x434.google.com with SMTP id q192so102053pfc.7
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JvueqUJG6jJaFwqgDWte995LKM+oGyntlGLt3se6n5Y=;
 b=rYaUnwtyPhjBw/WnaNQLr2lpm+2OApP8V1RWh5qX8Ch3guQ5scFt3Qqog7Ka/55+Yq
 jphZJr2cdrtED6KoInGUxhzghefWKBQA1CsxLpBCninv1g82wJ3YzGjNz3RcJPypHJIQ
 ocJecs2S7DZEYT7qTBj8L1NqppDDrcGpqXizDb6Z2S32eyu4Q1JOtctGzirLmnrrsLgz
 MoqbRAcKlW6kcZgTCL9y/ehKC0xCYOTjYwXkC2pFZIUW/97T7nOIKXfDAliYbfd5I0v2
 97U3VkRwh6pMC8/qAPffyX6WS1hevFAxTvDqjCvjgetGJzJHt+flniD8TBABVHaIfMRR
 Ozfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JvueqUJG6jJaFwqgDWte995LKM+oGyntlGLt3se6n5Y=;
 b=XV9Wa80us8CS7tCqxEoPgLEf9PQM/kowpmyYKzp7y7who8gEK79way/ABc/pWWafvI
 BN255Hc171JyVQh+Vev3/BqYzlJbjrNkU1Q4AZgwNsu3ro0mRFIdELa5q5CWKPVJDLgC
 HkOLOflrTvnFN5bklBSFnZc4rSO6WzlIAWDrxAPx/BBCli0sb/75w4T6t3OnKDhB3IQx
 qjXj2xm3VIMCav9GO8iTGQgBfFLG1iC9n42xnpMkRP9gQ0FcUYkX42NtQczzSNu89OCL
 sq+t1IkIaCBrlmg/oioohvMO6F/wos1JGIjPiza2aY4McOm+7/uU6FGMEtiFEr63JH+5
 EjpA==
X-Gm-Message-State: AOAM530rDP6ligQlOoeEY9FX4LrN+Y17wkkd/9WDsFj0t96LYHZSIIky
 0JroGn7I7ksY4Nrb8CwYZVpDYJhd8tImxQ==
X-Google-Smtp-Source: ABdhPJyqOdRGLFRCktYxmkEv1bV4KctIQC1+t0fN+WMxRgWb3QFtrFsKGcSskoPjOzgKnWxGL90c4Q==
X-Received: by 2002:a05:6a00:2145:b029:30b:127:e0a3 with SMTP id
 o5-20020a056a002145b029030b0127e0a3mr16845437pfk.34.1624993117771; 
 Tue, 29 Jun 2021 11:58:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 60/63] target/mips: Fix gen_mxu_s32ldd_s32lddr
Date: Tue, 29 Jun 2021 11:54:52 -0700
Message-Id: <20210629185455.3131172-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There were two bugs here: (1) the required endianness was
not present in the MemOp, and (2) we were not providing a
zero-extended input to the bswap as semantics required.

The best fix is to fold the bswap into the memory operation,
producing the desired result directly.

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index 3f35e46399..f52244e1b2 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -857,12 +857,8 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
         tcg_gen_ori_tl(t1, t1, 0xFFFFF000);
     }
     tcg_gen_add_tl(t1, t0, t1);
-    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_SL);
+    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
 
-    if (sel == 1) {
-        /* S32LDDR */
-        tcg_gen_bswap32_tl(t1, t1, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-    }
     gen_store_mxu_gpr(t1, XRa);
 
     tcg_temp_free(t0);
-- 
2.25.1


