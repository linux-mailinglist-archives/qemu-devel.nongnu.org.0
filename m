Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5903669F4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 13:33:52 +0200 (CEST)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZB79-00087H-J6
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 07:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB2x-0004Lk-6F
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lZB2s-0000U8-MY
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 07:29:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619004566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejMOe7Z6JxKP7STo5faGFHlyrnVP7/syI7UjLQeO2oc=;
 b=IvVwM3dqV6sdu0gLqpmr5cN7l2+DVbSG0m2hQZu7Biqy//oRw0wN3ncMVa/Jyk8uiqmaVV
 DFo0sl+EKl9/ifTGQOH8m6hVEqes42yjKhY+B0JxyIBkqxYz3j3lSdjX4sBkZI4vp+EjEJ
 GGfSqi4SA/UxKwt0Ify+C6orkYQGRWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-JQiWFTqmOCGid9a6Guddgg-1; Wed, 21 Apr 2021 07:29:24 -0400
X-MC-Unique: JQiWFTqmOCGid9a6Guddgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5883B100A8E0
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:28:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-29.ams2.redhat.com
 [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8665663634;
 Wed, 21 Apr 2021 11:28:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 eblake@redhat.com, armbru@redhat.com, pabeni@redhat.com
Subject: [PATCH v2 2/5] io/net-listener: Call the notifier during finalize
Date: Wed, 21 Apr 2021 12:28:31 +0100
Message-Id: <20210421112834.107651-3-dgilbert@redhat.com>
In-Reply-To: <20210421112834.107651-1-dgilbert@redhat.com>
References: <20210421112834.107651-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Call the notifier during finalize; it's currently only called
if we change it, which is not the intent.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 io/net-listener.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io/net-listener.c b/io/net-listener.c
index 46c2643d00..1c984d69c6 100644
--- a/io/net-listener.c
+++ b/io/net-listener.c
@@ -292,6 +292,9 @@ static void qio_net_listener_finalize(Object *obj)
     QIONetListener *listener = QIO_NET_LISTENER(obj);
     size_t i;
 
+    if (listener->io_notify) {
+        listener->io_notify(listener->io_data);
+    }
     qio_net_listener_disconnect(listener);
 
     for (i = 0; i < listener->nsioc; i++) {
-- 
2.31.1


