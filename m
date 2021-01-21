Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845212FEADD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:59:25 +0100 (CET)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZYa-00068x-JV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:59:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQL-0005Zt-R7
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQF-0003Su-BP
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ELMXX/7+Mu/+0lCYZDVZMDtTBBkG25eKsFIUDq+vL1o=;
 b=T+pb6ZWkIIOQOxR/MzuJt7JSwBoot46n+Z5coVYARSIUiqqwLyYDFeaj3zPLdNRGn4jMWy
 isfYTTaPSJ/2nXZDxrzahIRL0GhEPps9DLUPY/Ieq+CT4PWUVw9G+k5WyzVUGVp8EqhX++
 z57jTkgo6Su4pvi6m2XSSdcVMmfovWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-hduPV5XWPHWpNBCC6K0AaA-1; Thu, 21 Jan 2021 07:50:44 -0500
X-MC-Unique: hduPV5XWPHWpNBCC6K0AaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3AD15726
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2808319D9B;
 Thu, 21 Jan 2021 12:50:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B39F18003BE; Thu, 21 Jan 2021 13:50:29 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] trace/simple: add st_init_group
Date: Thu, 21 Jan 2021 13:50:28 +0100
Message-Id: <20210121125028.3247190-9-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helper function and call it for each trace event group added.
Makes sure that events added at module load time are initialized
properly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index f1cc880b7cd1..9649d0979e70 100644
--- a/trace/control.c
+++ b/trace/control.c
@@ -81,6 +81,10 @@ void trace_event_register_group(TraceEvent **events)
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
2.29.2


