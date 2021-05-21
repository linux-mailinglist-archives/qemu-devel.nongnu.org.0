Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A2C38D004
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 23:43:44 +0200 (CEST)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkCvn-0006HG-Aa
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 17:43:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkCuH-0005VY-PD
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:42:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lkCuF-00066i-ME
 for qemu-devel@nongnu.org; Fri, 21 May 2021 17:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621633326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7SOrb20fFZErVrwhyVUIWN0YpFhF83YFiywNBwrUfBA=;
 b=d13OoIqfgXHyrMUGxxpXiotC5xZxA3gUqJq3KkRSfIBULmxgZ5PSViI32Cyda6OmOU6cnc
 7z5I93wpzSzRHRVDTFoWcyrhKxi1br7aWznaezWKNhdEKkc5J7kQqhlaUWBPq4inqhi/oQ
 KV24KHntShUrhLA+t9N959h077BFi38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-xU2gT9YXO6SzL3iV8m6vUg-1; Fri, 21 May 2021 17:42:04 -0400
X-MC-Unique: xU2gT9YXO6SzL3iV8m6vUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EFB3E7B6A
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 21:42:03 +0000 (UTC)
Received: from localhost (ovpn-115-27.rdu2.redhat.com [10.10.115.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F1DF5D9D5;
 Fri, 21 May 2021 21:42:03 +0000 (UTC)
Date: Fri, 21 May 2021 17:42:02 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 13/19] i386: prefer system KVM_GET_SUPPORTED_HV_CPUID
 ioctl over vCPU's one
Message-ID: <20210521214202.g222ullptiseaesq@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210422161130.652779-14-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-14-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:24PM +0200, Vitaly Kuznetsov wrote:
> KVM_GET_SUPPORTED_HV_CPUID was made a system wide ioctl which can be called
> prior to creating vCPUs and we are going to use that to expand Hyper-V cpu
> features early. Use it when it is supported by KVM.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  target/i386/kvm/kvm.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index feec9f25ba12..5d08f3a39ef7 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -928,7 +928,8 @@ static struct {
>      },
>  };
>  
> -static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
> +static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max,
> +                                           bool do_sys_ioctl)
>  {
>      struct kvm_cpuid2 *cpuid;
>      int r, size;
> @@ -937,7 +938,11 @@ static struct kvm_cpuid2 *try_get_hv_cpuid(CPUState *cs, int max)
>      cpuid = g_malloc0(size);
>      cpuid->nent = max;
>  
> -    r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
> +    if (do_sys_ioctl) {
> +        r = kvm_ioctl(kvm_state, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
> +    } else {
> +        r = kvm_vcpu_ioctl(cs, KVM_GET_SUPPORTED_HV_CPUID, cpuid);
> +    }
>      if (r == 0 && cpuid->nent >= max) {
>          r = -E2BIG;
>      }
> @@ -964,13 +969,17 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>      /* 0x40000000..0x40000005, 0x4000000A, 0x40000080..0x40000080 leaves */
>      int max = 10;
>      int i;
> +    bool do_sys_ioctl;
> +
> +    do_sys_ioctl =
> +        kvm_check_extension(kvm_state, KVM_CAP_SYS_HYPERV_CPUID) > 0;
>  
>      /*
>       * When the buffer is too small, KVM_GET_SUPPORTED_HV_CPUID fails with
>       * -E2BIG, however, it doesn't report back the right size. Keep increasing
>       * it and re-trying until we succeed.
>       */
> -    while ((cpuid = try_get_hv_cpuid(cs, max)) == NULL) {
> +    while ((cpuid = try_get_hv_cpuid(cs, max, do_sys_ioctl)) == NULL) {
>          max++;
>      }
>  
> @@ -980,7 +989,7 @@ static struct kvm_cpuid2 *get_supported_hv_cpuid(CPUState *cs)
>       * information early, just check for the capability and set the bit
>       * manually.
>       */
> -    if (kvm_check_extension(cs->kvm_state,
> +    if (!do_sys_ioctl && kvm_check_extension(cs->kvm_state,
>                              KVM_CAP_HYPERV_ENLIGHTENED_VMCS) > 0) {

Oh, this conditional replaces the comment I suggested in patch
10/19.  It makes it obvious that the hack can be deleted if we
remove support for the VCPU ioctl.

So, when exactly will we be able to delete the VCPU ioctl code
and support only the system ioctl?

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

>          for (i = 0; i < cpuid->nent; i++) {
>              if (cpuid->entries[i].function == HV_CPUID_ENLIGHTMENT_INFO) {
> -- 
> 2.30.2
> 

-- 
Eduardo


