Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F94B6DC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:39:48 +0100 (CET)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJy3X-0001fc-M8
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:39:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJxlD-0006Ft-Q3
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nJxl8-0004md-Ux
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:20:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644931245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZLabf9CoaKBT+riGt1p9xLsujiXSIdwY8H+0kzPhu18=;
 b=JaOhe4pZpQ9tAfshpFn5Nv8F58KWn3DH3w+/1ROodMTGtjDBeSSUT81pFrhiUISZ+VUz0I
 WPjv1HScmxhvIiVgQcSqFF/QjSQFMja+vuT90liHniyTMmna9B21ZqS9daggcWblbILf3w
 gDSNK8kYBBCDwFt0ah5Uccsl1YFOsSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-DGPeKmBnOqekoBreqqHoJw-1; Tue, 15 Feb 2022 08:20:42 -0500
X-MC-Unique: DGPeKmBnOqekoBreqqHoJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B67F3180FD60;
 Tue, 15 Feb 2022 13:20:40 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40A076FAF6;
 Tue, 15 Feb 2022 13:20:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH] tests/qemu-iotests: Rework the checks and spots using GNU sed
Date: Tue, 15 Feb 2022 14:20:31 +0100
Message-Id: <20220215132031.293563-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of failing the iotests if GNU sed is not available (or skipping
them completely in the check-block.sh script), it would be better to
simply skip the bash-based tests that rely on GNU sed, so that the other
tests could still be run. Thus we now explicitely use "gsed" (either as
direct program or as a wrapper around "sed" if it's the GNU version)
in the spots that rely on the GNU sed behavior. Then we also remove the
sed checks from the check-block.sh script, so that "make check-block"
can now be run on systems without GNU sed, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I've checked that this works fine with:
 make vm-build-netbsd TARGET_LIST=x86_64-softmmu BUILD_TARGET=check-block
 make vm-build-freebsd TARGET_LIST=x86_64-softmmu BUILD_TARGET=check-block
 and with the macOS targets in our CI.

 tests/check-block.sh             | 12 ------
 tests/qemu-iotests/271           |  2 +-
 tests/qemu-iotests/common.filter | 74 ++++++++++++++++----------------
 tests/qemu-iotests/common.rc     | 45 +++++++++----------
 4 files changed, 61 insertions(+), 72 deletions(-)

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
diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
index 2775b4d130..c7c2cadda0 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -896,7 +896,7 @@ _make_test_img -o extended_l2=on 1M
 # Second and third writes in _concurrent_io() are independent and may finish in
 # different order. So, filter offset out to match both possible variants.
 _concurrent_io     | $QEMU_IO | _filter_qemu_io | \
-    $SED -e 's/\(20480\|40960\)/OFFSET/'
+    sed -e 's/\(20480\|40960\)/OFFSET/'
 _concurrent_verify | $QEMU_IO | _filter_qemu_io
 
 # success, all done
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 935217aa65..a3b1708adc 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -21,58 +21,58 @@
 
 _filter_date()
 {
-    $SED -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
+    gsed -re 's/[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}/yyyy-mm-dd hh:mm:ss/'
 }
 
 _filter_vmstate_size()
 {
-    $SED -r -e 's/[0-9. ]{5} [KMGT]iB/     SIZE/' \
+    gsed -r -e 's/[0-9. ]{5} [KMGT]iB/     SIZE/' \
             -e 's/[0-9. ]{5} B/   SIZE/'
 }
 
 _filter_generated_node_ids()
 {
-    $SED -re 's/\#block[0-9]{3,}/NODE_NAME/'
+    gsed -re 's/\#block[0-9]{3,}/NODE_NAME/'
 }
 
 _filter_qom_path()
 {
-    $SED -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
+    gsed -e '/Attached to:/s/\device[[0-9]\+\]/device[N]/g'
 }
 
 # replace occurrences of the actual TEST_DIR value with TEST_DIR
 _filter_testdir()
 {
-    $SED -e "s#$TEST_DIR/#TEST_DIR/#g" \
-         -e "s#$SOCK_DIR/#SOCK_DIR/#g" \
-         -e "s#SOCK_DIR/fuse-#TEST_DIR/#g"
+    sed -e "s#$TEST_DIR/#TEST_DIR/#g" \
+        -e "s#$SOCK_DIR/#SOCK_DIR/#g" \
+        -e "s#SOCK_DIR/fuse-#TEST_DIR/#g"
 }
 
 # replace occurrences of the actual IMGFMT value with IMGFMT
 _filter_imgfmt()
 {
-    $SED -e "s#$IMGFMT#IMGFMT#g"
+    sed -e "s#$IMGFMT#IMGFMT#g"
 }
 
 # Replace error message when the format is not supported and delete
 # the output lines after the first one
 _filter_qemu_img_check()
 {
-    $SED -e '/allocated.*fragmented.*compressed clusters/d' \
-        -e 's/qemu-img: This image format does not support checks/No errors were found on the image./' \
-        -e '/Image end offset: [0-9]\+/d'
+    gsed -e '/allocated.*fragmented.*compressed clusters/d' \
+         -e 's/qemu-img: This image format does not support checks/No errors were found on the image./' \
+         -e '/Image end offset: [0-9]\+/d'
 }
 
 # Removes \r from messages
 _filter_win32()
 {
-    $SED -e 's/\r//g'
+    gsed -e 's/\r//g'
 }
 
 # sanitize qemu-io output
 _filter_qemu_io()
 {
-    _filter_win32 | $SED -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
+    _filter_win32 | gsed -e "s/[0-9]* ops\; [0-9/:. sec]* ([0-9/.inf]* [EPTGMKiBbytes]*\/sec and [0-9/.inf]* ops\/sec)/X ops\; XX:XX:XX.X (XXX YYY\/sec and XXX ops\/sec)/" \
         -e "s/: line [0-9][0-9]*:  *[0-9][0-9]*\( Aborted\| Killed\)/:\1/" \
         -e "s/qemu-io> //g"
 }
@@ -80,7 +80,7 @@ _filter_qemu_io()
 # replace occurrences of QEMU_PROG with "qemu"
 _filter_qemu()
 {
-    $SED -e "s#\\(^\\|(qemu) \\)$(basename $QEMU_PROG):#\1QEMU_PROG:#" \
+    gsed -e "s#\\(^\\|(qemu) \\)$(basename $QEMU_PROG):#\1QEMU_PROG:#" \
         -e 's#^QEMU [0-9]\+\.[0-9]\+\.[0-9]\+ monitor#QEMU X.Y.Z monitor#' \
         -e 's#I/O error#Input/output error#' \
         -e $'s#\r##' # QEMU monitor uses \r\n line endings
@@ -90,41 +90,41 @@ _filter_qemu()
 _filter_qmp()
 {
     _filter_win32 | \
-    $SED -e 's#\("\(micro\)\?seconds": \)[0-9]\+#\1 TIMESTAMP#g' \
-        -e 's#^{"QMP":.*}$#QMP_VERSION#' \
-        -e '/^    "QMP": {\s*$/, /^    }\s*$/ c\' \
-        -e '    QMP_VERSION'
+    gsed -e 's#\("\(micro\)\?seconds": \)[0-9]\+#\1 TIMESTAMP#g' \
+         -e 's#^{"QMP":.*}$#QMP_VERSION#' \
+         -e '/^    "QMP": {\s*$/, /^    }\s*$/ c\' \
+         -e '    QMP_VERSION'
 }
 
 # readline makes HMP command strings so long that git complains
 _filter_hmp()
 {
-    $SED -e $'s/^\\((qemu) \\)\\?.*\e\\[D/\\1/g' \
-        -e $'s/\e\\[K//g'
+    gsed -e $'s/^\\((qemu) \\)\\?.*\e\\[D/\\1/g' \
+         -e $'s/\e\\[K//g'
 }
 
 # replace block job offset
 _filter_block_job_offset()
 {
-    $SED -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
+    sed -e 's/, "offset": [0-9]\+,/, "offset": OFFSET,/'
 }
 
 # replace block job len
 _filter_block_job_len()
 {
-    $SED -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
+    sed -e 's/, "len": [0-9]\+,/, "len": LEN,/g'
 }
 
 # replace actual image size (depends on the host filesystem)
 _filter_actual_image_size()
 {
-    $SED -s 's/\("actual-size":\s*\)[0-9]\+/\1SIZE/g'
+    gsed -s 's/\("actual-size":\s*\)[0-9]\+/\1SIZE/g'
 }
 
 # Filename filters for qemu-img create
 _filter_img_create_filenames()
 {
-    $SED \
+    sed \
         -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
         -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
         -e "s#$TEST_DIR#TEST_DIR#g" \
@@ -142,7 +142,7 @@ _do_filter_img_create()
     # precedes ", fmt=") and the options part ($options, which starts
     # with "fmt=")
     # (And just echo everything before the first "^Formatting")
-    readarray formatting_line < <($SED -e 's/, fmt=/\n/')
+    readarray formatting_line < <(gsed -e 's/, fmt=/\n/')
 
     filename_part=${formatting_line[0]}
     unset formatting_line[0]
@@ -169,11 +169,11 @@ _do_filter_img_create()
     options=$(
         echo "$options" \
         | tr '\n' '\0' \
-        | $SED -e 's/ \([a-z0-9_.-]*\)=/\n\1=/g' \
+        | gsed -e 's/ \([a-z0-9_.-]*\)=/\n\1=/g' \
         | grep -a -e '^fmt' -e '^size' -e '^backing' -e '^preallocation' \
                   -e '^encryption' "${grep_data_file[@]}" \
         | _filter_img_create_filenames \
-        | $SED \
+        | sed \
             -e 's/^\(fmt\)/0-\1/' \
             -e 's/^\(size\)/1-\1/' \
             -e 's/^\(backing\)/2-\1/' \
@@ -181,9 +181,9 @@ _do_filter_img_create()
             -e 's/^\(encryption\)/4-\1/' \
             -e 's/^\(preallocation\)/8-\1/' \
         | LC_ALL=C sort \
-        | $SED -e 's/^[0-9]-//' \
+        | sed -e 's/^[0-9]-//' \
         | tr '\n\0' ' \n' \
-        | $SED -e 's/^ *$//' -e 's/ *$//'
+        | sed -e 's/^ *$//' -e 's/ *$//'
     )
 
     if [ -n "$options" ]; then
@@ -209,7 +209,7 @@ _filter_img_create()
 
 _filter_img_create_size()
 {
-    $SED -e "s# size=[0-9]\\+# size=SIZE#g"
+    sed -e "s# size=[0-9]\\+# size=SIZE#g"
 }
 
 _filter_img_info()
@@ -223,7 +223,7 @@ _filter_img_info()
 
     discard=0
     regex_json_spec_start='^ *"format-specific": \{'
-    $SED -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
+    gsed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
         -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
         -e "s#$TEST_DIR#TEST_DIR#g" \
         -e "s#$SOCK_DIR#SOCK_DIR#g" \
@@ -285,7 +285,7 @@ _filter_qemu_img_map()
         data_file_filter=(-e "s#$data_file_pattern#\\1#")
     fi
 
-    $SED -e 's/\([0-9a-fx]* *[0-9a-fx]* *\)[0-9a-fx]* */\1/g' \
+    sed -e 's/\([0-9a-fx]* *[0-9a-fx]* *\)[0-9a-fx]* */\1/g' \
         -e 's/"offset": [0-9]\+/"offset": OFFSET/g' \
         -e 's/Mapped to *//' \
         "${data_file_filter[@]}" \
@@ -299,7 +299,7 @@ _filter_nbd()
     # receive callbacks sometimes, making them unreliable.
     #
     # Filter out the TCP port number since this changes between runs.
-    $SED -e '/nbd\/.*\.c:/d' \
+    sed -e '/nbd\/.*\.c:/d' \
         -e 's#127\.0\.0\.1:[0-9]*#127.0.0.1:PORT#g' \
         -e "s#?socket=$SOCK_DIR#?socket=SOCK_DIR#g" \
         -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
@@ -336,14 +336,14 @@ sys.stdout.write(result)'
 
 _filter_authz_check_tls()
 {
-    $SED -e 's/TLS x509 authz check for .* is denied/TLS x509 authz check for DISTINGUISHED-NAME is denied/'
+    sed -e 's/TLS x509 authz check for .* is denied/TLS x509 authz check for DISTINGUISHED-NAME is denied/'
 }
 
 _filter_qcow2_compression_type_bit()
 {
-    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
-         -e 's/\(incompatible_features.*\), 3\]/\1]/' \
-         -e 's/\(incompatible_features.*\), 3\(,.*\)/\1\2/'
+    sed -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
+        -e 's/\(incompatible_features.*\), 3\]/\1]/' \
+        -e 's/\(incompatible_features.*\), 3\(,.*\)/\1\2/'
 }
 
 # make sure this script returns success
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 9885030b43..3bfd94c2e0 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -17,17 +17,28 @@
 # along with this program.  If not, see <http://www.gnu.org/licenses/>.
 #
 
-SED=
-for sed in sed gsed; do
-    ($sed --version | grep 'GNU sed') > /dev/null 2>&1
-    if [ "$?" -eq 0 ]; then
-        SED=$sed
-        break
-    fi
-done
-if [ -z "$SED" ]; then
-    echo "$0: GNU sed not found"
-    exit 1
+# bail out, setting up .notrun file
+_notrun()
+{
+    echo "$*" >"$OUTPUT_DIR/$seq.notrun"
+    echo "$seq not run: $*"
+    status=0
+    exit
+}
+
+if ! command -v gsed >/dev/null 2>&1; then
+    if sed --version 2>&1 | grep -v 'not GNU sed' | grep 'GNU sed' > /dev/null;
+    then
+        gsed()
+        {
+            sed "$@"
+        }
+    else
+        gsed()
+        {
+            _notrun "GNU sed not available"
+        }
+    fi
 fi
 
 dd()
@@ -722,16 +733,6 @@ _img_info()
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
@@ -920,7 +921,7 @@ _require_working_luks()
     IMGFMT='luks' _rm_test_img "$file"
 
     if [ $status != 0 ]; then
-        reason=$(echo "$output" | grep "$file:" | $SED -e "s#.*$file: *##")
+        reason=$(echo "$output" | grep "$file:" | sed -e "s#.*$file: *##")
         if [ -z "$reason" ]; then
             reason="Failed to create a LUKS image"
         fi
-- 
2.27.0


