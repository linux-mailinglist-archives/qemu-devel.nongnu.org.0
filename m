Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7376A9B64
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wj-0007nZ-Sz; Fri, 03 Mar 2023 11:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wh-0007lP-SF
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wg-0005la-2L
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1bKkjmVZRsM4WdYPvIOEvaC+vfwnALk1lioaQDxSfw=;
 b=ahKAD1Y9JjMZgb6LLY2NKrB/uIvFq3UCjPm0FwSZmTbN8qq9ZP2KGRnHxHJbScA9Z5yn1D
 8NGQHG40dyQdpD/5n9uDTsh2IN27BZQX87qcnKvak3vPmKtPxWKCSO5O+/47N98p5rmMKO
 tVUJ0jAndnp1epLlNP+2O1Xy4quH8Gw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-4rUEFYJCNiSvlnF849urzA-1; Fri, 03 Mar 2023 11:07:42 -0500
X-MC-Unique: 4rUEFYJCNiSvlnF849urzA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE569882820;
 Fri,  3 Mar 2023 16:07:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91EFB492C14;
 Fri,  3 Mar 2023 16:07:40 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 7/8] iotests: register each I/O test separately with meson
Date: Fri,  3 Mar 2023 16:07:26 +0000
Message-Id: <20230303160727.3977246-8-berrange@redhat.com>
In-Reply-To: <20230303160727.3977246-1-berrange@redhat.com>
References: <20230303160727.3977246-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Currently meson registers a single test that invokes an entire group of
I/O tests, hiding the test granularity from meson. There are various
downsides of doing this

 * You cannot ask 'meson test' to invoke a single I/O test
 * The meson test timeout can't be applied to the individual
   tests
 * Meson only gets a pass/fail for the overall I/O test group
   not individual tests
 * If a CI job gets killed by the GitLab timeout, we don't
   get visibility into how far through the I/O tests
   execution got.

This switches meson to perform test discovery by invoking 'check' in
dry-run mode. It then registers one meson test case for each I/O
test. Parallel execution remains disabled since the I/O tests do not
use self contained execution environments and thus conflict with
each other.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/meson.build | 35 ++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index 323a4acb6a..a162f683ef 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -32,16 +32,39 @@ foreach k, v : emulators
   endif
 endforeach
 
+qemu_iotests_check_cmd = files('check')
+
 foreach format, speed: qemu_iotests_formats
   if speed == 'quick'
     suites = 'block'
   else
     suites = ['block-' + speed, speed]
   endif
-  test('qemu-iotests ' + format, sh, args: [files('../check-block.sh'), format],
-       depends: qemu_iotests_binaries, env: qemu_iotests_env,
-       protocol: 'tap',
-       suite: suites,
-       timeout: 0,
-       is_parallel: false)
+
+  args = ['-tap', '-' + format]
+  if speed == 'quick'
+      args += ['-g', 'auto']
+  endif
+
+  rc = run_command(
+      [qemu_iotests_check_cmd] + args + ['-n'],
+      check: true,
+  )
+
+  foreach item: rc.stdout().strip().split()
+      args = ['-tap', '-' + format, item,
+              '--source-dir', meson.current_source_dir(),
+              '--build-dir', meson.current_build_dir()]
+      # Some individual tests take as long as 45 seconds
+      # Bump the timeout to 3 minutes for some headroom
+      # on slow machines to minimize spurious failures
+      test('io-' + format + '-' + item,
+           qemu_iotests_check_cmd,
+           args: args,
+           depends: qemu_iotests_binaries,
+           env: qemu_iotests_env,
+           protocol: 'tap',
+           timeout: 180,
+           suite: suites)
+  endforeach
 endforeach
-- 
2.39.2


