Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208011D4F2A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 15:21:12 +0200 (CEST)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZaH1-0007zL-7t
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 09:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZji-0003uN-MT
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30999
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjh-0002Vv-MQ
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9fpAZ9rPjUPAuSh1dQ8aQhXcuqg8rM81ibln037tcE=;
 b=hHYZ11HbDaBwhJ6i12L4pMpCCldCehjj+n5nUKfAGOJUktALTiQy6BAk9dzJLsfL0pPQtR
 Ls8bBelw3Xodo/m+P1w3EAa/Z5Z3ewrOOsoqfDJAeu+QImOeCuJUdrRkSgSfus32jo4MwX
 sPUsm2No6MfSTOq06yhgPgFH26+x8wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-5I93L6TYPYiAlm9pND8fmA-1; Fri, 15 May 2020 08:46:40 -0400
X-MC-Unique: 5I93L6TYPYiAlm9pND8fmA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A859B107ACCD;
 Fri, 15 May 2020 12:46:39 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEF202E047;
 Fri, 15 May 2020 12:46:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 50/51] hw/ide/ahci: Log lost IRQs
Date: Fri, 15 May 2020 14:45:20 +0200
Message-Id: <20200515124521.335403-51-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 23:27:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

One might find interesting to look at AHCI IRQs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200504094858.5975-1-f4bug@amsat.org>
Reviewed-by: John Snow <jsnow@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/ide/ahci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 13d91e109a..fc82cbd5f1 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1509,6 +1509,7 @@ static void ahci_cmd_done(IDEDMA *dma)
 
 static void ahci_irq_set(void *opaque, int n, int level)
 {
+    qemu_log_mask(LOG_UNIMP, "ahci: IRQ#%d level:%d\n", n, level);
 }
 
 static const IDEDMAOps ahci_dma_ops = {
-- 
2.25.4


