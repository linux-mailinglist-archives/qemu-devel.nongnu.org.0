Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCD33C78F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:18:25 +0100 (CET)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtfU-0006gi-Bs
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaB-0000gM-NH
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaA-0006Sd-10
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZPEUhAvJZq1C7+I1PsU5TJBMdt3I/FwNC0ZWK5/PYq0=;
 b=gsdreGvlGbjMcAX9PyP2F8RYSithxiLDBoAcT0TtSSl9LgkSm7/DSn2AQQYXC77s4uNhnj
 hHybkRLa9RlIJH6nb+HnnlapAc3ESVA4awTahYqPLtAhxxn3sF0t3Nttk3y+PcQswS18pT
 s5TnAYTZM1ARUL/B+UuzQmyZgpnN86o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-u1y_E0mKPlGGVsMon3_r7Q-1; Mon, 15 Mar 2021 16:12:50 -0400
X-MC-Unique: u1y_E0mKPlGGVsMon3_r7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB56E1074644;
 Mon, 15 Mar 2021 20:12:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 070D9627DC;
 Mon, 15 Mar 2021 20:12:47 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 7/9] migration/tls: add error handling in
 multifd_tls_handshake_thread
Date: Mon, 15 Mar 2021 20:12:13 +0000
Message-Id: <20210315201215.222539-8-dgilbert@redhat.com>
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

If any error happens during multifd send thread creating (e.g. channel broke
because new domain is destroyed by the dst), multifd_tls_handshake_thread
may exit silently, leaving main migration thread hanging (ram_save_setup ->
multifd_send_sync_main -> qemu_sem_wait(&p->sem_sync)).
Fix that by adding error handling in multifd_tls_handshake_thread.

Signed-off-by: Hao Wang <wanghao232@huawei.com>
Message-Id: <20210209104237.2250941-3-wanghao232@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 2a1ea85ade..03527c564c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -739,7 +739,16 @@ static void multifd_tls_outgoing_handshake(QIOTask *task,
     } else {
         trace_multifd_tls_outgoing_handshake_complete(ioc);
     }
-    multifd_channel_connect(p, ioc, err);
+
+    if (!multifd_channel_connect(p, ioc, err)) {
+        /*
+         * Error happen, mark multifd_send_thread status as 'quit' although it
+         * is not created, and then tell who pay attention to me.
+         */
+        p->quit = true;
+        qemu_sem_post(&multifd_send_state->channels_ready);
+        qemu_sem_post(&p->sem_sync);
+    }
 }
 
 static void *multifd_tls_handshake_thread(void *opaque)
-- 
2.30.2


