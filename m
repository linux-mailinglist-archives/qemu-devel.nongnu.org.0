Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494831F94B3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 12:38:02 +0200 (CEST)
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkmV7-0002Ok-9p
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 06:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmTs-0000ft-Et
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:36:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57523
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jkmTq-0007Rn-HA
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 06:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592217401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcbBSo5vE0YFfV2gRVV5Ik/OnmR1K71bEatWoKpYXhs=;
 b=ZslIfXtEe10bTpsZoMPZ+oBqdDTzDgdRexVFEA1zWJs21ACuHJExLZOwUMle3cylqbvacP
 2FCb7d2dYFaILeDb+n1gNWtmMdVA4dOshw6EPGpEY9uSIUdLjgLcCMVPRjpWI2YlJcKv7a
 SdylRmdsvHPoBQeIoDD0u+aGNijU+cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-w3jN1ibtM3CcjVe4FauUZw-1; Mon, 15 Jun 2020 06:36:37 -0400
X-MC-Unique: w3jN1ibtM3CcjVe4FauUZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E29B9835B48;
 Mon, 15 Jun 2020 10:36:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED8985D9CD;
 Mon, 15 Jun 2020 10:36:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] crypto: add "none" random provider
Date: Mon, 15 Jun 2020 11:36:29 +0100
Message-Id: <20200615103633.300208-2-berrange@redhat.com>
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

In case of not using random-number needing feature, it makes sense to
skip RNG init too. This is especially helpful when QEMU is sandboxed in
Stubdomain under Xen, where there is very little entropy so initial
getrandom() call delays the startup several seconds. In that setup, no
random bytes are needed at all.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure            | 11 +++++++++++
 crypto/Makefile.objs |  3 ++-
 crypto/random-none.c | 38 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 crypto/random-none.c

diff --git a/configure b/configure
index bb7fd12612..997284e094 100755
--- a/configure
+++ b/configure
@@ -509,6 +509,7 @@ libpmem=""
 default_devices="yes"
 plugins="no"
 fuzzing="no"
+rng_none="no"
 
 supported_cpu="no"
 supported_os="no"
@@ -1601,6 +1602,10 @@ for opt do
   ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
+  --enable-rng-none) rng_none=yes
+  ;;
+  --disable-rng-none) rng_none=no
+  ;;
   *)
       echo "ERROR: unknown option $opt"
       echo "Try '$0 --help' for more information"
@@ -1898,6 +1903,7 @@ disabled with --disable-FEATURE, default is enabled if available:
   debug-mutex     mutex debugging support
   libpmem         libpmem support
   xkbcommon       xkbcommon support
+  rng-none        dummy RNG, avoid using /dev/(u)random and getrandom()
 
 NOTE: The object files are built at the place where configure is launched
 EOF
@@ -6767,6 +6773,7 @@ echo "default devices   $default_devices"
 echo "plugin support    $plugins"
 echo "fuzzing support   $fuzzing"
 echo "gdb               $gdb_bin"
+echo "rng-none          $rng_none"
 
 if test "$supported_cpu" = "no"; then
     echo
@@ -7744,6 +7751,10 @@ if test "$edk2_blobs" = "yes" ; then
   echo "DECOMPRESS_EDK2_BLOBS=y" >> $config_host_mak
 fi
 
+if test "$rng_none" = "yes"; then
+  echo "CONFIG_RNG_NONE=y" >> $config_host_mak
+fi
+
 # use included Linux headers
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
diff --git a/crypto/Makefile.objs b/crypto/Makefile.objs
index c2a371b0b4..cdee92b4e5 100644
--- a/crypto/Makefile.objs
+++ b/crypto/Makefile.objs
@@ -35,5 +35,6 @@ crypto-obj-y += block-luks.o
 
 util-obj-$(CONFIG_GCRYPT) += random-gcrypt.o
 util-obj-$(if $(CONFIG_GCRYPT),n,$(CONFIG_GNUTLS)) += random-gnutls.o
-util-obj-$(if $(CONFIG_GCRYPT),n,$(if $(CONFIG_GNUTLS),n,y)) += random-platform.o
+util-obj-$(if $(CONFIG_GCRYPT),n,$(if $(CONFIG_GNUTLS),n,$(CONFIG_RNG_NONE))) += random-none.o
+util-obj-$(if $(CONFIG_GCRYPT),n,$(if $(CONFIG_GNUTLS),n,$(if $(CONFIG_RNG_NONE),n,y))) += random-platform.o
 util-obj-y += aes.o init.o
diff --git a/crypto/random-none.c b/crypto/random-none.c
new file mode 100644
index 0000000000..102f8a4dce
--- /dev/null
+++ b/crypto/random-none.c
@@ -0,0 +1,38 @@
+/*
+ * QEMU Crypto "none" random number provider
+ *
+ * Copyright (c) 2020 Marek Marczykowski-Górecki
+ *                      <marmarek@invisiblethingslab.com>
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
+
+#include "crypto/random.h"
+#include "qapi/error.h"
+
+int qcrypto_random_init(Error **errp)
+{
+    return 0;
+}
+
+int qcrypto_random_bytes(void *buf,
+                         size_t buflen,
+                         Error **errp)
+{
+    error_setg(errp, "Random bytes not available with \"none\" rng");
+    return -1;
+}
-- 
2.26.2


