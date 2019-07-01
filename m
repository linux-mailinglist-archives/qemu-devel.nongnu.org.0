Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9519F1B63C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 14:45:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQAKd-0007t8-RJ
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 08:45:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQAJL-0007IJ-AS
	for qemu-devel@nongnu.org; Mon, 13 May 2019 08:44:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQAJK-00070O-Es
	for qemu-devel@nongnu.org; Mon, 13 May 2019 08:44:07 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:51556
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>)
	id 1hQAJG-0006yS-9t; Mon, 13 May 2019 08:44:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B77C380D;
	Mon, 13 May 2019 05:44:00 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1719F3F6C4;
	Mon, 13 May 2019 05:43:58 -0700 (PDT)
Date: Mon, 13 May 2019 13:43:56 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20190513124356.GG28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	<20190512083624.8916-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190512083624.8916-6-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 123 insertions(+), 4 deletions(-)

[...]

> +static int kvm_arch_put_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> +        uint64_t *q = aa64_vfp_qreg(env, n);
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[ARM_MAX_VQ * 2];
> +        int i;
> +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
> +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
> +        }
> +        reg.addr = (uintptr_t)d;
> +#else
> +        reg.addr = (uintptr_t)q;
> +#endif
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);

Will this silently go wrong if more than one slice is required (i.e.,
the register size grows beyond 8192 bits?)

[...]

Cheers
---Dave

