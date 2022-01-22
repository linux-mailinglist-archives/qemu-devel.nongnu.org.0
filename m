Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E6496D58
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:38:06 +0100 (CET)
Received: from localhost ([::1]:37078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLH3-0000uI-Kt
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4x-0005m4-Fv
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:36 -0500
Received: from [2a00:1450:4864:20::429] (port=41661
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4u-0007gt-LD
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:34 -0500
Received: by mail-wr1-x429.google.com with SMTP id v6so5901400wra.8
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHMZxZiFQJbI+EMs2+qLPMDXg/8YQrzz1SenT8sExVE=;
 b=xMa3V+Rmm47QybMRBrPrmrlxD2xIIicBVnqccGP5RwO1DZAizp/jDKC2KV2EClJDKl
 ZZpya2BAKYdVHJ67tj3TtGfHy2zusIS0IUeabrHwTMXLq4xABSqszuZYLEGf5WI6cpLm
 iANAw45AzUVhV5VyPe0SdhLUgrtyaMZdDLtSX9gJmP0Mrly5zp49yNNSFlpFTPgX6uXv
 ev04MYzUhXtppq4qh42G6Qcu4KpzzyuEMgFbhvZy5cOoOsZzx06aNckRK6xBgM9698g0
 J0s8KQa5zX/czx8NLtX6S0IIaBvs1ihzyRHSFf/AFbg1/R1h6g47YU8e/TLkSQS2nO8e
 T2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHMZxZiFQJbI+EMs2+qLPMDXg/8YQrzz1SenT8sExVE=;
 b=sCshvyBrGLzf9rUug4QoS/YPMCq+TC1L+uRxCUiwAbuCtecKFe2rlXZOOakVg+GFwu
 beUd9H3X4m8t18/riAnp+tr5pVSNrX33tobELvwua1vwv2Iz4JxAg1RsZHGq+9lUWTGr
 WsaohmiYrvxS+kotXF58d4LdGiCOSawSP/j1uEtHNTNZCN/l+CLwvwbmD6DdS4j0UsEU
 4VKVhf08NBXiJSP6hwoczXriQgXBCieZ78H786yQDQhypFOrtP0f0TO6nCYBHGBG8AvB
 hxUkKkeDsnBwWkGLqLK52CsLjXX2B4UjZUE4Imh3MW+ZToQ+om3HwkL2xruYkJeicOuv
 9tAQ==
X-Gm-Message-State: AOAM533577GGGRgYB2jw/UXl9tfRzfGZ09BzXPStq81Sh4CKEj6oCxxS
 0s4SdsU3YJq2BNbUrP1iyFccRQ==
X-Google-Smtp-Source: ABdhPJzB5qVOGymwJpQo/6zRMiZFGRAXIV/oIhAcVXasi3jFeRlxtHdG1O9tvPjvLzkVVAPLWTvpAQ==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr8139341wrv.174.1642875891175; 
 Sat, 22 Jan 2022 10:24:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into
 numeric order
Date: Sat, 22 Jan 2022 18:24:37 +0000
Message-Id: <20220122182444.724087-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The list of #defines for the ITS command packet numbers is neither
in alphabetical nor numeric order. Sort it into numeric order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 1eeb99035da..5394266aaf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -314,16 +314,16 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define CMD_MASK                  0xff
 
 /* ITS Commands */
-#define GITS_CMD_CLEAR            0x04
-#define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_INT              0x03
-#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_SYNC             0x05
 #define GITS_CMD_MAPD             0x08
-#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPC             0x09
 #define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_MAPI             0x0B
 #define GITS_CMD_INV              0x0C
 #define GITS_CMD_INVALL           0x0D
-#define GITS_CMD_SYNC             0x05
+#define GITS_CMD_DISCARD          0x0F
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
-- 
2.25.1


