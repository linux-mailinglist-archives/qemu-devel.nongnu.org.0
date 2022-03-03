Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8774CC28F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:22:53 +0100 (CET)
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoE8-0000Jh-Tw
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwp-0008On-2x
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwk-0007DE-TR
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646323493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDM3MrDtT+S3ZefFI1Rwfbl/PYaT38zEBrJPIcxKaeY=;
 b=SM4sDn48S46IZUGd2aTwR2TewyKscSiIyNG6YMEwmTloQ3BCdYNYv3Tk+vp070x7oIv46j
 E2u7KVXR15pNG0G4QpO6KuocvnISVjkjmWbMNAjUALEvQW+4pHIeumGoZqzsQmP6cgedV2
 5eDL2c31t3tXtzfy+FUoI75JyCr/0Jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-u95kPDfRPLGV_hJRk7UMKA-1; Thu, 03 Mar 2022 11:04:51 -0500
X-MC-Unique: u95kPDfRPLGV_hJRk7UMKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57CE1801AAD;
 Thu,  3 Mar 2022 16:04:50 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883E9106A7B2;
 Thu,  3 Mar 2022 16:04:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] tests/qemu-iotests: validate NBD TLS with UNIX sockets
Date: Thu,  3 Mar 2022 16:03:29 +0000
Message-Id: <20220303160330.2979753-12-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
socket can use TLS, and require a TLS hostname override to pass
certificate validation.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/233     | 24 ++++++++++++++++++++++++
 tests/qemu-iotests/233.out | 15 +++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 09cfb7039b..27b0a123d3 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -167,6 +167,30 @@ $QEMU_IMG info --image-opts \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
     2>&1 | _filter_nbd
 
+nbd_server_stop
+
+nbd_server_start_unix_socket \
+    --object tls-creds-x509,dir=${tls_dir}/server1,endpoint=server,id=tls0,verify-peer=on \
+    --tls-creds tls0 \
+    -f $IMGFMT "$TEST_IMG" 2>> "$TEST_DIR/server.log"
+
+echo
+echo "== check TLS fail over UNIX with no hostname =="
+obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,path=$nbd_unix_socket,tls-creds=tls0 2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -k $nbd_unix_socket --object $obj1 --tls-creds=tls0 \
+    2>&1 | _filter_qemu_nbd_exports
+
+echo
+echo "== check TLS works over UNIX with hostname override =="
+obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,path=$nbd_unix_socket,tls-creds=tls0,tls-hostname=127.0.0.1 \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -k $nbd_unix_socket --object $obj1 \
+    --tls-creds=tls0 --tls-hostname=127.0.0.1  2>&1 | _filter_qemu_nbd_exports
+
 echo
 echo "== final server log =="
 cat "$TEST_DIR/server.log" | _filter_authz_check_tls
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index 05abf470ac..a00e4c5b08 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -66,6 +66,19 @@ read 1048576/1048576 bytes at offset 1048576
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': Failed to read option reply: Cannot read from TLS channel: Software caused connection abort
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': Failed to read option reply: Cannot read from TLS channel: Software caused connection abort
 
+== check TLS fail over UNIX with no hostname ==
+qemu-img: Could not open 'driver=nbd,path=SOCK_DIR/qemu-nbd.sock,tls-creds=tls0': No hostname for certificate validation
+qemu-nbd: No hostname for certificate validation
+
+== check TLS works over UNIX with hostname override ==
+image: nbd+unix://?socket=SOCK_DIR/qemu-nbd.sock
+file format: nbd
+virtual size: 64 MiB (67108864 bytes)
+disk size: unavailable
+exports available: 1
+  size:  67108864
+  min block: 1
+
 == final server log ==
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
@@ -73,4 +86,6 @@ qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 *** done
-- 
2.34.1


