Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C834555C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:11:43 +0100 (CET)
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWWE-0006V5-UD
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKo-0002jU-8E
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:54 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKm-0006tH-42
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464792; x=1648000792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sfsQvFdyL9uIj2kFXA8Blt8I893397xyP9rjOUZgGqk=;
 b=D+4z+4EAaQ4lE4hZt98bzr1UDjBnVu4c/AiSVtrUgsiSo4AI1wzuVLoI
 BWyQuS1xJKA3tovRsCorjPlxzBdPF4zxSWU91nfHzLbi3I4Fp6pFO7ScB
 pXpMvbV7Y4nZDyErWVLm7zYE47tGUW21DVurcQcdOqF4Zn8HbY3vvg5At
 5LSDf0CzmeOs43l6NdB+HFlSA86NRVC1HskY554xj17Iz84S28GKO5Bai
 bc5U4vxFgLFwtZ2tJACtU3eruA1nd2hBegAUPB502O3h5YkfrOZq306BS
 bOVaM4g6nOVzKUBI+hglK/u9wkMb1u/FiGlqMjDnxNcF0aopBzpQEf9dI g==;
IronPort-SDR: j+FSVy1+xpFpPgGByABNHVMak327o2fBZMdSA00caQkLB/7SLU/wMbEqlzbmy7Jr7Do7/TUb+P
 SImmd/GS3S8YM6FTsuZ8YuhtnSbZZ+NhNZiV+5jOpnJEwhbTziAPmUFkkL++e/QW8ZDeKDp1U7
 gaL21I0Gzj2OsXFvzDVVVVgbOxj3VBwcd0zvfxaPR4Fjt1qjSJj440AyFOnd/oELvaUH7ckwjC
 I7Mtv6/KTFYW/VTNQ7Dwb3L5Pp0gWwQlw/O2ChqTNXY1yBxXstnps32ayH4RfucXDjJk2KoiUp
 KDY=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707641"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:38 +0800
IronPort-SDR: 2BNtLHfn5cENSYzmTTmjallOYPN2cI6MNInbogh5QnbrJZrwqzkv2wauVEtPFOXKqQumHt+LIl
 MiYRDcdTzD08uQrPolsKHmidJpZkolxeITxoOevaNVfDWshbwGO+HDpefCMpd17wAS728RDJK1
 8NH/guKrgdbQJj+YjbgmZvBIL8x5PLPssCB6xLOHB8FxdkVDqzq6Y/o0d/8klyiajD8Y3V7qlP
 SgMRkkbAAkK/aOWCg0tB/AqKOY9pw7yLWBlssac/LQIpq6QsUhntswk+BvxPOj2NIlJ20YOc7o
 oXQVM1wGLh95SY0J8fbR3fRn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:46 -0700
IronPort-SDR: NWsLZ9d7143VTwAFBXlEWGzt4hWs03OLI17HO0/8A9uWueju8cwbYFcrTNZWXy++d9UlMRVRV4
 8qZ2JAl3ZH94kzheMk0PnwjFQ2ETwoZYoh7IuDloS+4//Zv/7vcfapP8cMeI/74qu6W1XUHall
 2p8LDZpOt1oU2X6xBj1jC/++riy5HmPo4Brfe8uOfMdQpm51UAkskm4yilCqlmBzDqXhY1BvcI
 QvLnkyKSGLdsTu32HhWUpvp8BbX2mHRVws1dQ1Uw9gHZfgcj8HdCNvKWC1dGV57TpW1Dv1imiM
 diA=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 11/16] target/riscv: Fix read and write accesses to vsip and
 vsie
Date: Mon, 22 Mar 2021 21:57:51 -0400
Message-Id: <20210323015756.3168650-12-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org, Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

The previous implementation was broken in many ways:
 - Used mideleg instead of hideleg to mask accesses
 - Used MIP_VSSIP instead of VS_MODE_INTERRUPTS to mask writes to vsie
 - Did not shift between S bits and VS bits (VSEIP <-> SEIP, ...)

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210311094738.1376795-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 68 +++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a9dba7f736..d2585395bf 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -749,30 +749,42 @@ static int write_sstatus(CPURISCVState *env, int csrno, target_ulong val)
     return write_mstatus(env, CSR_MSTATUS, newval);
 }
 
+static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
+{
+    /* Shift the VS bits to their S bit location in vsie */
+    *val = (env->mie & env->hideleg & VS_MODE_INTERRUPTS) >> 1;
+    return 0;
+}
+
 static int read_sie(CPURISCVState *env, int csrno, target_ulong *val)
 {
     if (riscv_cpu_virt_enabled(env)) {
-        /* Tell the guest the VS bits, shifted to the S bit locations */
-        *val = (env->mie & env->mideleg & VS_MODE_INTERRUPTS) >> 1;
+        read_vsie(env, CSR_VSIE, val);
     } else {
         *val = env->mie & env->mideleg;
     }
     return 0;
 }
 
-static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
 {
-    target_ulong newval;
+    /* Shift the S bits to their VS bit location in mie */
+    target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
+                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
+    return write_mie(env, CSR_MIE, newval);
+}
 
+static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
+{
     if (riscv_cpu_virt_enabled(env)) {
-        /* Shift the guests S bits to VS */
-        newval = (env->mie & ~VS_MODE_INTERRUPTS) |
-                 ((val << 1) & VS_MODE_INTERRUPTS);
+        write_vsie(env, CSR_VSIE, val);
     } else {
-        newval = (env->mie & ~S_MODE_INTERRUPTS) | (val & S_MODE_INTERRUPTS);
+        target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
+                              (val & S_MODE_INTERRUPTS);
+        write_mie(env, CSR_MIE, newval);
     }
 
-    return write_mie(env, CSR_MIE, newval);
+    return 0;
 }
 
 static int read_stvec(CPURISCVState *env, int csrno, target_ulong *val)
@@ -853,17 +865,25 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
+static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
+                    target_ulong new_value, target_ulong write_mask)
+{
+    /* Shift the S bits to their VS bit location in mip */
+    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
+                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
+    *ret_value &= VS_MODE_INTERRUPTS;
+    /* Shift the VS bits to their S bit location in vsip */
+    *ret_value >>= 1;
+    return ret;
+}
+
 static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
                    target_ulong new_value, target_ulong write_mask)
 {
     int ret;
 
     if (riscv_cpu_virt_enabled(env)) {
-        /* Shift the new values to line up with the VS bits */
-        ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value << 1,
-                      (write_mask & sip_writable_mask) << 1 & env->mideleg);
-        ret &= vsip_writable_mask;
-        ret >>= 1;
+        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
     } else {
         ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
                       write_mask & env->mideleg & sip_writable_mask);
@@ -1122,26 +1142,6 @@ static int write_vsstatus(CPURISCVState *env, int csrno, target_ulong val)
     return 0;
 }
 
-static int rmw_vsip(CPURISCVState *env, int csrno, target_ulong *ret_value,
-                    target_ulong new_value, target_ulong write_mask)
-{
-    int ret = rmw_mip(env, 0, ret_value, new_value,
-                      write_mask & env->mideleg & vsip_writable_mask);
-    return ret;
-}
-
-static int read_vsie(CPURISCVState *env, int csrno, target_ulong *val)
-{
-    *val = env->mie & env->mideleg & VS_MODE_INTERRUPTS;
-    return 0;
-}
-
-static int write_vsie(CPURISCVState *env, int csrno, target_ulong val)
-{
-    target_ulong newval = (env->mie & ~env->mideleg) | (val & env->mideleg & MIP_VSSIP);
-    return write_mie(env, CSR_MIE, newval);
-}
-
 static int read_vstvec(CPURISCVState *env, int csrno, target_ulong *val)
 {
     *val = env->vstvec;
-- 
2.30.1


