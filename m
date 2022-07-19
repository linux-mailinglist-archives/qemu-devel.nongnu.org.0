Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B741957A013
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 15:51:54 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDndh-0003vL-JF
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 09:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn7H-0000Dq-AB
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:18:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oDn7E-0004wE-Lk
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 09:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658236687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BYBEYk0AmND1Fp6+gIzqlGET0qgvNnhml1N8GSZbDQ=;
 b=F8fzwo6Urd5zzjeV3vevI00HK5XpEI3Yaqu3smknM1ah9/QSkZI+uk7Z3aQe3ppFpG2OUd
 r2McmJ3yCO/if7dpmSs5gvjPBztWDJN6IL+M4rFvGMg75aU47AOVVGuIzxAbSkklFLX7lR
 Uwz03K2qid7GtvKDAUZfcuApzmu44/0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-LB-a-E6GM-25IfBkd-jHgw-1; Tue, 19 Jul 2022 09:17:58 -0400
X-MC-Unique: LB-a-E6GM-25IfBkd-jHgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC5AB185A7BA;
 Tue, 19 Jul 2022 13:17:57 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-77.pek2.redhat.com [10.72.12.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B643440CFD0A;
 Tue, 19 Jul 2022 13:17:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Zhang Chen <chen.zhang@intel.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 23/24] net/colo.c: No need to track conn_list for
 filter-rewriter
Date: Tue, 19 Jul 2022 21:16:36 +0800
Message-Id: <20220719131637.46131-24-jasowang@redhat.com>
In-Reply-To: <20220719131637.46131-1-jasowang@redhat.com>
References: <20220719131637.46131-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


