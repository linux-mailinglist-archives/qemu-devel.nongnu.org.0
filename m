Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C41F94CA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 12:43:30 +0200 (CEST)
Received: from localhost ([::1]:44602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkmaQ-0000vt-1U
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 06:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmU8-0001I8-FR
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:37:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmU6-0007T5-6N
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592217417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+3p+JNLyczyeCJ2gmwnKj1a+SQ2zoOfi5OnnPEnnG8=;
 b=XLXEtXa5dQO4u4wCw4+g8JIJW08GLbRJ8B/dKEFaqTI50Zqc8XGisJYjBNcDUUuZCUbi39
 jRsAWTy+kGtXA6uGZjqZ9zgXTo15im33rOx2WDzHP+uidYlyWdwmKjXqma7KgeszAqdVrk
 +gq7C76blAIV8MxlsqyxUdUSJfCH+zQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-oBI3u6txNi-AeRzdBld7ig-1; Mon, 15 Jun 2020 06:36:43 -0400
X-MC-Unique: oBI3u6txNi-AeRzdBld7ig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB94480F5CC;
 Mon, 15 Jun 2020 10:36:42 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BD815D9CC;
 Mon, 15 Jun 2020 10:36:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] crypto/linux_keyring: add 'secret_keyring' secret object.
Date: Mon, 15 Jun 2020 11:36:31 +0100
Message-Id: <20200615103633.300208-4-berrange@redhat.com>
In-Reply-To: <20200615103633.300208-1-berrange@redhat.com>
References: <20200615103633.300208-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 01:17:36
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
Cc: Alexey Krasikov <alex-krasikov@yandex-team.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Krasikov <alex-krasikov@yandex-team.ru>

Add the ability for the secret object to obtain secret data from the
Linux in-kernel key managment and retention facility, as an extra option
to the existing ones: reading from a file or passing directly as a
string.

The secret is identified by the key serial number. The upper layers
need to instantiate the key and make sure the QEMU process has access
permissions to read it.

Signed-off-by: Alexey Krasikov <alex-krasikov@yandex-team.ru>

 - Fixed up detection logic default behaviour in configure

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure                       |  45 ++++++++++
 crypto/Makefile.objs            |   1 +
 crypto/secret_keyring.c         | 148 ++++++++++++++++++++++++++++++++
 include/crypto/secret_keyring.h |  52 +++++++++++
 4 files changed, 246 insertions(+)
 create mode 100644 crypto/secret_keyring.c
 create mode 100644 include/crypto/secret_keyring.h

diff --git a/configure b/configure
index 997284e094..3fbb61905a 100755
--- a/configure
+++ b/configure
@@ -510,6 +510,7 @@ default_devices="yes"
 plugins="no"
 fuzzing="no"
 rng_none="no"
+secret_keyring=""
 
 supported_cpu="no"
 supported_os="no"
@@ -1606,6 +1607,10 @@ for opt do
   ;;
   --disable-rng-none) rng_none=no
   ;;
+  --enable-keyring) secret_keyring="yes"
+  ;;
+  --disable-keyring) secret_keyring="no"
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -6290,6 +6295,41 @@ case "$slirp" in
     ;;
 esac
 
+##########################################
+# check for usable __NR_keyctl syscall
+
+if test "$linux" = "yes" ; then
+
+    have_keyring=no
+    cat > $TMPC << EOF
+#include <errno.h>
+#include <asm/unistd.h>
+#include <linux/keyctl.h>
+#include <unistd.h>
+int main(void) {
+    return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
+}
+EOF
+    if compile_prog "" "" ; then
+        have_keyring=yes
+    fi
+fi
+if test "$secret_keyring" != "no"
+then
+    if test "$have_keyring" == "yes"
+    then
+	secret_keyring=yes
+    else
+	if test "$secret_keyring" = "yes"
+	then
+	    error_exit "syscall __NR_keyctl requested, \
+but not implemented on your system"
+	else
+	    secret_keyring=no
+	fi
+    fi
+fi
+
 
 ##########################################
 # End of CC checks
@@ -6774,6 +6814,7 @@ echo "plugin support    $plugins"
 echo "fuzzing support   $fuzzing"
 echo "gdb               $gdb_bin"
 echo "rng-none          $rng_none"
+echo "Linux keyring     $secret_keyring"
 
 if test "$supported_cpu" = "no"; then
     echo
@@ -7659,6 +7700,10 @@ if test -n "$gdb_bin" ; then
     echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
 fi
 
+if test "$secret_keyring" = "yes" ; then
+  echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
+fi
+
 if test "$tcg_interpreter" = "yes"; then
   QEMU_INCLUDES="-iquote \$(SRC_PATH)/tcg/tci $QEMU_INCLUDES"
 elif test "$ARCH" = "sparc64" ; then
diff --git a/crypto/Makefile.objs b/crypto/Makefile.objs
index 110dec1b87..707c02ad37 100644
--- a/crypto/Makefile.objs
+++ b/crypto/Makefile.objs
@@ -20,6 +20,7 @@ crypto-obj-y += tlscredsx509.o
 crypto-obj-y += tlssession.o
 crypto-obj-y += secret_common.o
 crypto-obj-y += secret.o
+crypto-obj-$(CONFIG_SECRET_KEYRING) += secret_keyring.o
 crypto-obj-y += pbkdf.o
 crypto-obj-$(CONFIG_NETTLE) += pbkdf-nettle.o
 crypto-obj-$(if $(CONFIG_NETTLE),n,$(CONFIG_GCRYPT)) += pbkdf-gcrypt.o
diff --git a/crypto/secret_keyring.c b/crypto/secret_keyring.c
new file mode 100644
index 0000000000..4f132d6370
--- /dev/null
+++ b/crypto/secret_keyring.c
@@ -0,0 +1,148 @@
+/*
+ * QEMU crypto secret support
+ *
+ * Copyright 2020 Yandex N.V.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <asm/unistd.h>
+#include <linux/keyctl.h>
+#include "qapi/error.h"
+#include "qom/object_interfaces.h"
+#include "trace.h"
+#include "crypto/secret_keyring.h"
+
+
+static inline
+long keyctl_read(int32_t key, uint8_t *buffer, size_t buflen)
+{
+    return syscall(__NR_keyctl, KEYCTL_READ, key, buffer, buflen, 0);
+}
+
+
+static void
+qcrypto_secret_keyring_load_data(QCryptoSecretCommon *sec_common,
+                                 uint8_t **output,
+                                 size_t *outputlen,
+                                 Error **errp)
+{
+    QCryptoSecretKeyring *secret = QCRYPTO_SECRET_KEYRING(sec_common);
+    uint8_t *buffer = NULL;
+    long retcode;
+
+    *output = NULL;
+    *outputlen = 0;
+
+    if (!secret->serial) {
+        error_setg(errp, "'serial' parameter must be provided");
+        return;
+    }
+
+    retcode = keyctl_read(secret->serial, NULL, 0);
+    if (retcode <= 0) {
+        goto keyctl_error;
+    }
+
+    buffer = g_new0(uint8_t, retcode);
+
+    retcode = keyctl_read(secret->serial, buffer, retcode);
+    if (retcode < 0) {
+        g_free(buffer);
+        goto keyctl_error;
+    }
+
+    *outputlen = retcode;
+    *output = buffer;
+    return;
+
+keyctl_error:
+    error_setg_errno(errp, errno,
+                     "Unable to read serial key %08x",
+                     secret->serial);
+}
+
+
+static void
+qcrypto_secret_prop_set_key(Object *obj, Visitor *v,
+                            const char *name, void *opaque,
+                            Error **errp)
+{
+    QCryptoSecretKeyring *secret = QCRYPTO_SECRET_KEYRING(obj);
+    int32_t value;
+    visit_type_int32(v, name, &value, errp);
+    if (!value) {
+        error_setg(errp, "'serial' should not be equal to 0");
+    }
+    secret->serial = value;
+}
+
+
+static void
+qcrypto_secret_prop_get_key(Object *obj, Visitor *v,
+                            const char *name, void *opaque,
+                            Error **errp)
+{
+    QCryptoSecretKeyring *secret = QCRYPTO_SECRET_KEYRING(obj);
+    int32_t value = secret->serial;
+    visit_type_int32(v, name, &value, errp);
+}
+
+
+static void
+qcrypto_secret_keyring_complete(UserCreatable *uc, Error **errp)
+{
+    object_property_set_bool(OBJECT(uc), true, "loaded", errp);
+}
+
+
+static void
+qcrypto_secret_keyring_class_init(ObjectClass *oc, void *data)
+{
+    QCryptoSecretCommonClass *sic = QCRYPTO_SECRET_COMMON_CLASS(oc);
+    sic->load_data = qcrypto_secret_keyring_load_data;
+
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+    ucc->complete = qcrypto_secret_keyring_complete;
+
+    object_class_property_add(oc, "serial", "int32_t",
+                                  qcrypto_secret_prop_get_key,
+                                  qcrypto_secret_prop_set_key,
+                                  NULL, NULL);
+}
+
+
+static const TypeInfo qcrypto_secret_info = {
+    .parent = TYPE_QCRYPTO_SECRET_COMMON,
+    .name = TYPE_QCRYPTO_SECRET_KEYRING,
+    .instance_size = sizeof(QCryptoSecretKeyring),
+    .class_size = sizeof(QCryptoSecretKeyringClass),
+    .class_init = qcrypto_secret_keyring_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+
+static void
+qcrypto_secret_register_types(void)
+{
+    type_register_static(&qcrypto_secret_info);
+}
+
+
+type_init(qcrypto_secret_register_types);
diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
new file mode 100644
index 0000000000..9f371ad251
--- /dev/null
+++ b/include/crypto/secret_keyring.h
@@ -0,0 +1,52 @@
+/*
+ * QEMU crypto secret support
+ *
+ * Copyright 2020 Yandex N.V.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QCRYPTO_SECRET_KEYRING_H
+#define QCRYPTO_SECRET_KEYRING_H
+
+#include "qapi/qapi-types-crypto.h"
+#include "qom/object.h"
+#include "crypto/secret_common.h"
+
+#define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
+#define QCRYPTO_SECRET_KEYRING(obj) \
+    OBJECT_CHECK(QCryptoSecretKeyring, (obj), \
+                 TYPE_QCRYPTO_SECRET_KEYRING)
+#define QCRYPTO_SECRET_KEYRING_CLASS(class) \
+    OBJECT_CLASS_CHECK(QCryptoSecretKeyringClass, \
+                       (class), TYPE_QCRYPTO_SECRET_KEYRING)
+#define QCRYPTO_SECRET_KEYRING_GET_CLASS(class) \
+    OBJECT_GET_CLASS(QCryptoSecretKeyringClass, \
+                     (class), TYPE_QCRYPTO_SECRET_KEYRING)
+
+typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
+typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
+
+typedef struct QCryptoSecretKeyring {
+    QCryptoSecretCommon parent;
+    int32_t serial;
+} QCryptoSecretKeyring;
+
+
+typedef struct QCryptoSecretKeyringClass {
+    QCryptoSecretCommonClass parent;
+} QCryptoSecretKeyringClass;
+
+#endif /* QCRYPTO_SECRET_KEYRING_H */
-- 
2.26.2


