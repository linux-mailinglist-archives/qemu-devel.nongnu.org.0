Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9300A2DB3E3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:41:53 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFGi-0001N1-KA
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:41:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBw-0005qI-9X
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpFBt-0006wD-J2
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 13:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608057411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4CVS5MpSuf5AEUcOlwJMRau5h1FKO/3iViv56nhLIM=;
 b=K5xtY1h/z/R+PhfCGi3DA0wT4MjmVichq6L0K3RCaogt4wRbF7tkSYp2KfJfhAyNTA17SI
 oq27ts5WRsCVJe242r3xbmP7PdlukcRapY7ePfcaD6ouj+lf0dw7aDNwUSzm+baPNP7YDI
 LH2gY/g1ITPgTuKW5nxbOJ1+pF95fiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-FMdg7Kg8NairatJiz6cVJg-1; Tue, 15 Dec 2020 13:36:50 -0500
X-MC-Unique: FMdg7Kg8NairatJiz6cVJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EED5803F41;
 Tue, 15 Dec 2020 18:36:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-194.ams2.redhat.com [10.36.112.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2923760917;
 Tue, 15 Dec 2020 18:36:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 3/3] tests/acceptance: Test the virtio-balloon device on
 s390x
Date: Tue, 15 Dec 2020 19:36:23 +0100
Message-Id: <20201215183623.110128-4-thuth@redhat.com>
In-Reply-To: <20201215183623.110128-1-thuth@redhat.com>
References: <20201215183623.110128-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inflate the balloon and check whether the size of the memory changes.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index e1ad0e29b0..abe25a08f0 100644
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


