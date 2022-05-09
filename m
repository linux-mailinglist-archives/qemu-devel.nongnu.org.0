Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6E551FCE6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:32:39 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2Z4-00038X-CV
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22k-0007tu-EH
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22i-0001LV-Or
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so10617420wms.3
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CHxjayFyhr5I4QGmzb4c6k5c4ekfbOJ2eilTAyumfL8=;
 b=Yi1lT6KanPpBoe+NsJfg70qRGUAcu0QBBSI1m4uXpJUX0f6qsCaNB4P0lKf/Ou8QCP
 yTf0a5qUPuZapQEIG2SGgNacAqIzV0w6GyttKxFYsdS8P9P2zWWLpehYAqUJvDvvj15H
 cSxDEFVBPmM0zyioddmjxE9S+cQpU3P8Ck1UywjpqQ2Yfe79GAkHquHLnGd0zp4iB5nD
 0WlLU6N31lK9vuoq7NDjQIm3cpKM2ZtmPPQfbLkiAUenFxcjZTg+cL9gA5MwEmI/qbll
 KXcHi/9AWbOhg8E+KfBrf10Gwxvuf5ek8ULUQsQXr2aaSi+Bl1rwSMlUahBnv3qRIJ75
 cArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHxjayFyhr5I4QGmzb4c6k5c4ekfbOJ2eilTAyumfL8=;
 b=540PjjfgpErE66kXBajHeRaSqVE2w+/5f/0rGsbv19qQB/seCy+iu0Oev1YmcOSpqc
 I4drnaCEYhzhOcBifYCwsnQ8ykSmPC/JL8KDFZakOL0zD24K6Mt50JF6HcvyjavDzvDq
 BEFzHbWhQDJ/1wF+C2kV33Roq76yW8cqRr1NSE+1x1/wCoU2pmV1DLRStXTH92Eo3ndi
 Vb5V254Ltwl68OTGxzJGFI690cryVntrEWqAB5Rr9tuztkR1xOuhKMPQYixjgLEdXNZO
 ISKU2jVH5fBouuv6C3KZftnw6g3w07q824KLoVKTm/if8DvwYlR2Zf+eTKU5lsndgCuu
 o67w==
X-Gm-Message-State: AOAM532zH8Ts2cPOcLGtaQgS9VTYeOZXNIw34IjyQUNhIpunHnhlawcJ
 1M8XJp/XMOB3SzhQNpPMXUTsf5xvUcewYQ==
X-Google-Smtp-Source: ABdhPJygO3VzmttG6ocfV44a0agjpmDoHvyH4GQGVsnRp4kW18trYUR05w2VzVRBWYGHJQ3Ta/LCew==
X-Received: by 2002:a05:600c:6005:b0:394:7ba4:5e62 with SMTP id
 az5-20020a05600c600500b003947ba45e62mr14997828wmb.25.1652097551512; 
 Mon, 09 May 2022 04:59:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.59.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:59:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/32] hw/arm: add versioning to sbsa-ref machine DT
Date: Mon,  9 May 2022 12:58:42 +0100
Message-Id: <20220509115848.3521805-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leif Lindholm <quic_llindhol@quicinc.com>

The sbsa-ref machine is continuously evolving. Some of the changes we
want to make in the near future, to align with real components (e.g.
the GIC-700), will break compatibility for existing firmware.

Introduce two new properties to the DT generated on machine generation:
- machine-version-major
  To be incremented when a platform change makes the machine
  incompatible with existing firmware.
- machine-version-minor
  To be incremented when functionality is added to the machine
  without causing incompatibility with existing firmware.
  to be reset to 0 when machine-version-major is incremented.

This versioning scheme is *neither*:
- A QEMU versioned machine type; a given version of QEMU will emulate
  a given version of the platform.
- A reflection of level of SBSA (now SystemReady SR) support provided.

The version will increment on guest-visible functional changes only,
akin to a revision ID register found on a physical platform.

These properties are both introduced with the value 0.
(Hence, a machine where the DT is lacking these nodes is equivalent
to version 0.0.)

Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
Message-id: 20220505113947.75714-1-quic_llindhol@quicinc.com
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index dac8860f2d0..4bb444684f4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -192,6 +192,20 @@ static void create_fdt(SBSAMachineState *sms)
     qemu_fdt_setprop_cell(fdt, "/", "#address-cells", 0x2);
     qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
 
+    /*
+     * This versioning scheme is for informing platform fw only. It is neither:
+     * - A QEMU versioned machine type; a given version of QEMU will emulate
+     *   a given version of the platform.
+     * - A reflection of level of SBSA (now SystemReady SR) support provided.
+     *
+     * machine-version-major: updated when changes breaking fw compatibility
+     *                        are introduced.
+     * machine-version-minor: updated when features are added that don't break
+     *                        fw compatibility.
+     */
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
+
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
         uint32_t *matrix = g_malloc0(size);
-- 
2.25.1


