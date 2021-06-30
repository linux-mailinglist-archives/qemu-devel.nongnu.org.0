Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DA33B8AF7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 01:30:16 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyjep-00065n-HY
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 19:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjcm-0003bC-Aj
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:08 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjck-0001KT-HA
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:08 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 734CA22772;
 Wed, 30 Jun 2021 23:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDqLDJYTh0P9kpqled2hZseGPTyb17fjHEmuFpYZiEw=;
 b=UzZy+7eaeCnM8azh3/wC3YhykMugaSFGyU99N6I/Q9509zlfupeuV2nrHkk76uETK7PDv+
 TzjN4dBLWSUJn8bwIqpwzlKS0WrimZ/bxGwfIEocE2jKslrZfqCrRZyL506GFFW+As6XuS
 Nrv2qiAtiXD2DeYfDJWXbphhzT0CrTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095685;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDqLDJYTh0P9kpqled2hZseGPTyb17fjHEmuFpYZiEw=;
 b=02dtMQ4dD/VgTSLHot5MkwzKAWdFUOQbSuFWKsnzJh9YFxegGrRr2g4UTMcEtj6SLJEGQ1
 30b0jPoL7m3MuCCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 25A0A118DD;
 Wed, 30 Jun 2021 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDqLDJYTh0P9kpqled2hZseGPTyb17fjHEmuFpYZiEw=;
 b=UzZy+7eaeCnM8azh3/wC3YhykMugaSFGyU99N6I/Q9509zlfupeuV2nrHkk76uETK7PDv+
 TzjN4dBLWSUJn8bwIqpwzlKS0WrimZ/bxGwfIEocE2jKslrZfqCrRZyL506GFFW+As6XuS
 Nrv2qiAtiXD2DeYfDJWXbphhzT0CrTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095685;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDqLDJYTh0P9kpqled2hZseGPTyb17fjHEmuFpYZiEw=;
 b=02dtMQ4dD/VgTSLHot5MkwzKAWdFUOQbSuFWKsnzJh9YFxegGrRr2g4UTMcEtj6SLJEGQ1
 30b0jPoL7m3MuCCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id CMO4NQL+3GA/IQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Wed, 30 Jun 2021 23:28:02 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 3/3] qom: Improve error message in module_object_class_by_name()
Date: Wed, 30 Jun 2021 20:27:49 -0300
Message-Id: <20210630232749.21873-4-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630232749.21873-1-jziviani@suse.de>
References: <20210630232749.21873-1-jziviani@suse.de>
MIME-Version: 1.0
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
 "Jose R. Ziviani" <jziviani@suse.de>, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
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
 qom/object.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index 6a01d56546..2d40245af9 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1024,6 +1024,24 @@ ObjectClass *object_class_by_name(const char *typename)
     return type->class;
 }
 
+char *get_accel_module_name(const char *ac_name);
+
+char *get_accel_module_name(const char *ac_name)
+{
+    size_t len = strlen(ac_name);
+    char *module_name = NULL;
+
+    if (strncmp(ac_name, "tcg-accel-ops", len) == 0) {
+#ifdef CONFIG_TCG_MODULAR
+        module_name = g_strdup_printf("%s%s", "accel-tcg-", "x86_64");
+#endif
+    } else if (strncmp(ac_name, "qtest-accel-ops", len) == 0) {
+        module_name = g_strdup_printf("%s%s", "accel-qtest-", "x86_64");
+    }
+
+    return module_name;
+}
+
 ObjectClass *module_object_class_by_name(const char *typename)
 {
     ObjectClass *oc;
@@ -1031,8 +1049,20 @@ ObjectClass *module_object_class_by_name(const char *typename)
     oc = object_class_by_name(typename);
 #ifdef CONFIG_MODULES
     if (!oc) {
+        char *module_name;
         module_load_qom_one(typename);
         oc = object_class_by_name(typename);
+        module_name = get_accel_module_name(typename);
+        if (module_name) {
+            if (!module_is_loaded(module_name)) {
+                fprintf(stderr, "%s module is missing, install the "
+                                "package or config the library path "
+                                "correctly.\n", module_name);
+                g_free(module_name);
+                exit(1);
+            }
+            g_free(module_name);
+        }
     }
 #endif
     return oc;
-- 
2.32.0


