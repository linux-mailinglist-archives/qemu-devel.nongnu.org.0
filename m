Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CA4CD35C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 12:24:44 +0100 (CET)
Received: from localhost ([::1]:58384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ639-0005yD-EW
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 06:24:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ608-0002Zv-GJ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:36 -0500
Received: from [2a00:1450:4864:20::335] (port=36822
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ606-0004f3-T7
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 06:21:36 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r7-20020a1c4407000000b00380f6f473b0so255645wma.1
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 03:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aw1khmsL1b3jjSBXuTHlqqORQZf6pcNTAPrzcIvj+hU=;
 b=ft5D32Nt5+dR1fEuly+ia2zINtI6Zy15tDDF3gsU+SsCwlgXdERaxwbCm/poOjHx6q
 mylHzrAts9pCQJGd9rDC1Fd57wt7G68/iNFmcJoBDUfNXnJOvcrO2Tm2XhTV/3FYdJe3
 hWqNv7qdC+A74JpuktqyJYTL9YVvXNEPGJZY3SgaLCTXuqKBNGUZWtJnKf5DXOlNRa9P
 OfvZyB7JkfbBzSDqX2ZeIRDboUXOTuvgR+8rIiyF3xa3urHuvD5kY6NP2ExL+cn8MSRH
 WpdX6wDYURGWETz30iQAJFBGppyowRj0fCANMF6wywzCZ3tiPff8scliVvWHKKkT+ntH
 0Y+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aw1khmsL1b3jjSBXuTHlqqORQZf6pcNTAPrzcIvj+hU=;
 b=CxtcLPiaH8b9UY6SRSYWEtZ9tU005BywYXzsVlaP77a0ELvSFjS1ERVB/HWibVGPHm
 S/VaD0L2nTD00DtOmfImMe/Ia1fRxzpw/xDyp/8SN1Tdo9vnVviOtHSsnB7ioxCiNDb5
 iNijcw562DBSZLVlsFNcYrf6SqgsnNeMpJoUtoOWOcPN0dS77f7RYal9/7+t0JLHiO+X
 VsE/29Wsbt8Vby2+s3vm3pISxRgp8QhjIa2hep7ZT9QVI7q6KIYkNSSvYyF1GY5KIHCp
 3XhmiLWiKsvVSgkHGt/pkIenuKq0hVDKgWdTlKMMPHyKfk7SuSj1kUxPKzDtzPWrVfAR
 3fcQ==
X-Gm-Message-State: AOAM530XZKtB9ery62VpXCmsMuGPTuRh7zPEvBE1t4em/e/TzhFz4TIQ
 2QWlzjPT3ZXQFx1EIp6xwpPkb3DDkwWFPg==
X-Google-Smtp-Source: ABdhPJx9in6FG0u/xpHKEHmR8BpdURxy2q4/HKntZJY20mV8VlSYxHwA0CzGdXmDB2C/Ke/lMzGGnQ==
X-Received: by 2002:a1c:ed1a:0:b0:37f:a539:5d5e with SMTP id
 l26-20020a1ced1a000000b0037fa5395d5emr7412175wmh.37.1646392893522; 
 Fri, 04 Mar 2022 03:21:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfed4e000000b001e3323611e5sm4148651wro.26.2022.03.04.03.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 03:21:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/9] util: Return valid allocation for qemu_try_memalign()
 with zero size
Date: Fri,  4 Mar 2022 11:21:21 +0000
Message-Id: <20220304112126.2261039-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304112126.2261039-1-peter.maydell@linaro.org>
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Currently qemu_try_memalign()'s behaviour if asked to allocate
0 bytes is rather variable:
 * on Windows, we will assert
 * on POSIX platforms, we get the underlying behaviour of
   the posix_memalign() or equivalent function, which may be
   either "return a valid non-NULL pointer" or "return NULL"

Explictly check for 0 byte allocations, so we get consistent
behaviour across platforms.  We handle them by incrementing the size
so that we return a valid non-NULL pointer that can later be passed
to qemu_vfree().  This is permitted behaviour for the
posix_memalign() API and is the most usual way that underlying
malloc() etc implementations handle a zero-sized allocation request,
because it won't trip up calling code that assumes NULL means an
error.  (This includes our own qemu_memalign(), which will abort on
NULL.)

This change is a preparation for sharing the qemu_try_memalign() code
between Windows and POSIX.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 util/oslib-posix.c | 3 +++
 util/oslib-win32.c | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 0278902ee79..f7e22f4ff9b 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -209,6 +209,9 @@ void *qemu_try_memalign(size_t alignment, size_t size)
         g_assert(is_power_of_2(alignment));
     }
 
+    if (size == 0) {
+        size++;
+    }
 #if defined(CONFIG_POSIX_MEMALIGN)
     int ret;
     ret = posix_memalign(&ptr, alignment, size);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 05857414695..8c28d70904d 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -48,12 +48,14 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
 
-    g_assert(size != 0);
     if (alignment < sizeof(void *)) {
         alignment = sizeof(void *);
     } else {
         g_assert(is_power_of_2(alignment));
     }
+    if (size == 0) {
+        size++;
+    }
     ptr = _aligned_malloc(size, alignment);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


