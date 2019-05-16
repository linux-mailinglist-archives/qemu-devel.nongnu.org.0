Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80C720909
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 16:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58650 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRGzv-0005G3-DB
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 10:04:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bwiedemann@suse.de>) id 1hRFxr-0000Po-QD
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:58:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bwiedemann@suse.de>) id 1hRFxo-0003jE-OA
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:58:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:36814 helo=mx1.suse.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bwiedemann@suse.de>) id 1hRFxo-0003fs-Is
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:58:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0B6ABAA71
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 12:58:21 +0000 (UTC)
From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2019 14:58:07 +0200
Message-Id: <20190516125807.17025-1-bwiedemann@suse.de>
X-Mailer: git-send-email 2.16.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Thu, 16 May 2019 10:02:44 -0400
Subject: [Qemu-devel] [PATCH] i386: Fix nested SVM on older Opterons
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this patch, a VM on a Opteron G3 host will have the svm flag, but
the kvm-amd module fails to load in there, complaining that it needs
cpuid 0x8000000a

I have successfully built and tested this for 3+ years in production
on Opteron G3 servers.

Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
---
 target/i386/cpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 722c5514d4..df1d81ded8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -2723,7 +2723,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_EXT_SSE3,
         .features[FEAT_8000_0001_EDX] =
             CPUID_EXT2_LM | CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
-        .xlevel = 0x80000008,
+        .xlevel = 0x8000000A,
         .model_id = "AMD Opteron 240 (Gen 1 Class Opteron)",
     },
     {
@@ -2745,7 +2745,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
             CPUID_EXT2_LM | CPUID_EXT2_NX | CPUID_EXT2_SYSCALL,
         .features[FEAT_8000_0001_ECX] =
             CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM,
-        .xlevel = 0x80000008,
+        .xlevel = 0x8000000A,
         .model_id = "AMD Opteron 22xx (Gen 2 Class Opteron)",
     },
     {
@@ -2770,7 +2770,7 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .features[FEAT_8000_0001_ECX] =
             CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A |
             CPUID_EXT3_ABM | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM,
-        .xlevel = 0x80000008,
+        .xlevel = 0x8000000A,
         .model_id = "AMD Opteron 23xx (Gen 3 Class Opteron)",
     },
     {
-- 
2.16.4


