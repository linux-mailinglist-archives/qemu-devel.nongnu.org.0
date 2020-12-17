Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E332DD3DE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:13:32 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpuyB-0006aW-75
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudu-0003OE-Gc
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:35 -0500
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:41152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudp-0004uv-Bm
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:34 -0500
Received: by mail-oi1-x229.google.com with SMTP id 15so32445855oix.8
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=x+s9W4S8X9df0AJnC/pFDE7SPPgT3/tOf2XSzgDEzSo=;
 b=Y45N7SZ/1G1wAVf4ie5dZ3ZzDQFp7nNKDtAwW0L8VeAu0tRCXRI0ojm4Y3xwTdwVZB
 AE1nBLiz+z6J/DnuU/WeZHo7jTlQcNIXXGE0yc35otugL8GlOz4Xv5DJ4q4eepx29wsg
 zzA7FfEFuqG/dFNbnCNxDfL5+WM25SOzIBzvLwfOoo+J/HndRB+jXXBr6OXwkRoJD3Ax
 /bOw+kgJgxV+TPgRHW8KWckuFCEDDVl2tsuh8Uva5F94Zm1iF7A0xRVTqRkkwSWguZtJ
 j7GSCHOpuAfZmPFWPso7o5ORgCC5OPLUl+I+Tf/oyZbR1SQbtvsLaE717WcyoypYFIDq
 sIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+s9W4S8X9df0AJnC/pFDE7SPPgT3/tOf2XSzgDEzSo=;
 b=tt8akvsWd6uNz7vSHsQqG3vt5Ab1sBOSMmyb6j7DUG58oP5Rc1VngN6K6tIo6fbNDz
 2RSvzt+6jYmpelFQmLwFPg0TDnqJ+CLqybji8WXzknWO6vjeLu68rnhacHNg7i9rHF35
 3wRkz4FyL3Um/BmLfJ0HG8HyrX3ORGLi0lLaOeO6mV2lKzcGkxZl+zqaP3yK4kerVLU1
 fQv2hEJeCu+avgwUdfpLaT2hDfIusVY4dYmlUyYfQV4R4mOBFyKwejqDnDHjNrZdYbAe
 2iSYOMRx1jo4kobpxLXN9plBVQmekrDFZ5c7bbO2A6Vj9yIkQodmnXYszSfABDKT70FN
 8BRw==
X-Gm-Message-State: AOAM533rLlcxqkphfOhrgIkF30ABX/ZQxgh0i/Qv9XFRlTZ0HrZC0bJM
 VlWFcI1XU37CTUP74hndxN0zgu0OtPVKBw+x
X-Google-Smtp-Source: ABdhPJwhNhcff5pClGvzw2epjceNe7z6/RcbsGS35vo1tsV3rvKG25mpgV+u50A4JtwmZ8rsjWtN9w==
X-Received: by 2002:aca:cc01:: with SMTP id c1mr5076799oig.18.1608216747597;
 Thu, 17 Dec 2020 06:52:27 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/23] tcg/optimize: Improve find_better_copy
Date: Thu, 17 Dec 2020 08:52:01 -0600
Message-Id: <20201217145215.534637-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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

Prefer TEMP_CONST over anything else.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c0fd65d2e4..bf2c2a3ce5 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -122,31 +122,28 @@ static void init_arg_info(TempOptInfo *infos,
 
 static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
 {
-    TCGTemp *i;
+    TCGTemp *i, *g, *l;
 
-    /* If this is already a global, we can't do better. */
-    if (ts->kind >= TEMP_GLOBAL) {
+    /* If this is already readonly, we can't do better. */
+    if (temp_readonly(ts)) {
         return ts;
     }
 
-    /* Search for a global first. */
+    g = l = NULL;
     for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-        if (i->kind >= TEMP_GLOBAL) {
+        if (temp_readonly(i)) {
             return i;
-        }
-    }
-
-    /* If it is a temp, search for a temp local. */
-    if (ts->kind == TEMP_NORMAL) {
-        for (i = ts_info(ts)->next_copy; i != ts; i = ts_info(i)->next_copy) {
-            if (i->kind >= TEMP_LOCAL) {
-                return i;
+        } else if (i->kind > ts->kind) {
+            if (i->kind == TEMP_GLOBAL) {
+                g = i;
+            } else if (i->kind == TEMP_LOCAL) {
+                l = i;
             }
         }
     }
 
-    /* Failure to find a better representation, return the same temp. */
-    return ts;
+    /* If we didn't find a better representation, return the same temp. */
+    return g ? g : l ? l : ts;
 }
 
 static bool ts_are_copies(TCGTemp *ts1, TCGTemp *ts2)
-- 
2.25.1


