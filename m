Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDBB1D7F17
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 18:49:36 +0200 (CEST)
Received: from localhost ([::1]:45856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaixL-00065k-FF
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 12:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jaip7-00027l-97
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:41:05 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jaip6-0005rH-A8
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:41:04 -0400
Received: by mail-pl1-x642.google.com with SMTP id k19so4440130pll.9
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/u2gGUYvwpC8sb/rqLeX8kHv104pan4Dnbe4hQpH4A=;
 b=I14a1WbnGlHu8xISviWfGDFF/LvZVLn6s7gKLC63sw8bpfRtHKks98Le1odBnra35W
 7iqhjfY3cOk3Ew61Nu7s2hAOcpO11LEdQDOcqFpChJf3E4PGWEKtDZ6c8vr3Pg7kjkMk
 Hdzpstf6qYItl5QAlLnakEwcqtLW9KvJHjLVq8idfyy3jycUl/S1Jqyn0zZlJjTyzDZI
 nBr6ByKIWB17i+bKT0tJtP6xQpR9T/dOyD75lLDB+DoeF1+zHt5QyN8/Ty1GAWWZAFT8
 zldko/x1v8bPXu2B/N/c/mGF5+4u0g10Lqc53RCNtlMJ2N+Ws/eXauzlaDZhs3SdRG1x
 TQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/u2gGUYvwpC8sb/rqLeX8kHv104pan4Dnbe4hQpH4A=;
 b=XSrglVFTuH0msLayoOCXSRbRBkmSlUTy/3CF+IqpQNTdcm/BjEDlELiz/RDD9u3PS8
 g69MnQPqTDDGHdGjyDEYa6q5R1Jkl3GOITQtqLKLBuKyMdLgI5JOby+SXBosIidhTsC5
 QeYgC4KsjCuD5aZcWRGlclMbChNZZxQn73FhTsyT026WTBOYQAAnQPGCNoNT/SDj4xPK
 jYZ+lczYv7TNuOQ3kNxwDzpl0kfJD+hNy8Mu2lNfLOEaXl23ppSCi0ivwcLzRj8mTFtq
 5L3S7PrUgiwfEWNiwmJQ4Xek7BEdGOzkCs1hjU7HbUYIrjLK+am1qVbU/ZMv0NgyHFnC
 qxJg==
X-Gm-Message-State: AOAM532oPCqjdO09YEvrZyYiMdLhliUMih3e3V/VKSLzmumgolTAdL/T
 M0JgWF/6+kIZJptUF7RdCItgMkBiVWo=
X-Google-Smtp-Source: ABdhPJy6AaIPJE6uXvnmYrIYQRlYrUgrTkShssYhzAjxLUh7vXsbA4VWMRIlGz7OLvBf52OntUwbww==
X-Received: by 2002:a17:902:502:: with SMTP id
 2mr12036921plf.134.1589820062371; 
 Mon, 18 May 2020 09:41:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id x132sm5790610pfd.214.2020.05.18.09.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:41:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] decodetree: Allow group covering the entire insn space
Date: Mon, 18 May 2020 09:40:49 -0700
Message-Id: <20200518164052.18689-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518164052.18689-1-richard.henderson@linaro.org>
References: <20200518164052.18689-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

This is an edge case for sure, but the logic that disallowed
this case was faulty.  Further, a few fixes scattered about
can allow this to work.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 ...est1.decode => succ_pattern_group_nest2.decode} |  2 +-
 scripts/decodetree.py                              | 14 +++++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)
 rename tests/decode/{err_pattern_group_nest1.decode => succ_pattern_group_nest2.decode} (85%)

diff --git a/tests/decode/err_pattern_group_nest1.decode b/tests/decode/succ_pattern_group_nest2.decode
similarity index 85%
rename from tests/decode/err_pattern_group_nest1.decode
rename to tests/decode/succ_pattern_group_nest2.decode
index 92e971c3c5..8d5ab4b2d3 100644
--- a/tests/decode/err_pattern_group_nest1.decode
+++ b/tests/decode/succ_pattern_group_nest2.decode
@@ -6,7 +6,7 @@
 %sub3 16:8
 %sub4 24:8
 
-# Groups with no overlap are supposed to fail
+# Group with complete overlap of the two patterns
 {
   top  00000000 00000000 00000000 00000000
   sub4 ........ ........ ........ ........ %sub1 %sub2 %sub3 %sub4
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index ea313bcdea..3307c74c30 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -124,6 +124,7 @@ def is_pow2(x):
 
 def ctz(x):
     """Return the number of times 2 factors into X."""
+    assert x != 0
     r = 0
     while ((x >> r) & 1) == 0:
         r += 1
@@ -131,6 +132,8 @@ def ctz(x):
 
 
 def is_contiguous(bits):
+    if bits == 0:
+        return -1
     shift = ctz(bits)
     if is_pow2((bits >> shift) + 1):
         return shift
@@ -793,9 +796,8 @@ def build_incmulti_pattern(lineno, pats):
             error(lineno, 'width mismatch in patterns within braces')
 
     repeat = True
-    while repeat:
-        if fixedmask == 0:
-            error(lineno, 'no overlap in patterns within braces')
+    fixedbits = 0
+    while repeat and fixedmask != 0:
         fixedbits = None
         for p in pats:
             thisbits = p.fixedbits & fixedmask
@@ -978,6 +980,12 @@ def build_tree(pats, outerbits, outermask):
         innermask &= i.fixedmask
 
     if innermask == 0:
+        # Edge condition: One pattern covers the entire insnmask
+        if len(pats) == 1:
+            t = Tree(outermask, innermask)
+            t.subs.append((0, pats[0]))
+            return t
+
         text = 'overlapping patterns:'
         for p in pats:
             text += '\n' + p.file + ':' + str(p.lineno) + ': ' + str(p)
-- 
2.20.1


