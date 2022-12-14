Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3864C6E7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 11:13:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Oi5-0007ga-0k; Wed, 14 Dec 2022 05:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohu-0007cP-2d
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p5Ohj-00018y-FM
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 05:09:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671012570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LU/ar0/7i1cly4C1aLb8loaeKKkdNBeetikSG4plrLE=;
 b=e4jMTZW2RriMr3ODczGkRVNXPPwRkUfKwT+sX0/6F8gb4mbOlx4yeZV0gXkaw/u0U66a6p
 i4haFeQTzw9W2+SQRyBRdplttENqpVFuoXvLhAH1/IH08ZKShXm0i2NRCvEJRP42uK17eb
 ldFyH/fWRPqaMni91k0Qc9TK34R6lw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-o99BBWTLMEGVFUbUt-EBPQ-1; Wed, 14 Dec 2022 05:09:29 -0500
X-MC-Unique: o99BBWTLMEGVFUbUt-EBPQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B95BA181E3F4;
 Wed, 14 Dec 2022 10:09:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B497B492C14;
 Wed, 14 Dec 2022 10:09:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 08/23] scripts/make-release: Only clone single branches to
 speed up the script
Date: Wed, 14 Dec 2022 11:08:56 +0100
Message-Id: <20221214100911.165291-9-thuth@redhat.com>
In-Reply-To: <20221214100911.165291-1-thuth@redhat.com>
References: <20221214100911.165291-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Using --single-branch and --depth 1 here helps to speed up the process
a little bit and helps to save some networking bandwidth.

Message-Id: <20221128092555.37102-3-thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/make-release b/scripts/make-release
index 4be9b3b9ce..44a9d86a04 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -20,10 +20,12 @@ src="$1"
 version="$2"
 destination=qemu-${version}
 
-git clone "${src}" ${destination}
+git clone --single-branch -b "v${version}" -c advice.detachedHead=false \
+    "${src}" ${destination}
+
 pushd ${destination}
-git checkout "v${version}"
-git submodule update --init
+
+git submodule update --init --single-branch
 (cd roms/seabios && git describe --tags --long --dirty > .version)
 (cd roms/skiboot && ./make_version.sh > .version)
 # Fetch edk2 submodule's submodules, since it won't have access to them via
@@ -34,7 +36,7 @@ git submodule update --init
 # submodule dependencies, so we continue to handle these on a case-by-case
 # basis for now.
 (cd roms/edk2 && \
-    git submodule update --init -- \
+    git submodule update --init --depth 1 -- \
         ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
         BaseTools/Source/C/BrotliCompress/brotli \
         CryptoPkg/Library/OpensslLib/openssl \
-- 
2.31.1


