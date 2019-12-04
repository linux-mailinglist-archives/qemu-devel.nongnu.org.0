Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E98112982
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 11:48:27 +0100 (CET)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icSCo-0003oc-OP
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 05:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ani.sinha@nutanix.com>) id 1icRAw-00016I-Uj
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ani.sinha@nutanix.com>) id 1icRAo-00011Z-2L
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:42:19 -0500
Received: from [192.146.154.1] (port=3936 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ani.sinha@nutanix.com>) id 1icRAn-0000oC-P5
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 04:42:17 -0500
Received: from ani-devvm.user.nutanix.com (ani-sinha.user.nutanix.com
 [10.4.194.34])
 by mcp01.nutanix.com (Postfix) with ESMTP id E943610074C4;
 Wed,  4 Dec 2019 09:36:32 +0000 (UTC)
From: Ani Sinha <ani.sinha@nutanix.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] i386: pass CLZERO to guests with EPYC CPU model on AMD ZEN
 platform
Date: Wed,  4 Dec 2019 01:36:30 -0800
Message-Id: <1575452190-105002-1-git-send-email-ani.sinha@nutanix.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <yes>
References: <yes>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.146.154.1
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
Cc: Ani Sinha <ani.sinha@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CLZERO CPUID should be passed on to the guests that use EPYC or EPYC-IBPB CPU
model when the AMD ZEN based host supports it. This change makes it recognize
this CPUID for guests which use EPYC or EPYC-IBPB CPU model.

Signed-off-by: Ani Sinha <ani.sinha@nutanix.com>
---
 target/i386/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 69f518a..55f0691 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3813,6 +3813,8 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A | CPUID_EXT3_ABM |
             CPUID_EXT3_CR8LEG | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM |
             CPUID_EXT3_TOPOEXT,
+        .features[FEAT_8000_0008_EBX] =
+            CPUID_8000_0008_EBX_CLZERO,
         .features[FEAT_7_0_EBX] =
             CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
             CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
-- 
1.9.4


