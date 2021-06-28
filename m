Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212F63B5E22
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:37:53 +0200 (CEST)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqWO-0007c0-5L
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQw-0006q9-IG
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lxqQt-00038u-MD
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624883531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1L85CoB3wjKLuJXGJDskreXoSJA102S4oaPkBn+fYw=;
 b=BWmkLuaEHUuGaMwgvKMPxV0+BkG5zYppshbV2BEb7ZCNFKhHoLEe/OAqvCErArfKzk66cT
 n16hGq5r+tzOP5jkHrwTKsNKr2g/4DFgF7h3hetBHr16g/9wjTKfgcvNbTAX7DEgDXfPMa
 H9PbNX7PwK9NNaQiaBkxJWB2qRKv0QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-7Y5hqVKAMZiClVBvr-BmQA-1; Mon, 28 Jun 2021 08:32:09 -0400
X-MC-Unique: 7Y5hqVKAMZiClVBvr-BmQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D72F19611A7;
 Mon, 28 Jun 2021 12:32:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-69.ams2.redhat.com
 [10.36.114.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB2FA46;
 Mon, 28 Jun 2021 12:31:59 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 03/16] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
Date: Mon, 28 Jun 2021 14:31:37 +0200
Message-Id: <20210628123150.56567-4-eesposit@redhat.com>
In-Reply-To: <20210628123150.56567-1-eesposit@redhat.com>
References: <20210628123150.56567-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 python/qemu/machine/qtest.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 33a86a9d69..dc2b5ccfb1 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -112,6 +112,7 @@ class QEMUQtestMachine(QEMUMachine):
     def __init__(self,
                  binary: str,
                  args: Sequence[str] = (),
+                 wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
@@ -121,7 +122,8 @@ def __init__(self,
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = base_temp_dir
-        super().__init__(binary, args, name=name, base_temp_dir=base_temp_dir,
+        super().__init__(binary, args, wrapper=wrapper, name=name,
+                         base_temp_dir=base_temp_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
-- 
2.31.1


