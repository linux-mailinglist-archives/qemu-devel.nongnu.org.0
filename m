Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F468A9A6
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 12:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOGfx-0000JE-Iz; Sat, 04 Feb 2023 06:25:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pOGfZ-0000GA-Vu; Sat, 04 Feb 2023 06:25:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pOGfX-0002cz-80; Sat, 04 Feb 2023 06:25:21 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0C0584001D;
 Sat,  4 Feb 2023 14:25:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 457349A;
 Sat,  4 Feb 2023 14:25:04 +0300 (MSK)
Received: (nullmailer pid 2558790 invoked by uid 1000);
 Sat, 04 Feb 2023 11:25:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH] configure: normalize riscv* cpu types too
Date: Sat,  4 Feb 2023 14:25:02 +0300
Message-Id: <20230204112502.2558739-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

For most CPU types out there, ./configure normalizes all
variations into base form plus, optionally, variations,
to find the proper arch-specific code.  In particular,
it's possible to use
   ./configure --cpu=$(uname -m)
and it will figure out the right base cpu family out of
that. But this does not work for riscv64 for example,
since there's no similar normalisation for that one.

For now, as far as I can see, there'no support for other
riscv "sizes" (like riscv32 which actually esists as
hardware). So for the time being, just normalize the
cpu name to be "riscv" for all riscv* variants, just
like it is done for arm and mips.  If/when support for
other riscv variants will be added, this might be
extended to distinguish them based on __LP64__ define
or __riscv_xlen==32/64/128.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 9e407ce2e3..1deb65c95f 100755
--- a/configure
+++ b/configure
@@ -578,6 +578,9 @@ case "$cpu" in
     cpu="ppc64"
     CPU_CFLAGS="-m64 -mlittle-endian" ;;
 
+  riscv*)
+    cpu="riscv" ;;
+
   s390)
     CPU_CFLAGS="-m31" ;;
   s390x)
-- 
2.30.2


