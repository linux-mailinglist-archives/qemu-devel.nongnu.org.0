Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ECC268E98
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 16:57:45 +0200 (CEST)
Received: from localhost ([::1]:50334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHpvL-0008Vj-T2
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 10:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kHpIf-0001Ly-JH
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kHpIa-0000g9-Ov
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 10:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600093056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4Yz2+4lgscFhsSEKiS2xAGmCnnfaFbIDg4fUsEFnn4U=;
 b=I/ehzXsLeFzNiJ5PQ18PE77Kh/3nCyCbia9+hco7jNb66jwicWMbyGDtekmIQDS2ul139q
 NvA918DikF9aoQtb3+jUkoAaujsXphgr11baOS3eygirfffkJ3vFrCijvSb2uE/vjnkYah
 AJLN0BOFrdkHY81vAijmWJ9SoGYxoOc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-bfmyb0zvOSegK55A2wcm4Q-1; Mon, 14 Sep 2020 10:17:33 -0400
X-MC-Unique: bfmyb0zvOSegK55A2wcm4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D62E8030A0;
 Mon, 14 Sep 2020 14:17:32 +0000 (UTC)
Received: from localhost (ovpn-114-80.ams2.redhat.com [10.36.114.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2883B2C31E;
 Mon, 14 Sep 2020 14:17:31 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] iotests: Work around failing readlink -f
Date: Mon, 14 Sep 2020 16:17:30 +0200
Message-Id: <20200914141730.90279-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HEXHASH_WORD=1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On macOS, (out of the box) readlink does not have -f.  If the recent
"readlink -f" call introduced by b1cbc33a397 fails, just fall back to
the old behavior (which means you can run the iotests only from the
build tree, but that worked fine for six years, so it should be fine
still).

Suppress all error messages, so in case using $PWD works out, we do not
cause the user to worry.  If it does not work, we will end up printing
the following error message anyway:

  check: failed to source common.env (make sure the qemu-iotests are run
  from tests/qemu-iotests in the build tree)

Following that hint (running check from $build_tree/tests/qemu-iotests)
will make it work, and is probably even easier than obtaining a readlink
that understands -f.

Fixes: b1cbc33a3971b6bb005d5ac3569feae35a71de0f
       ("iotests: Allow running from different directory")
Reported-by: Claudio Fontana <cfontana@suse.de>
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
v2: Suppress stderr (as requested and suggested by Peter)
---
 tests/qemu-iotests/check | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index e14a1f354d..3c9ccc117b 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -44,7 +44,11 @@ then
         _init_error "failed to obtain source tree name from check symlink"
     fi
     source_iotests=$(cd "$source_iotests"; pwd) || _init_error "failed to enter source tree"
-    build_iotests=$(readlink -f $(dirname "$0"))
+    build_iotests=$(readlink -f $(dirname "$0") 2>/dev/null)
+    if [ "$?" -ne 0 ]; then
+        # Perhaps -f is unsupported, revert to pre-b1cbc33a397 behavior
+        build_iotests=$PWD
+    fi
 else
     # called from the source tree
     source_iotests=$PWD
-- 
2.26.2


