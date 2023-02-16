Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A189F698BE7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:26:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWlT-0006NQ-DM; Thu, 16 Feb 2023 00:25:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlO-0006N6-0z
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pSWlM-0008UT-7A
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:24:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676525095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=paIc5n1LmCj/L1ZTUihKLDzz8o0E+hhiS89cAyAMLy0=;
 b=agVt7giWysvDinAiwnxMOuKy8AxZ7df3qKufUyDIAuj5CkQ7ZgrPIGeQukgWcF9+RTaQKl
 a6tIaSymkmPqrlVGcX0/LU2XX7oVhz7Fm+gJdaxWQrEQTt/7hn7AeHzXjP/KqWZmgzvuh1
 GE7FN/w83Rzrq1UuDQ3b7gD0wgpaxso=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-7XDv7TjiNOKY9lCD1Is3nQ-1; Thu, 16 Feb 2023 00:24:52 -0500
X-MC-Unique: 7XDv7TjiNOKY9lCD1Is3nQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B111129AA383;
 Thu, 16 Feb 2023 05:24:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-253.pek2.redhat.com
 [10.72.12.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66F5D492B0E;
 Thu, 16 Feb 2023 05:24:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 08/10] hw/net/can/xlnx-zynqmp-can: fix assertion failures in
 transfer_fifo()
Date: Thu, 16 Feb 2023 13:24:22 +0800
Message-Id: <20230216052424.50926-9-jasowang@redhat.com>
In-Reply-To: <20230216052424.50926-1-jasowang@redhat.com>
References: <20230216052424.50926-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Qiang Liu <cyruscyliu@gmail.com>

Check fifos before poping data from and pushing data into it.

Fixes: 98e5d7a2b726 ("hw/net/can: Introduce Xilinx ZynqMP CAN controller")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1425
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1427
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/xlnx-zynqmp-can.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
index e93e6c5..8a56734 100644
--- a/hw/net/can/xlnx-zynqmp-can.c
+++ b/hw/net/can/xlnx-zynqmp-can.c
@@ -451,6 +451,12 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
     }
 
     while (!fifo32_is_empty(fifo)) {
+        if (fifo32_num_used(fifo) < CAN_FRAME_SIZE) {
+            g_autofree char *path = object_get_canonical_path(OBJECT(s));
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: data left in the fifo is not"
+                          " enough for transfer.\n", path);
+            break;
+        }
         for (i = 0; i < CAN_FRAME_SIZE; i++) {
             data[i] = fifo32_pop(fifo);
         }
@@ -463,7 +469,8 @@ static void transfer_fifo(XlnxZynqMPCANState *s, Fifo32 *fifo)
              * acknowledged. The XlnxZynqMPCAN core receives any message
              * that it transmits.
              */
-            if (fifo32_is_full(&s->rx_fifo)) {
+            if (fifo32_is_full(&s->rx_fifo) ||
+                    (fifo32_num_free(&s->rx_fifo) < CAN_FRAME_SIZE)) {
                 ARRAY_FIELD_DP32(s->regs, INTERRUPT_STATUS_REGISTER, RXOFLW, 1);
             } else {
                 for (i = 0; i < CAN_FRAME_SIZE; i++) {
-- 
2.7.4


