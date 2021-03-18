Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB8D33FD4F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 03:39:43 +0100 (CET)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMiZa-00008t-If
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 22:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMiYI-00081Q-Aa
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:38:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMiYE-0002iI-CN
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616035097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nhX9VdYigl43+pLGOk2y8Ded0VMBF7IzbzxBqIOaHHI=;
 b=L5h93k1WdwAfujZlDprzcYanqbLgTxX/G1TgD4wEDamWKUd40za+YsQZ0HAmsXUnPM0zlj
 QVQPbrhpoeBHG+geOQuI5vnYIHbtqp6kME+E9xkpG6hgI9zzHhR/fxuS5SJx9Nk/xBOQ66
 y2lRc1M0r9YCQGlb4oeAa69CK47KfMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-e7hs4fFdPxeflaQw7WZ27w-1; Wed, 17 Mar 2021 22:38:13 -0400
X-MC-Unique: e7hs4fFdPxeflaQw7WZ27w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 792F05B362;
 Thu, 18 Mar 2021 02:38:12 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-49.bne.redhat.com [10.64.54.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7541D5D9C0;
 Thu, 18 Mar 2021 02:38:05 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Disable pl011 clock migration if needed
Date: Thu, 18 Mar 2021 10:38:01 +0800
Message-Id: <20210318023801.18287-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, luc@lmichel.fr,
 ehabkost@redhat.com, qemu-devel@nongnu.org, shan.gavin@gmail.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A clock is added by commit aac63e0e6ea3 ("hw/char/pl011: add a clock
input") since v5.2.0 which corresponds to virt-5.2 machine type. It
causes backwards migration failure from upstream to downstream (v5.1.0)
when the machine type is specified with virt-5.1.

This fixes the issue by following instructions from section "Connecting
subsections to properties" in docs/devel/migration.rst. With this applied,
the PL011 clock is migrated based on the machine type.

   virt-5.2 or newer:  migration
   virt-5.1 or older:  non-migration

Cc: qemu-stable@nongnu.org # v5.2.0+
Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/char/pl011.c         | 9 +++++++++
 hw/core/machine.c       | 1 +
 include/hw/char/pl011.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c5621a195f..dc85527a5f 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -322,10 +322,18 @@ static const MemoryRegionOps pl011_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static bool pl011_clock_needed(void *opaque)
+{
+    PL011State *s = PL011(opaque);
+
+    return s->migrate_clk;
+}
+
 static const VMStateDescription vmstate_pl011_clock = {
     .name = "pl011/clock",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = pl011_clock_needed,
     .fields = (VMStateField[]) {
         VMSTATE_CLOCK(clk, PL011State),
         VMSTATE_END_OF_LIST()
@@ -363,6 +371,7 @@ static const VMStateDescription vmstate_pl011 = {
 
 static Property pl011_properties[] = {
     DEFINE_PROP_CHR("chardev", PL011State, chr),
+    DEFINE_PROP_BOOL("migrate-clk", PL011State, migrate_clk, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 257a664ea2..9935c6ddd5 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -52,6 +52,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "virtio-scsi-device", "num_queues", "1"},
     { "nvme", "use-intel-id", "on"},
     { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
+    { "pl011", "migrate-clk", "off" },
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 33e5e5317b..dc2c90eedc 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -50,6 +50,7 @@ struct PL011State {
     CharBackend chr;
     qemu_irq irq[6];
     Clock *clk;
+    bool migrate_clk;
     const unsigned char *id;
 };
 
-- 
2.23.0


