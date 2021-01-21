Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379B2FEAAE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:52:46 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZS9-00077P-C9
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQK-0005WG-Qm
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQG-0003Sy-7n
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1uovRcMgcTVUoryQ2H9/X2Y3ypZeywc6XI0DccfYI4Q=;
 b=IbJfuFSKZpAF5q327Z71TNT2opDs+nUIL967awFVtasbqP2PsrTbuKVZ3UcYHrTYk5VYS7
 Rhh8uM2ijrResW/3/F/c4NfE1ReW57FCZax7W1kGL/QZgM4dAnGbPwT12IKE4rRttsVzWc
 uAHqqH5XGf2RPR4reNCmKFvjW07VmBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-w55y55hmNxmwpBtTeMT0XA-1; Thu, 21 Jan 2021 07:50:45 -0500
X-MC-Unique: w55y55hmNxmwpBtTeMT0XA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C105806661
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C38E2101E663;
 Thu, 21 Jan 2021 12:50:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2340118003B6; Thu, 21 Jan 2021 13:50:29 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/8] trace: add trace_event_iter_init_group
Date: Thu, 21 Jan 2021 13:50:26 +0100
Message-Id: <20210121125028.3247190-7-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows to interate over an event group.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index bd5d79aacd94..f1cc880b7cd1 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -103,6 +103,7 @@ void trace_event_iter_init_all(TraceEventIter *iter)
 {
     iter->event = 0;
     iter->group = 0;
+    iter->group_id = -1;
     iter->pattern = NULL;
 }
 
@@ -112,20 +113,32 @@ void trace_event_iter_init_pattern(TraceEventIter *iter, const char *pattern)
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
2.29.2


