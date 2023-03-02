Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30266A8362
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXipx-0002KQ-VV; Thu, 02 Mar 2023 08:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipu-0002IB-K9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipr-0001rl-Ln
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78j68EqFJb/Pu9EOG2RpQBEeLLVGbAplln7zcst8zGg=;
 b=DI40g6NLgULLq5CPFMvETbD5f+HVcN/kVPHeb/9e+y78JQFCrWe4oDNMpsSFpS3B1MYkhj
 gzwIghq7Gc+tVTSIkfQvaPv61RfQthEzLyAlKPIU4SNPe4x8PgbRNEnV27eGOJeSpP20Oe
 e3sOCB6bqhV+JVnnLSptOjMFHm40Mos=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-y89D-L0kMgy3XAvlePnSSA-1; Thu, 02 Mar 2023 08:19:01 -0500
X-MC-Unique: y89D-L0kMgy3XAvlePnSSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE98E18E0921;
 Thu,  2 Mar 2023 13:19:00 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5EF51FF;
 Thu,  2 Mar 2023 13:18:59 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/4] build-sys: prevent meson from downloading wrapped
 subprojects
Date: Thu,  2 Mar 2023 17:18:46 +0400
Message-Id: <20230302131848.1527460-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following patches are going to introduce meson wrap dependencies,
which is a solution to download and build missing dependencies.

The QEMU build-system will do network access with no way to avoid the
fallback. As a start, hardcode "--wrap-mode=nodownload" in configure, so
that wraps would be used only after a conscious decision of the user to
use "meson subprojects download" (before running configure).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 2a8a9be8a1..02b4aa4ce9 100755
--- a/configure
+++ b/configure
@@ -2585,6 +2585,10 @@ if test "$skip_meson" = no; then
 
   rm -rf meson-private meson-info meson-logs
 
+  # Prevent meson from automatically downloading wrapped subprojects when missing.
+  # You can use 'meson subprojects download' before running configure.
+  meson_option_add "--wrap-mode=nodownload"
+
   # Built-in options
   test "$bindir" != "bin" && meson_option_add "-Dbindir=$bindir"
   test "$default_feature" = no && meson_option_add -Dauto_features=disabled
-- 
2.39.2


