Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDDA5AA84C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 08:48:35 +0200 (CEST)
Received: from localhost ([::1]:55732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0Td-0004Yf-27
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 02:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NG-00074N-OG
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:41:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0NE-0004kX-H4
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vic+0XyhfRNSP6ny+VU05BTXAsDs7H9Nq0W7LZ5xysM=;
 b=GyRX+sxIwX7T4fOnRwyjzwq8ln6DjbU7uYFxizT7qvf1PTzQKtbA9MvSJU+rTK4ACEV1Hj
 qClvZ+XCZtBR+9dCjf4ET9iN3JUF1O4k59oEuTNXwSIgT3BuyuKxQSj5UZLGEnAjN6bYwb
 0Ly7sCg0wQ9qtqP5FgCL2faHLiC9BAM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-GmVYvuMqNKywlnMy_5KRdQ-1; Fri, 02 Sep 2022 02:41:47 -0400
X-MC-Unique: GmVYvuMqNKywlnMy_5KRdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E75E61857F10;
 Fri,  2 Sep 2022 06:41:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71CD11415137;
 Fri,  2 Sep 2022 06:41:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 01/21] vdpa: Skip the maps not in the iova tree
Date: Fri,  2 Sep 2022 14:41:18 +0800
Message-Id: <20220902064138.56468-2-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Eugenio Pérez <eperezma@redhat.com>

Next patch will skip the registering of dma maps that the vdpa device
rejects in the iova tree. We need to consider that here or we cause a
SIGSEGV accessing result.

Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 3ff9ce3..983d369 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -289,6 +289,10 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         };
 
         result = vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
+        if (!result) {
+            /* The memory listener map wasn't mapped */
+            return;
+        }
         iova = result->iova;
         vhost_iova_tree_remove(v->iova_tree, result);
     }
-- 
2.7.4


