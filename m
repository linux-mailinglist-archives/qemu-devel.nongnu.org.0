Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA29C66256A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 13:22:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEqyQ-0000JC-Sd; Mon, 09 Jan 2023 07:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyL-0000IG-Ne
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:49 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqyJ-0006Gz-O7
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:09:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g10so6105814wmo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 04:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIp3JsnCZxhXt6GT6aUhF32nL0uOIOLvhkTscuIIgmA=;
 b=O2CJAPUOscrVtvbWCVYbN/6KrlrQXvAJmRdO16IY93pr6Pax3O33dgeTmtrnlEFQ4v
 PGzNsA7RG2f4m9LKZVgHMK/nbRpGVy97J94FaXbKkT0PeVj4R2Hg1vCd0PsNz1NsCFl1
 3HQX3VsjNlbrOuozmkY9ces+WVJyV8dbT6tcLkKUWUxRMyadaI+cRDUTbytJ97R1ogo4
 eUrCHuzhfClvJnwsey09Fdu9S0U6zxaNhsYVlpw6H8/ZPhS1Gg+83tV5nMh0HtCKaBF5
 tBf/UuiwCsteXg41tSyM9p0sCecTfcHJ6cvLHIcVaAe94pyBePJHwNibUq3XFnc5YWbT
 WQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIp3JsnCZxhXt6GT6aUhF32nL0uOIOLvhkTscuIIgmA=;
 b=r5TWNvzAGHisulV+CbaZktUMsojQvfeWDH1yyvrU5sIqZ8O58Bbr4DJNvx6Z0ZwIlJ
 a4C25QK3G55gIGwGT2793IxVmcGHieSDT7ygyoXd3yVpFi7AVVuwtovdD6Z9eePdeitK
 TfdJ6LqtyNyeO4Jh77bpWRo5+qoYwoyDXpGGh+uuSoZ4oouQ0HrF8BAHpb66uD8inezT
 TipbJGQy2c0Jxoi0ht+BHCv8JbJDHR6uSxFV+DI0MWzcQbFPeEkYugecCQ8zuJr0zkJu
 C52Pc+bi2x7XLkgxMg8KKdFm/dlblJ5Ku75UaT2iJ7b6iF+HuGtB3M4dKcpV6RsxGJrT
 34Uw==
X-Gm-Message-State: AFqh2koXsNuqkZQ+GIroyydYftLBlFwxNn2n47XNx0yMPkg2WTS6sa+o
 McvrTT9d7oGU1tvLHJ5oa4QbbhGTJURgvrDs
X-Google-Smtp-Source: AMrXdXskIbv2Jx39BMtMFOoCtvTaneRDmX6uo8Sh1Bkir2mTK0N4kYceqYRnf4XwWJkhW7RGte7eSg==
X-Received: by 2002:a05:600c:5116:b0:3d9:f296:1adc with SMTP id
 o22-20020a05600c511600b003d9f2961adcmr1341676wms.33.1673266186309; 
 Mon, 09 Jan 2023 04:09:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003d9780466b0sm12398079wmq.31.2023.01.09.04.09.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 04:09:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 15/21] hw/block: Make PFlashCFI02 QOM declaration internal
Date: Mon,  9 Jan 2023 13:08:27 +0100
Message-Id: <20230109120833.3330-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109120833.3330-1-philmd@linaro.org>
References: <20230109120833.3330-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Convert the QOM PFlashCFI02 to a forward/opaque pointer declaration.
Only pflash_cfi02.c is able to poke at the internal fields.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c  | 2 ++
 include/hw/block/flash.h | 8 +-------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 6168e66d7e..ba035d8d42 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -63,6 +63,8 @@ enum {
     WCYCLE_AUTOSELECT_CFI   = 8,
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
+
 struct PFlashCFI02 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index d615bf6a53..aeec4a369b 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -6,9 +6,8 @@
 #include "exec/hwaddr.h"
 #include "qom/object.h"
 
-/* pflash_cfi01.c */
-
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
+#define TYPE_PFLASH_CFI02 "cfi.pflash02"
 OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 
@@ -25,11 +24,6 @@ BlockBackend *pflash_cfi01_get_blk(DeviceState *dev);
 MemoryRegion *pflash_cfi01_get_memory(DeviceState *dev);
 void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 
-/* pflash_cfi02.c */
-
-#define TYPE_PFLASH_CFI02 "cfi.pflash02"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
-
 
 /* nand.c */
 DeviceState *nand_init(BlockBackend *blk, int manf_id, int chip_id);
-- 
2.38.1


