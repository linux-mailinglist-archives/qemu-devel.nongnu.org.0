Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D43E079F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:31:03 +0200 (CEST)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLfS-0004MH-9V
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBLEy-0005J9-31
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mBLEv-0001GW-3U
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 14:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628100215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5piItC3m6RKqe6TMs6QoVOSs+6Utn8GSPvg96inkYtM=;
 b=NxkWwjCMZ+B4YxYAWdT3FGzP5y/G1FHf6rMWopjE0wkgx1hvfcjfygO+5kFsnvWWS3Z8E5
 qaqI9ESTimPaLoOj7kOVEzVtiW2Ottv0HfTMJxM/U5/Hd8+NuavMajMp10+2GOMDjgoasj
 rVR/wZgpDQ4XC6RmAtxh92JYt6rw9sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-3h7cjPbdMb-DCgwF1iVeqg-1; Wed, 04 Aug 2021 14:03:34 -0400
X-MC-Unique: 3h7cjPbdMb-DCgwF1iVeqg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF7D7107ACF5;
 Wed,  4 Aug 2021 18:03:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649395C1B4;
 Wed,  4 Aug 2021 18:03:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1] tests: filter out TLS distinguished name in
 certificate checks
Date: Wed,  4 Aug 2021 19:03:30 +0100
Message-Id: <20210804180330.3469683-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The version of GNUTLS in Fedora 34 has changed the order in which encodes
fields when generating new TLS certificates. This in turn changes the
order seen when querying the distinguished name. This ultimately breaks
the expected output in the NBD TLS iotests. We don't need to be
comparing the exact distinguished name text for the purpose of the test
though, so it is fine to filter it out.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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


