Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9388D65F19A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMR-0000wb-2o; Thu, 05 Jan 2023 11:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM1-0000Yv-9o
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTLz-0007Of-5m
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso1776588wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2FLbsaEjrO+mfvP9azEL7lq/R52dHqN0L8IGeRLVJ0o=;
 b=jP+hA+y0EWKOILuYbI6CaDIEVAXZl4N/unlllakrSk5WmOGEl+nAOKOVBoeP4Tlreo
 LJAUHEhZ2kRsX1ppg+bkuk84CWwuYUAAJt5a95WjN1Nk39zJxSfwp7yF202lpqSDAG9O
 udImk0oHOG9MofnR1n3ZVcsozqGhTjWD8M6suJSwxImSmqpdZFCUJdaFYKvrGdNRS6GY
 Ltgr8O9ejjVPjxaZShs2MxnGyPWCfWxquR5BfiId7ujG63R4VnQpRU+bqQ1LjiRz29gI
 PNJd07DKupiDb5CcJX5cifs0UBV43qcl7fags6mX/xf3loQdPrFGnGunDH8sQOcbai4J
 NWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FLbsaEjrO+mfvP9azEL7lq/R52dHqN0L8IGeRLVJ0o=;
 b=vsfU94aKuwu2FFRJOm3pXsUZcBSw3s2QfgZDk3R6DbQpvgZDpkutBNy+VIgqJYzPVk
 Zcsisio/39hJIEy0X48iYosGnBtBuP0cNYVo2Z8klWPvn7iLADgeK/2hUNjhH7l0UuH+
 BlDbvwmbwtoZttGUF2/wzm4qK/W51fqKg57/z+glXN4Qe773Kn4inonBjGUymTGQbF35
 5ERKRtLXnA1VClSWUeM1BVX4on91wwSZTxVjAIyOg54O/ocZ+eQS1VBZ5CUjGby+Crt3
 +22FvAcbb2EeHYqvkzOFBWd3i8K0ITH+Lkt9KDgcRFIY4g5zpXdjwE3hiQBMbrcDXYKv
 cG2A==
X-Gm-Message-State: AFqh2kpgU01ZyBjGl+hhCKghAxAlp9J+McjaVDILkgHfM2G2+Q1vtonM
 0irfsLdVUZwUZEXcuco27FB3BpXesH6sVCMs
X-Google-Smtp-Source: AMrXdXvimhApqQ/IWVmRV81/FsuRZiBES4FAMDYlRbQ4eWr8lYJ9vtnaXkN7GliDtNSIL1BHssiVIw==
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id
 n34-20020a05600c502200b003c6e61eae8cmr45127208wmr.28.1672937069943; 
 Thu, 05 Jan 2023 08:44:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/34] hw/timer/imx_epit: update interrupt state on CR write
 access
Date: Thu,  5 Jan 2023 16:43:56 +0000
Message-Id: <20230105164417.3994639-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The interrupt state can change due to:
- reset clears both SR.OCIF and CR.OCIE
- write to CR.EN or CR.OCIE

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index f148868b8cb..7af3a8b10e8 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -206,12 +206,20 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
         if (s->cr & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
-            /*
-             * TODO: could we 'break' here? following operations appear
-             * to duplicate the work imx_epit_reset() already did.
-             */
         }
 
+        /*
+         * The interrupt state can change due to:
+         * - reset clears both SR.OCIF and CR.OCIE
+         * - write to CR.EN or CR.OCIE
+         */
+        imx_epit_update_int(s);
+
+        /*
+         * TODO: could we 'break' here for reset? following operations appear
+         * to duplicate the work imx_epit_reset() already did.
+         */
+
         ptimer_transaction_begin(s->timer_cmp);
         ptimer_transaction_begin(s->timer_reload);
 
-- 
2.25.1


