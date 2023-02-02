Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1A6883DB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:12:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNc9V-00061j-2J; Thu, 02 Feb 2023 11:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc9J-0004rX-KN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNc9I-0005XW-4C
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675354159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLTUIKkYKLDqvnCZf7ylBVeUifFGysX8cjMj/PMEy8c=;
 b=cCoDxL6oXVAdc+bWmeFZqbNcNF9wQ6GBP4jFR84IyriobaXJ+631uZQEqb8gi5+DlYm11M
 fYzAMm2Ugg6JUaAnM2a2NNUmuDng0TAhzBB7yM7GQU6j2oJOKrdCwq2Pye9dv726Qfchzj
 sF5veEnotCVTmXcmJw6g5xLh1culOXg=
Received: from mimecast-mx02.redhat.com (66.187.233.88 [66.187.233.88]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-sosyOImzMxW_5ShJ5sczkA-1; Thu, 02 Feb 2023 11:09:13 -0500
X-MC-Unique: sosyOImzMxW_5ShJ5sczkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BB21804BAE;
 Thu,  2 Feb 2023 16:08:33 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFD051FF;
 Thu,  2 Feb 2023 16:08:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Eric Farman <farman@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-s390x@nongnu.org, Fiona Ebner <f.ebner@proxmox.com>,
 Zhang Chen <chen.zhang@intel.com>
Subject: [PULL 21/26] migration/rdma: fix return value for
 qio_channel_rdma_{readv, writev}
Date: Thu,  2 Feb 2023 17:06:35 +0100
Message-Id: <20230202160640.2300-22-quintela@redhat.com>
In-Reply-To: <20230202160640.2300-1-quintela@redhat.com>
References: <20230202160640.2300-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Fiona Ebner <f.ebner@proxmox.com>

upon errors. As the documentation in include/io/channel.h states, only
-1 and QIO_CHANNEL_ERR_BLOCK should be returned upon error. Other
values have the potential to confuse the call sites.

error_setg is used rather than error_setg_errno, because there are
certain code paths where -1 (as a non-errno) is propagated up (e.g.
starting from qemu_rdma_block_for_wrid or qemu_rdma_post_recv_control)
all the way to qio_channel_rdma_{readv,writev}.

Similar to a216ec85b7 ("migration/channel-block: fix return value for
qio_channel_block_{readv,writev}").

Suggested-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 94a55dd95b..0ba1668d70 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -2785,7 +2785,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
     rdma = qatomic_rcu_read(&rioc->rdmaout);
 
     if (!rdma) {
-        return -EIO;
+        error_setg(errp, "RDMA control channel output is not set");
+        return -1;
     }
 
     CHECK_ERROR_STATE();
@@ -2797,7 +2798,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
     ret = qemu_rdma_write_flush(f, rdma);
     if (ret < 0) {
         rdma->error_state = ret;
-        return ret;
+        error_setg(errp, "qemu_rdma_write_flush returned %d", ret);
+        return -1;
     }
 
     for (i = 0; i < niov; i++) {
@@ -2816,7 +2818,8 @@ static ssize_t qio_channel_rdma_writev(QIOChannel *ioc,
 
             if (ret < 0) {
                 rdma->error_state = ret;
-                return ret;
+                error_setg(errp, "qemu_rdma_exchange_send returned %d", ret);
+                return -1;
             }
 
             data += len;
@@ -2867,7 +2870,8 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
     rdma = qatomic_rcu_read(&rioc->rdmain);
 
     if (!rdma) {
-        return -EIO;
+        error_setg(errp, "RDMA control channel input is not set");
+        return -1;
     }
 
     CHECK_ERROR_STATE();
@@ -2903,7 +2907,8 @@ static ssize_t qio_channel_rdma_readv(QIOChannel *ioc,
 
         if (ret < 0) {
             rdma->error_state = ret;
-            return ret;
+            error_setg(errp, "qemu_rdma_exchange_recv returned %d", ret);
+            return -1;
         }
 
         /*
-- 
2.39.1


