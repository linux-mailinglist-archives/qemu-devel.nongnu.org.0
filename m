Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A72D2AAE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:25:36 +0100 (CET)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmc3j-0000Dv-D3
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1X-0007PG-3a
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:19 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kmc1U-0005kZ-HG
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:23:18 -0500
Received: by mail-pg1-x541.google.com with SMTP id e2so3711499pgi.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=to6ShyMD/JTjODg7z/1Gwq0vHVoP8KV9Bd13lbgI0kI=;
 b=QEEcvmzMwhQ6PTn5G18GJFU7NUQnR6OQSLHhhjTO/5OWyyiFlR78okdBibsa9x9aIY
 82ENCo8ZLwoiQjdpvslzBS6qmSd+h0MwLeFzBnU98pUDVIeHU2TnC2JOYCnSScfxCyGV
 7YpGacL03MrduGh8DLCGrk3ijRMkGlLyDOrFFytbAdkoPaLVGkOATWb42RpS9kp+/fpX
 MOnJuzHUDnQKyn9r+CFMv4/0QiKeadseBCpBSpwOJXB3ArdrGD1l69W8U55EAwPMNG97
 U6i7nz2Q06c0doJoz+PMH/5XAsREo6k65Z6QwcMRazcrEFGO+e0ScU5KHybJzjpsHK31
 rB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to6ShyMD/JTjODg7z/1Gwq0vHVoP8KV9Bd13lbgI0kI=;
 b=psRWUorDXzWDW/YvsBp2S2IZwDMZMqO+AxtVeUGSjqw2WzbIPxgkxpI1SSYTIZbBMA
 kHCbPOdWiqlyMHxvHp2zV6CUS8L/dfNKh71f6Ndsi50ICHj/QSjuM5N+fldHoH9Az8xa
 h+L5S8JuHuO156r6zi/DEaxq6T2hlX+HPeVcYuE+pMEQy6gteqj3pVkYC26JvVtBDhBp
 ZySLps91ei9hMvsJZgt0zVtgMbdAD30szmBfZOzXo5JRPgxi9FUxEAxG5a0x9iOK7cgx
 1W+4f4AcdZeQJnqgbz+rGzOqdZ88o3pYf3h6MBS/cSH2DM6RYfZZisoEoO4j3gLcCsle
 AHJQ==
X-Gm-Message-State: AOAM531FYNS6J5gC2HiW5HZSpYZXLLIqx+vlbUCxCDwhYGcvCEcv3PoP
 xUOYiSI9gTA0x70YO/LC6KG4gQ==
X-Google-Smtp-Source: ABdhPJyMhsD5T9OOpMTxiW0cWn1j3pxMsImj2r4QrI46n5XaZ4hxFXklRfEoGqkxRPEeTX17hFj+YA==
X-Received: by 2002:a62:5f81:0:b029:19a:89cb:41d8 with SMTP id
 t123-20020a625f810000b029019a89cb41d8mr20435996pfb.48.1607430193946; 
 Tue, 08 Dec 2020 04:23:13 -0800 (PST)
Received: from leonardo.ba.nuviainc.com
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b2sm3472377pff.79.2020.12.08.04.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 04:23:13 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/5] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Tue,  8 Dec 2020 12:23:02 +0000
Message-Id: <20201208122306.8933-2-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208122306.8933-1-leif@nuviainc.com>
References: <20201208122306.8933-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=leif@nuviainc.com; helo=mail-pg1-x541.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..6962ef05d6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1851,7 +1851,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1


