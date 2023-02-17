Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C72E69AF28
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2NO-0004i0-Uj; Fri, 17 Feb 2023 10:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NG-0004dV-59
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NE-0007Ly-FG
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQoqw2+2vTb0Eaqynz7XPISPO/9AAqmLeLRRAxVnES8=;
 b=NzB9zcJRgNScz+183HLOfkj8Q0nUjDA5R2vvfSALpJ3b1csyq2udE57sQhOsrU5PlKCvQm
 n5pMH91jm91cBpXT5tEPUcEULXEVrcGe8dltTIipotAv43LygzZ164Pj/8rm7oLQULx9e/
 O6tKQld0uDxUzqFSCuwaqFIJhjGH65M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-aImB0TmPOZyKjyVFotdD2A-1; Fri, 17 Feb 2023 10:10:04 -0500
X-MC-Unique: aImB0TmPOZyKjyVFotdD2A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77ACB3828883;
 Fri, 17 Feb 2023 15:10:04 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FB8E492C14;
 Fri, 17 Feb 2023 15:10:03 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/22] curl: Fix error path in curl_open()
Date: Fri, 17 Feb 2023 16:09:36 +0100
Message-Id: <20230217150954.283920-4-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

From: Hanna Czenczek <hreitz@redhat.com>

g_hash_table_destroy() and g_hash_table_foreach_remove() (called by
curl_drop_all_sockets()) both require the table to be non-NULL, or will
print assertion failures (just print, no abort).

There are several paths in curl_open() that can lead to the out_noclean
label without s->sockets being allocated, so clean it only if it has
been allocated.

Example reproducer:
$ qemu-img info -f http ''
qemu-img: GLib: g_hash_table_foreach_remove: assertion 'hash_table != NULL' failed
qemu-img: GLib: g_hash_table_destroy: assertion 'hash_table != NULL' failed
qemu-img: Could not open '': http curl driver cannot handle the URL '' (does not start with 'http://')

Closes: https://gitlab.com/qemu-project/qemu/-/issues/1475
Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
Message-Id: <20230206132949.92917-1-hreitz@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/curl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index cbada22e9e..ba9977af5a 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -850,8 +850,10 @@ out_noclean:
     g_free(s->username);
     g_free(s->proxyusername);
     g_free(s->proxypassword);
-    curl_drop_all_sockets(s->sockets);
-    g_hash_table_destroy(s->sockets);
+    if (s->sockets) {
+        curl_drop_all_sockets(s->sockets);
+        g_hash_table_destroy(s->sockets);
+    }
     qemu_opts_del(opts);
     return -EINVAL;
 }
-- 
2.39.2


