Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C4207221
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:32:42 +0200 (CEST)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3dx-0005tk-OH
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c4-00043K-29
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35753
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c0-0007wq-9Q
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=zMOpcVUnJEc4LJFOQxqPXo76bEz8HhyTBI4AjEu4EkI=;
 b=KbFlF2YDpCT96xCIVoBFcPRIi/wxtPtRypoFGEjfqgdQCfQInVB2U65jUZTqiGVB+ln0Nv
 cETor0txMIbRApwLFsFC7UlL49zJFUA92BlRWL874+Fr5lMeL/7gKFTCIxlo4odtJ9chcm
 Z6orT1JwtJzo1Gq0qOUSthER/QyAfNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-n5Bz3oOrP_mgzZpQZkTRzA-1; Wed, 24 Jun 2020 07:30:37 -0400
X-MC-Unique: n5Bz3oOrP_mgzZpQZkTRzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BE418A8226;
 Wed, 24 Jun 2020 11:30:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 801991C8;
 Wed, 24 Jun 2020 11:30:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B5BBE59CC; Wed, 24 Jun 2020 13:30:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/20] audio: add deprecated_register_soundhw
Date: Wed, 24 Jun 2020 13:30:09 +0200
Message-Id: <20200624113026.13343-4-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 02:33:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add helper function for -soundhw deprecation.  It can replace the
simple init functions which just call {isa,pci}_create_simple()
with a hardcoded type.  It also prints a deprecation message.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/audio/soundhw.h |  2 ++
 hw/audio/soundhw.c         | 24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
index c8eef8241846..f09a297854af 100644
--- a/include/hw/audio/soundhw.h
+++ b/include/hw/audio/soundhw.h
@@ -6,6 +6,8 @@ void isa_register_soundhw(const char *name, const char *descr,
 
 void pci_register_soundhw(const char *name, const char *descr,
                           int (*init_pci)(PCIBus *bus));
+void deprecated_register_soundhw(const char *name, const char *descr,
+                                 int isa, const char *typename);
 
 void soundhw_init(void);
 void select_soundhw(const char *optarg);
diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index c750473c8f0c..173b674ff53a 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/option.h"
 #include "qemu/help_option.h"
 #include "qemu/error-report.h"
 #include "qom/object.h"
@@ -32,6 +33,7 @@
 struct soundhw {
     const char *name;
     const char *descr;
+    const char *typename;
     int enabled;
     int isa;
     union {
@@ -65,6 +67,17 @@ void pci_register_soundhw(const char *name, const char *descr,
     soundhw_count++;
 }
 
+void deprecated_register_soundhw(const char *name, const char *descr,
+                                 int isa, const char *typename)
+{
+    assert(soundhw_count < ARRAY_SIZE(soundhw) - 1);
+    soundhw[soundhw_count].name = name;
+    soundhw[soundhw_count].descr = descr;
+    soundhw[soundhw_count].isa = isa;
+    soundhw[soundhw_count].typename = typename;
+    soundhw_count++;
+}
+
 void select_soundhw(const char *optarg)
 {
     struct soundhw *c;
@@ -136,7 +149,16 @@ void soundhw_init(void)
 
     for (c = soundhw; c->name; ++c) {
         if (c->enabled) {
-            if (c->isa) {
+            if (c->typename) {
+                warn_report("'-soundhw %s' is deprecated, "
+                            "please use '-device %s' instead",
+                            c->name, c->typename);
+                if (c->isa) {
+                    isa_create_simple(isa_bus, c->typename);
+                } else {
+                    pci_create_simple(pci_bus, -1, c->typename);
+                }
+            } else if (c->isa) {
                 if (!isa_bus) {
                     error_report("ISA bus not available for %s", c->name);
                     exit(1);
-- 
2.18.4


