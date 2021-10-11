Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68561428D47
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 14:46:23 +0200 (CEST)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZuhC-0000L8-GB
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 08:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZucX-0003Up-2C
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mZucU-0000pZ-7o
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 08:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633956089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v1xyzUPEG8vSqLmUOyPL3uokJ1u4AmbpO6wxHCfrYqk=;
 b=TL4GmWdvbzswDk0C7/SY7/QaV3+3yBfsm0xWLxIOAkWg1lPNUu0Tjb9vPEnB/kExG9NNoB
 9Aeq0rPtS6FJCFvj07Xeee4yBmlLB5SNAB5qKj7ikLFiewTpjR5FdbOTdVhvDYOLXeiHQ2
 Bewjxfa/VefW7QxvbAffdaJJ+kVbzTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-24yzk_uTPoWKECpEA31R6A-1; Mon, 11 Oct 2021 08:41:26 -0400
X-MC-Unique: 24yzk_uTPoWKECpEA31R6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20421835DE1;
 Mon, 11 Oct 2021 12:41:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD4EB1017CE6;
 Mon, 11 Oct 2021 12:41:24 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/2] iothread: use IOThreadParamInfo in
 iothread_[set|get]_param()
Date: Mon, 11 Oct 2021 13:40:44 +0100
Message-Id: <20211011124044.9090-3-stefanha@redhat.com>
In-Reply-To: <20211011124044.9090-1-stefanha@redhat.com>
References: <20211011124044.9090-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Commit 0445409d74 ("iothread: generalize
iothread_set_param/iothread_get_param") moved common code to set and
get IOThread parameters in two new functions.

These functions are called inside callbacks, so we don't need to use an
opaque pointer. Let's replace `void *opaque` parameter with
`IOThreadParamInfo *info`.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20210727145936.147032-3-sgarzare@redhat.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
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


