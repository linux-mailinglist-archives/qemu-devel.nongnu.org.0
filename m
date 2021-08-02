Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A253DDD6F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:19:46 +0200 (CEST)
Received: from localhost ([::1]:48064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAafJ-000154-6m
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabY-0000xX-UF
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:54 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabV-0006rz-A8
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id ec13so24709255edb.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KB5cV0NikdfkiBGJyhuIIvWdyJWHTJa73ThUZLg8tio=;
 b=Ny6q9u9kjUQgbqve31/0eZbgD4LpX9oK0cMV9Fpxsca4pMt0uN2RB4PKZT4IYZwi9E
 A/j8xCMPNsg9BDhq8WioRGtRN1yvy/ndNrh1mB4GnheXkZItTc6DPvQPPKKF1q7Upb9J
 uacpjJWwsGv+hwoiRNvKfWw5rXPyqEMuUVX0oC2VHa1Vcg/AHVQvDffR6mMt1qsiyPsy
 762jFEp+wBwEn6CT6xVKhr44RNcmdo7+LKhLXyRTqo+ptwNNkoZgKD6lOn9gTHZ8pTUm
 J1hnH9aTTztOMwMsUfn95b3E6cDf7gHXB+5xlzmOiOcoN2/w88izyzHxvoa2CatVsAl0
 83nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KB5cV0NikdfkiBGJyhuIIvWdyJWHTJa73ThUZLg8tio=;
 b=ciXed1lVaRTs1X2LdogpZyKI/L7m0asiKsT8PBPwsrNCZ3oa3EexAVTQqF1qwTUYOz
 O0pUhZbfpI0or0jmoS0g9nFiapHS+eba5WQ/2OM1uG0ZjGvyJNZewNySn3Iu56BSQPjP
 IDPvmhTdwB4nOeSC9mPzfyRoCTSWqo1OuLVRvvNOWNdCeoJcTMggodvHwKoeLbwpk+nC
 eenVvurZ07XSi/r8zOsgVEet22CwPrJhVLAh//spZWr6ypmeY4oA0bdum69hSJ6oOJXw
 bm5Tjv86Rh4altj8WdGRNm/NpJ6C/qdaIi0UUaZ3wUCX4zCTIL5koiKrfaOhjkIUP0cL
 qlvw==
X-Gm-Message-State: AOAM531lLFtCBUDIvwJA98IMzd5td7BKHrC+wCx7D8ra0C5pFqPDH4JS
 fs2NIFB30cCzJGbmoQj5dJYRI9QI3gPzHA==
X-Google-Smtp-Source: ABdhPJwcGIlq2NIlm3py7vfyK5xd1htfQ/ntXilOFq834MXXQA69W7SpF3Hqyg5aZZisVlhikdVB8g==
X-Received: by 2002:aa7:c799:: with SMTP id n25mr19522502eds.16.1627920947816; 
 Mon, 02 Aug 2021 09:15:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/8] coverity-model: constrain g_malloc/g_malloc0/g_realloc as
 never returning NULL
Date: Mon,  2 Aug 2021 18:15:41 +0200
Message-Id: <20210802161542.381976-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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

g_malloc/g_malloc0/g_realloc only return NULL if the size is 0; we do not need
to cover that in the model, and so far have expected __coverity_alloc__
to model a non-NULL return value.  But that apparently does not work
anymore, so add some extra conditionals that invoke __coverity_panic__
for NULL pointers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 2d384bdd79..028f13e9e3 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -183,6 +183,9 @@ void *g_malloc_n(size_t nmemb, size_t size)
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     __coverity_mark_as_uninitialized_buffer__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -195,6 +198,9 @@ void *g_malloc0_n(size_t nmemb, size_t size)
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     __coverity_writeall0__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -206,6 +212,9 @@ void *g_realloc_n(void *ptr, size_t nmemb, size_t size)
     __coverity_negative_sink__(size);
     __coverity_escape__(ptr);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     /*
      * Memory beyond the old size isn't actually initialized.  Can't
      * model that.  See Coverity's realloc() model
-- 
2.31.1



