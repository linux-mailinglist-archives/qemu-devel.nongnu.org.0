Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10844414ED6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:09:30 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT5kO-0002i9-RR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4ug-00032v-84; Wed, 22 Sep 2021 12:16:02 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:39132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mT4uc-0005OV-8A; Wed, 22 Sep 2021 12:16:01 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4E73021ECB;
 Wed, 22 Sep 2021 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1632327355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ow5aMrqN/i5D/dv1vm+J5tz7Z/sAyFJH5Io1/i7HEmw=;
 b=cHbJePzpcvHXQEkqOdmaeWcRNrJ837qUy9Smnwsf4FkYlw79QNCGGyVPvnpY0eWxfDYkrY
 Gcyfi8h/ljklnuDrFdhj+SC0Q9suuCMFH6X6PkgUXB/DYK4rXoUWqJXJJmrOrjy7EPcEAj
 CWsJ/7O0ROaTwhJk7Qw6cuIAJX3Xrb8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 10/16] qdev-monitor: allow adding any sysbus device
 before machine is ready
Date: Wed, 22 Sep 2021 18:13:59 +0200
Message-Id: <20210922161405.140018-11-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922161405.140018-1-damien.hedde@greensocs.com>
References: <20210922161405.140018-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, mirela.grujic@greensocs.com,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, Markus Armbruster <armbru@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 mark.burton@greensocs.com, edgari@xilinx.com,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Skip the sysbus device type per-machine allow-list check before the
MACHINE_INIT_PHASE_READY phase.

This patch permits adding any sysbus device (it still needs to be
user_creatable) when using the -preconfig experimental option.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

This commit is RFC. Depending on the condition to allow a device
to be added, it may change.
---
 softmmu/qdev-monitor.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index f1c9242855..73b991adda 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -269,8 +269,13 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
-    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
-        /* sysbus devices need to be allowed by the machine */
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE) &&
+        phase_check(MACHINE_INIT_PHASE_READY)) {
+        /*
+         * Sysbus devices need to be allowed by the machine.
+         * We only check that after the machine is ready in order to let
+         * us add any user_creatable sysbus device during machine creation.
+         */
         MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
         if (!machine_class_is_dynamic_sysbus_dev_allowed(mc, *driver)) {
             error_setg(errp, "'%s' is not an allowed pluggable sysbus device "
-- 
2.33.0


