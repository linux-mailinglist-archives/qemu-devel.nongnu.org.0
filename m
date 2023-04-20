Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1C16E8F1F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:06:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAF-0000do-Nb; Thu, 20 Apr 2023 06:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA7-0000Yj-B1
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0003qM-Lq
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso5163925e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985104; x=1684577104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EjMl5vexxEGO4PAe7d3muxw4Zdgc0H+6hNltDpoCeUI=;
 b=nZ8QkaA0KGbsoYwPS/sZMHgyZUNCcRCbzjik1qTAXyPxuGuU1LkGzns6KNvx0oddkp
 oIBkpsTuqx63C8QZVIP827tn6p049F9m5BQLlN9QvOzVAcdKaufitfXooVcMMS1iRks+
 K/z/qvMQpCtNsGSoyw6zI7/lO3MYP4rQzsA8k9H/5/rpEmtwRMJtbUI25T2kGupkJ3NQ
 RK+4mPF9f4PpMXEgviQtbEaoDWGnYia5+oRLRkCIU+Ylo/HG3RCFz+5VxKMO0epNvBRI
 RRgXIJ7k1Vx2DLenGy57Rc3XfyBAdHvgteRutnAozDgKHsAVO/EWXmsX2D9SKJuVnpiF
 FUJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985104; x=1684577104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EjMl5vexxEGO4PAe7d3muxw4Zdgc0H+6hNltDpoCeUI=;
 b=L64rcE2xXgKX0Wiy4jVwqr6iRyPobH0E5Zl1MaTBKK9LQLv45SGoAU3b1NQa7d6P8v
 SSaN+K3xvr6UDasq0q3zyTphLyHbBnkivQvhpMa0JFLcxBGuKMSwe3OyCPzNRIZABhOz
 Y0gGYZSSQqI0Rr5+fMdbudJb4WgyEMUbImR0aKc7mJ+wNQuR/yAFzKeKNuO6mEaBD2bu
 ieCiSt+LpEp0X5uxYszNZdMdNViTMotadvX5Q5LnbE+6Ck6eetqkGPyzsflNgX3M59h7
 NEbehiLP3au29xxSfd8VF19j018f9BHVuxhgo7vkI1UV7Sb489lALomyfquxoSd5ttG2
 ei3w==
X-Gm-Message-State: AAQBX9d2UpdeYoOpCDiHdTcQRgmADSKeWoHXEGvnlkWq+SZaFgNVUPID
 Xov71GetqfQABe3bpZJo6M/I+3QI7g1GEJTSG6M=
X-Google-Smtp-Source: AKy350YjMBApk/JOOiqi8ntkVyYOQ9viveMtEqY44Nsi6qBLuMSDOoj9v9zqVEj7lDjgtmR+5PpC+w==
X-Received: by 2002:adf:e3ca:0:b0:2ef:ab51:15c2 with SMTP id
 k10-20020adfe3ca000000b002efab5115c2mr904602wrm.15.1681985103532; 
 Thu, 20 Apr 2023 03:05:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/21] hw/timer/imx_epit: fix limit check
Date: Thu, 20 Apr 2023 11:04:43 +0100
Message-Id: <20230420100456.944969-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Fix the limit check. If the limit is less than the compare value,
the timer can never reach this value, thus it will never fire.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1491
Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Message-id: 168070611775.20412.2883242077302841473-2@git.sr.ht
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 0821c62cd1c..640e4399c24 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -179,7 +179,7 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
          * the compare value. Otherwise it may fire at most once in the
          * current round.
          */
-        is_oneshot = (limit >= s->cmp);
+        is_oneshot = (limit < s->cmp);
         if (counter >= s->cmp) {
             /* The compare timer fires in the current round. */
             counter -= s->cmp;
-- 
2.34.1


