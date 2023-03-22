Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E906C6C4ACD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexi4-0006Qu-QK; Wed, 22 Mar 2023 08:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexi1-0006No-6c
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:36:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexhy-0002Iz-97
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679488609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cCukNSu5Rc5x0NXrcZy9gul+MfHzbNAmdQwKx1W0BKA=;
 b=gM/9VNNktM31t4Bt/DBYYfjj2JLai6xrMvq0mcQnsAPI8oVYMpra9yCEiYyNzI6OmowSUA
 VmG8ylgUJLZ4PQzaiVUSnNe/nnFYjSzf0qJjxpYFEiPRBkQYlJ3FuHZ4PeHN4xkZt07+ij
 6lMJmyz2WlX0Euyhg3t2MH168B6w/5M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-PJWK_9b9Po6f04iRA_3WuA-1; Wed, 22 Mar 2023 08:36:45 -0400
X-MC-Unique: PJWK_9b9Po6f04iRA_3WuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6A0C2999B31;
 Wed, 22 Mar 2023 12:36:44 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 599034021B1;
 Wed, 22 Mar 2023 12:36:43 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] tests/vm: skip X11 in openbsd installation
Date: Wed, 22 Mar 2023 12:36:38 +0000
Message-Id: <20230322123639.836104-2-berrange@redhat.com>
In-Reply-To: <20230322123639.836104-1-berrange@redhat.com>
References: <20230322123639.836104-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

As a VM used only for automated testing there is no need to
install the X11 stack.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/vm/openbsd | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index eaeb201e91..6af7afac0d 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -106,8 +106,7 @@ class OpenBSDVM(basevm.BaseVM):
         self.console_wait("Password for root account")
         self.console_send("%s\n" % self._config["root_pass"])
         self.console_wait_send("Start sshd(8)",           "yes\n")
-        self.console_wait_send("X Window System",         "\n")
-        self.console_wait_send("xenodm",                  "\n")
+        self.console_wait_send("X Window System",         "no\n")
         self.console_wait_send("console to com0",         "\n")
         self.console_wait_send("Which speed",             "\n")
 
-- 
2.39.2


