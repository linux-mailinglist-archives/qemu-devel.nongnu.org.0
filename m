Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96755225B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:36:18 +0200 (CEST)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KNt-0004cP-V0
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFK-0005jz-Af
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFH-0005Lf-IN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWQw5X+b1I1YdynXUzAkZPJDrxQO+oK7ACqIgSgve7A=;
 b=dmIv4RBLu7m9L6L+HTQjuus6/3AlXk8kvRFm44t2bRxaqgkgdnJWexc4MMIgF5hlh9O296
 HcBczcwI0SYR3qd/yeUc0UBfm7+IkITUeC6S24mtOmN39+g8oOU1Z/fbfF5BEBq85imNuB
 5K8MtkV4Lx2PuIgPBf+1osL+ksHXyxU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-rewff2JnNe-lzrkpoHaIfg-1; Mon, 20 Jun 2022 12:27:21 -0400
X-MC-Unique: rewff2JnNe-lzrkpoHaIfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4FE03817A65;
 Mon, 20 Jun 2022 16:27:20 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727502166B26;
 Mon, 20 Jun 2022 16:27:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 09/12] iotests: Filter child node information
Date: Mon, 20 Jun 2022 18:27:01 +0200
Message-Id: <20220620162704.80987-10-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we let qemu-img info print child node information, have
common.filter, common.rc, and iotests.py filter it from the test output
so we get as few reference output changes as possible.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/common.filter | 22 ++++++++++++++--------
 tests/qemu-iotests/common.rc     | 22 ++++++++++++++--------
 tests/qemu-iotests/iotests.py    | 18 +++++++++++++++---
 3 files changed, 43 insertions(+), 19 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index cc9f1a5891..6b32c7fbfa 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -223,6 +223,7 @@ _filter_img_info()
 
     discard=0
     regex_json_spec_start='^ *"format-specific": \{'
+    regex_json_child_start='^ *"children": \['
     gsed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
         -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
         -e "s#$TEST_DIR#TEST_DIR#g" \
@@ -251,20 +252,25 @@ _filter_img_info()
         -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
         -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \
     while IFS='' read -r line; do
-        if [[ $format_specific == 1 ]]; then
-            discard=0
-        elif [[ $line == "Format specific information:" ]]; then
-            discard=1
-        elif [[ $line =~ $regex_json_spec_start ]]; then
-            discard=2
-            regex_json_spec_end="^${line%%[^ ]*}\\},? *$"
+        if [[ $discard == 0 ]]; then
+            if [[ $format_specific == 0 && $line == "Format specific information:" ]]; then
+                discard=1
+            elif [[ $line =~ "Child node '/" ]]; then
+                discard=1
+            elif [[ $line =~ $regex_json_spec_start ]]; then
+                discard=2
+                regex_json_end="^${line%%[^ ]*}\\},? *$"
+            elif [[ $line =~ $regex_json_child_start ]]; then
+                discard=2
+                regex_json_end="^${line%%[^ ]*}\\],? *$"
+            fi
         fi
         if [[ $discard == 0 ]]; then
             echo "$line"
         elif [[ $discard == 1 && ! $line ]]; then
             echo
             discard=0
-        elif [[ $discard == 2 && $line =~ $regex_json_spec_end ]]; then
+        elif [[ $discard == 2 && $line =~ $regex_json_end ]]; then
             discard=0
         fi
     done
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 165b54a61e..0e1fa82ec6 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -711,6 +711,7 @@ _img_info()
 
     discard=0
     regex_json_spec_start='^ *"format-specific": \{'
+    regex_json_child_start='^ *"children": \['
     $QEMU_IMG info $QEMU_IMG_EXTRA_ARGS "$@" "$TEST_IMG" 2>&1 | \
         sed -e "s#$REMOTE_TEST_DIR#TEST_DIR#g" \
             -e "s#$IMGPROTO:$TEST_DIR#TEST_DIR#g" \
@@ -721,20 +722,25 @@ _img_info()
             -e "/^disk size:/ D" \
             -e "/actual-size/ D" | \
         while IFS='' read -r line; do
-            if [[ $format_specific == 1 ]]; then
-                discard=0
-            elif [[ $line == "Format specific information:" ]]; then
-                discard=1
-            elif [[ $line =~ $regex_json_spec_start ]]; then
-                discard=2
-                regex_json_spec_end="^${line%%[^ ]*}\\},? *$"
+            if [[ $discard == 0 ]]; then
+                if [[ $format_specific == 0 && $line == "Format specific information:" ]]; then
+                    discard=1
+                elif [[ $line =~ "Child node '/" ]]; then
+                    discard=1
+                elif [[ $format_specific == 0 && $line =~ $regex_json_spec_start ]]; then
+                    discard=2
+                    regex_json_end="^${line%%[^ ]*}\\},? *$"
+                elif [[ $line =~ $regex_json_child_start ]]; then
+                    discard=2
+                    regex_json_end="^${line%%[^ ]*}\\],? *$"
+                fi
             fi
             if [[ $discard == 0 ]]; then
                 echo "$line"
             elif [[ $discard == 1 && ! $line ]]; then
                 echo
                 discard=0
-            elif [[ $discard == 2 && $line =~ $regex_json_spec_end ]]; then
+            elif [[ $discard == 2 && $line =~ $regex_json_end ]]; then
                 discard=0
             fi
         done
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index da7d6637e1..94aeb3f3b2 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -329,7 +329,7 @@ def qemu_img_log(*args: str, check: bool = True
 
 def img_info_log(filename: str, filter_path: Optional[str] = None,
                  use_image_opts: bool = False, extra_args: Sequence[str] = (),
-                 check: bool = True,
+                 check: bool = True, drop_child_info: bool = True,
                  ) -> None:
     args = ['info']
     if use_image_opts:
@@ -342,7 +342,7 @@ def img_info_log(filename: str, filter_path: Optional[str] = None,
     output = qemu_img(*args, check=check).stdout
     if not filter_path:
         filter_path = filename
-    log(filter_img_info(output, filter_path))
+    log(filter_img_info(output, filter_path, drop_child_info))
 
 def qemu_io_wrap_args(args: Sequence[str]) -> List[str]:
     if '-f' in args or '--image-opts' in args:
@@ -642,11 +642,23 @@ def _filter(_key, value):
 def filter_generated_node_ids(msg):
     return re.sub("#block[0-9]+", "NODE_NAME", msg)
 
-def filter_img_info(output, filename):
+def filter_img_info(output: str, filename: str,
+                    drop_child_info: bool = True) -> str:
     lines = []
+    drop_indented = False
     for line in output.split('\n'):
         if 'disk size' in line or 'actual-size' in line:
             continue
+
+        # Drop child node info
+        if drop_indented:
+            if line.startswith(' '):
+                continue
+            drop_indented = False
+        if drop_child_info and "Child node '/" in line:
+            drop_indented = True
+            continue
+
         line = line.replace(filename, 'TEST_IMG')
         line = filter_testfiles(line)
         line = line.replace(imgfmt, 'IMGFMT')
-- 
2.35.3


