Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958FF4ED9A6
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 14:31:01 +0200 (CEST)
Received: from localhost ([::1]:45402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZtx6-0001YD-Mh
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 08:31:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZttK-0000Dj-Rs
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nZttH-0000U1-W1
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648729622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ocDO8W5P669SM/AHskrdaGku8z2uvGQrhDTj1+2VNAM=;
 b=LkRhFZtAM8ktrhvH238ZmDQ3uWDe7O7v6gHDmdbnWAJy4rG3VjeJxU0uKeRbhOzJ2Zk9My
 IdBlAEM1p6oTRLoBcKlUDvNnpEhUHORcvyCSUmFU03HI3i3j05KxaAIBzHCWQmeIPPUrm/
 utu399SqaXApa3KcUCWeRr6SxLOyr98=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-pci_w08GOgqdksXcl6wCBA-1; Thu, 31 Mar 2022 08:26:59 -0400
X-MC-Unique: pci_w08GOgqdksXcl6wCBA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 853662803586;
 Thu, 31 Mar 2022 12:26:58 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17033401E71;
 Thu, 31 Mar 2022 12:26:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/char: fix qcode array bounds check in ESCC impl
Date: Thu, 31 Mar 2022 13:26:52 +0100
Message-Id: <20220331122652.188700-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was an off-by-1 in the qcode conversion array bounds
check.

Fixes: e709a61a8fe1076a487376fd657544418a38ba06
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/char/escc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/escc.c b/hw/char/escc.c
index 8755d8d34f..17a908c59b 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -828,7 +828,7 @@ static void sunkbd_handle_event(DeviceState *dev, QemuConsole *src,
         }
     }
 
-    if (qcode > qemu_input_map_qcode_to_sun_len) {
+    if (qcode >= qemu_input_map_qcode_to_sun_len) {
         return;
     }
 
-- 
2.34.1


