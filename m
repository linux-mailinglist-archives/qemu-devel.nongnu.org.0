Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0C572957
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:31:21 +0200 (CEST)
Received: from localhost ([::1]:60740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOPY-0004S4-7f
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqg-0004bg-WF; Tue, 12 Jul 2022 17:55:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqf-0007yn-LA; Tue, 12 Jul 2022 17:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0CoI6KZ6avna/eIj3WpIJ8W6RFVeKBzEJk7ld1BAT6k=; b=os4wykSMQGSNDaRE/+ytqrzqmu
 hssCc+WUTh0JWkuN2kgNhEEjqDJ16nIpNN8CtGJW5UB7YGWm1aMU7yKZV1pHdNa5svg1iv0maMHHA
 5GmgbdDrQwcA02feCLe8hilWUOqoucNxmuU2q/naqlHCHixDr3UfGrBzi/SOPqlNK/3qSG6b8qa/Q
 0ZhzBdsXtIJ6rbB42sb31rvy6Fwe7Dms8VF6aUQLmBMUqX3KZ2Ww9vVWgynYsFNJm1hAFUOkm0LuK
 VKXduqaaqEW1xh9vd0w5aIKUqYghP46rcEA5YhvA24rj3e/QkR6UqcgJwWROApXp3aKbLtcRPXf3v
 CdZd2CEbNJEtwS9ID9vwytKcQyZk4R21rvyE+ZWvU8B8wrReEuKKQW3Dk4xLfFH9kVIOqTr0F6IRg
 bRghOL2nFUDQ8E280g6N8UiCrUa5VBqBRanCB/ygnbP1CayiRlWFxEWC7fX/9lcQNrcIJ3iG4yVDI
 7jBF8+OREt73aXN1Hw9/TL2fJvmsdLCgWLKUnj/3jrf5JOXQBnVQ1TbiAj2nxaaiHMYALLgkCWx80
 7f74GlLN78WtuZg98zwUOXXxi9TWx60SFv/1M4Mwic0BTXQrNBgzINGaSlI8H555p86BJncnhzlhY
 iy6JMncygjG8E+kskye2WaPaIxoV0+EP9Ouj70Xlw=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNou-000Bqt-DT; Tue, 12 Jul 2022 22:53:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:42 +0100
Message-Id: <20220712215251.7944-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The LASI device (and so also the LASIPS2 device) are only used for the HPPA
B160L machine which is a big endian architecture.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 09d909c843..7bf6077b58 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
         .min_access_size = 1,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
-- 
2.30.2


