Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14933370C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:12:41 +0100 (CET)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJtxQ-0001K0-GK
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:12:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuQ-0005F7-62
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:09:34 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49974
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuO-0008VA-Lx
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 03:09:33 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lJtuK-0006rB-Aw; Wed, 10 Mar 2021 08:09:33 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 10 Mar 2021 08:09:04 +0000
Message-Id: <20210310080908.11861-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 3/7] mac_via: allow long accesses to VIA registers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MacOS SCSI driver uses a long access to read the VIA registers rather than
just a single byte during the message out phase.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/misc/mac_via.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
index 0f6586e102..f38d6e2f6e 100644
--- a/hw/misc/mac_via.c
+++ b/hw/misc/mac_via.c
@@ -966,7 +966,7 @@ static const MemoryRegionOps mos6522_q800_via1_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
@@ -995,7 +995,7 @@ static const MemoryRegionOps mos6522_q800_via2_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
-        .max_access_size = 1,
+        .max_access_size = 4,
     },
 };
 
-- 
2.20.1


