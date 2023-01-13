Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B22669F3A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:13:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGW-0001pF-Oz; Fri, 13 Jan 2023 10:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGB-0001cM-E8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:32 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMG9-00066B-OO
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id bs20so21461803wrb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cYKnpcqtl1IesJfxp1MkApNk/L1MdcSC7q7TRVPYdkk=;
 b=UAPRGsm4Gn9yS+aDTyVl7MuE17S+rGvaGc2Cps/J8ZGPAuSbelKh0B5mdqN86dbCER
 203Y0kmqinvAZ24rIW1rvzB9tBREYvQSUHUd7bwpyLunqBDS4+Ueqk0AUli76VO7nK6V
 4DE54Y0csDUvjVTI+aO1ex8Tuouu7NTFlajrtecWcVJzQw6kW/a8K7RpL6oeJtLScLbY
 wncL2MRXx4gub0D0Rv5BcQmqAU7cAwUgYQxrahDx2BPxkdrK462PMPcUWdi+568xZsXI
 zI06q0z14RXqSmshp9ztPC+icGLHWnPhIXJ4W2CfNikfzqPEm2Q58+E5afXOV+fWBVzG
 C/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cYKnpcqtl1IesJfxp1MkApNk/L1MdcSC7q7TRVPYdkk=;
 b=XMe6vI9OUtsS3hC/e3aIIQVsRNJD3WBElmFN6cbreFSxTdEGKp7p3wTvQkYuaabFuj
 tu/pZcy2WrV25WWzyWkrjTzhG8UWLawAucctqgjZYjLf+0EHhbRzlElcTc4Z1lWOGZqH
 9inH8L+2H4H/L0Wo6efvuUZ25nKbKXDAMt3G6m0eplfkd77oGOf7SPfO4YDN6IkklZ0u
 PLI5ewcSs+QWm7MUHHPvPceztkPwmOEj03/48CZWQ4jrOeYMfaTPckn6Khgw963mVhld
 QPP/hs0e6UGMF0YYkjhUXf9N3UPv2QT2335MrDxCedeZXphXuYmVlLtYl/BaEdn5p0/a
 YnAw==
X-Gm-Message-State: AFqh2kpLoV4Xzjg2ekbWafTuX9nQCLxXWAR40THwaLacLHQLpzjN+CGq
 7v3Ff0QE4/wREpnKJvJU/blpGI2BWEoP3lzL
X-Google-Smtp-Source: AMrXdXuY9XYo7+eYzJIVrGpmlIRzukhvAS4N1+M+jgPik0LBVDehMx0HEVi3XT064LZc5olkW19PmQ==
X-Received: by 2002:a5d:44c9:0:b0:2bb:dc8e:3d5f with SMTP id
 z9-20020a5d44c9000000b002bbdc8e3d5fmr18504303wrr.67.1673624782221; 
 Fri, 13 Jan 2023 07:46:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adfd845000000b002bdd96d88b4sm3758850wrl.75.2023.01.13.07.46.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/46] hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
Date: Fri, 13 Jan 2023 16:44:56 +0100
Message-Id: <20230113154532.49979-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The single machine using this device explicitly sets its
endianness. We don't need to set a default. This allow us
to remove the target specificity from the build system.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20221209151533.69516-7-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/gt64xxx_pci.c | 2 +-
 hw/mips/meson.build   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 79c15a5e3a..f226d03420 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1263,7 +1263,7 @@ static const TypeInfo gt64120_pci_info = {
 
 static Property gt64120_properties[] = {
     DEFINE_PROP_BOOL("cpu-little-endian", GT64120State,
-                     cpu_little_endian, !TARGET_BIG_ENDIAN),
+                     cpu_little_endian, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 6ccd385df0..152103f15f 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -3,7 +3,7 @@ mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('malta.c'))
-mips_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
+softmmu_ss.add(when: 'CONFIG_GT64120', if_true: files('gt64xxx_pci.c'))
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
 if 'CONFIG_TCG' in config_all
-- 
2.38.1


