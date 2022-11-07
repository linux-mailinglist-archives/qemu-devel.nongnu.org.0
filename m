Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B5861F8B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 17:15:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os4lQ-0006ie-CG; Mon, 07 Nov 2022 11:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org>)
 id 1os4lK-0006gP-Do; Mon, 07 Nov 2022 11:14:15 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org>)
 id 1os4lI-0003f7-2S; Mon, 07 Nov 2022 11:14:13 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4N5brp443Rz4xwy;
 Tue,  8 Nov 2022 03:14:02 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4N5brm1zsTz4x1G;
 Tue,  8 Nov 2022 03:14:00 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH for 7.2 2/2] s390x/s390-virtio-ccw: Switch off zPCI
 enhancements on older machines
Date: Mon,  7 Nov 2022 17:13:49 +0100
Message-Id: <20221107161349.1032730-3-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107161349.1032730-1-clg@kaod.org>
References: <20221107161349.1032730-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Ye/0=3H=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Cédric Le Goater <clg@redhat.com>

zPCI enhancement features (interpretation and forward assist) were
recently introduced to improve performance on PCI passthrough devices.
To maintain the same behaviour on older Z machines, deactivate the
features with the associated properties.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index bb98d40792..7d80bc1837 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -844,9 +844,14 @@ static void ccw_machine_7_1_instance_options(MachineState *machine)
 static void ccw_machine_7_1_class_options(MachineClass *mc)
 {
     S390CcwMachineClass *s390mc = S390_CCW_MACHINE_CLASS(mc);
+    static GlobalProperty compat[] = {
+        { TYPE_S390_PCI_DEVICE, "interpret", "off", },
+        { TYPE_S390_PCI_DEVICE, "forwarding-assist", "off", },
+    };
 
     ccw_machine_7_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
+    compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
     s390mc->max_threads = S390_MAX_CPUS;
 }
 DEFINE_CCW_MACHINE(7_1, "7.1", false);
-- 
2.38.1


