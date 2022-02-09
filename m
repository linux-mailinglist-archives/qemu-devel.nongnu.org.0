Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6034AEF27
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 11:20:44 +0100 (CET)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHk5b-0006eg-IM
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 05:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk14-0003B6-Df
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nHk12-0004tl-Hi
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644401759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P09O67l/FWSsw6LKH5uauxICQiasws3LKwEkfmqQzXg=;
 b=KGE4n/IRZwlbdXz1Ix2PZl3uWMTxhTvoU8Fi9hEKfp8eMswrYyRjhxkKKTmIZDt5l2zP+D
 4IBSwRjvio5NY/TXbYIxy1jzPdP1/qY51ini1LvJgX0v2b/6CpBJed28eWaa2P7I+XIgPT
 kXxoEN5zMC7j8LVGl2YY0RqdVlCPeWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-_GFlBS1wOOKCOdN5RBrO_Q-1; Wed, 09 Feb 2022 05:15:57 -0500
X-MC-Unique: _GFlBS1wOOKCOdN5RBrO_Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4994786A061;
 Wed,  9 Feb 2022 10:15:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B4EA2B3A7;
 Wed,  9 Feb 2022 10:15:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/8] tests/qemu-iotests: Improve the check for GNU sed
Date: Wed,  9 Feb 2022 11:15:24 +0100
Message-Id: <20220209101530.3442837-3-thuth@redhat.com>
In-Reply-To: <20220209101530.3442837-1-thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
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


