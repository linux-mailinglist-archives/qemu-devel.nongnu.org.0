Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD85F0BC1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:30:56 +0200 (CEST)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeFAN-0004ze-BA
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vt@altlinux.org>)
 id 1oeF88-0003NG-Tt; Fri, 30 Sep 2022 08:28:37 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:35232)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vt@altlinux.org>)
 id 1oeF86-0002V1-Sb; Fri, 30 Sep 2022 08:28:36 -0400
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id EADDD72C90B;
 Fri, 30 Sep 2022 15:28:30 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
 by imap.altlinux.org (Postfix) with ESMTPSA id DA2D24A472A;
 Fri, 30 Sep 2022 15:28:30 +0300 (MSK)
Date: Fri, 30 Sep 2022 15:28:30 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3] target/arm/kvm: Retry KVM_CREATE_VM call if it fails
 EINTR
Message-ID: <20220930122830.3k32ki7ntqeukay6@altlinux.org>
References: <20220930113824.1933293-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20220930113824.1933293-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=194.107.17.57; envelope-from=vt@altlinux.org;
 helo=vmicros1.altlinux.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 12:38:24PM +0100, Peter Maydell wrote:
> Occasionally the KVM_CREATE_VM ioctl can return EINTR, even though
> there is no pending signal to be taken. In commit 94ccff13382055
> we added a retry-on-EINTR loop to the KVM_CREATE_VM call in the
> generic KVM code. Adopt the same approach for the use of the
> ioctl in the Arm-specific KVM code (where we use it to create a
> scratch VM for probing for various things).
> 
> For more information, see the mailing list thread:
> https://lore.kernel.org/qemu-devel/8735e0s1zw.wl-maz@kernel.org/
> 
> Reported-by: Vitaly Chikunov <vt@altlinux.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The view in the thread seems to be that this is a kernel bug (because
> in QEMU's case there shouldn't be a signal to be delivered at this
> point because of our signal handling strategy); so I've adopted the
> same "just retry-on-EINTR for this specific ioctl" approach that
> commit 94ccff13 did, rather than, for instance, something wider like
> "make kvm_ioctl() and friends always retry on EINTR".
> 
> v2: correctly check for -1 and errno is EINTR...
> v3: really correctly check errno. This time for sure!
> ---
>  target/arm/kvm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index e5c1bd50d29..1e4de9b42e3 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -79,7 +79,9 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>      if (max_vm_pa_size < 0) {
>          max_vm_pa_size = 0;
>      }
> -    vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    do {
> +        vmfd = ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> +    } while (vmfd == -1 && errno == EINTR);

Reviewed-by: Vitaly Chikunov <vt@altlinux.org>

Thanks,

>      if (vmfd < 0) {
>          goto err;
>      }
> -- 
> 2.25.1

