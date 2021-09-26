Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D03418B6C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:30:13 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcex-00049c-SZ
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcd4-0001Zd-5b
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcd1-0005js-QB
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id t8so46611328wri.1
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=KDGXbEwVEfj5iCcoPn9Y3LdzC65NTG4Yg+o1wg3KE4F6V2r7sG1pw1y+hkClw8QSY0
 HIq384GOHKwpaJxwZ4K+0j9T0VhdNnANJrEGAxBwwyt2YvgzPZAljt5BY1aShQ7vWnBc
 4P9JQPMU58SMDMM31dreg+d83Jo6G2bT6bLpiWE+xHDut6B0gCtJZAmLRYpMfJgZkli8
 GfW5fMYrpdlK25RV3IBZkS6R1/lQRnhi/4ta1koEdv6LSbhSZOowUmZiYuZGWo2ebSNZ
 4ZXWA7cT7fbgEzrxXofiB4SVIUR7CXDN3poqBnIcLjBDVRIp26gk/N0z+l/iWon6eihO
 uzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tl5Shev5pC48yBd7v32jcWMdVT27BoRgDVkMAOt+xfs=;
 b=uIiu0T0OBZ4UMFp23ILnXNAPXOIyUiNJMHPy+MFPJ/WNyePCUXoAxJWU5oPLa2jyAQ
 gRxelW/LhGmUckej1GEu4/rP2cetj2KduJxnECKoHYLz5VkysLdMjX2QZE1TLVh8jcDq
 on3MKdRKIwqkOEoWTp3ECnNsCH0o9n2ujvxG/7AhfkNO3ORkGPBagtdPTWBpY93xUpU2
 lkFTvDEW7P9zl5iSHzv0crGl8mz22UTgxcePi0IdPFPYVFvHObJyP5pCxDOND8hFRP0f
 XTekkSPIUGNuH2qQKTO+gzyN8tM69CQ3dBmRyi3YDExbvOsOg3HnW6NGcjICfrKDD+Gv
 MZZA==
X-Gm-Message-State: AOAM530+5zStbAZKw8U5NtBVnMm1J/joocEa/ac/ZYZbH/hV+GL4mXEW
 UAD275AJuYV0hMH6tTgKl8b9kWX6Dus=
X-Google-Smtp-Source: ABdhPJzQwXKTQ+GYGsOnuq6HO1/QCUPtf1iwdOiHMhh8t8rFgkc69ciZaLQ90Uen/ZBEHagX5ROPDg==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr24409074wri.338.1632695290386; 
 Sun, 26 Sep 2021 15:28:10 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 x5sm18522189wmk.32.2021.09.26.15.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 11/40] accel/nvmm: Implement AccelOpsClass::has_work()
Date: Mon, 27 Sep 2021 00:26:47 +0200
Message-Id: <20210926222716.1732932-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific NVMM handling for cpu_has_work() in
cpu_thread_is_idle(), implement NVMM has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index f788f75289f..36296f79ff8 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -83,6 +83,11 @@ static void nvmm_kick_vcpu_thread(CPUState *cpu)
     cpus_kick_thread(cpu);
 }
 
+static bool nvmm_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -94,6 +99,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
     ops->synchronize_state = nvmm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = nvmm_cpu_synchronize_pre_loadvm;
+    ops->has_work = nvmm_cpu_has_work;
 }
 
 static const TypeInfo nvmm_accel_ops_type = {
-- 
2.31.1


