Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14AA1CB769
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 20:36:05 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX7qu-0004OC-Vf
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 14:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX7hi-0006tr-JU
 for qemu-devel@nongnu.org; Fri, 08 May 2020 14:26:35 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jX7hg-0006eL-OG
 for qemu-devel@nongnu.org; Fri, 08 May 2020 14:26:34 -0400
Received: by mail-pg1-x544.google.com with SMTP id j21so1234019pgb.7
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hO8uxZGqqMIyQAAAtWPOJL9YxJXzGDQrOpnZTatzOw0=;
 b=njmAAwuvw8oERfODYeN/lkVIgFf7zmJzhcAL+6bzIP18A4t42QD6vwiCptFh2fl6Ca
 uVql8v6VYihvB6O5cV5j19P5pI9kPgMKG6EdC7gLqTGnnpzJnxsymotrVI+AaePyDwBu
 0ZagzMQbYEoBNgoGw9hWRXYg7RqWHvICmcKlDl3oSlGIJWvEbzw7lT7P0nmlzV++MkDr
 vzUmbqeVX2mcwUtb5qnDHsc5H2Za5yHOu+JRVWFbfPleGUg28GYWhvy/zToZjN2u7a58
 2xInRZ6ZN6kHjBw7H6qo5Xiop0PNto2/KgPROr4U9jZPrHoNKIlFltsUOWtw/GodE2bl
 +LDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hO8uxZGqqMIyQAAAtWPOJL9YxJXzGDQrOpnZTatzOw0=;
 b=HKVQBapNPIWO5YjtKbPD2wEjmEtaMTMSYcvRQwFoWN+VW7HOJX5ckm+hHNP7qzXXF1
 R+e1oX56KDm5clQIUvdt3TRJxYZ8WjIZdxADAyxMEOb8idM5c9AhZafXkAzee96ILdmw
 psvpHsZjHWLxVOwLJW9EGx5bCjDoUIlLbl1CF519KTrK/O9dCB+8u1WT72j5RFV+6rXH
 IVSIMZGNDbxf2IJ5AlVsQxn9TqkZe022TYfJcwLD4R0vChOvQGwtxjlGpTtyReByzs2l
 HRBz6MAA8nNyIyuZUDhIzMZ2GYcIZXUX9ZbFlBGkNCxfiNJVZdwtDQW/NdkMqJf04VP4
 lqCQ==
X-Gm-Message-State: AGi0PuZ9k1LZptK7ewU/Iz9brAy15VQLwCFLAQx6LVFMhxkmk3izFCWo
 iRsdidMGIkKGRUrQxCLGP5Nrpsp2Kzg=
X-Google-Smtp-Source: APiQypLalNiSmQty6PFw4bkxFkkPl41s1qBPknlvfmxQ+FGRANm732PfIKni483R5FreIVvSZzBJpQ==
X-Received: by 2002:a63:e542:: with SMTP id z2mr3065701pgj.165.1588962391156; 
 Fri, 08 May 2020 11:26:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-149-226.tukw.qwest.net.
 [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id u9sm2421775pfn.197.2020.05.08.11.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 11:26:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/19] tcg/optimize: Improve find_better_copy
Date: Fri,  8 May 2020 11:26:07 -0700
Message-Id: <20200508182616.18318-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508182616.18318-1-richard.henderson@linaro.org>
References: <20200508182616.18318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prefer TEMP_CONST over anything else.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index c0fc5e3da6..b86bf3d707 100644
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
2.20.1


