Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5192F3DDD66
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAadZ-0003mW-CT
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabV-0000xO-3D
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabT-0006qY-6s
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:48 -0400
Received: by mail-ed1-x52d.google.com with SMTP id cf5so13693960edb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm2UD8Zyz4671JlxJea8LEur7xOb1KFIH/B40VUSEow=;
 b=oQW17AqWb4W8ZSUEh36z85BVyabfXryFcbonKMC0X0W1HNPWTvxjpSUBu8ysU3Gpvn
 gn1HYd2jzr+2mhCmXpJKzhUNyPf8T7DL24xudeB+//9H7IDWiEDXB9zTa4vP+PJzBtK3
 RzBa3DRl7F8ZGfqXYJebcFjSFujz2qZv/ht7EJD8uxL7ycKZBqChEPxsQ5YqIFiDzvNU
 0b/Ne8PZr5G0V7lX88RJBNsuV1jYfYFWh4Oj42remS6JrfSk3DEpxqYCJkZkWQqVM6Fy
 ee6IPu8m2Ju31bV4tI/mbbmbS0252+Lff1g2MreBeWdwmDKul1c3qEuhV0zpgBazJMt2
 tXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fm2UD8Zyz4671JlxJea8LEur7xOb1KFIH/B40VUSEow=;
 b=jh/+A4L5gvTr/xbbOHDJsfePgXo88YV+YXAufaSE8m1zx/RNZ/Bha+3GEDjXsYijQa
 Qh14DzE2xaypCaAKiOmwAM8MLvJaelgPdKIsz8p3ICOWQG0yYJXxMR6qcN1rRdhmswSU
 offAg8KTUkRZbkzDS7Ss0YXwF5KNzYmPKRoOZqaJCs3MgBFNWqXguH0VdAa6tJk61yyX
 JBZjLPXXSxvgR5AB4880DHbHSdPHixbF2937Rz3zFQAuIOYHQKi7vW+B1t6+lugeiQ74
 5R00wW19LjJ7+dMd24NZtH0LQ2gFCNCDdKga8GjksWyhy47lYOvyxuv/tHZGysLvsaBO
 HPMA==
X-Gm-Message-State: AOAM530wm2DV0zXSGb9M/LUaW+9ialEI+zqDsKwshxsmvYo5Icx3LaJQ
 T+dUf7VmK3KRTsYGaQaVhc46bWiMKeI9Bg==
X-Google-Smtp-Source: ABdhPJyYIbvg+AbBgP5qU7tqFt5xkl8Rj1ff9oNej7mJvDBOXNjmya8XJaisYd3MSS6+VmM0s2TTFg==
X-Received: by 2002:a05:6402:34e:: with SMTP id
 r14mr19964640edw.6.1627920945987; 
 Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] coverity-model: make g_free a synonym of free
Date: Mon,  2 Aug 2021 18:15:38 +0200
Message-Id: <20210802161542.381976-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

Recently, Coverity has started complaining about using g_free() to free
memory areas allocated by GLib functions not included in model.c,
such as g_strfreev.  This unfortunately goes against the GLib
documentation, which suggests that g_malloc() should be matched
with g_free() and plain malloc() with free(); since GLib 2.46 however
g_malloc() is hardcoded to always use the system malloc implementation,
and g_free is just "free" plus a tracepoint.  Therefore, this
should not cause any problem in practice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index e1bdf0ad84..8e64a84c5a 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -186,7 +186,7 @@ void *g_malloc_n(size_t nmemb, size_t size)
     sz = nmemb * size;
     ptr = __coverity_alloc__(sz);
     __coverity_mark_as_uninitialized_buffer__(ptr);
-    __coverity_mark_as_afm_allocated__(ptr, "g_free");
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
 }
 
@@ -200,7 +200,7 @@ void *g_malloc0_n(size_t nmemb, size_t size)
     sz = nmemb * size;
     ptr = __coverity_alloc__(sz);
     __coverity_writeall0__(ptr);
-    __coverity_mark_as_afm_allocated__(ptr, "g_free");
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
 }
 
@@ -218,14 +218,14 @@ void *g_realloc_n(void *ptr, size_t nmemb, size_t size)
      * model that.  See Coverity's realloc() model
      */
     __coverity_writeall__(ptr);
-    __coverity_mark_as_afm_allocated__(ptr, "g_free");
+    __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
 }
 
 void g_free(void *ptr)
 {
     __coverity_free__(ptr);
-    __coverity_mark_as_afm_freed__(ptr, "g_free");
+    __coverity_mark_as_afm_freed__(ptr, AFM_free);
 }
 
 /*
@@ -328,7 +328,7 @@ char *g_strdup(const char *s)
     __coverity_string_null_sink__(s);
     __coverity_string_size_sink__(s);
     dup = __coverity_alloc_nosize__();
-    __coverity_mark_as_afm_allocated__(dup, "g_free");
+    __coverity_mark_as_afm_allocated__(dup, AFM_free);
     for (i = 0; (dup[i] = s[i]); i++) ;
     return dup;
 }
@@ -362,7 +362,7 @@ char *g_strdup_printf(const char *format, ...)
 
     s = __coverity_alloc_nosize__();
     __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, "g_free");
+    __coverity_mark_as_afm_allocated__(s, AFM_free);
     return s;
 }
 
@@ -375,11 +375,10 @@ char *g_strdup_vprintf(const char *format, va_list ap)
     __coverity_string_size_sink__(format);
 
     ch = *format;
-    ch = *(char *)ap;
 
     s = __coverity_alloc_nosize__();
     __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, "g_free");
+    __coverity_mark_as_afm_allocated__(s, AFM_free);
 
     return len;
 }
@@ -395,7 +394,7 @@ char *g_strconcat(const char *s, ...)
 
     s = __coverity_alloc_nosize__();
     __coverity_writeall__(s);
-    __coverity_mark_as_afm_allocated__(s, "g_free");
+    __coverity_mark_as_afm_allocated__(s, AFM_free);
     return s;
 }
 
-- 
2.31.1



