Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E765B8950
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 15:42:55 +0200 (CEST)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYSfG-000430-QN
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 09:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMH-0007zE-PD
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:18 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYSMG-0000an-3y
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 09:23:17 -0400
Received: by mail-wr1-x431.google.com with SMTP id bj14so25650939wrb.12
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=C+e+mVoscBWQrZpSL5BUOyirKvbRFo9Wu/wSgD1UkkU=;
 b=qvLhzmQ0Bb6I8ahjOwVaUusGAhHQ1kLqQ32dBJty4R/nVYVrHWsLKlD+icT3/nfUzr
 /bhQNcT/7ySLQaON3jnjDWIUlx8V/XwrZ3xN7O1e7DT7UmBvw0+DCQCIFX0tqU84RP3A
 ZKGnjl1K64QN60W341krE8gP3JCIIpG8YqigCdu8cdDfBmpivfuniuBKQPUS+bco2uUx
 xu5r8URtQA+YwYNN5JA6f+e7iMzmBwmYKb7wuDigS3abCAb0DRiIvZKtzHT40IMLzMK5
 RMG4dX2H6PpuOCXh5G14mUhdvig0e1aeHEMUEZNmKiXHYWNadOpCHTUxhf5Evujsp8P6
 +UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=C+e+mVoscBWQrZpSL5BUOyirKvbRFo9Wu/wSgD1UkkU=;
 b=D0aseul52V3qJ92QDmwqXdBiy0FDTsGGxd1DJ2+O/wMzRbJPHHz9ZP+SO0H1aq4sAg
 oJRxI09bcvcSfCZHOoWNgzku53ewD4fXVtXljocaKZ94uR7x1H3sVdbw9bl93QRxyIhK
 orE3/zlRHicDTY9hklneFGScZD6DHQDmhI3NNrSfkI+Qy6uIa/AkWjWu/VWwWSUQLVcK
 7rlyLMcBj3vremdFqgoXTfXEG4goSIApn2jfHgcLYiGP1D8myo+NKNhzNMRWMt5BaKCx
 sBLqsZYHzyV3sdVOTJSwVgw6xuZ2TiilCRZhThT7reEaj9Un/Yz27I0HbKJwv8NIsDnF
 bweQ==
X-Gm-Message-State: ACgBeo294P7uaEcSbpK4PCwQn2ab3+vQH9n6kQsQIfuxX+NyrfStVyGl
 9HJVBfU3WvqFlsUgQSVdfnXCryAWDtguGLQQ
X-Google-Smtp-Source: AA6agR70dk1sYcyIodiTOkJA9br9W6Ddm7cn615wz+9gwSn0qq9V3gRfKp5nDiu/kI7nDlJPVMZOGQ==
X-Received: by 2002:a05:6000:508:b0:22a:c5fd:1334 with SMTP id
 a8-20020a056000050800b0022ac5fd1334mr2574841wrf.636.1663161794432; 
 Wed, 14 Sep 2022 06:23:14 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 p15-20020a5d48cf000000b00226dedf1ab7sm13768244wrs.76.2022.09.14.06.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 06:23:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 04/11] target/m68k: Convert semihosting errno to gdb remote
 errno
Date: Wed, 14 Sep 2022 14:23:01 +0100
Message-Id: <20220914132308.118495-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914132308.118495-1-richard.henderson@linaro.org>
References: <20220914132308.118495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The semihosting abi used by m68k uses the gdb remote
protocol filesys errnos.

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/m68k-semi.c | 33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 586a801034..87b1314925 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -41,6 +41,35 @@
 #define HOSTED_ISATTY 12
 #define HOSTED_SYSTEM 13
 
+static int host_to_gdb_errno(int err)
+{
+#define E(X)  case E##X: return GDB_E##X
+    switch (err) {
+    E(PERM);
+    E(NOENT);
+    E(INTR);
+    E(BADF);
+    E(ACCES);
+    E(FAULT);
+    E(BUSY);
+    E(EXIST);
+    E(NODEV);
+    E(NOTDIR);
+    E(ISDIR);
+    E(INVAL);
+    E(NFILE);
+    E(MFILE);
+    E(FBIG);
+    E(NOSPC);
+    E(SPIPE);
+    E(ROFS);
+    E(NAMETOOLONG);
+    default:
+        return GDB_EUNKNOWN;
+    }
+#undef E
+}
+
 static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 {
     M68kCPU *cpu = M68K_CPU(cs);
@@ -48,7 +77,7 @@ static void m68k_semi_u32_cb(CPUState *cs, uint64_t ret, int err)
 
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret, args) ||
-        put_user_u32(err, args + 4)) {
+        put_user_u32(host_to_gdb_errno(err), args + 4)) {
         /*
          * The m68k semihosting ABI does not provide any way to report this
          * error to the guest, so the best we can do is log it in qemu.
@@ -67,7 +96,7 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
     target_ulong args = env->dregs[1];
     if (put_user_u32(ret >> 32, args) ||
         put_user_u32(ret, args + 4) ||
-        put_user_u32(err, args + 8)) {
+        put_user_u32(host_to_gdb_errno(err), args + 8)) {
         /* No way to report this via m68k semihosting ABI; just log it */
         qemu_log_mask(LOG_GUEST_ERROR, "m68k-semihosting: return value "
                       "discarded because argument block not writable\n");
-- 
2.34.1


