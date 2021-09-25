Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5541830C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:08:03 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9HW-0001JN-4m
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU92A-0008LX-11
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:10 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU928-0005XL-IE
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:52:09 -0400
Received: by mail-wr1-x42f.google.com with SMTP id g16so36515440wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=bkeg32cm1g1cDL5Hz840hC10GacR3HaUV+H3qtoTwYs4zn0RAwCScYriOnXvHon0U9
 0gp34aCY/s4IUS8T3dkVsSu2XXJMBM2RxiapTZHNYlo7EIT3anGmf+Wpx/rsWySC8ZLR
 8YAWxrQoob8Xsioze1bPGrD5rNSRzJfkvHLwKx7rtHkGP4GPpO9voHXxgACghPuAlPkm
 KKRglJ3zqDfktRjl95CbDkAHKlJdREjHpw4SVnMb8kI8rHeZvNKqeabKEZxFwI3Yxov6
 AYoMHujrVoPyqGYpNbkEAsWRviqZZ94wwstJKPuTAL9RrJXjOGm4CdvGKfc/M+F4+a9D
 UagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dCLxbLnwCEUqojfStjhPo9ZalBzirYzUtLUPN9TYqi0=;
 b=axP9G9kY5FI7hEaYb80Po5837tdTSfl/BiaC2E942HyLXlQxy2Z8kzgE4ss3xwuvTa
 KiZf6QiHYtGKBZEaJRYdO5PyTP3EmtEdZw4jAkhZWbYUfaywd9CGjmdDnSNyae8IC9ub
 YLU2n567TMuJyDRyCymHrejVWXbHCwCiclzzpOaXYrvCcOXImb01eo/TluiTCQiLUbRU
 selwq20Xg1c6mJAaZP5tnrXBP2kd9hOEPj9y2B9t/+FaR1jlkEVtTm9V29oPEbpCvdwM
 qzpfI0dcWApqqrmsEvFBC20xQibRBtaxitO61/EuSjMfY20RVgDhc0LKJP78QVqoFIk9
 DRmw==
X-Gm-Message-State: AOAM530lyrk0PouM7WbuaDdB4og2pht+g79ZaCSrRZABhI9R3xZ2mBPe
 HkKw5PWN+h3DenS8TWKGELmkFq4qzxg=
X-Google-Smtp-Source: ABdhPJxLYejp8XydnQh03LskQRhp0++Hb69luky+TD2y7l4giH1o7MRjrlRABmmwsTGuVS6G+W36+A==
X-Received: by 2002:a5d:6392:: with SMTP id p18mr17068385wru.372.1632581527063; 
 Sat, 25 Sep 2021 07:52:07 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z12sm3461932wmf.21.2021.09.25.07.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:52:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 10/40] accel/hax: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:48 +0200
Message-Id: <20210925145118.1361230-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Colin Xu <colin.xu@intel.com>, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is no specific HAX handling for cpu_has_work() in
cpu_thread_is_idle(), implement HAX has_work() handler as a
simple 'return false' code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/hax/hax-accel-ops.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 136630e9b23..5407ba17eaf 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -74,6 +74,11 @@ static void hax_start_vcpu_thread(CPUState *cpu)
 #endif
 }
 
+static bool hax_cpu_has_work(CPUState *cpu)
+{
+    return false;
+}
+
 static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -85,6 +90,7 @@ static void hax_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hax_cpu_synchronize_post_init;
     ops->synchronize_state = hax_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hax_cpu_synchronize_pre_loadvm;
+    ops->has_work = hax_cpu_has_work;
 }
 
 static const TypeInfo hax_accel_ops_type = {
-- 
2.31.1


