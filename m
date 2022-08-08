Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FD858C88D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:46:04 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL28x-0003ch-I5
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oL1lB-0002Wf-HU
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:21:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oL1lA-00046h-1h
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:21:29 -0400
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M1ZxJ6jN6z67n9K;
 Mon,  8 Aug 2022 20:18:44 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Mon, 8 Aug 2022 14:21:24 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 8 Aug 2022 13:21:23 +0100
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, "Shameerali Kolothum
 Thodi" <shameerali.kolothum.thodi@huawei.com>, Ben Widawsky
 <bwidawsk@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 1/2] hw/cxl: Fix memory leak in error paths
Date: Mon, 8 Aug 2022 13:20:50 +0100
Message-ID: <20220808122051.14822-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
References: <20220808122051.14822-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Use g_autofree to free the CXLFixedWindow structure if an
error occurs in configuration before we have added to
the list (via g_steal_pointer())

Fix Coverity CID: 1488872

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 483d8eb13f..faa68ef038 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -26,7 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
                                            Error **errp)
 {
-    CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
+    g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
     strList *target;
     int i;
 
@@ -64,7 +64,8 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
         fw->enc_int_gran = 0;
     }
 
-    cxl_state->fixed_windows = g_list_append(cxl_state->fixed_windows, fw);
+    cxl_state->fixed_windows = g_list_append(cxl_state->fixed_windows,
+                                             g_steal_pointer(&fw));
 
     return;
 }
-- 
2.32.0


