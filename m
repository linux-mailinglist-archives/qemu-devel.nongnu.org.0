Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B2F1ED02B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 14:50:31 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgSqk-00083s-V7
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 08:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jgSq3-0007c3-Nq
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 08:49:47 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26540
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jgSq2-0000YM-T4
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 08:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591188585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5EGQLuICNFeRjd9HJONtfAD5ly5gPefyS6jbVQcj0Ao=;
 b=Gkpw0brt9/NTK8dGpvwMPAQ13HNwALUdFh9oMbksJp0VQIpelN2RXvOQVHD2yxVIuCknMO
 eNfgrJAn8aApy1J2IkzFqU8fSOc0q89RSdAnHph9uv/HCcaHuGEMYUoaHlW0cMSWlDkZcx
 NNTY/900Mx5ylhdhp867yZ1e5nG3h+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-p9hXp0puPC6A-xQpsBlGQg-1; Wed, 03 Jun 2020 08:49:43 -0400
X-MC-Unique: p9hXp0puPC6A-xQpsBlGQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4478E18A8225;
 Wed,  3 Jun 2020 12:49:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 012A25D9D3;
 Wed,  3 Jun 2020 12:49:35 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] ati-vga: increment mm_index in ati_mm_read/write
Date: Wed,  3 Jun 2020 18:17:32 +0530
Message-Id: <20200603124732.1137892-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Yi Ren <c4tren@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Ren Ding <rding@gatech.edu>,
 Hanqing Zhao <hanqing@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

While accessing VGA registers via ati_mm_read/write routines,
a guest may set 's->regs.mm_index' such that it leads to infinite
recursion. Increment the mm_index value to avoid it.

Reported-by: Ren Ding <rding@gatech.edu>
Reported-by: Hanqing Zhao <hanqing@gatech.edu>
Reported-by: Yi Ren <c4tren@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/display/ati.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 065f197678..fa9061ad0b 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -286,7 +286,8 @@ static uint64_t ati_mm_read(void *opaque, hwaddr addr, unsigned int size)
                 val = ldn_le_p(s->vga.vram_ptr + idx, size);
             }
         } else {
-            val = ati_mm_read(s, s->regs.mm_index + addr - MM_DATA, size);
+            uint32_t idx = s->regs.mm_index++;
+            val = ati_mm_read(s, idx + addr - MM_DATA, size);
         }
         break;
     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
@@ -521,7 +522,8 @@ static void ati_mm_write(void *opaque, hwaddr addr,
                 stn_le_p(s->vga.vram_ptr + idx, size, data);
             }
         } else {
-            ati_mm_write(s, s->regs.mm_index + addr - MM_DATA, data, size);
+            uint32_t idx = s->regs.mm_index++;
+            ati_mm_write(s, idx + addr - MM_DATA, data, size);
         }
         break;
     case BIOS_0_SCRATCH ... BUS_CNTL - 1:
-- 
2.26.2


