Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3854C454B3D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:43:29 +0100 (CET)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnO1w-0005XF-7b
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:43:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtN-0003dC-Uv
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mnNtD-0008Ay-Qx
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637166867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hCNF90n88ZaOSveBM5R6+mc+3MVPday5x+7l3fC5ok=;
 b=h10RmQzGhRahLayII7yauvii3K99eordfkchWXEQL3ArITGH0YoIIYiYd7oGDcL5ymfPlg
 f1sGSUq3As1oEb28rhGdRAFFFasOsml4e+OfB7AOWRO2kPIHF1biyCZlYQLSqFgKKgdPOR
 vlGjmc0qzIh/06HTTplo60763GWdVUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-FTlBO-prP3uP3vAS5izApA-1; Wed, 17 Nov 2021 11:34:21 -0500
X-MC-Unique: FTlBO-prP3uP3vAS5izApA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA221006AA1;
 Wed, 17 Nov 2021 16:34:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2685F4E0;
 Wed, 17 Nov 2021 16:34:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9011D11380D7; Wed, 17 Nov 2021 17:34:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/13] hw/arm/xlnx-versal-virt: Replace drive_get_next() by
 drive_get()
Date: Wed, 17 Nov 2021 17:34:04 +0100
Message-Id: <20211117163409.3587705-9-armbru@redhat.com>
In-Reply-To: <20211117163409.3587705-1-armbru@redhat.com>
References: <20211117163409.3587705-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Machine "xlnx-versal-virt" connects backends with drive_get_next() in
a counting loop.  Change it to use drive_get() directly.  This makes
the unit numbers explicit in the code.

Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/xlnx-versal-virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index d2f55e29b6..0c5edc898e 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -669,7 +669,8 @@ static void versal_virt_init(MachineState *machine)
 
     /* Plugin SD cards.  */
     for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
-        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
+        sd_plugin_card(&s->soc.pmc.iou.sd[i],
+                       drive_get(IF_SD, 0, i));
     }
 
     s->binfo.ram_size = machine->ram_size;
-- 
2.31.1


