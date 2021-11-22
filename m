Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F374593BC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 18:12:19 +0100 (CET)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpCrZ-0001ej-OK
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 12:12:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpCqQ-0000YO-Pt
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:11:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpCqL-0004O9-59
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 12:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637601053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2bRu2bTxoagc+gY3qhFWKLnXq7KPciJaWsE5gt2HvLA=;
 b=fE+XDFghYnQS3t7tUxTY4nd+igF/o7nO9JdQzNqJJA27AyGGIjflSOP+Njgxaab75HZK7T
 HMonxnUTigq4JQ7edMNtVOjglLxH41IGXBwpjWNtWthtjFmR9YzjIcwDuei9CvL7+uOX0c
 5YDIZgUtPL9WAdW/XlvVtgEBAE9xToA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-pHRNe0H2N7-LvSIuNoPMtg-1; Mon, 22 Nov 2021 12:10:48 -0500
X-MC-Unique: pHRNe0H2N7-LvSIuNoPMtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06333659;
 Mon, 22 Nov 2021 17:10:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF4167848;
 Mon, 22 Nov 2021 17:10:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, shashi.mallela@linaro.org, qemu-devel@nongnu.org,
 drjones@redhat.com, richard.henderson@linaro.org
Subject: [PATCH for-6.2] hw/intc/arm_gicv3_its: Revert version increments in
 vmstate_its
Date: Mon, 22 Nov 2021 18:10:20 +0100
Message-Id: <20211122171020.1195483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
incremented version_id and minimum_version_id fields of
VMStateDescription vmstate_its. This breaks the migration between
6.2 and 6.1 with the following message:

qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
qemu-system-aarch64: load of migration failed: Invalid argument

Revert that change.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 7d7f3882e76..90b85f1e25c 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
-    .version_id = 1,
-    .minimum_version_id = 1,
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
-- 
2.26.3


