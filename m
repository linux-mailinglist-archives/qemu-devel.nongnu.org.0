Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137AE27071E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 22:32:42 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJN3h-0001rm-44
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 16:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJMzP-0006ZJ-4d
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kJMzJ-0003pw-V5
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 16:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600460888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3mAXCDiBM7Mu4NasAcidPwOPQiozJhoXxw5OZiT0HY=;
 b=HlOpRgZmWYdsVWWNaj5uXlcg7tfzS/UgQ5L3z2iUZPLPs3/tC57wU+rUWQ0tfRUWQ1xDEK
 BJHl5sru1AVRR0ZIhjosjzYyTDa1FyMAuKICT3jvWpxL/ZOFqyiJ5YmBk6gByFpoWBpHXp
 TcwJLUr9zG+xU8CAymS7kDtbPgYc52E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-Wwz9emxlOK-IGjRrlGiM2g-1; Fri, 18 Sep 2020 16:28:06 -0400
X-MC-Unique: Wwz9emxlOK-IGjRrlGiM2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25B6B800C78;
 Fri, 18 Sep 2020 20:28:05 +0000 (UTC)
Received: from localhost (unknown [10.10.67.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E08D75C26C;
 Fri, 18 Sep 2020 20:28:01 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/4] i386: Simplify CPUID_8000_001d for AMD
Date: Fri, 18 Sep 2020 16:27:49 -0400
Message-Id: <20200918202750.10358-4-ehabkost@redhat.com>
In-Reply-To: <20200918202750.10358-1-ehabkost@redhat.com>
References: <20200918202750.10358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 00:20:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Babu Moger <babu.moger@amd.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

Remove all the hardcoded values and replace with generalized
fields.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <159897584649.30750.3939159632943292252.stgit@naples-babu.amd.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 37725bd354..52694a4198 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -395,11 +395,12 @@ static int cores_in_core_complex(int nr_cores)
 }
 
 /* Encode cache info for CPUID[8000001D] */
-static void encode_cache_cpuid8000001d(CPUCacheInfo *cache, CPUState *cs,
-                                uint32_t *eax, uint32_t *ebx,
-                                uint32_t *ecx, uint32_t *edx)
+static void encode_cache_cpuid8000001d(CPUCacheInfo *cache,
+                                       X86CPUTopoInfo *topo_info,
+                                       uint32_t *eax, uint32_t *ebx,
+                                       uint32_t *ecx, uint32_t *edx)
 {
-    uint32_t l3_cores;
+    uint32_t l3_threads;
     assert(cache->size == cache->line_size * cache->associativity *
                           cache->partitions * cache->sets);
 
@@ -408,10 +409,10 @@ static void encode_cache_cpuid8000001d(CPUCacheInfo *cache, CPUState *cs,
 
     /* L3 is shared among multiple cores */
     if (cache->level == 3) {
-        l3_cores = cores_in_core_complex(cs->nr_cores);
-        *eax |= ((l3_cores * cs->nr_threads) - 1) << 14;
+        l3_threads = topo_info->cores_per_die * topo_info->threads_per_core;
+        *eax |= (l3_threads - 1) << 14;
     } else {
-        *eax |= ((cs->nr_threads - 1) << 14);
+        *eax |= ((topo_info->threads_per_core - 1) << 14);
     }
 
     assert(cache->line_size > 0);
@@ -5995,20 +5996,20 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         }
         switch (count) {
         case 0: /* L1 dcache info */
-            encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache, cs,
-                                       eax, ebx, ecx, edx);
+            encode_cache_cpuid8000001d(env->cache_info_amd.l1d_cache,
+                                       &topo_info, eax, ebx, ecx, edx);
             break;
         case 1: /* L1 icache info */
-            encode_cache_cpuid8000001d(env->cache_info_amd.l1i_cache, cs,
-                                       eax, ebx, ecx, edx);
+            encode_cache_cpuid8000001d(env->cache_info_amd.l1i_cache,
+                                       &topo_info, eax, ebx, ecx, edx);
             break;
         case 2: /* L2 cache info */
-            encode_cache_cpuid8000001d(env->cache_info_amd.l2_cache, cs,
-                                       eax, ebx, ecx, edx);
+            encode_cache_cpuid8000001d(env->cache_info_amd.l2_cache,
+                                       &topo_info, eax, ebx, ecx, edx);
             break;
         case 3: /* L3 cache info */
-            encode_cache_cpuid8000001d(env->cache_info_amd.l3_cache, cs,
-                                       eax, ebx, ecx, edx);
+            encode_cache_cpuid8000001d(env->cache_info_amd.l3_cache,
+                                       &topo_info, eax, ebx, ecx, edx);
             break;
         default: /* end of info */
             *eax = *ebx = *ecx = *edx = 0;
-- 
2.26.2


