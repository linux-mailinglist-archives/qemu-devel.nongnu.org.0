Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C0624297
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:53:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot730-0004AI-II; Thu, 10 Nov 2022 07:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot72q-00044q-IX
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:52:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot72o-0007Vl-0x
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668084753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YaFQHuJ+gBs7mXa5s9O6Yq0lVA17Ly2iYAp3nsSWluM=;
 b=S/gU4qOlDTYqYTfs1MdkeWL0SrjuiIXSC4xqnPxZXC8LZpJXF+550buOrcopbeB2tzRgT0
 X0uKdF1A5zAkZPTjFhgJNBSXM5OFRN7JUjIAdzRbvSDae8tGHg+NNcjXxGWGxvAyQp5KfT
 84vGJc+ObhnyQL7Etpg35B6UJsXeIrg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-oNE9TYboMzusj1MW9cjG4w-1; Thu, 10 Nov 2022 07:52:29 -0500
X-MC-Unique: oNE9TYboMzusj1MW9cjG4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9D4C3C025C0;
 Thu, 10 Nov 2022 12:52:28 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1C982166B29;
 Thu, 10 Nov 2022 12:52:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/3] net: Restore printing of the help text with "-nic help"
Date: Thu, 10 Nov 2022 13:52:23 +0100
Message-Id: <20221110125224.99596-3-thuth@redhat.com>
In-Reply-To: <20221110125224.99596-1-thuth@redhat.com>
References: <20221110125224.99596-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
(it showed the available netdev backends), but this feature got broken during
some refactoring in version 6.0. Let's restore the old behavior, and while
we're at it, let's also print the available NIC models here now since this
option can be used to configure both, netdev backend and model in one go.

Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 net/net.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/net/net.c b/net/net.c
index 49cced691f..cdd3ebc515 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1569,8 +1569,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
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
2.31.1


