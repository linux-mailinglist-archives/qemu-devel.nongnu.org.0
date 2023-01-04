Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881AD65D1D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 12:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2Iy-0007UF-3z; Wed, 04 Jan 2023 06:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2Iw-0007S8-4X; Wed, 04 Jan 2023 06:51:34 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=6L6x=5B=kaod.org=clg@ozlabs.org>)
 id 1pD2Iu-0002PF-DV; Wed, 04 Jan 2023 06:51:33 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nn7H32JpWz4y0Q;
 Wed,  4 Jan 2023 22:51:27 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nn7Gy6Zy1z4y0B;
 Wed,  4 Jan 2023 22:51:22 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 1/5] confidential guest support: Introduce a 'check' class
 handler
Date: Wed,  4 Jan 2023 12:51:07 +0100
Message-Id: <20230104115111.3240594-2-clg@kaod.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104115111.3240594-1-clg@kaod.org>
References: <20230104115111.3240594-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=6L6x=5B=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Some machines have specific requirements to activate confidential
guest support. Add a class handler to the confidential guest support
interface to let the arch implementation perform extra checks.

Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/exec/confidential-guest-support.h |  4 +++-
 hw/core/machine.c                         | 11 ++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
index ba2dd4b5df..9e6d362b26 100644
--- a/include/exec/confidential-guest-support.h
+++ b/include/exec/confidential-guest-support.h
@@ -23,7 +23,8 @@
 #include "qom/object.h"
 
 #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
-OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
+OBJECT_DECLARE_TYPE(ConfidentialGuestSupport, ConfidentialGuestSupportClass,
+                    CONFIDENTIAL_GUEST_SUPPORT)
 
 struct ConfidentialGuestSupport {
     Object parent;
@@ -55,6 +56,7 @@ struct ConfidentialGuestSupport {
 
 typedef struct ConfidentialGuestSupportClass {
     ObjectClass parent;
+    bool (*check)(const Object *obj, Error **errp);
 } ConfidentialGuestSupportClass;
 
 #endif /* !CONFIG_USER_ONLY */
diff --git a/hw/core/machine.c b/hw/core/machine.c
index f589b92909..bab43cd675 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -502,11 +502,12 @@ static void machine_check_confidential_guest_support(const Object *obj,
                                                      Object *new_target,
                                                      Error **errp)
 {
-    /*
-     * So far the only constraint is that the target has the
-     * TYPE_CONFIDENTIAL_GUEST_SUPPORT interface, and that's checked
-     * by the QOM core
-     */
+    ConfidentialGuestSupportClass *cgsc =
+        CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(new_target);
+
+    if (cgsc->check) {
+        cgsc->check(obj, errp);
+    }
 }
 
 static bool machine_get_nvdimm(Object *obj, Error **errp)
-- 
2.38.1


