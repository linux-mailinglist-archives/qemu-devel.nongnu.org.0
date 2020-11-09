Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A52ABF08
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 15:43:44 +0100 (CET)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc8OV-0005Ko-H0
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 09:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kc8EQ-0004CB-Di
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kc8EO-0001ub-IS
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 09:33:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604932395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+zusEXJzWrjd2rJ1pg02yJMOnG8fetEgGuFkB7srYy8=;
 b=G6VgpcDaHAVZCMcO8h2OY5lVCAY4RNCDBKDidIGOxLl0buY21WiBZtAmchiHbl2mdq8S6F
 GJ0FYj5Sgoj/vB/qY2t3eQ7c7F2tAZBhOfV+G1V3Ype6lCbADKDUrlAjR8LFXP4IU7dcB1
 oRKP6HEUH84v6662nWab7qXAU9fkzMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-3aiz4PnhNeSnf596J-FAvw-1; Mon, 09 Nov 2020 09:33:14 -0500
X-MC-Unique: 3aiz4PnhNeSnf596J-FAvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D0A802B6A;
 Mon,  9 Nov 2020 14:33:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0893655766;
 Mon,  9 Nov 2020 14:33:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pvpanic: Advertise the PVPANIC_CRASHLOADED event support
Date: Mon,  9 Nov 2020 09:33:11 -0500
Message-Id: <20201109143311.1000958-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Advertise both types of events as supported when the guest OS
queries the pvpanic device.  Currently only PVPANIC_PANICKED is
exposed; PVPANIC_CRASHLOADED must also be advertised, but only on
new machine types.

Fixes: 7dc58deea79a ("pvpanic: implement crashloaded event handling")
Reported-by: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 1 +
 hw/misc/pvpanic.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 98b87f76cb..d0408049b5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "virtio-blk-device", "num-queues", "1"},
     { "virtio-scsi-device", "num_queues", "1"},
     { "nvme", "use-intel-id", "on"},
+    { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 598d5471a4..35d6797831 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -61,12 +61,14 @@ struct PVPanicState {
 
     MemoryRegion io;
     uint16_t ioport;
+    uint8_t events;
 };
 
 /* return supported events on read */
 static uint64_t pvpanic_ioport_read(void *opaque, hwaddr addr, unsigned size)
 {
-    return PVPANIC_PANICKED;
+    PVPanicState *pvp = opaque;
+    return pvp->events;
 }
 
 static void pvpanic_ioport_write(void *opaque, hwaddr addr, uint64_t val,
@@ -112,6 +114,7 @@ static void pvpanic_isa_realizefn(DeviceState *dev, Error **errp)
 
 static Property pvpanic_isa_properties[] = {
     DEFINE_PROP_UINT16(PVPANIC_IOPORT_PROP, PVPanicState, ioport, 0x505),
+    DEFINE_PROP_UINT8("events", PVPanicState, events, PVPANIC_PANICKED | PVPANIC_CRASHLOADED),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.2


