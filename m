Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38DF32A8BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:04:52 +0100 (CET)
Received: from localhost ([::1]:49384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9O7-0004NF-Si
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HK-0002Ot-2N
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:50 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:33377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9HG-0007XO-SU
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:57:49 -0500
Received: by mail-pg1-x530.google.com with SMTP id g4so14377155pgj.0
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+XOqZ5nVIKFE5Wvq06250YDVlIY9I1NmppdkJVW9Dc=;
 b=GLkbG6SROu0qIaSkatPGPbNpasT1A4UKBNbchTxiBuHGZvJoA864rqLKgOAevonXiS
 d4GcXtnMhvLHnDMWBClaxi42ZC13QaxteqcDAoNMn0+5HNxjSquHtzpyR2QLkOobm36V
 2msgf99AVPMU94fUzFtdJQEVQ9lGza9eViHbR4bvD3GzRI4v8xiLC8Jz4wpXRklLR/ad
 rXcMeE5yTgDXLIHnRC7LUgx0evgh24upgf6TE9yh2bLduakalMquL4doc0V/wZXpeUR+
 gZWt0icMV8KJZyld5LFvbJbz6L1AP73yQD82J3AYU+//93WO9JOrupZzK4tB6XWm2LTA
 1Lbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+XOqZ5nVIKFE5Wvq06250YDVlIY9I1NmppdkJVW9Dc=;
 b=OxP+DO4iGVgRBCVHUjTfuNPE71UEQCtghCjsj1VbupyDJuDSMer2n1aGMJZd/XUrl4
 0eOyVIaGqK1qS4CMQon4jYAB+AzU+IyFDxWb3gyymFfoqX3HE8Rntq7GufopcoBhif9J
 Q1vkATT/PfENTwKcqJL4XjNc3+YYtpbmj+d0b0/lxwKdN4Yhc1E+yn2i9RO30qo1dCFd
 TRTjDdMLdJLP4bJDA8BTRas+QFhlxMTZOrt3h+lgSL/+ToIffGXdC4QLPDK6oW1XnKgg
 p0v4HWtdoLqKfG0SmQ+nyKHt7myeOTh1bUY9oTet2yJOxzV4kNYJ5evZAITXHviQq5ll
 zZ1Q==
X-Gm-Message-State: AOAM531rY4ycqyoYw3Rbyy6SsabdkX3yznARP7eZWLsqycY3nt4SEGd0
 rlEOiKBErRl5rpGifIJc+pRBL0J3QItjXw==
X-Google-Smtp-Source: ABdhPJz5fL1+YloOYjaM4mwQ2LVFecXDF2miNAwTOuWk9h7AApu1cSuXqxjEF8PkAPUQOGtL+nZYoQ==
X-Received: by 2002:a63:d5c:: with SMTP id 28mr19196839pgn.62.1614707864990;
 Tue, 02 Mar 2021 09:57:44 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/27] tcg/aarch64: Fix I3617_CMLE0
Date: Tue,  2 Mar 2021 09:57:16 -0800
Message-Id: <20210302175741.1079851-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in the encodeing of the cmle (zero) instruction.

Fixes: 14e4c1e2355 ("tcg/aarch64: Add vector operations")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index ec0a86d9d8..c8e41dd638 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -561,7 +561,7 @@ typedef enum {
     I3617_CMEQ0     = 0x0e209800,
     I3617_CMLT0     = 0x0e20a800,
     I3617_CMGE0     = 0x2e208800,
-    I3617_CMLE0     = 0x2e20a800,
+    I3617_CMLE0     = 0x2e209800,
     I3617_NOT       = 0x2e205800,
     I3617_ABS       = 0x0e20b800,
     I3617_NEG       = 0x2e20b800,
-- 
2.25.1


