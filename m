Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336F2336914
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:42:28 +0100 (CET)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9PH-0000N3-8H
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:42:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK966-0005As-Qd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:38 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:38133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95z-0001S2-NS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:38 -0500
Received: by mail-ot1-x32b.google.com with SMTP id a17so18336375oto.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SnKrls1+jQeMnbtcWOCxxqr551UwIJX44aUioNe0+w8=;
 b=GSnVI2UmlYGsBFij1afNzXFNYqlg+/qMoA32FIYsrzm7D7F7pUGIiOIw6DYJ7kM1jX
 bgAMNDhpFEvBazFJ5Ad1YuHp6OHvK1tAxuNzdE6ZymqKVDyFLx62UUu/1dM0lNbjakwK
 cDPqD/oqD3LRAHNt/qWAykhFCTwwgcFrkNXuhS++T72IPxd/o9wjGfzrMqY2l4nWkdDz
 hciqwbJ4t6+PtixV5dlOSsYSuMlkd3oG4BQhB7UBTx3scqhADJuEwYkLN3cT7l+7FmPT
 wYa4Uos65HV91etw8xFVpwyTbIWKfehybnOeR/TjXQcLHmF+mCXNQRLXHsX+rEisuWWY
 FECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SnKrls1+jQeMnbtcWOCxxqr551UwIJX44aUioNe0+w8=;
 b=fgqgSt47p4cc073dmJ8HWGEm18j4+aX7DPSFtAk5qV4KgOdZgce7ParVA6IhZh5/fh
 F59MDJQwgXFApibneqwD5atxPB7PbRT1Dl29o/5HHoUvFZuwbERfuSOZUg6DhmsWjRRI
 HrNWdjDlYizx9J22kMGSs+XUBOB+2zSu5h3/gqj9GIKAoeayds1L+gcFhdE8GBi9r+QM
 uBzv4iTvXjAMCQLsJsPM7zMcUxsxlOjQ1rgp6oA2MA0dh2vzkUm9D7UUTi9zKzKMNN3I
 96IvCRYKZcRlbj1nj4agL2bphQZruhxfadX9K7/ANKwuHGK7m7poOjP/QbsrSa7zWaK3
 rtGA==
X-Gm-Message-State: AOAM531ht6jkdwzNZZqe+eATJG7Z+3sH3f//I7HJiTa1OGVwHQCpbEuT
 07OHL5P8yb8phht+NhIhAmyQ7KwqyvIW7W/f
X-Google-Smtp-Source: ABdhPJyrp4PsbuaiPrjCbmQfXiKcLUfjU1xsicpz+9M6zz3oZweb+FP4swQdlHPslgrhquNa9OJp5g==
X-Received: by 2002:a9d:42c:: with SMTP id 41mr4581196otc.108.1615422150420;
 Wed, 10 Mar 2021 16:22:30 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/26] tcg: When allocating for !splitwx, begin with PROT_NONE
Date: Wed, 10 Mar 2021 18:21:56 -0600
Message-Id: <20210311002156.253711-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's a change in mprotect() behaviour [1] in the latest macOS
on M1 and it's not yet clear if it's going to be fixed by Apple.

In this case, instead of changing permissions of N guard pages,
we change permissions of N rwx regions.  The same number of
syscalls are required either way.

[1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f

Buglink: https://bugs.launchpad.net/qemu/+bug/1914849
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/region.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tcg/region.c b/tcg/region.c
index 5b46172fb5..3ffea215a2 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -749,12 +749,15 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
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
-- 
2.25.1


