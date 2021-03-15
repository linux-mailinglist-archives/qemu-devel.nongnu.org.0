Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384933C7A5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:22:41 +0100 (CET)
Received: from localhost ([::1]:35220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtjc-0003Bt-FD
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaR-0000nj-44
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaJ-0006WL-2b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zLfhj51ZNFEZY4owAuARcAc+dbDxenA72ehLGhUsZdg=;
 b=cGPo8Y283XjKOFZoZe6wlcOcKtpwwfN1TPR6iR9JqTp62TjNpQ9kExat/vWQWOIdK4im4M
 jVhKfqtniWTB7fobRO7Jzcl7MbRVN70b68tA2G0s2ZfHk6USGX99ocXP8hq8A74yCTlNSu
 GR56PKo+CY35slR0UU/NjBanJbloKw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-w6RJKbnjPsWf3KSzNoGZZQ-1; Mon, 15 Mar 2021 16:12:48 -0400
X-MC-Unique: w6RJKbnjPsWf3KSzNoGZZQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B224C83DD21;
 Mon, 15 Mar 2021 20:12:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0381062680;
 Mon, 15 Mar 2021 20:12:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 6/9] migration/tls: fix inverted semantics in
 multifd_channel_connect
Date: Mon, 15 Mar 2021 20:12:12 +0000
Message-Id: <20210315201215.222539-7-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hao Wang <wanghao232@huawei.com>

Function multifd_channel_connect() return "true" to indicate failure,
which is rather confusing. Fix that.

Signed-off-by: Hao Wang <wanghao232@huawei.com>
Message-Id: <20210209104237.2250941-2-wanghao232@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1a1e589064..2a1ea85ade 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -798,9 +798,9 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                  * function after the TLS handshake,
                  * so we mustn't call multifd_send_thread until then
                  */
-                return false;
-            } else {
                 return true;
+            } else {
+                return false;
             }
         } else {
             /* update for tls qio channel */
@@ -808,10 +808,10 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
             qemu_thread_create(&p->thread, p->name, multifd_send_thread, p,
                                    QEMU_THREAD_JOINABLE);
        }
-       return false;
+       return true;
     }
 
-    return true;
+    return false;
 }
 
 static void multifd_new_send_channel_cleanup(MultiFDSendParams *p,
@@ -844,7 +844,7 @@ static void multifd_new_send_channel_async(QIOTask *task, gpointer opaque)
         p->c = QIO_CHANNEL(sioc);
         qio_channel_set_delay(p->c, false);
         p->running = true;
-        if (multifd_channel_connect(p, sioc, local_err)) {
+        if (!multifd_channel_connect(p, sioc, local_err)) {
             goto cleanup;
         }
         return;
-- 
2.30.2


