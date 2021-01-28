Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B430716C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:29:12 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52fv-0002bb-5W
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ag-0005f0-G5
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:46 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ab-0005ck-8W
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:46 -0500
Received: by mail-pf1-x429.google.com with SMTP id q20so3522351pfu.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uPRkIqdPM6Tvu9IfyvOETaxBe+ufv4j8HJV64QNku9g=;
 b=nFVkHam5cSvH4o9/VlbBJYpGR7dgFY+LbE2EIvo+dLqsuD4amoTg6NecYlm6k/a9B7
 i1Onre3F4vBC/6m4yz1xM7N1PwZ85MyXdpJJIShLkcTanrZNZQ0fabVgnRsHoZBN4vuS
 unt4Ne6fQTLyTwCz8mt8xF+G29lzG5zSTQIVWJxxkOmnWK36rTw7hmNtY82fVhC7a7FQ
 1taMkR+1WmIc+Nu/Lnuwdou5JTLv9g7k1WGnd+nHOREK717cslFcdo0K9QcrgGeWDD9M
 9o432IqhoqSMbGshZkg5tUTWz6Yd492FT3D5Pu+Je3UtTu8t/oZPX91Us8/l0MQNMvTY
 5RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uPRkIqdPM6Tvu9IfyvOETaxBe+ufv4j8HJV64QNku9g=;
 b=YlunD+wDNxDzfBe5QvI1fVZDL3zAp9+59oj3bFkR9bPYESXSTM13hYtYqdV5XFt6aW
 kGA2d+V0Q6dYyDtlKBSDOiO7ueA0MCSECiGuB1IzMG8GH/CPMzs67i82wzRuTrL7W+Uc
 HEK3huZSORv/cqabB8/1c4k4LbicHUFcTPmuXv0ZuV4lLkN6TAwC+FfOZbxskG/FvOE+
 gZglk4mbnF6+ZJDolKnKQrVOSC4zYmIRkLHe1VxMSLGyRfVsyBkyrzvb8yop8PVamHN5
 VBirgmJX4cY/lh6il7Qv9f4MSrAuZNPh73MuzzooKM1XfkNSslaXw02wYN55rJy4xDee
 lotA==
X-Gm-Message-State: AOAM533EwJugtUxyAR+68aQ/igGGvUivaeInfAgHrDUhOQDWDfo+YFRp
 rLLedx3XMlgCvdUTN2/NaGzTJ2yATQU6HGq1
X-Google-Smtp-Source: ABdhPJzAU2gfqVBGkGisBw6S3H6huE7xJK31zcZm778DJcsk/c6y/IRbPf+Cl1UiT7YAzqcBIJxjVw==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr15133338pgc.359.1611822219173; 
 Thu, 28 Jan 2021 00:23:39 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/23] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Wed, 27 Jan 2021 22:23:10 -1000
Message-Id: <20210128082331.196801-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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


r~

---
 tcg/tcg.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 9e1b0d73c7..78701cf359 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -407,11 +407,21 @@ static void tcg_region_trees_init(void)
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
@@ -430,6 +440,7 @@ void tcg_tb_insert(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_insert(rt->tree, &tb->tc, tb);
     qemu_mutex_unlock(&rt->lock);
@@ -439,6 +450,7 @@ void tcg_tb_remove(TranslationBlock *tb)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree(tb->tc.ptr);
 
+    g_assert(rt != NULL);
     qemu_mutex_lock(&rt->lock);
     g_tree_remove(rt->tree, &tb->tc);
     qemu_mutex_unlock(&rt->lock);
@@ -453,8 +465,13 @@ TranslationBlock *tcg_tb_lookup(uintptr_t tc_ptr)
 {
     struct tcg_region_tree *rt = tc_ptr_to_region_tree((void *)tc_ptr);
     TranslationBlock *tb;
-    struct tb_tc s = { .ptr = (void *)tc_ptr };
+    struct tb_tc s;
 
+    if (rt == NULL) {
+        return NULL;
+    }
+
+    s.ptr = (void *)tc_ptr;
     qemu_mutex_lock(&rt->lock);
     tb = g_tree_lookup(rt->tree, &s);
     qemu_mutex_unlock(&rt->lock);
-- 
2.25.1


