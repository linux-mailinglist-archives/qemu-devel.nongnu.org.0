Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F473A4B93
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:02:33 +0200 (CEST)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrr6e-0001HO-Hz
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqms-000352-OI
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:07 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:56102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmp-0002lN-Su
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:42:06 -0400
Received: by mail-pj1-x1029.google.com with SMTP id k7so6524818pjf.5
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yutB5Hql0pmq+RPOoPP4QbECTT+S/kQDBGlJZPPQ9bQ=;
 b=OGvRN9iBjuorOC574RzX+WSlNAbzHwtkztdR8lNqKi7aCcRXhN3zeJj8H6q8QYAoiQ
 Caw7DLXUhbHz+CV+wcwBhE48iIJr9SWDDhFl9EBwrjO/agq4Go8h0F5lwrrqyxQhm+/r
 O+wa80oSq8sIzV7jWsopLS6dR2HEaQm5Vscp/ZW9NAf9LR3UqZfJHmXaE9j5jo5BjlzD
 sIUL8olCDor2TG75hYxr+/Szwg3aChe/aA4Xxb0oTND5FeQ1UUEJiZy2DVpqk/lSkCa2
 ZjabL1hVe5+7GiwyM7SqLPS/VnRC9EH9dbGXzPbz8SugRd/wZWsReYUmgZSbk7AYrtQk
 lbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yutB5Hql0pmq+RPOoPP4QbECTT+S/kQDBGlJZPPQ9bQ=;
 b=fMECbPfGUCQf0BtLDHQbdYvJWW3ISA6/OqDSwcMaDhNWeUnLFqDiZhAygRJ5kX4tIL
 XLR/ddEVD170GVSDkocfym4KbZf7iKeogdEWrcil9UfqaSG1F5QGfD1mq7118P+w84DX
 gS2xaHcH2VlfFMzfgkxx21IwUQVd0YX0ycM4UGvu0lu+FBtRFcxnek2uiV9XiRCq6WkB
 O+HAwWceMBXrKTUSK+eTTY4zztg9EnsrqZ+tNESm7G6FSQ8ocluKGEWW1PBv0b726EIA
 icD1JA8sqCgr1HvK8mlFehchQLjvdgPdB2Jt4YV6YaOqPTpz9vgLvEdw7iulNnZoxZ6L
 rZYQ==
X-Gm-Message-State: AOAM533M/ixeNNjjxL/GnxVtf8CLZNSn6Txu/O3d8dc4Rh6YFTME5lSp
 wmOFMipXojj0+L86FDKUAzhk2R6X9tpYMw==
X-Google-Smtp-Source: ABdhPJwGJNl8olEDuAD2T11YhUFc4XmIQYSL9ENxBLBkQBdq7RYjCPrznFZl4GEOGgiAVuotJFS5nQ==
X-Received: by 2002:a17:90a:8001:: with SMTP id
 b1mr11424065pjn.17.1623454922465; 
 Fri, 11 Jun 2021 16:42:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:42:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/34] tcg: When allocating for !splitwx, begin with PROT_NONE
Date: Fri, 11 Jun 2021 16:41:38 -0700
Message-Id: <20210611234144.653682-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

In this case, instead of changing permissions of N guard pages,
we change permissions of N rwx regions.  The same number of
syscalls are required either way.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 294cbd8e65..0f6808afdb 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -770,12 +770,15 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
         error_free_or_abort(errp);
     }
 
-    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
+    /*
+     * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
+     * rejects a permission change from RWX -> NONE when reserving the
+     * guard pages later.  We can go the other way with the same number
+     * of syscalls, so always begin with PROT_NONE.
+     */
+    prot = PROT_NONE;
     flags = MAP_PRIVATE | MAP_ANONYMOUS;
-#ifdef CONFIG_TCG_INTERPRETER
-    /* The tcg interpreter does not need execute permission. */
-    prot = PROT_READ | PROT_WRITE;
-#elif defined(CONFIG_DARWIN)
+#ifdef CONFIG_DARWIN
     /* Applicable to both iOS and macOS (Apple Silicon). */
     if (!splitwx) {
         flags |= MAP_JIT;
@@ -906,11 +909,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
             }
         }
         if (have_prot != 0) {
-            /*
-             * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
-             * rejects a permission change from RWX -> NONE.  Guard pages are
-             * nice for bug detection but are not essential; ignore any failure.
-             */
+            /* Guard pages are nice for bug detection but are not essential. */
             (void)qemu_mprotect_none(end, page_size);
         }
     }
-- 
2.25.1


