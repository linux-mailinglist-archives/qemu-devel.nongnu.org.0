Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CCB27870D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 14:22:17 +0200 (CEST)
Received: from localhost ([::1]:50812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLmjw-0002Wk-32
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 08:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLmWb-0003tF-QJ
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLmWW-0004Jh-2z
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 08:08:28 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601035703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjg2puLCSQciui07//qPWEIhVNJyqtO/XfPrVLvAMdA=;
 b=g4RT++n4rNQe/wOrVb5SWBJa5Snxymb4tQIbJ1NNqE4M6LXoV6aYZyQ5ZCvUMXHKLn9oFf
 bvXfTO1ffmIlc7g+m9D62G0l4vV5H+gviSQwciVvm4gdhMnUAUshSE8EIhgA/s50BWYZBt
 6HhuJ2CUsYwHZk5VYhxcDnTB0ZejEUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-kw9FVfvZPO6tKYMPIJkhzA-1; Fri, 25 Sep 2020 08:08:19 -0400
X-MC-Unique: kw9FVfvZPO6tKYMPIJkhzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9762805EE4;
 Fri, 25 Sep 2020 12:08:17 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-177.ams2.redhat.com
 [10.36.114.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD2A173693;
 Fri, 25 Sep 2020 12:08:12 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, zhengchuan@huawei.com, dovmurik@linux.vnet.ibm.com,
 hgcoin@gmail.com, zhangjiachen.jaycee@bytedance.com, lvivier@redhat.com,
 peterx@redhat.com, stefanha@redhat.com, vgoyal@redhat.com,
 jinyan12@huawei.com, ann.zhuangyanying@huawei.com
Subject: [PULL 20/26] migration/tls: extract cleanup function for common-use
Date: Fri, 25 Sep 2020 13:06:49 +0100
Message-Id: <20200925120655.295142-21-dgilbert@redhat.com>
In-Reply-To: <20200925120655.295142-1-dgilbert@redhat.com>
References: <20200925120655.295142-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chuan Zheng <zhengchuan@huawei.com>

multifd channel cleanup is need if multifd handshake failed,
let's extract it.

Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Yan Jin <jinyan12@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <1600139042-104593-5-git-send-email-zhengchuan@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index de34276c43..36d4a403a5 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -719,6 +719,23 @@ out:
     return NULL;
 }
 
+static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
+                                             QIOChannel *ioc, Error *err)
+{
+     migrate_set_error(migrate_get_current(), err);
+     /* Error happen, we need to tell who pay attention to me */
+     qemu_sem_post(&multifd_send_state->channels_ready);
+     qemu_sem_post(&p->sem_sync);
+     /*
+      * Although multifd_send_thread is not created, but main migration
+      * thread neet to judge whether it is running, so we need to mark
+      * its status.
+      */
+     p->quit = true;
+     object_unref(OBJECT(ioc));
+     error_free(err);
+}
+
 static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 {
     MultiFDSendParams *p = opaque;
@@ -727,25 +744,18 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
 
     trace_multifd_new_send_channel_async(p->id);
     if (qio_task_propagate_error(task, &local_err)) {
-        migrate_set_error(migrate_get_current(), local_err);
-        /* Error happen, we need to tell who pay attention to me */
-        qemu_sem_post(&multifd_send_state->channels_ready);
-        qemu_sem_post(&p->sem_sync);
-        /*
-         * Although multifd_send_thread is not created, but main migration
-         * thread needs to judge whether it is running, so we need to mark
-         * its status.
-         */
-        p->quit = true;
-        object_unref(OBJECT(sioc));
-        error_free(local_err);
+        goto cleanup;
     } else {
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
         qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                            QEMU_THREAD_JOINABLE);
+        return;
     }
+
+cleanup:
+    multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
 int multifd_save_setup(Error **errp)
-- 
2.26.2


