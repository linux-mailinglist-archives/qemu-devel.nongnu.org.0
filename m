Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65FD3DC3F4
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:29:19 +0200 (CEST)
Received: from localhost ([::1]:55922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iUo-0007pT-Lt
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTM-00051m-Fm
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:48 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTK-0001Fv-GP
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:48 -0400
Received: by mail-ed1-x535.google.com with SMTP id x14so16394678edr.12
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C6DiBC7Mzk28ej4iKDpfbNsQyeV69GCYbRHuydqtOrc=;
 b=DxzvepY+Y9yZSpeTgNMc3CBL8eJ1rmVhPCc2xeeCbB1q4kFSf8Bo28SrnwMiVVdKD9
 ilkAX2IVPbBhWUwKoPVAtbScOubnvGhav0YXRPdXSIyTTnOIA901ylMq4u4FQ0wzpx3I
 tiHdU6r4udtct35FQBkiq2l6cIOvRjdvEyA1U+khZR/Q5lKZpvEJ5KrefjqP5SJJ+lVz
 53BcjpHga9AqqAqy8Jj+80CYloCZNX/fU3YF1r+stBx21K2uaw6p+ENdoF4/CasUX/cu
 OnV1RIgVFPPtnmmmsF6InpDnfLD0NWqR8+bu/JrUwNW9S5Ln6ES0eFaTAuHjDNHzszh0
 0EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C6DiBC7Mzk28ej4iKDpfbNsQyeV69GCYbRHuydqtOrc=;
 b=ZNsLGOKHI+xOWIS4eOg2mG5nj2pOd2RaOYlamP/LYG7YKeCqkwuU6KfVziF1AqI/Sk
 TdHWSD6l8JhaJpm8RIhjRmsgYM4KJ0qXgOAcbKDKv5wMZY8wEDmSYlU6/XqLsjjP03xx
 CEEefK6al49g4IgdANSXuQOYVpwXkZLNX78baof+4DAYDoc8SQco8hcOx9xKDZLm0uCG
 AkHkFjltARabtCiSReTGB10/inivZFLtHwa/DSqiRzf3d66T3p1Py2/S3brRmqv7o6k7
 1rJuJNf5s0FnpUcOp1Ngl8Dthof3VRrqv8gr27sb3pylicZ/n9ImD9WCbed5owLR/pJk
 /dXQ==
X-Gm-Message-State: AOAM533WiRHIe8fxsYFpK3hwQlIXk+guK+ak9bswv4kTBG34YTQltxpq
 HK+F/IwJZ6Z34olFIwlfLJs8ki7aLcyfIA==
X-Google-Smtp-Source: ABdhPJzySwEpj71I238h5XU0ButTYnQQM053plZpl1XRxjh0H2xuf1ecQxdVR4nktXifkewAnDEUyw==
X-Received: by 2002:a05:6402:7d3:: with SMTP id
 u19mr7839803edy.188.1627712865166; 
 Fri, 30 Jul 2021 23:27:45 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.44 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] coverity-model: remove model for more allocation functions
Date: Sat, 31 Jul 2021 08:27:38 +0200
Message-Id: <20210731062741.301102-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

These models are not needed anymore now that Coverity does not check
anymore that the result is used with "g_free".  Coverity understands
GCC attributes and uses them to detect leaks.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 105 +---------------------------------
 1 file changed, 1 insertion(+), 104 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 8e64a84c5a..1a5f39d2ae 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -263,7 +263,7 @@ void *g_try_realloc_n(void *ptr, size_t nmemb, size_t size)
     return g_realloc_n(ptr, nmemb, size);
 }
 
-/* Trivially derive the g_FOO() from the g_FOO_n() */
+/* Derive the g_FOO() from the g_FOO_n() */
 
 void *g_malloc(size_t size)
 {
@@ -295,109 +295,6 @@ void *g_try_realloc(void *ptr, size_t size)
     return g_try_realloc_n(ptr, 1, size);
 }
 
-/* Other memory allocation functions */
-
-void *g_memdup(const void *ptr, unsigned size)
-{
-    unsigned char *dup;
-    unsigned i;
-
-    if (!ptr) {
-        return NULL;
-    }
-
-    dup = g_malloc(size);
-    for (i = 0; i < size; i++)
-        dup[i] = ((unsigned char *)ptr)[i];
-    return dup;
-}
-
-/*
- * GLib string allocation functions
- */
-
-char *g_strdup(const char *s)
-{
-    char *dup;
-    size_t i;
-
-    if (!s) {
-        return NULL;
-    }
-
-    __coverity_string_null_sink__(s);
-    __coverity_string_size_sink__(s);
-    dup = __coverity_alloc_nosize__();
-    __coverity_mark_as_afm_allocated__(dup, AFM_free);
-    for (i = 0; (dup[i] = s[i]); i++) ;
-    return dup;
-}
-
-char *g_strndup(const char *s, size_t n)
-{
-    char *dup;
-    size_t i;
-
-    __coverity_negative_sink__(n);
-
-    if (!s) {
-        return NULL;
-    }
-
-    dup = g_malloc(n + 1);
-    for (i = 0; i < n && (dup[i] = s[i]); i++) ;
-    dup[i] = 0;
-    return dup;
-}
-
-char *g_strdup_printf(const char *format, ...)
-{
-    char ch, *s;
-    size_t len;
-
-    __coverity_string_null_sink__(format);
-    __coverity_string_size_sink__(format);
-
-    ch = *format;
-
-    s = __coverity_alloc_nosize__();
-    __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, AFM_free);
-    return s;
-}
-
-char *g_strdup_vprintf(const char *format, va_list ap)
-{
-    char ch, *s;
-    size_t len;
-
-    __coverity_string_null_sink__(format);
-    __coverity_string_size_sink__(format);
-
-    ch = *format;
-
-    s = __coverity_alloc_nosize__();
-    __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, AFM_free);
-
-    return len;
-}
-
-char *g_strconcat(const char *s, ...)
-{
-    char *s;
-
-    /*
-     * Can't model: last argument must be null, the others
-     * null-terminated strings
-     */
-
-    s = __coverity_alloc_nosize__();
-    __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, AFM_free);
-    return s;
-}
-
 /* Other glib functions */
 
 typedef struct pollfd GPollFD;
-- 
2.31.1



