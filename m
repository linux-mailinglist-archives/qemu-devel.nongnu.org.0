Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCD1128F11
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 18:30:46 +0100 (CET)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ij541-0006AY-Ay
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 12:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43206)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hpoussin@reactos.org>) id 1ij52l-0005ce-PF
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 12:29:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hpoussin@reactos.org>) id 1ij52k-0006T4-HU
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 12:29:27 -0500
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:40934)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hpoussin@reactos.org>)
 id 1ij52j-0006BX-VB
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 12:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=USE0NpeN1sKP/l6q+modRrZFP5TfsnYOSX8h3DSkW8A=; b=PHK/1NrlrBOTDBA3Q4qGBMu+2V
 fN6TnwKrVAuoD9pcjv6VByrrCOjVEyxSFF5yULPaHViJ1QnlRryIpQCctp0YfDTwVeuKbzP+XROlf
 BaTmmO/P/hv92OqzBCfrC6dYvARNbiPL4zdW996hFSoOyvTjJlke/ic91gAyzbZa15nM=;
Received: from [2a01:e35:2e3e:3c40:3a59:f9ff:fedc:97e7]
 (helo=localhost.localdomain)
 by iserv.reactos.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1ij52e-0001Q3-VS; Sun, 22 Dec 2019 17:29:21 +0000
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Subject: [PATCH] dma/rc4030: correctly reset DMA translation table at reset
Date: Sun, 22 Dec 2019 18:29:13 +0100
Message-Id: <20191222172913.10419-1-hpoussin@reactos.org>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c17:5ae1::1
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a freeze at reboot, introduced in c627e7526a902dd5bb1907dbbd5cf961679dfa68

Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
 hw/dma/rc4030.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/rc4030.c b/hw/dma/rc4030.c
index c4cf8236f4..76302fe431 100644
--- a/hw/dma/rc4030.c
+++ b/hw/dma/rc4030.c
@@ -534,6 +534,7 @@ static void rc4030_reset(DeviceState *dev)
 
     memset(s->dma_regs, 0, sizeof(s->dma_regs));
 
+    s->dma_tl_base = s->dma_tl_limit = 0;
     s->remote_failed_address = s->memory_failed_address = 0;
     s->cache_maint = 0;
     s->cache_ptag = s->cache_ltag = 0;
-- 
2.19.2


