Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E006ED5D7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:05:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2P1-0007vG-Nq; Mon, 24 Apr 2023 16:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oz-0007sP-H8
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Ow-00010Y-UI
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNP+fL23B81VoPR+iHM5CGssB9x+3X4xqlu1OkuBfxU=;
 b=aTVRJ+24AgYRZLWhM04LfOc2XN3JtiX+Q1hTD5gmpE1x66FiDUTQj0tidtAcQta+v8B2/z
 eI/3l9EubTTqpM8vrmh/YfMoknkDUYzal6rF5Z8wj27nF3bEhJxELLwwWttd9DSTqR9lQZ
 TufCGLS2QrbVFmiei6KYQIosqiaIkpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-nUSzrq90PoaTenqd1zhgTg-1; Mon, 24 Apr 2023 16:03:02 -0400
X-MC-Unique: nUSzrq90PoaTenqd1zhgTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58CC685A5A3;
 Mon, 24 Apr 2023 20:03:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CB261121319;
 Mon, 24 Apr 2023 20:03:01 +0000 (UTC)
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
Subject: [RFC PATCH v3 17/20] configure: move --enable-docs and --disable-docs
 back to configure
Date: Mon, 24 Apr 2023 16:02:45 -0400
Message-Id: <20230424200248.1183394-18-jsnow@redhat.com>
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

Move this option back from meson into configure for the purposes of
using the configuration value to bootstrap Sphinx in different ways
based on this value.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index 7421bb8364..ae55de1408 100755
--- a/configure
+++ b/configure
@@ -279,6 +279,7 @@ debug_tcg="no"
 sanitizers="no"
 tsan="no"
 fortify_source="yes"
+docs="auto"
 EXESUF=""
 modules="no"
 prefix="/usr/local"
@@ -752,6 +753,10 @@ for opt do
   ;;
   --disable-debug-info) meson_option_add -Ddebug=false
   ;;
+  --enable-docs) docs=enabled
+  ;;
+  --disable-docs) docs=disabled
+  ;;
   --enable-modules)
       modules="yes"
   ;;
@@ -2638,6 +2643,7 @@ if test "$skip_meson" = no; then
 
   # QEMU options
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi"
+  test "$docs" != auto && meson_option_add "-Ddocs=$docs"
   test "$fdt" != auto && meson_option_add "-Dfdt=$fdt"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
   test "$qemu_suffix" != qemu && meson_option_add "-Dqemu_suffix=$qemu_suffix"
-- 
2.39.2


