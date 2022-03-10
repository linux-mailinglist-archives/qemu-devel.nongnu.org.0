Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7214D4356
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:20:12 +0100 (CET)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSExv-0004U0-Hk
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSEvi-0003mW-O3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:17:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nSEvd-0002vI-N0
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646903865;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=K1oHDE2zEJ3OzOLvIxaERL60v91ZzjYYqlVixsRYN5Q=;
 b=E9TKfvyqWnZDs1hnPpPz8i2GgSvHqE/dNZ259+7xyDlRoFdZYPCRoHCzybA3Q7wqC++rbB
 xKOahcIuWchBEcmYPySsaT1J95PKQ2dhxxf90UCpYqNee8XpHjnnvkUSn8+705FXVL9OVl
 PUITXnCeqUMcf1YMno+X0t9tcO7lVJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-mlJUzm46PZekj6cxtm8mIA-1; Thu, 10 Mar 2022 04:17:44 -0500
X-MC-Unique: mlJUzm46PZekj6cxtm8mIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8605B801AB2;
 Thu, 10 Mar 2022 09:17:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B6A7FCF2;
 Thu, 10 Mar 2022 09:17:21 +0000 (UTC)
Date: Thu, 10 Mar 2022 09:17:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Subject: Re: [PATCH 2/2] i386: Add notify VM exit support
Message-ID: <YinCH/GbShwG1fRF@redhat.com>
References: <20220310090205.10645-1-chenyi.qiang@intel.com>
 <20220310090205.10645-3-chenyi.qiang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310090205.10645-3-chenyi.qiang@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Xiaoyao Li <xiaoyao.li@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 10, 2022 at 05:02:05PM +0800, Chenyi Qiang wrote:
> There are cases that malicious virtual machine can cause CPU stuck (due
> to event windows don't open up), e.g., infinite loop in microcode when
> nested #AC (CVE-2015-5307). No event window means no event (NMI, SMI and
> IRQ) can be delivered. It leads the CPU to be unavailable to host or
> other VMs. Notify VM exit is introduced to mitigate such kind of
> attacks, which will generate a VM exit if no event window occurs in VM
> non-root mode for a specified amount of time (notify window).
> 
> A new KVM capability KVM_CAP_X86_NOTIFY_VMEXIT is exposed to user space
> so that the user can query the capability and set the expected notify
> window when creating VMs.
> 
> If notify VM exit happens with VM_INVALID_CONTEXT, hypervisor should
> exit to user space with the exit reason KVM_EXIT_NOTIFY to inform the
> fatal case. Then user space can inject a SHUTDOWN event to the target
> vcpu. This is implemented by defining a new bit in flags field of
> kvm_vcpu_event in KVM_SET_VCPU_EVENTS ioctl.
> 
> Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
> ---
>  hw/i386/x86.c         | 24 ++++++++++++++++++
>  include/hw/i386/x86.h |  3 +++
>  target/i386/kvm/kvm.c | 58 ++++++++++++++++++++++++++++---------------
>  3 files changed, 65 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index b84840a1bb..25e6c50b1e 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1309,6 +1309,23 @@ static void machine_set_sgx_epc(Object *obj, Visitor *v, const char *name,
>      qapi_free_SgxEPCList(list);
>  }
>  
> +static void x86_machine_get_notify_window(Object *obj, Visitor *v,
> +                                const char *name, void *opaque, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +    int32_t notify_window = x86ms->notify_window;
> +
> +    visit_type_int32(v, name, &notify_window, errp);
> +}
> +
> +static void x86_machine_set_notify_window(Object *obj, Visitor *v,
> +                               const char *name, void *opaque, Error **errp)
> +{
> +    X86MachineState *x86ms = X86_MACHINE(obj);
> +
> +    visit_type_int32(v, name, &x86ms->notify_window, errp);
> +}
> +
>  static void x86_machine_initfn(Object *obj)
>  {
>      X86MachineState *x86ms = X86_MACHINE(obj);
> @@ -1319,6 +1336,7 @@ static void x86_machine_initfn(Object *obj)
>      x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
>      x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
>      x86ms->bus_lock_ratelimit = 0;
> +    x86ms->notify_window = -1;
>  }

IIUC from the kernel patch, this negative value leaves the protection
disabled, and thus the host remains vulnerable to the CVE. I would
expect this ought to set a suitable default value to fix the flaw.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


