Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C1734618C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:34:57 +0100 (CET)
Received: from localhost ([::1]:53896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOi7U-0007CZ-Eh
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOi05-0006ax-SX
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOhzn-0007Ao-AM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:17 -0400
Received: by mail-wr1-x436.google.com with SMTP id v11so20966568wro.7
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bai26WipCTifnbK8KTHEvIfiuURCYGq1Q4Uwj4/TFi8=;
 b=ndXK/vBObFhX367GoUu9PbcBjZDxFtJpflkQr5/2LIno5iEoO4/lPthE147GMplsGz
 ZoW+9ORta+RzwWz0ZQJV6mHMcPCGugpShlxew4BUzwUROnCcFYWzYMWr/jTpjSJClbST
 NrOvN4b+OF/dd6g2VaamZT3ayZzqpkIoVVy0yeEYpzr5Zg89gDO6wPj0TlIfs0hjI1yC
 glw2gkPdQxqnp0XbZGLiG/5xxMCgHyN9XmKXyIAb+687iVCAWNHxvJu2uqwgK/6udnnP
 PXBkNcHo86C+kCDe0h98zoTDeNNpX2/jr+Ot0ia1Bk4zP2i68Jf95w1Oyl5idKrQDMI9
 ljzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bai26WipCTifnbK8KTHEvIfiuURCYGq1Q4Uwj4/TFi8=;
 b=T4xgZ+Jinl3qJY4ur9gd09asI0lUcPwK/yLaBt9ntwUOXPkoc8My/5WrNl5LJQWbxQ
 Ewx4DNt/Yo1xJwqRcyAp4HEEovRZ5Qgjho10O80JsPZyfbgHmo1+orVkEJTWwg4xCL3O
 QG4UwQyfkf+jUzfSRw6B5l4ici+93yVVXEbyrmSKeEIkTn1Jbgk8XWEGR9VGnZ87wTna
 KJKapLI4Vc7ZIIs8hvhl0jG5hoFwsSDPSBi3TMy0kHWB95EHpZEfWEndn8cnvfyioMM2
 5HCXlE7BfiIKCKLit4wZ6NOTm1bp2/p3w/ga3E6KzmAfzfdOqXOUUjACdcUtJt3MlcIY
 p2Sw==
X-Gm-Message-State: AOAM532bbgdl8bsvyKe9p2Y1JmZk5MrcywNCON7E/QIGgbYKyD9h9YEN
 eLy9p1xLebDcsjpJrHYB2PCTFftnSa1oAkPF
X-Google-Smtp-Source: ABdhPJwnUsBgBvfGkl9rEpvpIatEqybf8ys0Ok7KZJ4VqODGyTq4vWpYs/TS5/AiduUuWGY0bDrBog==
X-Received: by 2002:adf:8562:: with SMTP id 89mr4317955wrh.101.1616509617190; 
 Tue, 23 Mar 2021 07:26:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a131sm2861292wmc.48.2021.03.23.07.26.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 07:26:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] memory: Make flatview_cb return bool, not int
Date: Tue, 23 Mar 2021 14:26:48 +0000
Message-Id: <20210323142653.3538-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323142653.3538-1-peter.maydell@linaro.org>
References: <20210323142653.3538-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The return value of the flatview_cb callback passed to the
flatview_for_each_range() function is zero if the iteration through
the ranges should continue, or non-zero to break out of it.  Use a
bool for this rather than int.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210318174823.18066-2-peter.maydell@linaro.org
---
 include/exec/memory.h           | 6 +++---
 tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 260ddd8ade8..500bfc0abd2 100644
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


