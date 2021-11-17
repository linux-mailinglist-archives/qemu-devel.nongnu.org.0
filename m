Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BF454691
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 13:46:56 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKL1-0008Dh-9v
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 07:46:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAS-0006i8-Bm
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:36:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnKAN-0004c7-Km
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 07:36:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637152555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG+zgZUdKXWa/bANnargnjTKA5tMtHkSKP2FF2wC/84=;
 b=e3rVleG1UqA+nVhjc+WwJ6f+UXRoWKS4iNOpUEHcJbdd92E0xQqpSs0KUJ0pBt0E8h0uAY
 +yrnfrpi/vJPkxbAuLwWrxyTJePTEonxN0bNHngz5Ab6znr/WsuluG/J4+oJm9fYpN5Tjw
 Yb7dOQa1yxraB0t3lz8BKAt6LUFMCXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-bfdrSBfiMraRWUGTCuP4_g-1; Wed, 17 Nov 2021 07:35:51 -0500
X-MC-Unique: bfdrSBfiMraRWUGTCuP4_g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CC5E802C8F;
 Wed, 17 Nov 2021 12:35:50 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 072533AEF;
 Wed, 17 Nov 2021 12:35:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 2/2] hw/nvme/ctrl: Prevent buffer overrun in
 nvme_error_info()
Date: Wed, 17 Nov 2021 13:35:34 +0100
Message-Id: <20211117123534.2900334-3-philmd@redhat.com>
In-Reply-To: <20211117123534.2900334-1-philmd@redhat.com>
References: <20211117123534.2900334-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Gaurav Kamathe <gkamathe@redhat.com>, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, qemu-stable@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both 'buf_len' and 'off' arguments are under guest control.
Since nvme_c2h() doesn't check out of boundary access, the
caller must check for eventual buffer overrun on 'trans_len'.

Cc: qemu-stable@nongnu.org
Fixes: 94a7897c41d ("add support for the get log page command")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 93a24464647..7414f3b4dd1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4146,7 +4146,8 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     uint32_t trans_len;
     NvmeErrorLog errlog;
 
-    if (off >= sizeof(errlog)) {
+    trans_len = MIN(sizeof(errlog) - off, buf_len);
+    if (trans_len >= sizeof(errlog)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -4155,7 +4156,6 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     memset(&errlog, 0x0, sizeof(errlog));
-    trans_len = MIN(sizeof(errlog) - off, buf_len);
 
     return nvme_c2h(n, (uint8_t *)&errlog, trans_len, req);
 }
-- 
2.31.1


