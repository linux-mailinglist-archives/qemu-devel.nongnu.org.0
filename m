Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54160252259
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:02:28 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAg5L-0000ME-Bh
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg2x-0006su-SQ
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:59:59 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg2w-0001cL-A5
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:59:59 -0400
Received: by mail-pf1-x444.google.com with SMTP id u20so8300628pfn.0
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 13:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rxIBmswNh0tIGuyehJwJsuO5I+nId1kc+WGKDH86wIY=;
 b=LOtU6s9lu5shExjw41c6rKHbfdwBkDJ/k+j+0RQIcHhLeYVUoXPF5sIdGkhQoIc/CS
 699txRbQ5YelkbCWPLH9owdGI/EyjIV+tTyqJ4n5b2VsG4W89LkB2EVd3cJnK1IoqVLP
 LRhBldZAdnh+QRk6oPkDpJAAYiAjrlkNGr+txgNijgHurdtdiHW7vOzXvhvyMP6UeRjW
 vgHAHxxtdBCvX3bLMuwVLU8s+r8VcNjohcx2opMf1ettKy+ltx1jXVe4LBO7Ty5JT9xI
 wr0YcU/t261FWKZumjvinaHTHUJQog4swpZ8JQ0CIPoIh/zRwPNdVvoApkz9kvoIhrpS
 utqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rxIBmswNh0tIGuyehJwJsuO5I+nId1kc+WGKDH86wIY=;
 b=XVD+46/OUdyXexX/Mn53c/JxhQs4PtgM9qKIV/3uMmB8FTggUJyQtWukBbflXooioc
 bNNXRwjxRsa0UzzrRUxJtoE+xOmZQXg8rWEWPg0SqK1BZ+jGE7zVZOMAy0zSSagbt/Wt
 wcJXGb1bDddfnksLbYqEIkBwotdV+18ZIjkSi9BjV9nG1LdC9rFa8Od9ERShZHap6gp4
 SJyANWcrxXoHSYsER89Jijp0ZUO2uuFi4Oc9Ziogcn9R6Fn1BZbFvJMETlwaj5aZFZVn
 egFEBYHznE0qi5hWDB1baSOWtFeMBvvvecHgtGMDmdqoFQDmXve51eoEOMVd5PdyryWQ
 jA6A==
X-Gm-Message-State: AOAM533AZBUB3x2hpz/TOyzztck/sp/Y1CWIvhFaXhINcG0q09VjHqnU
 OmS124e4CEQFnIQSJGwT4COIOfhLIcyyYg==
X-Google-Smtp-Source: ABdhPJwpTvAafnclmRaeqBNR2IFwVR6V9a4ijA5W4FX4iKVV8ZMT+rGQ/MTdmYrVSrAzzcI7jq9Xbw==
X-Received: by 2002:a62:1d05:: with SMTP id d5mr5501965pfd.63.1598389196565;
 Tue, 25 Aug 2020 13:59:56 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.13.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:59:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/77] tests/tcg: Do not require FE_* exception bits
Date: Tue, 25 Aug 2020 13:58:36 -0700
Message-Id: <20200825205950.730499-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define anything that is missing as 0, so that flags & FE_FOO
is false for any missing FOO.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/multiarch/float_helpers.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/tcg/multiarch/float_helpers.h b/tests/tcg/multiarch/float_helpers.h
index 6337bc66c1..309f3f4bf1 100644
--- a/tests/tcg/multiarch/float_helpers.h
+++ b/tests/tcg/multiarch/float_helpers.h
@@ -8,6 +8,23 @@
 
 #include <inttypes.h>
 
+/* Some hosts do not have support for all of these; not required by ISO C. */
+#ifndef FE_OVERFLOW
+#define FE_OVERFLOW 0
+#endif
+#ifndef FE_UNDERFLOW
+#define FE_UNDERFLOW 0
+#endif
+#ifndef FE_DIVBYZERO
+#define FE_DIVBYZERO 0
+#endif
+#ifndef FE_INEXACT
+#define FE_INEXACT 0
+#endif
+#ifndef FE_INVALID
+#define FE_INVALID 0
+#endif
+
 /* Number of constants in each table */
 int get_num_f16(void);
 int get_num_f32(void);
-- 
2.25.1


