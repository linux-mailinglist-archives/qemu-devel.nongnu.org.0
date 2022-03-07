Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079B4D04B0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:56:10 +0100 (CET)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGeX-0005Tm-NO
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW0-0001Wp-H9
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:20 -0500
Received: from [2a00:1450:4864:20::32c] (port=33993
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVy-0007jw-VU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:20 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso197080wms.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FESTC/0BZsNEujezQb148jTd0VqMzayMHKHa6G291j4=;
 b=bcyXpi2u7b757mR/7vciHB5XPXLe+n8WxN07JDjKkVVzm16Zh1Q5RevZwwHbVPwFV7
 w40o2w3MlOR8nfWt6+auDqXgih/+xvSlnzBMq2dA+f3zXK8cyinvavjm2sd7uxrwcTFE
 GoJ2QesyiSUKFL4JdRrTAmo49tjkgE1V5nDTtz8T/5g1j4cJolPhuz6Ta0N5nqKWj+iR
 afgX7Lh8gKqHALiVnXpr+3joa2Vgo+bRHv+amRvter1b53VNUFMmoWljqER2xcRcA9Vw
 eXATzt8VTce82c+w/30IrVP1rrKDaub6dvBSZhcHZL/5PrfUu0wrTkofE/D9+0F38sTE
 wzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FESTC/0BZsNEujezQb148jTd0VqMzayMHKHa6G291j4=;
 b=hQ1NYv0Jqku/+adTzHGvBffLF297lu4YFDMizewEolSHwX6RNLRsNIQPN3v7v5Zmpu
 HsvLUsJotzZ3kGbAl9RSOVwybgK2EJ8N6Og8zi68IeIKhFr9IzAw/zwxPMC916W586pM
 DwOU0q3jOPLHg/+z7COoKsc0CNbGLKB/aMtw6Ylo6rQMWkRRCz/MMwUB2FwlqXbT69AX
 UMad+AknWGzEfRUyJ2vulONr4fif8NTdOTpiGQnjblhr59IqSwXDBcwWBw3jZ3liUD8H
 wHvBCDlHvSzhY9IR/w/nrklyUiPkw1qV6+umYptaMdechsyp+eXVBvWrrYfkAbjlqLi9
 pBJQ==
X-Gm-Message-State: AOAM5301k0Nk0HBrcgAAgC0k/SEGLO2Vx1u4RcGn8/RORaKPknHsT7jg
 ScJfUR+Mw7ZibukBzt0yp27l5eqaNT5vwA==
X-Google-Smtp-Source: ABdhPJxte/Gqa2PiRTUA1wKNs5vphw9dtnBbtq0cR38CT1ARlb7U0sG9Bg8R3rX08xvYvYoIwqhvbw==
X-Received: by 2002:a05:600c:2846:b0:389:9347:9aaf with SMTP id
 r6-20020a05600c284600b0038993479aafmr9635461wmb.87.1646671637689; 
 Mon, 07 Mar 2022 08:47:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/18] util: Put qemu_vfree() in memalign.c
Date: Mon,  7 Mar 2022 16:46:58 +0000
Message-Id: <20220307164709.2503250-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_vfree() is the companion free function to qemu_memalign(); put
it in memalign.c so the allocation and free functions are together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-9-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 util/memalign.c    | 11 +++++++++++
 util/oslib-posix.c |  6 ------
 util/oslib-win32.c |  6 ------
 3 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/util/memalign.c b/util/memalign.c
index 083aaae619c..440b8fd9a76 100644
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


