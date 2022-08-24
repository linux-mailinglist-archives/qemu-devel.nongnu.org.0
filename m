Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3459FE12
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 17:17:28 +0200 (CEST)
Received: from localhost ([::1]:45498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQs8F-00013c-OH
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 11:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2b-0000UN-Uo
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQs2a-0003nB-EG
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 11:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661353895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bv1s1NV1pWA22SbMD9BocQAHmUHfasyOVlgtouDrWM=;
 b=VTyyTUoDbnNBhO5mFmmXynPz+Wvf4JQSmV4cToQodf7h1ybQHZWnGyDgluk7GSXlcFpcv0
 N1cfpu3nAcnk1DWno981zE41TtlqonjrrDRixkc/920VY31XtdngVsCzkPDJm1+vDD9vny
 bxGlUNAaY8ULPMshzM9FIoTmP+bXnvM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187--Y-Zj5SrM3OgHRMqZLn7rw-1; Wed, 24 Aug 2022 11:11:32 -0400
X-MC-Unique: -Y-Zj5SrM3OgHRMqZLn7rw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D5898039B2;
 Wed, 24 Aug 2022 15:11:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FD9C403348;
 Wed, 24 Aug 2022 15:11:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 2/6] tests/vm: Add libslirp to the VM tests
Date: Wed, 24 Aug 2022 17:11:18 +0200
Message-Id: <20220824151122.704946-3-thuth@redhat.com>
In-Reply-To: <20220824151122.704946-1-thuth@redhat.com>
References: <20220824151122.704946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to remove the slirp submodule from the QEMU repository, so
we should make sure to install the distro's libslirp to get the same
test coverage as before in the VMs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/freebsd      | 3 +++
 tests/vm/haiku.x86_64 | 3 ++-
 tests/vm/netbsd       | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index cd1fabde52..3643fe325d 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -63,6 +63,9 @@ class FreeBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        # libs: networking
+        "libslirp",
     ]
 
     BUILD_SCRIPT = """
diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64
index 936f7d2ae2..29668bc272 100755
--- a/tests/vm/haiku.x86_64
+++ b/tests/vm/haiku.x86_64
@@ -71,6 +71,7 @@ class HaikuVM(basevm.BaseVM):
         "devel:libpixman_1",
         "devel:libpng16",
         "devel:libsdl2_2.0",
+        "devel:libslirp",
         "devel:libsnappy",
         "devel:libssh2",
         "devel:libtasn1",
@@ -89,7 +90,7 @@ class HaikuVM(basevm.BaseVM):
         mkdir -p /usr/bin
         ln -s /boot/system/bin/env /usr/bin/env
         cd ../build
-        ../src/configure --disable-slirp {configure_opts};
+        ../src/configure {configure_opts};
         make --output-sync -j{jobs} {target} {verbose};
     """
 
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index aa883ec23c..da6773ff59 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -54,6 +54,9 @@ class NetBSDVM(basevm.BaseVM):
 
         # libs: migration
         "zstd",
+
+        # libs: networking
+        "libslirp",
     ]
 
     BUILD_SCRIPT = """
-- 
2.31.1


