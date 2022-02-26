Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9344C574B
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:10:14 +0100 (CET)
Received: from localhost ([::1]:33646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1WH-0000r4-JZ
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:10:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Th-0005Yb-Pk
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:34 -0500
Received: from [2a00:1450:4864:20::335] (port=37499
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nO1Td-0004NR-EY
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:07:32 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l1-20020a7bcf01000000b0037f881182a8so3496376wmg.2
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 10:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJV8tjvPH9SAltj2sE6dDyHaDvCdY4+2Q1Mk8oZJ+D0=;
 b=pXFm5YqaI32moBpMzOa89hHYTlzO3Z7KVt0+SrelqHE6SBPX3vWMufhZ9DwpCYQhp+
 715u4jsOyhqQU2wGTJN6EAb8Bv0fbVAxl8cY2DggiIyxBB1IiHzFBnAHJbYT31/lM15I
 lJy1SE6kuzrb/QvBcoeW1SZDBz2BYCDQXzPlu8ctDBsaG6LqJ0n3Fkgmuzi8H5yj8F6f
 QEyqDMSQnbeF4V1HI6ZXoFit1KHlfyChIzUva6LKq1nrIrV8hCbxfwUmAkZ+6NaWeBM+
 /kbGkE/zkgZLMXCmrp2yTmkMDtYXbhPda6OL9hXTRvrzFI2hNItG7jMmFUQ71Y4MrY5J
 kuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJV8tjvPH9SAltj2sE6dDyHaDvCdY4+2Q1Mk8oZJ+D0=;
 b=oFXvRweVw5APAO/re4gWOEN745FMNpxCj/iZiBsCTT0W7zE40YNPlTeoK2X8GJnSKu
 hPclGNsUXvF3b69EyixPpIrv4+y26Xw6eRTWfKQYgc+mGt0RL/c4AQOKV50j66kZ+KcZ
 b4FFfd/61IywNDl28m/7cEMKnyNXILLRoza2JsR3HW26g5mNc0qM0mdoCkN7OxAS5oSZ
 rdolAU6h1l46wsY45DmJL0R2VhepXbsvz9msbdoUOrX5eLYjcD1lDHEqRC8zU2jTWAhF
 NyYceeRzHcP/mvE0X5R+ZCDx40JUYIH7Te+/1hFLf6nSOK5cABJpkbo3dmpvfhAwcpkC
 L1rg==
X-Gm-Message-State: AOAM530UjJtrybASNtN/RR8LHzws4rZXy+zJFDYn6SQ0XOc5ZNm5BZ8K
 XN0+wKz5sOf2fg6b43/MHJ8LPpaqhSGJVw==
X-Google-Smtp-Source: ABdhPJyolwp9I3VkbW+UhWNkIGBq5o5XMNXthYf1GkX9aqmBGypbU2dfHzpRVnWHqyhBBk6yFQDXSw==
X-Received: by 2002:a05:600c:3ba0:b0:37b:b86a:5d30 with SMTP id
 n32-20020a05600c3ba000b0037bb86a5d30mr7266509wms.136.1645898848211; 
 Sat, 26 Feb 2022 10:07:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adfe64f000000b001e60965a5d4sm5622409wrn.44.2022.02.26.10.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 10:07:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/9] util: Make qemu_oom_check() a static function
Date: Sat, 26 Feb 2022 18:07:16 +0000
Message-Id: <20220226180723.1706285-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220226180723.1706285-1-peter.maydell@linaro.org>
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_oom_check() function, which we define in both oslib-posix.c
and oslib-win32.c, is now used only locally in that file; make it
static.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu-common.h | 2 --
 util/oslib-posix.c    | 2 +-
 util/oslib-win32.c    | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 68b2e3bc109..8c0d9ab0f77 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -26,8 +26,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void *qemu_oom_check(void *ptr);
-
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     QEMU_WARN_UNUSED_RESULT;
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f2be7321c59..ed5974d3845 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,7 +199,7 @@ fail_close:
     return false;
 }
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %s\n", strerror(errno));
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef3398..c87e6977246 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,7 +44,7 @@
 /* this must come after including "trace.h" */
 #include <shlobj.h>
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastError());
-- 
2.25.1


