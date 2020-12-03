Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AEC2CCAF4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 01:21:39 +0100 (CET)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkcNM-0002eV-Qf
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 19:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkcMK-000217-02; Wed, 02 Dec 2020 19:20:32 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35028 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkcMH-0003Iz-4U; Wed, 02 Dec 2020 19:20:31 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 940FF41395;
 Thu,  3 Dec 2020 00:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606954825;
 x=1608769226; bh=Bk/O5w7FSWsWuOApjcv3o/daW/V6RfyKt7mN66cVFFY=; b=
 AU0w+qQoXm12htrnqMqwGLpdCmK9OB9ViZAPu0p1Xhn0pCbJHctBvobXQe5UMKFD
 MJawaZF7ymq+9DAkyNJq2mR29CGee1t8gecm5coNFlj96UD2YQD3NHnSR7PxkuvX
 fSQ8TVwc6EV9S90ai001jNtN/tqHMJ4pFGjeVip8mv4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jS6VBQaKNQVy; Thu,  3 Dec 2020 03:20:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5722B4131A;
 Thu,  3 Dec 2020 03:20:24 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 03:20:24 +0300
Date: Thu, 3 Dec 2020 03:20:42 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 02/10] hvf: Move common code out
Message-ID: <20201203002042.GB34964@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-3-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-3-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 08:04:00PM +0100, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's move common code out
> into its own accel directory.
> 
> [...]
>
> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> new file mode 100644
> index 0000000000..de9bad23a8
> --- /dev/null
> +++ b/include/sysemu/hvf_int.h
> @@ -0,0 +1,69 @@
> +/*
> + * QEMU Hypervisor.framework (HVF) support > + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/* header to be included in HVF-specific code */
> +
> +#ifndef HVF_INT_H
> +#define HVF_INT_H
> +
> +#include <Hypervisor/Hypervisor.h>
> +

From here

> +#define HVF_MAX_VCPU 0x10
> +
> +extern struct hvf_state hvf_global;
> +
> +struct hvf_vm {
> +    int id;
> +    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
> +};
> +
> +struct hvf_state {
> +    uint32_t version;
> +    struct hvf_vm *vm;
> +    uint64_t mem_quota;
> +};
> +

and down to here, it doesn't seem to be a common code, rather unused
definitions. They can be safely dropped:

diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index e0edffd077..e31938e5ff 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -21,21 +21,6 @@
 #include "cpu.h"
 #include "x86.h"

-#define HVF_MAX_VCPU 0x10
-
-extern struct hvf_state hvf_global;
-
-struct hvf_vm {
-    int id;
-    struct hvf_vcpu_state *vcpus[HVF_MAX_VCPU];
-};
-
-struct hvf_state {
-    uint32_t version;
-    struct hvf_vm *vm;
-    uint64_t mem_quota;
-};
-
 /* hvf_slot flags */
 #define HVF_SLOT_LOG (1 << 0)

@@ -75,7 +60,6 @@ hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);

 /* Host specific functions */
 int hvf_inject_interrupt(CPUArchState *env, int vector);
-int hvf_vcpu_run(struct hvf_vcpu_state *vcpu);
 #endif

 #endif

