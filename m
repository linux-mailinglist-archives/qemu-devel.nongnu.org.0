Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF0E2CD411
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:56:07 +0100 (CET)
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkmHO-0005Pq-TG
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmG0-0003kL-QR
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kkmFy-0001yn-Hr
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606992877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tzo4byu/P3HQv23ZRdeNaS5iuj9feNavS1qwYqvn8rg=;
 b=XF2gBRZ6FQgUFKPO+T9YWLOeArkjjs3f1eAZZzxqxTT5fkcgbw8mAXi/hMyMXqC33jxcpQ
 vYhwz8jkrnDaHXPvuLISsoKoP1gZaUNi8Bq9mDJ/NKbvq+JcITLGB4yrrhwAde8E7Cyqpl
 FQ7dG6Z6w2BApgZLgxEbxpTJ58QLZMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-U3J4DpC8Mi6UJtyTTi6JuA-1; Thu, 03 Dec 2020 05:54:35 -0500
X-MC-Unique: U3J4DpC8Mi6UJtyTTi6JuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61CD01006C85;
 Thu,  3 Dec 2020 10:54:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34A825C1BD;
 Thu,  3 Dec 2020 10:54:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7E9D39D99; Thu,  3 Dec 2020 11:54:23 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/12] microvm: make number of virtio transports runtime
 changeable
Date: Thu,  3 Dec 2020 11:54:15 +0100
Message-Id: <20201203105423.10431-5-kraxel@redhat.com>
In-Reply-To: <20201203105423.10431-1-kraxel@redhat.com>
References: <20201203105423.10431-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow to increase the number of transports in
case we have enough irq lines available for them all.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h | 2 +-
 hw/i386/microvm.c         | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 0fc216007777..c5d60bacb5e8 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -52,7 +52,6 @@
 
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
-#define VIRTIO_NUM_TRANSPORTS 8
 #define VIRTIO_CMDLINE_MAXLEN 64
 
 #define GED_MMIO_BASE         0xfea00000
@@ -98,6 +97,7 @@ struct MicrovmMachineState {
 
     /* Machine state */
     uint32_t virtio_irq_base;
+    uint32_t virtio_num_transports;
     bool kernel_cmdline_fixed;
     Notifier machine_done;
     Notifier powerdown_req;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5428448b7059..e92f236bf442 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -178,8 +178,13 @@ static void microvm_devices_init(MicrovmMachineState *mms)
 
     kvmclock_create(true);
 
-    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 5;
-    for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
+    mms->virtio_irq_base = 5;
+    mms->virtio_num_transports = 8;
+    if (x86_machine_is_acpi_enabled(x86ms)) {
+        mms->virtio_irq_base = 16;
+    }
+
+    for (i = 0; i < mms->virtio_num_transports; i++) {
         sysbus_create_simple("virtio-mmio",
                              VIRTIO_MMIO_BASE + i * 512,
                              x86ms->gsi[mms->virtio_irq_base + i]);
-- 
2.27.0


