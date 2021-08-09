Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D123E4A79
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:05:04 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD8hz-00038e-OC
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gY-000185-5a
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mD8gV-00061e-MC
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628528610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZ8zLFT0qVBmR35Byk3wal9QZrRkvG3xa6kA6PlnWk8=;
 b=e/JzCCwg+VMVaRrZ92Q2Mjte8i7avtmdXPnbHauRNqVrivfLugQaDolt4xvHAhwCzQv4Qd
 VjUpJ2DCEuoRuu+LtO5UpiRXp4LbE/6R01+jndTT/Fq/QGXlhtTzczWN+na+JgBROLk0MQ
 ojSqguOcgTgo0RwXVpA/paTc3q9NEuQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-0PaPm3-ZMVKloWpgPpchTw-1; Mon, 09 Aug 2021 13:03:29 -0400
X-MC-Unique: 0PaPm3-ZMVKloWpgPpchTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B803E745;
 Mon,  9 Aug 2021 17:03:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBCB60BF1;
 Mon,  9 Aug 2021 17:03:25 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/2] tests: filter out TLS distinguished name in certificate
 checks
Date: Mon,  9 Aug 2021 19:03:19 +0200
Message-Id: <20210809170319.740284-3-hreitz@redhat.com>
In-Reply-To: <20210809170319.740284-1-hreitz@redhat.com>
References: <20210809170319.740284-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The version of GNUTLS in Fedora 34 has changed the order in which encodes
fields when generating new TLS certificates. This in turn changes the
order seen when querying the distinguished name. This ultimately breaks
the expected output in the NBD TLS iotests. We don't need to be
comparing the exact distinguished name text for the purpose of the test
though, so it is fine to filter it out.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210804180330.3469683-1-berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/233           | 2 +-
 tests/qemu-iotests/233.out       | 4 ++--
 tests/qemu-iotests/common.filter | 5 +++++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/233 b/tests/qemu-iotests/233
index da150cd27b..9ca7b68f42 100755
--- a/tests/qemu-iotests/233
+++ b/tests/qemu-iotests/233
@@ -148,7 +148,7 @@ $QEMU_IMG info --image-opts \
 
 echo
 echo "== final server log =="
-cat "$TEST_DIR/server.log"
+cat "$TEST_DIR/server.log" | _filter_authz_check_tls
 rm -f "$TEST_DIR/server.log"
 
 # success, all done
diff --git a/tests/qemu-iotests/233.out b/tests/qemu-iotests/233.out
index c3c344811b..4b1f6a0e15 100644
--- a/tests/qemu-iotests/233.out
+++ b/tests/qemu-iotests/233.out
@@ -65,6 +65,6 @@ qemu-img: Could not open 'driver=nbd,host=127.0.0.1,port=PORT,tls-creds=tls0': F
 == final server log ==
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
 qemu-nbd: option negotiation failed: Verify failed: No certificate was found.
-qemu-nbd: option negotiation failed: TLS x509 authz check for CN=localhost,O=Cthulhu Dark Lord Enterprises client1,L=R'lyeh,C=South Pacific is denied
-qemu-nbd: option negotiation failed: TLS x509 authz check for CN=localhost,O=Cthulhu Dark Lord Enterprises client3,L=R'lyeh,C=South Pacific is denied
+qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
+qemu-nbd: option negotiation failed: TLS x509 authz check for DISTINGUISHED-NAME is denied
 *** done
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 268b749e2f..2b2b53946c 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -332,5 +332,10 @@ for fname in fnames:
 sys.stdout.write(result)'
 }
 
+_filter_authz_check_tls()
+{
+    $SED -e 's/TLS x509 authz check for .* is denied/TLS x509 authz check for DISTINGUISHED-NAME is denied/'
+}
+
 # make sure this script returns success
 true
-- 
2.31.1


