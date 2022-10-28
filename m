Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED06112A4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:26:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLK-0001h5-0A; Fri, 28 Oct 2022 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKX-0001Bg-Qv
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKW-0005JG-D2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjDk3N32Ab5GdCZWqvihrGb0LRqVad/AU2aP0FtzTpU=;
 b=RNa/qxNt2FMH5aFb/7AfOl+Gw3+6x0840LQxJst+1UuFoePv7zYqu/nbS/cg0KjEAysXdS
 16V+DMPO0XWLdu/N04ygm2DZMbs6xTFIE2H8DuQqZFFlOldWZ4/DjBekJOndip47n0pa/2
 zjmJcmZr9Fu270RFt99K3qlpvIqgbCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-g9QrhPdVNC6_mDYco3a50g-1; Fri, 28 Oct 2022 09:23:22 -0400
X-MC-Unique: g9QrhPdVNC6_mDYco3a50g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30D1D87B2A3;
 Fri, 28 Oct 2022 13:23:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E883D1121319;
 Fri, 28 Oct 2022 13:23:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Zhang Chen <chen.zhang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PULL 09/21] tests/qtest/cxl-test: Remove temporary directories after
 testing
Date: Fri, 28 Oct 2022 15:22:52 +0200
Message-Id: <20221028132304.829103-10-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

The cxl-test leaves some temporary directories behind. Let's
clean them up now!

Message-Id: <20221012091435.893570-1-thuth@redhat.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cxl-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index cbe0fb549b..61f25a72b6 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -101,6 +101,7 @@ static void cxl_t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_1pxb_2rp_2t3d(void)
@@ -115,6 +116,7 @@ static void cxl_1pxb_2rp_2t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_2pxb_4rp_4t3d(void)
@@ -130,6 +132,7 @@ static void cxl_2pxb_4rp_4t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 #endif /* CONFIG_POSIX */
 
-- 
2.31.1


