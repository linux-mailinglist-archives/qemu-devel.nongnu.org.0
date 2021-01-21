Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 619542FEAAF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:52:59 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZSM-0007bC-EZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQJ-0005Tg-BV
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQB-0003RA-16
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zouQmuAdoAfUZ/D8dk+uPrTlPyKrMck+iXrXIyqMyuI=;
 b=eRRcxLYYbEyuyEMVxDrY9xJlvTOwYu65gkb+tiM4xlOVHV0CY/vbYJJdLzNzEewHwGFGcZ
 ZYco0bqNA79mQmBOT8oekXu6/Dgc94VcL71kFa6xEf2whSvJljy6uO2UbqqjaCEDtO4tUV
 FJDSIi5SsdUber0ya1Tmg2kQtpbLfHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-AmUZXnkDPXy0nHUfPBSDzQ-1; Thu, 21 Jan 2021 07:50:39 -0500
X-MC-Unique: AmUZXnkDPXy0nHUfPBSDzQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35998806677
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C10FE5D9C6;
 Thu, 21 Jan 2021 12:50:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 16D9218003B2; Thu, 21 Jan 2021 13:50:29 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/8] trace: iter init tweaks
Date: Thu, 21 Jan 2021 13:50:25 +0100
Message-Id: <20210121125028.3247190-6-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Rename trace_event_iter_init() to trace_event_iter_init_pattern(),
add trace_event_iter_init_all() for interating over all events.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index a7650ed74702..d62d5d25aa2e 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -2025,7 +2025,7 @@ void info_trace_events_completion(ReadLineState *rs, int nb_args, const char *st
         TraceEventIter iter;
         TraceEvent *ev;
         char *pattern = g_strdup_printf("%s*", str);
-        trace_event_iter_init(&iter, pattern);
+        trace_event_iter_init_pattern(&iter, pattern);
         while ((ev = trace_event_iter_next(&iter)) != NULL) {
             readline_add_completion(rs, trace_event_get_name(ev));
         }
@@ -2043,7 +2043,7 @@ void trace_event_completion(ReadLineState *rs, int nb_args, const char *str)
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
index cd04dd4e0c1c..bd5d79aacd94 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -90,7 +90,7 @@ TraceEvent *trace_event_name(const char *name)
 
     TraceEventIter iter;
     TraceEvent *ev;
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (strcmp(trace_event_get_name(ev), name) == 0) {
             return ev;
@@ -99,10 +99,16 @@ TraceEvent *trace_event_name(const char *name)
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
 
@@ -129,7 +135,7 @@ void trace_list_events(FILE *f)
 {
     TraceEventIter iter;
     TraceEvent *ev;
-    trace_event_iter_init(&iter, NULL);
+    trace_event_iter_init_all(&iter);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         fprintf(f, "%s\n", trace_event_get_name(ev));
     }
@@ -149,7 +155,7 @@ static void do_trace_enable_events(const char *line_buf)
     TraceEvent *ev;
     bool is_pattern = trace_event_is_pattern(line_ptr);
 
-    trace_event_iter_init(&iter, line_ptr);
+    trace_event_iter_init_pattern(&iter, line_ptr);
     while ((ev = trace_event_iter_next(&iter)) != NULL) {
         if (!trace_event_get_state_static(ev)) {
             if (!is_pattern) {
@@ -257,7 +263,7 @@ void trace_fini_vcpu(CPUState *vcpu)
 
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
2.29.2


