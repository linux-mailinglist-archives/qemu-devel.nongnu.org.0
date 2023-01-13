Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD756699E7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:17:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmq-00014G-Ki; Fri, 13 Jan 2023 09:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmj-000115-0S
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmV-0003gt-QF
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15355174wmb.3
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dTsmvOY3TJk1Idee7Z8gcWnQgpKzbt50K3xWFkX5qoA=;
 b=qj4fRPLUhv9HE5xv6phJ8ztNKazHmw4ttH1RdjH+I3raDcaXLEwVU1M9/I7TLNbErf
 n6KAoXxOhQK/qYgqTN61v6b6abrn8XP8AXVW4jGN+iGIrnS8PPgkZvN+H/d7JQvkKGqw
 EeZ+OdfqiNwT7DcopEO9sNEgVbGENYot1YkogXWkR2g0opX0Kc1LQSCaDcJXL0h6mVfY
 6K2pGjwcx1Bcv5iFXeXEFRkZaS6QaHsoWt7NNlsFxjtJX6HBBkDPnTUTSx2IsazmDEpQ
 zLOq3Nw9sBjUIJ4kC5cIIAvmTkDYtOare/phCOQCg+ccg/agXuwVzyhEBDfsO/sYgoRS
 2eKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTsmvOY3TJk1Idee7Z8gcWnQgpKzbt50K3xWFkX5qoA=;
 b=0n2Lcs06IOLcoWRw5RXSQGISOnQxhnemVw7Li9LKNh0yw2C3mzybi+Wnb8+b1GinM8
 5faJ2us1J/x+/FsQXT30e8DPlF222v4Ohl3Gbj6BMeikeiT/uMJRJjz8gUsTdXGGBe/Z
 HlzcJdSVGD5oiKVlEggOrk3jhbzDJgJ6/fXs/+dAsnyb6U78ywArHe8Fd3JOxUCBtphP
 PLIEM4WMtQMAcAXfMTE9kdd7MvzSnSYqrRfn6rD2NO2e1faXs5yyedKN8oCMSVblAdXR
 KiRqs+ZHg5GibWACBKsDRgPumCyCmJKmBWBGyYwlbOmByWtnENBsNNKpiBoHvXi1p3cm
 NCag==
X-Gm-Message-State: AFqh2krKqbv1fIFumFWMb7NgNfZv1fKRqjU1vQgWDXCMF74deCv2W27w
 rYqLCTi/O0Aj2x88NOyl4NFebmbinqdzZyau
X-Google-Smtp-Source: AMrXdXtTa/EteHhwoDGuLRZjigZOlX1WR9KuUHafbLCO94AUh03pFSVd+0VSHOk9BemQwwNVyBxwlA==
X-Received: by 2002:a05:600c:3caa:b0:3d9:cb4c:af5a with SMTP id
 bg42-20020a05600c3caa00b003d9cb4caf5amr29909714wmb.33.1673619101034; 
 Fri, 13 Jan 2023 06:11:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/38] hw/arm/gumstix: Improve documentation
Date: Fri, 13 Jan 2023 14:11:03 +0000
Message-Id: <20230113141126.535646-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add a comment describing the Connex uses a Numonyx RC28F128J3F75
flash, and the Verdex uses a Micron RC28F256P30TFA.

Correct the Verdex machine description (we model the 'Pro' board).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-6-philmd@linaro.org
Message-Id: <20200223231044.8003-3-philmd@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/gumstix.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index ab9b0182f6f..89c15bee759 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -10,7 +10,7 @@
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
  */
- 
+
 /* 
  * Example usage:
  * 
@@ -64,6 +64,7 @@ static void connex_init(MachineState *machine)
         exit(1);
     }
 
+    /* Numonyx RC28F128J3F75 */
     if (!pflash_cfi01_register(0x00000000, "connext.rom", connex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
@@ -93,6 +94,7 @@ static void verdex_init(MachineState *machine)
         exit(1);
     }
 
+    /* Micron RC28F256P30TFA */
     if (!pflash_cfi01_register(0x00000000, "verdex.rom", verdex_rom,
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL,
                                sector_len, 2, 0, 0, 0, 0, 0)) {
@@ -124,7 +126,7 @@ static void verdex_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Gumstix Verdex (PXA270)";
+    mc->desc = "Gumstix Verdex Pro XL6P COMs (PXA270)";
     mc->init = verdex_init;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("pxa270-c0");
-- 
2.34.1


