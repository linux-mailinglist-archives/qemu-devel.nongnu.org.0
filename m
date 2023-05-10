Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E626FE19C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:34:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwloA-0007Bp-CU; Wed, 10 May 2023 11:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlo8-0007BG-0C
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pwlny-0000U8-CP
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:32:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso4948096f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683732756; x=1686324756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QuCoDiAObR/Z2Z2rP0Xwqovsoce8UpTQfGK7ANVfuJg=;
 b=KIsq5p2U2yMptwyjPYSaCRAThtTaWZ7xLaVsAKqsv53q6EYaNAbeyZGRkhGOBSiGpV
 /FtDPMApZ6haqXtdRbhT2zHiiedDuDqOALgALSaxZSPUb5e9mNhff1ZqkydMMiKKCwdg
 ktmlaBEb3jeacH+9jMCubIOiFjUW7aqgeTf0rxKmScofNOnsl5cBRYmFLD2jVwbIH02p
 BGSZqLXJiiRW8zPQ776azOljZnWCXq5VjcnTEMoGCsKmPZPVkpDE/jCb0RMDXwsolvMz
 2UQurxQ+k66wlwfx/W+AlfV9i+9L+hRHdFaVkvclfegtlBbPCBsCXyKupZ5aDLBIt48o
 e3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683732756; x=1686324756;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QuCoDiAObR/Z2Z2rP0Xwqovsoce8UpTQfGK7ANVfuJg=;
 b=dKLkByk8AxGHgzVk24PItYSpYmUgYWYZswYH244vYUh82BZwMWdYxtvPHMYvPLsw1i
 bIZP9JsLu9Ywns9F1oUiOPfy8ntM7rRvKWJjogYHgIu9KN0MjEHh2TbugfVxDBPP1yjk
 6m4dT1y+fma3UOnhkYtsf865lIXFxlzWQLpqPKBl/LtwNxGuGsCsXPVvxtbmPzO6PLYt
 8K57BcukYZd421VusBAXdIKgjHm5RBEZuQq2CEXK5AW7JnjjhdkPYmCb6MMm6RpKKcIz
 oMZoLcSBE3XoxaQ6y/KmIfAziXrVxlADjt50hHjeDjVr35HwfR08Yq4qFhTTESdgL3Lt
 ZJqw==
X-Gm-Message-State: AC+VfDzS3sII+ohi8Q79O6Wl+OsiMWjaJtfgpSOKl/VP5zmqzSDzifmo
 nH4lAYtDS85gQ1XOuiO0Mfrb5JSoorQ=
X-Google-Smtp-Source: ACHHUZ6vtCmnt4hzcunQjfDLkcgztJ61GW3/hX6XhjJkp2R2GdOU49jEXRlVGXgXiaDAqsXiqhB+9w==
X-Received: by 2002:a5d:510a:0:b0:304:8149:239b with SMTP id
 s10-20020a5d510a000000b003048149239bmr11917447wrt.50.1683732756332; 
 Wed, 10 May 2023 08:32:36 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 r10-20020a056000014a00b00307972e46fasm9394157wrx.107.2023.05.10.08.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:32:35 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v2 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Date: Wed, 10 May 2023 16:32:28 +0100
Message-Id: <20230510153228.264954-4-shorne@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230510153228.264954-1-shorne@gmail.com>
References: <20230510153228.264954-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

OpenRISC defines tininess to be detected before rounding.  Setup qemu to
obey this.

Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v1:
 - Remove setting default NaN behavior.  I discussed with the FPU developers and
   they mentioned the OpenRISC hardware should be IEEE compliant when handling
   and forwarding NaN payloads, and they don't want try change this.

 target/openrisc/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 0ce4f796fa..61d748cfdc 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -22,6 +22,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
@@ -90,6 +91,9 @@ static void openrisc_cpu_reset_hold(Object *obj)
     s->exception_index = -1;
     cpu_set_fpcsr(&cpu->env, 0);
 
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &cpu->env.fp_status);
+
 #ifndef CONFIG_USER_ONLY
     cpu->env.picmr = 0x00000000;
     cpu->env.picsr = 0x00000000;
-- 
2.39.1


