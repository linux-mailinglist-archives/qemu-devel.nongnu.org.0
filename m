Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B899E65F2CF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMI-0000bU-4A; Thu, 05 Jan 2023 11:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLz-0000WT-TF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLy-0007MR-93
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1803665wmb.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TK1ZAIb2SC1DPcdzdUgcMa2CLBumxiEB57+So4PesS8=;
 b=YOxUM/+etWUtZiir+YsugNs3bCaR7ypo2CRlnM5Aw5GTGsYq3rPRUju4H7S7F3Ma+C
 V1vLnCxTtGA0irMa7Gy+Kot/9tW2IDXOc6JQBuVXhSlSeU8OsRbNZi7PLnaisWJc9AGr
 6c8tcGci1Bo55K0lA0cEWKvC9NczPRF22EU6CLmv9+Wb9Dn0fQAwBbN/b4nCM+azbjCm
 Ka07TikmsyTcADkXEha8RRlJEldTuE3BXfREKieo8RXIyBMd0pUcoHiy3OVZiUzgiKDT
 DXvEpbGP0i7B0LLuFRVEROYaLxR85QN5oMCjQQhu+0yodC6FJ6HNqdj0Ob9LiMSKx7GU
 8vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TK1ZAIb2SC1DPcdzdUgcMa2CLBumxiEB57+So4PesS8=;
 b=Iobl2y6Fd5VD960bhU2RwAe88uDyCclhJ2vLUGC1w3oGrtbQjzmX5aEg+6OJNOKNnE
 kyqUcz2bJLPfO/jxpEuDPMbRxtt99dsKxpAEeLAEZI6IoiwY+CE+sCHcLPDfWlJEKXo/
 mCA1QefXXUz+PzVO/RNl/JZpZ99IlVuXtITxTKO/vFQC5c0CwXzv9Ja3ZdaLVkYJWO8g
 EHvqlIIODaPA9gxuttd5gUCym+pbK9ubIYqYKJ2VR8dIbmnNS3zYPT4R0vMzTnfHAGJs
 pDlCUDL3GJCndAPhds7L7Ku6ZzQxEhSLtyrunjhnhSbZyYD9y1rYaSXIvnsPF9c+Nj2W
 cL4g==
X-Gm-Message-State: AFqh2kqc2poD085VzWiDU5qT2nJtz+DkZJt+VX6ksJmvVTb4RxFaAuRi
 vzsheb3p7yAO3tF+RMAjdD6K7kQ/fMW/5cLc
X-Google-Smtp-Source: AMrXdXsWMmEZJBmwL6VEk6aDSt3V0JHI2s7dKE8zp/mvx5W00geXFO8wM+k2izt1bBqfxuI7pzSFww==
X-Received: by 2002:a05:600c:1d0e:b0:3cf:7c8b:a7c7 with SMTP id
 l14-20020a05600c1d0e00b003cf7c8ba7c7mr36564738wms.39.1672937069176; 
 Thu, 05 Jan 2023 08:44:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/34] hw/timer/imx_epit: define SR_OCIF
Date: Thu,  5 Jan 2023 16:43:55 +0000
Message-Id: <20230105164417.3994639-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/imx_epit.h |  2 ++
 hw/timer/imx_epit.c         | 12 ++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index e2cb96229be..783eaf0c3a6 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -53,6 +53,8 @@
 #define CR_CLKSRC_SHIFT (24)
 #define CR_CLKSRC_BITS  (2)
 
+#define SR_OCIF     (1 << 0)
+
 #define EPIT_TIMER_MAX  0XFFFFFFFFUL
 
 #define TYPE_IMX_EPIT "imx.epit"
diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 661e9158e3b..f148868b8cb 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -66,7 +66,7 @@ static const IMXClk imx_epit_clocks[] =  {
  */
 static void imx_epit_update_int(IMXEPITState *s)
 {
-    if (s->sr && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
+    if ((s->sr & SR_OCIF) && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
         qemu_irq_raise(s->irq);
     } else {
         qemu_irq_lower(s->irq);
@@ -256,9 +256,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         break;
 
     case 1: /* SR - ACK*/
-        /* writing 1 to OCIF clears the OCIF bit */
-        if (value & 0x01) {
-            s->sr = 0;
+        /* writing 1 to SR.OCIF clears this bit and turns the interrupt off */
+        if (value & SR_OCIF) {
+            s->sr = 0; /* SR.OCIF is the only bit in this register anyway */
             imx_epit_update_int(s);
         }
         break;
@@ -309,8 +309,8 @@ static void imx_epit_cmp(void *opaque)
     IMXEPITState *s = IMX_EPIT(opaque);
 
     DPRINTF("sr was %d\n", s->sr);
-
-    s->sr = 1;
+    /* Set interrupt status bit SR.OCIF and update the interrupt state */
+    s->sr |= SR_OCIF;
     imx_epit_update_int(s);
 }
 
-- 
2.25.1


