Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D733A831
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 22:29:26 +0100 (CET)
Received: from localhost ([::1]:59196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLYIf-0007eN-Hq
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 17:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGs-0005sI-6O
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:34 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLYGq-00088z-Ix
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 17:27:33 -0400
Received: by mail-qt1-x82d.google.com with SMTP id r14so7863616qtt.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 14:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTuU1v864u8UFjIE8dcOrpu8BoE0XeHo4HzeUlZug3Q=;
 b=j8S6fBW52hFslSi+aKblVA4cUx8PAONrlweOV/xGSgE696Zx0FVk9nY0l2WpX6hEHd
 vZSSxv16nIFOKeGte26jrfpf8yCygO/PwUMj/lsaL25oMfu4f9q838nXFyvDZ9oC9SIK
 XEtUaBZ3GoO6JdK1us91MTHayMEauK2qBYze7XL1EcDVCjMLS7DA01kfq4FbFiD3qcnh
 Lm/Hjf4qJ7OTdtK1q4Q461Kpbu2XSj1Gs0GXdajiFpkn1KHVohXfl4bhGdbUUqs7JeNS
 4fBvwiv6LUcv34o4q8fXrUFCKiVwWzLF3LzFutsRIOX/q+qoIViVT+qkMPm1Md696X42
 fx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTuU1v864u8UFjIE8dcOrpu8BoE0XeHo4HzeUlZug3Q=;
 b=bH5Z7lc180R23UHG7v/+AErCpg0CLzlYfbm1OrX+62h4l2UdaVC826Iz40+ANc9Z0P
 Zamx/yo0IQlj3MIWbQmx9IxfvyPVidhuuIjZWQ/ThfDnMGWZrsZ9lx6mMPbUsbGuGwix
 YZ0NZKJDB58vro4e6R/eXbqWO//UqXa2zwkMxUwZziey4osEEvdSAKdlRVN7uBtINnwU
 bl3ndwMWb5Zt7REqLMJhQKpXzq+5wsrJ/zgXV5jaHkoXgYs9jofp85Mc0lIHGWlKzPdN
 2LBysT+0japZb1MHg5IepqnK6c51gZ4JEZh03mTDctlAv67F8CezwsmxDvshlggBwce8
 MNKg==
X-Gm-Message-State: AOAM533Am7rNmfoj8n/iOFOK2iTIoCdPBcc0nY3fymoV95h72GHs0s3R
 Co3tJpa3wazudBTSacp+g+PD+ii6i0bqPJT+
X-Google-Smtp-Source: ABdhPJwtJ8MPaoFjW+cYyMSUn99NPj9sQzloczeswL7qBsrIpR9F5PuSkPdE1GQ4bMl/EcH8n1tbMQ==
X-Received: by 2002:ac8:53c2:: with SMTP id c2mr19393307qtq.166.1615757251674; 
 Sun, 14 Mar 2021 14:27:31 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t2sm9337749qtd.13.2021.03.14.14.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 14:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/29] tcg: Remove error return from
 tcg_region_initial_alloc__locked
Date: Sun, 14 Mar 2021 15:26:59 -0600
Message-Id: <20210314212724.1917075-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314212724.1917075-1-richard.henderson@linaro.org>
References: <20210314212724.1917075-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers immediately assert on error, so move the assert
into the function itself.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0a2e5710de..2b631fccdf 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -720,9 +720,10 @@ static bool tcg_region_alloc(TCGContext *s)
  * Perform a context's first region allocation.
  * This function does _not_ increment region.agg_size_full.
  */
-static inline bool tcg_region_initial_alloc__locked(TCGContext *s)
+static void tcg_region_initial_alloc__locked(TCGContext *s)
 {
-    return tcg_region_alloc__locked(s);
+    bool err = tcg_region_alloc__locked(s);
+    g_assert(!err);
 }
 
 /* Call from a safe-work context */
@@ -737,9 +738,7 @@ void tcg_region_reset_all(void)
 
     for (i = 0; i < n_ctxs; i++) {
         TCGContext *s = qatomic_read(&tcg_ctxs[i]);
-        bool err = tcg_region_initial_alloc__locked(s);
-
-        g_assert(!err);
+        tcg_region_initial_alloc__locked(s);
     }
     qemu_mutex_unlock(&region.lock);
 
@@ -874,11 +873,7 @@ void tcg_region_init(void)
 
     /* In user-mode we support only one ctx, so do the initial allocation now */
 #ifdef CONFIG_USER_ONLY
-    {
-        bool err = tcg_region_initial_alloc__locked(tcg_ctx);
-
-        g_assert(!err);
-    }
+    tcg_region_initial_alloc__locked(tcg_ctx);
 #endif
 }
 
@@ -940,7 +935,6 @@ void tcg_register_thread(void)
     MachineState *ms = MACHINE(qdev_get_machine());
     TCGContext *s = g_malloc(sizeof(*s));
     unsigned int i, n;
-    bool err;
 
     *s = tcg_init_ctx;
 
@@ -964,8 +958,7 @@ void tcg_register_thread(void)
 
     tcg_ctx = s;
     qemu_mutex_lock(&region.lock);
-    err = tcg_region_initial_alloc__locked(tcg_ctx);
-    g_assert(!err);
+    tcg_region_initial_alloc__locked(s);
     qemu_mutex_unlock(&region.lock);
 }
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


