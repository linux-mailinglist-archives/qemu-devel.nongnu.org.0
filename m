Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5557B3F7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 11:36:43 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE68I-00063i-Oi
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 05:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dH-0000kU-Cb
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oE5dF-0001Xq-Qm
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 05:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658307877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BYBEYk0AmND1Fp6+gIzqlGET0qgvNnhml1N8GSZbDQ=;
 b=C+G/MOOuOoaTZ+2HMeWp+U8HEuk73GTZZqlzkItLd5JFPtaT+YRwndumyoUfQ/OmI0NdSu
 RYvN4KfAadL17gmpxk/apZRU9SvoCrYvCOt3E4XlRgG0nxW02w0i/K5pd0ff3ce1GO3ERZ
 PL2qAt7btEJ3MwQh+Zh5ksoSwdqGAdo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-uvLGppmlP2C0uavfsj_k5Q-1; Wed, 20 Jul 2022 05:04:33 -0400
X-MC-Unique: uvLGppmlP2C0uavfsj_k5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DCF185A581;
 Wed, 20 Jul 2022 09:04:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-110.pek2.redhat.com
 [10.72.13.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13847492C3B;
 Wed, 20 Jul 2022 09:04:30 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 24/25] net/colo.c: No need to track conn_list for
 filter-rewriter
Date: Wed, 20 Jul 2022 17:03:12 +0800
Message-Id: <20220720090313.55169-25-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
References: <20220720090313.55169-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Zhang Chen <chen.zhang@intel.com>

Filter-rewriter no need to track connection in conn_list.
This patch fix the glib g_queue_is_empty assertion when COLO guest
keep a lot of network connection.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo.c b/net/colo.c
index 1f8162f..694f3c9 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -218,7 +218,7 @@ Connection *connection_get(GHashTable *connection_track_table,
             /*
              * clear the conn_list
              */
-            while (!g_queue_is_empty(conn_list)) {
+            while (conn_list && !g_queue_is_empty(conn_list)) {
                 connection_destroy(g_queue_pop_head(conn_list));
             }
         }
-- 
2.7.4


