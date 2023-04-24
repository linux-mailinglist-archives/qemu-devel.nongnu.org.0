Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FAF6ECC77
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:02:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvpk-0004GR-5V; Mon, 24 Apr 2023 09:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pqvpf-00048O-Px
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:02:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pqvpQ-0004IM-QQ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682341318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VZs+YpiXXIE6n/XU6TMZPlejs7Kb6MsmBc6LLaNqyFo=;
 b=ecBbPtEUGUZ0Wm6sYHwJ5Tl7Iv/EAEC+RDzlXqHapHV69iiHSkayQvjuYFLZO+D2BovV8H
 /JaC6JhsYmm2lZQnGMSNUE5LQ6AENSx5yEpggu+F5N0Ndqsksb5135kRjK0TfRVWbdKepx
 s7YyQ8mIx3PRBETlhPKs/3lnJmFkIEI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-YhOavOQsOACU2oKVC0TpLA-1; Mon, 24 Apr 2023 09:01:57 -0400
X-MC-Unique: YhOavOQsOACU2oKVC0TpLA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 479A5884EC8;
 Mon, 24 Apr 2023 13:01:56 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F04112131B;
 Mon, 24 Apr 2023 13:01:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org
Cc: pbonzini@redhat.com, mtosatti@redhat.com, danielhb413@gmail.com,
 clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 peter.maydell@linaro.org, chenhuacai@kernel.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] kvm: Merge kvm_check_extension() and
 kvm_vm_check_extension()
In-Reply-To: <20230421163822.839167-1-jean-philippe@linaro.org>
Organization: Red Hat GmbH
References: <20230421163822.839167-1-jean-philippe@linaro.org>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 24 Apr 2023 15:01:54 +0200
Message-ID: <87jzy1v3gd.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 21 2023, Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> The KVM_CHECK_EXTENSION ioctl can be issued either on the global fd
> (/dev/kvm), or on the VM fd obtained with KVM_CREATE_VM. For most
> extensions, KVM returns the same value with either method, but for some
> of them it can refine the returned value depending on the VM type. The
> KVM documentation [1] advises to use the VM fd:
>
>   Based on their initialization different VMs may have different
>   capabilities. It is thus encouraged to use the vm ioctl to query for
>   capabilities (available with KVM_CAP_CHECK_EXTENSION_VM on the vm fd)
>
> Ongoing work on Arm confidential VMs confirms this, as some capabilities
> become unavailable to confidential VMs, requiring changes in QEMU to use
> kvm_vm_check_extension() instead of kvm_check_extension() [2]. Rather
> than changing each check one by one, change kvm_check_extension() to
> always issue the ioctl on the VM fd when available, and remove
> kvm_vm_check_extension().
>
> Fall back to the global fd when the VM check is unavailable:
>
> * Ancient kernels do not support KVM_CHECK_EXTENSION on the VM fd, since
>   it was added by commit 92b591a4c46b ("KVM: Allow KVM_CHECK_EXTENSION
>   on the vm fd") in Linux 3.17 [3]. Support for Linux 3.16 ended only in
>   June 2020, but there may still be old images around.
>
> * A couple of calls must be issued before the VM fd is available, since
>   they determine the VM type: KVM_CAP_MIPS_VZ and KVM_CAP_ARM_VM_IPA_SIZE
>
> Does any user actually depend on the check being done on the global fd
> instead of the VM fd?  I surveyed all cases where KVM can return
> different values depending on the query method. Luckily QEMU already
> calls kvm_vm_check_extension() for most of those. Only three of them are
> ambiguous, because currently done on the global fd:
>
> * KVM_CAP_MAX_VCPUS and KVM_CAP_MAX_VCPU_ID on Arm, changes value if the
>   user requests a vGIC different from the default. But QEMU queries this
>   before vGIC configuration, so the reported value will be the same.
>
> * KVM_CAP_SW_TLB on PPC. When issued on the global fd, returns false if
>   the kvm-hv module is loaded; when issued on the VM fd, returns false
>   only if the VM type is HV instead of PR. If this returns false, then
>   QEMU will fail to initialize a BOOKE206 MMU model.
>
>   So this patch supposedly improves things, as it allows to run this
>   type of vCPU even when both KVM modules are loaded.
>
> * KVM_CAP_PPC_SECURE_GUEST. Similarly, doing this check on a VM fd
>   refines the returned value, and ensures that SVM is actually
>   supported. Since QEMU follows the check with kvm_vm_enable_cap(), this
>   patch should only provide better error reporting.
>
> [1] https://www.kernel.org/doc/html/latest/virt/kvm/api.html#kvm-check-extension
> [2] https://lore.kernel.org/kvm/875ybi0ytc.fsf@redhat.com/
> [3] https://github.com/torvalds/linux/commit/92b591a4c46b
>
> Suggested-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  include/sysemu/kvm.h     |  2 --
>  include/sysemu/kvm_int.h |  1 +
>  accel/kvm/kvm-all.c      | 26 +++++++++-----------------
>  target/i386/kvm/kvm.c    |  6 +++---
>  target/ppc/kvm.c         | 34 +++++++++++++++++-----------------
>  5 files changed, 30 insertions(+), 39 deletions(-)
>

(...)

> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index cf3a88d90e..eca815e763 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1109,22 +1109,13 @@ int kvm_check_extension(KVMState *s, unsigned int extension)
>  {
>      int ret;
>  
> -    ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
> -    if (ret < 0) {
> -        ret = 0;
> +    if (!s->check_extension_vm) {
> +        ret = kvm_ioctl(s, KVM_CHECK_EXTENSION, extension);
> +    } else {
> +        ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, extension);
>      }
> -
> -    return ret;
> -}
> -
> -int kvm_vm_check_extension(KVMState *s, unsigned int extension)
> -{
> -    int ret;
> -
> -    ret = kvm_vm_ioctl(s, KVM_CHECK_EXTENSION, extension);
>      if (ret < 0) {
> -        /* VM wide version not implemented, use global one instead */
> -        ret = kvm_check_extension(s, extension);
> +        ret = 0;
>      }
>  
>      return ret;
> @@ -2328,7 +2319,7 @@ static void kvm_irqchip_create(KVMState *s)
>   */
>  static int kvm_recommended_vcpus(KVMState *s)
>  {
> -    int ret = kvm_vm_check_extension(s, KVM_CAP_NR_VCPUS);
> +    int ret = kvm_check_extension(s, KVM_CAP_NR_VCPUS);
>      return (ret) ? ret : 4;
>  }
>  
> @@ -2480,6 +2471,7 @@ static int kvm_init(MachineState *ms)
>      }
>  
>      s->vmfd = ret;
> +    s->check_extension_vm = kvm_check_extension(s, KVM_CAP_CHECK_EXTENSION_VM);

Hm, it's a bit strange to set s->check_extension_vm by calling a
function that already checks for the value of
s->check_extension_vm... would it be better to call kvm_ioctl() directly
on this line?

I think it would be good if some ppc folks could give this a look, but
in general, it looks fine to me.


