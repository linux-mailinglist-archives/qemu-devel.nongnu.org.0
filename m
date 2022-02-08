Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F84AD5CD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:49:56 +0100 (CET)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO4J-0008BB-Mc
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNV0-0006Yz-1G
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHNUw-0003VK-Ek
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644315202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P09O67l/FWSsw6LKH5uauxICQiasws3LKwEkfmqQzXg=;
 b=JiPXbPgZWBMpWpbtjP4OBLeSMUxKRCFy9s423KEyc487m2p95TqHWkTVTF1pH9SS4+kmFJ
 hUbTokztZcglSnI2QROUzFaR67xojnxxK/tlxSV5RPmRXLAz4swezedlRQEnI7Yjh5akaJ
 fQnHEPaa9bKkdfJ8hpTjCUnWzlld594=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-IWYZAH_kP1W0Guxby_-X2w-1; Tue, 08 Feb 2022 05:13:18 -0500
X-MC-Unique: IWYZAH_kP1W0Guxby_-X2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7148C802926;
 Tue,  8 Feb 2022 10:13:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3B7A2856D;
 Tue,  8 Feb 2022 10:13:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 1/6] tests/qemu-iotests: Improve the check for GNU sed
Date: Tue,  8 Feb 2022 11:13:06 +0100
Message-Id: <20220208101311.1511083-2-thuth@redhat.com>
In-Reply-To: <20220208101311.1511083-1-thuth@redhat.com>
References: <20220208101311.1511083-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of failing the iotests if GNU sed is not available (or skipping
them completely in the check-block.sh script), it would be better to
simply skip the bash-based tests, so that the python-based tests could
still be run. Thus add the check for BusyBox sed to common.rc and mark
the tests as "not run" if GNU sed is not available. Then we can also
remove the sed checks from the check-block.sh script.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/check-block.sh         | 12 ------------
 tests/qemu-iotests/common.rc | 26 +++++++++++++-------------
 2 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index 720a46bc36..af0c574812 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -52,18 +52,6 @@ if LANG=C bash --version | grep -q 'GNU bash, version [123]' ; then
     skip "bash version too old ==> Not running the qemu-iotests."
 fi
 
-if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
-    if ! command -v gsed >/dev/null 2>&1; then
-        skip "GNU sed not available ==> Not running the qemu-iotests."
-    fi
-else
-    # Double-check that we're not using BusyBox' sed which says
-    # that "This is not GNU sed version 4.0" ...
-    if sed --version | grep -q 'not GNU sed' ; then
-        skip "BusyBox sed not supported ==> Not running the qemu-iotests."
-    fi
-fi
-
 cd tests/qemu-iotests
 
 # QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 9885030b43..9ea504810c 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -17,17 +17,27 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
+# bail out, setting up .notrun file
+_notrun()
+{
+    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
+    echo "$seq not run: $*"
+    status=0
+    exit
+}
+
+# We need GNU sed for the iotests. Make sure to not use BusyBox sed
+# which says that "This is not GNU sed version 4.0"
 SED=
 for sed in sed gsed; do
-    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
+    ($sed --version | grep -v "not GNU sed" | grep 'GNU sed') > /dev/null 2>&1
     if [ "$?" -eq 0 ]; then
         SED=$sed
         break
     fi
 done
 if [ -z "$SED" ]; then
-    echo "$0: GNU sed not found"
-    exit 1
+    _notrun "GNU sed not found"
 fi
 
 dd()
@@ -722,16 +732,6 @@ _img_info()
         done
 }
 
-# bail out, setting up .notrun file
-#
-_notrun()
-{
-    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
-    echo "$seq not run: $*"
-    status=0
-    exit
-}
-
 # bail out, setting up .casenotrun file
 # The function _casenotrun() is used as a notifier. It is the
 # caller's responsibility to make skipped a particular test.
-- 
2.27.0


