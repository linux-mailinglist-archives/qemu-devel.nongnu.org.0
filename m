Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D03E2D75AA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:34:14 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhcj-0002I3-8H
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW8-0004d5-8B
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW3-000127-W2
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53oWCkCZsyn7z/B1gtxMAV0wIeH3WpsP8vuC3tAiDAo=;
 b=Clfc0ZCQDi2YSZLamu6QO3Q48Kan3+MKEm1HJ65Liie/KJ4lwuYXXrNs3dhSO/723kH1vl
 gz2+K6dAnL3zWw/2GjVrCRSIbMUeRvOhAbr5RI9jA8Yqx4QVwBITcIYj+Hua1js4CQXzyy
 gM93zjrSE2xD6loT7Db1e4tU6OE5Cvs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-QprlYd2ROUGR8fcxJYCNvA-1; Fri, 11 Dec 2020 07:27:15 -0500
X-MC-Unique: QprlYd2ROUGR8fcxJYCNvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50FF48030AC;
 Fri, 11 Dec 2020 12:27:14 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D97B710016F7;
 Fri, 11 Dec 2020 12:27:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/6] tests/acceptance: test s390x zpci fid propagation
Date: Fri, 11 Dec 2020 13:26:57 +0100
Message-Id: <20201211122658.24481-6-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
References: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Verify that a fid specified on the command line shows up correctly
as the function_id in the guest.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
[re-formatted overlong lines]
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201130180216.15366-4-cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index ebea1b755c81..81d14088818c 100644
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
         virtio_rng_features="00000000000000000000000000001100" + \
@@ -93,3 +95,7 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                     'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
                     '0x0001')
+        # check fid propagation
+        exec_command_and_wait_for_pattern(self,
+                        'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
+                        '0x0000000c')
-- 
2.26.2


