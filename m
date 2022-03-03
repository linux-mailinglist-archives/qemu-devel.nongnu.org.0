Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 020D74CC2BE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:29:04 +0100 (CET)
Received: from localhost ([::1]:59212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoK7-0004U8-4H
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnx6-0000GM-9X
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:05:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwy-0007Po-W6
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646323507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfFYLRQUyhdm3uT+SkdNOK+sgAmO/4FmdIyixN9zvhc=;
 b=CFbSKdfEw5b54GyuHhsfag+Z51AiSmXXBNhqTIsS/qQNjaIFm1XL33W6KGAdDqCftG/YpK
 bWOvFOAjaYliR8ugaZV03irgNt4XTpivkJCEdGgzLAqoG7/5IXsIintFifVZ3q9Nyo4kdv
 w9EoHiJD+M/ukHk+2KGtaeQfQKoOpXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-PpZ-GIMbM-6NN_15uUai3Q-1; Thu, 03 Mar 2022 11:05:06 -0500
X-MC-Unique: PpZ-GIMbM-6NN_15uUai3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DF3B1854E26;
 Thu,  3 Mar 2022 16:05:05 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8554106D5C6;
 Thu,  3 Mar 2022 16:04:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] tests/qemu-iotests: validate NBD TLS with UNIX sockets
 and PSK
Date: Thu,  3 Mar 2022 16:03:30 +0000
Message-Id: <20220303160330.2979753-13-berrange@redhat.com>
In-Reply-To: <20220303160330.2979753-1-berrange@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This validates that connections to an NBD server running on a UNIX
socket can use TLS with pre-shared keys (PSK).

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/233        | 28 ++++++++++++++++++++++++++++
 tests/qemu-iotests/233.out    | 17 +++++++++++++++++
 tests/qemu-iotests/common.tls | 24 ++++++++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 27b0a123d3..0488f3bbef 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -61,6 +61,8 @@ tls_x509_create_server "ca1" "server1"
 tls_x509_create_client "ca1" "client1"
 tls_x509_create_client "ca2" "client2"
 tls_x509_create_client "ca1" "client3"
+tls_psk_create_creds "psk1"
+tls_psk_create_creds "psk2"
 
 echo
 echo "== preparing image =="
@@ -191,6 +193,32 @@ $QEMU_IMG info --image-opts --object $obj1 \
 $QEMU_NBD_PROG -L -k $nbd_unix_socket --object $obj1 \
     --tls-creds=tls0 --tls-hostname=127.0.0.1  2>&1 | _filter_qemu_nbd_exports
 
+
+echo
+echo "== check TLS works over UNIX with PSK =="
+nbd_server_stop
+
+nbd_server_start_unix_socket \
+    --object tls-creds-psk,dir=${tls_dir}/psk1,endpoint=server,id=tls0,verify-peer=on \
+    --tls-creds tls0 \
+    -f $IMGFMT "$TEST_IMG" 2>> "$TEST_DIR/server.log"
+
+obj1=tls-creds-psk,dir=${tls_dir}/psk1,username=psk1,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,path=$nbd_unix_socket,tls-creds=tls0 \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -k $nbd_unix_socket --object $obj1 \
+    --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
+
+echo
+echo "== check TLS fails over UNIX with mismatch PSK =="
+obj1=tls-creds-psk,dir=${tls_dir}/psk2,username=psk2,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,path=$nbd_unix_socket,tls-creds=tls0 \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -k $nbd_unix_socket --object $obj1 \
+    --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
+
 echo
 echo "== final server log =="
 cat "$TEST_DIR/server.log" | _filter_authz_check_tls
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index a00e4c5b08..ecb36a2f97 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -7,6 +7,8 @@ Generating a signed certificate...
 Generating a signed certificate...
 Generating a signed certificate...
 Generating a signed certificate...
+Generating a random key for user 'psk1'
+Generating a random key for user 'psk2'
 
 == preparing image ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
@@ -79,6 +81,19 @@ exports available: 1
   size:  67108864
   min block: 1
 
+== check TLS works over UNIX with PSK ==
+image: nbd+unix://?socket=SOCK_DIR/qemu-nbd.sock
+file format: nbd
+virtual size: 64 MiB (67108864 bytes)
+disk size: unavailable
+exports available: 1
+  size:  67108864
+  min block: 1
+
+== check TLS fails over UNIX with mismatch PSK ==
+qemu-img: Could not open 'driver=nbd,path=SOCK_DIR/qemu-nbd.sock,tls-creds=tls0': TLS handshake failed: The TLS connection was non-properly terminated.
+qemu-nbd: TLS handshake failed: The TLS connection was non-properly terminated.
+
 == final server log ==
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
@@ -88,4 +103,6 @@ qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: TLS handshake failed: An illegal parameter has been received.
+qemu-nbd: option negotiation failed: TLS handshake failed: An illegal parameter has been received.
 *** done
diff --git a/tests/qemu-iotests/common.tls b/tests/qemu-iotests/common.tls
index 4a5760949d..b9c5462986 100644
--- a/tests/qemu-iotests/common.tls
+++ b/tests/qemu-iotests/common.tls
@@ -24,6 +24,7 @@ tls_x509_cleanup()
 {
     rm -f "${tls_dir}"/*.pem
     rm -f "${tls_dir}"/*/*.pem
+    rm -f "${tls_dir}"/*/*.psk
     rmdir "${tls_dir}"/*
     rmdir "${tls_dir}"
 }
@@ -40,6 +41,18 @@ tls_certtool()
     rm -f "${tls_dir}"/certtool.log
 }
 
+tls_psktool()
+{
+    psktool "$@" 1>"${tls_dir}"/psktool.log 2>&1
+    if test "$?" = 0; then
+      head -1 "${tls_dir}"/psktool.log
+    else
+      cat "${tls_dir}"/psktool.log
+    fi
+    rm -f "${tls_dir}"/psktool.log
+}
+
+
 tls_x509_init()
 {
     (certtool --help) >/dev/null 2>&1 || \
@@ -176,3 +189,14 @@ EOF
 
     rm -f "${tls_dir}/cert.info"
 }
+
+tls_psk_create_creds()
+{
+    name=$1
+
+    mkdir -p "${tls_dir}/$name"
+
+    tls_psktool \
+	--pskfile "${tls_dir}/$name/keys.psk" \
+	--username "$name"
+}
-- 
2.34.1


