Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2532C2B0B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:19:18 +0100 (CET)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kha69-0002IT-F6
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kha2C-0000QH-Nx
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kha2A-0005hW-Pm
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606230910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc2m7Zdk8qGid4lqjbFawrRjd/TI7irAIqqGunEdnlQ=;
 b=bpkc4vaUaglH97Qw5nZQVg68NOGk5rbha77dSBs6cJgm9Vj6bHxfAVSn3qqVoLw11elIF7
 7CG/owySJLuUE4m8cqH2PEUsLPr/A0faWKP877IFVvV5U6JqJAvkFT6h3UpFTz2YsfmJwj
 h6tT+KBWLMD3INfJjiwRtjEipB1IN9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-rQcCCBEsM8uN8fXj4bMSug-1; Tue, 24 Nov 2020 10:15:08 -0500
X-MC-Unique: rQcCCBEsM8uN8fXj4bMSug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCE4809DC3;
 Tue, 24 Nov 2020 15:15:06 +0000 (UTC)
Received: from localhost (unknown [10.10.67.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0914119C44;
 Tue, 24 Nov 2020 15:15:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] Revert "hw/core/qdev-properties: Use qemu_strtoul() in
 set_pci_host_devaddr()"
Date: Tue, 24 Nov 2020 10:15:00 -0500
Message-Id: <20201124151500.2945356-2-ehabkost@redhat.com>
In-Reply-To: <20201124151500.2945356-1-ehabkost@redhat.com>
References: <20201124151500.2945356-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Herman <kherman@inbox.lv>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

This reverts commit bccb20c49df1bd683248a366021973901c11982f as it
introduced a regression blocking bus addresses > 0x1f or higher.
Legal bus numbers go up to 0xff.

Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
Reported-by: Klaus Herman <kherman@inbox.lv>
Reported-by: Geoffrey McRae <geoff@hostfission.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Message-Id: <20201120130409.956956-1-mst@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/qdev-properties-system.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index b81a4e8d14..9d80a07d26 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -858,7 +858,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
     char *str, *p;
-    const char *e;
+    char *e;
     unsigned long val;
     unsigned long dom = 0, bus = 0;
     unsigned int slot = 0, func = 0;
@@ -873,23 +873,23 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     }
 
     p = str;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
-        goto inval;
-    }
-    if (*e != ':') {
+    val = strtoul(p, &e, 16);
+    if (e == p || *e != ':') {
         goto inval;
     }
     bus = val;
 
-    p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+    p = e + 1;
+    val = strtoul(p, &e, 16);
+    if (e == p) {
         goto inval;
     }
     if (*e == ':') {
         dom = bus;
         bus = val;
-        p = (char *)e + 1;
-        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
+        p = e + 1;
+        val = strtoul(p, &e, 16);
+        if (e == p) {
             goto inval;
         }
     }
@@ -898,13 +898,14 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
     if (*e != '.') {
         goto inval;
     }
-    p = (char *)e + 1;
-    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
+    p = e + 1;
+    val = strtoul(p, &e, 10);
+    if (e == p) {
         goto inval;
     }
     func = val;
 
-    if (bus > 0xff) {
+    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
         goto inval;
     }
 
-- 
2.28.0


