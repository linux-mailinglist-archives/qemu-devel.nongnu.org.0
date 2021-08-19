Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC53F1B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:16:58 +0200 (CEST)
Received: from localhost ([::1]:46758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiqm-00007b-QH
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGipW-0007Ho-HJ
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGipT-0001qM-2x
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=urxwvqXr9zIlOigll43mLC+EktS4CGbb0Pw2LonzhBc=;
 b=foQyGI7ww4yv7KkZ6RPvTAraT6eYIW0X5q7XSQsdvr1zMaYh2yfRsVjNOSg20jQH9ZeJ7K
 ii+D7b+HfvjR6UpOqWc+vN5fex8/DtkQzyWIg+L7pbwzEfGZ2wSHQoanwoKnXtZ2S7JbGz
 HuYOMfe/f8ALKOZ91+gxp2tP1XdIDjU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-U6P0OUShM7uPjPAxkRPugw-1; Thu, 19 Aug 2021 10:15:30 -0400
X-MC-Unique: U6P0OUShM7uPjPAxkRPugw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h24-20020adfa4d8000000b00156d9931072so1744292wrb.15
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=urxwvqXr9zIlOigll43mLC+EktS4CGbb0Pw2LonzhBc=;
 b=dTj8kg0ZBog2N8lF2h3iANqvU2qqXyEH5S1cFobJB936xtdch4Iws2wiPh8p9098ti
 hi23wB65rUvMrwVjLPmwc4NhCwY3KIhN7uxoekRJL+GHG3PdpePKULFi6sVV+jyOJjLP
 c8poVBeM8gfEErCrITn2Szkwa1WxlgGZ/gf75k1BieHdGaNgLkRXD7XmtUvn9BeAL1uk
 mWJGPQhsLvCtU3sPKfuui9adqigVyOaYL6FYNNSALJRJSVD7UENZbpwXiGVxe6ElSbcq
 RvU5VPRKxhLMcCIMjQFwonsD8xVYXfNukcV38aOfJuCIVLdZ6VVL4HQk0Q1yKhhYrANl
 ZpeA==
X-Gm-Message-State: AOAM531MdDU2wSu9foxfE1Bdt+wXKLZennFzU/RpFF0qEWdcMtVqnM/V
 3OaVI6LZMkGBKtpqd5VtP35J1/2uyRLVdc8+I1BSt4QOO2s9/ZaVOgVGowg8jdRDtJgI0OuoeTm
 3P+cK/r60mnTDitUjEWYU9sdpBGhbGYOBIUV+cgJCQfmQG0myuGIJY9BAEqLmZIdG
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr4178783wrf.421.1629382529008; 
 Thu, 19 Aug 2021 07:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9pBwnVyEPU4a/jjXVOj8gPL1c0PRDpt95B5qeHtKROK3FpYUWK70u1xFkocWzyfJh/+8jmA==
X-Received: by 2002:a5d:58cd:: with SMTP id o13mr4178734wrf.421.1629382528688; 
 Thu, 19 Aug 2021 07:15:28 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c2sm3048262wrs.60.2021.08.19.07.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:15:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/dma/xlnx_csu_dma: Fix ptimer resource leak
Date: Thu, 19 Aug 2021 16:15:27 +0200
Message-Id: <20210819141527.2821842-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 35593573b25 ("hw/dma: Implement a Xilinx CSU DMA model")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/dma/xlnx_csu_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 797b4fed8f5..0c1c19cab5a 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -660,6 +660,13 @@ static void xlnx_csu_dma_realize(DeviceState *dev, Error **errp)
     s->r_size_last_word = 0;
 }
 
+static void xlnx_csu_dma_unrealize(DeviceState *dev)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dev);
+
+    ptimer_free(s->src_timer);
+}
+
 static const VMStateDescription vmstate_xlnx_csu_dma = {
     .name = TYPE_XLNX_CSU_DMA,
     .version_id = 0,
@@ -700,6 +707,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
+    dc->unrealize = xlnx_csu_dma_unrealize;
     dc->vmsd = &vmstate_xlnx_csu_dma;
     device_class_set_props(dc, xlnx_csu_dma_properties);
 
-- 
2.31.1


