Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B4554576
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:15 +0200 (CEST)
Received: from localhost ([::1]:52120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y4o-0004gj-EI
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzh-00043t-Hk; Wed, 22 Jun 2022 06:53:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzf-0005SY-00; Wed, 22 Jun 2022 06:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UxuWZPsof1famT7rIcFgQmOzGApL9EiOptDoXpPK2Jk=; b=LREt9G55yxurSjUbgx2SMJtRqa
 RizSWtxBYuo3AapqyCU7TNZ4RY113EbxO/DBsvtJKb7R6XyOVwSP0VDWRQZx0OWEtT5FNQOFMo4Ac
 byZGrQLsjK8ixmcOnbFRXT6TMZAeuLQesL9UaUhd8fr46V7VLZEm5R96cNMSV6O1U6NaWkPcws4gT
 Z1GXZnCsNXGxwhqNvzuWSVJTzXl/msk94pNOlXRrJQUYpBhIsk3HfBhUaugRIrdkD5+qmN67gdKqg
 tBrSdmaeXv/jx4F1slzvoPB2MDtsYLeUkNxysy6oPGmT9m5bvzbwz7zzf/IsxiWEs+1mWlGjWpRAj
 K0ocVj5MsS4IJXdCBrcvKnLFrNi0VLS4nfgffjYh1rNcfwD1OmXI0DJNo0T6jWecjT83oUbSnSkJT
 E7BzbLDiyPZpCkd1boi8FTiXmdICY6XLDgsQeQc0VhneGHCCMXjipR9rCxy+ClTqmiXik9tGq1Gbp
 FBtG9u4xmhmYbbaRqKds8CKPCIPrEDPQMSSpSARfJIJj8k2rL/Vcx6+ZgOkRjIctWWFIEoiyCefMp
 V3nzFixbFy1v7JEPfgzPzv2zFOnARVGzRs9XrW+xq0reC8CS4wvQAQ6L3K7re9htQSLnKz0zOHqw2
 xIDQSZVCtp2c6KAPfeiRVZT/d6OL1OXW+sXs6ntd8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyQ-000CTX-2A; Wed, 22 Jun 2022 11:52:41 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:05 +0100
Message-Id: <20220622105314.802852-6-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 05/14] q800: implement compat_props to enable
 quirk_mode_sense_rom_use_dbd for scsi-cd devices
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

By default quirk_mode_sense_rom_use_dbd should be enabled for all scsi-cd devices
connected to the q800 machine to correctly report the CDROM block descriptor back
to A/UX.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/q800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 6fabd35529..4745f72c92 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -688,6 +688,7 @@ static void q800_init(MachineState *machine)
 
 static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
+    { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.30.2


