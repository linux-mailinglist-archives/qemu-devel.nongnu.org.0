Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D6C698BD8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWlD-0006H7-UF; Thu, 16 Feb 2023 00:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWl4-0006GO-Mm
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWl3-0008PY-6C
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6zLyjzW2coplxQWhNEa5xZCZZqJPHDht9T2ys6BfN0=;
 b=QH21Y/Jit28G+Qfn1grga452nVFMxknBq6qBBcTqhbo6YmyChbwhP/lTieuT/ytUYY+Vgw
 NIiUDvL1w3g00TIh3mG223nBLMXJQaWEnNiS0+4YS26cY59nJRM4CMCKnO9PYJuXEY/JZo
 dI6U6DYLJY9MUo1PDBxArbs5PXnkwys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-fQ3jX1dTNL-QEeefTo3_6g-1; Thu, 16 Feb 2023 00:24:35 -0500
X-MC-Unique: fQ3jX1dTNL-QEeefTo3_6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB6E685A5A3;
 Thu, 16 Feb 2023 05:24:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-253.pek2.redhat.com
 [10.72.12.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B57E9492B0E;
 Thu, 16 Feb 2023 05:24:32 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 02/10] net: Restore printing of the help text with "-nic
 help"
Date: Thu, 16 Feb 2023 13:24:16 +0800
Message-Id: <20230216052424.50926-3-jasowang@redhat.com>
In-Reply-To: <20230216052424.50926-1-jasowang@redhat.com>
References: <20230216052424.50926-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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


