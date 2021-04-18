Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68F336387B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:14:06 +0200 (CEST)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGc9-0002HP-I2
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGI1-0005J1-N4
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGI0-0001F7-3U
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:53:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p6so25329134wrn.9
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=FUCGQgPAzx7EBNV7Cv9or+sgjH69Cp32GVtsD6mBlb1UkLz9s+SwNx85fjc+ET8nBU
 +7qOYGiq34cYy5Jg9hGJ0OpsARDt9mwo1PUsiB0+MtVazcnIaeq4rx9Er3ndkKxLqmr5
 JtpVwQ1EHagAGptfxet91iSl1NbAALDeZ4Uvtj9GADeMptQyBAnH2Sg5ga9CejMy/ruL
 YT8mcSX2n7/DMyK5duP5JBBLXcAKN+xNhmUuVA8WIcTFkUB0zEsRY4fR6XBEjzsa93Ht
 C54BRAvEYcf948Lu8O/rRPb3lGNc1/emLbgyJ/19X6w5mTsNyZudowYm2m02mlcAdhLY
 NIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=Xb8uF4kYFFUnBwhor0A3hJ6Bqp6sQ0tzgwTxxcUIhhDhvTheeuk+ANL9JXFpOFRBT4
 n26mhEjxPGuxHghi2zGYKMKuEgKm4J8hJTptmkkQyryiz6HdNuatHhibMjckprsd/1XU
 8I7QoHbeDxkr2VXXoNhfsYy0swMDU9W23K9bEkNGS1fbWCrm8zFq9lczgvJ2vDLAFr/1
 zSheDakJbkj+Yt/J0BsBxR8gj56aYhFDytvSE5NI7xROA9siDpSjlUNmGUgVQLAADeFX
 isF2wlu0oR2tyiygMAcPHHc3jkpeO0JOYdf6B0qdlOlKFT8HRDpAosovjv+VFghgrh6v
 RuoA==
X-Gm-Message-State: AOAM532x6DAW4TRdGJIRgMx21vomuFfZ+Zox2pnfLypnDOCNr0RTtnCO
 VWoo6BpBvOGr5QCsMB3Ez/Xs9JccDRlgLg==
X-Google-Smtp-Source: ABdhPJxj3mbCKVtixNWtCN/J5ea7YiCLr+94dbSkq3ZHFJG08yyJRbAupL1ZQVMmD8XoxSEX1wlmcw==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr10714459wrp.231.1618786394470; 
 Sun, 18 Apr 2021 15:53:14 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e10sm2913045wrw.20.2021.04.18.15.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:53:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/29] hw/mips: Restrict non-virtualized machines to TCG
Date: Mon, 19 Apr 2021 00:50:57 +0200
Message-Id: <20210418225058.1257014-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the malta and loongson3-virt machines support KVM.

Restrict the other machines to TCG:

 - mipssim
 - magnum
 - pica61
 - fuloong2e
 - boston

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..dd0101ad4d8 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,12 +1,15 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
-mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
-mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
-mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
+if 'CONFIG_TCG' in config_all
+mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
+mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
+mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
+endif
+
 hw_arch += {'mips': mips_ss}
-- 
2.26.3


