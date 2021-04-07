Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8F356DE8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:53:35 +0200 (CEST)
Received: from localhost ([::1]:59858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8cg-000682-H9
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8a0-00042U-7N
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lU8Zy-0005xM-3N
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:50:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617803445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2c9PWoZBwanCg4kf5DFuJ5LneYnpo2h+kLaMIS52jQ8=;
 b=aMBdnk9bzbvXMP0iFsZ8JbEmz6YCwC5l5Xx8ma3cnl7CKLKCtKkJWRrzOuBREf0kc66G/k
 2apAkf5FhNrlUpr9MHMl9mchw3F4otdjHNpHGl760NXm61k2vXLmheVjjIrPEGXyoxlqi+
 czPoBmEzVrYu0GCkdm8oNwFjPae5190=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-3XCI6sjGN86o7kKuIR4OJA-1; Wed, 07 Apr 2021 09:50:43 -0400
X-MC-Unique: 3XCI6sjGN86o7kKuIR4OJA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8EEC6D255;
 Wed,  7 Apr 2021 13:50:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-163.ams2.redhat.com
 [10.36.115.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72B5959443;
 Wed,  7 Apr 2021 13:50:40 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH v2 04/11] qemu-iotests: delay QMP socket timers
Date: Wed,  7 Apr 2021 15:50:14 +0200
Message-Id: <20210407135021.48330-5-eesposit@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attaching a gdbserver implies that the qmp socket
should wait indefinitely for an answer from QEMU.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 python/qemu/machine.py        |  4 +++-
 tests/qemu-iotests/iotests.py | 21 +++++++++++++++++----
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 18d32ebe45..284b73385f 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -408,7 +408,9 @@ def _launch(self) -> None:
                                        stderr=subprocess.STDOUT,
                                        shell=False,
                                        close_fds=False)
-        self._post_launch()
+
+        timer = None if 'gdbserver' in self._wrapper else 15.0
+        self._post_launch(timer)
 
     def _early_cleanup(self) -> None:
         """
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 05d0dc0751..17f07710db 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -686,7 +686,10 @@ def qmp_to_opts(self, obj):
 
     def get_qmp_events_filtered(self, wait=60.0):
         result = []
-        for ev in self.get_qmp_events(wait=wait):
+        qmp_wait = wait
+        if qemu_gdb:
+            qmp_wait = 0.0
+        for ev in self.get_qmp_events(wait=qmp_wait):
             result.append(filter_qmp_event(ev))
         return result
 
@@ -987,13 +990,17 @@ def cancel_and_wait(self, drive='drive0', force=False,
         result = self.vm.qmp('block-job-cancel', device=drive, force=force)
         self.assert_qmp(result, 'return', {})
 
+        qmp_wait = wait
+        if qemu_gdb:
+            qmp_wait = 0.0
+
         if resume:
             self.vm.resume_drive(drive)
 
         cancelled = False
         result = None
         while not cancelled:
-            for event in self.vm.get_qmp_events(wait=wait):
+            for event in self.vm.get_qmp_events(wait=qmp_wait):
                 if event['event'] == 'BLOCK_JOB_COMPLETED' or \
                    event['event'] == 'BLOCK_JOB_CANCELLED':
                     self.assert_qmp(event, 'data/device', drive)
@@ -1009,8 +1016,11 @@ def cancel_and_wait(self, drive='drive0', force=False,
     def wait_until_completed(self, drive='drive0', check_offset=True,
                              wait=60.0, error=None):
         '''Wait for a block job to finish, returning the event'''
+        qmp_wait = wait
+        if qemu_gdb:
+            qmp_wait = 0.0
         while True:
-            for event in self.vm.get_qmp_events(wait=wait):
+            for event in self.vm.get_qmp_events(wait=qmp_wait):
                 if event['event'] == 'BLOCK_JOB_COMPLETED':
                     self.assert_qmp(event, 'data/device', drive)
                     if error is None:
@@ -1054,7 +1064,10 @@ def complete_and_wait(self, drive='drive0', wait_ready=True,
         self.assertTrue(event['data']['type'] in ['mirror', 'commit'])
 
     def pause_wait(self, job_id='job0'):
-        with Timeout(3, "Timeout waiting for job to pause"):
+        def_timeout = 3
+        if qemu_gdb:
+            def_timeout = 3000
+        with Timeout(def_timeout, "Timeout waiting for job to pause"):
             while True:
                 result = self.vm.qmp('query-block-jobs')
                 found = False
-- 
2.30.2


