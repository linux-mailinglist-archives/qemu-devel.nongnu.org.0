Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B74F1769C0
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 02:01:17 +0100 (CET)
Received: from localhost ([::1]:40512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8vvw-0007wu-Kg
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 20:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkV-0001dg-Qy
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j8vkU-0004JY-Pm
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:27 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j8vkU-0004J6-Jp
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 19:49:26 -0500
Received: by mail-pf1-x42a.google.com with SMTP id q9so559779pfs.5
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 16:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=T6T0TH00iuu/lbxZkL6qr//GeBoSN6TEkkKvvhFc4Gk=;
 b=Xcir3SV3XYPFIKFfijsp7ob8Eu3Q8lLIJQuIKolDD+jnuzg2V5yQCuWLPJVYBShuIS
 3Cy6yrPWe0NLsccLJKDLoV0bnr0rkF/O1vJh+Azv6xwgvKMxqd3vN4QLjBPfQZ+4Yhpc
 UA33oKwQJasll73LeW1WclzmFoQk5WOKit6wVKBrrVfEgWQBMfjX9oGxHgkeQpvaARGI
 MwGPDomW70wk3L1IxHM5f3zIt2tVvahdhiKEIGCvnSVL4UhNvSYICYIU5JAFScJ+qmxY
 YP42rPKtJo78gpv+4khtARg0RbCLM5WYfgmsGp179pIh3NlJ9WZ58vsD2pr9O57uZgGc
 a3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=T6T0TH00iuu/lbxZkL6qr//GeBoSN6TEkkKvvhFc4Gk=;
 b=LgqpW6J9u55kqZddtP3N1NZWyv8DYgXvRXFDpOL4wNW8UJi8dqfcLUdYxHm9EXi89L
 Xok4zAeO/UrB4Hk9pw+1Voxvd5Ce++bUSW7t4UL6G4ZTQRK6IP1ivHMsuBc1SPqmKQec
 Cle1rhFgp7FqGoTvefymqSXRByy5HGBbNNWbdRtnAkeDoIDJFBaIuJIlQmrHKGjaWQjt
 Sv8Q1HVLOlKG7Y5CUKW4Y//lgMu5hUKSEOPyrvL4zf3PznfbHjt/BZWdEYKaMw3UUJTy
 9ro7gd1G7wkQkFgmcFl9I+n7n+1jwy0mWLgGIMOMfCIPhqAcHiCkWSyJkWCzMn8AzZEP
 rphA==
X-Gm-Message-State: ANhLgQ39nilPN4nggK6uYyx/3Qk5IFr6mRllJ3T+thaYl+xApOXDRwdn
 7TmolqhusQ6rMTZ0Axj2lh6Ejw==
X-Google-Smtp-Source: ADFU+vsMFedByMSjgsn4B1pfm9bu30AF6cPs7U72zXGm93wpWpBacJiVrgqqsfXwMmlgNcsMVMRnBw==
X-Received: by 2002:aa7:85d8:: with SMTP id z24mr1675019pfn.202.1583196565535; 
 Mon, 02 Mar 2020 16:49:25 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id az17sm108552pjb.18.2020.03.02.16.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 16:49:25 -0800 (PST)
Subject: [PULL 16/38] target/riscv: Extend the MIE CSR to support virtulisation
Date: Mon,  2 Mar 2020 16:48:26 -0800
Message-Id: <20200303004848.136788-17-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
References: <20200303004848.136788-1-palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42a
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/csr.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c0e942684d..918678789a 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -244,8 +244,10 @@ static int read_timeh(CPURISCVState *env, int csrno, target_ulong *val)
 #define S_MODE_INTERRUPTS  (MIP_SSIP | MIP_STIP | MIP_SEIP)
 #define VS_MODE_INTERRUPTS (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP)
 
-static const target_ulong delegable_ints = S_MODE_INTERRUPTS;
-static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS;
+static const target_ulong delegable_ints = S_MODE_INTERRUPTS |
+                                           VS_MODE_INTERRUPTS;
+static const target_ulong all_ints = M_MODE_INTERRUPTS | S_MODE_INTERRUPTS |
+                                     VS_MODE_INTERRUPTS;
 static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_INST_ADDR_MIS)) |
     (1ULL << (RISCV_EXCP_INST_ACCESS_FAULT)) |
@@ -630,13 +632,27 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
 
 static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
 {
-    *val = env->mie & env->mideleg;
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Tell the guest the VS bits, shifted to the S bit locations */
+        *val = (env->mie & env->mideleg & VS_MODE_INTERRUPTS) >> 1;
+    } else {
+        *val = env->mie & env->mideleg;
+    }
     return 0;
 }
 
 static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg);
+    target_ulong newval;
+
+    if (riscv_cpu_virt_enabled(env)) {
+        /* Shift the guests S bits to VS */
+        newval = (env->mie & ~VS_MODE_INTERRUPTS) |
+                 ((val << 1) & VS_MODE_INTERRUPTS);
+    } else {
+        newval = (env->mie & ~S_MODE_INTERRUPTS) | (val & S_MODE_INTERRUPTS);
+    }
+
     return write_mie(env, CSR_MIE, newval);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


