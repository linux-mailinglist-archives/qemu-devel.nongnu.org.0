Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8826E26B8B2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 02:49:17 +0200 (CEST)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kILdM-0000Cj-JE
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 20:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILav-0006CK-CC
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 20:46:45 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:55221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kILat-0001VM-CC
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 20:46:45 -0400
Received: by mail-pj1-x1041.google.com with SMTP id mm21so663495pjb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 17:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlzqTM8MN4TgFiIIYSOlECE3VdxOaRIuKAB56KsJHUw=;
 b=yUB+GUJ48KcdLz4tskSlwvs/6KoJcFilBd4dSdNlrS0Z8UKcuNx/IkQBKYpMIF2pNt
 NTQrGJdfqkF5PvR8LIddUdIM12mJYtT2Gy5i704InoURar7a4V34BqhPLsHkTQbaDfeq
 wYIE1W4QPsZRwYDh5fdu40YD+s6tYv9PD15eyZ1JbtU9p/kf5WwLbY/qdqkH62DTxRrh
 GV/nAFMlDAijuPZlHOGzXgjEmqNHWIZAYkCgjYiN7JMsbcUe3b10vvJesx+JMNupL9Bi
 E47d++PfoCa5Anscv7sQHooAgd9XDQeuw5v4WW5MDwRJk49dMTyT0W+pXcpJThBPKlYi
 E7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JlzqTM8MN4TgFiIIYSOlECE3VdxOaRIuKAB56KsJHUw=;
 b=rnO/mmTEv3k4GGC01liPvO0yzgl5YECvVS/UlxEaDdDfdBcmRnow2lSeHGbWu8LoPe
 gdmOPZFDHSZmnkhmkafWRj1Tv+5DSigNECmtP9+9cCRpo9ApuVay3YXKN70Dn52UCD/x
 ncV6GLrDhPBeNmb1f4p4O5hTixzxbdpX2P3NFHLtS5uBiCAXSI1MpCMqs8NfcU33oKey
 SimLKdggGaV/buvsqnHhz7TQ65AWI0EedmI2634O3zC6V7vwrKuZOonoxvJXUHnjj3v3
 YJIYGkXL0nwngi7qgRE00TDg/ttrnwnmUHYVMkXFjsrtNTfpL5Hl2VwIEYMwclyoGxez
 e0qw==
X-Gm-Message-State: AOAM533sJquGxF5M3SEM8rdLJk/nxDBxL1Fi2EGEq27J7gVtss6rhFbA
 d3jQaYo+A+nIuALJ4F57Y10JRzQdlk/04w==
X-Google-Smtp-Source: ABdhPJy6VBIa0S05MzVu5YswlHGmEMaw4Q6wYDdfN/qb/tVPa0UbXpVDnJVvkKjv3J4CqcYTsr5VAw==
X-Received: by 2002:a17:90a:ca82:: with SMTP id
 y2mr1648127pjt.233.1600217201728; 
 Tue, 15 Sep 2020 17:46:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id kf10sm611723pjb.2.2020.09.15.17.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 17:46:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] util/oslib-win32: Use _aligned_malloc for
 qemu_try_memalign
Date: Tue, 15 Sep 2020 17:46:33 -0700
Message-Id: <20200916004638.2444147-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916004638.2444147-1-richard.henderson@linaro.org>
References: <20200916004638.2444147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need or want to be allocating page sized quanta.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Stefan Weil <sw@weilnetz.de>
---
 util/oslib-win32.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index c654dafd93..8d838bf342 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -56,10 +56,8 @@ void *qemu_try_memalign(size_t alignment, size_t size)
 {
     void *ptr;
 
-    if (!size) {
-        abort();
-    }
-    ptr = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
+    assert(size != 0);
+    ptr = _aligned_malloc(alignment, size);
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
 }
@@ -93,9 +91,7 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared)
 void qemu_vfree(void *ptr)
 {
     trace_qemu_vfree(ptr);
-    if (ptr) {
-        VirtualFree(ptr, 0, MEM_RELEASE);
-    }
+    _aligned_free(ptr);
 }
 
 void qemu_anon_ram_free(void *ptr, size_t size)
-- 
2.25.1


