Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1629364AD3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:55:03 +0200 (CEST)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZz4-0001Vr-A7
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRy-0000iU-Ke
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRx-0001wL-5P
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id w186so14302444wmg.3
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=L51dCVtmKV690CQnkg35sQEgw13A406O7kYdTzP5ed0IpTGgVE9dZ1maaiqEpZRH11
 UEsd09O/O1UCwL63FyQnPoit+h6FvZrnkjCQ3or3dOkxB3k89CZ9ocjASHLO7+jPI2hC
 nVvy6lzCEQh0ldkxMCrgUC1SDJMr1YhWeCFBFqU8lX8ni2nfV3+qizc4zgC2u03l7Uod
 L3cXUuek5NsGoPVc3hY2jZsq+dgOTx1pK1ya1OqscufBpprsuS8j6/lVhC2IwVUXy1pa
 RBQzdbw5xTltalTs+BQhyrKXVO9vlokZrNEVRf7CVQuBBt+Sf5FA4y4RUttsaXNDvszJ
 NjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oEwKjogwzqew9LHnVJfSpLxM+9Yj6ci2FrJpneJ2XN0=;
 b=Mz+ICpDLeyjHv8UhZEx97+q2eLU6beUlphAe3nZduJZRrWoJ0wN0vcaF4wDvFna6jd
 lToyRQ/VDrMv12IWThPOfrlFlNCrawTTLrGs05op1RQQltFdT1lSodXEICxyl7svW4b1
 rhZsPlKmSKPhLkT0s+D/U3lE49jbaLsZKVvVUUg2+INAYZDJIvJ7cBoq8IoZif6zjmuk
 U+OQEh2YdnVHUo6f7FN6Ca9de4vw14zK8dUfSHYcdDlcihQlXfL8fy/4yk6zYgR9TaN5
 HBLrsF1SUVEEVmlL+r0aHASoJ8WwtJpQosUQbHOR2iw5uaZ+jMKYtZUlXzOFl+3Xzxl0
 clKQ==
X-Gm-Message-State: AOAM532sqwbnJ+CYCmC/1QO9TZGn9MTaw1EBfP/auUADpsmWVjKTmD9+
 fIhTBDmCeclZRQ+NlKAYbry8jrWtgrXuPw==
X-Google-Smtp-Source: ABdhPJw8nYfDufMydi3q2HvUqDE4fzI3us8Xjyb/Dgegu2hg4fD+L9qxh7480lRXlHROogvZpj+BgQ==
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr578311wmr.66.1618860046177; 
 Mon, 19 Apr 2021 12:20:46 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t6sm23638649wrx.38.2021.04.19.12.20.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:20:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 29/30] hw/mips: Restrict non-virtualized machines to TCG
Date: Mon, 19 Apr 2021 21:18:22 +0200
Message-Id: <20210419191823.1555482-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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


