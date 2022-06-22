Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A0554598
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 13:04:30 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y9t-0002na-Ut
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 07:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzx-00053q-Ts; Wed, 22 Jun 2022 06:54:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzw-0005Uk-Bh; Wed, 22 Jun 2022 06:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dVqkXbp44Eb4+DEf6/nTZk4/xN5DSBvf6xpw5GXo2Nw=; b=JO9/0GrghJXyrYmVv2GombnnLZ
 URiozmteGTpV/hkMiU4TyqMpIfms25XFuwyXS2czE6G5972HV/H1HwM89m3acrBTMtU4u7ATGCrKu
 FJSBU943cofP4YWAVH2hP7NnWun7tXpX4nHFFFKB8q0Ul9mOvRfZPEOlUUv9tQc6PQbj0p3tx+J2q
 1DCtkt4bTVSzgF6sezGgoKJU4QQ2y8THMEtFNwLVyMHGDyP5V47Ql5LbgzoXONsnk1St2yH11otJj
 C90czqjRUeO4EtyuNBk1YLd5d6iXUzwvqzClpcVG6tT+WVhos4oWXldVhoAVtB9JV4I4ZkuTevuld
 LDj/JbZ6UNRxZWR3Q3KKSSNvtbPYmGZGNtLnTcyf6rWmbEcDUcJajLU9/hVaPz+RPgXB803HBGMzf
 3lpc6qe6I8yne8Us3znIw35uu31yABRcR+sVQY1WQ204th0rnfihbdGZvyR2pIOKXCIvyVs1tyxdy
 P0TAQ3OFKKeu3ibz2ieMWRvqffMDSAJmXYj9C/hpGDNCI7lbPKRW5icn4cn6RbOBtt/3+PX6XrwnE
 4F5kYOtxgUHQ+bDIrza+Skdj3tUtOpWaQu3GOPAIBsuQ01sgh9JyhSREYHfwbziTN/np4jm/d1lW9
 NngOlXDjRytGG3p+La23D8wDQh/g6JBxoracG8KU0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyk-000CTX-Nh; Wed, 22 Jun 2022 11:52:59 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:10 +0100
Message-Id: <20220622105314.802852-11-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 10/14] q800: implement compat_props to enable
 quirk_mode_page_truncated for scsi-cd devices
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

By default quirk_mode_page_truncated should be enabled for all scsi-cd devices
connected to the q800 machine to allow A/UX to enumerate SCSI CDROM devices
without hanging.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b774a5b20a..3254ffb5c4 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -691,6 +691,7 @@ static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
     { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
+    { "scsi-cd", "quirk_mode_page_truncated", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.30.2


