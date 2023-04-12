Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034546E0127
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHM-0008MY-KG; Wed, 12 Apr 2023 17:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHJ-0008Ly-BW
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHH-0006Zv-8F
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZcwNAcxsP5avnR9qInovHQVmt6wLpJO6hu/KQ1QQQUQ=;
 b=PjiEfNwZMRLH+3ak2Z6GNFJ9iXE9TNl9OrlQYATf0D+37Y3lMpbrHGcOSY8nzoXjtfTwBV
 OpaQtql4FcmHvNRbZOYUvzruvChzA2YlV0RmUVEcVzzZVaU5CiRHeQjEYkDzecsgzA1jcO
 e645Pjk6zXsiiYinDt6u4uLfSQzBOAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-OF0QqyBJPPi8FBjZA_hfPw-1; Wed, 12 Apr 2023 17:45:12 -0400
X-MC-Unique: OF0QqyBJPPi8FBjZA_hfPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEE71185A78F;
 Wed, 12 Apr 2023 21:45:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CA601121320;
 Wed, 12 Apr 2023 21:45:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 1/5] io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on server
 side
Date: Wed, 12 Apr 2023 23:45:03 +0200
Message-Id: <20230412214507.19816-2-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
References: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

TLS iochannel will inherit io_shutdown() from the master ioc, however we
missed to do that on the server side.

This will e.g. allow qemu_file_shutdown() to work on dest QEMU too for
migration.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 io/channel-tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 5a7a3d48d6..9805dd0a3f 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -74,6 +74,9 @@ qio_channel_tls_new_server(QIOChannel *master,
     ioc = QIO_CHANNEL_TLS(object_new(TYPE_QIO_CHANNEL_TLS));
 
     ioc->master = master;
+    if (qio_channel_has_feature(master, QIO_CHANNEL_FEATURE_SHUTDOWN)) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SHUTDOWN);
+    }
     object_ref(OBJECT(master));
 
     ioc->session = qcrypto_tls_session_new(
-- 
2.39.2


