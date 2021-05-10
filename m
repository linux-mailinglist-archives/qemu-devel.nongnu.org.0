Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B0379781
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:15:45 +0200 (CEST)
Received: from localhost ([::1]:44440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBNY-00009U-29
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGv-0000Y4-MK
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:53 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgBGs-0004wY-Bu
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:08:53 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l14so17735409wrx.5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IA8v2i4O86UnUvs9gQRCAZoRczka9Szx0p0QDCUmjDk=;
 b=QIny4iolu9yKKYUTFrdgum0Gv26tKcGF4dPMa59+N/QGC1WPIJOfjMKMLbqX8Zt7Kw
 shW6eIHUnSgzezRhr/ejiVXYAv6dNKCiYi0wzYzx31oSmCQ4jquzI+1/7oQwq1JgfPFN
 CeF8dv3rXNE6Z/vTQaqAVYLfotKJ5V8zP2lZgshbJayss9E2JjWLka8f/pk+kf81Ka8k
 ft9KGnOPHfrb0liIBk+/+SdQ2pccSmO0yQt5uqUgjbT7o04XOoVOJRNFrI7vCX7Sugob
 NijMVUpiW/UAJtto4vZILd3cvE5ZvjTPpjIWIVQPZpI+1J6bGm8YtsEaxFdAYKixdJaW
 X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IA8v2i4O86UnUvs9gQRCAZoRczka9Szx0p0QDCUmjDk=;
 b=hPn9wCOCleAMSiAS2pr39tEgRyMhR9D/gITEES8ITpwQTgimWPnNi3/SrsU9iwPhq3
 Z+QpnoRdIcjynHaiZcQ4AlWmJqkmu+w4hSC/L9YS8kSk9GLqX9x/EONuWhrDfDRXSe/5
 /x7ZIGXwl46iylhrEHEfFqFhbHhraeo/PVQGHQ7EP3h0MW8+FnkMuJn/W3248nvrTeCt
 hnS6CWdMIkMXufQvfFf7oiW8TM6IRExjKPtdfwynu9p5SL8CaubnnxHyNdAawMkZBHpo
 9DUIw+mq9DPJ/4ZfjNtoglm4cx1NKyEs1I4LAop8egBHb5sUotf8GEPwV+3OApmQv1QZ
 DLSQ==
X-Gm-Message-State: AOAM532IVIvRMJDltRYF5NlsSW4Y+rQqU66Eg8ducZklPFoDbD78BDOV
 6ilGW0x6PjWoTwMdzwhpSjuqqQ==
X-Google-Smtp-Source: ABdhPJx3lcYpeWcVnbUbWTCTlPjTc7Ql+zlk3VkqeZ/CzzcDeC58JPVcjUy+yuamaD9sHBkINz+Wyg==
X-Received: by 2002:a5d:54c2:: with SMTP id x2mr31703446wrv.278.1620673728710; 
 Mon, 10 May 2021 12:08:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t23sm463892wmj.31.2021.05.10.12.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:08:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] hw/arm/mps2-tz: Don't duplicate modelling of SRAM in AN524
Date: Mon, 10 May 2021 20:08:39 +0100
Message-Id: <20210510190844.17799-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
References: <20210510190844.17799-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SRAM at 0x2000_0000 is part of the SSE-200 itself, and we model
it that way in hw/arm/armsse.c (along with the associated MPCs).  We
incorrectly also added an entry to the RAMInfo array for the AN524 in
hw/arm/mps2-tz.c, which was pointless because the CPU would never see
it.  Delete it.

The bug had no guest-visible effect because devices in the SSE-200
take priority over those in the board model (armsse.c maps
s->board_memory at priority -2).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 70aa31a7f6c..77ff83acb06 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -243,19 +243,13 @@ static const RAMInfo an524_raminfo[] = { {
         .size = 512 * KiB,
         .mpc = 0,
         .mrindex = 0,
-    }, {
-        .name = "sram",
-        .base = 0x20000000,
-        .size = 32 * 4 * KiB,
-        .mpc = -1,
-        .mrindex = 1,
     }, {
         /* We don't model QSPI flash yet; for now expose it as simple ROM */
         .name = "QSPI",
         .base = 0x28000000,
         .size = 8 * MiB,
         .mpc = 1,
-        .mrindex = 2,
+        .mrindex = 1,
         .flags = IS_ROM,
     }, {
         .name = "DDR",
-- 
2.20.1


