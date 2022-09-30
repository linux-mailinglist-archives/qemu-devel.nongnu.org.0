Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C143D5F10A2
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 19:17:37 +0200 (CEST)
Received: from localhost ([::1]:39240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeJdo-0005Kr-M2
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 13:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFv-0006lN-OR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oeJFu-0006hu-2T
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 12:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664556773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YsrwgLcvwjDIyMR8akXLwq8hwEVoeLRMqMQtUyX6hE=;
 b=DZIXLxTuvkfUJKJ1p9BW2K+P4slrkdzWmKmcszihrIXrjY4QeeMWXW2whWouSed5QF0VC4
 v81Q42DOpbuyVlLLkFNNt6PeYdDdaQbd61EEwRYnsZ2HWV1XTM0uw6L5gRooIQEkvXKHtP
 0vgh0yp5BW/6W9M/Vt92GXUAycI01vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-JzOERFpiMBG24PsqgvROjQ-1; Fri, 30 Sep 2022 12:52:50 -0400
X-MC-Unique: JzOERFpiMBG24PsqgvROjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDCA4811E67;
 Fri, 30 Sep 2022 16:52:49 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 250AF17582;
 Fri, 30 Sep 2022 16:52:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 16/18] hw/ide/core: Clear LBA and drive bits for EXECUTE DEVICE
 DIAGNOSTIC
Date: Fri, 30 Sep 2022 18:52:20 +0200
Message-Id: <20220930165222.249716-17-kwolf@redhat.com>
In-Reply-To: <20220930165222.249716-1-kwolf@redhat.com>
References: <20220930165222.249716-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

From: Lev Kujawski <lkujaw@member.fsf.org>

Prior to this patch, cmd_exec_dev_diagnostic relied upon
ide_set_signature to clear the device register.  While the
preservation of the drive bit by ide_set_signature is necessary for
the DEVICE RESET, IDENTIFY DEVICE, and READ SECTOR commands,
ATA/ATAPI-6 specifies that "DEV shall be cleared to zero" for EXECUTE
DEVICE DIAGNOSTIC.

This deviation was uncovered by the ATACT Device Testing Program
written by Hale Landis.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707031140.158958-3-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/ide/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 7cbc0a54a7..b747191ebf 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1704,8 +1704,14 @@ static bool cmd_identify_packet(IDEState *s, uint8_t cmd)
     return false;
 }
 
+/* EXECUTE DEVICE DIAGNOSTIC */
 static bool cmd_exec_dev_diagnostic(IDEState *s, uint8_t cmd)
 {
+    /*
+     * Clear the device register per the ATA (v6) specification,
+     * because ide_set_signature does not clear LBA or drive bits.
+     */
+    s->select = (ATA_DEV_ALWAYS_ON);
     ide_set_signature(s);
 
     if (s->drive_kind == IDE_CD) {
-- 
2.37.3


