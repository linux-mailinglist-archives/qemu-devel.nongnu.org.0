Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3CB694D9F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcED-00041F-Ei; Mon, 13 Feb 2023 12:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDc-0002t2-17
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDa-0007aQ-Dg
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:19 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n13so9159020wmr.4
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhQReXuPG7LsDYOszlFQ0XTN6zBYBgflQ/Ni/g9nugY=;
 b=PVQlHk5CCxg2psY8mGo33PLjxMr9uLpq8lymGXIvXO+1rZSGRJ3/fTpYOaiakX7jMW
 ppVxBYvyyTKJ8DaVmvWJyHCacuVL6ga5cmAdZsU66J7F47pLxUsVyDWAE6pCM+JvGD9v
 vvevjqzAtD0Rv7jaGWmUYSpbJcXvgAqXzvmvy78SRItij0fjHZv969KefXDCVbWyHqY8
 BvAI8kGEpxHrOhB6d2g6Q9C6jmmY+eAWBPwmHB7z2Mle/9HwWTaDIHNPWFq56T/5Rg5C
 mjYxhF0lEscgTNgw3ZVIuEq1gqdkTDFNLdklrLEZAY71OXmv1ijCKU5l1mhrRWbmmm4r
 4TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhQReXuPG7LsDYOszlFQ0XTN6zBYBgflQ/Ni/g9nugY=;
 b=hvvrioMV5/EeuxMET1LRsU6uPzrY103G17xPnHcuuh7Ot1wxT8TqQ92TLuZiVdjnwg
 AhJ6NZR+ndFxIXTBgS+d0omQxA0tjCFIePKZgKWSoj+YnBgRv+6vrM7sSePT1s+NPrEw
 XJFkpXTeoqgPNxPbztyX+jOMEsNuExCKtINQXp9vzJGhWLoKalyA+Zlw5M1ajvcQnwgD
 oKuLGm3W+ipVNejrOpgiwpjinFVYxrmMRfuwHe/TJfs8YRNYLKd/t4CK+9SSCkIyEUaO
 SbqOzmVA72+3OytA7+XTxKPbFHgBF25NuASMMr4o1qDtTDuL4njIsEr2cicW7NvKN254
 a6fA==
X-Gm-Message-State: AO0yUKXpGJ/wJ4qQQOUOVTNm5H9O2LDo7gkSF+4ew+JHLcvMR/sFOQJy
 wPCVcvNrpsizwF+ywqyyjl4AWQ==
X-Google-Smtp-Source: AK7set9xrKRVdKPOfnNSC8oVRNbODsWtkjchYN3ZP2ny0JUhUsAXcQfbuzaTRdXKvPcuLE5wsOvG3g==
X-Received: by 2002:a05:600c:755:b0:3dc:443e:4212 with SMTP id
 j21-20020a05600c075500b003dc443e4212mr19463252wmn.1.1676307737699; 
 Mon, 13 Feb 2023 09:02:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a05600c491800b003dc0cb5e3f1sm13592881wmp.46.2023.02.13.09.02.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:02:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 5/6] hw/vfio/ccw: Remove pointless S390CCWDevice variable
Date: Mon, 13 Feb 2023 18:01:44 +0100
Message-Id: <20230213170145.45666-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

QOM parenthood relationship is:

  VFIOCCWDevice -> S390CCWDevice -> CcwDevice -> DeviceState

No need to double-cast, call CCW_DEVICE() on VFIOCCWDevice.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/vfio/ccw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 2ea7b4a63c..cd66b66742 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -314,8 +314,7 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
 {
     VFIOCCWDevice *vcdev = opaque;
     struct ccw_io_region *region = vcdev->io_region;
-    S390CCWDevice *cdev = S390_CCW_DEVICE(vcdev);
-    CcwDevice *ccw_dev = CCW_DEVICE(cdev);
+    CcwDevice *ccw_dev = CCW_DEVICE(vcdev);
     SubchDev *sch = ccw_dev->sch;
     SCHIB *schib = &sch->curr_status;
     SCSW s;
-- 
2.38.1


