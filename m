Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E004D8EE8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 22:37:05 +0100 (CET)
Received: from localhost ([::1]:48696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTsNE-0005Di-Lv
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 17:37:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nTsKc-0000aI-B7
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:34:22 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:44216
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nTsKa-0006Gj-Ge
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 17:34:22 -0400
Received: (nullmailer pid 2516 invoked by uid 1000);
 Mon, 14 Mar 2022 21:34:10 -0000
From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] qemu-binfmt-conf.sh: Extend magic to distinguish mips
 o32 and n32 ABI
Date: Mon, 14 Mar 2022 22:33:55 +0100
Message-Id: <20220314213355.2477-3-dilfridge@gentoo.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314213355.2477-1-dilfridge@gentoo.org>
References: <20220305000624.1498181-1-dilfridge@gentoo.org>
 <20220314213355.2477-1-dilfridge@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=140.211.166.183;
 envelope-from=huettel@www.akhuettel.de; helo=smtp.gentoo.org
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 philippe.mathieu.daude@gmail.com, laurent@vivier.eu,
 =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This information is given by the EF_MIPS_ABI2 (0x20) bit in the
e_flags field of the ELF header (a 4-byte value at offset 0x24 for
the here applicable ELFCLASS32).

See-also: https://www.mail-archive.com/qemu-devel@nongnu.org/msg732572.html
Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
---
 scripts/qemu-binfmt-conf.sh | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
index fc2f856800..5f44346166 100755
--- a/scripts/qemu-binfmt-conf.sh
+++ b/scripts/qemu-binfmt-conf.sh
@@ -60,20 +60,20 @@ m68k_family=m68k
 
 # FIXME: We could use the other endianness on a MIPS host.
 
-mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
+mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
+mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
 mips_family=mips
 
-mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
-mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
+mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
 mipsel_family=mips
 
-mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
+mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
+mipsn32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20'
 mipsn32_family=mips
 
-mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
-mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
+mipsn32el_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
+mipsn32el_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff\xff\xff\xff\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00'
 mipsn32el_family=mips
 
 mips64_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
-- 
2.34.1


