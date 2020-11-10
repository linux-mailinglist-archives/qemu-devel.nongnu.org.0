Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42162AD708
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 14:03:10 +0100 (CET)
Received: from localhost ([::1]:49280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcTIj-00076S-Oe
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 08:03:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTGW-0005ny-Nm
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:00:53 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43500
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTGO-0008Ie-75
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 08:00:52 -0500
Received: from host86-184-131-53.range86-184.btcentralplus.com
 ([86.184.131.53] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kcTGX-0006Dr-SU; Tue, 10 Nov 2020 13:00:57 +0000
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20201104172512.2381656-1-ehabkost@redhat.com>
 <20201104172512.2381656-2-ehabkost@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <32bac169-baec-3620-0915-f2377e74985e@ilande.co.uk>
Date: Tue, 10 Nov 2020 13:00:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104172512.2381656-2-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.131.53
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 1/7] sparc: Fix property/field size mismatch for iu-version
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/11/2020 17:25, Eduardo Habkost wrote:

> The "iu-version" property is declared as uint64_t but points to a
> target_ulong struct field.  On the sparc 32-bit target, This
> makes every write of iu-version corrupt the 4 bytes after
> sparc_def_t.iu_version (where the fpu_version field is located).
> 
> Change the type of the iu_version struct field to uint64_t,
> and just use DEFINE_PROP_UINT64.
> 
> The only place where env.def.iu_version field is read is the
>      env->version = env->def.iu_version;
> assignment at sparc_cpu_realizefn().  This means behavior will be
> kept exactly the same (except for the memory corruption bug fix).
> 
> It would be nice to explicitly validate iu_version against
> target_ulong limits, but that would be a new feature (since the
> first version of this code, iu-version was parsed as 64-bit value
> value).  It can be done later, once we have an appropriate API to
> define limits for integer properties.
> 
> Fixes: de05005bf785 ("sparc: convert cpu features to qdev properties")
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Cc: Artyom Tarasenko <atar4qemu@gmail.com>
> Cc: qemu-devel@nongnu.org
> ---
>   target/sparc/cpu.h | 2 +-
>   target/sparc/cpu.c | 5 ++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index b9369398f2..8ed0f4fef3 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -252,7 +252,7 @@ typedef struct trap_state {
>   
>   struct sparc_def_t {
>       const char *name;
> -    target_ulong iu_version;
> +    uint64_t iu_version;
>       uint32_t fpu_version;
>       uint32_t mmu_version;
>       uint32_t mmu_bm;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index ec59a13eb8..5a9397f19a 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -576,7 +576,7 @@ void sparc_cpu_list(void)
>       unsigned int i;
>   
>       for (i = 0; i < ARRAY_SIZE(sparc_defs); i++) {
> -        qemu_printf("Sparc %16s IU " TARGET_FMT_lx
> +        qemu_printf("Sparc %16s IU %" PRIx64
>                       " FPU %08x MMU %08x NWINS %d ",
>                       sparc_defs[i].name,
>                       sparc_defs[i].iu_version,
> @@ -838,8 +838,7 @@ static Property sparc_cpu_properties[] = {
>       DEFINE_PROP_BIT("hypv",     SPARCCPU, env.def.features, 11, false),
>       DEFINE_PROP_BIT("cmt",      SPARCCPU, env.def.features, 12, false),
>       DEFINE_PROP_BIT("gl",       SPARCCPU, env.def.features, 13, false),
> -    DEFINE_PROP_UNSIGNED("iu-version", SPARCCPU, env.def.iu_version, 0,
> -                         prop_info_uint64, target_ulong),
> +    DEFINE_PROP_UINT64("iu-version", SPARCCPU, env.def.iu_version, 0),
>       DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
>       DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
>       DEFINE_PROP("nwindows",     SPARCCPU, env.def.nwindows,

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

