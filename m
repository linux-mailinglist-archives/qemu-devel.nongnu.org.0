Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C0143B3FD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 16:27:28 +0200 (CEST)
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNQF-0001Oj-9N
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 10:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfIqb-0002sC-77
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:34:21 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:50465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kettenis@xs4all.nl>)
 id 1mfIqZ-0000f3-2f
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 05:34:20 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
 by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 07a01bf6;
 Tue, 26 Oct 2021 11:34:07 +0200 (CEST)
Date: Tue, 26 Oct 2021 11:34:07 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20211026071241.74889-1-agraf@csgraf.de> (message from Alexander
 Graf on Tue, 26 Oct 2021 09:12:41 +0200)
Subject: Re: [PATCH v2] hvf: arm: Ignore cache operations on MMIO
References: <20211026071241.74889-1-agraf@csgraf.de>
Message-ID: <d3ca8dc7cba09d77@bloch.sibelius.xs4all.nl>
Received-SPF: softfail client-ip=83.163.83.176;
 envelope-from=mark.kettenis@xs4all.nl; helo=sibelius.xs4all.nl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 26 Oct 2021 10:11:54 -0400
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
Cc: kettenis@openbsd.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 dirty@apple.com, f4bug@amsat.org, r.bolshakov@yadro.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Alexander Graf <agraf@csgraf.de>
> Date: Tue, 26 Oct 2021 09:12:41 +0200
> 
> Apple's Hypervisor.Framework forwards cache operations as MMIO traps
> into user space. For MMIO however, these have no meaning: There is no
> cache attached to them.
> 
> So let's just treat cache data exits as nops.
> 
> This fixes OpenBSD booting as guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reported-by: AJ Barris <AwlsomeAlex@github.com>
> Reference: https://github.com/utmapp/UTM/issues/3197
> ---
>  target/arm/hvf/hvf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index bff3e0cde7..0dc96560d3 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1150,12 +1150,19 @@ int hvf_vcpu_exec(CPUState *cpu)
>          uint32_t sas = (syndrome >> 22) & 3;
>          uint32_t len = 1 << sas;
>          uint32_t srt = (syndrome >> 16) & 0x1f;
> +        uint32_t cm = (syndrome >> 8) & 0x1;
>          uint64_t val = 0;
>  
>          trace_hvf_data_abort(env->pc, hvf_exit->exception.virtual_address,
>                               hvf_exit->exception.physical_address, isv,
>                               iswrite, s1ptw, len, srt);
>  
> +        if (cm) {
> +            /* We don't cache MMIO regions */
> +            advance_pc = true;
> +            break;
> +        }
> +
>          assert(isv);
>  
>          if (iswrite) {
> -- 
> 2.30.1 (Apple Git-130)

Now that I see this diff, I think this is pretty much how I fixed it
when first trying your hvf patchset back in december/january.  Before
I lost the change because I accidentally wiped the disk...

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

