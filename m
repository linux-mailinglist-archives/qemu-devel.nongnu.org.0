Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ABC2D75A7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:32:51 +0100 (CET)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhbO-0000W7-TD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW5-0004Vr-Om
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW2-000118-GO
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLBFvgJC9xt41z9+1XVYcfaLfSXruK2BZzPfCAy1Hxw=;
 b=VUM73ak0mN+daz8mUnpCrkWULaftvYbfnf4rd7UMVyuWVT5oSUNdEDKBxdF3m+7UfTyAzC
 oQzLblte1XdL2pVvnU4AjvpoWdkClPAgcAe+hHcSod8/oeGeI+TbPDPqbC5WpL0OKj5iAV
 Xt+AfprqwfLLVnwcUE7TQl8DWGexjQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-md68Xn_VNF6IirH1hot-ag-1; Fri, 11 Dec 2020 07:27:12 -0500
X-MC-Unique: md68Xn_VNF6IirH1hot-ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEA7DEC1AE;
 Fri, 11 Dec 2020 12:27:10 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5533F1002393;
 Fri, 11 Dec 2020 12:27:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] tests/acceptance: test virtio-ccw revision handling
Date: Fri, 11 Dec 2020 13:26:55 +0100
Message-Id: <20201211122658.24481-4-cohuck@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The max_revision prop of virtio-ccw devices can be used to force
an older revision for compatibility handling. The easiest way to
check this is to force a device to revision 0, which turns off
virtio-1.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
[re-formatted overlong lines]
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201130180216.15366-2-cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index db6352c44434..c6812719728a 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -51,6 +51,10 @@ class S390CCWVirtioMachine(Test):
                          '-initrd', initrd_path,
                          '-append', kernel_command_line,
                          '-device', 'virtio-net-ccw,devno=fe.1.1111',
+                         '-device',
+                         'virtio-rng-ccw,devno=fe.2.0000,max_revision=0',
+                         '-device',
+                         'virtio-rng-ccw,devno=fe.3.1234,max_revision=2',
                          '-device', 'zpci,uid=5,target=zzz',
                          '-device', 'virtio-net-pci,id=zzz')
         self.vm.launch()
@@ -60,9 +64,21 @@ class S390CCWVirtioMachine(Test):
         # first debug shell is too early, we need to wait for device detection
         exec_command_and_wait_for_pattern(self, 'exit', shell_ready)
 
-        ccw_bus_id="0.1.1111"
+        ccw_bus_ids="0.1.1111  0.2.0000  0.3.1234"
         pci_bus_id="0005:00:00.0"
         exec_command_and_wait_for_pattern(self, 'ls /sys/bus/ccw/devices/',
-                                          ccw_bus_id)
+                                          ccw_bus_ids)
         exec_command_and_wait_for_pattern(self, 'ls /sys/bus/pci/devices/',
                                           pci_bus_id)
+        # check that the device at 0.2.0000 is in legacy mode, while the
+        # device at 0.3.1234 has the virtio-1 feature bit set
+        virtio_rng_features="00000000000000000000000000001100" + \
+                            "10000000000000000000000000000000"
+        virtio_rng_features_legacy="00000000000000000000000000001100" + \
+                                   "00000000000000000000000000000000"
+        exec_command_and_wait_for_pattern(self,
+                        'cat /sys/bus/ccw/devices/0.2.0000/virtio?/features',
+                        virtio_rng_features_legacy)
+        exec_command_and_wait_for_pattern(self,
+                        'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
+                        virtio_rng_features)
-- 
2.26.2


