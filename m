Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2EC1DCD3B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 14:49:15 +0200 (CEST)
Received: from localhost ([::1]:41228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbkdP-00019Y-29
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 08:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbka2-0003Ui-RU
 for qemu-devel@nongnu.org; Thu, 21 May 2020 08:45:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44001
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jbka1-000578-K2
 for qemu-devel@nongnu.org; Thu, 21 May 2020 08:45:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590065144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucbm30v1gOPnBVovAjuwcDEPB4Pjf4KkcMD5kjEUqv0=;
 b=PMT/fTzuxcd5aubI+ze4go6bBV0U8W5bQMmGdYTvVefy90cl/raqKFWE1FY+SX50shq3Kb
 F5Zwm7y4uP4/fVYYBzSpB8Vbxf9LBov1csmF5cv7GIkifCOZOWpODLgU+Qrl7JbdZ6av28
 erje6xlVSrcbUZQR2M98/135lB8vflI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-GM5QclnOM4usfzC6l56Irg-1; Thu, 21 May 2020 08:45:42 -0400
X-MC-Unique: GM5QclnOM4usfzC6l56Irg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B20CC8005AA;
 Thu, 21 May 2020 12:45:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2863D341E9;
 Thu, 21 May 2020 12:45:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] run-coverity-scan: download tools outside the container
Date: Thu, 21 May 2020 08:45:34 -0400
Message-Id: <20200521124535.5329-8-pbonzini@redhat.com>
In-Reply-To: <20200521124535.5329-1-pbonzini@redhat.com>
References: <20200521124535.5329-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 06:06:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This lets us look at coverity_tool.md5 across executions of run-coverity-scan
and skip the download.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/coverity-scan.docker |  3 +-
 scripts/coverity-scan/run-coverity-scan    | 42 +++++++++++-----------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index 6f0460b66c..efcf63224d 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -127,5 +127,6 @@ RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
 ENV PATH $PATH:/usr/libexec/python3-sphinx/
 ENV COVERITY_TOOL_BASE=/coverity-tools
+COPY coverity_tool.tgz coverity_tool.tgz
+RUN mkdir -p /coverity-tools/coverity_tool && cd /coverity-tools/coverity_tool && tar xf /coverity_tool.tgz
 COPY run-coverity-scan run-coverity-scan
-RUN ./run-coverity-scan --update-tools-only --tokenfile /work/token
diff --git a/scripts/coverity-scan/run-coverity-scan b/scripts/coverity-scan/run-coverity-scan
index 6bb38b4f48..8bff952bf5 100755
--- a/scripts/coverity-scan/run-coverity-scan
+++ b/scripts/coverity-scan/run-coverity-scan
@@ -116,15 +116,17 @@ update_coverity_tools () {
             echo "Downloaded tarball didn't match md5sum!"
             exit 1
         fi
-        # extract the new one, keeping it corralled in a 'coverity_tool' directory
-        echo "Unpacking coverity build tools..."
-        mkdir -p coverity_tool
-        cd coverity_tool
-        tar xf ../coverity_tool.tgz
-        cd ..
-        mv coverity_tool.md5.new coverity_tool.md5
-    fi
 
+        if [ "$DOCKER" != yes ]; then
+            # extract the new one, keeping it corralled in a 'coverity_tool' directory
+            echo "Unpacking coverity build tools..."
+            mkdir -p coverity_tool
+            cd coverity_tool
+            tar xf ../coverity_tool.tgz
+            cd ..
+            mv coverity_tool.md5.new coverity_tool.md5
+        fi
+    fi
     rm -f coverity_tool.md5.new
 }
 
@@ -296,6 +298,14 @@ if [ -z "$COVERITY_EMAIL" ]; then
     COVERITY_EMAIL="$(git config user.email)"
 fi
 
+# Otherwise, continue with the full build and upload process.
+
+check_upload_permissions
+
+if [ "$UPDATE" != no ]; then
+    update_coverity_tools
+fi
+
 # Run ourselves inside docker if that's what the user wants
 if [ "$DOCKER" = yes ]; then
     # Put the Coverity token into a temporary file that only
@@ -315,13 +325,13 @@ if [ "$DOCKER" = yes ]; then
     if [ "$UPDATE" != no ]; then
         # build docker container including the coverity-scan tools
         echo "Building docker container..."
-        # TODO: This re-downloads the tools every time, rather than
-        # caching and reusing the image produced with the downloaded tools.
+        # TODO: This re-unpacks the tools every time, rather than caching
+        # and reusing the image produced by the COPY of the .tgz file.
         # Not sure why.
         tests/docker/docker.py --engine ${DOCKER_ENGINE} build \
                        -t coverity-scanner -f scripts/coverity-scan/coverity-scan.docker \
-                       -v "$SECRETDIR:/work" \
-                       --extra-files scripts/coverity-scan/run-coverity-scan
+                       --extra-files scripts/coverity-scan/run-coverity-scan \
+                                     "$COVERITY_TOOL_BASE"/coverity_tool.tgz
     fi
     echo "Archiving sources to be analyzed..."
     ./scripts/archive-source.sh "$SECRETDIR/qemu-sources.tgz"
@@ -352,14 +362,6 @@ if [ "$DOCKER" = yes ]; then
     exit 0
 fi
 
-# Otherwise, continue with the full build and upload process.
-
-check_upload_permissions
-
-if [ "$UPDATE" != no ]; then
-    update_coverity_tools
-fi
-
 TOOLBIN="$(cd "$COVERITY_TOOL_BASE" && echo $PWD/coverity_tool/cov-analysis-*/bin)"
 
 if ! test -x "$TOOLBIN/cov-build"; then
-- 
2.26.2



