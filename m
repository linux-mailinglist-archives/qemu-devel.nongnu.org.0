Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5096D340C59
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:59:13 +0100 (CET)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwvQ-0005fK-9f
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlW-0006ci-74
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008D2-BF
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:43 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so3907486wmj.1
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhXh60pf1O1m8h1ZjyuRXqhtqRaMjfljlipKZlDtlgg=;
 b=PtKvwxWIKCQvXvJgbfylCry7+Hs60doxDxa1+YgNaCCQqR53bZg5WDOzeJyuGiJo2g
 s8ja5dQJCpP331WMB7NFfvFc++ZNGE9Nle42qcBN9pXD+pxsmuaxYT2NSyNX/w82Qwly
 pMyoeIMDMcDzqQHW6FWkNYHFXUuX6VaNkZxCkyP1YOVVX60W1C+fVFj7hvkb/mmBrwLm
 w/MyDbxHs8UR0DAWtHaguXAt3a0X36z9Eka3W+RcTcWTnLXQMPuPz9KLTuZudzryRyrK
 lqD6SQw0JojdkonqFjdfj/qs2CJlld56bw03xYyv/cDtf/mThJoN0wvUhK62ZSHksR+v
 yosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhXh60pf1O1m8h1ZjyuRXqhtqRaMjfljlipKZlDtlgg=;
 b=hm2lPEu/ZkFf8BHmn/d0Y2cIfIJQf3PNiGqalvo7mUMlosZavnSz+qVZa5KInMC76h
 kIx7FosfFTE9yPZ0pj2mlCR4DX7+R1JqiYuUKEJ0S4KlgozWWrtGcIYYK6Q5kXtutsme
 ZvBQbRZmThlN1coeh83Yx4TtY07lz0BDxKNP1TTOxS/ehw9RqcQAoj4gaO0foy+VtKz5
 xJ1rY0gR8xd0IqAP8OS+Un2LUaj058ji3m8CouEa5oBSrA30yfuBXOYCXVWTmxjkj6o7
 7vdvUI2ZrYE9sU8wI71Ujp7tkn409KzjRCaMKg4RgeoEaTLjLs+rTsFgXoYcJ+kfXGum
 vAew==
X-Gm-Message-State: AOAM532uguvPsrUAyP7GWasZWxklUS3SonX/RYzlI4O/2FNC6trPtFx/
 EQA0fA9eO5i09s53o2Yw/y/LVw==
X-Google-Smtp-Source: ABdhPJyqVADGrftgTsnx7htJ5Aj270/Iwkfy478zlxxPAvkHXXXeiWKFQkgn9fRGlckFQsIy/6INqA==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr303228wmq.29.1616089707524; 
 Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 1/5] memory: Make flatview_cb return bool, not int
Date: Thu, 18 Mar 2021 17:48:19 +0000
Message-Id: <20210318174823.18066-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value of the flatview_cb callback passed to the
flatview_for_each_range() function is zero if the iteration through
the ranges should continue, or non-zero to break out of it.  Use a
bool for this rather than int.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h           | 6 +++---
 tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54ccf1a5f09..22c10b8496a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -776,9 +776,9 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
     return qatomic_rcu_read(&as->current_map);
 }
 
-typedef int (*flatview_cb)(Int128 start,
-                           Int128 len,
-                           const MemoryRegion*, void*);
+typedef bool (*flatview_cb)(Int128 start,
+                            Int128 len,
+                            const MemoryRegion*, void*);
 
 void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index b5fe27aae18..b6af4cbb18b 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -98,19 +98,19 @@ struct get_io_cb_info {
     address_range result;
 };
 
-static int get_io_address_cb(Int128 start, Int128 size,
-                          const MemoryRegion *mr, void *opaque) {
+static bool get_io_address_cb(Int128 start, Int128 size,
+                              const MemoryRegion *mr, void *opaque) {
     struct get_io_cb_info *info = opaque;
     if (g_hash_table_lookup(fuzzable_memoryregions, mr)) {
         if (info->index == 0) {
             info->result.addr = (ram_addr_t)start;
             info->result.size = (ram_addr_t)size;
             info->found = 1;
-            return 1;
+            return true;
         }
         info->index--;
     }
-    return 0;
+    return false;
 }
 
 /*
-- 
2.20.1


