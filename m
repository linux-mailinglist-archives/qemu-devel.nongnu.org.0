Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2132135EF35
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:22:44 +0200 (CEST)
Received: from localhost ([::1]:44746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWanL-0005gL-7K
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakc-0001wF-Ns
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakY-0004yN-25
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+LFnZD9QsOaTVi6ehrXc3aLZMhKQKsDrd7y3a+MSOc=;
 b=iejXWqy+XWjfANkSSF1vPP1GCHPrtuI7jdZZNaSCYwem+kJTcWlBiG4H0DFKCCH7emglg6
 +Z58RDOd7C5EWCu683N5tb90EM9fwMpDrvejuGL5NrtZG4qokn79bCoqDMIaaK993LGfHx
 dPM4221V9rOLyZfddvf630rZfiCj4Qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-h06KSaUUOXWOZZ5AVjzsNg-1; Wed, 14 Apr 2021 04:19:46 -0400
X-MC-Unique: h06KSaUUOXWOZZ5AVjzsNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07F9F107ACCA;
 Wed, 14 Apr 2021 08:19:46 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AB8C5D9CA;
 Wed, 14 Apr 2021 08:19:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 4/5] gitlab-ci.yml: Compile with ccache enabled
Date: Wed, 14 Apr 2021 10:19:06 +0200
Message-Id: <20210414081907.871437-5-thuth@redhat.com>
In-Reply-To: <20210414081907.871437-1-thuth@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ccache can speed up the compilation in some cases, so enable it for
our CI builds, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04..422608381e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -18,7 +18,26 @@ include:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
     - JOBS=$(expr $(nproc) + 1)
+  cache:
+    key: "$CI_JOB_NAME"
+    paths:
+      - ccache
   script:
+    - mkdir -p ccache
+    - if command -v ccache ; then
+        export CCACHE_BASEDIR=${PWD} ;
+        export CCACHE_DIR=${PWD}/ccache ;
+        export CCACHE_MAXSIZE="1G" ;
+        export CCACHE_COMPILERCHECK=content ;
+        if [ -e /usr/lib/ccache/bin ]; then
+          export PATH=/usr/lib/ccache/bin:$PATH ;
+        elif [ -e /usr/lib/ccache ]; then
+          export PATH=/usr/lib/ccache:$PATH ;
+        elif [ -e /usr/lib64/ccache ]; then
+          export PATH=/usr/lib64/ccache:$PATH ;
+        fi ;
+        ccache --zero-stats ;
+      fi
     - mkdir build
     - cd build
     - if test -n "$TARGETS";
@@ -36,6 +55,7 @@ include:
       then
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
+    - if command -v ccache ; then ccache --show-stats ; fi
 
 .native_test_job_template: &native_test_job_definition
   stage: test
-- 
2.27.0


