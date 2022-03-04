Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D57B4CD388
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:33:51 +0100 (CET)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ6By-00007S-Ah
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:33:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ60C-0002o5-Nm
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:40 -0500
Received: from [2a00:1450:4864:20::430] (port=37824
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ60B-0004gs-2P
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:40 -0500
Received: by mail-wr1-x430.google.com with SMTP id bk29so12205421wrb.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1CcE3kkf6U7pzs8VKX54OJnlAyPVjTkRvkvMzX4xcmU=;
 b=tAA+/lJ5ClrHgjKwn6A6QuJVFVYG/1mig7U4ZdU9py/wDZ8gZNsJh9zytvf5JaN7NK
 GbaQLL9dsGDSsW3ao4OAqB2uXA/M1KPLj7S9lktecSJ0M5EaOERlQltohVIcAsJ0plJ1
 5djHnVVJVZc438SyQjxqfviTURYPjgU58WO8ArSgR2VoO9nwlZYy7fIZx8074srpiwKJ
 Z9kh+eP1Hu49q8d4SAQxYdVlIYFen/TxrZsoEmWNkI5JtelBpGKORDUrWuexcPG5Nyso
 saMeBgSeYqMbCUxwQBhiUOlKLopZ24mq3fgKy7F1AYM5vwFYEpSzLC6Y+1jd3gi91Zl0
 4BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1CcE3kkf6U7pzs8VKX54OJnlAyPVjTkRvkvMzX4xcmU=;
 b=740zy2UUNBYFGqVFqotPHzkZUxTebXXcJPiG/vrE9fUR/iVHnXsSt+ST4FtlDiYrXC
 q1attHqKjhqzNMoigJvZw+TPwbvLG8z8UtYn/q+VgSkl6wQ3FJdLGKp3GjWKfwhusmAA
 20S6lfNKSX76cJqS/iEdRTqzMSCSSmvwSmcOaq7BpjIRzIXpgW1CuysicRZmcjUvj7F6
 aZ8tOBUnByMlF7SMo1bzPNRBKGOpxT8ZvxrLTPSNoVlMIdMOGsDwrRYcCjgIxyQMk1Vs
 5l4L8xfF2EBeB9XgH+/2NTfTl0LxXsR3DE0B8QcoRwFq/YjdMlec3Ioo1Uw+59CYoAn3
 rIZw==
X-Gm-Message-State: AOAM532IB+G1KwtkXTeQ4j7Wk40bUHU2a+P9MfSv+yCwaezqAZEncLQi
 uAc5eaVox2W6JIwYy2hCzAnH09wEWDluZA==
X-Google-Smtp-Source: ABdhPJw7ES4Dpfj7MHN1vKQDPqnBtfsw4HnR0bKjhSGZ45A/NsohpeQORqm16MF43E9yRjkNW3gO6w==
X-Received: by 2002:adf:ed0c:0:b0:1f0:4a32:4d0d with SMTP id
 a12-20020adfed0c000000b001f04a324d0dmr6223874wro.136.1646392897704; 
 Fri, 04 Mar 2022 03:21:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] util: Put qemu_vfree() in memalign.c
Date: Fri,  4 Mar 2022 11:21:25 +0000
Message-Id: <20220304112126.2261039-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfree() is the companion free function to qemu_memalign(); put
it in memalign.c so the allocation and free functions are together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-9-peter.maydell@linaro.org
---
 util/memalign.c    | 11 +++++++++++
 util/oslib-posix.c |  6 ------
 util/oslib-win32.c |  6 ------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/util/memalign.c b/util/memalign.c
index 2a139a5695d..5b812bc11fe 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -78,3 +78,14 @@ void *qemu_memalign(size_t alignment, size_t size)
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


