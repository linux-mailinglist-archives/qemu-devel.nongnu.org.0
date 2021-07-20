Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED93D04B2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:34:43 +0200 (CEST)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5yK2-0007nA-3b
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH4-0003UF-Va
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:38 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1m5yH3-0002Cm-9O
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:31:38 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 396ED2242E;
 Tue, 20 Jul 2021 22:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626820296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwo4DOUpP3HH1pFZ6/P4yJuq1nL4gomB/GHjmfoZq+8=;
 b=rbKPSC9tW+FpDYctfLAL7qly92/04XPRKecXG9YC1Hz44C6RNCoic5r/maf8Ps1kT4UCbS
 gLMqB1bTEGvqug9Ex983zcgngAPRM/n8xKn1TQPgCxbPSc8DSFG/SEeAtXeFZ8unC0HPRT
 qMpFX9aiJSLRgcqlieNK7IBIFbDjtUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626820296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwo4DOUpP3HH1pFZ6/P4yJuq1nL4gomB/GHjmfoZq+8=;
 b=mVWzi6d2f2BShSUp0wq8JRQj7t8OuRMCRaryY/PekcrKcB2SeatLo9sNmYM1DvKPeeOafb
 HEberGJEz0VeTGBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D594013BAD;
 Tue, 20 Jul 2021 22:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mBRGJsVO92BzFgAAGKfGzw
 (envelope-from <jziviani@suse.de>); Tue, 20 Jul 2021 22:31:33 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qom: Improve error message in
 module_object_class_by_name()
Date: Tue, 20 Jul 2021 19:31:20 -0300
Message-Id: <20210720223120.21711-3-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210720223120.21711-1-jziviani@suse.de>
References: <20210720223120.21711-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>, richard.henderson@linaro.org,
 cfontana@suse.de, pbonzini@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

module_object_class_by_name() calls module_load_qom_one if the object
is provided by a dynamically linked library. Such library might not be
available at this moment - for instance, it can be a package not yet
installed. Thus, instead of assert error messages, this patch outputs
more friendly messages.

Current error messages:
$ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
...
ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
[1]    31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...

New error message:
$ ./qemu-system-x86_64 -machine q35 -accel tcg -kernel /boot/vmlinuz
accel-tcg-x86_64 module is missing, install the package or config the library path correctly.

Or with other modules, when possible:
$ ./qemu-system-x86_64 -machine q35 -accel kvm -kernel /boot/vmlinuz -vga qxl                                                                     ✹
hw-display-qxl module is missing, install the package or config the library path correctly.
qemu-system-x86_64: QXL VGA not available

$ make check
...
Running test qtest-x86_64/test-filter-mirror
Running test qtest-x86_64/endianness-test
accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
accel-qtest-x86_64 module is missing, install the package or config the library path correctly.
accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
...

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 accel/accel-softmmu.c | 5 ++++-
 qom/object.c          | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f52..52449ac2d0 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
      * all accelerators need to define ops, providing at least a mandatory
      * non-NULL create_vcpu_thread operation.
      */
-    g_assert(ops != NULL);
+    if (ops == NULL) {
+        exit(1);
+    }
+
     if (ops->ops_init) {
         ops->ops_init(ops);
     }
diff --git a/qom/object.c b/qom/object.c
index 6a01d56546..3a170ea9df 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -10,6 +10,7 @@
  * See the COPYING file in the top-level directory.
  */
 
+#include "qemu/module.h"
 #include "qemu/osdep.h"
 #include "hw/qdev-core.h"
 #include "qapi/error.h"
@@ -1031,8 +1032,16 @@ ObjectClass *module_object_class_by_name(const char *typename)
     oc = object_class_by_name(typename);
 #ifdef CONFIG_MODULES
     if (!oc) {
+        const char *module_name = module_get_name_from_obj(typename);
         module_load_qom_one(typename);
         oc = object_class_by_name(typename);
+        if (!oc && module_name) {
+            if (!module_is_loaded(module_name)) {
+                fprintf(stderr, "%s module is missing, install the "
+                                "package or config the library path "
+                                "correctly.\n", module_name);
+            }
+        }
     }
 #endif
     return oc;
-- 
2.32.0


