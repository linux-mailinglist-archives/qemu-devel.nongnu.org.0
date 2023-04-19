Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF86E78F9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 13:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp6K7-00051b-Ff; Wed, 19 Apr 2023 07:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp6Js-00050M-Pm
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:49:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pp6Jk-0005cA-6U
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 07:49:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681904982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=VnYUxPYyHyDz6UB7VbhcaGzgjifxGJV8PKgW0i/YCJU=;
 b=Ci6ltcJvHciIuFvRh8+LlgDGIZ66L87vzdwAx+Q7wN/donRKAry4x2kJGyGhRGC/GjTHkq
 qrYmQkD9kcVf7fb22VWcheU3K7sIEEat9VK6GlA0Ns9dIaRcEsnxbpl89+frl/QKR2YWXB
 1NvUdLPXhoBp5mxU/hoIBXMF9Zrka8Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-hT41vD4ZNPagcx7JwejAqg-1; Wed, 19 Apr 2023 07:49:40 -0400
X-MC-Unique: hT41vD4ZNPagcx7JwejAqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DA25884EC3;
 Wed, 19 Apr 2023 11:49:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01941410F1C;
 Wed, 19 Apr 2023 11:49:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] hw/rdma: Compile target-independent parts of the rdma code
 only once
Date: Wed, 19 Apr 2023 13:49:37 +0200
Message-Id: <20230419114937.667221-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Some files of the rdma code do not depend on any target specific
macros. Compile these only once to safe some time during the build.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/rdma/meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/rdma/meson.build b/hw/rdma/meson.build
index 7325f40c32..fc7917192f 100644
--- a/hw/rdma/meson.build
+++ b/hw/rdma/meson.build
@@ -1,10 +1,12 @@
-specific_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+softmmu_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
   'rdma.c',
   'rdma_backend.c',
-  'rdma_rm.c',
   'rdma_utils.c',
+  'vmw/pvrdma_qp_ops.c',
+))
+specific_ss.add(when: 'CONFIG_VMW_PVRDMA', if_true: files(
+  'rdma_rm.c',
   'vmw/pvrdma_cmd.c',
   'vmw/pvrdma_dev_ring.c',
   'vmw/pvrdma_main.c',
-  'vmw/pvrdma_qp_ops.c',
 ))
-- 
2.31.1


