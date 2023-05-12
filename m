Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522C470084E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:43:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS5D-0007k2-2c; Fri, 12 May 2023 08:41:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS5B-0007jN-RO
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS57-0006ai-FQ
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6gZd8avJpwms+JFqTiFYfH/tZQkt42X+563bNXmM8LM=;
 b=Wsk6/Sy1rhAyRMOnLoE46caL2FhsDsYhueUg4ZnZUYrfsiVlWtMKj0oR9BrPOfbuD6Q02S
 7O0RgXts3hxqvJ6Sdx6zuyy8kkTcz49Z0cU7OSUYrblOBhZeHW44CXOtE8wuzcmcMMvubH
 7MgJEGSLFwMv9ZZn26Rq8l4BkSzM5ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-UijZMUL3NAmslwwfyplgqg-1; Fri, 12 May 2023 08:41:05 -0400
X-MC-Unique: UijZMUL3NAmslwwfyplgqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A558867946;
 Fri, 12 May 2023 12:41:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6C71121314;
 Fri, 12 May 2023 12:41:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 17/18] tests/qemu-iotests/172: Run QEMU with -vga none and
 -nic none
Date: Fri, 12 May 2023 14:40:32 +0200
Message-Id: <20230512124033.502654-18-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This way QEMU won't complain in case the VGA card or the NIC device
are not available in the binary, thus it won't spoil the output
and the test then passes with such QEMU binaries that have a limited
configuration, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/172 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/172 b/tests/qemu-iotests/172
index ff269ca7b5..4da0e0f2e2 100755
--- a/tests/qemu-iotests/172
+++ b/tests/qemu-iotests/172
@@ -56,7 +56,7 @@ do_run_qemu()
             done
         fi
         echo quit
-    ) | $QEMU -accel qtest -nographic -monitor stdio -serial none "$@"
+    ) | $QEMU -accel qtest -nographic -monitor stdio -serial none -vga none -nic none "$@"
     echo
 }
 
-- 
2.31.1


