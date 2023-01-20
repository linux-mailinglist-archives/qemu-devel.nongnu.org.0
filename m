Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A58A67546C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUR-0003bh-3s; Fri, 20 Jan 2023 07:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUL-0003Lw-9m
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUI-0000Ux-Tb
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+SG62ZQTVX1iRwA7+jdikTQH8AaBuGVJO2hqC/kjmuo=;
 b=NcWYAMfyNBTe+U21CMVFrrAyQw2hpM6MYE3O0dufzV8L5WMHIUCMVp+6e09U4YSp81dQFA
 DSuL51jwjQoJk8UCBbdKN0JzY62/8cZScmVYNlifjH9xTcR38JYSYsHNFkMC+WCe/hmid1
 B1FjuZOvEmnLDLQ7J8TgbYI+3Pc3EmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-U4UMIEekOSGM7oOdpRK9Ag-1; Fri, 20 Jan 2023 07:27:15 -0500
X-MC-Unique: U4UMIEekOSGM7oOdpRK9Ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88037811E6E;
 Fri, 20 Jan 2023 12:27:14 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCCFC40C6EC4;
 Fri, 20 Jan 2023 12:27:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 35/38] iotests: Filter child node information
Date: Fri, 20 Jan 2023 13:26:30 +0100
Message-Id: <20230120122633.84983-36-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

Before we let qemu-img info print child node information, have
common.filter, common.rc, and iotests.py filter it from the test output
so we get as few reference output changes as possible.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-10-hreitz@redhat.com>
Tested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py    | 18 +++++++++++++++---
 tests/qemu-iotests/common.filter | 22 ++++++++++++++--------
 tests/qemu-iotests/common.rc     | 22 ++++++++++++++--------
 3 files changed, 43 insertions(+), 19 deletions(-)

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
index db757025cb..f4476b62f7 100644
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
-- 
2.38.1


