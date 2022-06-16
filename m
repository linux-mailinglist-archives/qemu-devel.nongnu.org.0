Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9A354E366
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:29:47 +0200 (CEST)
Received: from localhost ([::1]:40892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qVG-0001WG-Mx
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSj-000778-1r
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1qSh-0008Io-0H
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655389626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOldU7HXmr3cSUL6y0DdrpnBSZFJz1ROhO5R9+jqjJQ=;
 b=LXtnuKpRJkGzc/A/fEO5c83Ga+BnxoPKdxXRzaWvJ8s1est+dsJTXcrmqyevZ2wqtTS58Y
 91vlmujlQxCMNSUy+PZ2qb6BYvlArZ7W55jas05CiMdMr7MGdcuMCv/7OH93FEb9j8ZHXi
 MFYB/VLAbrrivh4WyTMs/kndWcK52tg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-Gb8YCjGDNca7riC3u5PW8Q-1; Thu, 16 Jun 2022 10:27:02 -0400
X-MC-Unique: Gb8YCjGDNca7riC3u5PW8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50A06383328A;
 Thu, 16 Jun 2022 14:27:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA5052027EB4;
 Thu, 16 Jun 2022 14:27:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v2 03/10] qga: treat get-guest-fsinfo as "best effort"
Date: Thu, 16 Jun 2022 10:26:52 -0400
Message-Id: <20220616142659.3184115-4-jsnow@redhat.com>
In-Reply-To: <20220616142659.3184115-1-jsnow@redhat.com>
References: <20220616142659.3184115-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

In some container environments, there may be references to block devices
witnessable from a container through /proc/self/mountinfo that reference
devices we simply don't have access to in the container, and could not
provide information about.

Instead of failing the entire fsinfo command, return stub information
for these failed lookups.

This allows test-qga to pass under docker tests, which are in turn used
by the CentOS VM tests.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qga/commands-posix.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0469dc409d4..5989d4dca9d 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1207,7 +1207,13 @@ static void build_guest_fsinfo_for_device(char const *devpath,
 
     syspath = realpath(devpath, NULL);
     if (!syspath) {
-        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+        if (errno == ENOENT) {
+            /* This devpath may not exist because of container config, etc. */
+            fprintf(stderr, "realpath(%s) returned NULL/ENOENT\n", devpath);
+            fs->name = g_strdup("??\?-ENOENT");
+        } else {
+            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+        }
         return;
     }
 
-- 
2.34.3


