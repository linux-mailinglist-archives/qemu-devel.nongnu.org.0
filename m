Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5783BEA3E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:02:48 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m194Z-0005jG-JY
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192U-0003gX-Vp
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192S-0006Cl-Hx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6+ZiMdDFv8oHA3dnDQn58wlQWvHhmXKtz6vfzKsitY=;
 b=b/iBPYQCOmBc19YHuQhyLo6NpvCnyWbkKN9UONiOHgq4zwP9TrdjqDp0K4h6ht0juS4Pgx
 f10lOhC0Paae+N9Yy39gwjIPRlms/DjQqxeyI1G5M6YeWsbiPpWikGk5hEKRlt/2V8+hGn
 kWvezY2zYxaS4e0se4OptxSqh30DYgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-oN2ru85XNk-FMg-YV9GzWQ-1; Wed, 07 Jul 2021 11:00:34 -0400
X-MC-Unique: oN2ru85XNk-FMg-YV9GzWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A835074B;
 Wed,  7 Jul 2021 15:00:33 +0000 (UTC)
Received: from steredhat.tendawifi.com (ovpn-112-132.ams2.redhat.com
 [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C73E5C1D5;
 Wed,  7 Jul 2021 15:00:30 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] iothread: generalize iothread_set_param/iothread_get_param
Date: Wed,  7 Jul 2021 17:00:17 +0200
Message-Id: <20210707150019.201442-2-sgarzare@redhat.com>
In-Reply-To: <20210707150019.201442-1-sgarzare@redhat.com>
References: <20210707150019.201442-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes in preparation for next patches where we add a new
parameter not related to the poll mechanism.

Let's add two new generic functions (iothread_set_param and
iothread_get_param) that we use to set and get IOThread
parameters.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 iothread.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/iothread.c b/iothread.c
index 2c5ccd7367..103679a16b 100644
--- a/iothread.c
+++ b/iothread.c
@@ -213,7 +213,7 @@ static PollParamInfo poll_shrink_info = {
     "poll-shrink", offsetof(IOThread, poll_shrink),
 };
 
-static void iothread_get_poll_param(Object *obj, Visitor *v,
+static void iothread_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
@@ -223,7 +223,7 @@ static void iothread_get_poll_param(Object *obj, Visitor *v,
     visit_type_int64(v, name, field, errp);
 }
 
-static void iothread_set_poll_param(Object *obj, Visitor *v,
+static bool iothread_set_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
@@ -232,17 +232,36 @@ static void iothread_set_poll_param(Object *obj, Visitor *v,
     int64_t value;
 
     if (!visit_type_int64(v, name, &value, errp)) {
-        return;
+        return false;
     }
 
     if (value < 0) {
         error_setg(errp, "%s value must be in range [0, %" PRId64 "]",
                    info->name, INT64_MAX);
-        return;
+        return false;
     }
 
     *field = value;
 
+    return true;
+}
+
+static void iothread_get_poll_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+
+    iothread_get_param(obj, v, name, opaque, errp);
+}
+
+static void iothread_set_poll_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    IOThread *iothread = IOTHREAD(obj);
+
+    if (!iothread_set_param(obj, v, name, opaque, errp)) {
+        return;
+    }
+
     if (iothread->ctx) {
         aio_context_set_poll_params(iothread->ctx,
                                     iothread->poll_max_ns,
-- 
2.31.1


