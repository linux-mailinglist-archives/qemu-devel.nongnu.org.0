Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651B76958F0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 07:13:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRoXx-0001wH-4b; Tue, 14 Feb 2023 01:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoXs-0001vK-2k
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:12:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRoXq-0007ne-EM
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 01:12:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676355121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6zLyjzW2coplxQWhNEa5xZCZZqJPHDht9T2ys6BfN0=;
 b=d7thGflwHMXkPQBWL6VVQTmgTGF0FLnTb3GncWUOe0WarEmOyvH0UV/MJSJJmXuLrX9OfO
 bOwVm57l3SvljCiWIb878x5tzRG4+7b7xInMhLaM5YKT+IkZ2h7gN1JM3NaTsUHS32BDBg
 wOR9sDQHcMRkLEg0TKZ9WYfwNffiGqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-xozF7atuPrW1q8kUBzPpAA-1; Tue, 14 Feb 2023 01:11:58 -0500
X-MC-Unique: xozF7atuPrW1q8kUBzPpAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA6761C06EC0;
 Tue, 14 Feb 2023 06:11:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-89.pek2.redhat.com [10.72.12.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FAFA140EBF6;
 Tue, 14 Feb 2023 06:11:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 02/10] net: Restore printing of the help text with "-nic help"
Date: Tue, 14 Feb 2023 14:11:32 +0800
Message-Id: <20230214061140.36696-3-jasowang@redhat.com>
In-Reply-To: <20230214061140.36696-1-jasowang@redhat.com>
References: <20230214061140.36696-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Thomas Huth <thuth@redhat.com>

Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
(it showed the available netdev backends), but this feature got broken during
some refactoring in version 6.0. Let's restore the old behavior, and while
we're at it, let's also print the available NIC models here now since this
option can be used to configure both, netdev backend and model in one go.

Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/net.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index 476a4b7..e8cd95c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1542,8 +1542,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     const char *type;
 
     type = qemu_opt_get(opts, "type");
-    if (type && g_str_equal(type, "none")) {
-        return 0;    /* Nothing to do, default_net is cleared in vl.c */
+    if (type) {
+        if (g_str_equal(type, "none")) {
+            return 0;    /* Nothing to do, default_net is cleared in vl.c */
+        }
+        if (is_help_option(type)) {
+            GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
+            show_netdevs();
+            printf("\n");
+            qemu_show_nic_models(type, (const char **)nic_models->pdata);
+            g_ptr_array_free(nic_models, true);
+            exit(0);
+        }
     }
 
     idx = nic_get_free_idx();
-- 
2.7.4


