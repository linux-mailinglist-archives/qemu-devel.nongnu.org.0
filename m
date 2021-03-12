Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A833396C4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:41:35 +0100 (CET)
Received: from localhost ([::1]:47050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmj8-0002km-9v
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbg-0005TG-Dj
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:48 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbb-0002g0-GV
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:48 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so15636902wmi.3
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FdVDED8kKnbt0t9rcpUoiyt06STJfiA/Zd4Bwc57Y8s=;
 b=hFY6aiFV596TJ8mRkE54kxP7Hq8Bne2Gl5B/yE5QkwiYbMPtyTSHGDBSWRDdMSDhk/
 IK0YleMIff7FjwcHCa5bVHX97jK7kIUcUtTQ8sbdoUA+1tGNc91wYqcmTfFSFcQCq4e3
 +ir0U4uqctisXEKMA8YjOzVMmegfbLY5rXmERkvVS+qtfS+qE/oIWMpaCiI790t5vseI
 rliQsMmSWthDenmoaEpMIYEH16PYnw52enyAdoEuhCkVoI+8MCgq8khHKZc7LaN403lz
 kQyOMJwNm2rXJWUiuP8QAT0W0Ob2uuc52k1rgjEdGthezZEmIy4KcQp52QmErur7yuD/
 r75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FdVDED8kKnbt0t9rcpUoiyt06STJfiA/Zd4Bwc57Y8s=;
 b=fXwn/bLtawIswQ1lMaRBZZ0VNu5pY1cBH7E1wJmLbh8flBt1GUY2J0UWUhtqdH0dXy
 5h615/id72ZDlZc3nKSJr+VtvPwNarvX5n3b3UTtJuvuu4pgwY5gFCrWO5VpOZxLcR8K
 jlHvkcLm6PfZwvlQX8AXCdJpNYpw8RefkmG0aYxzAkVin/nwrDjAD+64Vc2GQMk9PLyT
 rDLJAXK/qicvtOaNHRXkk9Pws2T57/HyijOAorSudt01idH6+gENodhmdiXuBo9QKFKU
 ine/GZlkSbd/+AWFkrKZu7GmVR1Fxh1UnYg62neyVoUliRmxiVQUbjDLRoPCADZLBk+O
 nhgw==
X-Gm-Message-State: AOAM533bzoe7Tj9orWVa0x+1FtU1e146tlqIca6SLHqjXB+faeiEC4lX
 C6hhuqgLlHnhuQ2sGdz2Ksp//Q==
X-Google-Smtp-Source: ABdhPJzQ89JN2fTIh/ppkmnbRidq7/Xv7MHtTF7ee2D+MnttGNNUzrgtMOEP60iy2c7Ws/R5taSxmA==
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr14101898wma.92.1615570182187; 
 Fri, 12 Mar 2021 09:29:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm2679001wmf.45.2021.03.12.09.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:29:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/2] memory: Add offset_in_region to flatview_cb
 arguments
Date: Fri, 12 Mar 2021 17:29:38 +0000
Message-Id: <20210312172939.695-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172939.695-1-peter.maydell@linaro.org>
References: <20210312172939.695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function flatview_for_each_range() calls a callback for each
range in a FlatView.  Currently the callback gets the start and
length of the range and the MemoryRegion involved, but not the offset
within the MemoryRegion.  Add this to the callback's arguments; we're
going to want it for a new use in the next commit.

While we're editing the flatview_cb typedef, add names for the
arguments that were missing names.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h           | 4 +++-
 softmmu/memory.c                | 3 ++-
 tests/qtest/fuzz/generic_fuzz.c | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 54ccf1a5f09..0c3ddf2bb9a 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -778,7 +778,9 @@ static inline FlatView *address_space_to_flatview(AddressSpace *as)
 
 typedef int (*flatview_cb)(Int128 start,
                            Int128 len,
-                           const MemoryRegion*, void*);
+                           const MemoryRegion *mr,
+                           hwaddr offset_in_region,
+                           void *opaque);
 
 void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque);
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9db47b7db6b..3cc78862c79 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -671,7 +671,8 @@ void flatview_for_each_range(FlatView *fv, flatview_cb cb , void *opaque)
     assert(cb);
 
     FOR_EACH_FLAT_RANGE(fr, fv) {
-        if (cb(fr->addr.start, fr->addr.size, fr->mr, opaque))
+        if (cb(fr->addr.start, fr->addr.size, fr->mr,
+               fr->offset_in_region, opaque))
             break;
     }
 }
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index ee8c17a04c4..c10a19316f5 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -96,7 +96,9 @@ struct get_io_cb_info {
 };
 
 static int get_io_address_cb(Int128 start, Int128 size,
-                          const MemoryRegion *mr, void *opaque) {
+                             const MemoryRegion *mr,
+                             hwaddr offset_in_region,
+                             void *opaque) {
     struct get_io_cb_info *info = opaque;
     if (g_hash_table_lookup(fuzzable_memoryregions, mr)) {
         if (info->index == 0) {
-- 
2.20.1


