Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DE7346173
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:28:41 +0100 (CET)
Received: from localhost ([::1]:39520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi1Q-0008MQ-IG
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzv-0006Xq-0F
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:08 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzq-0007BX-Kk
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:06 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so10953585wmj.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ANKfaI+3HtDgrtrUD4nkRjqYILHHidfMfgvGr268mts=;
 b=S1ggtOdjNopiy5uyYZH62EAqm5xE7lEbX25tUL20kOIkfgGXY9YZsSfQ0LZXH7lWV8
 yBHdTo2ANakgZWcjPvzy+urHfHdLZ1jS4d5I6Wvm67NoOs8xbRWYCZofY0aEas3zBtTN
 0xq6IJvIwLFG2NFCsFkXla2M80bwAWJ/1sxIF062ah17L9Ybwlz70aBKsy51r3VljaWs
 k3KLskrFQQzlz3g48iW6WmpNzISrA0CWb5fpz3k9885QokoWo0te8giptATwR9WS9HOA
 4uM/BVbjI2IpVhGHV6sP52t28vllQzpoVT6dWWt/aCsQyQrPhjF7ktsO04I787xtGBua
 PQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ANKfaI+3HtDgrtrUD4nkRjqYILHHidfMfgvGr268mts=;
 b=lTA9Hm1sc1w7tASf1hoNddzhKL8mJItOlH4/Z1WQYdDUzv+SAXIS8O1Qfut4rrvf9M
 KpwNz5vS8VC6KNFJJM3kqwoFLLS6N3tkI7yDAf+ZkCq/N1lAYELOo8A3dsU+anOx6q5C
 EJ2ZwGamU8X6HYaZTnN87nNBs+muCG6pTJOxFum/HD7l2fq40VMpouKsXN9BFKWVeyRQ
 XzcaNfZx3DLxwhNfoo1db/tnVASTPWob/0PdokXMN8W0cvWuDDseaG2gxlk+5LIz7dba
 5J8qR8ByP55CDo7mkeeWmgzFq1UCq2YLGCWhmBity8IYX+NCI+bsCWwS8ri6a42O3C7q
 wS5A==
X-Gm-Message-State: AOAM532muS4w3/BjBtKtefo7hrVNCdU2ZsG8LCeeX4ffJc50nFoQOv+K
 A3J5aUwAf6j4U6R/qyI/WUak0NjRIcWftt2o
X-Google-Smtp-Source: ABdhPJz/KDQzUoHecMNZGJ5MnS/d6jVC4T93s0JqiQmfcKo3BI53xpfwMMgltPdN3xGsTBxX9Brz1w==
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr3648676wmq.149.1616509618484; 
 Tue, 23 Mar 2021 07:26:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] memory: Add offset_in_region to flatview_cb arguments
Date: Tue, 23 Mar 2021 14:26:50 +0000
Message-Id: <20210323142653.3538-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function flatview_for_each_range() calls a callback for each
range in a FlatView.  Currently the callback gets the start and
length of the range and the MemoryRegion involved, but not the offset
within the MemoryRegion.  Add this to the callback's arguments; we're
going to want it for a new use in the next commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210318174823.18066-4-peter.maydell@linaro.org
---
 include/exec/memory.h           | 2 ++
 softmmu/memory.c                | 4 +++-
 tests/qtest/fuzz/generic_fuzz.c | 5 ++++-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 88c2451c066..5728a681b27 100644
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


