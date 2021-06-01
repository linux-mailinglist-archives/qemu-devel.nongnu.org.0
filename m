Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75112397418
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:26:18 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4PR-0003lL-I7
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:26:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Nz-0001V5-2P
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4Nu-0007OL-FF
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ik4IQGs6QAoX0EoQ8YuW1+T17wfK79T/ba8aGDNBkAs=;
 b=ZHT1xiXu77jPTR8hoWP+Rt0oY3mRPZYl5emHvTskeX1xPA9Aut3D1S+jUE534QUaFgOkuB
 XUf7K3aPRDey4wDwpS6ZHmk5cSTiBvma3J+Uabn2TjlXJzYP2+3b/bTXvHu9v1eJFjIx1k
 BrrApFnrV0WlrMrTus7p5RNXhOd1Thw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-Mc8ueYy0O-Oy_HIXLeCg8w-1; Tue, 01 Jun 2021 09:24:40 -0400
X-MC-Unique: Mc8ueYy0O-Oy_HIXLeCg8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748218015F5
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4108A5D751;
 Tue,  1 Jun 2021 13:24:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 510B018000B9; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 02/13] trace: iter init tweaks
Date: Tue,  1 Jun 2021 15:24:03 +0200
Message-Id: <20210601132414.432430-3-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Rename trace_event_iter_init() to trace_event_iter_init_pattern(),
add trace_event_iter_init_all() for interating over all events.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/control.h        | 17 +++++++++++++----
 monitor/misc.c         |  4 ++--
 trace/control-target.c |  2 +-
 trace/control.c        | 16 +++++++++++-----
 trace/qmp.c            |  6 +++---
 trace/simple.c         |  2 +-
 6 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/trace/control.h b/trace/control.h
index 9522a7b318e2..ce40bd040574 100644
--- a/trace/control.h
+++ b/trace/control.h
@@ -20,15 +20,24 @@ typedef struct TraceEventIter {
 
 
 /**
- * trace_event_iter_init:
+ * trace_event_iter_init_all:
  * @iter: the event iterator struct
- * @pattern: optional pattern to filter events on name
  *
  * Initialize the event iterator struct @iter,
- * optionally using @pattern to filter out events
+ * for all events.
+ */
+void trace_event_iter_init_all(TraceEventIter *iter);
+
+/**
+ * trace_event_iter_init_pattern:
+ * @iter: the event iterator struct
+ * @pattern: pattern to filter events on name
+ *
+ * Initialize the event iterator struct @iter,
+ * using @pattern to filter out events
  * with non-matching names.
  */
-void trace_event_iter_init(TraceEventIter *iter, const char *pattern);
+void trace_event_iter_init_pattern(TraceEventIter *iter, const char *pattern);
 
 /**
  * trace_event_iter_next:
diff --git a/monitor/misc.c b/monitor/misc.c
index f3a393ea590b..f9b86bf4a778 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -1833,7 +1833,7 @@ void info_trace_events_completion(ReadLineState *rs, int nb_args, const char *st
         TraceEventIter iter;
         TraceEvent *ev;
         char *pattern = g_strdup_printf("%s*", str);
-        trace_event_iter_init(&iter, pattern);
+        trace_event_iter_init_pattern(&iter, pattern);
         while ((ev = trace_event_iter_next(&iter)) != NULL) {
             readline_add_completion(rs, trace_event_get_name(ev));
         }
@@ -1851,7 +1851,7 @@ void trace_event_completion(ReadLineState *rs, int nb_args, const char *str)
         TraceEventIter iter;
         TraceEvent *ev;
         char *pattern = g_strdup_printf("%s*", str);
-        trace_event_iter_init(&iter, pattern);
+        trace_event_iter_init_pattern(&iter, pattern);
         while ((ev = trace_event_iter_next(&iter)) != NULL) {
             readline_add_completion(rs, trace_event_get_name(ev));
         }
diff --git a/trace/control-target.c b/trace/control-target.c
index e293eeed7c00..8418673c18cf 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -127,7 +127,7 @@ void trace_init_vcpu(CPUState *vcpu)
 {
     TraceEventIter iter;
     TraceEvent *ev;
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (trace_event_is_vcpu(ev) &&
             trace_event_get_state_static(ev) &&
diff --git a/trace/control.c b/trace/control.c
index 4be38e1af28d..ed38e813b23d 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -91,7 +91,7 @@ TraceEvent *trace_event_name(const char *name)
 
     TraceEventIter iter;
     TraceEvent *ev;
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (strcmp(trace_event_get_name(ev), name) == 0) {
             return ev;
@@ -100,10 +100,16 @@ TraceEvent *trace_event_name(const char *name)
     return NULL;
 }
 
-void trace_event_iter_init(TraceEventIter *iter, const char *pattern)
+void trace_event_iter_init_all(TraceEventIter *iter)
 {
     iter->event = 0;
     iter->group = 0;
+    iter->pattern = NULL;
+}
+
+void trace_event_iter_init_pattern(TraceEventIter *iter, const char *pattern)
+{
+    trace_event_iter_init_all(iter);
     iter->pattern = pattern;
 }
 
@@ -130,7 +136,7 @@ void trace_list_events(FILE *f)
 {
     TraceEventIter iter;
     TraceEvent *ev;
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         fprintf(f, "%s\n", trace_event_get_name(ev));
     }
@@ -150,7 +156,7 @@ static void do_trace_enable_events(const char *line_buf)
     TraceEvent *ev;
     bool is_pattern = trace_event_is_pattern(line_ptr);
 
-    trace_event_iter_init(&iter, line_ptr);
+    trace_event_iter_init_pattern(&iter, line_ptr);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (!trace_event_get_state_static(ev)) {
             if (!is_pattern) {
@@ -256,7 +262,7 @@ void trace_fini_vcpu(CPUState *vcpu)
 
     trace_guest_cpu_exit(vcpu);
 
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (trace_event_is_vcpu(ev) &&
             trace_event_get_state_static(ev) &&
diff --git a/trace/qmp.c b/trace/qmp.c
index 85f81e47cc6d..3b4f4702b4f0 100644
--- a/trace/qmp.c
+++ b/trace/qmp.c
@@ -55,7 +55,7 @@ static bool check_events(bool has_vcpu, bool ignore_unavailable, bool is_pattern
         /* error for unavailable events */
         TraceEventIter iter;
         TraceEvent *ev;
-        trace_event_iter_init(&iter, name);
+        trace_event_iter_init_pattern(&iter, name);
         while ((ev = trace_event_iter_next(&iter)) != NULL) {
             if (!ignore_unavailable && !trace_event_get_state_static(ev)) {
                 error_setg(errp, "event \"%s\" is disabled", trace_event_get_name(ev));
@@ -90,7 +90,7 @@ TraceEventInfoList *qmp_trace_event_get_state(const char *name,
     }
 
     /* Get states (all errors checked above) */
-    trace_event_iter_init(&iter, name);
+    trace_event_iter_init_pattern(&iter, name);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         TraceEventInfo *value;
         bool is_vcpu = trace_event_is_vcpu(ev);
@@ -153,7 +153,7 @@ void qmp_trace_event_set_state(const char *name, bool enable,
     }
 
     /* Apply changes (all errors checked above) */
-    trace_event_iter_init(&iter, name);
+    trace_event_iter_init_pattern(&iter, name);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (!trace_event_get_state_static(ev) ||
             (has_vcpu && !trace_event_is_vcpu(ev))) {
diff --git a/trace/simple.c b/trace/simple.c
index 9cd2ed1fb3f4..97b6f85168e7 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -286,7 +286,7 @@ static int st_write_event_mapping(void)
     TraceEventIter iter;
     TraceEvent *ev;
 
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         uint64_t id = trace_event_get_id(ev);
         const char *name = trace_event_get_name(ev);
-- 
2.31.1


