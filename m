Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A0A397466
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:34:24 +0200 (CEST)
Received: from localhost ([::1]:46258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4XH-0003WF-HT
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4O7-0001nz-BI
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lo4O5-0007Uu-NO
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622553893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3kX+f7N4OZcVBJKvFr8puI6TgrBvyijJS4EBLG3SHMw=;
 b=Syx1q6TYtf1dnLUuz4C0GPKoxXtQb6nFnDpXgelYFKHO7icpgTdUjf5FfW1di5Qug3yzJX
 IloIW43LXGueJ0fBOitxzfnUg4J5XY96uma7QLfEsIBF409TrZT4yWVZyd33sUt8as/8Ue
 EXap8fPtd5e7LXGa5QpxqvQHGN477GY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-vHNqExR7NS-NKc4WagdWJA-1; Tue, 01 Jun 2021 09:24:51 -0400
X-MC-Unique: vHNqExR7NS-NKc4WagdWJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F573189C447
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 13:24:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B49436A035;
 Tue,  1 Jun 2021 13:24:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F18818003AF; Tue,  1 Jun 2021 15:24:14 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/13] trace/simple: add st_init_group
Date: Tue,  1 Jun 2021 15:24:06 +0200
Message-Id: <20210601132414.432430-6-kraxel@redhat.com>
In-Reply-To: <20210601132414.432430-1-kraxel@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Add helper function and call it for each trace event group added.
Makes sure that events added at module load time are initialized
properly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 trace/simple.h  |  1 +
 trace/control.c |  4 ++++
 trace/simple.c  | 12 ++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/trace/simple.h b/trace/simple.h
index 26ccbc8b8ae3..ee1983ce5617 100644
--- a/trace/simple.h
+++ b/trace/simple.h
@@ -15,6 +15,7 @@ void st_print_trace_file_status(void);
 bool st_set_trace_file_enabled(bool enable);
 void st_set_trace_file(const char *file);
 bool st_init(void);
+void st_init_group(size_t group);
 void st_flush_trace_buffer(void);
 
 typedef struct {
diff --git a/trace/control.c b/trace/control.c
index 2c904b7ee4c6..d5b68e846eeb 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -82,6 +82,10 @@ void trace_event_register_group(TraceEvent **events)
     event_groups = g_renew(TraceEventGroup, event_groups, nevent_groups + 1);
     event_groups[nevent_groups].events = events;
     nevent_groups++;
+
+#ifdef CONFIG_TRACE_SIMPLE
+    st_init_group(nevent_groups - 1);
+#endif
 }
 
 
diff --git a/trace/simple.c b/trace/simple.c
index ec2156d135cb..ac499edee0d5 100644
--- a/trace/simple.c
+++ b/trace/simple.c
@@ -422,3 +422,15 @@ bool st_init(void)
     atexit(st_flush_trace_buffer);
     return true;
 }
+
+void st_init_group(size_t group)
+{
+    TraceEventIter iter;
+
+    if (!trace_writeout_enabled) {
+        return;
+    }
+
+    trace_event_iter_init_group(&iter, group);
+    st_write_event_mapping(&iter);
+}
-- 
2.31.1


