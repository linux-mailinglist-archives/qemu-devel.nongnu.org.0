Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430D639742C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:28:46 +0200 (CEST)
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Rk-0001A3-3q
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4O5-0001gy-Eg
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4O3-0007TS-SH
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+JGHQbX8aWH6SFPM2BHWCun/ZgAUXd8dXesS3lRGN/U=;
 b=cNizXnQdNlZjZ6mJFF3ygBopkHm9knTzjcPuKJXr8EKfm5T7ogebhLI1OmFU3iN3WVwj1r
 ngFAZKja6dCasda6TVnqo2dlP5ChdgayAOOgaA+SD0dXyMz+eA8bY2994+o6A1+cOP0Xvf
 bfH2kgI7Jp35JG0AM7W1qQ4rac19cFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-EoxC20H3NYqNnRuCsdeRvA-1; Tue, 01 Jun 2021 09:24:49 -0400
X-MC-Unique: EoxC20H3NYqNnRuCsdeRvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 430D88015F5
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 589DA60BD8;
 Tue,  1 Jun 2021 13:24:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7038B180038D; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/13] trace/simple: pass iter to st_write_event_mapping
Date: Tue,  1 Jun 2021 15:24:05 +0200
Message-Id: <20210601132414.432430-5-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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

Pass an iter to st_write_event_mapping, so the function can interate
different things depending on how we initialize the iter.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
2.31.1


