Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576E32E118D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 03:03:20 +0100 (CET)
Received: from localhost ([::1]:43868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krtUk-0003cQ-VZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 21:03:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krtSB-00023k-T3; Tue, 22 Dec 2020 21:00:40 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krtSA-0001rM-AZ; Tue, 22 Dec 2020 21:00:39 -0500
Received: by mail-pj1-x102b.google.com with SMTP id hk16so2348419pjb.4;
 Tue, 22 Dec 2020 18:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWWMqVlmwa07mIsaiCK70dv8vovsZgJaw8dzTFzR7Fc=;
 b=I95uq952hpx/GvLS7pn5RI7qIOVQiQg7X061UCYkNeM5FdOIu4FeWIjt30YgPToeEV
 mRGzvPSZVatR67M1DQErqvqjHZLKqEKuSgKceANr2zVCGPxsN8K6GTmSxeTO8sxNv+Qq
 MYrhRnJq3AJTNsGNP6Jny0ArjAsgxHljX0n52NB4nC1pfGIeDxptXn96guR85fZDsTsy
 foP/pzAdt4FrjXVyBTkjezXiGIqRbZ1zOrgskF559qN9r/nmQ0rsi8OYpw1I6K3GbQhC
 dT6ljbgC1loCR4frN5g1LX8n3xYGIvLHNeD3tik2YgqIMOWB0vItCzqC4oQZSg2+Zb7I
 Jr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SWWMqVlmwa07mIsaiCK70dv8vovsZgJaw8dzTFzR7Fc=;
 b=QAFtyfMmDy/cYyquZVFPofyA1FBgk4aohqxXS8rE715U83PCIcWfpoIv0mkVkmwSEY
 6G+vc+t3WVW/H6Rxxgy6iXeeU7HAQZ5jSQFmmugnL4ldgqq/YA/Xlj/oEsQrO0Gca0rR
 FJ+gGkKAKrbuLG5rXxzRLlqRN+eKF4Z79x9FPF0DGLGd1VbcDcRC9vMGpStuXbLbRdpE
 5JCUPWCQY122yDpeXGRsHu7/C4lT8KZLdtYBVe8sj94kILiTlWQp8NcAzsNbWhI5+RFH
 hPDelKA9EMLxNvlcetxR9xHuXQWwP7Tnue79l06nkF47G2r9nok/QKfV3OlWdWXPGfY4
 WirA==
X-Gm-Message-State: AOAM531jXITaZ58FlRiKl6E4TyARQsQOxxhQnTo8fM0FNk4mRL/BdcWu
 RHigzcCSp4xjRhWU4nXl7qc=
X-Google-Smtp-Source: ABdhPJzyQMt11GTkTOO9WepzJ8EtKdBFILprQWtqJmK/Gco+a+Oqe/aENmQTO9xxEX4+jok9p8B/Zw==
X-Received: by 2002:a17:902:d202:b029:da:d86b:78be with SMTP id
 t2-20020a170902d202b02900dad86b78bemr4784489ply.0.1608688835892; 
 Tue, 22 Dec 2020 18:00:35 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id w24sm21644011pfn.100.2020.12.22.18.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 18:00:35 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] hw/block: m25p80: Don't write to flash if write is
 disabled
Date: Wed, 23 Dec 2020 10:00:24 +0800
Message-Id: <1608688825-81519-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

When write is disabled, the write to flash should be avoided
in flash_write8().

Fixes: 82a2499011a7 ("m25p80: Initial implementation of SPI flash device")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

---

(no changes since v2)

Changes in v2:
- new patch: honor write enable flag in flash write

 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index c45afdd..29598b4 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -600,6 +600,7 @@ void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 
     if (!s->write_enable) {
         qemu_log_mask(LOG_GUEST_ERROR, "M25P80: write with write protect!\n");
+        return;
     }
 
     if ((prev ^ data) & data) {
-- 
2.7.4


