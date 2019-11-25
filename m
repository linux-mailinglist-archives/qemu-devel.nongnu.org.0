Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3F1108E14
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 13:38:43 +0100 (CET)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZDda-0007wi-MV
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 07:38:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1iZDaW-0005Cg-IS
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:35:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1iZDaV-00063m-Fv
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 07:35:32 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:48886 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1iZDaQ-0005tw-U9; Mon, 25 Nov 2019 07:35:27 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2FFE3C02C28C39762234;
 Mon, 25 Nov 2019 20:35:15 +0800 (CST)
Received: from HGHY2P002143101.china.huawei.com (10.184.39.213) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Mon, 25 Nov 2019 20:35:05 +0800
From: <pannengyuan@huawei.com>
To: <david@gibson.dropbear.id.au>
Subject: [PATCH V2] ppc/spapr_events: fix potential NULL pointer dereference
 in rtas_event_log_dequeue
Date: Mon, 25 Nov 2019 20:34:51 +0800
Message-ID: <1574685291-38176-1-git-send-email-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.7.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: kuhn.chenqun@huawei.com, qemu-arm@nongnu.org,
 PanNengyuan <pannengyuan@huawei.com>, qemu-devel@nongnu.org,
 kenny.zhangjun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: PanNengyuan <pannengyuan@huawei.com>

This fixes coverity issues 68911917:
        360
    CID 68911917: (NULL_RETURNS)
        361. dereference: Dereferencing "source", which is known to be
             "NULL".
        361        if (source->mask & event_mask) {
        362            break;
        363        }

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
---
 hw/ppc/spapr_events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0e4c195..e355e00 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -358,6 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(SpaprMachineState *spapr,
             rtas_event_log_to_source(spapr,
                                      spapr_event_log_entry_type(entry));
 
+        g_assert(source);
         if (source->mask & event_mask) {
             break;
         }
-- 
2.7.2.windows.1



