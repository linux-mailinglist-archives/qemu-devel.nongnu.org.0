Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4379619CD3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:16:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMe-0007pv-JW; Fri, 04 Nov 2022 12:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzM1-0006WF-Q4
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLw-0000iF-E4
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id o4so7744497wrq.6
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LgwWUCq9zFhY/xMo6SS9MgYNo0IB4SrVXfC493SuMF0=;
 b=YY3iouWoz76g+Hk0iylTL3vOsBfGKqg7n38dfcJafUcKJYmnT5KFf4Xxt0oBnxeyzx
 0GbXyA5MlFk9236AWpsqEiMAPzpsK2ewwR9oNFCfyOFxlIqB5t7DweesP34RP3dO7wA8
 YMelY6Q7J/ZLdgs/mh1RNyNbakvM3Gl1sS3GH0OCi1494MS4YhmT7alLALpnL0kfpHA9
 skob8Qdn5gNtuv87hJo9vPSF+Jm/6d1yAo8v6wBjawyubV7dDfU1YcMFlaxhNt1yDX4P
 6CcLyE3SqPk0k1HGKuquusyFKOm/MFXMOnzCQKMW67/7d9iscQRSvTCKoD49kuIRfZ4r
 RE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LgwWUCq9zFhY/xMo6SS9MgYNo0IB4SrVXfC493SuMF0=;
 b=IW5+2Gcman2tkgv/soyjaLLCotKLhB2tDsthb10HCvvle6kiscbAcLwdPId3nmqkRy
 9f/4oZjml2gDjZmsgtbfg6fH/QbWTUfkEKEPkO9j8wweidNEPHgcTzeTvOUizgnwWRmh
 2UqnBoClQhMPPqmcd1JT6iecllV5Nebp0t9xrdq4Nr+c0D7rfk/PC7lfFB5ea7Upa1xl
 BfsSEz2Fa1h/UthCuyb0qscvmO9bQ50v5gfiTEnLr6RllKMCieh8NbjqgsiprB/6Bno1
 oLLFCUO0j72ZXYMZlbqMcj1bbNiJXtEl9cCYM1cAdPX/wTJLbt+CBBIProjMFypLI8mK
 CCkA==
X-Gm-Message-State: ACrzQf1UboSCFN72d3IWr83+ON6Ewy9QvkiCoW/DG+qkinei0wjud2nQ
 ml0k9u2K8vFU75haCOYJcXB2/R2aTkeYbw==
X-Google-Smtp-Source: AMsMyM4BTWX4pGWM4xnaIxX0rV1FeIKOgkAIIaht/6CoFCylEfg9oCtNJkgPs3FqXCQ8NUOonzvQCA==
X-Received: by 2002:a5d:59af:0:b0:236:6b90:1e65 with SMTP id
 p15-20020a5d59af000000b002366b901e65mr22964926wrr.362.1667578529175; 
 Fri, 04 Nov 2022 09:15:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 9/9] hw: Remove device_legacy_reset()
Date: Fri,  4 Nov 2022 16:15:13 +0000
Message-Id: <20221104161513.2455862-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The device_legacy_reset() function is now not used anywhere, so we
can remove the implementation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/qdev-core.h |  9 ---------
 hw/core/qdev.c         | 10 ----------
 2 files changed, 19 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index c7eda169d78..35fddb19a64 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -776,15 +776,6 @@ BusState *sysbus_get_default(void);
 char *qdev_get_fw_dev_path(DeviceState *dev);
 char *qdev_get_own_fw_dev_path_from_handler(BusState *bus, DeviceState *dev);
 
-/**
- * device_legacy_reset:
- *
- * Reset a single device (by calling the reset method).
- * Note: This function is deprecated and will be removed when it becomes unused.
- * Please use device_cold_reset() now.
- */
-void device_legacy_reset(DeviceState *dev);
-
 void device_class_set_props(DeviceClass *dc, Property *props);
 
 /**
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 3b0f04c5c6d..2743191efe7 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -857,16 +857,6 @@ void device_class_set_parent_unrealize(DeviceClass *dc,
     dc->unrealize = dev_unrealize;
 }
 
-void device_legacy_reset(DeviceState *dev)
-{
-    DeviceClass *klass = DEVICE_GET_CLASS(dev);
-
-    trace_qdev_reset(dev, object_get_typename(OBJECT(dev)));
-    if (klass->reset) {
-        klass->reset(dev);
-    }
-}
-
 Object *qdev_get_machine(void)
 {
     static Object *dev;
-- 
2.25.1


