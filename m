Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D366D2B64F7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:51:43 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf1OY-0006JQ-V0
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Ln-0003Uv-HC
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:51 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:33535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf1Lj-0001wy-Ss
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 08:48:51 -0500
Received: by mail-wm1-x344.google.com with SMTP id p19so2081855wmg.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 05:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WT37bYNqvqYKmtijsnBsmig/2KKXqudPCkO86LomDGE=;
 b=xTNDwW8GPt/T0TpbFjugpQND1hL9etagsZsNHM4+6WaCOdxtHshpiHAAsjfN+zY24Y
 LTmGECH80+P3iOsFVfyOKvA8gc/ed83z2ZKAzVdXkRKLM5f/OD42YAOzfj2wLDfgP5An
 XQO+MtmnkI9uemews5VsEVDPjs+Bnt2fQ6yB5WQ7PGO3MbalThetrv5HF2B4ONBIyOrZ
 abUdooCeXRs5r1QG1/Iqc1hNLBRuC28polYlLlEtQ3z/vjHpFyVnYhYeYYfiNHinyvmh
 zJcOk+uhQO/ItNrthAIEUU8nX9bGgznashIgYnXxg6h5jEdLnEBEXLbQRatyqCKiMn0S
 LYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WT37bYNqvqYKmtijsnBsmig/2KKXqudPCkO86LomDGE=;
 b=DX9DudTJoIKpNW5BVul3ezbdEhbe6QAkQ3Kxeb4UnekEwWFEMpMPLSs1yfshZrAOqv
 7O0yEJYuS8nET9NHr5nAH00EfgkBWKjiSuQVxghaOKINUzbq41ejUcDDnpwPchhQzOeQ
 vik8i5ifFYw4tN+VQ6u3wM2nyYzw/IvpSOK5b4CUY3TP7VFrNjgBnYigqUqTaN0hBSly
 xcuSnNlH6V4pObi7CxsiuymScfJKS+ITTx0pVJrZzAZyY3RUFCdfUvJURvtOPq0yQs5Y
 PWqzq9MNfpGUHbiqCXB20DkCOV7TJqZLYki/qx3hDRKwZ5zhIxKB4S8BIDkJHXch4u3X
 PB3w==
X-Gm-Message-State: AOAM533ZMqD15lj3NZc4RXgqDIv4O/yO7s/xjrRCyjBDDjEl8ltJ3HDI
 PnWmZjTObUIwzolf2DIklrCqsekcf8jnyg==
X-Google-Smtp-Source: ABdhPJzdSRLOszoAMMPfjfMaqjRkTOC2V/m4nGUtkhEZJUxRQ2Yw8Yrm4MfZX426jHb34kr5rs7duA==
X-Received: by 2002:a1c:1946:: with SMTP id 67mr4453257wmz.15.1605620925281;
 Tue, 17 Nov 2020 05:48:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d8sm3578630wmb.11.2020.11.17.05.48.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 05:48:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] hw/misc/tmp105: reset the T_low and T_High registers
Date: Tue, 17 Nov 2020 13:48:33 +0000
Message-Id: <20201117134834.31731-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117134834.31731-1-peter.maydell@linaro.org>
References: <20201117134834.31731-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The TMP105 datasheet (https://www.ti.com/lit/gpn/tmp105) says that the
power-up reset values for the T_low and T_high registers are 80 degrees C
and 75 degrees C, which are 0x500 and 0x4B0 hex according to table 5.  These
values are then shifted right by four bits to give the register reset
values, since both registers store the 12 bits of temperature data in bits
[15..4] of a 16 bit register.

We were resetting these registers to zero, which is problematic for Linux
guests which enable the alert interrupt and then immediately take an
unexpected overtemperature alert because the current temperature is above
freezing...

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-id: 20201110150023.25533-2-peter.maydell@linaro.org
---
 hw/misc/tmp105.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index b47120492ab..0a4aad4854e 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -225,6 +225,9 @@ static void tmp105_reset(I2CSlave *i2c)
     s->faults = tmp105_faultq[(s->config >> 3) & 3];
     s->alarm = 0;
 
+    s->limit[0] = 0x4b00; /* T_LOW, 75 degrees C */
+    s->limit[1] = 0x5000; /* T_HIGH, 80 degrees C */
+
     tmp105_interrupt_update(s);
 }
 
-- 
2.20.1


