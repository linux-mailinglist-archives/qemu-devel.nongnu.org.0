Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49F651FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:55:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7atx-0004Q5-Ec; Tue, 20 Dec 2022 06:35:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atv-0004Ok-Gz
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:15 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7att-0008HX-QS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:15 -0500
Received: by mail-wr1-x430.google.com with SMTP id i7so11429964wrv.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdzWWvFAVV4+oivj4DPQg6Xuoez6wnGV8qup6moGHTI=;
 b=TibMRcw6KIonfwEwI185xxkO/Wxp9F20ociO+vaTQT1Y6+8kxmgYM87L6YfyW79s6Q
 zWBBmU3m++FqzJUb4YcBCcqEiNHQ8nEKcgHRb9HqzMLXbxJ/rkiqK356LQyV2Eexv/0U
 Z2u5JkFU9Q2FjYc1WA/AvwsquZBbM7ANUnutNvfeUFSw+NZhijbyRZ1x1TJV1A+5pn18
 o39BRmeDa1P6HTu60f8L9Plxwulkswl9j7xHX8T5w42pD+2YoSgVvrdoTBv/fAQsy+Y8
 c/No7AUmrYbZrG7gtfitZGTYQ2X6p65dG8T3n7BxzwNITlmjoARSUsOT6CkOkL13Hmuo
 UD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdzWWvFAVV4+oivj4DPQg6Xuoez6wnGV8qup6moGHTI=;
 b=h7pkC6Ht8T0gF+GPddMYrY1bs0JZARXVGznnBuMD/q40U1iJZPjYSRtWpNLRK4D4Bx
 A9evbRWMMTjPa/KtxHOyRUGrs1LhtYpZr6Ey/d+2kGA0nUnVtq/sBTZJie2l69pQaQj4
 zN05WlSkoAHdIvDA8e32Ae0u8d9y9yx+vwOwb3R3FKXWSO6T+hyZzM2bVotUnHFeTC+Z
 PI1jD2ZTAht+hO+jFVcKMCbK24gyiWjt7I1ij0w597ejWZ1cKdq2zdG4JmdjKEx493bI
 60PScVFv1O3vNy+qIBtKHuftyc5AQN1lakLolrIbuOpeD9xmTGP3SlqSs89LR5SkQ/WT
 xVLA==
X-Gm-Message-State: ANoB5plWIlW5WredH6F1a2bhRAd6FmlEIbPayBWARNDSYNxfwLkCDdza
 4d7UL78M6k7phULqEw3IoDp5CWmJyYebJDC7Cpw=
X-Google-Smtp-Source: AA0mqf6wmmNch8WGHumXSnUselJbV/birTnm+RCO7IFwYrFirptbofLOAVwf77Y+YICaYD2jnyq9Fg==
X-Received: by 2002:a5d:48cf:0:b0:236:751a:9cb9 with SMTP id
 p15-20020a5d48cf000000b00236751a9cb9mr26499991wrs.71.1671536112149; 
 Tue, 20 Dec 2022 03:35:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m16-20020adfe0d0000000b0025d9d13c7e1sm9283739wri.105.2022.12.20.03.35.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:35:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 6/7] hw/mips/meson: Make gt64xxx_pci.c endian-agnostic
Date: Tue, 20 Dec 2022 12:34:35 +0100
Message-Id: <20221220113436.14299-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
index 4cafc76a23..bd0e23d2d8 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1225,7 +1225,7 @@ static const TypeInfo gt64120_pci_info = {
 
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


