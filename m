Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59A6F5248
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:51:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6wt-00083s-U0; Wed, 03 May 2023 03:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wi-0007lK-TY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:44 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6wg-00074h-EG
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:30:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso30147725e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099035; x=1685691035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRmXJMFN3rYya2LUNfLtjvM1yMLdoZFGjXY4lJtw1jE=;
 b=CyjiUZjfq/aBlCcH6uNzbPFFhfWC9t/voWpKIsXD2f81BOnhqY9g6T94ioy8ZNs1Y2
 RCywJUKPEeWwKDtpuAdBewvDkDvoqtQ8nrapNV8K2aSj1Og3sWN0XON2FoabtTMwXo/y
 4A0FjBRcsGxJZpoxb9AuR2M2Y2eWh1q3HK+asw6t/LskY93+ZxXPhIyxKjxBTwTpHcQJ
 X+rpOV1eUK27cNEG3OYWdzij/mNh8KbU9UlRSvlxZWBiUl3Pgd9lEnvz1rUKbbSBBEPd
 d+G78yqr+1SaL26qHSMEQaZ/HCl0lcZEdnDadcLDAmdch0eji+AD/J1VCY5GS0O1JUV5
 tMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099035; x=1685691035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRmXJMFN3rYya2LUNfLtjvM1yMLdoZFGjXY4lJtw1jE=;
 b=UpeYUfoSAx+p1TFbFefyNdwB6xx0x6xEJlVbksIKTISuJ3rSpJMNeSXYmvI9Gji0KP
 6vy3ZKLvadnqUBgiqrKKmTup/O8b2Bb41RAs0PHrq9mVdwGFXNL37XWkhn1pX73ZmgIB
 39o/o+DuUpozvnTKMffMdpeOlUSCiQL1yzmCmwqMP2MPe8KqGfQdbSz05/ubCDi8t7lK
 5A+5ewzviW69EnFHNgdg5aK3lEcnGENQUr8jnTmLuJ6EQwMjRXfMVVRwA+S1rm5DbVBJ
 TAUqjhC0WzKndtgv/jO57/5tcHqh+xm8oDli6kYaevPCcewpdhaTmybiW4PELjmXQTHh
 t7OQ==
X-Gm-Message-State: AC+VfDwg46ddb/MdmqegKX+ShIVY3djT3kzHc/K+GexwwOp2Gfsds9+m
 nzC9/fmm+FD+gN98F4kaQxSDQpeZ+JQ3frzSg1XPGg==
X-Google-Smtp-Source: ACHHUZ5h5KZRM2C1BzeyD1AP6MOpdE5otaXGd8xAhJ67DHX3y7pWEHhR+Y0uRreOFXThRZRPKgTXCg==
X-Received: by 2002:a05:600c:b43:b0:3f1:6f3a:fcbc with SMTP id
 k3-20020a05600c0b4300b003f16f3afcbcmr14213836wmr.16.1683099035631; 
 Wed, 03 May 2023 00:30:35 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a1cc918000000b003f0ad8d1c69sm982896wmb.25.2023.05.03.00.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:30:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 83/84] exec/poison: Do not poison CONFIG_SOFTMMU
Date: Wed,  3 May 2023 08:23:30 +0100
Message-Id: <20230503072331.1747057-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

If CONFIG_USER_ONLY is ok generically, so is CONFIG_SOFTMMU,
because they are exactly opposite.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/poison.h         | 1 -
 scripts/make-config-poison.sh | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 256736e11a..e94ee8dfef 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -85,7 +85,6 @@
 #pragma GCC poison CONFIG_HVF
 #pragma GCC poison CONFIG_LINUX_USER
 #pragma GCC poison CONFIG_KVM
-#pragma GCC poison CONFIG_SOFTMMU
 #pragma GCC poison CONFIG_WHPX
 #pragma GCC poison CONFIG_XEN
 
diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.sh
index 1892854261..2b36907e23 100755
--- a/scripts/make-config-poison.sh
+++ b/scripts/make-config-poison.sh
@@ -4,11 +4,12 @@ if test $# = 0; then
   exit 0
 fi
 
-# Create list of config switches that should be poisoned in common code...
-# but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
+# Create list of config switches that should be poisoned in common code,
+# but filter out several which are handled manually.
 exec sed -n \
   -e' /CONFIG_TCG/d' \
   -e '/CONFIG_USER_ONLY/d' \
+  -e '/CONFIG_SOFTMMU/d' \
   -e '/^#define / {' \
   -e    's///' \
   -e    's/ .*//' \
-- 
2.34.1


