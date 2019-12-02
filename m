Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E120510EB88
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 15:29:52 +0100 (CET)
Received: from localhost ([::1]:36610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibmhz-00067w-N9
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 09:29:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ibmgr-0005OH-Q5
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:28:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ibmgq-0006NG-6K
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:28:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52319
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ibmgq-0006N8-1t
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 09:28:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575296919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=l5uY4RuZB6xPlBmdnErD3TJn1aXdLKDmmi7xIhz3zOk=;
 b=Oik12poBfEjdxmDn8LKjGPQcRO0G6cmR9Xj0pGYdhfPTnB6QiTzbxhcqKOnC4bbB1FRxMM
 2Ord++WAGUglt48W6A3QIHvDJyxrDwJnrqgqA5kJ0P3QG/PUzOaOWIIcqSXwArN9wU4CU+
 uFcMtrrboYFz7Pz0gOKKBx83LSOoeBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-fjlobHRqPL2PlhFE2vTdmg-1; Mon, 02 Dec 2019 09:28:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0281107ACC4;
 Mon,  2 Dec 2019 14:28:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-196.ams2.redhat.com [10.36.117.196])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F19B60BFB;
 Mon,  2 Dec 2019 14:28:31 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] s390x: Add missing vcpu reset functions
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191202140146.3910-1-frankja@linux.ibm.com>
 <20191202140146.3910-3-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <da71ec1a-7c3f-4032-0627-11252bd17e27@redhat.com>
Date: Mon, 2 Dec 2019 15:28:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191202140146.3910-3-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fjlobHRqPL2PlhFE2vTdmg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: cohuck@redhat.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 mihajlov@linux.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/12/2019 15.01, Janosch Frank wrote:
> Up to now we only had an ioctl to reset vcpu data QEMU couldn't reach
> for the initial reset, which was also called for the clear reset. To
> be architecture compliant, we also need to clear local interrupts on a
> normal reset.
> 
> Because of this and the upcoming protvirt support we need to add
> ioctls for the missing clear and normal resets.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
[...]
> @@ -403,20 +405,44 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>      return 0;
>  }
>  
> -void kvm_s390_reset_vcpu(S390CPU *cpu)
> +static void kvm_s390_reset_vcpu(S390CPU *cpu, unsigned long type)
>  {
>      CPUState *cs = CPU(cpu);
>  
> -    /* The initial reset call is needed here to reset in-kernel
> -     * vcpu data that we can't access directly from QEMU
> -     * (i.e. with older kernels which don't support sync_regs/ONE_REG).
> -     * Before this ioctl cpu_synchronize_state() is called in common kvm
> -     * code (kvm-all) */
> -    if (kvm_vcpu_ioctl(cs, KVM_S390_INITIAL_RESET, NULL)) {
> -        error_report("Initial CPU reset failed on CPU %i", cs->cpu_index);
> +    /*
> +     * The reset call is needed here to reset in-kernel vcpu data that
> +     * we can't access directly from QEMU (i.e. with older kernels
> +     * which don't support sync_regs/ONE_REG).  Before this ioctl
> +     * cpu_synchronize_state() is called in common kvm code
> +     * (kvm-all).
> +     */
> +    if (kvm_vcpu_ioctl(cs, type)) {
> +        error_report("CPU reset failed on CPU %i", cs->cpu_index);

In case you respin, maybe also print the "type" variable here?

>      }
>  }
>  
> +void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
> +{
> +    kvm_s390_reset_vcpu(cpu, KVM_S390_INITIAL_RESET);
> +}
> +
> +void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
> +{
> +    if (!cap_vcpu_resets) {
> +        kvm_s390_reset_vcpu(cpu, KVM_S390_INITIAL_RESET);
> +    } else {
> +        kvm_s390_reset_vcpu(cpu, KVM_S390_CLEAR_RESET);
> +    }

Cosmetic nit: It's a tiny bit nicer the other way round:

    if (cap_vcpu_resets) {
        kvm_s390_reset_vcpu(cpu, KVM_S390_CLEAR_RESET);
    } else {
        kvm_s390_reset_vcpu(cpu, KVM_S390_INITIAL_RESET);
    }

Anyway,
Reviewed-by: Thomas Huth <thuth@redhat.com>


