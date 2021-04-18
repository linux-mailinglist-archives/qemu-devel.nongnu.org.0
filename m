Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E23636E1
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:56:40 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAis-00016y-H3
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMd-00046l-Ua
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMc-0004wq-02
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id g9so15482657wrx.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oUzuiPX95AB2xQcaIcBJGRugwKzzDlIGMI5IJBcJKrw=;
 b=Bz3y1qlnxBA9TzF6i8SRRDjOgDbRh73t5C1pc9qwTgzycepR+4V8GkeWNJKpBSn2i+
 tIKsHZ7TfWa0NcxwyvpajOscLSV7MnQb3b+5EbvV5fcQSg64zWjh9aPvepGn0Jm8XFq7
 AXcZiXJGN3n7NPxVRsqS5Wezw5RevWtND/yTzonlALF/71XAItXqM7smxGc1svbL06hK
 fN/MrhVsjoW5HiieT3PmGv743TRgI8UM9bNqywrqNb4KXMmaJCZwA8ukJsHPYWgTQJ7n
 58Kli4YusU2H+e+OFtujPuXWFST/ZQi28Ww7p++ICVTgNEK3XDF5JZ9AmHDgvVwPjbmI
 npfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oUzuiPX95AB2xQcaIcBJGRugwKzzDlIGMI5IJBcJKrw=;
 b=AlCwTxLHyCq+dxmIbzS6qXH3AWdMVBCVmKZyvlcOUrwW/8lfOLHhdG37TPevxqxDbY
 6ZPnzbcXCP3Xom8iKSdIEwdmzYxjBTS+k69FOOlCWdh7TofaynlqD3HQaFS7vFhOSiaN
 715lh9VWAN0H1tfxdr972hSkJv4ws9nBxQbs2ynBzNx6nqn6B+bNJff95A5u6q5Ay8oE
 KfHMASGwr6Lj8P1olZJKeSVT7NDT250KoDMHAV1bkcRLx8CrqWI31C28Rf4/6HCc85Sr
 RpBy/bznYJf/yjERx2G5t1+4yeFc/uvWFvlSSm1Dlml63pF5zhIkxun5en+Ej666dwZ3
 0kSA==
X-Gm-Message-State: AOAM5317yWVsQkZM4kfa/6/MlDkBwQsFDV22N/AMiEf7aQjNsOx+YrTm
 uN3ySDLaQC36YXGBkNrvFEXASe73oh7z2A==
X-Google-Smtp-Source: ABdhPJzywDD8Q9cjD8cZSLMgddF4HIVW+1Tm1pWL/EfYN7F26ok6GvaSGLRzEaIGGEs03LnkFJAAQA==
X-Received: by 2002:a05:6000:1249:: with SMTP id
 j9mr9671192wrx.416.1618763616315; 
 Sun, 18 Apr 2021 09:33:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t14sm2291539wrz.55.2021.04.18.09.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/26] hw/mips: Restrict non-virtualized machines to TCG
Date: Sun, 18 Apr 2021 18:31:33 +0200
Message-Id: <20210418163134.1133100-26-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
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


