Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49E34E911
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 15:27:51 +0200 (CEST)
Received: from localhost ([::1]:33856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lREPO-0008Se-48
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 09:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENg-0006oh-4c
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRENc-0003c1-1U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 09:26:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id c8so16222873wrq.11
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q521bSACgOTA+AcHoRMQbgV3YPYoW/eT88h0y+3lw94=;
 b=B9LRHZA/BD0gWoIsS7bCBY1V2nBqwrBP2OfKoG+JkrpYWpNXMwOmJe8swMokVOMMk4
 fEGR3b2bnkEAbIvQt2yp+p9z6vxwxr/vjFcLEw/C1D3sB/qegfPcJRfdKEze7EYlqt9B
 CDaYQcUA294bpO8FERIGUwWz9eDq3jjd4bfVuYa7SNxbKWfygN5HWXqb5QKo3yKPr52Z
 128BUcD86iTcz10ewkNpylxZoUlFAJkCaqpeTb80mae9QL6/0LEPf3uVvKIzPQB0zM3P
 WuyC1qTCFHqdA8OlWYTVIPJZZznh7eYeKm7UIlZ3OZP9X0Hj2fGwbvD9SlQO9+u+6nzb
 2OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q521bSACgOTA+AcHoRMQbgV3YPYoW/eT88h0y+3lw94=;
 b=e/NYjwOiPK6V3LnJ2FmWSZL8zKMmITIe6PH1YW4r3xZQ9Ivq4VtqpHJv6iocvsK4U0
 //lAy/ZO+qPOmnXLFCWUsKXY6IyW4dhM0AIGzTaxLmBxDhvpIE+SY0DrExw22Chf6zwQ
 1EwJATFtZCsERTYc7T5dPZFHfe9wskG9hTdTUMOwpdCCz80fTVf1tPsBG+JEsjMUMwyt
 pJLS5+GOCVzKy3oB+af4oEryIcf0nSZcf9sKBF/vSAPAqSHgAmvZiPg3d719qr51iWpG
 p7aFcuzdR77vhSePLNaljBze83nYJ5Wj52isIrWKzcU3mlEufaMWmiv4tAHnPC++tCsq
 VhxQ==
X-Gm-Message-State: AOAM5325w+P5E/Zjl3DYsyk9Hs9YaOhXagqBMuFGbysygdZfFN8FQWM3
 C0sej6pz08rXtAljE9hESpQA7QW/VtNW+elQ
X-Google-Smtp-Source: ABdhPJy9u75DMdtNq5CgIh+VrOtDCVJ6AVm/AjfK8Y0MfPXTA5iFRPsZZ0Y2ehERjMnPgrJefPQyLA==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr35520132wrw.247.1617110758678; 
 Tue, 30 Mar 2021 06:25:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p18sm33140892wrs.68.2021.03.30.06.25.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 06:25:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
Date: Tue, 30 Mar 2021 14:25:52 +0100
Message-Id: <20210330132555.8144-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330132555.8144-1-peter.maydell@linaro.org>
References: <20210330132555.8144-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210323182958.277654-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
2.20.1


