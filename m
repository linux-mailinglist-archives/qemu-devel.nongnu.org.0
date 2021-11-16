Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85AE453550
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 16:09:51 +0100 (CET)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn05m-0006oZ-Nz
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 10:09:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mn04m-0005Zy-Ki
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:08:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mn04j-0001EN-KY
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 10:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637075325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p6teif3SwfZLbHSIlR5FV5rpSQUPc5+ESByZZZZN/zQ=;
 b=f8IT0mV8lOpG0ZG4mTul+T558fcBBJf6JxHoAtYQhcil3+v+uaR25PD672twVyvJpazuor
 2JY1HTSP2rWV1ynldHOfB6ZlTHcjraOPvYKG45DinbG6lTN5cwnGXlKhK8x073SI9/rpBC
 YpcJcxE01KRnAlCd/Gk84ntiFKfDfNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-AQA1x7aMNHKUimiH_NbMIA-1; Tue, 16 Nov 2021 10:08:41 -0500
X-MC-Unique: AQA1x7aMNHKUimiH_NbMIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4204824F83;
 Tue, 16 Nov 2021 15:08:39 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C99CC19723;
 Tue, 16 Nov 2021 15:08:38 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pmu: fix pmu vmstate subsection list
Date: Tue, 16 Nov 2021 16:08:37 +0100
Message-Id: <20211116150837.169291-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The subsection is not closed by a NULL marker so this can trigger
a segfault when the pmu vmstate is saved.

This can be easily shown with:

  $ ./qemu-system-ppc64  -dump-vmstate vmstate.json
  Segmentation fault (core dumped)

Fixes: d811d61fbc6c ("mac_newworld: add PMU device")
Cc: mark.cave-ayland@ilande.co.uk
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/misc/macio/pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/macio/pmu.c b/hw/misc/macio/pmu.c
index 4ad4f50e08c3..eb39c64694aa 100644
--- a/hw/misc/macio/pmu.c
+++ b/hw/misc/macio/pmu.c
@@ -718,6 +718,7 @@ static const VMStateDescription vmstate_pmu = {
     },
     .subsections = (const VMStateDescription * []) {
         &vmstate_pmu_adb,
+        NULL
     }
 };
 
-- 
2.33.1


