Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069C22D7CE9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:31:19 +0100 (CET)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmGD-0006sG-Uy
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv6-0004Ga-3A
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluY-0002H3-Vs
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=USb2nBe0+scM0kjiNuae0MN90cBshxLU37cqU2q1P2E=;
 b=DMR09gETXJh0qgLOZmwSeu7990P+Wmu4LoNjIKrZU0N9Mi+tt/dohLEoFpC0v0dP/2sGla
 kebn+NowC4keaA2g+YXv1nSzpgLo23YScNIqXkLyKrWJtdZHgFIwBbjCoU23Lz/83Gsk5R
 Oing37LleTbMQfjB10OVcqXHbqPKOR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-GHPBXmvsNVKK_7QF8AyQyA-1; Fri, 11 Dec 2020 12:08:50 -0500
X-MC-Unique: GHPBXmvsNVKK_7QF8AyQyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC73D800D53;
 Fri, 11 Dec 2020 17:08:47 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAF2D5D734;
 Fri, 11 Dec 2020 17:08:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 22/34] iotests: Allow testing FUSE exports
Date: Fri, 11 Dec 2020 18:08:00 +0100
Message-Id: <20201211170812.228643-23-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

This pretends FUSE exports are a kind of protocol.  As such, they are
always tested under the format node.  This is probably the best way to
test them, actually, because this will generate more I/O load and more
varied patterns.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201027190600.192171-19-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/check         |   6 ++
 tests/qemu-iotests/common.filter |   5 +-
 tests/qemu-iotests/common.rc     | 124 +++++++++++++++++++++++++++++++
 3 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 3c1fa4435a..952762d5ed 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -270,6 +270,7 @@ image protocol options
     -rbd                test rbd
     -sheepdog           test sheepdog
     -nbd                test nbd
+    -fuse               test fuse
     -ssh                test ssh
     -nfs                test nfs
 
@@ -382,6 +383,11 @@ testlist options
             xpand=false
             ;;
 
+        -fuse)
+            IMGPROTO=fuse
+            xpand=false
+            ;;
+
         -ssh)
             IMGPROTO=ssh
             xpand=false
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 838ed15793..172ea5752e 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -44,7 +44,8 @@ _filter_qom_path()
 _filter_testdir()
 {
     $SED -e "s#$TEST_DIR/#TEST_DIR/#g" \
-         -e "s#$SOCK_DIR/#SOCK_DIR/#g"
+         -e "s#$SOCK_DIR/#SOCK_DIR/#g" \
+         -e "s#SOCK_DIR/fuse-#TEST_DIR/#g"
 }
 
 # replace occurrences of the actual IMGFMT value with IMGFMT
@@ -127,6 +128,7 @@ _filter_img_create_filenames()
         -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
         -e "s#$TEST_DIR#TEST_DIR#g" \
         -e "s#$SOCK_DIR#SOCK_DIR#g" \
+        -e 's#SOCK_DIR/fuse-#TEST_DIR/#g' \
         -e "s#$IMGFMT#IMGFMT#g" \
         -e 's#nbd:127.0.0.1:[0-9]\\+#TEST_DIR/t.IMGFMT#g' \
         -e 's#nbd+unix:///\??socket=SOCK_DIR/nbd#TEST_DIR/t.IMGFMT#g'
@@ -227,6 +229,7 @@ _filter_img_info()
         -e "s#$IMGFMT#IMGFMT#g" \
         -e 's#nbd://127.0.0.1:[0-9]\\+$#TEST_DIR/t.IMGFMT#g' \
         -e 's#nbd+unix:///\??socket=SOCK_DIR/nbd#TEST_DIR/t.IMGFMT#g' \
+        -e 's#SOCK_DIR/fuse-#TEST_DIR/#g' \
         -e "/encrypted: yes/d" \
         -e "/cluster_size: [0-9]\\+/d" \
         -e "/table_size: [0-9]\\+/d" \
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 20589e59a5..29354654cc 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -257,6 +257,9 @@ if [ "$IMGOPTSSYNTAX" = "true" ]; then
         TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
         TEST_IMG="$DRIVER,file.driver=nbd,file.type=unix"
         TEST_IMG="$TEST_IMG,file.path=$SOCK_DIR/nbd"
+    elif [ "$IMGPROTO" = "fuse" ]; then
+        TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
+        TEST_IMG="$DRIVER,file.filename=$SOCK_DIR/fuse-t.$IMGFMT"
     elif [ "$IMGPROTO" = "ssh" ]; then
         TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
         TEST_IMG="$DRIVER,file.driver=ssh,file.host=127.0.0.1,file.path=$TEST_IMG_FILE"
@@ -273,6 +276,9 @@ else
     elif [ "$IMGPROTO" = "nbd" ]; then
         TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
         TEST_IMG="nbd+unix:///?socket=$SOCK_DIR/nbd"
+    elif [ "$IMGPROTO" = "fuse" ]; then
+        TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
+        TEST_IMG="$SOCK_DIR/fuse-t.$IMGFMT"
     elif [ "$IMGPROTO" = "ssh" ]; then
         TEST_IMG_FILE=$TEST_DIR/t.$IMGFMT
         REMOTE_TEST_DIR="ssh://\\($USER@\\)\\?127.0.0.1\\(:[0-9]\\+\\)\\?$TEST_DIR"
@@ -288,6 +294,9 @@ fi
 ORIG_TEST_IMG_FILE=$TEST_IMG_FILE
 ORIG_TEST_IMG="$TEST_IMG"
 
+FUSE_PIDS=()
+FUSE_EXPORTS=()
+
 if [ -z "$TEST_DIR" ]; then
         TEST_DIR=$PWD/scratch
 fi
@@ -357,6 +366,10 @@ _test_img_to_test_img_file()
             echo "$1"
             ;;
 
+        fuse)
+            echo "$1" | sed -e "s#$SOCK_DIR/fuse-#$TEST_DIR/#"
+            ;;
+
         nfs)
             echo "$1" | sed -e "s#nfs://127.0.0.1##"
             ;;
@@ -385,6 +398,11 @@ _make_test_img()
     local opts_param=false
     local misc_params=()
 
+    if [[ $IMGPROTO == fuse && $TEST_IMG == $SOCK_DIR/fuse-* ]]; then
+        # The caller may be trying to overwrite an existing image
+        _rm_test_img "$TEST_IMG"
+    fi
+
     if [ -z "$TEST_IMG_FILE" ]; then
         img_name=$TEST_IMG
     elif [ "$IMGOPTSSYNTAX" != "true" -a \
@@ -469,11 +487,105 @@ _make_test_img()
         eval "$QEMU_NBD -v -t -k '$SOCK_DIR/nbd' -f $IMGFMT -e 42 -x '' $TEST_IMG_FILE >/dev/null &"
         sleep 1 # FIXME: qemu-nbd needs to be listening before we continue
     fi
+
+    if [ $IMGPROTO = "fuse" -a -f "$img_name" ]; then
+        local export_mp
+        local pid
+        local pidfile
+        local timeout
+
+        export_mp=$(echo "$img_name" | sed -e "s#$TEST_DIR/#$SOCK_DIR/fuse-#")
+        if ! echo "$export_mp" | grep -q "^$SOCK_DIR"; then
+            echo 'Cannot use FUSE exports with images outside of TEST_DIR' >&2
+            return 1
+        fi
+
+        touch "$export_mp"
+        rm -f "$SOCK_DIR/fuse-output"
+
+        # Usually, users would export formatted nodes.  But we present fuse as a
+        # protocol-level driver here, so we have to leave the format to the
+        # client.
+        QSD_NEED_PID=y $QSD \
+              --blockdev file,node-name=export-node,filename=$img_name,discard=unmap \
+              --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=on \
+              &
+
+        pidfile="$QEMU_TEST_DIR/qemu-storage-daemon.pid"
+
+        # Wait for the PID file
+        while [ ! -f "$pidfile" ]; do
+            sleep 0.5
+        done
+
+        pid=$(cat "$pidfile")
+        rm -f "$pidfile"
+
+        FUSE_PIDS+=($pid)
+        FUSE_EXPORTS+=("$export_mp")
+    fi
 }
 
 _rm_test_img()
 {
     local img=$1
+
+    if [[ $IMGPROTO == fuse && $img == $SOCK_DIR/fuse-* ]]; then
+        # Drop a FUSE export
+        local df_output
+        local i
+        local image_file
+        local index=''
+        local timeout
+
+        for i in "${!FUSE_EXPORTS[@]}"; do
+            if [ "${FUSE_EXPORTS[i]}" = "$img" ]; then
+                index=$i
+                break
+            fi
+        done
+
+        if [ -z "$index" ]; then
+            # Probably gone already
+            return 0
+        fi
+
+        kill "${FUSE_PIDS[index]}"
+
+        # Wait until the mount is gone
+        timeout=10 # *0.5 s
+        while true; do
+            # Will show the mount point; if the mount is still there,
+            # it will be $img.
+            df_output=$(df "$img" 2>/dev/null)
+
+            # But df may also show an error ("Transpoint endpoint not
+            # connected"), so retry in such cases
+            if [ -n "$df_output" ]; then
+                if ! echo "$df_output" | grep -q "$img"; then
+                    break
+                fi
+            fi
+
+            sleep 0.5
+
+            timeout=$((timeout - 1))
+            if [ "$timeout" = 0 ]; then
+                echo 'Failed to take down FUSE export' >&2
+                return 1
+            fi
+        done
+
+        rm -f "$img"
+
+        unset "FUSE_PIDS[$index]"
+        unset "FUSE_EXPORTS[$index]"
+
+        image_file=$(echo "$img" | sed -e "s#$SOCK_DIR/fuse-#$TEST_DIR/#")
+        _rm_test_img "$image_file"
+        return
+    fi
+
     if [ "$IMGFMT" = "vmdk" ]; then
         # Remove all the extents for vmdk
         "$QEMU_IMG" info "$img" 2>/dev/null | grep 'filename:' | cut -f 2 -d: \
@@ -496,6 +608,17 @@ _cleanup_test_img()
             rm -f "$TEST_IMG_FILE"
             ;;
 
+        fuse)
+            local mp
+
+            for mp in "${FUSE_EXPORTS[@]}"; do
+                _rm_test_img "$mp"
+            done
+
+            FUSE_PIDS=()
+            FUSE_EXPORTS=()
+            ;;
+
         file)
             _rm_test_img "$TEST_DIR/t.$IMGFMT"
             _rm_test_img "$TEST_DIR/t.$IMGFMT.orig"
@@ -562,6 +685,7 @@ _img_info()
         sed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
             -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
             -e "s#$TEST_DIR#TEST_DIR#g" \
+            -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
             -e "s#$IMGFMT#IMGFMT#g" \
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
-- 
2.29.2


