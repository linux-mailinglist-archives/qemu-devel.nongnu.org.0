Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4F453B7B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:10:37 +0100 (CET)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn5iu-0000Ep-FM
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:10:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mn5hk-0007zm-Ub
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:09:25 -0500
Received: from [2a00:1450:4864:20::433] (port=40452
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mn5hi-0008SP-Pd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:09:24 -0500
Received: by mail-wr1-x433.google.com with SMTP id r8so335430wra.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 13:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HndYVReWIUPiDjuTpxIgnOeDpDWe0+zbiF/pZZyFl8k=;
 b=quDMH9wdn07MoKsxHQlsJbcvfKzOZheEPlL8p5x1HZsucggRWJCxPcjgaPWNgERGoI
 NIlyT2pUhi1PCsEE9zxMHOm/UJ0udhtsWb79vjWSpEVhw1pvIfh7IhGE+MhjSWJqhgYV
 WAVKrx69tUPCo+2ggjtCZHkYzwdajrwKU+BSaIhLtEGC+hABP21gCrAz06R8pK+q6ZSX
 /rYCV73oxqV5SFkj6TxBz6Tc+y7fJVTG+Xm1sOhz3oQg2V2quKk8LoYwYemPROiYvr5g
 BIG5ibhIf/3xgJHoaS6tmURLD2LZJw3E1YrLe5tBcUe5SAT1PaZWE3oAZvgiyOkrobR5
 k5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=HndYVReWIUPiDjuTpxIgnOeDpDWe0+zbiF/pZZyFl8k=;
 b=wLS2/EJ1FwGWSjEyXs3y52BN38nYdtwj4J2O7vaTWyroqIl+Mb/JIMbDqkLUQnd8hm
 kq2kb2X0QoCjkPN68AMtkXhbil16NCvKcbTG2Mn3iFCZ8RaU9A83jq1TN8nSj6xRKA9q
 OlLQmhxqZjExiziJpnxOtsJhHWqdRP9JWj9Pc2ABc2u7m0tEPhGV+5sz5KgLuas4+axM
 B4Cjjx7N36oF2JA2GLmY3LDhbEwKsY2law34sHSgGSajSoE+X0rN6/Fb43CIA5mGr0sK
 sJlKJIFsFky3XkE3huPebjRZiCahxf9z3w8cb+LC3kNLgWcbpVCMlwtVH736m/Ddq11X
 TAbQ==
X-Gm-Message-State: AOAM5314gizluXRq0Dj2r8M4dBKX0UYu2TfAceH0hClGV9yf2XfUf1cX
 7vBq5Uyyb/xuBCB8aotFdxopIvBd+/k=
X-Google-Smtp-Source: ABdhPJwNwFBIw9htH/UUi1+UkFiuk89A51sK5Jd2bALg9f3J0ZRXprttlIqwjj1F3Yn1ESCFbDFIlQ==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr13014394wrn.349.1637096961033; 
 Tue, 16 Nov 2021 13:09:21 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h22sm4034319wmq.14.2021.11.16.13.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 13:09:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Date: Tue, 16 Nov 2021 22:09:19 +0100
Message-Id: <20211116210919.2823206-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux Hexagon port doesn't define a specific 'struct stat'
but uses the generic one (see Linux commit 6103ec56c65c [*]
"asm-generic: add generic ABI headers" which predates the
introduction of the Hexagon port).

Remove the target specific target_stat (which in fact is the
target_stat64 structure but uses incorrect target_long and
ABI unsafe long long types) and use the generic target_stat64
instead.

[*] https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall_defs.h | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index a5ce487dcc3..7ab612d163b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -2129,7 +2129,8 @@ struct target_stat64  {
     abi_ulong __unused5;
 };
 
-#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TARGET_RISCV)
+#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
+        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
 
 /* These are the asm-generic versions of the stat and stat64 structures */
 
@@ -2240,31 +2241,6 @@ struct target_stat64 {
     uint64_t   st_ino;
 };
 
-#elif defined(TARGET_HEXAGON)
-
-struct target_stat {
-    unsigned long long st_dev;
-    unsigned long long st_ino;
-    unsigned int st_mode;
-    unsigned int st_nlink;
-    unsigned int st_uid;
-    unsigned int st_gid;
-    unsigned long long st_rdev;
-    target_ulong __pad1;
-    long long st_size;
-    target_long st_blksize;
-    int __pad2;
-    long long st_blocks;
-
-    target_long target_st_atime;
-    target_long target_st_atime_nsec;
-    target_long target_st_mtime;
-    target_long target_st_mtime_nsec;
-    target_long target_st_ctime;
-    target_long target_st_ctime_nsec;
-    int __unused[2];
-};
-
 #else
 #error unsupported CPU
 #endif
-- 
2.31.1


