Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3C2F51A8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 19:05:14 +0100 (CET)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzkW9-0006nH-Id
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 13:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPG-0001fh-HP
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzkPC-0000tZ-QT
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 12:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610560680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JF5NaNd9qbTnGxc5ZHwbkkpbYpE9YgCzet4pLF9ZTac=;
 b=c/mEQhubgA0oGY5cJnb1WQ7semCGmhBllWENyHBUMiTRUutF80Iz68EOqxMgG+qiXM6+I8
 HAVkuWwKfYRVg4UMFmPYDVm22C5KL2WH0fT2N+eAIQ5/vWVeXq1/LlbbLjaEXiqm+qYpo7
 5b0rOaWkJ1KV00Y3/Va4zt3t9blog3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-52rQalgpMkCUVBcCLkEquA-1; Wed, 13 Jan 2021 12:57:58 -0500
X-MC-Unique: 52rQalgpMkCUVBcCLkEquA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6C021014E78;
 Wed, 13 Jan 2021 17:57:56 +0000 (UTC)
Received: from localhost (ovpn-113-103.ams2.redhat.com [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AD4E19C47;
 Wed, 13 Jan 2021 17:57:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/8] iotests/297: Allow checking all Python test files
Date: Wed, 13 Jan 2021 18:57:45 +0100
Message-Id: <20210113175752.403022-2-mreitz@redhat.com>
In-Reply-To: <20210113175752.403022-1-mreitz@redhat.com>
References: <20210113175752.403022-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I.e., all Python files in the qemu-iotests/ directory.

Most files of course do not pass, so there is an extensive skip list for
now.  (The only files that do pass are 209, 254, 283, and iotests.py.)

(Alternatively, we could have the opposite, i.e. an explicit list of
files that we do want to check, but I think it is better to check files
by default.)

I decided to include the list of files checked in the reference output,
so we do not accidentally lose coverage of anything.  That means adding
new Python tests will require a change to 297.out, but that should not
be a problem.

On the other hand, I decided to hide mypy's "Success" lines from the
reference output, because they do not add anything useful.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/297     | 66 ++++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/297.out |  6 +++-
 2 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/297 b/tests/qemu-iotests/297
index 5c5420712b..b1a7d6d5e8 100755
--- a/tests/qemu-iotests/297
+++ b/tests/qemu-iotests/297
@@ -30,13 +30,67 @@ if ! type -p "mypy" > /dev/null; then
     _notrun "mypy not found"
 fi
 
-pylint-3 --score=n iotests.py
+# TODO: Empty this list!
+skip_files=(
+    030 040 041 044 045 055 056 057 065 093 096 118 124 129 132 136 139 147 148
+    149 151 152 155 163 165 169 194 196 199 202 203 205 206 207 208 210 211 212
+    213 216 218 219 222 224 228 234 235 236 237 238 240 242 245 246 248 255 256
+    257 258 260 262 264 266 274 277 280 281 295 296 298 299 300 302 303 304 307
+    nbd-fault-injector.py qcow2.py qcow2_format.py qed.py
+)
 
-MYPYPATH=../../python/ mypy --warn-unused-configs --disallow-subclassing-any \
-    --disallow-any-generics --disallow-incomplete-defs \
-    --disallow-untyped-decorators --no-implicit-optional \
-    --warn-redundant-casts --warn-unused-ignores \
-    --no-implicit-reexport iotests.py
+file_list=()
+for file in *; do
+    # Check files with a .py extension or a Python shebang
+    # (Unless they are in the skip_files list)
+    if [ -f "$file" ] && ((echo "$file" | grep -q '\.py$') ||
+                          (head -n 1 "$file" | grep -q '^#!.*python'))
+    then
+        skip_file=false
+        for skip in "${skip_files[@]}"; do
+            if [ "$skip" = "$file" ]; then
+                skip_file=true
+                break
+            fi
+        done
+
+        if ! $skip_file; then
+            file_list+=("$file")
+        fi
+    fi
+done
+
+# Emit list of all files that are checked so we will not accidentally
+# lose coverage
+echo 'Files to be checked:'
+
+file_list_str=''
+for file in "${file_list[@]}"; do
+    echo "  $file"
+done | sort
+
+# We can pass all files to pylint at once...
+pylint-3 --score=n "${file_list[@]}"
+
+# ...but mypy needs to be called once per file.  Otherwise, it will
+# interpret all given files as belonging together (i.e., they may not
+# both define the same classes, etc.; most notably, they must not both
+# define the __main__ module).
+for file in "${file_list[@]}"; do
+    mypy_output=$(
+        MYPYPATH=../../python/ mypy --warn-unused-configs \
+            --disallow-subclassing-any \
+            --disallow-any-generics --disallow-incomplete-defs \
+            --disallow-untyped-decorators --no-implicit-optional \
+            --warn-redundant-casts --warn-unused-ignores \
+            --no-implicit-reexport "$file" \
+            2>&1
+    )
+
+    if [ $? != 0 ]; then
+        echo "$mypy_output"
+    fi
+done
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/297.out b/tests/qemu-iotests/297.out
index 6acc843649..c5ebbf6a17 100644
--- a/tests/qemu-iotests/297.out
+++ b/tests/qemu-iotests/297.out
@@ -1,3 +1,7 @@
 QA output created by 297
-Success: no issues found in 1 source file
+Files to be checked:
+  209
+  254
+  283
+  iotests.py
 *** done
-- 
2.29.2


