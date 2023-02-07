Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E968E1C0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:16:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUND-000748-I9; Tue, 07 Feb 2023 15:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUN2-0006ui-ET
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMy-0007Pt-LD
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIuywMu9ggagVPzhIb0moXB4/DolPh8FkfLEYJfnjWI=;
 b=VjQkRkIlQu0uAjG2sIRs8Yq8LxYAX+/EIH7wY6UjmWlhfva76XF0v3dm/DS6+txhlkwSQC
 n0c3ZFDIMMT3GzoZvX+7j/ekFIYeeOZq2vIHt9kzIO3FhFeJ2NQRpOPBDYwk9IiIdmSJqf
 s+m6kskArhYzbsBaARcm2Wq5fShae3A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-czp0Z23mM_aU8K23m9bTYw-1; Tue, 07 Feb 2023 15:15:04 -0500
X-MC-Unique: czp0Z23mM_aU8K23m9bTYw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 798691C05143;
 Tue,  7 Feb 2023 20:15:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CDC1492B21;
 Tue,  7 Feb 2023 20:15:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 4/5] .gitlab-ci.d/buildtest-template: Simplify the
 configure step
Date: Tue,  7 Feb 2023 21:14:46 +0100
Message-Id: <20230207201447.566661-5-thuth@redhat.com>
In-Reply-To: <20230207201447.566661-1-thuth@redhat.com>
References: <20230207201447.566661-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

It's easier to use ${TARGETS:+--target-list="$TARGETS"} to add
a --target-list parameter depending on whether the TARGETS variable
is set or not.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 73ecfabb8d..4a922d9c33 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -11,12 +11,10 @@
       fi
     - mkdir build
     - cd build
-    - if test -n "$TARGETS";
-      then
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ;
-      else
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ;
-      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - ../configure --enable-werror --disable-docs
+          ${LD_JOBS:+--meson=git} ${TARGETS:+--target-list="$TARGETS"}
+          $CONFIGURE_ARGS ||
+      { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
         ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
-- 
2.31.1


