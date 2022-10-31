Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870BD613B12
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXVe-0006Wz-LT; Mon, 31 Oct 2022 12:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1opXVT-0006Vs-OX
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:23 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1opXVR-0001Me-NT
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:23 -0400
HMM_SOURCE_IP: 172.18.0.218:50162.1127588867
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id BF3CC2800E7;
 Tue,  1 Nov 2022 00:19:17 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id 28fbe3e7e8e0489e838bb85805d792cc for
 qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:19:19 CST
X-Transaction-ID: 28fbe3e7e8e0489e838bb85805d792cc
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH RFC 3/4] hmp: Add netdev information into output of hmp cmd
 "info network"
Date: Tue,  1 Nov 2022 00:19:01 +0800
Message-Id: <fadce5d82f25dd5f489b9a6f76d27aa25d3c22a4.1667232396.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1667232396.git.huangy81@chinatelecom.cn>
References: <cover.1667232396.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Add netdev information into output of hmp command hmp_info_network
so developers can analyze interface capability more easily.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 net/net.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/net.c b/net/net.c
index c27ebfa..9325628 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1330,6 +1330,21 @@ void print_net_client(Monitor *mon, NetClientState *nc)
                    nc->queue_index,
                    NetClientDriver_str(nc->info->type),
                    nc->info_str);
+    if (nc->info->type != NET_CLIENT_DRIVER_NIC) {
+        NetDevInfo *info = query_netdev(nc);
+        if (info) {
+            monitor_printf(mon, "netdev info: ufo=%s, vnet-hdr=%s, "
+                "vnet-hdr-len=%s", info->ufo ? "on" : "off",
+                info->vnet_hdr ? "on" : "off",
+                info->vnet_hdr_len ? "on" : "off");
+            if (info->has_acked_features) {
+                monitor_printf(mon, ", acked-features=0x%" PRIx64,
+                    info->acked_features);
+            }
+            monitor_printf(mon, "\n");
+            g_free(info);
+        }
+    }
     if (!QTAILQ_EMPTY(&nc->filters)) {
         monitor_printf(mon, "filters:\n");
     }
-- 
1.8.3.1


