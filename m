Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 414CD3D685B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:01:57 +0200 (CEST)
Received: from localhost ([::1]:59400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m87jX-0000RI-SV
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m87iO-00086u-Iu
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m87iK-0008Rs-Mq
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:00:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627333235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c0QK0wzaYu7CL+Lx/Egmnlnla0nySEPLVQPqc9xpxSU=;
 b=GlqM5NG5wCKfuWVc/6bcujabM8J2F+Pd7mfEodXM7d2kgJOEDaVLLlwtZ3f98jBeLs3v53
 DFmQyfJJ2AnmS1T4vCw1YnDMpekK0HM3yYk9g/PbE7jDc692pehqt8OjdcWTq2J79+3Yyl
 Dk3oAeIwa+PqIBHqugZTC61OhQHrQbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-w4Li0QyCOo6fyWnCYu6CwQ-1; Mon, 26 Jul 2021 17:00:20 -0400
X-MC-Unique: w4Li0QyCOo6fyWnCYu6CwQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7474B1074661;
 Mon, 26 Jul 2021 21:00:19 +0000 (UTC)
Received: from localhost (unknown [10.22.9.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7812101E249;
 Mon, 26 Jul 2021 21:00:18 +0000 (UTC)
Date: Mon, 26 Jul 2021 17:00:18 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jade Cheng <chengjiayao@bytedance.com>
Subject: Re: [PATCH] Fix CPUID_Fn8000001E_EBX for AMD
Message-ID: <20210726210018.bfpd7rpnatw5377z@habkost.net>
References: <20210630082551.12956-1-chengjiayao@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210630082551.12956-1-chengjiayao@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, pizhenwei@bytedance.com,
 Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing the original author of that code (Babu Moger).

On Wed, Jun 30, 2021 at 04:25:51PM +0800, Jade Cheng wrote:
> According to AMD64 Arch Programmer's Manual Appendix D,
> bits 7:0 in Fn8000_001E_EBX should be physical core(s) per logical processor, not per die.

Do you mean physical cores per package/socket?

> 
> Signed-off-by: Jade Cheng <chengjiayao@bytedance.com>

Do you have a pointer to the specific paragraph of the
documentation that states that?

https://www.amd.com/system/files/TechDocs/24594.pdf
page 634 says:

  CPUID Fn8000_001E_EBX Compute Unit Identifiers
  [...]
  7:0 ComputeUnitId Compute unit ID. Identifies a Compute Unit,
                    which may be one or more physical cores that each implement
                    one or more logical processors

I don't see any content referencing physical cores per logical
processor, or physical cores per package/socket.

Which problem are you trying to fix here?


> ---
>  target/i386/cpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index a9fe1662d3..417f5ba81f 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -381,7 +381,13 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
>       *  NOTE: CoreId is already part of apic_id. Just use it. We can
>       *  use all the 8 bits to represent the core_id here.
>       */
> -    *ebx = ((topo_info->threads_per_core - 1) << 8) | (topo_ids.core_id & 0xFF);
> +    uint32_t core_id = topo_ids.core_id;
> +
> +    if (IS_AMD_CPU(&cpu->env)) {
> +        core_id = topo_ids.core_id + topo_ids.die_id * topo_info->cores_per_die;
> +    }
> +
> +    *ebx = ((topo_info->threads_per_core - 1) << 8) | (core_id & 0xFF);
>  
>      /*
>       * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId)
> -- 
> 2.24.3 (Apple Git-128)
> 

-- 
Eduardo


