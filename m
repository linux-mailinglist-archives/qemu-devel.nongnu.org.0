Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92729564DF7
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 08:49:35 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ftm-0004qx-MN
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 02:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fne-00012f-69
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fna-0005Yi-Ns
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UxlQh1idZfTCUmtRfa0H3hKdPeUurQhB6klVVfQKBag=;
 b=NBR3gs2K8LNg31lYsL1QsZYEx6+UG9B6z0nkbTSGTlsnxkHcKbCiTv+DHBbLO65aymGtg6
 NpDZlWcutwjXsoKxtsdyY4IqJkubfI7qw8IjRRW41lWqO/GsGbG9B3vwmlHBv5bgc5L3uO
 nNup3RAulDaVFiuiRybqbc//IwrGvi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-AEze4FZuNAC-YlkRMUJRpQ-1; Mon, 04 Jul 2022 02:43:06 -0400
X-MC-Unique: AEze4FZuNAC-YlkRMUJRpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA15185A582;
 Mon,  4 Jul 2022 06:43:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5776CC27D8F;
 Mon,  4 Jul 2022 06:43:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>
Subject: [PATCH 1/3] scripts/make-release: Do not include the edk2 sources in
 the tarball anymore
Date: Mon,  4 Jul 2022 08:42:52 +0200
Message-Id: <20220704064254.18187-2-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-1-thuth@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

The edk2 sources are bigger than the sources of QEMU - so they double the
size of our release tarballs if we include them. Fortunately, edk2 has a
permissive license, so there is no need for us to do this as long as we
continue to distribute the edk2 license information in our release tarball.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/scripts/make-release b/scripts/make-release
index 05b14ecc95..f79ed7a2ae 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -20,19 +20,34 @@ git checkout "v${version}"
 git submodule update --init
 (cd roms/seabios && git describe --tags --long --dirty > .version)
 (cd roms/skiboot && ./make_version.sh > .version)
-# Fetch edk2 submodule's submodules, since it won't have access to them via
-# the tarball later.
+
+# Fetch edk2 submodule's submodules to get their license information.
+# Edk2 is distributed under permissive licenses, so we don't have to
+# include the full source tree here (which is bigger than QEMU's sources)
+# as long as we provide the license information in the tarball.
 #
 # A more uniform way to handle this sort of situation would be nice, but we
 # don't necessarily have much control over how a submodule handles its
 # submodule dependencies, so we continue to handle these on a case-by-case
 # basis for now.
-(cd roms/edk2 && \
-    git submodule update --init -- \
+cd roms/edk2
+git submodule update --init --depth 1 -- \
         ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
         BaseTools/Source/C/BrotliCompress/brotli \
-        CryptoPkg/Library/OpensslLib/openssl \
-        MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
+        CryptoPkg/Library/OpensslLib/openssl
+mv ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
+   License-softfloat.txt
+mv BaseTools/Source/C/BrotliCompress/brotli/LICENSE License-brotli.txt
+mv CryptoPkg/Library/OpensslLib/openssl/LICENSE License-openssl.txt
+edk2rev=$(git rev-parse --short=12 HEAD)
+rm -r $(ls | grep -v License) .[a-z]*
+cat > sources.txt <<EOF
+The edk2 sources can be downloaded from:
+
+https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
+EOF
+cd ../..
+
 popd
 tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.31.1


