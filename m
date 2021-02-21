Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F4E320AF1
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:37:26 +0100 (CET)
Received: from localhost ([::1]:54338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDprR-0007Be-RZ
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:37:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpoq-0005db-KY
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpoo-0002Jq-Tw
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id n8so16288741wrm.10
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CfmWBlvH060L9/ARfTTbpqHH/Yspstc9lZifjtcI/8=;
 b=RE5SkasnriaNbBDz2pEhQ6YlMr9mlXRCVVsxq3ShcY254pa16DBqAg5M5at+sXf1B9
 9PlETr6qlb20k7mJDHS2uDbWRmuPmNgxoY04HMkwyjpZrVGepIa76F+APMGe9Na/SPdR
 A9zeD6wG7eEQAEX0TdzaFCxDrfcmiUhmmT8WbUVJmgUyT/sLOmuNml9R1r0UUco3xr5S
 hNRnTxpCkItFliRB4MiR5GVQo0MwOrX3otbzAXZmpuAHwppNuQUE+zauZ5FVE8Mtvb30
 gm+SlGAO+SGdkVRAllqdvGscO2SEknrtGDo1QJK8AxAG867Nl3hDVYlj5+a+WEYJkqIL
 hmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9CfmWBlvH060L9/ARfTTbpqHH/Yspstc9lZifjtcI/8=;
 b=HfYQJwWVn6RFTndcR5ZbVtT+gHmzRcx0SmJKPMt9lxa/3XCzLEeFZduvGPZep9t6v1
 pNYMfDrMoJjT/98s5pTY+a2rK9nngxIgS/uzn9ryFhjSWHvfpmfFaRgHm6WAbeHSBXXA
 j2OVhZrSSnErSyVF4Ge+svwJ6QceF31NtWEuiuIDFfge6GrJa/jTVs48t/39J//TlX0G
 CavKnSarmrvSbKM3pj/OxasMdaGWpDVNIu4veFUldhQNEUhqNbOldHQCbqumdEfUXzF3
 lR3HIXFfjMOo/3YkvV/BLxCLgQDlKdRIKXkaxiJL3jFpNBzji61sYeRSMqaKpGdg0tUF
 R0WA==
X-Gm-Message-State: AOAM531aBg8x6o5y2o6TmKXpwVfUqix7jZF+Ke6gIS8L3XXQttYsLTAQ
 l72OuKJF5+bc5O7lVpFtuTXtbuAtVvY=
X-Google-Smtp-Source: ABdhPJwzeFWU4HL7GtbFCl+8apNo6id30JjLsfgEQBjEiyL+J++jOPjWEkLH+PPsfq1WTYfP5EwKUQ==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr17462187wrl.233.1613918080102; 
 Sun, 21 Feb 2021 06:34:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y6sm22449049wma.10.2021.02.21.06.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/43] hw/mips: loongson3: Drop 'struct MemmapEntry'
Date: Sun, 21 Feb 2021 15:33:50 +0100
Message-Id: <20210221143432.2468220-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bin Meng <bin.meng@windriver.com>, Paul Burton <paulburton@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is already a MemMapEntry type defined in hwaddr.h. Let's drop
the loongson3 defined `struct MemmapEntry` and use the existing one.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210122122404.11970-1-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/loongson3_bootp.h | 7 +------
 hw/mips/loongson3_virt.c  | 6 +++---
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/mips/loongson3_bootp.h b/hw/mips/loongson3_bootp.h
index 09f8480abff..d525ab745a6 100644
--- a/hw/mips/loongson3_bootp.h
+++ b/hw/mips/loongson3_bootp.h
@@ -228,12 +228,7 @@ enum {
     LOADER_PARAM,
 };
 
-struct MemmapEntry {
-    hwaddr base;
-    hwaddr size;
-};
-
-extern const struct MemmapEntry virt_memmap[];
+extern const MemMapEntry virt_memmap[];
 void init_loongson_params(struct loongson_params *lp, void *p,
                           uint64_t cpu_freq, uint64_t ram_size);
 void init_reset_system(struct efi_reset_system_t *reset);
diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
index d4a82fa5367..b15071defc6 100644
--- a/hw/mips/loongson3_virt.c
+++ b/hw/mips/loongson3_virt.c
@@ -72,7 +72,7 @@
 #define RTC_IRQ             1
 #define PCIE_IRQ_BASE       2
 
-const struct MemmapEntry virt_memmap[] = {
+const MemMapEntry virt_memmap[] = {
     [VIRT_LOWMEM] =      { 0x00000000,    0x10000000 },
     [VIRT_PM] =          { 0x10080000,         0x100 },
     [VIRT_FW_CFG] =      { 0x10080100,         0x100 },
@@ -86,13 +86,13 @@ const struct MemmapEntry virt_memmap[] = {
     [VIRT_HIGHMEM] =     { 0x80000000,           0x0 }, /* Variable */
 };
 
-static const struct MemmapEntry loader_memmap[] = {
+static const MemMapEntry loader_memmap[] = {
     [LOADER_KERNEL] =    { 0x00000000,     0x4000000 },
     [LOADER_INITRD] =    { 0x04000000,           0x0 }, /* Variable */
     [LOADER_CMDLINE] =   { 0x0ff00000,      0x100000 },
 };
 
-static const struct MemmapEntry loader_rommap[] = {
+static const MemMapEntry loader_rommap[] = {
     [LOADER_BOOTROM] =   { 0x1fc00000,        0x1000 },
     [LOADER_PARAM] =     { 0x1fc01000,       0x10000 },
 };
-- 
2.26.2


