Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A9241A93
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 13:45:29 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Sie-0002aS-6O
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 07:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5Shb-0001Iy-A2
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:44:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5ShZ-0008J3-KF
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:44:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597146260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O09w58vU600Gb/fgnR/CT6U8ZBX9brZK7maBJW9LFCA=;
 b=GYvGm6nXpUaYnM6NoAS9+TQjwHLkdHC0l/CmeXEoE2exofIDRWexNcD6PqwBEO6iF+FS2M
 NpDCExAYREFv06yFJVpJJqxxD/YhwOXIj8SrsOBzA6+An0ZbE4AC9pKt5HJIy6cznGG2E/
 +BhLx7rhyD5XAioHVuAwfXWGmvyq2wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-Vx89aPbXPruKR59sMB_oVQ-1; Tue, 11 Aug 2020 07:44:17 -0400
X-MC-Unique: Vx89aPbXPruKR59sMB_oVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 174971083;
 Tue, 11 Aug 2020 11:44:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCF6C5F9DF;
 Tue, 11 Aug 2020 11:44:09 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 4/9] prep: add ppc-parity write method
Date: Tue, 11 Aug 2020 17:11:28 +0530
Message-Id: <20200811114133.672647-5-ppandit@redhat.com>
In-Reply-To: <20200811114133.672647-1-ppandit@redhat.com>
References: <20200811114133.672647-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ppandit@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 02:18:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add ppc-parity mmio write method to avoid NULL pointer dereference
issue.

Reported-by: Lei Sun <slei.casper@gmail.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/ppc/prep_systemio.c | 8 ++++++++
 1 file changed, 8 insertions(+)

Update v4: No change, v3 was acked
  -> https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg09965.html

diff --git a/hw/ppc/prep_systemio.c b/hw/ppc/prep_systemio.c
index bbc51b6e9a..e583222a1b 100644
--- a/hw/ppc/prep_systemio.c
+++ b/hw/ppc/prep_systemio.c
@@ -23,6 +23,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "hw/qdev-properties.h"
@@ -235,8 +236,15 @@ static uint64_t ppc_parity_error_readl(void *opaque, hwaddr addr,
     return val;
 }
 
+static void ppc_parity_error_writel(void *opaque, hwaddr addr,
+                                    uint64_t data, unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid access\n", __func__);
+}
+
 static const MemoryRegionOps ppc_parity_error_ops = {
     .read = ppc_parity_error_readl,
+    .write = ppc_parity_error_writel,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.26.2


