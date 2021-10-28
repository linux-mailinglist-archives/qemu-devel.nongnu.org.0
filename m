Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1831043E769
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 19:36:38 +0200 (CEST)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg9KN-00059Z-Pk
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 13:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mg9EW-00083d-4C
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:30:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mg9ER-00038Y-NB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 13:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635442225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yllTqIr7ny7Dtbb3CZ4A8F8YJOW4rkVzId59YvDqbfg=;
 b=ZsrG0rMPJ36/xioa2/CWYmSz6qiNsD4XSwm9rJmuFtNWVpRVo6twjH+Z7tGcpuYownPHck
 wnQTVmfAP8BxzxSgbr5qdOYYgqg5qRgmvBdj05iw7Rt7U4mHuT4N2aNDVj+QBySlHNVANN
 WfWZOfUROsMC8XhYNToDBjaw1+N3hzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-BGttddBAPy-7Y1qPG1n3kQ-1; Thu, 28 Oct 2021 13:30:24 -0400
X-MC-Unique: BGttddBAPy-7Y1qPG1n3kQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69606101F001
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 17:30:23 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87DB670F68;
 Thu, 28 Oct 2021 17:30:15 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/virtio-net: fix hotplug test case
Date: Thu, 28 Oct 2021 19:30:14 +0200
Message-Id: <20211028173014.139692-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-net-test has an hotplug testcase that is never executed.

This is because the testcase is attached to virtio-pci interface
rather than to virtio-net-pci.

  $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
  /x86_64/.../pci-ohci-tests/ohci_pci-test-hotplug
  /x86_64/.../e1000e/e1000e-tests/hotplug
  /x86_64/.../virtio-blk-pci/virtio-blk-pci-tests/hotplug
  /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
  /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
  /x86_64/.../virtio-scsi/virtio-scsi-tests/hotplug
  /x86_64/.../virtio-serial/virtio-serial-tests/hotplug

With this fix:

  $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -l | grep hotplug
  ...
  /x86_64/.../vhost-user-blk-pci/vhost-user-blk-pci-tests/hotplug
  /x86_64/.../virtio-net-pci/virtio-net-pci-tests/hotplug
  /x86_64/.../virtio-rng-pci/virtio-rng-pci-tests/hotplug
  ...
  $ QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test -p /x86_64/.../virtio-net-pci-tests/hotplug
  /x86_64/pc/i440FX-pcihost/pci-bus-pc/pci-bus/virtio-net-pci/virtio-net-pci-tests/hotplug: OK

Fixes: 6ae333f91b99 ("qos-test: virtio-net test node")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/qtest/virtio-net-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index a08e2ffe123f..8bf74e516cce 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -319,7 +319,7 @@ static void register_virtio_net_test(void)
         .before = virtio_net_test_setup,
     };
 
-    qos_add_test("hotplug", "virtio-pci", hotplug, &opts);
+    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
 #ifndef _WIN32
     qos_add_test("basic", "virtio-net", send_recv_test, &opts);
     qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
-- 
2.31.1


