Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD0312903
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 03:43:15 +0100 (CET)
Received: from localhost ([::1]:37902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8wWA-0006Wa-Uf
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 21:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR8-00011h-2R
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:02 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wR6-0005gk-7W
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:38:01 -0500
Received: by mail-pl1-x636.google.com with SMTP id s15so7010382plr.9
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=pFn+PW2KH3Ms6I3BPS81TCc4ymj5ilOeRWtMvXPXkRYKKSbMn+uJk/SiSydUWLzXZQ
 50XhEpAKCBl1S6/+4bue/UKvR0tsHHJYqMZsE0z9SkCVlbgnH3/JZUhoD8DaZYJTZLXK
 vAUWpnay+EqNciexnlIa/DlY1bFTt0s4Ik4HlAcDWhUL7WN+lab4VC5jKVjwzBJT1HkD
 jq8BAOEIQfkg8xd5yUPWtYXXZBaU0hU+3kauljMGqQ6M3mxbeeURBZxBzxYCo4BNKeou
 TVCeENp4e5GdP8rHECP8a7fGC0Ghh615CxLrCns0hPDOta9lkIoZHgl0hpoRxVx8ZIvU
 uKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=OSoaZ7qumIbIhgIj9qcT5vS0KWM5tl/rLqAVImL8t2+OZwYvdIxU1yaFPNmgeGxzff
 vBHkirD4KxRmHvA2lNl9QICWapwXuz+YK0Ne/cE6f6NSo9a4CJR9ZcxwcBVtUEEmv489
 s50W5QpXoT0jO2fIDS8TOKrYM6lkMxMR+Y82BMYaDiWg108qKHkrxEbzUrS2KG6fEUin
 6Yg0dCMepkw8VlQxpbubYuXP4PV4Fm2qHTJxm01HyD9olLmlOt3q83jyLge/VM1ExzrF
 Kgoa8DFfUbsYajxLFRdsIkF1zzFz9k2Ef0x0H5cpLWG5zoR0nV3nWiwkGECAK5F5rQ9j
 8Nmg==
X-Gm-Message-State: AOAM531u7RXkhYrZ77jDGt7h58T6K+KTW6eEjgG4GmP2tA/Ew6+MRRTV
 wkuXrySBQNvSpEx3S6sCZtpDkV9jZV8XSw==
X-Google-Smtp-Source: ABdhPJx4DejinH/VguX7tkwqcEjsv1PvmVAUBOF+U3w4iZOaAQWAAtyMIX514z/KY7Xbocm7u1bHTg==
X-Received: by 2002:a17:90a:4141:: with SMTP id
 m1mr13007844pjg.34.1612751878971; 
 Sun, 07 Feb 2021 18:37:58 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id j17sm16158689pfh.183.2021.02.07.18.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:37:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/70] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Sun,  7 Feb 2021 18:36:45 -0800
Message-Id: <20210208023752.270606-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The use in tcg_tb_lookup is given a random pc that comes from the pc
of a signal handler.  Do not assert that the pointer is already within
the code gen buffer at all, much less the writable mirror of it.

Fixes: db0c51a3803
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

For TCI, this indicates a bug in handle_cpu_signal, in that we
are taking PC from the host signal frame.  Which is, nearly,
unrelated to TCI at all.

The TCI "pc" is tci_tb_ptr (fixed in the next patch to at least
be thread-local).  We update this only on calls, since we don't
expect SEGV during the interpretation loop.  Which works ok for
softmmu, in which we pass down pc by hand to the helpers, but
is not ok for user-only, where we simply perform the raw memory
operation.

I don't know how to fix this, exactly.  Probably by storing to
tci_tb_ptr before each qemu_ld/qemu_st operation, with barriers.
Then Doing the Right Thing in handle_cpu_signal.  And perhaps
by clearing tci_tb_ptr whenever we're not expecting a SEGV on
behalf of the guest (and thus anything left is a qemu host bug).

---
v2: Retain full struct initialization
---
 tcg/tcg.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bbe3dcee03..2991112829 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -513,11 +513,21 @@ static void tcg_region_trees_init(void)
     }
 }
 
-static struct tcg_region_tree *tc_ptr_to_region_tree(const void *cp)
+static struct tcg_region_tree *tc_ptr_to_region_tree(const void *p)
 {
-    void *p = tcg_splitwx_to_rw(cp);
     size_t region_idx;
 
+    /*
+     * Like tcg_splitwx_to_rw, with no assert.  The pc may come from
+     * a signal handler over which the caller has no control.
+     */
+    if (!in_code_gen_buffer(p)) {
+        p -= tcg_splitwx_diff;
+        if (!in_code_gen_buffer(p)) {
+            return NULL;
+        }
+    }
+
     if (p < region.start_aligned) {
         region_idx = 0;
     } else {
@@ -536,6 +546,7 @@ void tcg_tb_insert(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_insert(rt->tree, &tb->tc, tb);
     qemu_mutex_unlock(&rt->lock);
@@ -545,6 +556,7 @@ void tcg_tb_remove(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_remove(rt->tree, &tb->tc);
     qemu_mutex_unlock(&rt->lock);
@@ -561,6 +573,10 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
     TranslationBlock *tb;
     struct tb_tc s = { .ptr = (void *)tc_ptr };
 
+    if (rt == NULL) {
+        return NULL;
+    }
+
     qemu_mutex_lock(&rt->lock);
     tb = g_tree_lookup(rt->tree, &s);
     qemu_mutex_unlock(&rt->lock);
-- 
2.25.1


