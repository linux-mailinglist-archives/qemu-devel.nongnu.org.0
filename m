Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B634DBA0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 22:51:26 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he41l-0002dH-EJ
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 16:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46374)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1he3xl-00011d-Ta
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:47:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1he3nE-0004nT-Sr
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:36:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1he3nE-0004lh-Jl
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 16:36:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 475D230F1BDE;
 Thu, 20 Jun 2019 20:36:20 +0000 (UTC)
Received: from localhost (ovpn-116-76.gru2.redhat.com [10.97.116.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA1D71001B05;
 Thu, 20 Jun 2019 20:36:19 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 20 Jun 2019 17:36:15 -0300
Message-Id: <20190620203616.22715-2-ehabkost@redhat.com>
In-Reply-To: <20190620203616.22715-1-ehabkost@redhat.com>
References: <20190620203616.22715-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 20 Jun 2019 20:36:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] i386: make cache structs const-safe
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code will be refactored and it will be useful to make it
const-safe to catch mistakes.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.h |  8 ++++----
 target/i386/cpu.c | 36 ++++++++++++++++++------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0732e059ec..2f03489bf0 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1109,10 +1109,10 @@ typedef struct CPUCacheInfo {
 
 
 typedef struct CPUCaches {
-        CPUCacheInfo *l1d_cache;
-        CPUCacheInfo *l1i_cache;
-        CPUCacheInfo *l2_cache;
-        CPUCacheInfo *l3_cache;
+    const CPUCacheInfo *l1d_cache;
+    const CPUCacheInfo *l1i_cache;
+    const CPUCacheInfo *l2_cache;
+    const CPUCacheInfo *l3_cache;
 } CPUCaches;
 
 typedef struct CPUX86State {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fbed2eb804..a6acd71911 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -205,7 +205,7 @@ struct CPUID2CacheDescriptorInfo cpuid2_cache_descriptors[] = {
  * Return a CPUID 2 cache descriptor for a given cache.
  * If no known descriptor is found, return CACHE_DESCRIPTOR_UNAVAILABLE
  */
-static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
+static uint8_t cpuid2_cache_descriptor(const CPUCacheInfo *cache)
 {
     int i;
 
@@ -249,7 +249,7 @@ static uint8_t cpuid2_cache_descriptor(CPUCacheInfo *cache)
 
 
 /* Encode cache info for CPUID[4] */
-static void encode_cache_cpuid4(CPUCacheInfo *cache,
+static void encode_cache_cpuid4(const CPUCacheInfo *cache,
                                 int num_apic_ids, int num_cores,
                                 uint32_t *eax, uint32_t *ebx,
                                 uint32_t *ecx, uint32_t *edx)
@@ -282,7 +282,7 @@ static void encode_cache_cpuid4(CPUCacheInfo *cache,
 }
 
 /* Encode cache info for CPUID[0x80000005].ECX or CPUID[0x80000005].EDX */
-static uint32_t encode_cache_cpuid80000005(CPUCacheInfo *cache)
+static uint32_t encode_cache_cpuid80000005(const CPUCacheInfo *cache)
 {
     assert(cache->size % 1024 == 0);
     assert(cache->lines_per_tag > 0);
@@ -312,8 +312,8 @@ static uint32_t encode_cache_cpuid80000005(CPUCacheInfo *cache)
  * Encode cache info for CPUID[0x80000006].ECX and CPUID[0x80000006].EDX
  * @l3 can be NULL.
  */
-static void encode_cache_cpuid80000006(CPUCacheInfo *l2,
-                                       CPUCacheInfo *l3,
+static void encode_cache_cpuid80000006(const CPUCacheInfo *l2,
+                                       const CPUCacheInfo *l3,
                                        uint32_t *ecx, uint32_t *edx)
 {
     assert(l2->size % 1024 == 0);
@@ -394,9 +394,9 @@ static int cores_in_core_complex(int nr_cores)
 }
 
 /* Encode cache info for CPUID[8000001D] */
-static void encode_cache_cpuid8000001d(CPUCacheInfo *cache, CPUState *cs,
-                                uint32_t *eax, uint32_t *ebx,
-                                uint32_t *ecx, uint32_t *edx)
+static void encode_cache_cpuid8000001d(const CPUCacheInfo *cache, CPUState *cs,
+                                       uint32_t *eax, uint32_t *ebx,
+                                       uint32_t *ecx, uint32_t *edx)
 {
     uint32_t l3_cores;
     assert(cache->size == cache->line_size * cache->associativity *
@@ -541,7 +541,7 @@ static void encode_topo_cpuid8000001e(CPUState *cs, X86CPU *cpu,
  */
 
 /* L1 data cache: */
-static CPUCacheInfo legacy_l1d_cache = {
+static const CPUCacheInfo legacy_l1d_cache = {
     .type = DATA_CACHE,
     .level = 1,
     .size = 32 * KiB,
@@ -554,7 +554,7 @@ static CPUCacheInfo legacy_l1d_cache = {
 };
 
 /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
-static CPUCacheInfo legacy_l1d_cache_amd = {
+static const CPUCacheInfo legacy_l1d_cache_amd = {
     .type = DATA_CACHE,
     .level = 1,
     .size = 64 * KiB,
@@ -568,7 +568,7 @@ static CPUCacheInfo legacy_l1d_cache_amd = {
 };
 
 /* L1 instruction cache: */
-static CPUCacheInfo legacy_l1i_cache = {
+static const CPUCacheInfo legacy_l1i_cache = {
     .type = INSTRUCTION_CACHE,
     .level = 1,
     .size = 32 * KiB,
@@ -581,7 +581,7 @@ static CPUCacheInfo legacy_l1i_cache = {
 };
 
 /*FIXME: CPUID leaf 0x80000005 is inconsistent with leaves 2 & 4 */
-static CPUCacheInfo legacy_l1i_cache_amd = {
+static const CPUCacheInfo legacy_l1i_cache_amd = {
     .type = INSTRUCTION_CACHE,
     .level = 1,
     .size = 64 * KiB,
@@ -595,7 +595,7 @@ static CPUCacheInfo legacy_l1i_cache_amd = {
 };
 
 /* Level 2 unified cache: */
-static CPUCacheInfo legacy_l2_cache = {
+static const CPUCacheInfo legacy_l2_cache = {
     .type = UNIFIED_CACHE,
     .level = 2,
     .size = 4 * MiB,
@@ -608,7 +608,7 @@ static CPUCacheInfo legacy_l2_cache = {
 };
 
 /*FIXME: CPUID leaf 2 descriptor is inconsistent with CPUID leaf 4 */
-static CPUCacheInfo legacy_l2_cache_cpuid2 = {
+static const CPUCacheInfo legacy_l2_cache_cpuid2 = {
     .type = UNIFIED_CACHE,
     .level = 2,
     .size = 2 * MiB,
@@ -618,7 +618,7 @@ static CPUCacheInfo legacy_l2_cache_cpuid2 = {
 
 
 /*FIXME: CPUID leaf 0x80000006 is inconsistent with leaves 2 & 4 */
-static CPUCacheInfo legacy_l2_cache_amd = {
+static const CPUCacheInfo legacy_l2_cache_amd = {
     .type = UNIFIED_CACHE,
     .level = 2,
     .size = 512 * KiB,
@@ -630,7 +630,7 @@ static CPUCacheInfo legacy_l2_cache_amd = {
 };
 
 /* Level 3 unified cache: */
-static CPUCacheInfo legacy_l3_cache = {
+static const CPUCacheInfo legacy_l3_cache = {
     .type = UNIFIED_CACHE,
     .level = 3,
     .size = 16 * MiB,
@@ -1423,10 +1423,10 @@ struct X86CPUDefinition {
     int stepping;
     FeatureWordArray features;
     const char *model_id;
-    CPUCaches *cache_info;
+    const CPUCaches *cache_info;
 };
 
-static CPUCaches epyc_cache_info = {
+static const CPUCaches epyc_cache_info = {
     .l1d_cache = &(CPUCacheInfo) {
         .type = DATA_CACHE,
         .level = 1,
-- 
2.18.0.rc1.1.g3f1ff2140


