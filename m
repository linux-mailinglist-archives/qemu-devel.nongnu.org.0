Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADD432BD11
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:13:12 +0100 (CET)
Received: from localhost ([::1]:56026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZjz-0007T4-69
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMv-0006gt-Gq; Wed, 03 Mar 2021 16:49:23 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZMs-0002dN-Gh; Wed, 03 Mar 2021 16:49:20 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e10so25126579wro.12;
 Wed, 03 Mar 2021 13:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CGCXi9+Tg5mub0B9murOfm8Ay83y93iGvVDRpdfsps=;
 b=BncbyaUijP8mQby/RC1m6CuBqJhX4f8uzsk1xf64D9tsy+AD9d9Brmpw5VZRQO5Syj
 o7dArspPMkOOna0J7WUiL/VZKqa53GatDrqwn81COGz1Kmg6n6n+PgYM7Ojvi0zo/SsJ
 OH4A6PPki8hgQwWddehU5FTIuhNRyDe0sGkriywquNcSNxM+lnOO2qlBfcA1BLLjq+o0
 N5Qzx5ODP0kfUJ39RwRX1uDACMjEbHauAqY0TD3Fh7164xGvF+VquUY3zrvXwZWm8bG0
 xIEOPPoEtQZaGTdgO50avbceoOmKWn2ovQKrYyYuaFK/1KFgo26ChFQUdCSNo0KtUTRb
 RFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9CGCXi9+Tg5mub0B9murOfm8Ay83y93iGvVDRpdfsps=;
 b=pj7u0+vPsQJ6vziqdd+Q4RinEd+D0qcz5JB5vCi5ij5HS3xxD8eGZ9Yt5GzbGWVbmM
 59JtF0FTjNQ52vub3HRH1i6xNrO3+OA3PcMZH5E5i40WgX8iwai8O0+LhRhiyC7fdFbV
 FVVUMjyaThMohRxMYL51xifZHKL8BmvGfeO5apkm1VHBN+Dx5NTpgs7h9mmIbjedr7rg
 pEZepOKov3TO4oVAyLq+V8EKh/KYuh3K83wO6bQamjNv4qLowgaXZ4HE/0EHYarRwiq+
 YY9NCHi17VxyyBVkLRtHeBKB4LZWKVacszXpJQiQE4FvkQBXvq65+UIsPKECl3QSUXn7
 0VVw==
X-Gm-Message-State: AOAM531SpU3KVH3osVUzzi2H3ESWAHeMZnGFGEcv97Sq3bOpLRiGl1tJ
 OSY8KBAS46Tpb8HCYOZugZlFsIVit1c=
X-Google-Smtp-Source: ABdhPJxYM063IJN0COFfaPkajKqL++yy+J1PkY9rOTXrR2FtKls2fwIULR4oDLlqPmI4itT1CUeXgw==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr815714wrr.0.1614808155948;
 Wed, 03 Mar 2021 13:49:15 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d85sm7280009wmd.15.2021.03.03.13.49.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/28] target/i386: Restrict watchpoint code to system
 emulation
Date: Wed,  3 Mar 2021 22:47:03 +0100
Message-Id: <20210303214708.1727801-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can not use watchpoints in user-mode emulation because we
need the softmmu slow path to detect accesses to watchpointed
memory. Add #ifdef'ry around it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 994d58aa754..4b8f06f6193 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6182,7 +6182,6 @@ static void x86_cpu_reset(DeviceState *dev)
     env->dr[6] = DR6_FIXED_1;
     env->dr[7] = DR7_FIXED_1;
     cpu_breakpoint_remove_all(s, BP_CPU);
-    cpu_watchpoint_remove_all(s, BP_CPU);
 
     cr4 = 0;
     xcr0 = XSTATE_FP_MASK;
@@ -6205,6 +6204,8 @@ static void x86_cpu_reset(DeviceState *dev)
     if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE) {
         cr4 |= CR4_FSGSBASE_MASK;
     }
+#else
+    cpu_watchpoint_remove_all(s, BP_CPU);
 #endif
 
     env->xcr0 = xcr0;
-- 
2.26.2


