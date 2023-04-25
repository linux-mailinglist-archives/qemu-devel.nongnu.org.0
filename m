Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF06EE921
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 22:37:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prPNm-0007Tp-Fs; Tue, 25 Apr 2023 16:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNi-0007RW-FV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:22 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfustini@baylibre.com>)
 id 1prPNd-0002jm-LJ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 16:35:22 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-51452556acdso4658039a12.2
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 13:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682454913; x=1685046913; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AgUFVWxej1CEh7xdajxJRaXiUtlBrRPl/cjW0xykm/8=;
 b=2uSYQREAGl8Q5Tt4SVdP9FmXTGEdrbjhrWlwjN88+1nl+E/049ZAxSseYTiFFuF9Rr
 UoeF36lUGlYT+PjUPiKCRSaRBnq4XvVLqYi/KLS4iIoKAQH21Ax2AXzhhg6IiJ3Q9DdB
 DtOcpET15kSOc0OJLDQb/adHqYEFA9MZ+EiddZ8QTfd2J2SN30Pf132vNxQZL2GqtqEQ
 ubkE9NOC3Ed7I+QZaegdsBUPWvWtlJ1dzMSI8QvERVQvLRC51nEPkMxwT3dAB600N407
 eSo+HXFV5aN1ecqPnsEoMXtnqlCm6OFOeJjcO3uwcpG6njlLld200x2UWQ0jZ8CO89Xn
 Xe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454913; x=1685046913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AgUFVWxej1CEh7xdajxJRaXiUtlBrRPl/cjW0xykm/8=;
 b=aYB0sKvRn3u/zV0w7VBjD5WwDl/Lg7/i4B8ivREfN2MeZ7xQC7aWdWk79wVnDQQdwp
 h1k4TWasDBuvF8sdeUYBSy3zxeupSBzupzAg7aUUTzs76J9NFz6jc+q95AkWpMYKEagx
 gBLqx/SaXq0jSKdvh/Cv+QN8Y10GFA5TwvqwcJ97b5ukS+Fu1Ez3ZBREHifVxKOHLKmM
 hAIiRPt6GmQthdxSq3axxtQrUtNuXKEU3U+T8rQry4lWXytQzKwZsWd7nd14W+/I07oP
 He6+gAkz2fRaemSY2TrvjQmd+5njcL5XiUC4Io2fyqhiiqL+0N0zjomoTiOgblHCoJRx
 JFmA==
X-Gm-Message-State: AAQBX9dUsTOCojJD2yEhLUTveVM9FNTQOEO0SeBG9aNG91aYSooTeV31
 xyqz01NfQlt4utCIXnA2xqelVg==
X-Google-Smtp-Source: AKy350b5/OlQAKTlvlydcactIwipIkY1Gg+Ov8kqehwVQEN6X8WR8elGLSda/y/gFnuqFNmOgLsAhA==
X-Received: by 2002:a17:90a:f48b:b0:24b:68dc:121 with SMTP id
 bx11-20020a17090af48b00b0024b68dc0121mr15897673pjb.33.1682454912904; 
 Tue, 25 Apr 2023 13:35:12 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net
 ([2601:1c2:1800:f680:b08a:7f49:1848:42ff])
 by smtp.gmail.com with ESMTPSA id
 ep8-20020a17090ae64800b0024739e4ad02sm762752pjb.28.2023.04.25.13.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 13:35:12 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Ved Shanbhogue <ved@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Nicolas Pitre <npitre@baylibre.com>,
 Adrien Ricciardi <aricciardi@baylibre.com>,
 =?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH v2 5/9] hw/riscv: Kconfig: add CBQRI options
Date: Tue, 25 Apr 2023 13:38:30 -0700
Message-Id: <20230425203834.1135306-6-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425203834.1135306-1-dfustini@baylibre.com>
References: <20230425203834.1135306-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=dfustini@baylibre.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Nicolas Pitre <npitre@baylibre.com>

Add boolean property for CBQRI and imply it should be enabled for the
RISC-V virt machine.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
Changes since v1:
- remove example SoC now that command line arguments supported for CBQRI
- change 'select RISC_CBQRI' to 'imply RISCV_CBQRI' for RISCV_VIRT

 hw/riscv/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index 6528ebfa3a3b..8fd4aebc77d1 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -1,3 +1,6 @@
+config RISCV_CBQRI
+    bool
+
 config RISCV_NUMA
     bool
 
@@ -45,6 +48,7 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
     select ACPI
+    imply RISCV_CBQRI
 
 config SHAKTI_C
     bool
-- 
2.34.1


