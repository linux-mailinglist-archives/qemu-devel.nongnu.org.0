Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA04871C2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 05:30:08 +0100 (CET)
Received: from localhost ([::1]:47668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5gtD-0007zf-Tg
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 23:30:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpM-00048q-Vc
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:09 -0500
Received: from [2607:f8b0:4864:20::102c] (port=36483
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5gpH-0005PU-En
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 23:26:08 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so10778686pjd.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 20:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=22dZO2BY6p2NKeW0++NNOfZ5ea4EcJKmG2/pGJig100=;
 b=bvj51drLCM6F3xP+PgHHFU3EQNqhCkABvsiVNp1e8s168Ke24aK768qnBuzykCaBZA
 t5dzNS4VH9C2H/fHVpaVVv96ac3JA8G40uUb3+7ZjZhX+bvoHBRc5Ki+nA1IERLV0EMp
 kJ3Y+ifpjfHK59KyC0YgdXH5X104rJYOEbDdZiS9dqT+OeeyzrFb1XuZgLi0p/AbaeE3
 aUFhL0g2p261zVbKQdrdXOt1KdoUFNjPxYPMemsJQ6Tbn/f49NBUP1neFH7MzNJIa7/H
 w/rbNgSMmKxVFFWB0bsRR/Oo+/WNSJGpOwMtxxxM1wmgNDKO9pC2/p4aj3uI5LHrIgO0
 PGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22dZO2BY6p2NKeW0++NNOfZ5ea4EcJKmG2/pGJig100=;
 b=uOLKVpMM9YYM89bAkKnL4uuNoql7lfPHhQwP3pA0qRvjKom48fxQKYUWQk11LB/2uB
 RafU1zCk3x+i8pbNCaam2q3ssnWFJI73KRhFhw8a8JZ8GjRTcndRnZewwRKRILo9SWrZ
 shbUgXIAAh+7VKjR63ERWCsAbjAWi9Ky99wTPUEiQVwxZ8RRNXCkFZwfnDYSW+iKCBU3
 zZ0FFRj8xXAfYS3M74LWBzeQDNxotUhcTsn7CtMjnr2y7M14keIOD6LEhYwJsPCWa8NR
 LpRAeOHL9SpCHauNyO70Wq2+tUrF0AZRsFrwei4X5ykeMu2WiAwSsXFp7s12CG+WS/QS
 7XIw==
X-Gm-Message-State: AOAM533+J72gvurm/RgX93FRAqXfMfAgnlc8fnCFoF3B2YHO3jflt+YD
 FPax4wpOExoMe7MM8ldTziEMuQYDTGNJ9w==
X-Google-Smtp-Source: ABdhPJyBJVBJIvOTekjPUajollOnF+0RrIE5bADi26E6nOs+4TPBQBCeTnkFS787anotlFN8oy0DjQ==
X-Received: by 2002:a17:90a:ec08:: with SMTP id
 l8mr942535pjy.103.1641529561979; 
 Thu, 06 Jan 2022 20:26:01 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e4sm1396862pjr.40.2022.01.06.20.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 20:26:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user/arm: Move target_oabi_flock64 out of
 target_structs.h
Date: Thu,  6 Jan 2022 20:25:59 -0800
Message-Id: <20220107042600.149852-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107042600.149852-1-richard.henderson@linaro.org>
References: <20220107042600.149852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: gaosong@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Place it next to copy_from/to_user_oabi_flock64, the only users,
inside the existing target-specific ifdef.  This leaves only
generic ipc structs in target_structs.h.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/arm/target_structs.h | 8 --------
 linux-user/syscall.c            | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux-user/arm/target_structs.h b/linux-user/arm/target_structs.h
index 339b070bf1..25bf8dd3a5 100644
--- a/linux-user/arm/target_structs.h
+++ b/linux-user/arm/target_structs.h
@@ -48,12 +48,4 @@ struct target_shmid_ds {
     abi_ulong __unused4;
     abi_ulong __unused5;
 };
-
-struct target_oabi_flock64 {
-    abi_short l_type;
-    abi_short l_whence;
-    abi_llong l_start;
-    abi_llong l_len;
-    abi_int   l_pid;
-} QEMU_PACKED;
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ce9d64896c..ca6e0b8fb0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6927,6 +6927,14 @@ typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
 typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
 
 #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
+struct target_oabi_flock64 {
+    abi_short l_type;
+    abi_short l_whence;
+    abi_llong l_start;
+    abi_llong l_len;
+    abi_int   l_pid;
+} QEMU_PACKED;
+
 static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
                                                    abi_ulong target_flock_addr)
 {
-- 
2.25.1


