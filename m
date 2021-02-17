Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1C31E03B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:26:41 +0100 (CET)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTPE-00032Q-Kj
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJv-0006aj-P2
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:11 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTJt-0006qD-W4
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:21:11 -0500
Received: by mail-pf1-x429.google.com with SMTP id k13so9139595pfh.13
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=nCwovk5bxx/ea39Or3udTMgPAlfd296excywL8IkOEsJt9tTErRBp0Wzk10CyP1JN1
 /TbYK0jtJiR1XNsZ9te6Gg8qRE5/YsZll7tzHc5wWT6Mmay+uuzVoDSTGSg7zcUTCxEg
 XfkqbcXkYpSySX7I5RrLg1zwSvJs7D5c5d5CAtkgSFj2oWAq+mFYqFsg2qW0fACM+tSU
 EDietScp6tzZrsrmvevUAKThOK+nQmvCRxdCfkqUUrhOYqrlxsp2NoeECFFCMqIKjQ64
 ORVCTNJyODTM4V0VumO26yOPBFRrIM/wRQQo4bnSLLAICoy8teDb/w9pbxiWyd9Q+bXP
 kU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xzKpOz1dnkvT+2F/uu8BRDtdRIBrUsrfNHwaFpPfXw4=;
 b=t+9Bi4WDK/tF18FtrmMuoklmVgIFj2lDtyyawf08uuEmxIgHnj749BcGUkx3yuIlgD
 TRZd5RPC0PvZzgsKE5xMogpRZUEdQe3YUX9hPdvFT6TGWiue8G2Fuf+s40KzsSdcNP1Z
 pu4GuqKilnSLAOCs05t3TKJOCCP2kRPhLbMZ1fWxcKFyOwgutGnsz0JivilTawN4QWr3
 OWiGZQ1O4RICMSXCnvj3Di4wTATM01KpCaGsXJsrz4C59MyohsbGcMd0pnu6eyKk30Ks
 /RwddcBK+PBiMonXgv/qgvj31akt3peKPih0+RsXhW4dpa7FV+RCA853lZc5WuI82mcv
 th6A==
X-Gm-Message-State: AOAM532fG7nwlw5uFjwvt/Z70hsSkYwiQ9lARO2jdCDx0oMyJZCs7uPR
 r96rgD1P8Sy5mkBW2qwV4yydAs40ZxDA0g==
X-Google-Smtp-Source: ABdhPJwDR5ABhzfcrbbPcjiPIO1eQ92bPIpvhwLIX4Gzt2qlGeDHnNzTWwPM6PecyULlAKiQ+ihwqw==
X-Received: by 2002:a63:fc07:: with SMTP id j7mr937993pgi.401.1613593268687;
 Wed, 17 Feb 2021 12:21:08 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:21:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/71] tcg: Manage splitwx in tc_ptr_to_region_tree by hand
Date: Wed, 17 Feb 2021 12:19:28 -0800
Message-Id: <20210217202036.1724901-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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


