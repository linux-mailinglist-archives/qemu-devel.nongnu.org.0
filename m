Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41E2E08FA
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 11:52:23 +0100 (CET)
Received: from localhost ([::1]:42188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfHC-0005Z9-HR
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 05:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAW-0004zx-M4
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1krfAU-00077v-SB
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 05:45:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608633926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKIO+s063ISszZzJBJE9O/xhtzA7sPU6f8fVbfIOJbs=;
 b=bh5RNAIZCTrnnBpx5728qc/DX4vD+q+u3Snsv9LOunibDWH95vsYseWd6WZ5ecETb3lamJ
 Z4xsRhYunk0dcUcwbt697/ACk54ZPkce45ZLHXJm6grsV+FbCvrPPdVoUa4VnJqm60zvZS
 XogNKkg4CxfjnSlpt8yk2sbc1mNesIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-3tb5qEoAOfqRDaI3xsvcOQ-1; Tue, 22 Dec 2020 05:45:22 -0500
X-MC-Unique: 3tb5qEoAOfqRDaI3xsvcOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC42190A7B4;
 Tue, 22 Dec 2020 10:45:21 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-192.ams2.redhat.com
 [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2B97B138;
 Tue, 22 Dec 2020 10:45:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/14] tests/acceptance: test hot(un)plug of ccw devices
Date: Tue, 22 Dec 2020 11:44:57 +0100
Message-Id: <20201222104503.224510-9-cohuck@redhat.com>
In-Reply-To: <20201222104503.224510-1-cohuck@redhat.com>
References: <20201222104503.224510-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hotplug a virtio-net-ccw device, and then hotunplug it again.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201208122843.147186-1-cohuck@redhat.com>
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


