Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5543717BA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:20:24 +0200 (CEST)
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaMw-0004oZ-Ur
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLX-0003Pp-VU
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:56 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldaLV-0000w5-9R
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:18:55 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h4so5961063wrt.12
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 08:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QSfXWYH/MWSLGgnMJhCDq7XAHXg2fV0Y8Gx8cAHkbQ0=;
 b=qvwzo45OMvvbxGmvifZHW6kEdTMFuS9cWGzlWFYMdPFpdJm3drsKqJLeFcZPF0t9p8
 qmpPCzv3Dr+6Il0q71kTR2poXoaht2zQAHskUYV7ewA05kePOZRwg53Sxs7uv8D2ynG2
 iL1zB64vTQk64DZ8Qst1PTiMLf2pGGHSWrhv7hmBZ6c9jHqfKDx/1iXIDAxPVrLeRCeU
 plgAhZww/1ClHv7QoYxzp9OGMkHFpGxDkM4eKiP5dFvrfWIfm3pYdfCNaRv87HV8wY9e
 umWdT7egjKbusFet3b2fKfruIUpzsEqDrrhqRt/PeIHO23wJRkqQMNbO1EwG3c9o4ZVe
 NZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QSfXWYH/MWSLGgnMJhCDq7XAHXg2fV0Y8Gx8cAHkbQ0=;
 b=paQwMtgqrTBjyn+q+Br3x7L0xU4klN5iRU52Wj+tVIIw+DnGAp6Z8QPbNe3FAiz61S
 t5+9yKN1O31AWqaFb7V0pCyQ42p+RDKCCmcEIVC/JjSE1ni+9gpIkUba2EMtSvPCwxF8
 tMWYZDtlx7nuSY5Go9BZJS2STlnn5nFDmpolubzHAFkVFwG1foxRgUGUC4df0X7U7r+l
 TV30NIgtJidfsfKJlkMxG4ZHgkR2kblCmvz99S9sH+zkydngjkuFpP2bpHWIBeXNgDl7
 5czOUiPPBIXQOCzRPQZbmQFJSh6moeUlABveX8VwDziQDSO3VeiwtOJU4cA/B6MqbGLO
 2bug==
X-Gm-Message-State: AOAM532oW4pamBnAcFkDFKWbugTCGHlWEkxMDIeqwaLwa2/NBdvOMHXn
 ieK1Fw0QykjfUocO+BErFQCxl3NqD1Gvtg==
X-Google-Smtp-Source: ABdhPJxLqc3L2sBfxSVoDzt4UcQvomwhC3Qv4B2BdTdJtLVy49ZEPkwVfH89n3owAT4IsaMLfov98A==
X-Received: by 2002:a5d:6484:: with SMTP id o4mr9259564wri.8.1620055131904;
 Mon, 03 May 2021 08:18:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u5sm11778254wrt.38.2021.05.03.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:18:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/intc/spapr_xive: Use device_cold_reset() instead of
 device_legacy_reset()
Date: Mon,  3 May 2021 16:18:47 +0100
Message-Id: <20210503151849.8766-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210503151849.8766-1-peter.maydell@linaro.org>
References: <20210503151849.8766-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The h_int_reset() function resets the XIVE interrupt controller via
device_legacy_reset().  We know that the interrupt controller does
not have a qbus of its own, so the new device_cold_reset() function
(which resets both the device and its child buses) is equivalent here
to device_legacy_reset() and we can just switch to the new API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/spapr_xive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
index 801bc193416..89cfa018f59 100644
--- a/hw/intc/spapr_xive.c
+++ b/hw/intc/spapr_xive.c
@@ -1798,7 +1798,7 @@ static target_ulong h_int_reset(PowerPCCPU *cpu,
         return H_PARAMETER;
     }
 
-    device_legacy_reset(DEVICE(xive));
+    device_cold_reset(DEVICE(xive));
 
     if (spapr_xive_in_kernel(xive)) {
         Error *local_err = NULL;
-- 
2.20.1


