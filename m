Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585815A6D6A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:31:42 +0200 (CEST)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6xZ-00068H-Bt
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:31:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6Aa-0007jA-4x
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:41:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AY-0005D8-40
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G3J0T4pyxGUW5HBLSghg+vnki/GvZkhhXCA8w74wPQs=;
 b=TzW5muNe9RQijO29mQ22/AOWlCCHWvLtFvMIevUL7GHaYVw9MSkEe7INs/56ZY0MBorLfH
 NT/9FoxSKkz0Ib42XVsaiGb5FzNjn+J+DIAc42kxNB6r5B1hpGH5c253oAz66otGHv+HJw
 Bh0dM6PCQs4DpxX+c/n1Na7YGEXU1ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-ntJRpunnN_KqCqPJj4Lkmw-1; Tue, 30 Aug 2022 14:40:55 -0400
X-MC-Unique: ntJRpunnN_KqCqPJj4Lkmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D858811E80;
 Tue, 30 Aug 2022 18:40:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68FD01415117;
 Tue, 30 Aug 2022 18:40:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 23/23] tests/avocado/migration: Get find_free_port() from the
 ports
Date: Tue, 30 Aug 2022 20:40:12 +0200
Message-Id: <20220830184012.77978-24-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

In upstream Avocado, the find_free_port() function is not available
from "network" anymore, but must be used via "ports", see:

 https://github.com/avocado-framework/avocado/commit/22fc98c6ff76cc55c48

To be able to update to a newer Avocado version later, let's use
the new way for accessing the find_free_port() function here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220829121939.209329-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/migration.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 584d6ef53f..4b25680c50 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -14,7 +14,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
-from avocado.utils import network
+from avocado.utils.network import ports
 from avocado.utils import wait
 from avocado.utils.path import find_command
 
@@ -57,7 +57,7 @@ def do_migrate(self, dest_uri, src_uri=None):
         self.assert_migration(source_vm, dest_vm)
 
     def _get_free_port(self):
-        port = network.find_free_port()
+        port = ports.find_free_port()
         if port is None:
             self.cancel('Failed to find a free port')
         return port
-- 
2.31.1


