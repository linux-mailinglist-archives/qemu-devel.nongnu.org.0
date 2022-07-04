Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69404564E00
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 08:53:05 +0200 (CEST)
Received: from localhost ([::1]:36460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Fx9-000069-C2
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 02:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fnm-00019A-2S
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8Fnj-0005Zn-Pq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 02:43:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656916998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EFLRx6j5GMOx+5HQUeUBBvYGl1SF4iluq4MHmmsNN30=;
 b=FzF/od+Q3utuDYriQyjqGyEHDFN3lK1YkSk/dIO7coQZtKhFYO0w2+2VkYmpEInxeAH4Ca
 QACtgc3vi/1ai75yfOsDULnCF8laGspuMTmJIu1NmtTkyg5ykzOgg+ASv2ctKKBcenmsG/
 NSG+c0qBp/c7a0Ogq/MvtaQiFx8cfOM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-YX6g0XyUOoS1CgR2EYrdpw-1; Mon, 04 Jul 2022 02:43:10 -0400
X-MC-Unique: YX6g0XyUOoS1CgR2EYrdpw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3159918A6522;
 Mon,  4 Jul 2022 06:43:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48DD8C15D42;
 Mon,  4 Jul 2022 06:43:06 +0000 (UTC)
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
Subject: [PATCH 2/3] scripts/make-release: Do not include the skiboot sources
 in the tarball anymore
Date: Mon,  4 Jul 2022 08:42:53 +0200
Message-Id: <20220704064254.18187-3-thuth@redhat.com>
In-Reply-To: <20220704064254.18187-1-thuth@redhat.com>
References: <20220704064254.18187-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The skiboot sources are licensed under the Apache license, so we don't
have to include them in our tarball as long as we continue to distribute
the skiboot license information in our release tarball.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/make-release | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/make-release b/scripts/make-release
index f79ed7a2ae..176304f30b 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -19,7 +19,6 @@ pushd ${destination}
 git checkout "v${version}"
 git submodule update --init
 (cd roms/seabios && git describe --tags --long --dirty > .version)
-(cd roms/skiboot && ./make_version.sh > .version)
 
 # Fetch edk2 submodule's submodules to get their license information.
 # Edk2 is distributed under permissive licenses, so we don't have to
@@ -48,6 +47,20 @@ https://github.com/tianocore/edk2/archive/${edk2rev}.tar.gz
 EOF
 cd ../..
 
+# Same for skiboot - it has a permissive Apache license, so we don't
+# need to ship the sources for this.
+cd roms/skiboot
+skibootrev=$(git rev-parse --short=12 HEAD)
+head -n 38 libstb/tss2/ibmtpm20tss/utils/tss.c > LICENSE-tss.txt
+head -n 50 libfdt/fdt.c > LICENSE-libfdt.txt
+rm -r $(ls | grep -v LICEN) .[a-z]*
+cat > sources.txt <<EOF
+The skiboot sources can be downloaded from:
+
+https://github.com/open-power/skiboot/archive/${skibootrev}.tar.gz
+EOF
+cd ../..
+
 popd
 tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.31.1


