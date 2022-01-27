Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8C49DBAA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 08:32:32 +0100 (CET)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCzGg-0003mz-4e
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 02:32:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyN0-00046X-Ih
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:35:01 -0500
Received: from [2607:f8b0:4864:20::530] (port=46873
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nCyMt-0005jV-OJ
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 01:34:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id s16so1355349pgs.13
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 22:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JU8yAS18Zn8UE6eQ0birh8Z76witKI8Q/wDr72MGSnc=;
 b=eYkUEFBKjjlKEVHDUtsYLfpArcC4einqAF8n6EINI5zI+s0lHfF+Jk64CneThSUa5Y
 G0WbTDCpAVxlgQ4/izbPAu7Jvl8mFu6oauaF8W3R+ujx1+OabMGYDqAKvsKK3CksoEgM
 DATuJOLfTuFpZeaWoMWypFRUSW8c9n6FSkwwJIPwTOKYwy0zWu6frARq3fIfhtu1ce+g
 0/eKDFRrQ/ez+2uIcTbBqfwl4K3qtBBM4GMmnsAfEhg/YpoMTWsETPnA/eFIgrv27ZOx
 0J119hVLFVaaHP9/j8TA7OecZFRNggTv2rST8Ob5OcGwnhfnOUvlqOw4LrBzbr7jMPj0
 mmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JU8yAS18Zn8UE6eQ0birh8Z76witKI8Q/wDr72MGSnc=;
 b=LWLR1dttHzUVmIWVEeNQbP2SL9uDcoRfbsiMmTqq/jHeMVwI+fnh2WmsDj8w6BZ1aY
 aJ9K4SypgKz1WRRSP7Spg0VwR8Ej93Lc8RNSrJHWKC4rx/XLYPcIRRAzmgH1F8yaYLaL
 55P9NL66ODUtUUslA4LNOa2TY5JJSWHTiyyjDWx5qHNP5vK3LcDUIYYOFurOuzwe5s52
 4x9opZB46dJtE+QiWU4Rclop8BpyJ2/FmBG5DGFZm6BX8MlTfv7QsKJxglIcKqvt3Ids
 pWXI7+e9VZwxa1bbv60eQTgF8n3sLnu9Ks6cwCWW0on+RnzwPNm9Ca8rzGTCgJJzLidT
 inXQ==
X-Gm-Message-State: AOAM532ziV7YsVhhcwKY5q0tb2TmUrHTuRgZn8ghAiq5bdJ+66hch8g2
 OdE7q9erIHjN2sokvDIv+ZGchxXFhxzGox74
X-Google-Smtp-Source: ABdhPJxM+dQ7qf/ebyZXlGq18T8+jqwRRZoYvkqnT+CZMyBP3j3KwhJjuMkZ96O0Kmked8B+pPaWXA==
X-Received: by 2002:a63:690:: with SMTP id 138mr1794210pgg.364.1643265283401; 
 Wed, 26 Jan 2022 22:34:43 -0800 (PST)
Received: from localhost.localdomain (alanje.lnk.telstra.net.
 [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id y20sm4231855pfi.78.2022.01.26.22.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 22:34:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] target/arm: Use CPTR_TFP with CPTR_EL3 in fp_exception_el
Date: Thu, 27 Jan 2022 17:34:28 +1100
Message-Id: <20220127063428.30212-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127063428.30212-1-richard.henderson@linaro.org>
References: <20220127063428.30212-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: yuzenghui@huawei.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the named bit rather than a bare extract32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ca916139e8..5610879680 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13034,7 +13034,7 @@ int fp_exception_el(CPUARMState *env, int cur_el)
     }
 
     /* CPTR_EL3 : present in v8 */
-    if (extract32(env->cp15.cptr_el[3], 10, 1)) {
+    if (env->cp15.cptr_el[3] & CPTR_TFP) {
         /* Trap all FP ops to EL3 */
         return 3;
     }
-- 
2.25.1


