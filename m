Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886248B416
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:34:26 +0100 (CET)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7L2O-000887-VH
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfi-0005Au-M4
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:11:01 -0500
Received: from [2a00:1450:4864:20::32c] (port=41489
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Kfe-0007I5-6Z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:10:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13664wme.0
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JYYFGFnkCFT6+fa4EaAq6TzfkXiIkABdM4xMZSz4G4w=;
 b=yDCdAjWsHofW7aXSfx2hOBhoDBo6vW8AltwWXoe+9zEI6gepGK5xZBVbP/XK58hGMv
 26YrTLZQsxGGFjYLFEdRpbZQg68p3rlxI2N9DHRGY9VQ/aCaWQfyKVhv2WdMB7VfSrpy
 MMnJQB2C3W71ALNxT8Jrf5G23hxVs7ecR1vRXn7Oe5lQUVdqGs4cAg9gnZwsONpAUCoD
 05Y0Cm2jkGnes1R3hiDNrzgxPJ+NxIBG4RTEbjsTeMpOMD9lvbKALalnkPaWwdEVXBOJ
 wagTEmRMOnvxmxcDqfxOaQBp9zUav5t0r8xxwhLgLHAWGL6onivzWn+oL/hJaPOr+Ja4
 V4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JYYFGFnkCFT6+fa4EaAq6TzfkXiIkABdM4xMZSz4G4w=;
 b=0PeIjbIWKviIG8jxDosqvqxI1bK215zFcPVOOSzirivLEOWCIzvnH01/Zn9XPhBpxL
 SW/gT/hmc5mAuCis2rOovDfYhNDZuCIssq2+SP4WiaWkOGFxTzrD66tELJyJ+7x12sD7
 /z6po8UQDF0Gaq0lo1duHnHYXfudn4kc4kL21M8yEy3FV0y0bUTMzUpSrKPB4nPwZEjh
 TpqEdJYeU5y/Unb3wsdrin6lminYZ1BWGkG4ts/jm5eQU43UqocdX5uJ1i1PDmFle+9k
 21SUeDp/90CUIm6xjQPOgxRDYkJTyTJV9vHZUAws1rsu31XWUeo/Kk1TxgHmGZWkHKsQ
 baWQ==
X-Gm-Message-State: AOAM533KwzkHEUKk2K7BOhRfEswfxkxJB7u+qBip4nhHQR8nFe3fiEsW
 MOfGbn+S8QEnhicfyEJnxm9baQ==
X-Google-Smtp-Source: ABdhPJyx94xPengilqitMoTf/ROuezr2toRSHBVsJwv/GjhkudQF5+eH5bO/yMRooWQPpMPj7gWkbQ==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr3389055wmc.114.1641921052948; 
 Tue, 11 Jan 2022 09:10:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:10:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Date: Tue, 11 Jan 2022 17:10:38 +0000
Message-Id: <20220111171048.3545974-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

process_its_cmd() returns a bool, like all the other process_ functions.
However we were putting its return value into 'res', not 'result',
which meant we would ignore it when deciding whether to continue
or stall the command queue. Fix the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5919b1a3b7f..a6c2299a091 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -678,10 +678,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
-            res = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            res = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
-- 
2.25.1


