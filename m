Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CC11C4C9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 05:16:39 +0100 (CET)
Received: from localhost ([::1]:54130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifFu1-0003G8-Q6
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 23:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFf8-00012H-08
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ifFf6-0004PH-BY
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40326)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ifFf6-0004NY-3a
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 23:01:12 -0500
Received: by mail-pf1-x443.google.com with SMTP id q8so31380pfh.7
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 20:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moeX6cR2plwHGjOubTw0OffPZ6hPUqHTM5k0VKv1gGw=;
 b=TDGgw/3xuGO9TphHh/QVr5iDK4w0h4KERlMCD4CERBr/dM7KmfBcRCG39x0TPXRR/K
 xzV0nsU0MuspCcQUEOq+Tu6JXLt7G8GXeS7T/QQ/bgVip74sRNxFNSZHB2yWAALzxuOS
 ui6vOzS33Ig9B+pJtp0G0TpI4YZgDuJustfPdg0Y+cnELkF5KxZCzcpP26LGDnlgZ0Wv
 7gna/AQt9mbYaUQ6DTJjZD5yzzfgrbv+ch8RITVeyOlOlDA1E+mS43mQMnGgNalnkkmh
 JhJAvrQHjye8JD14ZvQI0aHVYR7ni2beffxDAMZOLSYh1SRb+1OLGL4xoARYN4kaMeRT
 H7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moeX6cR2plwHGjOubTw0OffPZ6hPUqHTM5k0VKv1gGw=;
 b=gF7uSbSQk90FmnZ+KEL7fKSHURvQ/pYT27VOLjRqrbvRp1zGpcinFqdznTornQs0Ch
 J+c9fpGRmiIpWcVJTxYmxITdSzeYiQlA1wOudXbNMgbjIdqdM1U0rh/wqPoOPaT2I9im
 dGmPR/D1WLh/1JG+e4imZr6lnevAe24E9OBR2nbRGWDrGtl0blQv2ST069sTq3pt+b2t
 TU/aypxYc7bZMt8xu8awusnxFDgZ4MyiXcaoziLZx1W2bQ9cC1f11gy8Akq74pwEjaQg
 t8HGB8m3CGZDgdmdyCkvkxU+X0iFnTOL7ncADQrbBTgzSCNgeYXKTDV0IN5Nb89CR4IM
 vUHQ==
X-Gm-Message-State: APjAAAWAOfn9pXT5v5JNhXJ1qbRGkol3uqLnqVFnCCEkOMPvvKfDy7Wd
 231EXBHbE2OUzkbPxbflDTcbRf35ods=
X-Google-Smtp-Source: APXvYqyTc6rNLJadYcckZcqM55/H5bDrupI7I088p4wWc1olfEvggkZLQH1FvQsbvQMjoHJA2K6MkA==
X-Received: by 2002:a63:d306:: with SMTP id b6mr7975228pgg.195.1576123270116; 
 Wed, 11 Dec 2019 20:01:10 -0800 (PST)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id z130sm4666391pgz.6.2019.12.11.20.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 20:01:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/28] target/m68k: Use cpu_*_mmuidx_ra instead of MMU_MODE{0,
 1}_SUFFIX
Date: Wed, 11 Dec 2019 20:00:34 -0800
Message-Id: <20191212040039.26546-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212040039.26546-1-richard.henderson@linaro.org>
References: <20191212040039.26546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generated *_user functions are unused.  The *_kernel functions
have a couple of users in op_helper.c; use *_mmuidx_ra instead,
with MMU_KERNEL_IDX.

Cc: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h       | 2 --
 target/m68k/op_helper.c | 5 +++++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 20de3c379a..89af14e899 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -516,8 +516,6 @@ enum {
 #define cpu_list m68k_cpu_list
 
 /* MMU modes definitions */
-#define MMU_MODE0_SUFFIX _kernel
-#define MMU_MODE1_SUFFIX _user
 #define MMU_KERNEL_IDX 0
 #define MMU_USER_IDX 1
 static inline int cpu_mmu_index (CPUM68KState *env, bool ifetch)
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index bc4f845e3f..96a4951c21 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -36,6 +36,11 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
 
 #else
 
+#define cpu_lduw_kernel(e, p)    cpu_lduw_mmuidx_ra(e, p, MMU_KERNEL_IDX, 0)
+#define cpu_ldl_kernel(e, p)     cpu_ldl_mmuidx_ra(e, p, MMU_KERNEL_IDX, 0)
+#define cpu_stw_kernel(e, p, v)  cpu_stw_mmuidx_ra(e, p, v, MMU_KERNEL_IDX, 0)
+#define cpu_stl_kernel(e, p, v)  cpu_stl_mmuidx_ra(e, p, v, MMU_KERNEL_IDX, 0)
+
 static void cf_rte(CPUM68KState *env)
 {
     uint32_t sp;
-- 
2.20.1


