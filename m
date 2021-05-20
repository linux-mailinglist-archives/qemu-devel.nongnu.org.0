Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18DC389F62
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:00:20 +0200 (CEST)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdbP-0006QN-P7
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVI-0003iT-NA
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ljdVG-0006Sq-At
 for qemu-devel@nongnu.org; Thu, 20 May 2021 03:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTZrYZI5OEc+UDDYIdbtXn7J1mBo0UaAr0aBkY4zOTg=;
 b=Sp1B6xUqSF9K6HhuYPLC7UDxjRZ391tiXhPGrrt/+al07zYWfNfbVhr2kAYxC1ZEC5k+j2
 m0Iide1qMxorz/lk+A5inlHcUq1dF5D+ihY3CZiQMWG4tGmsZVwrteV0J9kSPCbff25IrV
 oO83F2001zm1NGUA76N+4KOz+IWm/GA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-U8ndOd2nMHaANiJLrWo68Q-1; Thu, 20 May 2021 03:53:56 -0400
X-MC-Unique: U8ndOd2nMHaANiJLrWo68Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 042711922978;
 Thu, 20 May 2021 07:53:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-52.ams2.redhat.com
 [10.36.113.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAFD2690F3;
 Thu, 20 May 2021 07:53:29 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 05/15] qemu-iotests: delay QMP socket timers
Date: Thu, 20 May 2021 09:52:26 +0200
Message-Id: <20210520075236.44723-6-eesposit@redhat.com>
In-Reply-To: <20210520075236.44723-1-eesposit@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attaching gdbserver implies that the qmp socket
should wait indefinitely for an answer from QEMU.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/iotests.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index d667fde6f8..cf1ca60376 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -478,11 +478,13 @@ def __init__(self, seconds, errmsg="Timeout"):
         self.seconds = seconds
         self.errmsg = errmsg
     def __enter__(self):
-        signal.signal(signal.SIGALRM, self.timeout)
-        signal.setitimer(signal.ITIMER_REAL, self.seconds)
+        if not qemu_gdb:
+            signal.signal(signal.SIGALRM, self.timeout)
+            signal.setitimer(signal.ITIMER_REAL, self.seconds)
         return self
     def __exit__(self, exc_type, value, traceback):
-        signal.setitimer(signal.ITIMER_REAL, 0)
+        if not qemu_gdb:
+            signal.setitimer(signal.ITIMER_REAL, 0)
         return False
     def timeout(self, signum, frame):
         raise Exception(self.errmsg)
@@ -576,7 +578,7 @@ class VM(qtest.QEMUQtestMachine):
 
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
-        timer = 15.0
+        timer = 15.0 if not qemu_gdb else None
         super().__init__(qemu_prog, qemu_opts, name=name,
                          test_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
-- 
2.30.2


