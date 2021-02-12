Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FC831A5F7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:22:45 +0100 (CET)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAexg-00026n-Hf
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAers-0004PD-4D
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAerm-0003uq-6k
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613160997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIzr8nXRIKi0EILV8SDh80H5EorCfDfjVu/pg/m5BxY=;
 b=eiMqXMd1aZpOkk3G98adu1yJQxXxNTJN4l9ZxFZJvQT9FUwXV0u0qancwOUeXA6LT2PnIZ
 Heplpqh25HE7b7Ft4Sn/3M382iyFu1b8qPrA661ZB0lruX3qbRfebnWGwYviQs7TRJlPIT
 Qp4I4EcPb5I9w5t5y9kt4sfU+pJZwws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-6MIn6VZUPK-cGh-1Q2k9vQ-1; Fri, 12 Feb 2021 15:16:35 -0500
X-MC-Unique: 6MIn6VZUPK-cGh-1Q2k9vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47106801977;
 Fri, 12 Feb 2021 20:16:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF38B6E528;
 Fri, 12 Feb 2021 20:16:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/14] iotests.py: qemu_nbd_popen: remove pid file after use
Date: Fri, 12 Feb 2021 14:16:16 -0600
Message-Id: <20210212201619.1388255-12-eblake@redhat.com>
In-Reply-To: <20210212201619.1388255-1-eblake@redhat.com>
References: <20210212201619.1388255-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To not interfere with other qemu_nbd_popen() calls in same test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210205163720.887197-8-vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/iotests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 00be68eca3e2..4e758308f247 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -296,7 +296,9 @@ def qemu_nbd_list_log(*args: str) -> str:
 @contextmanager
 def qemu_nbd_popen(*args):
     '''Context manager running qemu-nbd within the context'''
-    pid_file = file_path("pid")
+    pid_file = file_path("qemu_nbd_popen-nbd-pid-file")
+
+    assert not os.path.exists(pid_file)

     cmd = list(qemu_nbd_args)
     cmd.extend(('--persistent', '--pid-file', pid_file))
@@ -314,6 +316,8 @@ def qemu_nbd_popen(*args):
             time.sleep(0.01)
         yield
     finally:
+        if os.path.exists(pid_file):
+            os.remove(pid_file)
         log('Kill NBD server')
         p.kill()
         p.wait()
-- 
2.30.1


