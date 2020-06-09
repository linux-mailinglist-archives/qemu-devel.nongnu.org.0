Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBAD1F40D7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:29:07 +0200 (CEST)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jih7a-0005P5-P9
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jih3v-0000I4-Ja
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:25:19 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jih3u-0000Um-Hv
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:25:19 -0400
Received: by mail-pj1-x1030.google.com with SMTP id b7so1162945pju.0
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7rP6ON/rwFD7r5kwGH+K6LUDEi9rTYztwFSHBdHa/4Q=;
 b=vMJdhxRWGLm6pPXW2y8pTcgbhwSh+tfHLg9SMQJIN0WGtrLWkhZXnZgOeN9BUoyGyF
 mfdsqECDxLy7FthmUyfEv62tSV0Xu9cIE5cZjyGyzng3nxcI9rJBQffCYfjTMM8FMSNS
 F1eq1Plh6gX+FId4Xh6NeAJLZIGZopbAD8A9PcJL0BajcopDHaPAPJwNpR1ZvYUIIR2h
 OF1tuOXmcQxLbDm9Lml8rO0BJ1RrK4Iwgv5JCZ8VKBF1+G/0IJkLOO4K4T5BoeIdYC+K
 FNGITovtEeM86qB6IIAa0sxP+y1o7DS2Zkp3CRcmO8CXXNy6+bqKwgTXpU8w2P9lPgoe
 7OAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7rP6ON/rwFD7r5kwGH+K6LUDEi9rTYztwFSHBdHa/4Q=;
 b=dOrYeRY3l/PegVsHHy+mLGANiyMMFiTE9Ytlk+rE6m6cVvzpN/q69+NnZou1XNha9h
 fV0VVcGqS2NewkYTZ3sFfRVoQEmit3Y5/laA0kN/y2LBOQrBl/SZkPesTWR5J3wI4BXs
 XQJEpjFQNhcyctGGqZNrn8avLzClHnFf+OzOayImYMLp59nKgz7Pci7FMYcSQZeKZxAG
 1ah7mQlVuLjhM4f1A2QHeimMsHrLWk8EARrpIypS4koC6emYDuwJwjJ9RW0ZEGm/OW/A
 hS2ouXpX0FXNbx2hWuvz73RPk9AkRCloePvU83mwOPMtZ7CZloKUWLZpYHYlwmWxVstf
 jWmw==
X-Gm-Message-State: AOAM530e1kJcHIfg8vfjGeFem230hfqmPhHy9IVYONMhK+cf6fEwWPuK
 Epy6r9uuh5s+exBhlf8ycLBq6p1ipcQ=
X-Google-Smtp-Source: ABdhPJyY9N1JAaZUXWaBlOsn8EuxwAwghebwzJLhSQR3NjN+lC75YgaAoR8QiwUtwVzDuxeFZkzk5g==
X-Received: by 2002:a17:90a:d803:: with SMTP id
 a3mr6048786pjv.125.1591719916799; 
 Tue, 09 Jun 2020 09:25:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s188sm7580101pfb.118.2020.06.09.09.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] decodetree: Drop check for less than 2 patterns in a group
Date: Tue,  9 Jun 2020 09:25:03 -0700
Message-Id: <20200609162504.780080-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609162504.780080-1-richard.henderson@linaro.org>
References: <20200609162504.780080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

While it makes little sense for the end product to have a group
containing only a single pattern, avoiding this case within an
incremental patch set is troublesome.

Because this is expected to be a transient condition, do not
bother "optimizing" this case, e.g. by folding away the group.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/decode/succ_pattern_group_nest4.decode | 13 +++++++++++++
 scripts/decodetree.py                        |  2 --
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 tests/decode/succ_pattern_group_nest4.decode

diff --git a/tests/decode/succ_pattern_group_nest4.decode b/tests/decode/succ_pattern_group_nest4.decode
new file mode 100644
index 0000000000..dc54a1d285
--- /dev/null
+++ b/tests/decode/succ_pattern_group_nest4.decode
@@ -0,0 +1,13 @@
+# This work is licensed under the terms of the GNU LGPL, version 2 or later.
+# See the COPYING.LIB file in the top-level directory.
+
+# Verify deeper nesting, and a single element in the groups.
+{
+  [
+    {
+      [
+        sub1  00000000 a:8 b:8 c:8
+      ]
+    }
+  ]
+}
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 7e3b1d1399..530d41ca62 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1024,8 +1024,6 @@ def parse_file(f, parent_pat):
         if name == '}' or name == ']':
             if len(toks) != 0:
                 error(start_lineno, 'extra tokens after close brace')
-            if len(parent_pat.pats) < 2:
-                error(lineno, 'less than two patterns within braces')
 
             # Make sure { } and [ ] nest properly.
             if (name == '}') != isinstance(parent_pat, IncMultiPattern):
-- 
2.25.1


