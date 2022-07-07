Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B680569902
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:11:58 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Irt-0004mk-5M
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ije-0003eP-4U
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9IjZ-0008Dn-Mx
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpLM0FT+7pHSpjWY8RUVyOzAc9Z8imqTmnKVtzrRDGQ=;
 b=iMIs/j5oWfvNAgY9q4RSvT6vCLKPaQ0qWIBam+7Fid9gFu+z9EbD+2YnYzjxsS9tpv/oFR
 03UZhbzn4l6DZ09+Yd5UGzdg0PHtOA/nN2pOioV9LZ/RXb6EO0Y3OwqCgoHhYxWWEsgRNa
 7N0O823H3boFTHJgrgCjDkeivVqUpXU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-P9Sq8jfBMxuHRjsPHNoNHA-1; Thu, 07 Jul 2022 00:03:12 -0400
X-MC-Unique: P9Sq8jfBMxuHRjsPHNoNHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E6F28032EA;
 Thu,  7 Jul 2022 04:03:12 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B02CF2EF97;
 Thu,  7 Jul 2022 04:03:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Daniel Berrange <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v3 01/13] qga: treat get-guest-fsinfo as "best effort"
Date: Thu,  7 Jul 2022 00:02:58 -0400
Message-Id: <20220707040310.4163682-2-jsnow@redhat.com>
In-Reply-To: <20220707040310.4163682-1-jsnow@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
devices we simply don't have access to in the container, and cannot
provide information about.

Instead of failing the entire fsinfo command, return stub information
for these failed lookups.

This allows test-qga to pass under docker tests, which are in turn used
by the CentOS VM tests.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qga/commands-posix.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 0469dc409d4..950c9d72fe7 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -1207,7 +1207,12 @@ static void build_guest_fsinfo_for_device(char const *devpath,
 
     syspath = realpath(devpath, NULL);
     if (!syspath) {
-        error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+        if (errno == ENOENT) {
+            /* This devpath may not exist because of container config, etc. */
+            fs->name = g_path_get_basename(devpath);
+        } else {
+            error_setg_errno(errp, errno, "realpath(\"%s\")", devpath);
+        }
         return;
     }
 
-- 
2.34.3


