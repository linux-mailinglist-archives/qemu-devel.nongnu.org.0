Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378B8400462
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:55:07 +0200 (CEST)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDP8-0006QK-91
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFv-00078w-2x
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDFr-0000g1-MF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6axIh+16/DTX2QUR6MOtSJVf4S/aGvlneoKk63wKfEE=;
 b=FgbEut2wMqtxgHKoW/P00o3g/+3BL3HUBsTz2xhK2AKJX3IHLMKH82wTtN7zPPRiBe10pr
 CM3VmyL8Kgamh6tVQgcKvJVXzOgsd1CSa29ig/WjyVA0nmTlloCPSyVh128zMX1U/9LBFr
 kmuuaP4uXROSAMHmv+Rxg2ChxbM+pe8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-dFNzCPq-N82joKsGvASIKA-1; Fri, 03 Sep 2021 13:45:30 -0400
X-MC-Unique: dFNzCPq-N82joKsGvASIKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso71540wmx.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6axIh+16/DTX2QUR6MOtSJVf4S/aGvlneoKk63wKfEE=;
 b=bqjbIsTe9a7zWPJD4HxI8bX6BBZWXcOUjD3kZx5VkbK+gp8doPRowRgqSD5GSa6oXs
 nV5yfQa5VyQhCy+PRL8NGxdSicqySunlXFCbYdHoLs7TbYERRZJyjA1RR9Es7dD7wJ0P
 qp9BJf70YgxjQ5OzEoyV+lpbO0EUQAcWyKcEm99Q44/btod5BzEnBhOVwG9xaLCY1KtY
 WPs0Zt9vA88wC7c0PSMhCsMIyGoM7abpowpHmwJry6VBcT3IPBXyfS8OTOVthHy43if8
 0CHsjG4tndc7ZmX3pWW7ZsWipHDKoa7IUv22WwmRibXBHom70i9lJTOIrX0EZ+4jieJ/
 P9zw==
X-Gm-Message-State: AOAM53066/QrawbWJYzZonCclLKhaZ6pIfRE79HjKiCCYaIOZvnbHc9y
 +jRfP7TlSI/37kbR0cRzFFk4La5vQyjT2xcXad6IUwFAnWusQ/wZLD/ZITjIDP/xcYDGWx0aMuI
 DR9DTabXyXbpPf7r/Cd42TWmziM0K/ze9TR+seONe917FjG9HCvjaijBRIPlpeu0x
X-Received: by 2002:a05:600c:2d45:: with SMTP id
 a5mr10837wmg.125.1630691128716; 
 Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNMVrdhYVGK1jkicnt3+7vy1RAmeuPQL5fiuXrJeBt3IjcZ9OjyziVqH2ju+hi1oi9j6AhKw==
X-Received: by 2002:a05:600c:2d45:: with SMTP id
 a5mr10802wmg.125.1630691128471; 
 Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s13sm56649wmc.47.2021.09.03.10.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/28] qapi: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:45 +0200
Message-Id: <20210903174510.751630-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/qapi-clone-visitor.c | 16 ++++++++--------
 qapi/qapi-visit-core.c    |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
index c45c5caa3b8..b014119d368 100644
--- a/qapi/qapi-clone-visitor.c
+++ b/qapi/qapi-clone-visitor.c
@@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
         return true;
     }
 
-    *obj = g_memdup(*obj, size);
+    *obj = g_memdup2(*obj, size);
     qcv->depth++;
     return true;
 }
@@ -65,8 +65,8 @@ static GenericList *qapi_clone_next_list(Visitor *v, GenericList *tail,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Unshare the tail of the list cloned by g_memdup() */
-    tail->next = g_memdup(tail->next, size);
+    /* Unshare the tail of the list cloned by g_memdup2() */
+    tail->next = g_memdup2(tail->next, size);
     return tail->next;
 }
 
@@ -83,7 +83,7 @@ static bool qapi_clone_type_int64(Visitor *v, const char *name, int64_t *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -93,7 +93,7 @@ static bool qapi_clone_type_uint64(Visitor *v, const char *name,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -103,7 +103,7 @@ static bool qapi_clone_type_bool(Visitor *v, const char *name, bool *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -114,7 +114,7 @@ static bool qapi_clone_type_str(Visitor *v, const char *name, char **obj,
 
     assert(qcv->depth);
     /*
-     * Pointer was already cloned by g_memdup; create fresh copy.
+     * Pointer was already cloned by g_memdup2; create fresh copy.
      * Note that as long as qobject-output-visitor accepts NULL instead of
      * "", then we must do likewise. However, we want to obey the
      * input visitor semantics of never producing NULL when the empty
@@ -130,7 +130,7 @@ static bool qapi_clone_type_number(Visitor *v, const char *name, double *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51e..ebabe63b6ea 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -413,8 +413,10 @@ bool visit_type_enum(Visitor *v, const char *name, int *obj,
     case VISITOR_OUTPUT:
         return output_type_enum(v, name, obj, lookup, errp);
     case VISITOR_CLONE:
-        /* nothing further to do, scalar value was already copied by
-         * g_memdup() during visit_start_*() */
+        /*
+         * nothing further to do, scalar value was already copied by
+         * g_memdup2() during visit_start_*()
+         */
         return true;
     case VISITOR_DEALLOC:
         /* nothing to deallocate for a scalar */
-- 
2.31.1


