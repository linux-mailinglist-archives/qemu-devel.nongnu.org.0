Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2658E6C81C3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:48:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjT1-0005RU-VY; Fri, 24 Mar 2023 11:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSz-0005IC-AQ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjSx-0001lc-Mz
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WpAfCEnHmQYBBPL24pykNMgKZ4iaogdfdLi55BLg6xc=;
 b=GMCh7q4RsBXMLqh3cAC6ys8xim1lIRQG7cQAe4u3iN6vN8jnjakSoaCaanFYjJxwGZg7b3
 PEmS/M3LMnPEXDdlrZoCym2bedGH/Sm/S/dlw+w78q6ugPcL34iUxgMUTI95M+qag6TEu8
 dNhFlqEK+Jd0JTpzqYdPPfE9fILV90E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-P1nyTu8SN9WeaRVOl4E38A-1; Fri, 24 Mar 2023 11:36:25 -0400
X-MC-Unique: P1nyTu8SN9WeaRVOl4E38A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 323C4802314;
 Fri, 24 Mar 2023 15:36:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 701D8140EBF4;
 Fri, 24 Mar 2023 15:36:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jintao Yin <nicememory@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 5/8] ui/spice: fix compilation on win32
Date: Fri, 24 Mar 2023 16:36:07 +0100
Message-Id: <20230324153610.224673-6-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu_close_to_socket() renaming left-over.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1553
Fixes: commit e40283d9a ("ui/spice: fix SOCKET handling regression")
Reported-by: Jintao Yin <nicememory@gmail.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 ui/spice-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index 67cfd3ca9c..52a59386d7 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -149,7 +149,7 @@ static void watch_remove(SpiceWatch *watch)
     qemu_set_fd_handler(watch->fd, NULL, NULL, NULL);
 #ifdef WIN32
     /* SOCKET is owned by spice */
-    qemu_close_to_socket(watch->fd);
+    qemu_close_socket_osfhandle(watch->fd);
 #endif
     g_free(watch);
 }
-- 
2.31.1


