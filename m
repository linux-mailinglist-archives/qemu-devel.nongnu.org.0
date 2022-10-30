Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E30F612D89
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:37:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGox-00022V-Pq; Sun, 30 Oct 2022 18:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGou-0001mt-Bj
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGos-0007ix-2x
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:30:19 -0400
Received: by mail-wr1-x434.google.com with SMTP id l14so13688324wrw.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EXpt2U7urhOundj676D3XC1wCblnQcS5gsy0nmp/Pv4=;
 b=k6FNzc2Mp6TUeZIk+da69TntozAJqp3L/s/z89G+DoK97inwhTwozzf+n8S0MleWR9
 ghv+c24DmrysYFpVoT7QYt/Rh68TOaNm8tiaxdBuzREbPQMKSeokSaxHZ1YfTTs5yBxm
 JvjCEaT7+/jiZiR6FIM4G/QVgQPsfgdTLhR8yp2sXhMBfmaGrBkaNzxmvobzZqspumZf
 sjTzs9A/4pVD+ZtpbdXWpM57M/VczW7UGvWWgTUt/JD6jqaJLI+g9QOG2ZuX+TSGDlHg
 RjqGS5Q5JZKqdFtNB1SA7aOSXBqfxVoV+732UPG2LLrJnbYge3fZA7fa0WJPiaAFW9Nk
 bXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EXpt2U7urhOundj676D3XC1wCblnQcS5gsy0nmp/Pv4=;
 b=xXW4e3+ASSzw8XHnBUyomHcsKl7cWFv9D7m2F/IGABQFAqbJnkbMch1AFAHhIU99Tn
 R5Qs5kFO8xEfzc1OckUurt6O1PfLJWSZVm9hpF311qvclEDSiJQVA2MUgI/HbqCgUuGr
 6Zwe7uPL1441tmPzZm9yEm8GvQco0uw9HWIQqxGF7mwY4yRy+skYnGhS36MYH+iN3vQ+
 7+Vo1vFO8FcITXNC2olas8if9Sr5j5yKqbrfRSUE7LJufMEmURQ53pMbpDRJtqWk0uRM
 PXN+4brbfFq9MTrdJjGIb+DekLL2csLLgi0GPDxuN0al5q2a+sB+i+4D43/epBFkqr1A
 xXTw==
X-Gm-Message-State: ACrzQf3y4LpLrfFa+SgSqAaPjyMiFCPgtAG/JdgYTOjM+aL34rywX4DF
 gQdqChzk1DxazoSFadjXMjfRB4vyx/gMuQ==
X-Google-Smtp-Source: AMsMyM6335zQmidcY7xXT3r6iRFIQSqr0RIkZkZSu+/wYVNALOHp1SAIGBMwl7YiVRjGc+VIBYCZkg==
X-Received: by 2002:a5d:5265:0:b0:235:e1fa:98a2 with SMTP id
 l5-20020a5d5265000000b00235e1fa98a2mr6220596wrc.73.1667169016255; 
 Sun, 30 Oct 2022 15:30:16 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a05600c354b00b003cf57329221sm6151713wmq.14.2022.10.30.15.30.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:30:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/55] hw: Remove unused MAX_IDE_BUS define
Date: Sun, 30 Oct 2022 23:28:00 +0100
Message-Id: <20221030222841.42377-15-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: BALATON Zoltan <balaton@eik.bme.hu>

Several machines have an unused MAX_IDE_BUS define. Remove it from
these machines that don't need it.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220917115136.A32EF746E06@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/alpha/dp264.c    | 2 --
 hw/hppa/machine.c   | 2 --
 hw/mips/fuloong2e.c | 1 -
 hw/mips/malta.c     | 2 --
 hw/ppc/prep.c       | 2 --
 hw/sparc64/sun4u.c  | 1 -
 6 files changed, 10 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index f4349eba83..c502c8c62a 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -20,8 +20,6 @@
 #include "qemu/datadir.h"
 #include "net/net.h"
 
-#define MAX_IDE_BUS 2
-
 static uint64_t cpu_alpha_superpage_to_phys(void *opaque, uint64_t addr)
 {
     if (((addr >> 41) & 3) == 2) {
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e53d5f0fa7..355b3aac2e 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -30,8 +30,6 @@
 #include "qemu/log.h"
 #include "net/net.h"
 
-#define MAX_IDE_BUS 2
-
 #define MIN_SEABIOS_HPPA_VERSION 6 /* require at least this fw version */
 
 #define HPA_POWER_BUTTON (FIRMWARE_END - 0x10)
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index b478483706..50c61f0e4a 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -49,7 +49,6 @@
 
 /* Fuloong 2e has a 512k flash: Winbond W39L040AP70Z */
 #define BIOS_SIZE               (512 * KiB)
-#define MAX_IDE_BUS             2
 
 /*
  * PMON is not part of qemu and released with BSD license, anyone
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..5099ed9592 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -69,8 +69,6 @@
 
 #define FLASH_SIZE          0x400000
 
-#define MAX_IDE_BUS         2
-
 typedef struct {
     MemoryRegion iomem;
     MemoryRegion iomem_lo; /* 0 - 0x900 */
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f08714f2ec..fcbe4c5837 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -50,8 +50,6 @@
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
 
-#define MAX_IDE_BUS 2
-
 #define CFG_ADDR 0xf0000510
 
 #define KERNEL_LOAD_ADDR 0x01000000
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 0e27715ac4..387181ff77 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -66,7 +66,6 @@
 #define PBM_PCI_IO_BASE      (PBM_SPECIAL_BASE + 0x02000000ULL)
 #define PROM_FILENAME        "openbios-sparc64"
 #define NVRAM_SIZE           0x2000
-#define MAX_IDE_BUS          2
 #define BIOS_CFG_IOPORT      0x510
 #define FW_CFG_SPARC64_WIDTH (FW_CFG_ARCH_LOCAL + 0x00)
 #define FW_CFG_SPARC64_HEIGHT (FW_CFG_ARCH_LOCAL + 0x01)
-- 
2.37.3


