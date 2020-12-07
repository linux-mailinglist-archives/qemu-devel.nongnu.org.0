Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC122D1DBE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:52:30 +0100 (CET)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPMr-0002rr-AR
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEl-0004wy-L6
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:44:07 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPEk-0004gr-6i
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:44:07 -0500
Received: by mail-ed1-x541.google.com with SMTP id b73so15508103edf.13
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PsgapN4DayY67PGB6PO85RVxsavx9TC/Jgo4bJ+1BLQ=;
 b=I/CfST2viOffPmkuqmHYjl10aHRZ8hjw9+EudTwLVOPPFgJDm3R7uy64guys5rHt8Q
 UHcKT3VBKaksntFZJmPzU94WQqEBZgTLvA2xLxsA682qfClACCfPRs+//9lIy+rDNS3q
 TOYa1L716scB4RbG8NKTLXKf1/zlFji5qFddwzQ+Ah+7hz74eHGLVGCxhFwJQWWvB0sb
 cVeIlTSFRSPIZQ3uVih5iABx7IEOtDtAzKNF5ZRVajXZfooLSnv1a6QzfTc13EpKbsWD
 D77Q3wBa3O5ya2+LJymveG5zh0zQq6ImY2xQ+wMnvr8WMx1vbOzC8vQHqAMtTejaX8av
 +jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PsgapN4DayY67PGB6PO85RVxsavx9TC/Jgo4bJ+1BLQ=;
 b=N66OFQoldWWJ8u/BvGwrRaXUccMTPFix2FExxV6l47zRnflc+qtNUI8kdVSznQL1+m
 W0kHAStQoOB9p9iV1kfdV+2e7lz72WY5499aCwwRDtFeS2d3zWImEoTXD1uPB+94X8Mh
 ODWW419hrGDT1psCgny8v7uENEWNAIpflHFZ4xfNRyXxKqm/ldxv0HLxGZZjDCg8rurJ
 JzIdb7aO6EHj1vbb6Q46seFLR6xayGMa1CQSw+SX9PSkmsI+wlwcUawxJkq1TpMmWzQm
 tZkX4/wi5iXb2Vha767ZOdbCYY/hXP4o1cvL3Qi6VL7TMq3pnHSMJ2ppFse420Lcx+vK
 N0IQ==
X-Gm-Message-State: AOAM5325aZ+GQLDxg7DEfqYDgHuLbnMfaIbm5fOWpJsmTr+g3gwVGpKQ
 cBsYA3o94Au6qozp8guOtmE5Bg+5NJQ=
X-Google-Smtp-Source: ABdhPJxJtFeBVcCwDyOA3XcfF0Y091gEd+Wo3TWdiiKDXjjcbm0r3xxVAcbFu0sAMPvAg+3YWhN+MQ==
X-Received: by 2002:aa7:da07:: with SMTP id r7mr22082888eds.309.1607381044698; 
 Mon, 07 Dec 2020 14:44:04 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id gn21sm8231238ejc.27.2020.12.07.14.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:44:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] linux-user/elfload: Update HWCAP bits from linux 5.7
Date: Mon,  7 Dec 2020 23:43:34 +0100
Message-Id: <20201207224335.4030582-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207224335.4030582-1-f4bug@amsat.org>
References: <20201207224335.4030582-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8f943f93ba7..0836e72b5ac 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -986,6 +986,19 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMIPSState *e
 enum {
     HWCAP_MIPS_R6           = (1 << 0),
     HWCAP_MIPS_MSA          = (1 << 1),
+    HWCAP_MIPS_CRC32        = (1 << 2),
+    HWCAP_MIPS_MIPS16       = (1 << 3),
+    HWCAP_MIPS_MDMX         = (1 << 4),
+    HWCAP_MIPS_MIPS3D       = (1 << 5),
+    HWCAP_MIPS_SMARTMIPS    = (1 << 6),
+    HWCAP_MIPS_DSP          = (1 << 7),
+    HWCAP_MIPS_DSP2         = (1 << 8),
+    HWCAP_MIPS_DSP3         = (1 << 9),
+    HWCAP_MIPS_MIPS16E2     = (1 << 10),
+    HWCAP_LOONGSON_MMI      = (1 << 11),
+    HWCAP_LOONGSON_EXT      = (1 << 12),
+    HWCAP_LOONGSON_EXT2     = (1 << 13),
+    HWCAP_LOONGSON_CPUCFG   = (1 << 14),
 };
 
 #define ELF_HWCAP get_elf_hwcap()
-- 
2.26.2


