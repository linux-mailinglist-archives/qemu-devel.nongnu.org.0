Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9F94D0DC3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:59:46 +0100 (CET)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP8b-0006uU-Pw
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu4-0000Ac-BF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu1-0006Og-4V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pmN5iD6HdqhS9KhtJm3dUu20HSvl7qKqiw4RfVgeNcU=;
 b=dSTkv2aS+TBRn1muPHBbTbSQa68GAaI62O7JmUNqdL01Ya2USUsG7GZI12fP2Ty4Q9SNjN
 G0k/5HhdHs1f/C9F7lMjDcVYc2Fl/ilrDZSYDnjNJ7kbfBmCU0pAx7WmtaKPui9wADKD/W
 ockdfqIkbwlVL0zUdokI2IKoJ3l0r8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-Xw_mA2BHODSd4vDWsOlLQw-1; Mon, 07 Mar 2022 20:44:39 -0500
X-MC-Unique: Xw_mA2BHODSd4vDWsOlLQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73854801AFE;
 Tue,  8 Mar 2022 01:44:38 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAC3245C88;
 Tue,  8 Mar 2022 01:44:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] tests/qemu-iotests: validate NBD TLS with UNIX sockets
 and PSK
Date: Mon,  7 Mar 2022 19:44:16 -0600
Message-Id: <20220308014419.3056549-13-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This validates that connections to an NBD server running on a UNIX
socket can use TLS with pre-shared keys (PSK).

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-13-berrange@redhat.com>
[eblake: squash in rebase fix]
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/common.tls | 24 ++++++++++++++++++++++++
 tests/qemu-iotests/233        | 28 ++++++++++++++++++++++++++++
 tests/qemu-iotests/233.out    | 18 ++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/tests/qemu-iotests/common.tls b/tests/qemu-iotests/common.tls
index 4a5760949d0f..b9c546298610 100644
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
diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 442fd1378c1d..55db5b3811fd 100755
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
index 6e55be779946..237c82767ea3 100644
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
@@ -82,6 +84,20 @@ exports available: 1
   size:  67108864
   min block: 1

+== check TLS works over UNIX with PSK ==
+image: nbd+unix://?socket=SOCK_DIR/qemu-nbd.sock
+file format: nbd
+virtual size: 64 MiB (67108864 bytes)
+disk size: unavailable
+exports available: 1
+ export: ''
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
@@ -91,4 +107,6 @@ qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: TLS handshake failed: An illegal parameter has been received.
+qemu-nbd: option negotiation failed: TLS handshake failed: An illegal parameter has been received.
 *** done
-- 
2.35.1


