Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E84056A9B60
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 17:08:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7wg-0007fV-J0; Fri, 03 Mar 2023 11:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wZ-0007dK-09
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pY7wX-0005jT-L7
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 11:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677859657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=43TfmiRzPU1in48uLgR11fNNvns7/DBXgMw5OmgLsVs=;
 b=S1XRBAddledF2o8h+vwQ96zWhtWcIbphU/fcYMURAZLIHhGM2G7wZxdKb/X0BrGIc2BiPN
 KoLYjt9GQZjkajrnnqSIroRhsmlk1tyOfDnsvxG5jqLLIv0iz7maQlJQbphqWcNSXaH6mO
 hM5G97g2EmvDYVD/aLYhyEuTRibGj0k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-y7EB1vjmNSO6btrdNTbdpQ-1; Fri, 03 Mar 2023 11:07:35 -0500
X-MC-Unique: y7EB1vjmNSO6btrdNTbdpQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 610433806105;
 Fri,  3 Mar 2023 16:07:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 117B3492C14;
 Fri,  3 Mar 2023 16:07:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/8] iotests: strip subdir path when listing tests
Date: Fri,  3 Mar 2023 16:07:22 +0000
Message-Id: <20230303160727.3977246-4-berrange@redhat.com>
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

When asking 'check' to list individual tests by invoking it in dry run
mode, it prints the paths to the tests relative to the base of the
I/O test directory.

When asking 'check' to run an individual test, however, it mandates that
only the unqualified test name is given, without any path prefix. This
inconsistency makes it harder to ask for a list of tests and then invoke
each one.

Thus the test listing code is change to flatten the test names, by
printing only the base name, which can be directly invoked.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/check | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index bb294ef556..f2e9d27dcf 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -184,7 +184,7 @@ if __name__ == '__main__':
         sys.exit(str(e))
 
     if args.dry_run:
-        print('\n'.join(tests))
+        print('\n'.join([os.path.basename(t) for t in tests]))
     else:
         with TestRunner(env, tap=args.tap,
                         color=args.color) as tr:
-- 
2.39.2


