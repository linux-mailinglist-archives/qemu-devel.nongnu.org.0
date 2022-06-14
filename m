Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B9B54A3EC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:55:59 +0200 (CEST)
Received: from localhost ([::1]:37388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vmg-0006p1-9v
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhq-0006pk-4b
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o0vhj-0006OW-DB
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655171450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWPe42jfnL6jtIAqqe4lmLnly1dmgfMMPC5ab/ZpBFE=;
 b=d0fU4b45DUhLzbvB+8y0T7QFQHr9TlgsmPFZv0+9mntX1ElJcrr4CSKJQThxZl7HZTHOJk
 fzljSSN+GLREX6G/UQ68Y0znn5l7V7dZXVBMCCrFkpZMuWSOXlZB5YGOa6uXK4ipE4wxXT
 kwS9BqkwyzWW9oshYl0pwgduxb/2Lbk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-4rcn3QglNsmanz1onqRW-g-1; Mon, 13 Jun 2022 21:50:47 -0400
X-MC-Unique: 4rcn3QglNsmanz1onqRW-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A28929AA3BC;
 Tue, 14 Jun 2022 01:50:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7D172026D64;
 Tue, 14 Jun 2022 01:50:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [PATCH 3/5] tests/vm: use 'cp' instead of 'ln' for temporary vm images
Date: Mon, 13 Jun 2022 21:50:42 -0400
Message-Id: <20220614015044.2501806-4-jsnow@redhat.com>
In-Reply-To: <20220614015044.2501806-1-jsnow@redhat.com>
References: <20220614015044.2501806-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

If the initial setup fails, you've permanently altered the state of the
downloaded image in an unknowable way. Use 'cp' like our other test
setup scripts do.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/vm/centos | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/centos b/tests/vm/centos
index 5c7bc1c1a9a..be4f6ff2f14 100755
--- a/tests/vm/centos
+++ b/tests/vm/centos
@@ -34,7 +34,7 @@ class CentosVM(basevm.BaseVM):
     def build_image(self, img):
         cimg = self._download_with_cache("https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.3.2011-20201204.2.x86_64.qcow2")
         img_tmp = img + ".tmp"
-        subprocess.check_call(["ln", "-f", cimg, img_tmp])
+        subprocess.check_call(['cp', '-f', cimg, img_tmp])
         self.exec_qemu_img("resize", img_tmp, "50G")
         self.boot(img_tmp, extra_args = ["-cdrom", self.gen_cloud_init_iso()])
         self.wait_ssh()
-- 
2.34.3


