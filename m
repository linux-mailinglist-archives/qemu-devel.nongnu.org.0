Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6225B356DE9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:53:38 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8cj-0006FE-7a
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zy-0003xD-9w
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zv-0005ur-K1
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rZb60AHYAxc2t644nFRKZffZboFDS8lZKfZBIUYO0sA=;
 b=SYfhLOKGyQtmgiyQY+CG8NqGAIlR2FMUsjbj+S6Davmt7tm2UZtAw9/zrVLH4om4lJvgAb
 ey50b174BxWlUJTW1Av+w6d80V0XlJA6uQRedCUmTV/38WZ6awNILgHhobIo+YeyEKbO3q
 9e8o/0bEU7AtIDz9iXYt3UMSRgAxuoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-2E8Yv19uOOy1etJCwH9IjA-1; Wed, 07 Apr 2021 09:50:38 -0400
X-MC-Unique: 2E8Yv19uOOy1etJCwH9IjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AC93100806B;
 Wed,  7 Apr 2021 13:50:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A96981964B;
 Wed,  7 Apr 2021 13:50:34 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 02/11] python: qemu: pass the wrapper field from
 QEMUQtestmachine to QEMUMachine
Date: Wed,  7 Apr 2021 15:50:12 +0200
Message-Id: <20210407135021.48330-3-eesposit@redhat.com>
In-Reply-To: <20210407135021.48330-1-eesposit@redhat.com>
References: <20210407135021.48330-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py | 2 +-
 python/qemu/qtest.py   | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index c721e07d63..18d32ebe45 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -109,7 +109,7 @@ def __init__(self,
 
         self._binary = binary
         self._args = list(args)
-        self._wrapper = wrapper
+        self._wrapper = list(wrapper)
 
         self._name = name or "qemu-%d" % os.getpid()
         self._test_dir = test_dir
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 0d01715086..4c90daf430 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -111,6 +111,7 @@ class QEMUQtestMachine(QEMUMachine):
     def __init__(self,
                  binary: str,
                  args: Sequence[str] = (),
+                 wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  test_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
@@ -119,7 +120,8 @@ def __init__(self,
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
             sock_dir = test_dir
-        super().__init__(binary, args, name=name, test_dir=test_dir,
+        super().__init__(binary, args, wrapper=wrapper, name=name,
+                         test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
         self._qtest: Optional[QEMUQtestProtocol] = None
-- 
2.30.2


