Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C85F2F1C5E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:30:51 +0100 (CET)
Received: from localhost ([::1]:52424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz11m-00049j-EW
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rV-0003BN-0R
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:21 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rO-00008l-Oa
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:11 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so84920pgx.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ukQ7RjPHGqGDNjwPl9c9BeoLOp2dRJAKhrKe0DnYWUg=;
 b=i/vh50ktTCwwrFRsqMJkmI2wbnZd3bZNG0wJrFtbdNZF0Zoy2qkWzzazKDfrM8prXv
 anWcqCuHAsRPsymn9oPL6WewNsthrkVpXIT1yV9XN4KudEP21rLCIbO9HOl6vr9/YZ9X
 dsEhmkGLp2B4yuVfKvlEwZ6IyzIojUq+/1SIAi16XDIeFw8xpR9fBsl4lZ/7HaSWhRW7
 k3AT9HnTJR77vmmZaNvddEolRUxZMYKMLbPBuRSY15gihGK4KbHqpJK9f0Gn7liWbxMw
 uZ2/unxZwgMJrWXxjHlsCUCZsUBv9/425lvY/yOaeLt1f5qJsW2J01WPnRHgrJKnQrE7
 nQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukQ7RjPHGqGDNjwPl9c9BeoLOp2dRJAKhrKe0DnYWUg=;
 b=uRjzUO4pmd3uzpzWFKsi3NgfrIypKMdmmC8Ai/DhvMylj9nqJBHf3+mOQ3y/XAot07
 z/tv0zdAxSCGG4J0hyAVmr2thIsThyDtTPK96WVc7bNueqqGAkh8eN604BKDXFefU5KN
 QzC2DZ5bJAiCGAOoK+hXAqQtBRQ6jYuc2JdUJUlAcBHURaC3O5HD+o7ZjjH9Zp5VaqxK
 y4ZS7kWbWoITT5iW0+XuzCdx/GiNRMhE6AvXGZzB1hoJGEvrzyzYS1aWvYj5fUeOIaQz
 30QTV3EMeBMe5sDhomSPlSnIvM2M/futPumqnccQBuCXC1iHYKFADu5MKcsHzM6rYNBy
 SsJQ==
X-Gm-Message-State: AOAM530OQb+CbBlLmurB6iU1zYo9moj7/i6FgPU4f+Wfahl8m8oPDCRN
 eHw8yO6iFiIKJTaiZ49W9y0ibA5rJFnm+A==
X-Google-Smtp-Source: ABdhPJyDZDV3/ufu762r6BiGXVEeBaJTbjh6ovByMP3cwDK8sDwsHM6gjCQayJKEgd4MnLXNbyzntw==
X-Received: by 2002:a63:3648:: with SMTP id d69mr518522pga.155.1610385604955; 
 Mon, 11 Jan 2021 09:20:04 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 09/23] tcg/optimize: Improve find_better_copy
Date: Mon, 11 Jan 2021 07:19:32 -1000
Message-Id: <20210111171946.219469-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
index 16b0aa7229..e42f9c89a8 100644
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


