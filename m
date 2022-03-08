Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3F4D0DB0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:51:26 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP0Y-0007fr-0m
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu5-0000CL-Ps
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu3-0006Ou-1x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E2MJZaot96VpzkxTJ8He6FC4IaUEDTRLdbay5I6ON2I=;
 b=DpTqui/y3E5HFkyuR9GE3Z+JzQLvC49tgEUEsgxDEft+JJSfpkRIgTN0IwTx0b+bC8WjTU
 j5HobtTcgl1HWv2SXw4zNeFaF3zFwGS00/jt0nF1BseMb/JrJFhZbxhAJuP30ekN3PlYN4
 WaGUXMfP1LuiQLVJN+UD5h9vQDe3mLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-ihqS1cRuNZ2VHlGVLljm2g-1; Mon, 07 Mar 2022 20:44:38 -0500
X-MC-Unique: ihqS1cRuNZ2VHlGVLljm2g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D24108088A;
 Tue,  8 Mar 2022 01:44:37 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C65D5E480;
 Tue,  8 Mar 2022 01:44:36 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/15] tests/qemu-iotests: validate NBD TLS with UNIX sockets
Date: Mon,  7 Mar 2022 19:44:15 -0600
Message-Id: <20220308014419.3056549-12-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
socket can use TLS, and require a TLS hostname override to pass
certificate validation.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-12-berrange@redhat.com>
[eblake: squash in rebase fix]
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/233     | 24 ++++++++++++++++++++++++
 tests/qemu-iotests/233.out | 16 ++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index c24d877be88e..442fd1378c1d 100755
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
index d42611bf74a6..6e55be779946 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -68,6 +68,20 @@ read 1048576/1048576 bytes at offset 1048576
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
+ export: ''
+  size:  67108864
+  min block: 1
+
 == final server log ==
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
@@ -75,4 +89,6 @@ qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 *** done
-- 
2.35.1


