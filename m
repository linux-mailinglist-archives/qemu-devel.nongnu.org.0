Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66952397415
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:26:10 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4PJ-0003bq-EN
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Nv-0001Tj-Hc
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Ns-0007My-59
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LuaAfgLNp0ftHMNxPsrBIquvjEpO4NRRU9Khnzc/6dQ=;
 b=S2h99StDiBWXconRQZWvFNGrMbOcu/wtcyKNIEqGiQGm7FBuUIjdGUcz4/4qCY25hI8jHG
 kGMgJJ6rTejZlAnyq/38wMu+zV7Blxn6Tf7PDcAEvOYJAghtS0jpBex/It3QghTTv3RSj7
 rv/Hhy8ZtufVhaQXYdsTzUGIwESP60A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-DOMvbGZYPZSAXuOUuNaVVA-1; Tue, 01 Jun 2021 09:24:37 -0400
X-MC-Unique: DOMvbGZYPZSAXuOUuNaVVA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CEBAE189C446
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 694135C1C4;
 Tue,  1 Jun 2021 13:24:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 656501800385; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/13] trace: add trace_event_iter_init_group
Date: Tue,  1 Jun 2021 15:24:04 +0200
Message-Id: <20210601132414.432430-4-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to interate over an event group.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/control.h | 13 +++++++++++++
 trace/control.c | 19 ++++++++++++++++---
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/trace/control.h b/trace/control.h
index ce40bd040574..23b8393b297e 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -13,8 +13,11 @@
 #include "event-internal.h"
 
 typedef struct TraceEventIter {
+    /* iter state */
     size_t event;
     size_t group;
+    /* filter conditions */
+    size_t group_id;
     const char *pattern;
 } TraceEventIter;
 
@@ -39,6 +42,16 @@ void trace_event_iter_init_all(TraceEventIter *iter);
  */
 void trace_event_iter_init_pattern(TraceEventIter *iter, const char *pattern);
 
+/**
+ * trace_event_iter_init_group:
+ * @iter: the event iterator struct
+ * @group_id: group_id to filter events by group.
+ *
+ * Initialize the event iterator struct @iter,
+ * using @group_id to filter for events in the group.
+ */
+void trace_event_iter_init_group(TraceEventIter *iter, size_t group_id);
+
 /**
  * trace_event_iter_next:
  * @iter: the event iterator struct
diff --git a/trace/control.c b/trace/control.c
index ed38e813b23d..2c904b7ee4c6 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -104,6 +104,7 @@ void trace_event_iter_init_all(TraceEventIter *iter)
 {
     iter->event = 0;
     iter->group = 0;
+    iter->group_id = -1;
     iter->pattern = NULL;
 }
 
@@ -113,20 +114,32 @@ void trace_event_iter_init_pattern(TraceEventIter *iter, const char *pattern)
     iter->pattern = pattern;
 }
 
+void trace_event_iter_init_group(TraceEventIter *iter, size_t group_id)
+{
+    trace_event_iter_init_all(iter);
+    iter->group_id = group_id;
+}
+
 TraceEvent *trace_event_iter_next(TraceEventIter *iter)
 {
     while (iter->group < nevent_groups &&
            event_groups[iter->group].events[iter->event] != NULL) {
         TraceEvent *ev = event_groups[iter->group].events[iter->event];
+        size_t group = iter->group;
         iter->event++;
         if (event_groups[iter->group].events[iter->event] == NULL) {
             iter->event = 0;
             iter->group++;
         }
-        if (!iter->pattern ||
-            g_pattern_match_simple(iter->pattern, trace_event_get_name(ev))) {
-            return ev;
+        if (iter->pattern &&
+            !g_pattern_match_simple(iter->pattern, trace_event_get_name(ev))) {
+            continue;
         }
+        if (iter->group_id != -1 &&
+            iter->group_id != group) {
+            continue;
+        }
+        return ev;
     }
 
     return NULL;
-- 
2.31.1


