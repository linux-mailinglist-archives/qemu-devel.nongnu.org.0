Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DD2D3F43
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 10:57:15 +0100 (CET)
Received: from localhost ([::1]:48322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwDi-0005nr-3V
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 04:57:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw63-0005ME-JE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw60-0007P8-8o
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjhazOPgtvZ6B/zqhf9DQqbMkE3gduMMNFqxEyilhBA=;
 b=UzXN+JYTO5Qj5tCRwg5PrzDFMBBc2KEYlVQRSo30Tqz3Zmg+JaoIbPfH5hTpU34u6gSIoy
 l2AUm+XDLgM1maJ9If6FPyuRPfuXnWd6gpSoDKPmd9jdbBGUFC7pBgXcoigCl29KGVxykJ
 Mrp+W+25IDsTrsOUj5iSkWkDNplKqp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-gJ_wUNKZN0GK1E8-kdyKCg-1; Wed, 09 Dec 2020 04:49:12 -0500
X-MC-Unique: gJ_wUNKZN0GK1E8-kdyKCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5DB7107ACE3;
 Wed,  9 Dec 2020 09:49:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C28F95C23D;
 Wed,  9 Dec 2020 09:49:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/13] test-qga: fix a resource leak in
 test_qga_guest_get_osinfo()
Date: Wed,  9 Dec 2020 10:48:49 +0100
Message-Id: <20201209094856.17788-7-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alex Chen <alex.chen@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

The fixture->fd is created in fixture_setup() and, likewise, needs to be closed
in fixture_tear_down().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125102403.57709-1-alex.chen@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/test-qga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/test-qga.c b/tests/test-qga.c
index c1b173b3cb..eb33264e8e 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -111,6 +111,7 @@ fixture_tear_down(TestFixture *fixture, gconstpointer data)
 
     g_rmdir(fixture->test_dir);
     g_free(fixture->test_dir);
+    close(fixture->fd);
 }
 
 static void qmp_assertion_message_error(const char     *domain,
-- 
2.18.4


