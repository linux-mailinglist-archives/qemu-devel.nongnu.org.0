Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44455E75F0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 17:17:20 +0100 (CET)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP7hm-0005IE-4s
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 12:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33049)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iP7HQ-0004oO-DH
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:50:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iP7HP-0001Bg-0O
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:50:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35570
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iP7HO-0001Ba-T8
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:50:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572277802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMpx55o9HRI0i/lw2C8PNJmOgi+0oHqG163NNHXC3ck=;
 b=LufOLrG9ZOAtmFHuZVtP6b4NBVrx/UjsXt67IcJihi1OLCczrUAhZ0LaQmHpRquu3GW+wV
 2iFrOYFkBzC66SX0XbxcZcdra/WVGpayU/YmMPnRd5GMX/MUUDgCTBvSIN3PmlROQeSzsq
 JxzU8DqrY89/gywlRppof869Q/TB58Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-96oP1lpjPr6vKE8V-KzR8Q-1; Mon, 28 Oct 2019 11:50:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55734801E64
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 15:50:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-24.ams2.redhat.com
 [10.36.112.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B41855D9C5;
 Mon, 28 Oct 2019 15:49:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] crypto: add support for nettle's native XTS impl
Date: Mon, 28 Oct 2019 16:49:14 +0100
Message-Id: <20191028154914.84821-5-berrange@redhat.com>
In-Reply-To: <20191028154914.84821-1-berrange@redhat.com>
References: <20191028154914.84821-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 96oP1lpjPr6vKE8V-KzR8Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nettle 3.5.0 will add support for the XTS mode. Use this because long
term we wish to delete QEMU's XTS impl to avoid carrying private crypto
algorithm impls.

Unfortunately this degrades nettle performance from 612 MB/s to 568 MB/s
as nettle's XTS impl isn't so well optimized yet.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 configure              | 18 ++++++++++++++++++
 crypto/cipher-nettle.c | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/configure b/configure
index d1e9e457ce..452c2dfe4e 100755
--- a/configure
+++ b/configure
@@ -472,6 +472,7 @@ gtk_gl=3D"no"
 tls_priority=3D"NORMAL"
 gnutls=3D""
 nettle=3D""
+nettle_xts=3D"no"
 gcrypt=3D""
 gcrypt_hmac=3D"no"
 gcrypt_xts=3D"no"
@@ -2871,6 +2872,19 @@ if test "$nettle" !=3D "no"; then
             pass=3D"yes"
         fi
     fi
+    if test "$pass" =3D "yes"
+    then
+        cat > $TMPC << EOF
+#include <nettle/xts.h>
+int main(void) {
+  return 0;
+}
+EOF
+        if compile_prog "$nettle_cflags" "$nettle_libs" ; then
+            nettle_xts=3Dyes
+            qemu_private_xts=3Dno
+        fi
+    fi
     if test "$pass" =3D "no" && test "$nettle" =3D "yes"; then
         feature_not_found "nettle" "Install nettle devel >=3D 2.7.1"
     else
@@ -6346,6 +6360,10 @@ then
    echo "  XTS             $gcrypt_xts"
 fi
 echo "nettle            $nettle $(echo_version $nettle $nettle_version)"
+if test "$nettle" =3D "yes"
+then
+   echo "  XTS             $nettle_xts"
+fi
 echo "libtasn1          $tasn1"
 echo "PAM               $auth_pam"
 echo "iconv support     $iconv"
diff --git a/crypto/cipher-nettle.c b/crypto/cipher-nettle.c
index d7411bb8ff..7e9a4cc199 100644
--- a/crypto/cipher-nettle.c
+++ b/crypto/cipher-nettle.c
@@ -19,7 +19,9 @@
  */
=20
 #include "qemu/osdep.h"
+#ifdef CONFIG_QEMU_PRIVATE_XTS
 #include "crypto/xts.h"
+#endif
 #include "cipherpriv.h"
=20
 #include <nettle/nettle-types.h>
@@ -30,6 +32,9 @@
 #include <nettle/serpent.h>
 #include <nettle/twofish.h>
 #include <nettle/ctr.h>
+#ifndef CONFIG_QEMU_PRIVATE_XTS
+#include <nettle/xts.h>
+#endif
=20
 typedef void (*QCryptoCipherNettleFuncWrapper)(const void *ctx,
                                                size_t length,
@@ -626,9 +631,15 @@ qcrypto_nettle_cipher_encrypt(QCryptoCipher *cipher,
         break;
=20
     case QCRYPTO_CIPHER_MODE_XTS:
+#ifdef CONFIG_QEMU_PRIVATE_XTS
         xts_encrypt(ctx->ctx, ctx->ctx_tweak,
                     ctx->alg_encrypt_wrapper, ctx->alg_encrypt_wrapper,
                     ctx->iv, len, out, in);
+#else
+        xts_encrypt_message(ctx->ctx, ctx->ctx_tweak,
+                            ctx->alg_encrypt_native,
+                            ctx->iv, len, out, in);
+#endif
         break;
=20
     case QCRYPTO_CIPHER_MODE_CTR:
@@ -673,9 +684,16 @@ qcrypto_nettle_cipher_decrypt(QCryptoCipher *cipher,
         break;
=20
     case QCRYPTO_CIPHER_MODE_XTS:
+#ifdef CONFIG_QEMU_PRIVATE_XTS
         xts_decrypt(ctx->ctx, ctx->ctx_tweak,
                     ctx->alg_encrypt_wrapper, ctx->alg_decrypt_wrapper,
                     ctx->iv, len, out, in);
+#else
+        xts_decrypt_message(ctx->ctx, ctx->ctx_tweak,
+                            ctx->alg_decrypt_native,
+                            ctx->alg_encrypt_native,
+                            ctx->iv, len, out, in);
+#endif
         break;
     case QCRYPTO_CIPHER_MODE_CTR:
         ctr_crypt(ctx->ctx, ctx->alg_encrypt_native,
--=20
2.23.0


