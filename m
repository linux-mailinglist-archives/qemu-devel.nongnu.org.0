Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C213DDD6E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:19:45 +0200 (CEST)
Received: from localhost ([::1]:48014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAafI-00012v-R1
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabW-0000xT-Ax
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:44615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabT-0006rH-Qr
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:50 -0400
Received: by mail-ej1-x629.google.com with SMTP id yk17so24071197ejb.11
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C6DiBC7Mzk28ej4iKDpfbNsQyeV69GCYbRHuydqtOrc=;
 b=PIeLvCrWUbHTyql+xN6V/zeh4lX3zYSMCQNg0CvcwmYDeTnJ1bENImWuUy1MoLb77p
 Tl4Py37otGdIBPEKd3dn8GPgxwMR6GX1rwzuAVOmVdrFNmlY0myYGzZ/SETodOALSRnA
 qCrtJTMsk7qi5ZQavdWBV+Q7fZeZpYlZJ/n1iG9rAxTb7wZ0+12OOlEtfhJXuyly/FUM
 eAY5dTqDrpIykrGRc4KUu43WdiEdAzl0I8ieeYyEP5/l8KPgpFAItYWW3WtD7LrXerrB
 cS62ZVlb4IpIBca5oFGzuMnOrJOOlIxEzPDSeuvc/mxLBjYGmBALQg7awME7G51shrUr
 Wpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C6DiBC7Mzk28ej4iKDpfbNsQyeV69GCYbRHuydqtOrc=;
 b=uXnlIARo8lTImF2l+3b8QQH1t4pffH9B0ng60XqNDwpfHijbhtRo4gaKcUGbmpOF/s
 eY6Qz2n92+v2zCOXnasiyqPF2imHQzFpuXzZk93KnrfTOrK5M7YNwQz7ENEcS26hL/vU
 KMN+ikfYrAdKSBngei2ljjKABVDi0hxPtsV9zkU3kDzxgVRBFhDQ4n2I3S6/9Hux910D
 CGQr5EDU5+DsguBFraSRShlDT4L/CJXBA+x1q+F5Z3w694Zd0skXq5pFnYKPeEbv++DC
 8xBScZh7gO/HsisABQqxK/P7lvTs1MFV4oZAHxwa3M0/4ZrxCGPNKpatzlR2AJV7zMN2
 SAhA==
X-Gm-Message-State: AOAM532/6un4j1vS9RxQuLfztmMUHBPynqihQ7eLp3q2zaxn5EsBRvqu
 NgJHB2tu4Y4NSrXfA4e/w+yvITA6VZ/lTQ==
X-Google-Smtp-Source: ABdhPJyx7roxQWvMpLne/jVYrc8VyBTJuCPieaPNTRa06G8KpWvqvOE0c3/ETEv/3q+XVfGI2mB3Mw==
X-Received: by 2002:a17:907:76cd:: with SMTP id
 kf13mr16851024ejc.310.1627920946595; 
 Mon, 02 Aug 2021 09:15:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/8] coverity-model: remove model for more allocation functions
Date: Mon,  2 Aug 2021 18:15:39 +0200
Message-Id: <20210802161542.381976-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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



