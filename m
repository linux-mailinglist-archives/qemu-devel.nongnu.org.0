Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A274569910
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 06:18:37 +0200 (CEST)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9IyK-0006AS-8n
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 00:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijh-0003h0-HT
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9Ijb-0008H9-8R
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 00:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657166602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vg8eq9vfkjKWNpJJvbWz+KMxzoXB5T1FPMyw1NPbxgU=;
 b=JBDuUCoTCZYdKQOrnVV7u+O8zN5hospdIFQmsN0JOKjwKDcTHudy/Kdxmso/g+YgoHS328
 xOKMdVUx1o8qD9v7QsSV4E+fMgx97sPEPMqpSeO9EZ5DQU4Ek9SAHhiGI3615TJ+iFNNPV
 WfvbXtVlG7qt2q289/6ztZqxCuU0mLM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-OmK2Gkr7Puy7CqFXD7Un0A-1; Thu, 07 Jul 2022 00:03:13 -0400
X-MC-Unique: OmK2Gkr7Puy7CqFXD7Un0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B1DF3810D3E;
 Thu,  7 Jul 2022 04:03:13 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCE5118ECB;
 Thu,  7 Jul 2022 04:03:12 +0000 (UTC)
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
Subject: [PATCH v3 03/13] tests/vm: switch CentOS 8 to CentOS 8 Stream
Date: Thu,  7 Jul 2022 00:03:00 -0400
Message-Id: <20220707040310.4163682-4-jsnow@redhat.com>
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

The old CentOS image didn't work anymore because it was already EOL at
the beginning of 2022.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/centos | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index be4f6ff2f14..3a527c47b3d 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -1,8 +1,8 @@
 #!/usr/bin/env python3
 #
-# CentOS image
+# CentOS 8 Stream image
 #
-# Copyright 2018 Red Hat Inc.
+# Copyright 2018, 2022 Red Hat Inc.
 #
 # Authors:
 #  Fam Zheng <famz@redhat.com>
@@ -32,7 +32,7 @@ class CentosVM(basevm.BaseVM):
     """
 
     def build_image(self, img):
-        cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
+        cimg = self._download_with_cache("https://cloud.centos.org/centos/8-stream/x86_64/images/CentOS-Stream-GenericCloud-8-20220125.1.x86_64.qcow2")
         img_tmp = img + ".tmp"
         subprocess.check_call(['cp', '-f', cimg, img_tmp])
         self.exec_qemu_img("resize", img_tmp, "50G")
-- 
2.34.3


