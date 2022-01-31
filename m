Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD0C4A45AC
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:48:52 +0100 (CET)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEVAx-0007SU-3y
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:48:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1nEUe4-0003JG-E3
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:14:52 -0500
Received: from ciao.gmane.io ([116.202.254.214]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>)
 id 1nEUe2-0005z6-Tc
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:14:52 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gceq-qemu-devel2@m.gmane-mx.org>) id 1nEUdz-0004uV-AB
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 12:14:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: qemu-devel@nongnu.org
From: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Date: Mon, 31 Jan 2022 11:14:42 +0000
Message-ID: <cunee4orwbh.fsf@oracle.com>
References: <20220129102336.387460-1-leobras@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Cancel-Lock: sha1:zhS9WynOcG9Gbd0LoIb5kRVB5Yk=
Received-SPF: pass client-ip=116.202.254.214;
 envelope-from=gceq-qemu-devel2@m.gmane-mx.org; helo=ciao.gmane.io
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Saturday, 2022-01-29 at 07:23:37 -03, Leonardo Bras wrote:

> While trying to bring a VM with EPYC-Milan cpu on a host with
> EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
>
> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
>
> Even with this warning, the host goes up.
>
> Then, grep'ing cpuid output on both guest and host, outputs:
>
> extended feature flags (7):
>       enhanced REP MOVSB/STOSB                 = false
>       fast short REP MOV                       = false
>       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
>    brand = "AMD EPYC 7313 16-Core Processor               "
>
> This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
> not have the above feature bits set, which is usually not a good idea for
> live migration:
> Migrating from a host with these features to a host without them can
> be troublesome for the guest.
>
> Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
> avoid possible after-migration guest issues.
>
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>
> Does this make sense? Or maybe I am missing something here.

We have encountered some Milan CPUs (7J13) that did not initially
declare support for either ERMS or FSRM.

A firmware update caused these features to appear, which definitely
causes potential problems with migration of VMs from hosts with updated
firmware to those without.

It would be interesting to know if there is any expectation that the
features might be enabled on the 7313 CPUs that you have with a future
firmware update.

I *think* that the expectation is that Milan CPUs will have the
features, and if that is correct then they should remain present in the
EPYC-Milan definition on QEMU.

> Having a kvm guest running with a feature bit, while the host
> does not support it seems to cause a possible break the guest.

As Daniel said, this should not happen in this case.

>  target/i386/cpu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aa9e636800..a4bbd38ed0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4160,12 +4160,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>              CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
>              CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
>              CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
> -            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
> -            CPUID_7_0_EBX_INVPCID,
> +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_INVPCID,
>          .features[FEAT_7_0_ECX] =
>              CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
> -        .features[FEAT_7_0_EDX] =
> -            CPUID_7_0_EDX_FSRM,
>          .features[FEAT_XSAVE] =
>              CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
>              CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,

dme.
-- 
I don't care 'bout your other girls, just be good to me.


