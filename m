Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB32CEDE7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:17:35 +0100 (CET)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klA1m-0000xz-AF
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl9zP-000807-RC
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:15:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kl9zM-0001gR-Do
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607084100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zpn/AD6ofiGbbKIx1crY5FBSvUPPx7h8zljMPbTUlyU=;
 b=Fknmw2yZEUkOzAczuc7VWbJfUEzUr/gXkLVqpdQGDj7Uh17t8RZimeEotURqodV18ySwh6
 vHSR3ey2+VoQvhOEV21jS16QgboTZNiCDGQ10r+b0mSNUJwmVYrwy96MS0Fhc6e3Ec3r/7
 aZi87qMgUJ+HXabKh4HgGre3eKzMm1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-BAtFafc3O22so9tXH5n0FQ-1; Fri, 04 Dec 2020 07:14:59 -0500
X-MC-Unique: BAtFafc3O22so9tXH5n0FQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF14A190B2A8;
 Fri,  4 Dec 2020 12:14:57 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4E0E60C15;
 Fri,  4 Dec 2020 12:14:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: test hot(un)plug of ccw devices
Date: Fri,  4 Dec 2020 13:14:50 +0100
Message-Id: <20201204121450.120730-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hotplug a virtio-net-ccw device, and then hotunplug it again.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

v1->v2:
- switch device id
- clear out dmesg before looking for CRW messages

---
 tests/acceptance/machine_s390_ccw_virtio.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 53b8484f8f9c..83c00190621b 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -97,3 +97,19 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                                           'cat /sys/bus/pci/devices/000a\:00\:00.0/function_id',
                                           '0x0000000c')
+        # add another device
+        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
+        self.vm.command('device_add', driver='virtio-net-ccw',
+                        devno='fe.0.4711', id='net_4711')
+        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
+        exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
+                                          '0.0.4711')
+        # and detach it again
+        exec_command_and_wait_for_pattern(self, 'dmesg -c', ' ')
+        self.vm.command('device_del', id='net_4711')
+        self.vm.event_wait(name='DEVICE_DELETED',
+                           match={'data': {'device': 'net_4711'}})
+        exec_command_and_wait_for_pattern(self, 'dmesg', 'CRW')
+        exec_command_and_wait_for_pattern(self,
+                                          'ls /sys/bus/ccw/devices/0.0.4711',
+                                          'No such file or directory')
-- 
2.26.2


