Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADEA2C8C29
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:07:49 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnaW-0004SC-Dq
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVY-0008EQ-Nd
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kjnVT-0007WT-JO
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606759354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Koj10X8OEKGbUD/qoTfB9mTKYbuXOXBfjkkStsf9BQY=;
 b=iULz0F/GvQeUBNy1PA5GEBHiBgkmy6D81iJNxWLNRpwDhDZgZ3wpvZgvLe7ryOiYtE/xJM
 YJZGOl2+FZZKmkGraF+JDbNEU53Q9XrDAIYOfRKHhfyIxwrzT0XeFzzvYJQZUzj9INMzn+
 4N6FitXx3M5QrKQqyQjzEawS8fmFAg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-Hs3Vld8uMBeABDSml8WnyQ-1; Mon, 30 Nov 2020 13:02:30 -0500
X-MC-Unique: Hs3Vld8uMBeABDSml8WnyQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39F8A180A08A;
 Mon, 30 Nov 2020 18:02:29 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-87.ams2.redhat.com [10.36.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C8E19D7D;
 Mon, 30 Nov 2020 18:02:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] tests/acceptance: verify s390x device detection
Date: Mon, 30 Nov 2020 19:02:15 +0100
Message-Id: <20201130180216.15366-3-cohuck@redhat.com>
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

The kernel/initrd combination does not provide the virtio-net
driver; therefore, simply check whether the presented device type
is indeed virtio-net for the two virtio-net-{ccw,pci} devices.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 683b6e0dac2e..e203ee304264 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -80,3 +80,14 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                                           'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
                                           virtio_rng_features)
+        # verify that we indeed have virtio-net devices (without having the
+        # virtio-net driver handy)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/ccw/devices/0.1.1111/cutype',
+                                          '3832/01')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_vendor',
+                                          '0x1af4')
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
+                                          '0x0001')
-- 
2.26.2


