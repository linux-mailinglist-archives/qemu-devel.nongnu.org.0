Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537193DC400
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:33:19 +0200 (CEST)
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iYg-0006S2-C1
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTO-00056p-7P
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTM-0001I7-Py
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:49 -0400
Received: by mail-ej1-x62e.google.com with SMTP id o5so20910373ejy.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=302wxsTGGjRjbdAcJ8/o1znsZMnOFR8XXZjoCZCtdac=;
 b=HJQrxrbto/SGg587KewyUS8n7vzc1iGhHtJD3ubokGObUUWiCVEcesYAD9rsagXFyw
 vrTVp0mLU9d6ec0xjg+8i0N9rYJpuCLDUCb5lhdhLPK3NBk5gAKtEt/q13/lgS9LPRVP
 5FZMu282Zn132Z7rIXXxA8uvs+6yn9Irg7t7+AkcIN5mN6urozXPKsuQ2AhvUB2sjTce
 A0nA+cWch41BFiwfAw5M86yNJ74sDSInD9LT778e2ILosfbAD2e/ra3S1CZXHSjiD2hN
 9yiJFyo1w23/MFiO3n+0SutYuD+my/KZD7mR2BzliSweoo/2u/T5rS1W83RklCd7wxBb
 B6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=302wxsTGGjRjbdAcJ8/o1znsZMnOFR8XXZjoCZCtdac=;
 b=s1FKZKyhH3InEaPVVdfEZMPrmyYYj4VRsU8jPZMSRuCIYgRCUM8CSdR+v+i+NNq6u8
 +3rRHlh9njL+F7Ai7ObCw9twMbPOAbqokzz5Y8qh09GOpyKVVjjKc4rTPq5WZaPlTMxm
 rqe8KRuACmb3lBAzEbHG7csX8HeQ1abdQ6TeZU8rE9LC65ZLZwg4sTBFRqsvpRR8R9lS
 LLIwGeKzSBDx+r4V3UhbZrp6ISBuHhXRKWp/TsBDaA1i9cW+1WcXL2JongxwrzzAdSTu
 OlXYtm9KJ4PfkUSJo1FjiWW5YtPjWPtIedmcpsc5VavYNeXbHw6Ccn5nJxBXR/YoAUUN
 3rSg==
X-Gm-Message-State: AOAM531pth9xTR0F6XbHNOUX+JUp/vrcxe3NH0s+a1GKtt9qaO/9TuSO
 LUUgjFVzP+u+WvzuHMJSxaS9aB/2U5LMZw==
X-Google-Smtp-Source: ABdhPJzPhJgUHeoBLB46/FHOuzIrTACM/WPv82LD2kQd0arleBpHHBdvh0p0MhiOjrLOkbBB7jMFew==
X-Received: by 2002:a17:906:1355:: with SMTP id
 x21mr6345483ejb.490.1627712867472; 
 Fri, 30 Jul 2021 23:27:47 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.46 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] coverity-model: write models fully for non-array
 allocation functions
Date: Sat, 31 Jul 2021 08:27:41 +0200
Message-Id: <20210731062741.301102-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity seems to have issues figuring out the properties of g_malloc0
and other non *_n functions.  While this was "fixed" by removing the
custom second argument to __coverity_mark_as_afm_allocated__, inline
the code from the array-based allocation functions to avoid future
issues.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 57 +++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 028f13e9e3..9d4fba53d9 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -269,32 +269,77 @@ void *g_try_realloc_n(void *ptr, size_t nmemb, size_t size)
 
 void *g_malloc(size_t size)
 {
-    return g_malloc_n(1, size);
+    void *ptr;
+
+    __coverity_negative_sink__(size);
+    ptr = __coverity_alloc__(size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
+    __coverity_mark_as_uninitialized_buffer__(ptr);
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
+    return ptr;
 }
 
 void *g_malloc0(size_t size)
 {
-    return g_malloc0_n(1, size);
+    void *ptr;
+
+    __coverity_negative_sink__(size);
+    ptr = __coverity_alloc__(size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
+    __coverity_writeall0__(ptr);
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
+    return ptr;
 }
 
 void *g_realloc(void *ptr, size_t size)
 {
-    return g_realloc_n(ptr, 1, size);
+    __coverity_negative_sink__(size);
+    __coverity_escape__(ptr);
+    ptr = __coverity_alloc__(size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
+    /*
+     * Memory beyond the old size isn't actually initialized.  Can't
+     * model that.  See Coverity's realloc() model
+     */
+    __coverity_writeall__(ptr);
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
+    return ptr;
 }
 
 void *g_try_malloc(size_t size)
 {
-    return g_try_malloc_n(1, size);
+    int nomem;
+
+    if (nomem) {
+        return NULL;
+    }
+    return g_malloc(size);
 }
 
 void *g_try_malloc0(size_t size)
 {
-    return g_try_malloc0_n(1, size);
+    int nomem;
+
+    if (nomem) {
+        return NULL;
+    }
+    return g_malloc0(size);
 }
 
 void *g_try_realloc(void *ptr, size_t size)
 {
-    return g_try_realloc_n(ptr, 1, size);
+    int nomem;
+
+    if (nomem) {
+        return NULL;
+    }
+    return g_realloc(ptr, size);
 }
 
 /* Other glib functions */
-- 
2.31.1


