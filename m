Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45222C8BF8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:03:57 +0100 (CET)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnWm-0000s8-Ux
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVY-0008EN-F8
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVT-0007WU-9H
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606759354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2eud7xxytAY9EEZGN8wvqAsEJjJuurmnuwG2Y6YteM=;
 b=Errg6atrOn9tsLma9kw5xu8S/ucPdbEOY5mtr2c1UmpADsMgjLpwSVy+DYosVyAe5fqMvP
 uxYKAflY5aiSdsGuN9lp6p1+pHEk64N8CTJpIFN2XRKh+tpLSFLyZ/qtV5r6Ge6mx1lrjv
 0gCCyc1xzsdpnPiy1pLObNBHsoUgars=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-xt3hCpJQO6O6xL7GKhpayA-1; Mon, 30 Nov 2020 13:02:32 -0500
X-MC-Unique: xt3hCpJQO6O6xL7GKhpayA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69B49817B89;
 Mon, 30 Nov 2020 18:02:31 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87BEF19C71;
 Mon, 30 Nov 2020 18:02:29 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tests/acceptance: test s390x zpci fid propagation
Date: Mon, 30 Nov 2020 19:02:16 +0100
Message-Id: <20201130180216.15366-4-cohuck@redhat.com>
In-Reply-To: <20201130180216.15366-1-cohuck@redhat.com>
References: <20201130180216.15366-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that a fid specified on the command line shows up correctly
as the function_id in the guest.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index e203ee304264..53b8484f8f9c 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -56,7 +56,9 @@ class S390CCWVirtioMachine(Test):
                          '-device',
                          'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
                          '-device', 'zpci,uid=5,target=zzz',
-                         '-device', 'virtio-net-pci,id=zzz')
+                         '-device', 'virtio-net-pci,id=zzz',
+                         '-device', 'zpci,uid=0xa,fid=12,target=serial',
+                         '-device', 'virtio-serial-pci,id=serial')
         self.vm.launch()
 
         shell_ready = "sh: can't access tty; job control turned off"
@@ -65,11 +67,11 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
 
         ccw_bus_ids="0.1.1111  0.2.0000  0.3.1234"
-        pci_bus_id="0005:00:00.0"
+        pci_bus_ids="0005:00:00.0  000a:00:00.0"
         exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
                                           ccw_bus_ids)
         exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
-                                          pci_bus_id)
+                                          pci_bus_ids)
         # check that the device at 0.2.0000 is in legacy mode, while the
         # device at 0.3.1234 has the virtio-1 feature bit set
         virtio_rng_features="0000000000000000000000000000110010000000000000000000000000000000"
@@ -91,3 +93,7 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                                           'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
                                           '0x0001')
+        # check fid propagation
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
+                                          '0x0000000c')
-- 
2.26.2


