Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA653DC7D9
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 21:06:29 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9uJY-0001e1-8h
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 15:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1m9uGX-0000I4-Pg; Sat, 31 Jul 2021 15:03:21 -0400
Received: from sender-of-o50.zoho.in ([103.117.158.50]:2482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vijai@behindbytes.com>)
 id 1m9uGV-00079w-NB; Sat, 31 Jul 2021 15:03:21 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1627758168; cv=none; d=zohomail.in; s=zohoarc; 
 b=eROeKW8SgdQFPaUS7PLI51KrbK+RLNa12/CEmA6i7uZTA5vn1heLyAsXoYhDzqBOCgXmT2B28XxBh59VHEz6vW1qZvSUef0FEC0Fr0IQv3Cm16nlmUuW3xYgGI3jTUhmQN5ugrCfZ/UcZlhEilgd0JUqGgQ5FyRYenPjwQfu4Ok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1627758168;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=VD+d8fiN+sGR7oPXi8cRbGFicRqO2m14LzyyaWdRngw=; 
 b=WA0qOhdF6UZuIjuG49IXEoYb+lcUSWmyRf1z1jxfWFyNkjWcQYZsKLv2qHWeUETSC653+Q8UmWYiZE1993Wc1rC7tRC2L7qUIJ/JVY/JXresDGFPxq8aVFn/21/YDjEuGJ8iYeXDm193Lvatoub35tPkcwDG8kOoYo30cHpvGW0=
ARC-Authentication-Results: i=1; mx.zohomail.in;
 dkim=pass  header.i=behindbytes.com;
 spf=pass  smtp.mailfrom=vijai@behindbytes.com;
 dmarc=pass header.from=<vijai@behindbytes.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627758168; 
 s=yrk; d=behindbytes.com; i=vijai@behindbytes.com;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 bh=VD+d8fiN+sGR7oPXi8cRbGFicRqO2m14LzyyaWdRngw=;
 b=tMX43K8B74OKM1NTBt7M+8fX0+6l9xck+RU0DZv/kMUqY9GGdYh5UdRonTWOoQ3v
 rndodr1wiIE4ConCj5nM+oaH5nTQgs/1VBXo4bUXhcMLHuE5du41cOlYroxMsPOai1+
 xkmA/mef7gEgh+zSzX95bJyZavizeg1MhZ0nkca8=
Received: from helium.Dlink (49.207.192.115 [49.207.192.115]) by mx.zoho.in
 with SMTPS id 1627758164913309.41328047484683;
 Sun, 1 Aug 2021 00:32:44 +0530 (IST)
From: Vijai Kumar K <vijai@behindbytes.com>
To: qemu-riscv@nongnu.org
Message-ID: <20210731190229.137483-1-vijai@behindbytes.com>
Subject: [PATCH] hw/char: Add config for shakti uart
Date: Sun,  1 Aug 2021 00:32:29 +0530
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Received-SPF: pass client-ip=103.117.158.50;
 envelope-from=vijai@behindbytes.com; helo=sender-of-o50.zoho.in
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vijai Kumar K <vijai@behindbytes.com>, alistair.francis@wdc.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use a dedicated UART config(CONFIG_SHAKTI_UART) to select
shakti uart.

Signed-off-by: Vijai Kumar K <vijai@behindbytes.com>
---
 hw/char/Kconfig     | 3 +++
 hw/char/meson.build | 2 +-
 hw/riscv/Kconfig    | 5 +----
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/char/Kconfig b/hw/char/Kconfig
index 2e4f620b13..6b6cf2fc1d 100644
--- a/hw/char/Kconfig
+++ b/hw/char/Kconfig
@@ -68,3 +68,6 @@ config SIFIVE_UART
=20
 config GOLDFISH_TTY
     bool
+
+config SHAKTI_UART
+    bool
diff --git a/hw/char/meson.build b/hw/char/meson.build
index 8361d0ab28..7b594f51b8 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SERIAL', if_true: files('ser=
ial.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_ISA', if_true: files('serial-isa.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI', if_true: files('serial-pci.c'))
 softmmu_ss.add(when: 'CONFIG_SERIAL_PCI_MULTI', if_true: files('serial-pci=
-multi.c'))
-softmmu_ss.add(when: 'CONFIG_SHAKTI', if_true: files('shakti_uart.c'))
+softmmu_ss.add(when: 'CONFIG_SHAKTI_UART', if_true: files('shakti_uart.c')=
)
 softmmu_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-consol=
e.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen_console.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_uartlite.c'))
diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 0590f443fd..ff75add6f3 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -22,13 +22,10 @@ config OPENTITAN
     select IBEX
     select UNIMP
=20
-config SHAKTI
-    bool
-
 config SHAKTI_C
     bool
     select UNIMP
-    select SHAKTI
+    select SHAKTI_UART
     select SIFIVE_CLINT
     select SIFIVE_PLIC
=20
--=20
2.25.1



