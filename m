Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3884CDD6F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 20:54:07 +0100 (CET)
Received: from localhost ([::1]:50594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQE06-0000l2-LV
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 14:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjg-0003DG-Ki
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nQDjX-0004NX-VV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 14:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646422616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwfI8xVjTtQO5AHLHYz4ZrnPX0vycDEDSYffydLCssk=;
 b=QGHU2myM/iogGVWZacSm4co/eZrt/zcx9JtfRMD1PwVSVLRD5+RMDUMY61JMM3RuXxCTct
 eheO9wNnMB8V02Y0G/rlfY3EGFH1X1r550pxCntp7bST43d0UdDR6VmE0D53q5RmcNZek0
 U4+MjLESZSK12lYF6D2Uen7TlS3Fq4w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-TKujQReOP9ePpxPlmsv-vg-1; Fri, 04 Mar 2022 14:36:53 -0500
X-MC-Unique: TKujQReOP9ePpxPlmsv-vg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 981A9801DDC;
 Fri,  4 Mar 2022 19:36:52 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57E395DF21;
 Fri,  4 Mar 2022 19:36:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] tests/qemu-iotests: validate NBD TLS with hostname
 mismatch
Date: Fri,  4 Mar 2022 19:36:08 +0000
Message-Id: <20220304193610.3293146-11-berrange@redhat.com>
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

This validates that connections to an NBD server where the certificate
hostname does not match will fail. It further validates that using the
new 'tls-hostname' override option can solve the failure.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/233        | 18 ++++++++++++++++++
 tests/qemu-iotests/233.out    | 16 ++++++++++++++++
 tests/qemu-iotests/common.tls |  7 ++++---
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index 050267298d..c24d877be8 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -106,6 +106,24 @@ $QEMU_IMG info --image-opts --object $obj2 \
 $QEMU_NBD_PROG -L -b $nbd_tcp_addr -p $nbd_tcp_port --object $obj1 \
     --tls-creds=tls0 2>&1 | _filter_qemu_nbd_exports
 
+echo
+echo "== check TLS fail over TCP with mismatched hostname =="
+obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,host=localhost,port=$nbd_tcp_port,tls-creds=tls0 \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -b localhost -p $nbd_tcp_port --object $obj1 \
+    --tls-creds=tls0 | _filter_qemu_nbd_exports
+
+echo
+echo "== check TLS works over TCP with mismatched hostname and override =="
+obj1=tls-creds-x509,dir=${tls_dir}/client1,endpoint=client,id=tls0
+$QEMU_IMG info --image-opts --object $obj1 \
+    driver=nbd,host=localhost,port=$nbd_tcp_port,tls-creds=tls0,tls-hostname=127.0.0.1 \
+    2>&1 | _filter_nbd
+$QEMU_NBD_PROG -L -b localhost -p $nbd_tcp_port --object $obj1 \
+    --tls-creds=tls0 --tls-hostname=127.0.0.1 | _filter_qemu_nbd_exports
+
 echo
 echo "== check TLS with different CA fails =="
 obj=tls-creds-x509,dir=${tls_dir}/client2,endpoint=client,id=tls0
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index 67a027d879..d42611bf74 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -38,6 +38,20 @@ exports available: 1
   size:  67108864
   min block: 1
 
+== check TLS fail over TCP with mismatched hostname ==
+qemu-img: Could not open 'driver=nbd,host=localhost,port=PORT,tls-creds=tls0': Certificate does not match the hostname localhost
+qemu-nbd: Certificate does not match the hostname localhost
+
+== check TLS works over TCP with mismatched hostname and override ==
+image: nbd://localhost:PORT
+file format: nbd
+virtual size: 64 MiB (67108864 bytes)
+disk size: unavailable
+exports available: 1
+ export: ''
+  size:  67108864
+  min block: 1
+
 == check TLS with different CA fails ==
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': The certificate hasn't got a known issuer
 qemu-nbd: The certificate hasn't got a known issuer
@@ -55,6 +69,8 @@ qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': F
 qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': Failed to read option reply: Cannot read from TLS channel: Software caused connection abort
 
 == final server log ==
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
+qemu-nbd: option negotiation failed: Failed to read opts magic: Cannot read from TLS channel: Software caused connection abort
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
diff --git a/tests/qemu-iotests/common.tls b/tests/qemu-iotests/common.tls
index 6ba28a78d3..4a5760949d 100644
--- a/tests/qemu-iotests/common.tls
+++ b/tests/qemu-iotests/common.tls
@@ -118,12 +118,13 @@ tls_x509_create_server()
     caname=$1
     name=$2
 
+    # We don't include 'localhost' in the cert, as
+    # we want to keep it unlisted to let tests
+    # validate hostname override
     mkdir -p "${tls_dir}/$name"
     cat > "${tls_dir}/cert.info" <<EOF
 organization = Cthulhu Dark Lord Enterprises $name
-cn = localhost
-dns_name = localhost
-dns_name = localhost.localdomain
+cn = iotests.qemu.org
 ip_address = 127.0.0.1
 ip_address = ::1
 tls_www_server
-- 
2.34.1


