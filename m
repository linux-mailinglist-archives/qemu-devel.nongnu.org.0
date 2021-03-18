Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5D0340C74
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 19:07:00 +0100 (CET)
Received: from localhost ([::1]:46052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMx2x-0002j0-1w
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 14:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlW-0006ck-6r
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:58 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:41539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008DN-CC
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:48:57 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso3921359wmi.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwAogQb7m4DD8GZyODnL9Y7J57TBm4/rq47dw3yQg8o=;
 b=OWSRaNzkbB7ScI3FwP3Z/RYLHumW1C1UPGbIiWR0ZX1gIhBlT9AZHChGQwedz6jiQq
 y47RDqEWriyQ+4Bhc/oYWikA83GBXhH++PvHQegIDoh5F+C8UgBc1uHs5Wrtg4TmlLCg
 rYY+mR2qVSUxqRzuZlezvB+KdpgSB552errbzkv7uGLemTJpUvvsCltBJCqaxxaJmMDt
 p9CVH0H0UIDa4DTERKyP3DFQfjCgjsbXQUdQk4mveOuk/Tw1ASec9vsXGdZ+lVLLJpI3
 jIxx9bHYcF2M1y7u0AXQO1abNp3oIZhNN00KuxHc1Gsnq22S0BXOELZkEhUrg3EqQnuz
 XRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwAogQb7m4DD8GZyODnL9Y7J57TBm4/rq47dw3yQg8o=;
 b=K/p0qS1ptDkZtXyeeavA1WnDkXHM7qYWkAln3PpGGh/SC8jPu5ZgA1AtTOpt19t2Vo
 jLaoAiE5Iq6qlAZZHjhtwPf44glZfL51wyJ/XwdiJHxxWd6EAZiXgJHSZ4YWUy5SL9lX
 URqxxyUUH0NZI8/UC/eCkHrgMc4w6jmP5yd6yuVrlZCy7qzkX97oHGg0IogqR85zoF4M
 y58R7cKITg/ziL6UwBIY46LYOjaNhoZNQ0f362DWg232H+nJQaONVGmKlaU2JvKVo1oy
 0HBGrVfr6zNeC04GlSQKpB/LKBfoO4bhZHCe6/HUe75abA5wDjIE96wPerd7TY3S0d19
 ogLw==
X-Gm-Message-State: AOAM533m4iHq9F5zHO1ybOaSJnnRWhBFUNe3nbiOKb4dZaZMlEFlSF77
 pwDGVXybP8Tv9YZovbA/czk/HZBPDO7JKVvR
X-Google-Smtp-Source: ABdhPJyHGsPP7606inJ+Ci9XImvyBbdDcRywmz+536Ff1QY6rH3Tr7hH40uEabg2Rnhiw1pUeetthg==
X-Received: by 2002:a1c:67d6:: with SMTP id b205mr325807wmc.118.1616089709129; 
 Thu, 18 Mar 2021 10:48:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 3/5] memory: Add offset_in_region to flatview_cb
 arguments
Date: Thu, 18 Mar 2021 17:48:21 +0000
Message-Id: <20210318174823.18066-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function flatview_for_each_range() calls a callback for each
range in a FlatView.  Currently the callback gets the start and
length of the range and the MemoryRegion involved, but not the offset
within the MemoryRegion.  Add this to the callback's arguments; we're
going to want it for a new use in the next commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h           | 2 ++
 softmmu/memory.c                | 4 +++-
 tests/qtest/fuzz/generic_fuzz.c | 5 ++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 71a1841943e..529152c6a85 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -782,6 +782,7 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
  * @start: start address of the range within the FlatView
  * @len: length of the range in bytes
  * @mr: MemoryRegion covering this range
+ * @offset_in_region: offset of the first byte of the range within @mr
  * @opaque: data pointer passed to flatview_for_each_range()
  *
  * Returns: true to stop the iteration, false to keep going.
@@ -789,6 +790,7 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
 typedef bool (*flatview_cb)(Int128 start,
                             Int128 len,
                             const MemoryRegion *mr,
+                            hwaddr offset_in_region,
                             void *opaque);
 
 /**
diff --git a/softmmu/memory.c b/softmmu/memory.c
index c4730ec47ae..d4493ef9e43 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -671,8 +671,10 @@ void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque)
     assert(cb);
 
     FOR_EACH_FLAT_RANGE(fr, fv) {
-        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque))
+        if (cb(fr->addr.start, fr->addr.size, fr->mr,
+               fr->offset_in_region, opaque)) {
             break;
+        }
     }
 }
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index b6af4cbb18b..ae219540b42 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -99,7 +99,10 @@ struct get_io_cb_info {
 };
 
 static bool get_io_address_cb(Int128 start, Int128 size,
-                              const MemoryRegion *mr, void *opaque) {
+                              const MemoryRegion *mr,
+                              hwaddr offset_in_region,
+                              void *opaque)
+{
     struct get_io_cb_info *info = opaque;
     if (g_hash_table_lookup(fuzzable_memoryregions, mr)) {
         if (info->index == 0) {
-- 
2.20.1


