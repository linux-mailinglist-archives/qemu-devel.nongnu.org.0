Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960B44332A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:39:04 +0100 (CET)
Received: from localhost ([::1]:60562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwoR-0003NZ-AG
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhwju-0002Sf-Fb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mhwjs-0004iu-A7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:34:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635870858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UVbaAHRLO9oEnZZwBqg/uuKVDvKIhSNkTW+E7gZglu8=;
 b=NURI5Z6Gq6J5gDvsUMTzF7CuARObFofRGfO62cc7wvcHJF291N1hN4UImk7m7fZy/U6rKQ
 688N40DpKgW/WW7lyli4zRNY5zQaw9s2YjvRo1ifYO7A3QVF3dBXS9GnvrphBYJCq2Qt98
 tS89MZVTRv9nuGAvE0mQuOmFgGKTqus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-WXdijM1NNzyif52AN86PEA-1; Tue, 02 Nov 2021 12:34:15 -0400
X-MC-Unique: WXdijM1NNzyif52AN86PEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C42C1806688;
 Tue,  2 Nov 2021 16:34:13 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7D9213ABD;
 Tue,  2 Nov 2021 16:33:43 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/qdev-monitor: fix use-after-free in qdev_set_id()
Date: Tue,  2 Nov 2021 16:33:42 +0000
Message-Id: <20211102163342.31162-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported by Coverity (CID 1465222).

Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd ("softmmu/qdev-monitor: add error handling in qdev_set_id")
Cc: Damien Hedde <damien.hedde@greensocs.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 softmmu/qdev-monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4851de51a5..06f86a1a96 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -581,8 +581,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp)
         if (prop) {
             dev->id = id;
         } else {
-            g_free(id);
             error_setg(errp, "Duplicate device ID '%s'", id);
+            g_free(id);
             return NULL;
         }
     } else {
-- 
2.31.1


