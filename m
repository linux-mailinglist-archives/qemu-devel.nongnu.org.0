Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B768FBAF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 00:55:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPuH1-0002Sw-VO; Wed, 08 Feb 2023 18:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3PjbkYwgKCmEVTG9NSRGFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGy-0002Rt-FN
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:54:45 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3PjbkYwgKCmEVTG9NSRGFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--wuhaotsh.bounces.google.com>)
 id 1pPuGw-0003UX-9G
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 18:54:43 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 q133-20020a25d98b000000b0089ab1a9f0fdso349057ybg.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 15:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=Prrb+UmJo0o9gbFleRCCDtP+rIh8YSy6uG2BxNvcKEoXncxY+nhpGLrK3o7E2wRuXK
 0RHMfmNcTLVOsJ+KlfoN2+bZMqBAt4TwYopKi/Jk1cqR+p3+qD+A2IQe/FuR61GHuxK+
 V9TIqjpq/F0WMzxHd3KsfGIVOYz/o5lQMAUJsz5MT99zwUEKcg0QQGs4lYiJR1vSimEu
 nRdTLpideJbs977ZUAPNevIj5bQs35wG2smAKrmwHXnY9DV726ux04Edt/8+gyiuit7u
 2Qo9DFq61dljrUYo0btpbsHW6xSOhN8zMAoa16HEj5SNEbdxm1dqYBsIEM7Q037nh6wi
 onBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nH4HQe+MV9tjbVXhRgWQajwGe2OH3uEMzVPFxvxzzdQ=;
 b=azZuP707QvnFWAtt5tb/d9XUgdt2xmW22KevLYxT1//ceCbOg1n+ZW79ZKPnCLKhi8
 gFYTwbwDH5LceecNP5uJ86hFrKYGVMlgCrSdz/fxf00xn4xJMhgtOIxoni95VDkhMXwd
 ODZBIOmHR3wL2M/vFTB/hR+JNnXU6fr8vCLwTfUlvt1tC9v3in52wE/R5+mTaMNksH3F
 qu/x4tzMxakBSaDHrGW3LW1AUZUCz/PMmI9aRTZgLWaWnsafoODCC2x+e5JLhBWYDazM
 82yLKqNPf/8nFDcxWFSOeqJ/t/EPK1TtoXBwHb55VHXwwBVnXB5Y3qPzT+EEWKbA+Ilv
 LvBQ==
X-Gm-Message-State: AO0yUKXrbdJSESeYK+TdtSIyzaoTQdnuRDG0YK6Pa21DvY11V6N3FUbm
 p1P6NL1FLcL9uqHUHMmajhHp9bvJe3JP2Q==
X-Google-Smtp-Source: AK7set9apTzbHzHkjAI1R0YFHTNLylh58ZhhXl5IdS6O2llE01O9jeDTnD0urLNoHr89I+WpFPilTUKoobvqCw==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a81:ee06:0:b0:526:859e:8b16 with SMTP id
 l6-20020a81ee06000000b00526859e8b16mr3ywm.8.1675900478836; Wed, 08 Feb 2023
 15:54:38 -0800 (PST)
Date: Wed,  8 Feb 2023 15:54:31 -0800
In-Reply-To: <20230208235433.3989937-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230208235433.3989937-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208235433.3989937-2-wuhaotsh@google.com>
Subject: [PATCH v3 1/3] MAINTAINERS: Add myself to maintainers and remove
 Havard
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, 
 Philippe Mathieu-Daude <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3PjbkYwgKCmEVTG9NSRGFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--wuhaotsh.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Havard is no longer working on the Nuvoton systems for a while
and won't be able to do any work on it in the future. So I'll
take over maintaining the Nuvoton system from him.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Havard Skinnemoen <hskinnemoen@google.com>
Reviewed-by: Philippe Mathieu-Daude <philmd@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa10ecaeb9..347936e41c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -799,8 +799,8 @@ F: include/hw/net/mv88w8618_eth.h
 F: docs/system/arm/musicpal.rst
 
 Nuvoton NPCM7xx
-M: Havard Skinnemoen <hskinnemoen@google.com>
 M: Tyrone Ting <kfting@nuvoton.com>
+M: Hao Wu <wuhaotsh@google.com>
 L: qemu-arm@nongnu.org
 S: Supported
 F: hw/*/npcm7xx*
-- 
2.39.1.519.gcb327c4b5f-goog


