Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D41B61E303
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhd9-0005rT-DL; Sun, 06 Nov 2022 10:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd6-0005qg-O9
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd5-0000vW-9m
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jgc2Fjem7BpwgiPTCbsRBwjBJpx0JqRMMK+WlDC9Di4=;
 b=QEoOCfe5YiYBhX4QRmQ6F+qf1Cas/97VhAvDqBzglPiHZUBrp/CddqjTmfLVj9WRDvKCKw
 172QhStxLTZDtxkCQck6R2IqjRYN/Txj+/HkW0eReNRQKm3h5BXKg5XrmDToaNiL7W8upF
 vaWfgLwd8A/g/fHE5j2rI3eihoMo3iE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-1vAdh6quNsumX92LMuWYyg-1; Sun, 06 Nov 2022 10:32:09 -0500
X-MC-Unique: 1vAdh6quNsumX92LMuWYyg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C2C31C06EC5;
 Sun,  6 Nov 2022 15:32:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64C3540C6EC4;
 Sun,  6 Nov 2022 15:32:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 05/12] tests/qtest/libqos/e1000e: Use IVAR shift definitions
Date: Sun,  6 Nov 2022 16:31:49 +0100
Message-Id: <20221106153156.620150-6-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

There were still some constants defined in e1000_regs.h.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221105053010.38037-1-akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/e1000e.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 05af6f2118..80b3e3db90 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -30,9 +30,9 @@
 #include "e1000e.h"
 
 #define E1000E_IVAR_TEST_CFG \
-    (E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID             | \
-     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 8)    | \
-     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << 16) | \
+    (((E1000E_RX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_RXQ0_SHIFT) | \
+     ((E1000E_TX0_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_TXQ0_SHIFT) | \
+     ((E1000E_OTHER_MSG_ID | E1000_IVAR_INT_ALLOC_VALID) << E1000_IVAR_OTHER_SHIFT) | \
      E1000_IVAR_TX_INT_EVERY_WB)
 
 #define E1000E_RING_LEN (0x1000)
-- 
2.31.1


