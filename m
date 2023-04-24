Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA56C6ED5E6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:08:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2P3-0007yV-8f; Mon, 24 Apr 2023 16:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2P0-0007uY-MU
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pr2Oy-00010t-Km
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 16:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682366588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TR90EIS18UVyGds2jFRXjl24pA0rHLnN+HKJ4k91mQc=;
 b=eRpCJ2zOO6cLZfVFhMhiioSeg3Psrpkfw4JqMl1flel6G5FxkkXy8Cb0zO04G72WZkx7IH
 Rm/2srvCCoAZTQ4L4GVp9wpUDSwDlMC1myYp0MXIqoy02NafH8IdLxNiu6mJNI18DVCEHO
 jBNMV7o2L24dMXfW3qXjaWpP8Gh49u0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-zhe__F8EP_u0QQ15lGpyyQ-1; Mon, 24 Apr 2023 16:03:04 -0400
X-MC-Unique: zhe__F8EP_u0QQ15lGpyyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D85F6381494C;
 Mon, 24 Apr 2023 20:03:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F5FD1121318;
 Mon, 24 Apr 2023 20:03:03 +0000 (UTC)
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
Subject: [RFC PATCH v3 19/20] configure: use --diagnose option with meson
 ensure
Date: Mon, 24 Apr 2023 16:02:47 -0400
Message-Id: <20230424200248.1183394-20-jsnow@redhat.com>
In-Reply-To: <20230424200248.1183394-1-jsnow@redhat.com>
References: <20230424200248.1183394-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

Rely on the diagnosis information from mkvenv so it can be removed from
the configure script.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 configure | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/configure b/configure
index ae55de1408..0881fffc14 100755
--- a/configure
+++ b/configure
@@ -1096,8 +1096,6 @@ fi
 
 # Resolve PATH
 python="$(command -v "$python")"
-# This variable is intended to be used only for error messages:
-target_python=$python
 
 # Create a Python virtual environment using our configured python.
 # The stdout of this script will be the location of a symlink that
@@ -1134,16 +1132,9 @@ fi
 if ! $python "${source_path}/python/scripts/mkvenv.py" ensure \
      $mkvenv_flags \
      --dir "${source_path}/python/wheels" \
+     --diagnose "meson" \
      "meson>=0.61.5" ;
 then
-    # We're very out of luck. Try to give a good diagnostic.
-    if test -e pyvenv/bin/meson; then
-        echo "Meson is too old: $(pyvenv/bin/meson --version)"
-    elif has meson ; then
-        echo "Meson was found installed on your system," \
-             "but not for the configured Python interpreter ($target_python)."
-        echo "(Hint: check '$(which meson)' to see which interpreter its shebang uses.)"
-    fi
     exit 1
 fi
 
-- 
2.39.2


