Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38A3DDD7A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:21:31 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAah0-0005Dl-7X
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabe-0000zv-Lp
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:59 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabY-0006ui-SD
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:57 -0400
Received: by mail-ej1-x62d.google.com with SMTP id cb3so9788732ejb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=302wxsTGGjRjbdAcJ8/o1znsZMnOFR8XXZjoCZCtdac=;
 b=H3bb9ZThwTEIBzz8w174X3zJgAspQXutiwblHUOleYp7DG7FxZ0CS4REn/gbVM22mk
 6G17SJ9l09BbmH91sJXHn3teCYNwssqDaJXxHNL1lsbJkrjCi/KgDcj/u0Gz8KEF3TOc
 cNyvD6i10VDh84EbJCHDIXi6286tT0t0YvUmJ2fG2nZ10a4HIs5dTLdTep+iz2Tt2o8n
 L0u3Acp1lGGqn0mIZH9nxmtla4I7Qz2DRX22mnhpLRZ1vOPhrkKpDaBggMoXoaEiyL4t
 +hk371pSWVwEpXpWx9ImuTbnt5B61fPxMkgJ/5jtBejvEoGSMTikTEmFbFdj0y77luYQ
 WKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=302wxsTGGjRjbdAcJ8/o1znsZMnOFR8XXZjoCZCtdac=;
 b=j/Ro82lzGbWZQSO80agEXZpEJ1DtIg2ENedGqsxjsRi+SsrncXQ7O83xCuQtItOp5Q
 pXTD9o3Md73lLLjy7/aSLpS/kFgcoq81cYRJCqBcx3oeJZyujlLS3Ix+nRgd33G4OGDy
 ixI+Hs+pTKehEs33KIUjgWWL7ZgB7I4s3FcaVI85RXxIzVapbvkWD7flSA3m5PIonVvm
 NC0AWa6nk+AC/aM8fmXoEqDklsjHxODUzw3BwjXIy5KYJEdKh8k0QwaoarTXIkuSSOyp
 hlqeHqgTD+GywFOFonfwv4fOqum5LpJEFSnwd8huIxRh2syZ8XKvLB+j10cyj6lDdVv1
 HLkA==
X-Gm-Message-State: AOAM531D0URkSJLS9oeDIj3EJl0Jg0PxPb1+uA/Q6EAQGg25oDggeP6k
 DZNJz7V9fP4SWDQHHjR5NUVOsEyQ5/1i3A==
X-Google-Smtp-Source: ABdhPJzV59/YOnRZhzNU9cZKHh/QJzeDeuVPqyZ2AyXOrbBYfyBMYy33CzMph0uT+x8xb6MLRPD73Q==
X-Received: by 2002:a17:906:79a:: with SMTP id
 l26mr3776498ejc.192.1627920948467; 
 Mon, 02 Aug 2021 09:15:48 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/8] coverity-model: write models fully for non-array
 allocation functions
Date: Mon,  2 Aug 2021 18:15:42 +0200
Message-Id: <20210802161542.381976-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


