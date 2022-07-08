Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22656BD93
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 18:08:36 +0200 (CEST)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9qWx-0004tc-IZ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 12:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0k-0006s1-Vi
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o9q0g-0007Ng-KM
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657294514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5oxG69RkDYe6wzqgETjycuTo0rQJHTL2aCLAJjzwHw=;
 b=USuTQkDmz5ykWXUti6UN8nNEfy6a6rzrfZ/majiepZGG6B9JvqL3lubPDVvoSdqGr7+9Zb
 /l+sHhGSpVWiqH6WqJjxGWZYeMtYxBMA5kTeUQA8fnvVcEg6GU3SqlhmsKYoTYYkX5Ej4+
 Ec0yae2SEbBjHsIlFhWeXSvQDWBWAcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434--7fVtwnQM6uDQiZnlx-HAA-1; Fri, 08 Jul 2022 11:35:10 -0400
X-MC-Unique: -7fVtwnQM6uDQiZnlx-HAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07E6C83397C;
 Fri,  8 Jul 2022 15:35:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 911139D7F;
 Fri,  8 Jul 2022 15:35:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Berrange <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH v4 09/12] tests/vm: Remove docker cross-compile test from
 CentOS VM
Date: Fri,  8 Jul 2022 11:35:00 -0400
Message-Id: <20220708153503.18864-10-jsnow@redhat.com>
In-Reply-To: <20220708153503.18864-1-jsnow@redhat.com>
References: <20220708153503.18864-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The fedora container has since been split apart, so there's no suitable
nearby target that would support "test-mingw" as it requires both x32
and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
would be truly suitable.

Just remove this test as superfluous with our current CI infrastructure.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/vm/centos | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index 3a527c47b3d..097a9ca14d3 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -28,7 +28,6 @@ class CentosVM(basevm.BaseVM):
         tar -xf $SRC_ARCHIVE;
         make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
         make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
-        make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;
     """
 
     def build_image(self, img):
-- 
2.34.3


