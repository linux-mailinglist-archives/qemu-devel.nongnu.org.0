Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61866F5189
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:30:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6ts-0005hC-FG; Wed, 03 May 2023 03:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6th-00054v-5p
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tf-0005jn-B1
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:32 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f315735514so11346505e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098850; x=1685690850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2loLFctrbS7k86B4Fgi7vNgISjXalmefke2iT2eK8s=;
 b=j9A/U11XaCLmBLri94gHdzSgqWonNUOB0FVbmDJvuVT/bqVXVOtht7eH9p4Jlvd7z3
 x0zugzA3PZriMXmozorurc/2mkqFDhrgu3uOoz9rvVym6gZuQoJhNKYMsh2Yoqu78HGV
 We2ZLg1Fuq6rUSCaFqi+xSKEzzw8jS0uDzyYxj5cE0uHy5oWOjgUpVrc5IjWsunWTpvB
 9ZWWZDQ+wRmsfj0msVXfMJezIgMhLqP2n4ufNKyEqMu4xKuqO2sAS6R3aqu2VOyMcJ4u
 xeytUKVTeC2eZoxyGu0uZFgkT50UWROFYGcALcaWvb6wH6kf8YDOYrsLKtuLDwL6xIgT
 m8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098850; x=1685690850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2loLFctrbS7k86B4Fgi7vNgISjXalmefke2iT2eK8s=;
 b=i5B/DA/xK3zB3i3SFT5JPypipmmXBipqlKV04qMjx/SuCocFz6Rwnz/ncq2THX7Mjc
 DlKYVESpE8TMiSLSP7vrZpYwt8761+N3+izw3lelc1zxcglmxcapvx9CjrWSRLcGn0dp
 oNx7Ffmk7J2qyFeM+DgSLYy52rPf+7Yh6x1SDFT5qeQf6EiyCZeOqQAfsaTrgRka7xQ7
 4XU6o3VOp1OZab1Sw3zO/2znIk8eJ2By8yh37vuCLtNu/e4rSrWXmtM/57cBKVepVtKn
 cHu2EAXdBirF/5GgywcAQlpIrUCVhXrJLRoM6iXIkHx4QIKTlkA/9EVyPtuTn/9UpcTZ
 VtLA==
X-Gm-Message-State: AC+VfDwCyF2sIYJhIn8hiK8nQLNhUtReXe837n4pCM5MimpsfY0zsCOV
 1hBS5yUy7E59+SKXeg2lKk3qrPoO45SjYDcgs+mnGA==
X-Google-Smtp-Source: ACHHUZ755z/PVHxQf0Io5cyTMDWa6rdK3EPxOxOqVz9DUmmBAwXw/vsSPE/kDtRL3E5MwJjy01KDaQ==
X-Received: by 2002:a5d:66c7:0:b0:2fa:7203:5bae with SMTP id
 k7-20020a5d66c7000000b002fa72035baemr737227wrw.18.1683098849819; 
 Wed, 03 May 2023 00:27:29 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 76/84] tcg: Remove target-specific headers from tcg.[ch]
Date: Wed,  3 May 2023 08:23:23 +0100
Message-Id: <20230503072331.1747057-77-richard.henderson@linaro.org>
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

This finally paves the way for tcg/ to be built once per mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h      | 1 -
 accel/tcg/plugin-gen.c | 1 +
 tcg/region.c           | 2 +-
 tcg/tcg-op.c           | 2 +-
 tcg/tcg.c              | 2 +-
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 1af6cd5ad4..57f181dd9e 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -25,7 +25,6 @@
 #ifndef TCG_H
 #define TCG_H
 
-#include "cpu.h"
 #include "exec/memop.h"
 #include "exec/memopidx.h"
 #include "qemu/bitops.h"
diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index 36dc1ea39c..03e6035a52 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -43,6 +43,7 @@
  * CPU's index into a TCG temp, since the first callback did it already.
  */
 #include "qemu/osdep.h"
+#include "cpu.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op.h"
diff --git a/tcg/region.c b/tcg/region.c
index 184e684b04..cf4568bb8f 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -32,8 +32,8 @@
 #include "qemu/cacheinfo.h"
 #include "qemu/qtree.h"
 #include "qapi/error.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
+#include "exec/translation-block.h"
 #include "tcg-internal.h"
 
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 16ff61c65d..ba12bf053e 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -25,10 +25,10 @@
 #define IN_TCG
 
 #include "qemu/osdep.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
 #include "tcg/tcg-op-common.h"
+#include "exec/translation-block.h"
 #include "exec/plugin-gen.h"
 #include "tcg-internal.h"
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 40a82cda5e..8314b912f7 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -36,7 +36,7 @@
 #include "qemu/cacheflush.h"
 #include "qemu/cacheinfo.h"
 #include "qemu/timer.h"
-#include "exec/exec-all.h"
+#include "exec/translation-block.h"
 #include "exec/tlb-common.h"
 #include "tcg/tcg-op-common.h"
 
-- 
2.34.1


