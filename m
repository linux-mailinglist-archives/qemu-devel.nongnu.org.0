Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C445ED892
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:13:55 +0200 (CEST)
Received: from localhost ([::1]:47098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odT8c-0007wZ-6y
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLQ-0000tm-Fv
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLO-0008RH-IP
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UsJhLzu0nitUvLy8VWmP9xG5F2iel+EKXGwE+FAw14=;
 b=Sb5oS7esAFJT6ToaisOgHFY1NdLpRtkIckT35kkTZU1r7X2pFJWUpfdTkSMUV45Bvqknqw
 a1JQCy8uPyBdr6ORIyeqvtFpKldA3V90CnYElA9S+CwaBbKeYgrv2fC08AOX1wAxFMJIKp
 tN4efszg34t65dm2AvKEWvXqwChbpt8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-xb8V2QpWOQis3xblP3Ezeg-1; Wed, 28 Sep 2022 03:18:53 -0400
X-MC-Unique: xb8V2QpWOQis3xblP3Ezeg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 634623800C25;
 Wed, 28 Sep 2022 07:18:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B01840C83BB;
 Wed, 28 Sep 2022 07:18:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 03/37] tests/qtest: aspeed_smc-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:09 +0200
Message-Id: <20220928071843.1468323-4-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220925113032.1949844-7-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 05ce941566..c713a3700b 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)
     flash_reset();
 }
 
-static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
-
 int main(int argc, char **argv)
 {
+    g_autofree char *tmp_path = NULL;
     int ret;
     int fd;
 
     g_test_init(&argc, &argv, NULL);
 
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, FLASH_SIZE);
     g_assert(ret == 0);
-- 
2.31.1


