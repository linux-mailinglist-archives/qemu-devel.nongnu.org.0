Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3998A3AE0BF
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:39:20 +0200 (CEST)
Received: from localhost ([::1]:56820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv59z-0001OS-66
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53r-0002J6-Si
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:59 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv53m-0008TB-Dl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:32:59 -0400
Received: by mail-pg1-x529.google.com with SMTP id e33so12528487pgm.3
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7dML7HVO3SIUvu7+ZiyMAW2r1aYzDyVht2iysbBCWL0=;
 b=DTrvdicQDUOCoFBJXoZqja3HB1XdWqMYYHnE34/QkQQ0bX/tshffG8x/kv/KCSn6oP
 hSbmJ8GEknmLoQ8gFF8kzdS5r9vb03dWCZK0wWQL69JhcezLWHoakf8bvcCnOHjhYdA6
 /J6liarVUZrX/N5NucsjkdPvLDa7sbCzEv3uPlHBhbAjGNZyoE+jghY1NOZpWqsT9NfG
 LpaRwA2t+Aw/v2Qcmr/DULtCQSj113JQDp5YcSo/iMfIL73a/Apx6v1dIRCsq31iPimG
 jnx0fbh6TKslacR5m9zrXCX5kk+X+0ppKtDsjJqaV1AHX94jtNmWZ7z9SktnJ4e0rzNj
 4fZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7dML7HVO3SIUvu7+ZiyMAW2r1aYzDyVht2iysbBCWL0=;
 b=CCPTgjwx4OBUIkSCevCe0Pqpm3jqZMGbqaEUxqMRpT8cNppTSSPeyK6z98NhCL3wGA
 DWhp86G3fejGkj1iuE+VzBXfdkUrWTjJATsNFSn8Jiyw2dxepr5tkNzDO7r5Og7D4T5S
 nZzhApEqCGconWvJJmxgzxTsy8rTHEBizqu56MCGABwg02eZUhKYq7+w7JAM5upj2sD0
 2rPViypU9+SmFt4hjWSAmhSjP61viPGXl2vpR7wrDWj5QUwUzrsorFpTl0H06TM3YcGJ
 b0TErE7bY+e+dkQK/2g6PT/t94A3/lY+DQ4JuXALwp7KitAJ1h+C8RDUA/s4EJkmL2g8
 I3jQ==
X-Gm-Message-State: AOAM533tPw0Emwu+1XDkVIR0k0aFV2K3sQNUF/lrZzWmiqLrxX6GeCQg
 FR7ILod/2U/Jkp0lgV4k5f/eYcyn3qQIKQ==
X-Google-Smtp-Source: ABdhPJwjI8YtgqETXdkh+1s+K54pjYv4zfwGo9XWgEh4hkyakXzLzoldXM9m+IsjGQg6ogGZ0NfWPw==
X-Received: by 2002:a62:1657:0:b029:301:af69:5ae3 with SMTP id
 84-20020a6216570000b0290301af695ae3mr6472800pfw.57.1624224772793; 
 Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w21sm13608329pfq.143.2021.06.20.14.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:32:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] target/cris: Fix use_goto_tb
Date: Sun, 20 Jun 2021 14:32:43 -0700
Message-Id: <20210620213249.1494274-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210620213249.1494274-1-richard.henderson@linaro.org>
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not skip the page check for user-only -- mmap/mprotect can
still change page mappings.  Only check dc->base.pc_first, not
dc->ppc -- the start page is the only one that's relevant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 24dbae6d58..9e1f2f9239 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -524,14 +524,9 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
     gen_set_label(l1);
 }
 
-static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
+static bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-#ifndef CONFIG_USER_ONLY
-    return (dc->base.pc_first & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-           (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
-#else
-    return true;
-#endif
+    return ((dest ^ dc->base.pc_first) & TARGET_PAGE_MASK) == 0;
 }
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
-- 
2.25.1


