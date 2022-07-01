Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E405630BA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:51:14 +0200 (CEST)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7DIv-0004Ja-Ca
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1o7D8Z-00009D-C1
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41862 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1o7D8V-0002rK-QH
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:40:30 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKeGPv75iutYAAA--.2820S4;
 Fri, 01 Jul 2022 17:34:08 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 mark.cave-ayland@ilande.co.uk, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, f4bug@amsat.org, peter.maydell@linaro.org
Subject: [PATCH 02/11] hw/rtc/ls7a_rtc: Fix timer call back function
Date: Fri,  1 Jul 2022 17:33:58 +0800
Message-Id: <20220701093407.2150607-3-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxKeGPv75iutYAAA--.2820S4
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyxGFWrWrWkuF4DZw18Zrb_yoW3AFg_G3
 W7JrWkCa43C3sI9r47trnxur4DCw18ZFs5Kr1xZFZ5t343t345A3y8WF9rAr13CrW5WrW3
 Xrn0krZ0kr42yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Replace qemu_irq_pulse with qemu_irq_raise in ls7a_timer_cb function
to keep consistent with hardware behavior when raise irq.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 hw/rtc/ls7a_rtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/rtc/ls7a_rtc.c b/hw/rtc/ls7a_rtc.c
index b88a90de8b..780144b9da 100644
--- a/hw/rtc/ls7a_rtc.c
+++ b/hw/rtc/ls7a_rtc.c
@@ -425,7 +425,7 @@ static void toy_timer_cb(void *opaque)
     LS7ARtcState *s = opaque;
 
     if (toy_enabled(s)) {
-        qemu_irq_pulse(s->irq);
+        qemu_irq_raise(s->irq);
     }
 }
 
@@ -434,7 +434,7 @@ static void rtc_timer_cb(void *opaque)
     LS7ARtcState *s = opaque;
 
     if (rtc_enabled(s)) {
-        qemu_irq_pulse(s->irq);
+        qemu_irq_raise(s->irq);
     }
 }
 
-- 
2.31.1


