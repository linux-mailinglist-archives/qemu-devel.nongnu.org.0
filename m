Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5F400DB1
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:19:05 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfsG-0001SA-Ol
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfeE-0000TV-LD
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 20:04:34 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfeC-0004Da-P3
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 20:04:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so2125249wml.3
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 17:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GbEUXgSj5zJThn7W+1y+EWJV7fbOPPsHPqX4FHh3ps4=;
 b=S+YTa+U4FcB2U7m4g5/p8BwPo2ARiFA2SGtKGSw2XIdzewpwUeYrbvfv3pOKZXOyd5
 NN5UDLDxjYYb7kaWLdPNL0ylw0Tz5pPZSNElvuS24AwcQb+r6b3LlVRNgIdwepfCktl6
 poLs3PQc97sW4K2pZNsylaasOnWhY7mBQOnY4KQNcOqwaplhRgOq6NM7RhJQiaatgkwk
 PB5raNZuCSqLvP3MkCkhnFM9GSExEVFe2bljRG0pGrCcIOAw3VjAq/yBpSiDnxTetTDF
 1vmlzjLKrPhAVJeQ3bZ1PVKTlT8SAsKByN7YS0lVf1r/tY0fJdWteaDaZJgPUv3ECEfJ
 9Fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GbEUXgSj5zJThn7W+1y+EWJV7fbOPPsHPqX4FHh3ps4=;
 b=gHwlrJ1/V6KVG5hHS+kRsy623gtb5mJ7RqegdoZz2PgU2BsxsZ8m1CroQuMFI9Ojwt
 QiWuEshkzrCdN4M4q793IRWop4fN9LJULwEniLOJUqLkT3VKGz4HuKra6T9DWA7JYxiM
 rxcTk6N8p7RlRx2tdyLQ7Z4kHvHNdGW6sX1eWvX7jk4Vum49lOs76CKzt+UB0wzT9iIm
 8R/KuCRWgNjmVluC7/99k+3+i8DCc1P71egHbBlSQwhhGm+2c2F8dYMNn6d6VpVGBg1w
 /4N0wueHKmOsGicn39vzQ3tx9yRW+fCus+6CmKiFNJzoflHp/dgcsR1zjLtdpvGWikwP
 Ad8Q==
X-Gm-Message-State: AOAM530ELz8Upkm6PStJS4JS+JuBRiigbA2oBZQzzoqmWAozUBOWy38h
 iFrPzt/bM3iooLZ+eKGP8sRvMhfHhkc=
X-Google-Smtp-Source: ABdhPJzaZvoaq7SMPHFhD+0aMk6oopU1/LjMpMq51UpaPgYZAulfNQD2VEGPckO7PRD9oQcvWOhmvg==
X-Received: by 2002:a05:600c:414f:: with SMTP id
 h15mr4954287wmm.124.1630800270795; 
 Sat, 04 Sep 2021 17:04:30 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n4sm3997799wro.81.2021.09.04.17.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 17:04:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] user: Mark cpu_loop() with noreturn attribute
Date: Sun,  5 Sep 2021 02:04:29 +0200
Message-Id: <20210905000429.1097336-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_loop() never exits, so mark it with QEMU_NORETURN.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h   | 2 +-
 linux-user/qemu.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index c02e8a5ca1a..05bee7aefe5 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -155,7 +155,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg5, abi_long arg6);
 void gemu_log(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
 extern THREAD CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 char *target_strerror(int err);
 int get_osversion(void);
 void fork_start(void);
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 3b0b6b75fe8..5b2c764ae78 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -236,7 +236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
 extern __thread CPUState *thread_cpu;
-void cpu_loop(CPUArchState *env);
+void QEMU_NORETURN cpu_loop(CPUArchState *env);
 const char *target_strerror(int err);
 int get_osversion(void);
 void init_qemu_uname_release(void);
-- 
2.31.1


