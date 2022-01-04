Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC5484213
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:07:48 +0100 (CET)
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jXW-0004D3-PU
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:07:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jSJ-0007jA-73; Tue, 04 Jan 2022 08:02:23 -0500
Received: from [2a00:1450:4864:20::32f] (port=41771
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4jSH-0003YQ-95; Tue, 04 Jan 2022 08:02:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 b186-20020a1c1bc3000000b00345734afe78so1409173wmb.0; 
 Tue, 04 Jan 2022 05:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q7ES0GF02cXzslgykTZ9t4FabduIAKBz+ch9l0nNhZQ=;
 b=NSO/s+bxDzTWvPPsjlZ+YB+b7WNjFufOHyZR1aKS+EW7FfmIv0mPsVAdWnujvgV4DQ
 zbC7MCdPTSgc9cLD3rRyUdFoU7lOOXytHrHbAtSzT9dTFGkxNTcjb1HBAoooeBDHazVh
 DARs1bqAFQP2mTNEdKqeDUXL7fbuy0BI9nrXSqcd/YcGKMAdjy5WcVUJlK7cJYPr+7zO
 seMWUEoli17l0CUOvhvzTA6j3HbCTDQMZsYkXm0VfjWKvzDdXnO9I+Wu37Ymy1Y8ph6R
 6QwKN5s3CvIWtUhDzZkYlMOKDDkNGDYjV9ctdR+G710YLI8/H5K/52xyb0D9L+TvR2p3
 aTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Q7ES0GF02cXzslgykTZ9t4FabduIAKBz+ch9l0nNhZQ=;
 b=nFeYw/K1lv5Q6E4IEJD/mUbUW3p4FsqzMlsBsNCkRPrvbzls40coxgBNhgLqyj4ihe
 bGh0XgqkOe8ghkLxE4k8BuohDkXth/zyM7CrLHTma+wPCphOLLn2zPMTMLVZfNpDhMNs
 N2wj57SLBYKRuWQxFz1PAeqj/HHBqq9TInWQvL85bhutxnpEMpGMnITVXrrmhPsb8yuS
 JLwjbD42bt2Kf13csr4SUe/EA4ynmkf4qCnXS48UrjuSU11NDQMZXRkMKgCHzYC3M3Om
 QLnEGoiUFzOmAqYRVhbqsi9YzmSsgRPFPyNlYfysP3wVMYBNKgGve/Se2r6AaRoqvEQ2
 ukPg==
X-Gm-Message-State: AOAM530RC/sXjSaSMoPwWmvrN37soUulqLnIiLEKrT7pvSOs9eAkL8RN
 8PB+xn9qydGPvAM4CnFVZPAPseasV2Y=
X-Google-Smtp-Source: ABdhPJxsEKjdqFJTiT/nXDncszfyzuHfYvUUoneVi4O9kULm0dJaesf/ER3NUo8d9PnlN5yjXTfnHQ==
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr35883542wmq.19.1641301339383; 
 Tue, 04 Jan 2022 05:02:19 -0800 (PST)
Received: from x1w.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id p15sm35685916wmj.46.2022.01.04.05.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 05:02:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Fix trivial build error on loongarch64
Date: Tue,  4 Jan 2022 14:02:17 +0100
Message-Id: <20220104130217.2144929-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building using GCC 8.3.0 on loongarch64 (Loongnix) we get:

  In file included from ../linux-user/signal.c:33:
  ../linux-user/host/loongarch64/host-signal.h: In function ‘host_signal_write’:
  ../linux-user/host/loongarch64/host-signal.h:57:9: error: a label can only be part of a statement and a declaration is not a statement
         uint32_t sel = (insn >> 15) & 0b11111111111;
         ^~~~~~~~

We don't use the 'sel' variable more than once, so drop it.

Meson output for the record:

  Host machine cpu family: loongarch64
  Host machine cpu: loongarch64
  C compiler for the host machine: cc (gcc 8.3.0 "cc (Loongnix 8.3.0-6.lnd.vec.27) 8.3.0")
  C linker for the host machine: cc ld.bfd 2.31.1-system

Fixes: ad812c3bd65 ("linux-user: Implement CPU-specific signal handler for loongarch64 hosts")
Reported-by: Song Gao <gaosong@loongson.cn>
Suggested-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/host/loongarch64/host-signal.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/linux-user/host/loongarch64/host-signal.h b/linux-user/host/loongarch64/host-signal.h
index 05e2c823717..7effa242515 100644
--- a/linux-user/host/loongarch64/host-signal.h
+++ b/linux-user/host/loongarch64/host-signal.h
@@ -54,9 +54,7 @@ static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
         }
         break;
     case 0b001110: /* indexed, atomic, bounds-checking memory operations */
-        uint32_t sel = (insn >> 15) & 0b11111111111;
-
-        switch (sel) {
+        switch ((insn >> 15) & 0b11111111111) {
         case 0b00000100000: /* stx.b */
         case 0b00000101000: /* stx.h */
         case 0b00000110000: /* stx.w */
-- 
2.33.1


