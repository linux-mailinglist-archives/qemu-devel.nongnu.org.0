Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1A68DF52
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:51:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPS6Q-0005Yd-KS; Tue, 07 Feb 2023 12:49:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPS6O-0005YS-PN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:49:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPS6N-0006hX-0U
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675792194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Fc5ve2HitVoG8eAdYKdUUo7A0a6G2jpLgQnR5sQYik=;
 b=T+bSyV4zydTv9Xx9IdRHMDp7fjrXo8bsS9XDUf5o52prjuwyPbi414MN1wzRsvSGmc5ban
 j1IUXYObAKMko35Hg/xYzsxpadxiZv60W8JfLHNZUecotvEhIO66UgSLwHyal29JjfcbtT
 Deo5gikK9wHS1giP3UwygYh3I0D7zD8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-QZr119ryNHOePOeka055cA-1; Tue, 07 Feb 2023 12:49:51 -0500
X-MC-Unique: QZr119ryNHOePOeka055cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77419811E6E;
 Tue,  7 Feb 2023 17:49:50 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A15A91121314;
 Tue,  7 Feb 2023 17:49:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, thuth@redhat.com, philmd@linaro.org
Cc: david.daney@fungible.com
Subject: [PATCH] virtio-rng-pci: fix transitional migration compat for vectors
Date: Tue,  7 Feb 2023 17:49:44 +0000
Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

In bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a I fixed the virito-rng-pci
migration compatibility, but it was discovered that we also need to fix
the other aliases of the device for the transitional cases.

Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/core/machine.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index b5cd42cd8c..4627b274d9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -49,6 +49,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
     { "virtio-rng-pci", "vectors", "0" },
+    { "virtio-rng-pci-transitional", "vectors", "0" },
+    { "virtio-rng-pci-non-transitional", "vectors", "0" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
-- 
2.39.1


