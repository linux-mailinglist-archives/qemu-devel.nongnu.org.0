Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C6C6A9B5D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wl-0007qM-4Z; Fri, 03 Mar 2023 11:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wi-0007m6-GA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wg-0005lq-Vs
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXP+QZ5btQMDSVmov/iZLeOsE7tEli1ClvUh6mgqdto=;
 b=Gc72IU7LuROYz92UglUkk1yM8/uG9kqldbIE2Zxu1dIyCBNhIrCj/9Kx36a/LibBB0X1FU
 Z0GP9eJw+wCWx8kyfXGxOSS0c73e+aUgOcWYMBZRtPz3IZnEjpaHD/vLbJbvejDjvoQUki
 iO/aJcGbdq1aKhM3MPJtuP8fsu0q48U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-iKesmzJRP_Owt-7mqfEPAQ-1; Fri, 03 Mar 2023 11:07:43 -0500
X-MC-Unique: iKesmzJRP_Owt-7mqfEPAQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 896E4811E9C;
 Fri,  3 Mar 2023 16:07:43 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BC57492C18;
 Fri,  3 Mar 2023 16:07:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 8/8] iotests: remove the check-block.sh script
Date: Fri,  3 Mar 2023 16:07:27 +0000
Message-Id: <20230303160727.3977246-9-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

Now that meson directly invokes the individual I/O tests, the
check-block.sh wrapper script is no longer required.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/check-block.sh | 43 -------------------------------------------
 1 file changed, 43 deletions(-)
 delete mode 100755 tests/check-block.sh

diff --git a/tests/check-block.sh b/tests/check-block.sh
deleted file mode 100755
index 5de2c1ba0b..0000000000
--- a/tests/check-block.sh
+++ /dev/null
@@ -1,43 +0,0 @@
-#!/bin/sh
-
-if [ "$#" -eq 0 ]; then
-    echo "Usage: $0 fmt..." >&2
-    exit 99
-fi
-
-# Honor the SPEED environment variable, just like we do it for "meson test"
-format_list="$@"
-if [ "$SPEED" = "slow" ] || [ "$SPEED" = "thorough" ]; then
-    group=
-else
-    group="-g auto"
-fi
-
-skip() {
-    echo "1..0 #SKIP $*"
-    exit 0
-}
-
-if [ -z "$(find . -name 'qemu-system-*' -print)" ]; then
-    skip "No qemu-system binary available ==> Not running the qemu-iotests."
-fi
-
-cd tests/qemu-iotests
-
-# QEMU_CHECK_BLOCK_AUTO is used to disable some unstable sub-tests
-export QEMU_CHECK_BLOCK_AUTO=1
-export PYTHONUTF8=1
-# If make was called with -jN we want to call ./check with -j N. Extract the
-# flag from MAKEFLAGS, so that if it absent (or MAKEFLAGS is not defined), JOBS
-# would be an empty line otherwise JOBS is prepared string of flag with value:
-# "-j N"
-# Note, that the following works even if make was called with "-j N" or even
-# "--jobs N", as all these variants becomes simply "-jN" in MAKEFLAGS variable.
-JOBS=$(echo "$MAKEFLAGS" | sed -n 's/\(^\|.* \)-j\([0-9]\+\)\( .*\|$\)/-j \2/p')
-
-ret=0
-for fmt in $format_list ; do
-    ${PYTHON} ./check $JOBS -tap -$fmt $group || ret=1
-done
-
-exit $ret
-- 
2.39.2


