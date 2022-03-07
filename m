Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E263E4D0085
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:55:50 +0100 (CET)
Received: from localhost ([::1]:34036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDq1-0000q6-Mt
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfs-0005s2-9O
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:22 -0500
Received: from [2607:f8b0:4864:20::52c] (port=36583
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfq-000799-46
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:19 -0500
Received: by mail-pg1-x52c.google.com with SMTP id t14so13604144pgr.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uOlBtYjfRkygbNbkO0nMqqr60G0oqcOJiqgel0P1B+U=;
 b=IXpkPqpIWcTEPBmTepEDiUvFkkc0djtulNO81kTt2e2tHnxh/XOHa1MEnoCzgdoig6
 SQGp5w+O+A/1V5DhHQJjEv/IQd3yItdUpWKe557rZ9waKAoxq2/RGRe5GKwvvk5KZZgk
 JT2x0Lopbn8xM53RjZZarE9vSNKz6RtN5hs8Btmj7bhiZKDibAdIP5XlmmsrtNkUlQxl
 nAclB4HxcYe8utMOWWpKU/gC9RfQCvzDvMFroSUeEcFM4CPIJ73SJCJK/QvEiLviptRI
 5MS6tH2GlJUVzD4ZGTTNuHIFzt+41Jv8Jb312zcik9QH9X8kKDF/jStoK/sg/NEO1iNX
 AAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uOlBtYjfRkygbNbkO0nMqqr60G0oqcOJiqgel0P1B+U=;
 b=sc2AkxQOz4c1CXsokhJHfqw1ba1luJltOwqgKwpuN07FM1X6SBP5zkoLbTwZ28oZN4
 t/4fF3hYIt8sIvuCu0CQeWL9SK4DlH9FdTe5Onprw+QMC6F4SQkE/yC5hCykGKCm/IRL
 PX/aP+cPFq0DWnHdC6vH2C9Tzuk/vECuD0iKdSumizhNtNDSZpSYWsXaQ7b70MQ6gYQ3
 VkHo5Zad8Bg4e105WQ93xx9OfoThuUIjvY+sRdL5I6KsepddYpejVT7tEDNIRcWbroz3
 G/oDI8Y5kOksCG+xcKRc5bMRJ0vJ/JZCo8PxOcBh5DVICbS8u1YCbRs59PDi01WokZQ2
 7/cw==
X-Gm-Message-State: AOAM532b3yKRYr3tMKBEF0+58xgtVNzwoF+McPqEOxIIsWS+nJsv3Gjn
 emRL3FYNStybcfgt7kSkTVCdLOYj3s0=
X-Google-Smtp-Source: ABdhPJyUFYqM+YobZdbx5XIW4WY9F0e3F+j931940ORXZrQSh6gtEo50T/PkyICRDLB1iwqPO6iEPw==
X-Received: by 2002:a63:461f:0:b0:373:a3e9:10aa with SMTP id
 t31-20020a63461f000000b00373a3e910aamr9961754pga.606.1646660715922; 
 Mon, 07 Mar 2022 05:45:15 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056a00238400b004e10b67e658sm16622475pfc.3.2022.03.07.05.45.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:45:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 09/13] hw/rtc/m48t59-isa: QOM'ify IRQ number
Date: Mon,  7 Mar 2022 14:43:49 +0100
Message-Id: <20220307134353.1950-10-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rtc/m48t59-isa.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/rtc/m48t59-isa.c b/hw/rtc/m48t59-isa.c
index dc21fb10a5..e9086eada4 100644
--- a/hw/rtc/m48t59-isa.c
+++ b/hw/rtc/m48t59-isa.c
@@ -42,6 +42,7 @@ struct M48txxISAState {
     ISADevice parent_obj;
     M48t59State state;
     uint32_t io_base;
+    uint8_t isairq;
     MemoryRegion io;
 };
 
@@ -79,6 +80,7 @@ static void m48txx_isa_toggle_lock(Nvram *obj, int lock)
 static Property m48t59_isa_properties[] = {
     DEFINE_PROP_INT32("base-year", M48txxISAState, state.base_year, 0),
     DEFINE_PROP_UINT32("iobase", M48txxISAState, io_base, 0x74),
+    DEFINE_PROP_UINT8("irq", M48txxISAState, isairq, 8),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -97,9 +99,14 @@ static void m48t59_isa_realize(DeviceState *dev, Error **errp)
     M48txxISAState *d = M48TXX_ISA(dev);
     M48t59State *s = &d->state;
 
+    if (d->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     s->model = u->info.model;
     s->size = u->info.size;
-    isa_init_irq(isadev, &s->IRQ, 8);
+    isa_init_irq(isadev, &s->IRQ, d->isairq);
     m48t59_realize_common(s, errp);
     memory_region_init_io(&d->io, OBJECT(dev), &m48t59_io_ops, s, "m48t59", 4);
     if (d->io_base != 0) {
-- 
2.34.1


