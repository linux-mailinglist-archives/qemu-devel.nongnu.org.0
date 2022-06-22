Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907155545A3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:14:01 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3yJ6-0002I2-NP
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3y0U-0006nf-7P; Wed, 22 Jun 2022 06:54:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3y0S-0005XC-Pg; Wed, 22 Jun 2022 06:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CUqoJupH2M+KQg+RIoBU+fI0+vwRBIrvqmU7RnFHdLs=; b=m2WUjgBPNHFVSd3Y3caxcjILlS
 1lbJyVcF5knAFvmwuFp1cCJBljceI+7kbBUFu0xGRU0mDqeb6urlJ4wVsmjUlZJ4IRCCr7ausf+nP
 2Cf2UJ9PvLZu3ZvCLqovbObprBLt77z1ae39hrmC1VKy/U+y+TjR8BubaZ66a5WoQ3GbVIyL5Tknn
 S/Y1+U50LYN5jVvdZjw53W5rvpnyWzhUyrMSiWJK47u7wLdHoUsZ6sXUmRr8sdrEvGSwyokh7K97b
 Lgd7pBTI1K31FW/0dZHnrQ1j8ZWFsh8pkMw0Cww5ffNMekk7z8JtTCQ8PD+UV9Px6pE7Gl4RQsLlj
 Q0uvvdo89pXTZKmqgAm9MiDtkoAK8TbgKhWy6/1VmGsx7SMWH/cDxhUlYAbh89XW+N9hmHQVpX1KR
 Uj2ZM5rjso282O/dwg7pPo0IFzaI7wsHk2cuFn9dqoHntSFhgtDTTeEf+uWIrgf38+4KdG6zbf41P
 beRIRK4gjHYXQPfQZC7ZFqLrDQfHYKnNuEcQwqMTafT5bq1J74+zJ67lp23va7HFeE+AWlCsyDSbz
 pUXL9gv7NHQ6/gXBeZKSJmz4hbsb90GOnKu4e/jFuktRXZHh5X7PPAoasCiYs8YLo8N3BlbsIksdo
 0veKKuSNZEJSrbd/0wq+PSxQa08VtpUAYkLujEMGY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyt-000CTX-VR; Wed, 22 Jun 2022 11:53:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:14 +0100
Message-Id: <20220622105314.802852-15-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 14/14] q800: add default vendor and product information for
 scsi-cd devices
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

The MacOS CDROM driver uses a SCSI INQUIRY command to check that any SCSI CDROMs
detected match a whitelist of vendors and products before adding them to the
list of available devices.

Add known-good default vendor and product information using the existing
compat_prop mechanism so the user doesn't have to use long command lines to set
the qdev properties manually.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index dccf192e55..101ab0f803 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -695,6 +695,9 @@ static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
     { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
     { "scsi-cd", "quirk_mode_page_truncated", "on"},
+    { "scsi-cd", "vendor", "MATSHITA" },
+    { "scsi-cd", "product", "CD-ROM CR-8005" },
+    { "scsi-cd", "ver", "1.0k" },
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.30.2


