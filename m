Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AACE2D7DDE
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:17:02 +0100 (CET)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmyT-0000S9-7o
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knmHG-00019m-77
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:32:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knmHD-0002HX-4e
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:32:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cyLrsia+oS/cwPtJ6eBY9EomaVIVvbq6TnZJmQSdBbY=;
 b=Zq0bZJ7F+A47++S0jWA2lPxnmjwjS8+JDsBleIeMXv0j58lsoigyUqEXn7viJLviVrhKZf
 33SaMe0aVZZpMr3/vVA93RXjjaH7gYc4mlZWm4QdeKb1KkHKkVx6McTCe4CZPgAYxjq76k
 Xs84FaZ9vPEGYT6urXjcVo6Pe6WCZek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-pCI6GmNVMtKXFXfKYXtvRg-1; Fri, 11 Dec 2020 12:32:13 -0500
X-MC-Unique: pCI6GmNVMtKXFXfKYXtvRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFC8780F043;
 Fri, 11 Dec 2020 17:32:12 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10331100AE2C;
 Fri, 11 Dec 2020 17:31:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 3/3] tests/acceptance/machine_s390_ccw_virtio: Test the
 virtio-balloon device
Date: Fri, 11 Dec 2020 18:31:34 +0100
Message-Id: <20201211173134.376078-4-thuth@redhat.com>
In-Reply-To: <20201211173134.376078-1-thuth@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inflate the balloon and check whether the size of the memory changes.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index 7d0a78139b..81f6c066c7 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -70,7 +70,8 @@ class S390CCWVirtioMachine(Test):
                          '-device', 'zpci,uid=5,target=zzz',
                          '-device', 'virtio-net-pci,id=zzz',
                          '-device', 'zpci,uid=0xa,fid=12,target=serial',
-                         '-device', 'virtio-serial-pci,id=serial')
+                         '-device', 'virtio-serial-pci,id=serial',
+                         '-device', 'virtio-balloon-ccw')
         self.vm.launch()
 
         shell_ready = "sh: can't access tty; job control turned off"
@@ -140,3 +141,12 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                                           'ls /sys/bus/ccw/devices/0.0.4711',
                                           'No such file or directory')
+        # test the virtio-balloon device
+        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+                                          'MemTotal:         115640 kB')
+        self.vm.command('human-monitor-command', command_line='balloon 96')
+        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+                                          'MemTotal:          82872 kB')
+        self.vm.command('human-monitor-command', command_line='balloon 128')
+        exec_command_and_wait_for_pattern(self, 'head -n 1 /proc/meminfo',
+                                          'MemTotal:         115640 kB')
-- 
2.27.0


