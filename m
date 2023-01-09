Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B06631B5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:43:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyyj-0006mc-U7; Mon, 09 Jan 2023 15:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyya-0006lm-TL
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:37 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pEyyY-0002u3-Sl
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:42:36 -0500
Received: by mail-ed1-x536.google.com with SMTP id x10so11519119edd.10
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5yAJo9cGPp1zqG3klMq3hhG+PJdL4i7lidfguILtK8M=;
 b=UbzVGI0cwb2qlyiLeSMNrH4TsZCo9oqUNCH7ctwXwUJ+uu3D2PM7LRQRPbF561BWGs
 yNXVrAeXr0cyUsXYGRpARut4Wmmasq1oU63rRwrqTKTtx0Qq2Z15b6PGd9KjKkHp0w9a
 /+wudPw+sRQkTIg8Lz/DhlJSzqMUp4BRiafuUDNH4qyQ4IXhuDZbIvHSD6RpHpPLTwmC
 aAo5m4Y26EVsiJb02zqAluNnRvPN4lj91dKY7iegTfT7iLjaP8ibMpGWsT/SmGQSLEnm
 aGhf47Q1m/qYpPickRlWJsHr7vlV2yg9uHgQV2Zj1TR7UtlvqohjEu8YuMoI8KZIM1np
 y9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5yAJo9cGPp1zqG3klMq3hhG+PJdL4i7lidfguILtK8M=;
 b=zSgbwQ6xFdK83RJqPjK6YzgkTDjHDXjf2IitLvekng5yTm1mgpTyptA8nTEwQsfBHP
 aWefgIY+ty7z/3q0l9jY+v5/dOiTcGgjt7DucbTUkdmsHTMROuYLazM+98pqEajv7PRu
 wIvdxQT2l9Ra6bb7u2f8s79trLHCzKAQHmWPMV5bxkwZERNpL8MfdrCD7I+mBAOIjPyD
 /TNhNwlH+0anGhgba6uAwLIDeLdaAAj121WgW/1rNn8pVuchmB/Bdb1psgf+lQsqx5Pq
 NM7tbCKD0Y8OSRvy9xmcd81RMRlCKKuy303+Yr4oOpkDpCbl6jKp5mHL14Gzl7HD2hR2
 3hGA==
X-Gm-Message-State: AFqh2krGyWESsV7jBqM0tQ6EWi8bN0msRlyUYWouBa1JkXTKs/vWrdpC
 dkz1/1ILC0v/AjADvCI8K4XusUx0ECM=
X-Google-Smtp-Source: AMrXdXs4nd0KHyx2SwT+0wbTjkc3wIl6t9a+xyFpvt41CRimniQS+fLBDAaoQzzhSAVtb+ElLjcliA==
X-Received: by 2002:a05:6402:299b:b0:499:70a8:f91a with SMTP id
 eq27-20020a056402299b00b0049970a8f91amr5609249edb.19.1673296953286; 
 Mon, 09 Jan 2023 12:42:33 -0800 (PST)
Received: from localhost.localdomain (ip-185-104-138-30.ptr.icomera.net.
 [185.104.138.30]) by smtp.gmail.com with ESMTPSA id
 ca20-20020aa7cd74000000b0046267f8150csm4078018edb.19.2023.01.09.12.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:42:32 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/4] configs/devices/mips-softmmu/common: Remove redundant
 selections of SuperIO and ISA devices
Date: Mon,  9 Jan 2023 21:41:23 +0100
Message-Id: <20230109204124.102592-4-shentey@gmail.com>
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

These devices should now be selected by their respective boards or
parent devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 configs/devices/mips-softmmu/common.mak | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/configs/devices/mips-softmmu/common.mak b/configs/devices/mips-softmmu/common.mak
index 8ed6b62ae7..d1cfe16b81 100644
--- a/configs/devices/mips-softmmu/common.mak
+++ b/configs/devices/mips-softmmu/common.mak
@@ -11,17 +11,8 @@ CONFIG_VGA_MMIO=y
 CONFIG_VGA_CIRRUS=y
 CONFIG_VMWARE_VGA=y
 CONFIG_SERIAL=y
-CONFIG_SERIAL_ISA=y
-CONFIG_PARALLEL=y
-CONFIG_I8254=y
-CONFIG_PCSPK=y
-CONFIG_PCKBD=y
-CONFIG_FDC=y
-CONFIG_I8257=y
-CONFIG_IDE_ISA=y
 CONFIG_PFLASH_CFI01=y
 CONFIG_I8259=y
-CONFIG_MC146818RTC=y
 CONFIG_EMPTY_SLOT=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
-- 
2.39.0


