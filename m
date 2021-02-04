Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25BE30E996
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:49:16 +0100 (CET)
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tlj-0006tE-Qw
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti1-0004YA-AC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:25 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Thz-0003YX-Ie
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:24 -0500
Received: by mail-pf1-x436.google.com with SMTP id w18so1063748pfu.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=IhdIKzElpOv0lQMryl8M6dS4hOA9665UbHINzDX6dQgUWFLXpvS5GD+tAehApDxpQO
 CU5f5DpxEYOrUr+TePx40CTXMKbyN4Kkpk1O0toxJ8g7ivMjCb7GHUHjdkb6tJ4KZ3Te
 leb9UmzXh6XkwrJD3cTrKHYGCBxqTr4oyt5UwZGQw7ZFa3e8GH/gOk5C8B+hhjm0Y17A
 ijVWPoeZQYRYwY7zp/j9gVoLm5lfDLIQMZ3FicrGKW2LUub35SYTvQ96I1ikh0ddKq38
 C8wdnppL2Nat+o2d44N0kLjbREAQ+MqNqUqBX39iEuTcsTDlPfqzDbynnzZyvvjLu6ag
 SHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=EuEJAi2TaO6qxUUU45yVzIsernznU02KRw+o1PIdqvkWkyOtYWykduHwllQ2nVm/IV
 Wq+/k/V2lemab072q9kDD3usj7O2qRgBIqduH1eq6dsnQ9ebDtWimrcA6D04VXwN4FCe
 g//evMsRQDZOn6tUCYgyYWev8k0EpQJZfJufTUaubA2OGIe79OwKKuP7B3ufrj0WU3kn
 cgExEpDS9SU9i+yhx7wE4lBs0WGjoY++H/CQId3d5mLF+KZS4SLrkNmYKjt1hzyerR2H
 2X7nnB4CaGgRjsnbUTZvyGvtBPSBJrM+fli+K3Yge/JvmAJZqx8RnrVx6jg356q63x7U
 ffvA==
X-Gm-Message-State: AOAM5318ijGpNbuJpDm4OdFtHcp8TjKVWI+QgKuYLc2y3wA6Vi7pntuU
 P7Tufk5wwczq53Q1TXuU7mJRGTkbtBRldHnH
X-Google-Smtp-Source: ABdhPJxwvaweb/4fJbJP45XD5TCp0I6Hipsui8x1MPQrj5l5/O9RJ0/xrIoTpLJ8berwbqiiOLzWqg==
X-Received: by 2002:a05:6a00:1385:b029:1be:ac19:3a9d with SMTP id
 t5-20020a056a001385b02901beac193a9dmr5727605pfg.65.1612403122266; 
 Wed, 03 Feb 2021 17:45:22 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/93] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Wed,  3 Feb 2021 15:43:40 -1000
Message-Id: <20210204014509.882821-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


