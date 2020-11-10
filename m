Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3792AD9AD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:07:03 +0100 (CET)
Received: from localhost ([::1]:60556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVEc-0006fz-4U
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8Y-0002TV-FY
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:46 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8J-0007Lv-1Y
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:45 -0500
Received: by mail-wr1-x442.google.com with SMTP id r17so9063850wrw.1
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PzT+Q/TmIovSxDPhfcAm2zUohAaZWdsY+cDjFWvAtVo=;
 b=Y02zd7xt7BlRlU2cvgzFE0RD+ubHQQKG9RKwOM8q6Z5ijD2gyJWS1TPn2xCZfTI74Q
 qkeRhMXWi3zd14/gCwRzQw9xPpd+Xtn8sh//lI211F0oAmTZr1tRNwFCLEtYji2psCMD
 Gtw0Se0itM7va9NaSq3HJpLlK64u5tMo0ZmKes0061uRiCwkyN9T14ACmA6YaMpKiJ3O
 eoDgvumZipby6SQBu4aJULjQtsZQtEYnbI2zyXcO6dVFUXD0aKzuIzmHT5tepvZUT+EF
 JT3VRKmInS3fhQPJNHhgX7V60IzLUED/DW4PcY3NUTDKkgNfVC4i2kWq/2D+/U4AwyFO
 N/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PzT+Q/TmIovSxDPhfcAm2zUohAaZWdsY+cDjFWvAtVo=;
 b=kB2CFa7FIo1/wKnD9fDktVChWa/BPZwhD/qr/3gv6fyk2lF1NRmGmLxQuIKrKTyf32
 EC8Tla29oV7VlTuyaKXSV7Zd5WwwPS7wsHHmkzsLC9v0hLV9PE/geUz+zB735NvAAK3M
 OU+OlG32DOgfQqAfdWJ8dt77iWc/hu7GwxOfg3Ag+7uuLqbq+lDRBYWCzSWVkZhZC7Lw
 Fh7Smt/qhENVl6Rli7Vq90DUCKke5FILWre7RHXRVwORwKTsnJ1sj4BMmAeRkO5o9o50
 AckbVAvh5rhB8TzNekn29eIVETZwZ+QrKaXbK0WrYm2essvyiXJAmBd+C02B/Ivsr6kE
 uoTw==
X-Gm-Message-State: AOAM531+NWORoxBgxJtxSxBT95c+RgvIQqd1xJVEzjaHsbPve1rrfWik
 UW/1tfk4NsYyVh7ncESfDRWdK9xY5ymOCA==
X-Google-Smtp-Source: ABdhPJxQn34kVqIJnrQGtdLHSZ0jxx17Ztq1n1fIlPxOZWWDKk/KiilkvRRcQKbCtkYhkB7AkcpUzQ==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr9733422wrq.210.1605020427547; 
 Tue, 10 Nov 2020 07:00:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm3392493wma.25.2020.11.10.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:00:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/misc/tmp105: reset the T_low and T_High registers
Date: Tue, 10 Nov 2020 15:00:22 +0000
Message-Id: <20201110150023.25533-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110150023.25533-1-peter.maydell@linaro.org>
References: <20201110150023.25533-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 hw/misc/tmp105.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index b47120492a..0a4aad4854 100644
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


