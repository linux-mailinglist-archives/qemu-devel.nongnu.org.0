Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F155456D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:55:38 +0200 (CEST)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y1J-0006Qh-Jg
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzU-0003Xv-Jg; Wed, 22 Jun 2022 06:53:45 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzS-0005R5-TO; Wed, 22 Jun 2022 06:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBW7Pn4aogUXe0Mh+FwaA6VfGnoQ/OTbXuLlU+sKvQM=; b=I+2ttPpEAa2i0xc6qhUOq8hzch
 9yos4Yoz7/vbmludZB8Ke8ArXIu0hvHZMBJo4VtnH0cwtl7EVQeNZVEq25kIp+tL6WLDepiKVxHVp
 5PdM8b+IHuuDMgU7/ja8I8j+N1kGtUYe7YNtt24As0DOLD5n1kLw2P0ICkLmeU9Bh4R0PZkEocEMM
 qq7CC0aESSuN272iDM7sE6v96IRX2f/GuBdMnO4/FuJSGAl2MOCpbtCCHAr4FZqXt4/ZJIrrVQ71i
 2eiot2Z/61nGUa0ldHgpbc1U22y2Pg9L7CArmCEolHK2nCcZUj5ZUsJPTpGFz6vSD/z5OzEb3Ib6/
 XRiDASqgKUWg/3uXd5UownDMiVn1NBhGZjZqsAQHsX0Ttaw1qx1NvfN5N4+rs0trVWBnmreyuTWCC
 tdrvHCDRoxtEQ9gkrQf59Cz5tECKndWQ1nWD5M38BqsB2sIusWI6xxvvv36EWzcHiwV2ddQUk/nHE
 Go882czxnfwzKS4Wu2psp1ErLuTO8tgigJu/7No6svhQ1TH0nE/3WOLipT5tKuqFDSoiTJWpmJ67+
 l8X3ugF6eisHb0VvmNHhKTH9EwZBgwDYgHmaT2I88Nq8IogjJ7bdYCChmnM7Yl8Oq/Vub3VMUud/7
 HW5U6Pxti3R4pI6q/ZoZXMQB9DPApMUCt85v8/iyk=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyD-000CTX-0I; Wed, 22 Jun 2022 11:52:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:01 +0100
Message-Id: <20220622105314.802852-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 01/14] scsi-disk: add new quirks bitmap to SCSIDiskState
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

Since the MacOS SCSI implementation is quite old (and Apple added some firmware
customisations to their drives for m68k Macs) there is need to add a mechanism
to correctly handle Apple-specific quirks.

Add a new quirks bitmap to SCSIDiskState that can be used to enable these
features as required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 072686ed58..8c28dd8566 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -94,6 +94,7 @@ struct SCSIDiskState {
     uint16_t port_index;
     uint64_t max_unmap_size;
     uint64_t max_io_size;
+    uint32_t quirks;
     QEMUBH *bh;
     char *version;
     char *serial;
-- 
2.30.2


