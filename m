Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E42FEABF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:55:15 +0100 (CET)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZUY-0001L3-5B
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQL-0005XE-5x
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQH-0003T4-As
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnxQm3v1Ab0206NsMpDRBh5rlQFn48y2RQATiKmFCkA=;
 b=duY33Vbi+oUC6JIAdxj9IGtcIlp00ySUfWTeXw3erdRT9Mjq/1kuoZJMCH7XeZzK2Twc/q
 q8HBR/d7lm9VxMMNcNK3Z3IdiYYqis8fcEam5c+pGNwKj0N5vsbf0+WpHrraOglCKQnLs6
 dfDA8TrHMMqGe8MjZ02cgp0TB4QGCog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-5ww4gFQYPfWnSKCsA79fGg-1; Thu, 21 Jan 2021 07:50:45 -0500
X-MC-Unique: 5ww4gFQYPfWnSKCsA79fGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88CAE1572A
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23CCA60C43;
 Thu, 21 Jan 2021 12:50:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2DA5218003BA; Thu, 21 Jan 2021 13:50:29 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/8] trace/simple: pass iter to st_write_event_mapping
Date: Thu, 21 Jan 2021 13:50:27 +0100
Message-Id: <20210121125028.3247190-8-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Pass an iter to st_write_event_mapping, so the function can interate
different things depending on how we initialize the iter.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 trace/simple.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/trace/simple.c b/trace/simple.c
index 97b6f85168e7..ec2156d135cb 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -280,14 +280,12 @@ void trace_record_finish(TraceBufferRecord *rec)
     }
 }
 
-static int st_write_event_mapping(void)
+static int st_write_event_mapping(TraceEventIter *iter)
 {
     uint64_t type = TRACE_RECORD_TYPE_MAPPING;
-    TraceEventIter iter;
     TraceEvent *ev;
 
-    trace_event_iter_init_all(&iter);
-    while ((ev = trace_event_iter_next(&iter)) != NULL) {
+    while ((ev = trace_event_iter_next(iter)) != NULL) {
         uint64_t id = trace_event_get_id(ev);
         const char *name = trace_event_get_name(ev);
         uint32_t len = strlen(name);
@@ -309,6 +307,7 @@ static int st_write_event_mapping(void)
  */
 bool st_set_trace_file_enabled(bool enable)
 {
+    TraceEventIter iter;
     bool was_enabled = trace_fp;
 
     if (enable == !!trace_fp) {
@@ -333,8 +332,9 @@ bool st_set_trace_file_enabled(bool enable)
             return was_enabled;
         }
 
+        trace_event_iter_init_all(&iter);
         if (fwrite(&header, sizeof header, 1, trace_fp) != 1 ||
-            st_write_event_mapping() < 0) {
+            st_write_event_mapping(&iter) < 0) {
             fclose(trace_fp);
             trace_fp = NULL;
             return was_enabled;
-- 
2.29.2


