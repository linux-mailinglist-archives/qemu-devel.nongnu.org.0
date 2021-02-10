Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2D315A90
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:06:19 +0100 (CET)
Received: from localhost ([::1]:49208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d1O-0005NB-Dl
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxz-0003XN-AF
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:47 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxn-0007zH-US
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:47 -0500
Received: by mail-pg1-x52f.google.com with SMTP id b21so34258pgk.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=wmcNoeZsXbbsc++7oSN6k/JEh0KOzhXc1GGhC7HrMdDD4G/YNgSQJNEqpDdcOrJpgC
 FjwFOyRLFRmzOwADNk6rfsLUvlrp7gN8BEpWL45DisSzGOWk4/rfJr+d3FZ+mBy7Cx1V
 5t2pZ+2FgPdByNrItyH/jmbi13rzPjjIMGlflbRg/g0BxNwm4b65S7qV050OUi59fMhP
 8Em+4QEfK9dSOX7FvJoRAJyrwN6qV1wtLlCPHTrzSN7IZp8btMvZUmYw/551GSUpZQg5
 LuYbNnetgAxURHmCJRWPrUHzQN6Xe5WWpDKijoO5NR33Z3ixdoXOm/xGDFEHzp0kg17L
 RD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VyGOgXRVYXE4KsV9afYsCBAI5eV0Qm7bovPtD8hErTQ=;
 b=hCtN47v2yHYz46/LodzvcsKnhuI0MiGS8IdOlwB1hYbvOH0et5z3iZw/evTheBdVPs
 tCxHOtdyP1du/GCpzSD3wPsmyABJP65vBcVPo4yRJ9SebKgCzTv/52VFYO8+VWRLvN1G
 x2nd4wzSuSf4Q7dW0600415gHi0RuZPvtXBEh2UmDNmJQCH7CBIqK17oBASwrS58+zQe
 2/FEwD/0dK1KsfqHBYGqxG0lQLx089SqLneRYBnB130PWh+bmcSOZ5UQGMhsgzL+H4zI
 q6Rd3ETUgDLqo8DXXukTghXKnPdn74N6EMj0WKHVB0txhXANwufgFHEbSWwC0XlFCtlR
 9Yww==
X-Gm-Message-State: AOAM530pqaPTqES1Q2TWTSLQexKPSmFMIBakzhLZ6AeJGutg9D5LyncH
 jTs6orvy9Bn9cT3GvZLrAgRgfxuhTkgXxQ==
X-Google-Smtp-Source: ABdhPJzPIYCxuOyR9/p0KQkBlH78g9QPdmQp2nqYVU+t6wTNAvIEZjTJdcb3vh9sC6qj2UO/sCtg/g==
X-Received: by 2002:a63:a312:: with SMTP id s18mr404452pge.229.1612915354334; 
 Tue, 09 Feb 2021 16:02:34 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/31] linux-user: Tidy VERIFY_READ/VERIFY_WRITE
Date: Tue,  9 Feb 2021 16:01:59 -0800
Message-Id: <20210210000223.884088-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These constants are only ever used with access_ok, and friends.
Rather than translating them to PAGE_* bits, let them equal
the PAGE_* bits to begin.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 441ba6a78b..9251337daf 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -488,8 +488,8 @@ extern unsigned long guest_stack_size;
 
 /* user access */
 
-#define VERIFY_READ 0
-#define VERIFY_WRITE 1 /* implies read access */
+#define VERIFY_READ  PAGE_READ
+#define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
@@ -501,9 +501,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
          !guest_addr_valid(addr + size - 1))) {
         return false;
     }
-    return page_check_range((target_ulong)addr, size,
-                            (type == VERIFY_READ) ? PAGE_READ :
-                            (PAGE_READ | PAGE_WRITE)) == 0;
+    return page_check_range((target_ulong)addr, size, type) == 0;
 }
 
 /* NOTE __get_user and __put_user use host pointers and don't check access.
-- 
2.25.1


