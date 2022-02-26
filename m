Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C864C5761
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:16:52 +0100 (CET)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1ch-00046i-3w
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:16:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Tm-0005gS-AM
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:38 -0500
Received: from [2a00:1450:4864:20::331] (port=43821
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Ti-0004PI-KU
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so3602453wms.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FYsD9wqOqPxQi23fsOx0vHUCZyCrQ51hFpvnUwBsOEQ=;
 b=fQhaZ++DHZOfBAcw/X91vp5l5OUEhve7miJL5k4v3XXlPWfdp+5kBh0oyIMHHAernU
 K8/37yMnuKIFRLQlkd80bUW+te9Vz/VeKXX2eBpVQvIiPCdGLgH1q7Oj29AhUb6eQKVf
 yh1jykfdP67LKK9ZcHU05oZZ+WcAlo1s/vteEuqaV9pgs1uMZqaBcNwFUTLemybo3R7l
 Z8Jy2mlrYIujDTWl8JdoHuspfy/l9REzefQ2BLqTfSwbcPijWOTnbH+A6yIPVTeofY5B
 2V+Use4s6ZhPXU1PX+hUyDFVZXlm1y2JHdtBninntl06DxkqKCbhS4iTrVjlzA4WcQwN
 oPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FYsD9wqOqPxQi23fsOx0vHUCZyCrQ51hFpvnUwBsOEQ=;
 b=1u1WJePV9MngBD0DGQ26qM+KSTCwYNebQwD3s3Xd1AVPk1T6BP6h+ggIFsKs3LU/Jv
 bPBHBnJzSrzACu1tntoSSSy+H/Jq68HM1HhHP2oDsTb7iDzeBFOhR63i5I4kWqEL0gBu
 +WovfJNVoGFyaiYYroZgD3QrfloNL1GT8VCzbUYy5A8g5ayMUeSeMWP6zJr6b4ybdB95
 8d6kgkfGaCLlSYnU4bQYk4p52NpNz8uGtFNEu+kCbkvsHZhX3vZJLZcUvDr5ddpnrQHP
 LOcvhFniY8rFM8ihwrV4UYPNoD/bHePvtODdnjvXGGnHrvtNwxtGiIMlqBWFa6cJ3RmG
 SRoQ==
X-Gm-Message-State: AOAM5327v1rzYXTCF+aJQ+2yV+pP4i2gQ3E0enwkLh0sm5su9dM1LIJX
 02NrVIuMogJCJ7thUFcDvWYtP6yAtOpg4Q==
X-Google-Smtp-Source: ABdhPJz49eB01dGpovHoEedMYD+NYd42ykLBJK2l1djAKbiqToeG9oCMf6OuqGTrdw1fBqOp3NKkLQ==
X-Received: by 2002:a05:600c:4b92:b0:380:e46c:c35 with SMTP id
 e18-20020a05600c4b9200b00380e46c0c35mr7600286wmp.15.1645898853335; 
 Sat, 26 Feb 2022 10:07:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] util: Put qemu_vfree() in memalign.c
Date: Sat, 26 Feb 2022 18:07:22 +0000
Message-Id: <20220226180723.1706285-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfree() is the companion free function to qemu_memalign(); put
it in memalign.c so the allocation and free functions are together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/memalign.c    | 11 +++++++++++
 util/oslib-posix.c |  6 ------
 util/oslib-win32.c |  6 ------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/util/memalign.c b/util/memalign.c
index fc8228bffb5..db6cdb095f9 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -74,3 +74,14 @@ void *qemu_memalign(size_t alignment, size_t size)
             size, alignment, strerror(errno));
     abort();
 }
+
+void qemu_vfree(void *ptr)
+{
+    trace_qemu_vfree(ptr);
+#if !defined(CONFIG_POSIX_MEMALIGN) && defined(CONFIG_ALIGNED_MALLOC)
+    /* Only Windows _aligned_malloc needs a special free function */
+    _aligned_free(ptr);
+#else
+    free(ptr);
+#endif
+}
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 91798f7e504..2ebfb750578 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -220,12 +220,6 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *alignment, bool shared,
     return ptr;
 }
 
-void qemu_vfree(void *ptr)
-{
-    trace_qemu_vfree(ptr);
-    free(ptr);
-}
-
 void qemu_anon_ram_free(void *ptr, size_t size)
 {
     trace_qemu_anon_ram_free(ptr, size);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index d9768532bec..4b1ce0be4b0 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -75,12 +75,6 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared,
     return ptr;
 }
 
-void qemu_vfree(void *ptr)
-{
-    trace_qemu_vfree(ptr);
-    _aligned_free(ptr);
-}
-
 void qemu_anon_ram_free(void *ptr, size_t size)
 {
     trace_qemu_anon_ram_free(ptr, size);
-- 
2.25.1


