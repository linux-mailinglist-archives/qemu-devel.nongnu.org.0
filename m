Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF03468CE
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:19:33 +0100 (CET)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmYv-0003EP-0C
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOln4-0006nt-UC; Tue, 23 Mar 2021 14:30:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOln1-00048B-Jj; Tue, 23 Mar 2021 14:30:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x13so21807248wrs.9;
 Tue, 23 Mar 2021 11:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0nfW/LiCoGkx3aq8IRZykw93coUaSyrmm75EamV5Po=;
 b=Gia0TC8iNv3r+mdeeV0bt4kppFG+n8xKMGnIfhvUiYH2l8IC5ukQdtbH2YxpUshiQ/
 IUot2rDT3kxTFvpO5xI7LO9omY4rIFcldVtXoGY9v6MnQ6xeNdkIfng39/aTPDW5EeLn
 UT0Z7Ibsi52L1S2mfiAPQ2mng+kTlPp/V/CwwLJJQzuRby9lrtyTVcsoh8u4TQOJcMQx
 tAu0kQ8Zo/qpP/9loNg9RShRDJKB3XeOlvG9ZLGz4HypFW4ylA/LVLldkzTj0++Y3duV
 iLASIkcm2GfWYphqHWdCFDHKHVp/IaQ8iJp4x9TL4akBPLXPfpC+4BFvqWEtksXehD6h
 H0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=K0nfW/LiCoGkx3aq8IRZykw93coUaSyrmm75EamV5Po=;
 b=mk8Zhlzg1FW1nrilAMR090gTN+T6Wdr4Oc207A4mi9aXevTJsoF7j0DhwkxuawMpZl
 QQSN9dPcNYao5G5a1NtAlwzqOKXFdi8YH3amnSxzIeueZkqSIDPRr/q4VZ+5PsoBKgJn
 PspSxggkupcDY1yqRy6qtmqq8iLH70KfBjJxUkghniudMAee5+RQhETOBsRnP2QKWJC/
 0SnKntLcYv7mSvF1twdRp/uoKWcdP5oTF1+GJAs+JxEXOTtxNKR7uCUdBNhE/Kkotv+b
 WGYuCv3XJ4qs938a5jZvnIgVxwtqR7Y8LdSivpc58HMMxdzplaQjTCLN8tARbFH2Z6A7
 m/2A==
X-Gm-Message-State: AOAM530W5oDscTA0cBmQFxXWB4j0NOezGsFzOVgmS5da1aQx/dO8MuAV
 d7BpIf8rs1yINzMoPR2aLBW96P05zy/oVA==
X-Google-Smtp-Source: ABdhPJznc10HSle60PymjuWQ5bJHUH2t+/ncwvs1VE5tYNmsqwPwMxWWa7v67JA6X7qfA0SvaxpzEQ==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr5526285wru.262.1616524200497; 
 Tue, 23 Mar 2021 11:30:00 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e8sm3490396wme.14.2021.03.23.11.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:29:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
Date: Tue, 23 Mar 2021 19:29:58 +0100
Message-Id: <20210323182958.277654-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building with --enable-sanitizers we get:

  Direct leak of 16 byte(s) in 1 object(s) allocated from:
      #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
      #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
      #2 0x561847c2dcc9 in xlnx_dp_init hw/display/xlnx_dp.c:1259:5
      #3 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
      #4 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
      #5 0x56184a5a24d5 in object_initialize qom/object.c:536:5
      #6 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object.c:566:5
      #7 0x56184a5a2e60 in object_initialize_child_with_props qom/object.c:549:10
      #8 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:603:5
      #9 0x5618495aa431 in xlnx_zynqmp_init hw/arm/xlnx-zynqmp.c:273:5

The RX/TX FIFOs are created in xlnx_dp_init(), add xlnx_dp_finalize()
to destroy them.

Fixes: 58ac482a66d ("introduce xlnx-dp")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/xlnx_dp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index c56e6ec5936..4fd6aeb18b5 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1260,6 +1260,14 @@ static void xlnx_dp_init(Object *obj)
     fifo8_create(&s->tx_fifo, 16);
 }
 
+static void xlnx_dp_finalize(Object *obj)
+{
+    XlnxDPState *s = XLNX_DP(obj);
+
+    fifo8_destroy(&s->tx_fifo);
+    fifo8_destroy(&s->rx_fifo);
+}
+
 static void xlnx_dp_realize(DeviceState *dev, Error **errp)
 {
     XlnxDPState *s = XLNX_DP(dev);
@@ -1359,6 +1367,7 @@ static const TypeInfo xlnx_dp_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XlnxDPState),
     .instance_init = xlnx_dp_init,
+    .instance_finalize = xlnx_dp_finalize,
     .class_init    = xlnx_dp_class_init,
 };
 
-- 
2.26.2


