Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B03D7938
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 17:02:10 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Oav-00059Q-6j
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 11:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZJ-0003iP-15
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m8OZG-00026z-Jv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 11:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627398025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPwST09raoahQYidrQh1QyY3zYyIFEHVrdWXjvHAaD8=;
 b=Z1COn/UggRDaosuwfXlHUItbOQAQAxQhZVsiMUewacjrzawjq9KJcjrmrp/BuIjj9qpCug
 cStyhoCdW6dnebXzuZ6Gby7FSxFDsQ/D93p5goVnaMlkdvbea9OU2f9z54lcK14uKzd7dh
 zQvGDZHN6CZtAvgPSqxDC5edFqUa6ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-kHtRH5OANPiELQ5TpQ_Omg-1; Tue, 27 Jul 2021 11:00:24 -0400
X-MC-Unique: kHtRH5OANPiELQ5TpQ_Omg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523B1195D58C
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 14:59:44 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-36.ams2.redhat.com
 [10.36.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE2519C79;
 Tue, 27 Jul 2021 14:59:43 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] iothread: use IOThreadParamInfo in
 iothread_[set|get]_param()
Date: Tue, 27 Jul 2021 16:59:36 +0200
Message-Id: <20210727145936.147032-3-sgarzare@redhat.com>
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
References: <20210727145936.147032-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 0445409d74 ("iothread: generalize
iothread_set_param/iothread_get_param") moved common code to set and
get IOThread parameters in two new functions.

These functions are called inside callbacks, so we don't need to use an
opaque pointer. Let's replace `void *opaque` parameter with
`IOThreadParamInfo *info`.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 iothread.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/iothread.c b/iothread.c
index a73e560ba0..0f98af0f2a 100644
--- a/iothread.c
+++ b/iothread.c
@@ -231,20 +231,18 @@ static IOThreadParamInfo aio_max_batch_info = {
 };
 
 static void iothread_get_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
+        const char *name, IOThreadParamInfo *info, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
-    IOThreadParamInfo *info = opaque;
     int64_t *field = (void *)iothread + info->offset;
 
     visit_type_int64(v, name, field, errp);
 }
 
 static bool iothread_set_param(Object *obj, Visitor *v,
-        const char *name, void *opaque, Error **errp)
+        const char *name, IOThreadParamInfo *info, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
-    IOThreadParamInfo *info = opaque;
     int64_t *field = (void *)iothread + info->offset;
     int64_t value;
 
@@ -266,16 +264,18 @@ static bool iothread_set_param(Object *obj, Visitor *v,
 static void iothread_get_poll_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
+    IOThreadParamInfo *info = opaque;
 
-    iothread_get_param(obj, v, name, opaque, errp);
+    iothread_get_param(obj, v, name, info, errp);
 }
 
 static void iothread_set_poll_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
+    IOThreadParamInfo *info = opaque;
 
-    if (!iothread_set_param(obj, v, name, opaque, errp)) {
+    if (!iothread_set_param(obj, v, name, info, errp)) {
         return;
     }
 
@@ -291,16 +291,18 @@ static void iothread_set_poll_param(Object *obj, Visitor *v,
 static void iothread_get_aio_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
+    IOThreadParamInfo *info = opaque;
 
-    iothread_get_param(obj, v, name, opaque, errp);
+    iothread_get_param(obj, v, name, info, errp);
 }
 
 static void iothread_set_aio_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
 {
     IOThread *iothread = IOTHREAD(obj);
+    IOThreadParamInfo *info = opaque;
 
-    if (!iothread_set_param(obj, v, name, opaque, errp)) {
+    if (!iothread_set_param(obj, v, name, info, errp)) {
         return;
     }
 
-- 
2.31.1


