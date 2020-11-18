Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972CA2B7F79
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:33:04 +0100 (CET)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOW7-0008AK-Lb
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kfOUv-0007Ia-8J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:31:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kfOUs-0002nz-FF
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605709904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lsjjKuTU5FeUgm6fKP8gxE37SO0uwkFQXm1/9t11QP0=;
 b=WG6Zvr3QdLPIM48eVfYtaPyq1cCG+QmLYwQxkWCrkmy1umVfBHDwlQoYQULwAnMxQZlFnZ
 vjlwnKGDtMxVVyqXqMIcD+yYpxENIAAp2kmO44iGanN+YOEbvMYet1mLmYHVlTIRYlkqP3
 DMafqvwJYJWSxny0kLlPZvltDfM2ReM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-MVvtT-wkPd-KXSFzeLCYgg-1; Wed, 18 Nov 2020 09:31:40 -0500
X-MC-Unique: MVvtT-wkPd-KXSFzeLCYgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAC3F10C624A;
 Wed, 18 Nov 2020 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.33.36.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 760215B697;
 Wed, 18 Nov 2020 14:29:50 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: [PATCH] ide:atapi: check io_buffer_index in ide_atapi_cmd_reply_end
Date: Wed, 18 Nov 2020 19:57:45 +0530
Message-Id: <20201118142745.112579-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Wenxiang Qian <leonwxqian@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

During data transfer via packet command in 'ide_atapi_cmd_reply_end'
's->io_buffer_index' could exceed the 's->io_buffer' length, leading
to OOB access issue. Add check to avoid it.
 ...
 #9  ahci_pio_transfer ../hw/ide/ahci.c:1383
 #10 ide_transfer_start_norecurse ../hw/ide/core.c:553
 #11 ide_atapi_cmd_reply_end ../hw/ide/atapi.c:284
 #12 ide_atapi_cmd_read_pio ../hw/ide/atapi.c:329
 #13 ide_atapi_cmd_read ../hw/ide/atapi.c:442
 #14 cmd_read ../hw/ide/atapi.c:988
 #15 ide_atapi_cmd ../hw/ide/atapi.c:1352
 #16 ide_transfer_start ../hw/ide/core.c:561
 #17 cmd_packet ../hw/ide/core.c:1729
 #18 ide_exec_cmd ../hw/ide/core.c:2107
 #19 handle_reg_h2d_fis ../hw/ide/ahci.c:1267
 #20 handle_cmd ../hw/ide/ahci.c:1318
 #21 check_cmd ../hw/ide/ahci.c:592
 #22 ahci_port_write ../hw/ide/ahci.c:373
 #23 ahci_mem_write ../hw/ide/ahci.c:513

Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ide/atapi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 14a2b0bb2f..b991947c5c 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -276,6 +276,9 @@ void ide_atapi_cmd_reply_end(IDEState *s)
         s->packet_transfer_size -= size;
         s->elementary_transfer_size -= size;
         s->io_buffer_index += size;
+        if (s->io_buffer_index > s->io_buffer_total_len) {
+            return;
+        }
 
         /* Some adapters process PIO data right away.  In that case, we need
          * to avoid mutual recursion between ide_transfer_start
-- 
2.28.0


