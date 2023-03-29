Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E3C6CD98A
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 14:47:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVBc-0007Wg-8D; Wed, 29 Mar 2023 08:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVBW-0007W4-3U
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phVBS-0002It-Lf
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 08:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680093945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xYfmqc3RPbur6z4lDg39j0H+zMljD0hG4O8fgawMQug=;
 b=fKFckTckILUsi69IUjtKb408AVOxKbvhVgzWpcIK9Wl6VDtFRUfrO/gJj9/TQ9BuY/Sx94
 YICQQVZ2lCA1ZwgiT9x08GAt9u92kz9ioVIV6rx8MK6jfL/NqC5vGsY8X8SF+nlNFsWnvs
 E6igKPuDaIwD1B4T/TXVq2M+lKKoIrA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-7Rgku2mHNfGGm2JVvUcQoA-1; Wed, 29 Mar 2023 08:45:41 -0400
X-MC-Unique: 7Rgku2mHNfGGm2JVvUcQoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 159953822DE8;
 Wed, 29 Mar 2023 12:45:40 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D166B1121330;
 Wed, 29 Mar 2023 12:45:39 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH for 8.0] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Date: Wed, 29 Mar 2023 08:45:39 -0400
Message-Id: <20230329124539.822022-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The 'check' script will use "#!/usr/bin/env python3" by default
to locate python, but this doesn't work in distros which lack a
bare 'python3' binary like NetBSD.

We need to explicitly invoke 'check' by referring to the 'python'
variable in meson, which resolves to the detected python binary
that QEMU intends to use.

This fixes a regression introduced by

  commit 51ab5f8bd795d8980351f8531e54995ff9e6d163
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Mar 15 17:43:23 2023 +0000

    iotests: register each I/O test separately with meson

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index a162f683ef..9735071a29 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -47,19 +47,20 @@ foreach format, speed: qemu_iotests_formats
   endif
 
   rc = run_command(
-      [qemu_iotests_check_cmd] + args + ['-n'],
+      [python, qemu_iotests_check_cmd] + args + ['-n'],
       check: true,
   )
 
   foreach item: rc.stdout().strip().split()
-      args = ['-tap', '-' + format, item,
+      args = [qemu_iotests_check_cmd,
+              '-tap', '-' + format, item,
               '--source-dir', meson.current_source_dir(),
               '--build-dir', meson.current_build_dir()]
       # Some individual tests take as long as 45 seconds
       # Bump the timeout to 3 minutes for some headroom
       # on slow machines to minimize spurious failures
       test('io-' + format + '-' + item,
-           qemu_iotests_check_cmd,
+           python,
            args: args,
            depends: qemu_iotests_binaries,
            env: qemu_iotests_env,
-- 
2.39.1


