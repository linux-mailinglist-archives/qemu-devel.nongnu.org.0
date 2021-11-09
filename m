Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF7D44AA62
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 10:15:49 +0100 (CET)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkNEK-00030y-Be
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 04:15:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBi-00076E-Cd; Tue, 09 Nov 2021 04:13:07 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:50001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mkNBa-00058k-Tj; Tue, 09 Nov 2021 04:13:05 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MMX9b-1n2ro346op-00JX6v; Tue, 09
 Nov 2021 10:12:53 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] tests/qtest/virtio-net: fix hotplug test case
Date: Tue,  9 Nov 2021 10:12:37 +0100
Message-Id: <20211109091238.817997-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211109091238.817997-1-laurent@vivier.eu>
References: <20211109091238.817997-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:s7G/o5rG6ME0gS7ziVPIsjhiZtcvJRxLpWUZbJXdC4uEx7OBoSe
 i7kq4txyxyQwwE5vojTBV8SbobL50Bj+2GISlfMnGftehK5D9F/hp+VppxmFGhKqKnUBbMt
 DUyXyFTIlK5ZIf7aGxN+72Ry2Tv/XNy7eIbtvqOIbM/bcO9PsJVi37fgGQuwqcoh/YtDjeq
 tzOszhPDHuo4i/3k6GrCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iK+nkuISu8U=:Wskyrunjxzy9+8LGEtdgSh
 F2dQbdKUMTb5gQ7044Sj5KFJ7cNI3EWsr3DZCcNnwJ2zQl69Dv6oyPO/BWGOBoWCcoYCjKyzT
 k5LPMwtoFic54zRZ6atWTbInxQSaO9g3Kuav55HZU5RBniTnUGtrr7+33Y9YOVfAOVG2wE2xA
 IHu+89Zukh8NQZ8NlsVEC02ziaE7UGlC4tbqx370wRoImkJItH5Zpp6/YgCFFgh64rluJ3Gq5
 5TuGDSwGcve/Vh1PnzZ3F9lSxGgn+t4Tlh4KZ6IADaQpMBY7RNaQbEeV6f7Q6R0ir9SskF2t3
 visjZuP7YUPVs/mDP2Gz+n20AQDmD+Z7JxqvGdAIB13KVo4+dIF0tlH2q4meVYdNS1eDVCkD3
 xPrcTv1VTXnaNtmrNRkty6wcLz5Ih4wmRsOtxP0iUjeHKEECRM8fzNFIrD/Nx3hkwRu6kZCHz
 EHuv3DPoxL8XGggOyghhqvt7hoY9pij5rZg0SZSBEJW4TYwZwusaY1jQeonOiHnOsRvEQgsd3
 qmbwLjsTIlTtcjIAM9ih3WWLnGnXWlYm1LmuYorzM1nRcfYFmRYVQAx/nd185Am/zdp0OiZyf
 jOYHeo7e+Vj9Lg7PQNYdy1nbkuUQEUcp25SMHh/jH8jcwXrpixj/KO2SnLiozybZEP9lV0J02
 TKs3IbGDWbZEt0LcO/LgIpjn0Kp6Oh8WrdggmONj/02WahSudrDZ5qPhZ0WGCq43fLvo=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

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
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211028173014.139692-1-lvivier@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
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


