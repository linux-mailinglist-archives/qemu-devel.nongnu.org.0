Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932936ED5D4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:04:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2Oz-0007rW-0N; Mon, 24 Apr 2023 16:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ow-0007p8-R4
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ov-0000zx-Af
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wUtFzNljOU7mzy+l7MmVIk6x++rYT/1ibuCHaDggM+s=;
 b=h0fRg+5ZAghV/jH9wabeU6kk0si9DReFKcykj2ZElJ3plAKDedT8zMDfE0jIe4y2L8+Yup
 /RpQfTveyUfXGe8ta0S3sYhQpZlsrz8Pa4cKFPb0+Y/VVAY1kBQa+zpHDU9hV2TDueAVnL
 xe+q9ovBncjaYWzMyCYT2iK88jzd4cU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-9Ie0OmxcMlC3uAns0KiVAA-1; Mon, 24 Apr 2023 16:02:59 -0400
X-MC-Unique: 9Ie0OmxcMlC3uAns0KiVAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8969687B2A6;
 Mon, 24 Apr 2023 20:02:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2CE51121318;
 Mon, 24 Apr 2023 20:02:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v3 12/20] scripts/make-release: download meson==0.61.5 .whl
Date: Mon, 24 Apr 2023 16:02:40 -0400
Message-Id: <20230424200248.1183394-13-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In preference to vendoring meson source, vendor a built
distributable. This has two benefits:

(1) We can get rid of a git submodule,
(2) Installing built meson into a venv doesn't require any extra dependencies.

RFC:

The alternative approach is to just check in the .whl file into the git
tree directly, and have it available for both git and tarball
installations. That approach slightly changes the necessity of some
subsequent patches, but otherwise either way will work.

Owing to how "mkvenv ensure" will prefer vendored files prior to
connecting to PyPI, checking in a vendored meson file in this manner
means we will generally never use PyPI to install meson ever.

("Vote now on your phones.")

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/make-release | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/make-release b/scripts/make-release
index 44a9d86a04..a59bad11f9 100755
--- a/scripts/make-release
+++ b/scripts/make-release
@@ -41,6 +41,17 @@ git submodule update --init --single-branch
         BaseTools/Source/C/BrotliCompress/brotli \
         CryptoPkg/Library/OpensslLib/openssl \
         MdeModulePkg/Library/BrotliCustomDecompressLib/brotli)
+
+# Handle vendoring Python dependencies:
+mkdir python/wheels
+pushd python/wheels
+pip download meson==0.61.5
+sha256sum -c <<EOF
+58c2ddb5f885da0e929f15d89f38d8a7d97f981f56815bcba008414f8511f59a meson-0.61.5-py3-none-any.whl
+EOF
 popd
+
+popd
+
 tar --exclude=.git -cjf ${destination}.tar.bz2 ${destination}
 rm -rf ${destination}
-- 
2.39.2


