Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2BF1ECB75
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 10:26:56 +0200 (CEST)
Received: from localhost ([::1]:54830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgOjf-0001w6-Vd
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 04:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgOiz-0001No-SJ
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:26:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30520
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgOiy-00038w-Ls
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 04:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591172771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JTyxC46ik7vhHuCt2KXtszQJ1oeP0eS83+vIraiqcBc=;
 b=KV9B9mO7pbMyfxcLLPiaLIr0gF60ekfilflHCYLxics0r5lZerdCV7ECOIrFeXSz9JzNXy
 XFp83TxLCzOhD/GpGAqM5mx6u1oKojVQCUeIQzmUDioq3viWQMXYrRS9jXfm6MHOnHWu15
 qWRssbxOmwawHfCJd0aHHgsqTiMj2Fw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-0g0kpd6DMni7dOf3KKwfig-1; Wed, 03 Jun 2020 04:26:07 -0400
X-MC-Unique: 0g0kpd6DMni7dOf3KKwfig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74EEC835B41;
 Wed,  3 Jun 2020 08:26:06 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3225C240;
 Wed,  3 Jun 2020 08:26:03 +0000 (UTC)
Date: Wed, 3 Jun 2020 10:26:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [PATCH v2] target/arm/cpu: adjust virtual time for arm cpu
Message-ID: <20200603082600.efes4srlft3xv2tq@kamzik.brq.redhat.com>
References: <20200603020208.2089-1-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200603020208.2089-1-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:12:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 wu.wubin@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 03, 2020 at 10:02:08AM +0800, Ying Fang wrote:
> Virtual time adjustment was implemented for virt-5.0 machine type,
> but the cpu property was enabled only for host-passthrough and
> max cpu model. Let's add it for arm cpu which has the gernic
> timer feature enabled.
> 
> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> 
> ---
> v2:
> - move kvm_arm_add_vcpu_properties into arm_cpu_post_init
> 
> v1:
> - initial commit
> - https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg08518.html
> 
> ---
>  target/arm/cpu.c   | 3 +--
>  target/arm/cpu64.c | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 32bec156f2..1e9b7a51f2 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1244,6 +1244,7 @@ void arm_cpu_post_init(Object *obj)
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
>          qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
> +        kvm_arm_add_vcpu_properties(obj);

The name 'kvm_arm_add_vcpu_properties' says nothing about being specific
to the timer. So this is either the wrong place for this function, or the
function is named wrong. I'd say it's the wrong place, because, as the
comment above kvm_arm_add_vcpu_properties() implies, the function is
for all 'kvm-*' prefixed properties, not just timer related ones. It's
true we don't have any others yet, but we will. I have plans to post
kvm-steal-time soon, and despite it also having 'time' in its name, it
shouldn't depend on ARM_FEATURE_GENERIC_TIMER.

How about the below [untested] patch instead?

Thanks,
drew

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2d4..e9084f98ef10 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1245,6 +1245,10 @@ void arm_cpu_post_init(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER)) {
         qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
     }
+
+    if (kvm_enabled()) {
+        kvm_arm_add_vcpu_properties();
+    }
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -2029,7 +2033,6 @@ static void arm_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        kvm_arm_add_vcpu_properties(obj);
     } else {
         cortex_a15_initfn(obj);
 
@@ -2183,7 +2186,6 @@ static void arm_host_initfn(Object *obj)
     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         aarch64_add_sve_properties(obj);
     }
-    kvm_arm_add_vcpu_properties(obj);
     arm_cpu_post_init(obj);
 }
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index cbc5c3868fce..778cecc2e6ca 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -592,7 +592,6 @@ static void aarch64_max_initfn(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arm_set_cpu_features_from_host(cpu);
-        kvm_arm_add_vcpu_properties(obj);
     } else {
         uint64_t t;
         uint32_t u;
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 4bdbe6dcac07..eef3bbd1cc2c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -194,17 +194,18 @@ static void kvm_no_adjvtime_set(Object *obj, bool value, Error **errp)
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(Object *obj)
 {
-    if (!kvm_enabled()) {
-        return;
-    }
+    ARMCPU *cpu = ARM_CPU(obj);
+    CPUARMState *env = &cpu->env;
 
-    ARM_CPU(obj)->kvm_adjvtime = true;
-    object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
-                             kvm_no_adjvtime_set);
-    object_property_set_description(obj, "kvm-no-adjvtime",
-                                    "Set on to disable the adjustment of "
-                                    "the virtual counter. VM stopped time "
-                                    "will be counted.");
+    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+        cpu->kvm_adjvtime = true;
+        object_property_add_bool(obj, "kvm-no-adjvtime", kvm_no_adjvtime_get,
+                                 kvm_no_adjvtime_set);
+        object_property_set_description(obj, "kvm-no-adjvtime",
+                                        "Set on to disable the adjustment of "
+                                        "the virtual counter. VM stopped time "
+                                        "will be counted.");
+    }
 }
 
 bool kvm_arm_pmu_supported(CPUState *cpu)


>      }
>  }
>  
> @@ -2029,7 +2030,6 @@ static void arm_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        kvm_arm_add_vcpu_properties(obj);
>      } else {
>          cortex_a15_initfn(obj);
>  
> @@ -2183,7 +2183,6 @@ static void arm_host_initfn(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }
> -    kvm_arm_add_vcpu_properties(obj);
>      arm_cpu_post_init(obj);
>  }
>  
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index cbc5c3868f..778cecc2e6 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -592,7 +592,6 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        kvm_arm_add_vcpu_properties(obj);
>      } else {
>          uint64_t t;
>          uint32_t u;
> -- 
> 2.23.0
> 
> 
> 


