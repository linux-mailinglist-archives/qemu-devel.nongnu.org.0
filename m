Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89912D2B0E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:32:44 +0100 (CET)
Received: from localhost ([::1]:52654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcAe-00075v-08
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmc71-0004fL-8s
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:28:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmc6x-0007iQ-2x
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607430534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r7bBCegatqv6DyfcvEj0/hVji7V2Jc0fmO15y5axJgE=;
 b=UehOJcVBS31WXu0lJdkLl6GrHIGZ9GFr4ma6Tp2gXdn58fy9AGaRm/mMlpeOrUxbFkO+TX
 Dow2LrHVHvcCy/hkZDXD8mU6ZE7eH61wT8mBf91yAdN/8C93XkbacSVBlme4HS1hCgx9ZQ
 /DmgPMj0rab8pgHrLjFv2KSSnptbiQI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-PimWYkHAP3SFP0zlrLI2Yw-1; Tue, 08 Dec 2020 07:28:52 -0500
X-MC-Unique: PimWYkHAP3SFP0zlrLI2Yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C30A6801B12;
 Tue,  8 Dec 2020 12:28:51 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-5.ams2.redhat.com [10.36.113.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D34260636;
 Tue,  8 Dec 2020 12:28:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
Date: Tue,  8 Dec 2020 13:28:43 +0100
Message-Id: <20201208122843.147186-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hotplug a virtio-net-ccw device, and then hotunplug it again.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
v2->v3:
- do the dmesg cleanout and waiting for messages properly [Thomas]

Wainer: I dropped your r-b, as there had been too many changes for
        me to be comfortable with retaining it

---
 tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 81d14088818c..864ef4ee6e9b 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -99,3 +99,27 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                         'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
                         '0x0000000c')
+        # add another device
+        exec_command_and_wait_for_pattern(self,
+                                    'dmesg -c > /dev/null; echo dm_clear\ 1',
+                                    'dm_clear 1')
+        self.vm.command('device_add', driver='virtio-net-ccw',
+                        devno='fe.0.4711', id='net_4711')
+        exec_command_and_wait_for_pattern(self,
+                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
+                        'CRW reports')
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
+                                          '0.0.4711')
+        # and detach it again
+        exec_command_and_wait_for_pattern(self,
+                                    'dmesg -c > /dev/null; echo dm_clear\ 2',
+                                    'dm_clear 2')
+        self.vm.command('device_del', id='net_4711')
+        self.vm.event_wait(name='DEVICE_DELETED',
+                           match={'data': {'device': 'net_4711'}})
+        exec_command_and_wait_for_pattern(self,
+                        'while ! (dmesg -c | grep CRW) ; do sleep 1 ; done',
+                        'CRW reports')
+        exec_command_and_wait_for_pattern(self,
+                                          'ls /sys/bus/ccw/devices/0.0.4711',
+                                          'No such file or directory')
-- 
2.26.2


