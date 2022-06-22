Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BF2554575
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:10 +0200 (CEST)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3y4i-0004NQ-7V
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzY-0003ZN-Ip; Wed, 22 Jun 2022 06:53:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xzX-0005Ri-79; Wed, 22 Jun 2022 06:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mKmsDgbA3n34jb7Qo8bj3PSUQhXK5nQ7TWNJ8rMuoo8=; b=S85nOwackOuiYupVPK1cHfpyFT
 kdYdXnT+0BkONsH9v50G7kdqOzImaEzE9y+/jcvvKdNkwrnY35r4L4QKZW2IOTMo5m1+6GYEgVO5n
 8lDVyxznUwpnCT/qrMYJgiOtDCJiubx15jzmsLJC+puCsPVjvFvah91ABI74I/sscfYN+68vWF9FS
 bjq5z+/sIRyahaDWHi3UvMvcFQOlqyR4AfiePGo0uY0golUXX+KxfpllxJ39Qea6s+9KIxrPXB1IE
 1FgACC0BLxAt6sIS6IamKxd+4ruhFvbCVwPkr5iYOG6a6yib7NjZ7xXJOoQd/5TruBlqEc15z9/bw
 EOi1mMjeyamLonZw8vdDLWFEhQ9UFDD4RIN4gaVszO/tyfAfpRtHx1nJ2VmV6pfsIgWJF+nhsgVDP
 fwbLj9E8as2O5Eg+uMDNzKv7gSHbpXohB2Ovfvs5SkKj884yU8C9o8N9+dW9U3oJYA7TFBB3RpOFM
 hYOZ0DodaVp2CNdQFVzQ9GiGf73FpkK4qyb32xOOhYzXgxRv3yFYjppvFDKMmpqW6pMhBSHDEux4x
 1rnkbq4QxhX3Vsfr6YMvqRk13QhWTjWYEzG6neg7vJMNUr0VDuh1CjOP1DDlZfY1D/ZG308BP6K5R
 QXwJen4SmWu/OwNnCTL3qjO+wQUf8zbv43/h8bCho=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o3xyL-000CTX-Fu; Wed, 22 Jun 2022 11:52:33 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Date: Wed, 22 Jun 2022 11:53:03 +0100
Message-Id: <20220622105314.802852-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
References: <20220622105314.802852-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 03/14] q800: implement compat_props to enable
 quirk_mode_page_apple_vendor for scsi-cd devices
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

By default quirk_mode_page_apple_vendor should be enabled for all scsi-cd devices
connected to the q800 machine to enable MacOS to detect and use them.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/m68k/q800.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 099a758c6f..6fabd35529 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -686,6 +686,11 @@ static void q800_init(MachineState *machine)
     }
 }
 
+static GlobalProperty hw_compat_q800[] = {
+    { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
+};
+static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
+
 static void q800_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -695,6 +700,7 @@ static void q800_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 1;
     mc->block_default_type = IF_SCSI;
     mc->default_ram_id = "m68k_mac.ram";
+    compat_props_add(mc->compat_props, hw_compat_q800, hw_compat_q800_len);
 }
 
 static const TypeInfo q800_machine_typeinfo = {
-- 
2.30.2


