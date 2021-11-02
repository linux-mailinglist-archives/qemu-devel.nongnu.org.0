Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBEE44328B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:17:30 +0100 (CET)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwTZ-0001MI-4v
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIS-0007RZ-Ke
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIM-0004GD-4q
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIttUjkX1v9tqGWYzWLmG0b5A3rCX5/3W24CgjKKnu4=;
 b=NQbpW+QsBYVrU7u4bFpg73qepJ8N4GkBQPA225WDpjA+prW+oVQVtAtogfGcrrLkx5u6We
 YGxMaxBwkXOWsGkCvVYo7kFaO/ZRZjIj7Lx2Q4+KBx05oqsfy0mBi1GoRT1qMcZ+9uimw+
 vHZ4UTv2etAQsyDrY/hk8cqtKv59Plw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-lulKFu-ZP2iFwXmn0M04Yw-1; Tue, 02 Nov 2021 12:05:51 -0400
X-MC-Unique: lulKFu-ZP2iFwXmn0M04Yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DC638066F6;
 Tue,  2 Nov 2021 16:05:50 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667E65D9D3;
 Tue,  2 Nov 2021 16:05:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/12] ide: Cap LBA28 capacity announcement to 2^28-1
Date: Tue,  2 Nov 2021 17:05:20 +0100
Message-Id: <20211102160528.206766-5-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Samuel Thibault <samuel.thibault@ens-lyon.org>

The LBA28 capacity (at offsets 60/61 of identification) is supposed to
express the maximum size supported by LBA28 commands. If the device is
larger than this, we have to cap it to 2^28-1.

At least NetBSD happens to be using this value to determine whether to use
LBA28 or LBA48 for its commands, using LBA28 for sectors that don't need
LBA48. This commit thus fixes NetBSD access to disks larger than 128GiB.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-Id: <20210824104344.3878849-1-samuel.thibault@ens-lyon.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/ide/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index fd69ca3167..e28f8aad61 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -98,8 +98,12 @@ static void put_le16(uint16_t *p, unsigned int v)
 static void ide_identify_size(IDEState *s)
 {
     uint16_t *p = (uint16_t *)s->identify_data;
-    put_le16(p + 60, s->nb_sectors);
-    put_le16(p + 61, s->nb_sectors >> 16);
+    int64_t nb_sectors_lba28 = s->nb_sectors;
+    if (nb_sectors_lba28 >= 1 << 28) {
+        nb_sectors_lba28 = (1 << 28) - 1;
+    }
+    put_le16(p + 60, nb_sectors_lba28);
+    put_le16(p + 61, nb_sectors_lba28 >> 16);
     put_le16(p + 100, s->nb_sectors);
     put_le16(p + 101, s->nb_sectors >> 16);
     put_le16(p + 102, s->nb_sectors >> 32);
-- 
2.31.1


