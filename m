Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8C1315AA1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:09:01 +0100 (CET)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9d40-0000az-TL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy7-0003o8-Sz
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:04 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cxx-00082d-5w
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:02:55 -0500
Received: by mail-pj1-x1034.google.com with SMTP id fa16so108253pjb.1
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ACfOE8SVSBgg4JpZZoxjcwYfYXJzG1xX3fS2kxeRIKY=;
 b=oXFQGVTBGmMulxULHJOhwbvTSOAbOepL4D79jf3q4LtOoUpp4NLKglDx+r4MHMhmzM
 RiR3EbF6LygfYXCgEcZ8KPyiEh6pISm33jMfodAwy1ONVwdSR3k6Kdvs+2QChPrz775w
 EPRQPzd1HM+v+SFREQ6L47d3fOG4gbehCcKSGoip7m/H5m5xIjoVdjm1qoQFtxirPYCz
 KYGPJhf3Uo3TCHi+B+N/MMaIHLZ1GQEh8KT7rxj+E3UcVUSamuGOzykJSXItlGDGAvs3
 DcOwgo7K9nwQ4tQjhxI2o4/r5iH8hg8a7hFFntMGE18h5vfd0vKt/epIXH0sZuNgoCqk
 opGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ACfOE8SVSBgg4JpZZoxjcwYfYXJzG1xX3fS2kxeRIKY=;
 b=RB7axKYAHVQXVT6Jyf60e5Z3t1jPSwJ6KHkiLdAzcfLkuXHYnf8KyCXWTx/gZZbr2n
 Rt2LgLz6V8YOrsahVvrWyCJasbmsqv6DY0R20KfbdpO1CzdaqELzIefF77xyqkOzTPKM
 XzbnO5ehiggbEFYbXlCYHUz+5jC//dK9rkasV8lWT1nhfqWYXhItuf8MzU2YY8l3h51z
 oRn/TVXGKdYwiBhk3BpVEbuinruUDTguW9z9FMAf4JLslsoqVPyGUZkdr5iAdNGCQG9R
 k78dyyPlYNMvw/x7zxMLZdNj3KtQMm3tV605OUfJ5DZ4R27eW9N8hlZxd7ly2WJuzLJH
 zL1g==
X-Gm-Message-State: AOAM533tCR9anyFP4l2W+llYktkrCln5bF3WxlQtTJfFGuTssiU7IrGs
 P3wkWs4Q7u4GrrzOHcHxYCr33SdRBBnbJg==
X-Google-Smtp-Source: ABdhPJwiQta00IHmkPN/oXS7O0CNJBAaaXu47DBGTuNWWgP6rUJfhcxdggRkN6BbmYP2GJyvG+vEvQ==
X-Received: by 2002:a17:90a:474f:: with SMTP id
 y15mr381230pjg.110.1612915362349; 
 Tue, 09 Feb 2021 16:02:42 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/31] linux-user: Use guest_range_valid in access_ok
Date: Tue,  9 Feb 2021 16:02:06 -0800
Message-Id: <20210210000223.884088-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

We're currently open-coding the range check in access_ok;
use guest_range_valid when size != 0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/qemu.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 9fbc5edc4b..ba122a7903 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -493,12 +493,9 @@ extern unsigned long guest_stack_size;
 
 static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 {
-    if (!guest_addr_valid(addr)) {
-        return false;
-    }
-    if (size != 0 &&
-        (addr + size - 1 < addr ||
-         !guest_addr_valid(addr + size - 1))) {
+    if (size == 0
+        ? !guest_addr_valid(addr)
+        : !guest_range_valid(addr, size)) {
         return false;
     }
     return page_check_range((target_ulong)addr, size, type) == 0;
-- 
2.25.1


