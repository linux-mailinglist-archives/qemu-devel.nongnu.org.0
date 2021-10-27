Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B943CE18
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 17:56:50 +0200 (CEST)
Received: from localhost ([::1]:50794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflIH-0003dz-RO
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 11:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfkZT-0004yx-My
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:10:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfkZM-00079r-TD
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635347419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FDr4OHv2Br2fc2yXfFAePU8wgqdBkAwGkgju1Ckp6rY=;
 b=Gzwz5D/+793uAyOoVwv2qMgTiQZe7PHhl/sBUhQBbYL3oXYY1CPO1boVorBeuU8DEImcAc
 p2ppJ2KV4F7ZbU8n9BY0NQwzyT2pQKBjOAfzDOvGdlh/g68rtSXZzmk0+gMY3QaNUofTJ5
 TFbm0tK9Ht4KExXVCefgitURBw+hPb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-OZ9FnZVcOZSkHiz78L9Xyg-1; Wed, 27 Oct 2021 11:10:16 -0400
X-MC-Unique: OZ9FnZVcOZSkHiz78L9Xyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3DE91B2C983;
 Wed, 27 Oct 2021 15:10:15 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F98D5DF35;
 Wed, 27 Oct 2021 15:10:14 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
Date: Wed, 27 Oct 2021 11:10:12 -0400
Message-Id: <20211027151012.2639284-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, Jason Andryuk <jandryuk@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If KVM is disabled or not present, qtest library build
may fail with:
   libqtest.c: In function 'qtest_has_accel':
      comparison of unsigned expression < 0 is always false
      [-Werror=type-limits]
         for (i = 0; i < ARRAY_SIZE(targets); i++) {

due to empty 'targets' array.
Fix it by making sure that CONFIG_KVM_TARGETS isn't empty.

Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
Reported-by: Jason Andryuk <jandryuk@gmail.com>
Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 2c5b53cbe2..ff85e9c2af 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ else
   kvm_targets = []
 endif
 
-kvm_targets_c = ''
+kvm_targets_c = '""'
 if not get_option('kvm').disabled() and targetos == 'linux'
   kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
 endif
-- 
2.27.0


