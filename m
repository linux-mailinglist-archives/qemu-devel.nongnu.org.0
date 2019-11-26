Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CB10991E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Nov 2019 07:19:40 +0100 (CET)
Received: from localhost ([::1]:50436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZUCJ-0001e6-Cd
	for lists+qemu-devel@lfdr.de; Tue, 26 Nov 2019 01:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iZU8y-0007N4-KI
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:16:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iZTvJ-0004Pj-EP
 for qemu-devel@nongnu.org; Tue, 26 Nov 2019 01:02:06 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:42401 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iZTvJ-0004Na-3H; Tue, 26 Nov 2019 01:02:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 47MYFf24d4z9sRV; Tue, 26 Nov 2019 17:01:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1574748118;
 bh=6nijnx83CIQx6smDHZhFj8k2OJ6X4c5LVR42ACAGZd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z5059nwb27Uc4WlsET2gHPFa5d3mWr1zoc5zP74n/XWz1pNs6Cuiy/UdTuk3HZmtm
 ljeuonGdJrTAfc65PMMvpAsgxjCJ84b1Pt86slnMg2P9nb4Lo75hxbZ3H28N4sU4BP
 8Q2M/QDGtQdXODjD9KxQxRePbLXWQ2WGU9M6oAOM=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 8/8] ppc/spapr_events: fix potential NULL pointer dereference
 in rtas_event_log_dequeue
Date: Tue, 26 Nov 2019 17:01:51 +1100
Message-Id: <20191126060151.729845-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191126060151.729845-1-david@gibson.dropbear.id.au>
References: <20191126060151.729845-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, PanNengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org,
 Euler Robot <euler.robot@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
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
Message-Id: <1574685291-38176-1-git-send-email-pannengyuan@huawei.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_events.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0e4c19523a..e355e000d0 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -358,6 +358,7 @@ static SpaprEventLogEntry *rtas_event_log_dequeue(Spa=
prMachineState *spapr,
             rtas_event_log_to_source(spapr,
                                      spapr_event_log_entry_type(entry));
=20
+        g_assert(source);
         if (source->mask & event_mask) {
             break;
         }
--=20
2.23.0


