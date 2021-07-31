Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C13DC3F3
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:29:19 +0200 (CEST)
Received: from localhost ([::1]:55802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iUo-0007kk-7h
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTM-00051X-9R
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:40790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTK-0001FI-B8
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:48 -0400
Received: by mail-ed1-x52f.google.com with SMTP id d6so8787075edt.7
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fm2UD8Zyz4671JlxJea8LEur7xOb1KFIH/B40VUSEow=;
 b=aWCm7adFNNHfSQ9oTePm+q0AyY2onCDj/EmcvF14CjA759G+2XOgmL7TD9jl/7fOGf
 KangiSHW1H267l5y+WaFspFZh72VPXT9pcUtp4HYMX4hU9cO50yCfr5xWVKRM9V+DyLz
 uByU1qlnl88v8hI58e9PvA52DCCw364kdGj+Qlp0g4z77pbrbY7DUZU0omIMkGEd2hkR
 ZHaE6wOmeJFR8x/U6lxCBJJPt2zR+2Zhw+qMpVoPKBDC7CUJWRA53NIqbsNcUDR7GzW7
 Ty8AwyyS847axDRcXb4pHFlZErEUDQBW23ISbKQ0ySJYUOtdom3iQtU3ItBOBAzvdDyJ
 3JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fm2UD8Zyz4671JlxJea8LEur7xOb1KFIH/B40VUSEow=;
 b=X4q/6GK0//tvTIKy71e5ir6e1gVBZcMC4GIPntifWMcu6SfGSewBIycBbV6/THb7Rf
 obNhYaUBR/C24Oa+bTTNUk0IyXY4DVYSGGUdfC0BAOLow51PCjDuXvFQNlGZB9+7aXMp
 I3xQrmbQ/7iEwIp3VXkuvVy8tRPUJSmU+gcAlSWdnt0sQ3wSBiRJnqOMoJK3iRfdY7tm
 MqhS3+EtYxAgJyIsOWJSpwi6Sw+lffQSFTAp65Y5CvmGXtaPUh/1HkUjJOepp0JtIdxH
 Z4SMBEl5FoybFgGCsFZ4PilfOayuQiKbMbq1CSgnJtMNjtI1wBbN+YpYVQgeEiP/Z5Nz
 pv4A==
X-Gm-Message-State: AOAM5327krZy+GydKKLNDpWo4Kjsh/7Ip1qQRC0MOUab3/AXIdyXLHw1
 eaaMxgdoPLzoX73xeOyiahqu63lMhxoE7A==
X-Google-Smtp-Source: ABdhPJwbiBCQrR/FdUpzaCft2xqqxZe7mvvbhRSPVbL9Qizu+ntdKLE8Dohh9xOCufVhSIY6Z0VxJg==
X-Received: by 2002:a05:6402:2788:: with SMTP id
 b8mr7634655ede.244.1627712864412; 
 Fri, 30 Jul 2021 23:27:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.43 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] coverity-model: make g_free a synonym of free
Date: Sat, 31 Jul 2021 08:27:37 +0200
Message-Id: <20210731062741.301102-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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



