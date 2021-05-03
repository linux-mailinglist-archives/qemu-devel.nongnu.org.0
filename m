Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1543717C6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:22:40 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaP9-0007hO-9A
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:22:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLZ-0003SS-Tg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLV-0000wG-VG
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:57 -0400
Received: by mail-wr1-x436.google.com with SMTP id x7so5981092wrw.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xfn4AYQKFGrvOYwzo5Ei84iKPoWu92o75Jz8/sEuH+8=;
 b=Yd6re/fF9R0D04QmOKQLLukCZ3jJFRsfy0gco1jmnA1vDTXD2xyHbT8B0a2c7D043P
 LW4qJepxHFWnpA+9IWck1xen1PrJ9j5v+BC+cge5M7PqMB92I1gMFlfv1Cn589UXhxw0
 kUnwAOA3bhQPDI5zrgVDsFa3vws3muPiE8oZvBAiCaAtC/CiALDzG/9L3uS94QuGdgB4
 uKzFOi3xXTHllyzlgJuxigqgU/c/VInd3K/aaxiH5MJZA9EZq3OiGpUkZTH2fDfiuMHV
 RNV6jPjYIZojTcOQSFbg7lqhegn1Sjf+AdXvdZOnickMToVsPfHHwmT2jcssVrwTgr/N
 dI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xfn4AYQKFGrvOYwzo5Ei84iKPoWu92o75Jz8/sEuH+8=;
 b=WehT7uPyCfgXUHs+a1ji10tpUZkHNQu9+xwer5QXDs7rJ4IrGdO5gt8rIgkQ3Uz0iu
 hpsRQ0pCitDaUFK6/vHtKiRZbgE3rxXbHukl2iIyOWo+3xgK3y9CKK57QITll+2Ndd+7
 kvouc4mFB5i1egSfYt0YmDaUFtToyyywRdvvjPSZiaJIGwScCa07e+ewbtxFGOGiTw4y
 1gquuAYYy3oJ1QH0o49y1xi+fz9puESElcMnIzOmPDJHYeYsD7qLiRTgsKGVfSMsnnS1
 j7VbSSYCvE+l841e0xMdiqF5Pq7hVnTHSaSFaF8gMizoPWsPGsLoS3W76PZ8tv17uGRw
 hUCg==
X-Gm-Message-State: AOAM531tkw37o9mkFiDwXATUMreH9vXOOoKC/+heX9ljaJacgjSGq359
 DhzOI6mlFq/acOPY7U2ZCMXBqTQibbINBA==
X-Google-Smtp-Source: ABdhPJydBpnVEutMnxFS6NWOMc0WliTlbaH1/cTRmZRhb7/e+eO7TvcH13nnTOG4NqqNkh6TGJfFPg==
X-Received: by 2002:adf:f9c5:: with SMTP id w5mr17708708wrr.222.1620055132665; 
 Mon, 03 May 2021 08:18:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u5sm11778254wrt.38.2021.05.03.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:18:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/ppc/spapr_vio: Reset TCE table object with
 device_cold_reset()
Date: Mon,  3 May 2021 16:18:48 +0100
Message-Id: <20210503151849.8766-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503151849.8766-1-peter.maydell@linaro.org>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spapr_vio_quiesce_one() function resets the TCE table object
(TYPE_SPAPR_TCE_TABLE) via device_legacy_reset().  We know that
objects of that type do not have a qbus of their own, so the new
device_cold_reset() function (which resets both the device and its
child buses) is equivalent here to device_legacy_reset() and we can
just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ppc/spapr_vio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index ef06e0362c8..b59452bcd62 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -310,7 +310,7 @@ int spapr_vio_send_crq(SpaprVioDevice *dev, uint8_t *crq)
 static void spapr_vio_quiesce_one(SpaprVioDevice *dev)
 {
     if (dev->tcet) {
-        device_legacy_reset(DEVICE(dev->tcet));
+        device_cold_reset(DEVICE(dev->tcet));
     }
     free_crq(dev);
 }
-- 
2.20.1


