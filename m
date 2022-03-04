Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5A4CDD75
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:56:53 +0100 (CET)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE2i-0005Nz-5E
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjk-0003DZ-8B
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjg-0004Ng-5j
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sMQZ1D0vrgKa+OzesEUi35uFcl0+vTnIjQitMpXKXeI=;
 b=MF96JNHzTIYgigXBY2G7vxSLhp+tGJEV/0DZy712qaM/+k5nDDktKX/zBCnIHTwSkJb0ga
 5NM89m2oActl8Z3VHlBpUqCHLna8ePzjTM8LvqaPvSST82PQkBZeJxB/lChT5rQsFdp9b1
 I+gJ7GEKaM8pY67OuMMOUwjSYOGxKmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-sqyqOBmMPo67Z1uqlR7V9g-1; Fri, 04 Mar 2022 14:36:56 -0500
X-MC-Unique: sqyqOBmMPo67Z1uqlR7V9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FAAC824FA6;
 Fri,  4 Mar 2022 19:36:55 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05F5C5DF21;
 Fri,  4 Mar 2022 19:36:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] tests/qemu-iotests: validate NBD TLS with UNIX
 sockets
Date: Fri,  4 Mar 2022 19:36:09 +0000
Message-Id: <20220304193610.3293146-12-berrange@redhat.com>
In-Reply-To: <20220304193610.3293146-1-berrange@redhat.com>
References: <20220304193610.3293146-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/233     | 24 ++++++++++++++++++++++++
 tests/qemu-iotests/233.out | 15 +++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index c24d877be8..442fd1378c 100755
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
index d42611bf74..d79a9ed346 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -68,6 +68,19 @@ read 1048576/1048576 bytes at offset 1048576
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
@@ -75,4 +88,6 @@ qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 *** done
-- 
2.34.1


