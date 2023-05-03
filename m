Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8A36F5204
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tq-0005VG-U9; Wed, 03 May 2023 03:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tf-0004z0-5K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6td-0005j1-5K
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so47818735e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098848; x=1685690848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pgh0rW0JJtyFrARcBJjB7hwQIkmbVTECi2KOYkkQxCA=;
 b=eapt59TyZwYWaQlTh6OjBVdBFMzquUNNp/eMaGyUqI2C3N4v1N95VAHCqvMoY0j9fR
 VxFsJhrT4Nj/4t9+Z6OOwkdPZCfSx25jrqGL7dOdxtxDpw7hvnUlCJhDHoh1om2q2TdT
 BZv7JFGQdT7n8dLz35Zr26uBRNCuvxAh4cPDLb4wLVcWgdQCMAj/u2eohQFxaK/zVYr5
 LukIY7BtzbAUK2jJznIgfKVpyUdUxgUMnbBloecI9/MtpHzGZzrGo1+3BsOCafm4rDR7
 6fTLl82fvGS9JhHk4nPftYPMs2FH4+JmygywU1V6RE1y+DPSt1QdQtBEWNjnsUp0jQ3v
 kKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098848; x=1685690848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pgh0rW0JJtyFrARcBJjB7hwQIkmbVTECi2KOYkkQxCA=;
 b=avZZR0EESmO5gN6z9RO1L+ENxFA5MktjO0ZOWrN/3nLrIG7a8cVV9Kgo5nWmoBcl8i
 lRIbwFMQImPv0q9WwromEYYYfY6pxX1hzYVG18c7tueTs4C++3J14iYhVYhtyQgytSGn
 yT+gy+emnOjsmNJsVox0Q5MmtvxvQc8cMtHwBhCa12SRwXCfgBg68H9fsZD744JxOaVO
 g2cS4Y/ptqXQN0j29ed3Sg/TfmDJj+Pm8l3LxxWL1mVhGzd0NaBomP6HCYa+B2gJKlH/
 OvIvVWX7oMU+veU/FcKD4VYZTY0/utvtMPQqXJVosRjxz7ZfxJSB4wZuuu+PwR2j7Vs3
 KyEg==
X-Gm-Message-State: AC+VfDzpJXh6FgPc7GZwrodv94b5Z8oitpIRllsrIIE1tdIYbMqZD+cg
 rhHnBy9ZZ8f46t37u6//iWsmSLYImdB7jnagSb55OA==
X-Google-Smtp-Source: ACHHUZ7Uk/ZVobXPxYnhsdihZ54ysrZd8HALjNbXDRt3qZPOJkEyR+VKBEpjgCr/SmH/6B3DBP7ppw==
X-Received: by 2002:a05:600c:2212:b0:3f1:6ebe:d598 with SMTP id
 z18-20020a05600c221200b003f16ebed598mr13517803wml.7.1683098847774; 
 Wed, 03 May 2023 00:27:27 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 73/84] tcg: Define IN_TCG
Date: Wed,  3 May 2023 08:23:20 +0100
Message-Id: <20230503072331.1747057-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c      | 2 ++
 tcg/tcg-common.c  | 2 ++
 tcg/tcg-op-gvec.c | 2 ++
 tcg/tcg-op-ldst.c | 2 ++
 tcg/tcg-op-vec.c  | 2 ++
 tcg/tcg-op.c      | 2 ++
 tcg/tcg.c         | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/tcg/region.c b/tcg/region.c
index bef4c4756f..34ac124081 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -22,6 +22,8 @@
  * THE SOFTWARE.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/madvise.h"
diff --git a/tcg/tcg-common.c b/tcg/tcg-common.c
index 35e7616ae9..678ab482f7 100644
--- a/tcg/tcg-common.c
+++ b/tcg/tcg-common.c
@@ -22,6 +22,8 @@
  * THE SOFTWARE.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 95a588d6d2..0ecde731f4 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -17,6 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
diff --git a/tcg/tcg-op-ldst.c b/tcg/tcg-op-ldst.c
index 7e690d0e92..e37e453331 100644
--- a/tcg/tcg-op-ldst.c
+++ b/tcg/tcg-op-ldst.c
@@ -22,6 +22,8 @@
  * THE SOFTWARE.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 35d67eeda0..6c70178e9e 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -17,6 +17,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "tcg/tcg.h"
 #include "tcg/tcg-temp-internal.h"
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 8c1ad49c4e..16ff61c65d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -22,6 +22,8 @@
  * THE SOFTWARE.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f9bc6bd0ed..40a82cda5e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -22,6 +22,8 @@
  * THE SOFTWARE.
  */
 
+#define IN_TCG
+
 #include "qemu/osdep.h"
 
 /* Define to jump the ELF file used to communicate with GDB.  */
-- 
2.34.1


