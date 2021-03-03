Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525FD32B924
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:17:08 +0100 (CET)
Received: from localhost ([::1]:55970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUBP-0002Qv-AE
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHU7w-0001Oz-SS
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHU7v-0004pO-1D
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:13:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614788010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mR2GOi2FNIrVfv98gRpeDM1tQAE4p1dBKYW2oWaAOSM=;
 b=W/Xsex+beKEbEvN4wF0XSD2KbRWHqyhPvLhyXWV5rS0tz9qfjkMBpgBpmcSd61fzK2pPIW
 IAykMUgleBJdgpd266lSYDtndUWwY015jCWcYEQDsu6bYvXjwIr9rNwqx+9AwDemrKcAwa
 EOksf+x82NPZujdj5+sPgx/l0QBkwIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-4L_pqj9jN36uaJbLMPfllg-1; Wed, 03 Mar 2021 11:13:28 -0500
X-MC-Unique: 4L_pqj9jN36uaJbLMPfllg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F70E800D53;
 Wed,  3 Mar 2021 16:13:27 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B22C189CE;
 Wed,  3 Mar 2021 16:13:15 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:13:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] s390x/kvm: Get rid of legacy_s390_alloc()
Message-ID: <20210303171314.7a24b29e@MiWiFi-RA69-srv>
In-Reply-To: <20210303130916.22553-2-david@redhat.com>
References: <20210303130916.22553-1-david@redhat.com>
 <20210303130916.22553-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  3 Mar 2021 14:09:15 +0100
David Hildenbrand <david@redhat.com> wrote:

> legacy_s390_alloc() was required for dealing with the absence of the ESOP
> feature -- on old HW (< gen 10) and old z/VM versions (< 6.3).
> 
> As z/VM v6.2 (and even v6.3) is no longer supported since 2017 [1]
> and we don't expect to have real users on such old hardware, let's drop
> legacy_s390_alloc().
> 
> Still check+report an error just in case someone still runs on
> such old z/VM environments, or someone runs under weird nested KVM
> setups (where we can manually disable ESOP via the CPU model).
> 
> No need to check for KVM_CAP_GMAP - that should always be around on
> kernels that also have KVM_CAP_DEVICE_CTRL (>= v3.15).
> 
> [1] https://www.ibm.com/support/lifecycle/search?q=z%2FVM
> 
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/s390x/kvm.c | 43 +++++--------------------------------------
>  1 file changed, 5 insertions(+), 38 deletions(-)
> 
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 7a892d663d..84b40572f2 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -161,8 +161,6 @@ static int cap_protected;
>  
>  static int active_cmma;
>  
> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared);
> -
>  static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>  {
>      struct kvm_device_attr attr = {
> @@ -349,6 +347,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>                       "please use kernel 3.15 or newer");
>          return -1;
>      }
> +    if (!kvm_check_extension(s, KVM_CAP_S390_COW)) {
> +        error_report("KVM is missing capability KVM_CAP_S390_COW - "
> +                     "unsupported environment");
> +        return -1;
> +    }
>  
>      cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>      cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
> @@ -357,11 +360,6 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>      cap_vcpu_resets = kvm_check_extension(s, KVM_CAP_S390_VCPU_RESETS);
>      cap_protected = kvm_check_extension(s, KVM_CAP_S390_PROTECTED);
>  
> -    if (!kvm_check_extension(s, KVM_CAP_S390_GMAP)
> -        || !kvm_check_extension(s, KVM_CAP_S390_COW)) {
> -        phys_mem_set_alloc(legacy_s390_alloc);
> -    }
> -
>      kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>      kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
>      kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
> @@ -889,37 +887,6 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
>      return ret;
>  }
>  
> -/*
> - * Legacy layout for s390:
> - * Older S390 KVM requires the topmost vma of the RAM to be
> - * smaller than an system defined value, which is at least 256GB.
> - * Larger systems have larger values. We put the guest between
> - * the end of data segment (system break) and this value. We
> - * use 32GB as a base to have enough room for the system break
> - * to grow. We also have to use MAP parameters that avoid
> - * read-only mapping of guest pages.
> - */
> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
> -{
> -    static void *mem;
> -
> -    if (mem) {
> -        /* we only support one allocation, which is enough for initial ram */
> -        return NULL;
> -    }
> -
> -    mem = mmap((void *) 0x800000000ULL, size,
> -               PROT_EXEC|PROT_READ|PROT_WRITE,
> -               MAP_SHARED | MAP_ANONYMOUS | MAP_FIXED, -1, 0);
> -    if (mem == MAP_FAILED) {
> -        mem = NULL;
> -    }
> -    if (mem && align) {
> -        *align = QEMU_VMALLOC_ALIGN;
> -    }
> -    return mem;
> -}
> -
>  static uint8_t const *sw_bp_inst;
>  static uint8_t sw_bp_ilen;
>  


