Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B374F21551F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 12:08:08 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsO2h-0008M9-Os
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 06:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jsNzY-0002pj-50
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 06:04:52 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20755
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jsNzW-00041T-Bh
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 06:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594029889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Irzc8TwoCnLjUacgEF4UVOYcSQKN2UpsQfqwljorVLs=;
 b=Imt+nxsVKcz+3LtTcCyBSe2jbkfo3TeMgXvlhwodDy8UuaNP53g3ECdXPRhOaCcNjYvo25
 RqFWIFkpUDw3JGrkkLHEX+hRx7OxhTUAE03bLvVE27jon9gpRiiwqBhBHtcELeVXxIeLEP
 0mgHk6bz8+KHaVDrWATFO0Dza9ngJw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-tRmbSo37OwKENfbIv4-Mew-1; Mon, 06 Jul 2020 06:04:47 -0400
X-MC-Unique: tRmbSo37OwKENfbIv4-Mew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A6C21005510;
 Mon,  6 Jul 2020 10:04:46 +0000 (UTC)
Received: from localhost (ovpn-112-176.ams2.redhat.com [10.36.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 017054F6B5;
 Mon,  6 Jul 2020 10:04:45 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 05/31] iotests/common.rc: Add _require_working_luks
Date: Mon,  6 Jul 2020 12:04:06 +0200
Message-Id: <20200706100432.2301919-6-mreitz@redhat.com>
In-Reply-To: <20200706100432.2301919-1-mreitz@redhat.com>
References: <20200706100432.2301919-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:39:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That the luks driver is present is little indication on whether it is
actually working.  Without the crypto libraries linked in, it does not
work.  So add this function, which tries to create a luks image to see
whether that actually works.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200625125548.870061-4-mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 tests/qemu-iotests/common.rc | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index ba912555ca..f3667f48ab 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -740,6 +740,33 @@ _unsupported_imgopts()
     done
 }
 
+# Caution: Overwrites $TEST_DIR/t.luks
+_require_working_luks()
+{
+    file="$TEST_DIR/t.luks"
+
+    output=$(
+        $QEMU_IMG create -f luks \
+            --object secret,id=sec0,data=hunter0 \
+            -o key-secret=sec0 \
+            -o iter-time=10 \
+            "$file" \
+            1M \
+            2>&1
+    )
+    status=$?
+
+    IMGFMT='luks' _rm_test_img "$file"
+
+    if [ $status != 0 ]; then
+        reason=$(echo "$output" | grep "$file:" | $SED -e "s#.*$file: *##")
+        if [ -z "$reason" ]; then
+            reason="Failed to create a LUKS image"
+        fi
+        _notrun "$reason"
+    fi
+}
+
 # this test requires that a specified command (executable) exists
 #
 _require_command()
-- 
2.26.2


