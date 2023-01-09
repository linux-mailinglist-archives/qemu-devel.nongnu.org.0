Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD16631B2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyyh-0006li-P1; Mon, 09 Jan 2023 15:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyY-0006l5-8Y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:34 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyW-0002tJ-Mp
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:34 -0500
Received: by mail-ed1-x536.google.com with SMTP id i15so14441563edf.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqrzbqkehjMiObCYabTBJTHd54TXr5OaZJNbLN173bg=;
 b=lrnQ9l6Gr/IM6zE6pepuTH6hf0iDgZpNYobVBDPHOa6ZfDaygOUA0gtYDRwfcb2Cog
 6mobI3UdkfjW+hSwVJXADobzbhpz1EkDR6CjUMWyK7QmCFqedE3JfG4Fg7P3MQQ8y8eG
 L4Vka0KzSKq518WHY2kPby9STh5NENhnAegdztKbq4iuPVYpvSkK1Z1hceqU8opyQIj5
 IUHvusTJbLw/Z+48wT8ZYg9aZJoGdak8RDNMREs5uEukXKKVWM9i2JNIeW2HpHSSHqTy
 Gm2nRuoy3K5Wn2AFs0qJv17U+mG04EXpVvPnC2xvezLjeJsZd46HhTF08hzfJe75MQZv
 w0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqrzbqkehjMiObCYabTBJTHd54TXr5OaZJNbLN173bg=;
 b=K7vudpFFdbxggJ2a3lGkX1tHU/6i+a7A2T1wx62APfUmjLMiPqm69UvgOuTAigZlt9
 vW0t80nb6wYJwwFOcmpKpH12NG7DMNHGjuAM71yos/zD8UBs5bxm8h79zA/aJB4ZwU6v
 SyTOrPYxNKrHyMfG7ml8C9yY6rfbPLR+paZXDQR1QJ3EJGpR/GJeOQ+6GDfRXLguxAPq
 sSjMx+rw+J6A8JPlBDiFLD4YYboQby7p0Remb95Epgjd2uL9H+yuxS6N1jxtEaWgCaUB
 n41ZY8g8YhQEthNfEcZUJA6be8Gdd1XecPVGsWdF27u+78jcPiP50WDYeggdgAdCFSNS
 I39Q==
X-Gm-Message-State: AFqh2krnODwN2qFpPS+xyz6MEEMU0V4PAYwBV6UAuoXO1EyGCFxspjzC
 Xt8dUlCC034OOs7GY8JxlPqNTP7Lqms=
X-Google-Smtp-Source: AMrXdXumdyg/IO2pxa8g2xgkr6gYMN/TMEb5vI7d1bzraIq4XF6M3trWiB755mzf+4sJmMx7f1FPCg==
X-Received: by 2002:aa7:d984:0:b0:496:9d0f:3081 with SMTP id
 u4-20020aa7d984000000b004969d0f3081mr10838973eds.3.1673296950736; 
 Mon, 09 Jan 2023 12:42:30 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ca20-20020aa7cd74000000b0046267f8150csm4078018edb.19.2023.01.09.12.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:42:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/4] hw/isa/Kconfig: Add missing PARALLEL dependency to
 ISA_SUPERIO
Date: Mon,  9 Jan 2023 21:41:21 +0100
Message-Id: <20230109204124.102592-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109204124.102592-1-shentey@gmail.com>
References: <20230109204124.102592-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

isa-superio.c, managed by ISA_SUPERIO, instantiates TYPE_ISA_PARALLEL,
managed by PARALLEL.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 040a18c070..58137f2702 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -16,6 +16,7 @@ config I82378
 config ISA_SUPERIO
     bool
     select ISA_BUS
+    select PARALLEL
     select PCKBD
     select FDC_ISA
 
-- 
2.39.0


