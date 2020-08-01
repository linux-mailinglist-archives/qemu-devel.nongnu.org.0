Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C706923539C
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Aug 2020 19:03:55 +0200 (CEST)
Received: from localhost ([::1]:36532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1uvK-0006Cz-1p
	for lists+qemu-devel@lfdr.de; Sat, 01 Aug 2020 13:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1uqH-0005YH-W4
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 12:58:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1uqG-0006IO-Cx
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 12:58:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4BF9D4000B;
 Sat,  1 Aug 2020 19:58:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with SMTP id 72562C3;
 Sat,  1 Aug 2020 19:58:38 +0300 (MSK)
Received: (nullmailer pid 8679 invoked by uid 1000);
 Sat, 01 Aug 2020 16:58:37 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH] seabios-hppa: add -fno-ipa-sra to the compiler flags
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Date: Sat, 01 Aug 2020 19:58:37 +0300
Message-Id: <1596301117.149722.8678.nullmailer@msgid.tls.msk.ru>
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/01 12:47:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Date: Wed, 22 Jul 2020 22:15:46 +0300

This allows seabios-hppa to build with gcc-10. Or else the
compiler generates eg memset.isra.0 symbols instead of memset,
and the final link step fails due to missing memset.

Previous versions of gcc, for quite some time already, recognizes
this option but it does nothing since apparently no-ipa-sra is the
default. So there's no harm in adding it unconditionally, it seems.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

---
Sending this as a proper patch with proper S-o-b, just in case.

diff --git a/Makefile.parisc b/Makefile.parisc
index c0d5d958..1b7757e8 100644
--- a/Makefile.parisc
+++ b/Makefile.parisc
@@ -75,3 +75,3 @@ COMMONCFLAGS := -I$(OUT) -Isrc -Ivgasrc -Os -MD -g \
     -fdata-sections -fno-common -fno-merge-constants -mdisable-fpregs \
-    -fno-builtin-printf
+    -fno-builtin-printf -fno-ipa-sra
 COMMONCFLAGS += $(call cc-option,$(CC),-nopie,)

