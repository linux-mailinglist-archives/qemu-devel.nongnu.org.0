Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CDE680EF6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMU7i-0005xG-9J; Mon, 30 Jan 2023 08:23:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6u-0004KI-E2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMU6m-0005ha-Pd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675084921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qcRImc2dDs0fev9FIlKyp+kjuB8jSu/a15QT63yaRK8=;
 b=cDB0pom8wO5GvfHaJWN3sVhAAsvoePPW30GTiQJMjXzuAP6u8U5ei4mW/UK8uOphVRdO3V
 fuF+G1kT8pkTAtWPODvwblZR1ldcZfHbhqhrAtTdvI67OKWvSm0QBm6FvIMeyGWfrmvVLg
 B8j1Lqz7sl64V/6o/iA824jdGfkN8c4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-LUrub_A-MRCrkV-xrq18mg-1; Mon, 30 Jan 2023 08:21:58 -0500
X-MC-Unique: LUrub_A-MRCrkV-xrq18mg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74DE5183B3C3;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC912026D76;
 Mon, 30 Jan 2023 13:21:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3FC4B21E6A20; Mon, 30 Jan 2023 14:21:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, pbonzini@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, imp@bsdimp.com, kevans@freebsd.org, berrange@redhat.com,
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com,
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de,
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com,
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: [PATCH v5 01/20] scripts/clean-includes: Fully skip / ignore files
Date: Mon, 30 Jan 2023 14:21:37 +0100
Message-Id: <20230130132156.1868019-2-armbru@redhat.com>
In-Reply-To: <20230130132156.1868019-1-armbru@redhat.com>
References: <20230130132156.1868019-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

When clean-includes claims to skip or ignore a file, only the part
that sanitizes use of qemu/osdep.h skips the file.  The part that
looks for duplicate #include does not, and neither does committing to
Git.

The latter can get unrelated stuff included in the commit, but only if
you run clean-includes in a dirty tree, which is unwise.  Messed up
when we added skipping in commit fd3e39a40c "scripts/clean-includes:
Enhance to handle header files".

The former can cause bogus reports for --check-dup-head.  Added in
commit d66253e46a "scripts/clean-includes: added duplicate #include
check", duplicating the prior mistake.

Fix the script to fully skip files.

Fixes: fd3e39a40ca2 ("scripts/clean-includes: Enhance to handle header files")
Fixes: d66253e46ae2 ("scripts/clean-includes: added duplicate #include check")
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/clean-includes | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index d37bd4f692..86944f27fc 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -111,6 +111,7 @@ cat >"$COCCIFILE" <<EOT
 )
 EOT
 
+files=
 for f in "$@"; do
   case "$f" in
     *.c.inc)
@@ -144,6 +145,7 @@ for f in "$@"; do
       continue
       ;;
   esac
+  files="$files $f"
 
   if [ "$MODE" = "c" ]; then
     # First, use Coccinelle to add qemu/osdep.h before the first existing include
@@ -174,8 +176,8 @@ for f in "$@"; do
 
 done
 
-if [ "$DUPHEAD" = "yes" ]; then
-    egrep "^[[:space:]]*#[[:space:]]*include" "$@" | tr -d '[:blank:]' \
+if [ "$DUPHEAD" = "yes" ] && [ -n "$files" ]; then
+    egrep "^[[:space:]]*#[[:space:]]*include" $files | tr -d '[:blank:]' \
         | sort | uniq -c | awk '{if ($1 > 1) print $0}'
     if [ $? -eq 0 ]; then
         echo "Found duplicate header file includes. Please check the above files manually."
@@ -184,7 +186,7 @@ if [ "$DUPHEAD" = "yes" ]; then
 fi
 
 if [ "$GIT" = "yes" ]; then
-    git add -- "$@"
+    git add -- $files
     git commit --signoff -F - <<EOF
 $GITSUBJ: Clean up includes
 
-- 
2.39.0


