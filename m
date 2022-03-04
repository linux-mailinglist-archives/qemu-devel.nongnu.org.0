Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDC4CDD6A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:51:34 +0100 (CET)
Received: from localhost ([::1]:41184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQDxd-0002j2-IY
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:51:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjg-0003DK-M6
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjX-0004NC-VG
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7qoVI7gJMj1Xn0b6IE6WdpABqz+fdqJQld3jU392c4=;
 b=C9V9QDfEqNruxZyNpThq2Xa/D8qR/X3wewfYlr8A/vpND+yOkCVDvtSvQWCswI2lDd0YEZ
 6IrjQ2hZQMiYJOGxfthVuqaQTVPBo0xWfasjAmxlNcO7Xk+6DScckp2qDH85F/yVTmNPiy
 FHZtFKsrFZadrUuA0w51d+wag6jQIeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-PcfyHJI-MkG4mL0uEQbkJw-1; Fri, 04 Mar 2022 14:36:50 -0500
X-MC-Unique: PcfyHJI-MkG4mL0uEQbkJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9CAB51DC;
 Fri,  4 Mar 2022 19:36:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 028905DF21;
 Fri,  4 Mar 2022 19:36:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] tests/qemu-iotests: convert NBD TLS test to use
 standard filters
Date: Fri,  4 Mar 2022 19:36:07 +0000
Message-Id: <20220304193610.3293146-10-berrange@redhat.com>
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

Using standard filters is more future proof than rolling our own.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/233     | 29 ++++++++++++++++-------------
 tests/qemu-iotests/233.out |  8 --------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 9ca7b68f42..050267298d 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -65,7 +65,7 @@ tls_x509_create_client "ca1" "client3"
 echo
 echo "== preparing image =="
 _make_test_img 64M
-$QEMU_IO -c 'w -P 0x11 1m 1m' "$TEST_IMG" | _filter_qemu_io
+$QEMU_IO -c 'w -P 0x11 1m 1m' "$TEST_IMG" 2>&1 | _filter_qemu_io
 
 echo
 echo "== check TLS client to plain server fails =="
@@ -74,9 +74,9 @@ nbd_server_start_tcp_socket -f $IMGFMT "$TEST_IMG" 2> "$TEST_DIR/server.log"
 obj=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
 $QEMU_IMG info --image-opts --object $obj \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 $QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port --object $obj \
-    --tls-creds=tls0
+    --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
 
 nbd_server_stop
 
@@ -88,8 +88,10 @@ nbd_server_start_tcp_socket \
     --tls-creds tls0 \
     -f $IMGFMT "$TEST_IMG" 2>> "$TEST_DIR/server.log"
 
-$QEMU_IMG info nbd://localhost:$nbd_tcp_port 2>&1 | sed "s/$nbd_tcp_port/PORT/g"
-$QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port
+$QEMU_IMG info nbd://localhost:$nbd_tcp_port \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port \
+    2>&1 | _filter_qemu_nbd_exports
 
 echo
 echo "== check TLS works =="
@@ -97,21 +99,21 @@ obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
 obj2=tls-creds-x509,dir=${tls_dir}/client3,endpoint=client,id=tls0
 $QEMU_IMG info --image-opts --object $obj1 \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 $QEMU_IMG info --image-opts --object $obj2 \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 $QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port --object $obj1 \
-    --tls-creds=tls0
+    --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
 
 echo
 echo "== check TLS with different CA fails =="
 obj=tls-creds-x509,dir=${tls_dir}/client2,endpoint=client,id=tls0
 $QEMU_IMG info --image-opts --object $obj \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 $QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port --object $obj \
-    --tls-creds=tls0
+    --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
 
 echo
 echo "== perform I/O over TLS =="
@@ -121,7 +123,8 @@ $QEMU_IO -c 'r -P 0x11 1m 1m' -c 'w -P 0x22 1m 1m' --image-opts \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
     2>&1 | _filter_qemu_io
 
-$QEMU_IO -f $IMGFMT -r -U -c 'r -P 0x22 1m 1m' "$TEST_IMG" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -r -U -c 'r -P 0x22 1m 1m' "$TEST_IMG" \
+    2>&1 | _filter_qemu_io
 
 echo
 echo "== check TLS with authorization =="
@@ -139,12 +142,12 @@ nbd_server_start_tcp_socket \
 $QEMU_IMG info --image-opts \
     --object tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0 \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 
 $QEMU_IMG info --image-opts \
     --object tls-creds-x509,dir=${tls_dir}/client3,endpoint=client,id=tls0 \
     driver=nbd,host=$nbd_tcp_addr,port=$nbd_tcp_port,tls-creds=tls0 \
-    2>&1 | sed "s/$nbd_tcp_port/PORT/g"
+    2>&1 | _filter_nbd
 
 echo
 echo "== final server log =="
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index 4b1f6a0e15..67a027d879 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -17,15 +17,12 @@ wrote 1048576/1048576 bytes at offset 1048576
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': Denied by server for option 5 (starttls)
 server reported: TLS not configured
 qemu-nbd: Denied by server for option 5 (starttls)
-server reported: TLS not configured
 
 == check plain client to TLS server fails ==
 qemu-img: Could not open 'nbd://localhost:PORT': TLS negotiation required before option 7 (go)
 Did you forget a valid tls-creds?
 server reported: Option 0x7 not permitted before TLS
 qemu-nbd: TLS negotiation required before option 3 (list)
-Did you forget a valid tls-creds?
-server reported: Option 0x3 not permitted before TLS
 
 == check TLS works ==
 image: nbd://127.0.0.1:PORT
@@ -39,12 +36,7 @@ disk size: unavailable
 exports available: 1
  export: ''
   size:  67108864
-  flags: 0xced ( flush fua trim zeroes df cache fast-zero )
   min block: 1
-  opt block: 4096
-  max block: 33554432
-  available meta contexts: 1
-   base:allocation
 
 == check TLS with different CA fails ==
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': The certificate hasn't got a known issuer
-- 
2.34.1


