Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B9F4DE224
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 21:09:43 +0100 (CET)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIus-0001O6-4y
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 16:09:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nVIth-0000i9-7A
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:08:29 -0400
Received: from mailout12.t-online.de ([194.25.134.22]:50024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1nVItf-00016g-62
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 16:08:28 -0400
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout12.t-online.de (Postfix) with SMTP id 5139C12FA5;
 Fri, 18 Mar 2022 21:08:24 +0100 (CET)
Received: from [192.168.211.200] ([46.86.48.20]) by fwd86.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1nVItc-1ZglEX0; Fri, 18 Mar 2022 21:08:24 +0100
Message-ID: <39c80858-42d1-571f-aa4e-06d495881aeb@t-online.de>
Date: Fri, 18 Mar 2022 21:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/i386: kvm: do not access uninitialized variable on
 older kernels
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220318152626.165431-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20220318152626.165431-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647634104-000116DC-3EAABCC3/0/0 CLEAN NORMAL
X-TOI-MSGID: 9cd95067-33d8-434b-830d-41209e4aa1c9
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: pkrempa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.03.22 um 16:26 schrieb Paolo Bonzini:
> KVM support for AMX includes a new system attribute, KVM_X86_XCOMP_GUEST_SUPP.
> Commit 19db68ca68 ("x86: Grant AMX permission for guest", 2022-03-15) however
> did not fully consider the behavior on older kernels.  First, it warns
> too aggressively.  Second, it invokes the KVM_GET_DEVICE_ATTR ioctl
> unconditionally and then uses the "bitmask" variable, which remains
> uninitialized if the ioctl fails.
>
> While at it, explain why the ioctl is needed and KVM_GET_SUPPORTED_CPUID
> is not enough.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/kvm/kvm.c | 17 +++++++++++++----
>   1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index ce0e8a4042..f2c9f7b5ca 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -412,6 +412,12 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>           }
>       } else if (function == 0xd && index == 0 &&
>                  (reg == R_EAX || reg == R_EDX)) {
> +        /*
> +         * The value returned by KVM_GET_SUPPORTED_CPUID does not include
> +         * features that still have to be enabled with the arch_prctl
> +         * system call.  QEMU needs the full value, which is retrieved
> +         * with KVM_GET_DEVICE_ATTR.
> +         */
>           struct kvm_device_attr attr = {
>               .group = 0,
>               .attr = KVM_X86_XCOMP_GUEST_SUPP,
> @@ -420,13 +426,16 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>   
>           bool sys_attr = kvm_check_extension(s, KVM_CAP_SYS_ATTRIBUTES);
>           if (!sys_attr) {
> -            warn_report("cannot get sys attribute capabilities %d", sys_attr);
> +            return ret;
>           }
>   
>           int rc = kvm_ioctl(s, KVM_GET_DEVICE_ATTR, &attr);
> -        if (rc == -1 && (errno == ENXIO || errno == EINVAL)) {
> -            warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
> -                        "error: %d", rc);
> +        if (rc == -1) {

Hi Paolo,

this is kvm_ioctl() not ioctl(). kvm_ioctl() returns -errno on error.

With best regards,
Volker

> +            if (errno != ENXIO) {
> +                warn_report("KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) "
> +                            "error: %d", rc);
> +            }
> +            return ret;
>           }
>           ret = (reg == R_EAX) ? bitmask : bitmask >> 32;
>       } else if (function == 0x80000001 && reg == R_ECX) {


