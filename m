Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552DD5BB820
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 14:12:19 +0200 (CEST)
Received: from localhost ([::1]:39988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZWgC-0006eU-7S
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 08:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZWdZ-0003qB-DX
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 08:09:33 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oZWdW-0004nI-JI
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 08:09:32 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 260AF75A15C;
 Sat, 17 Sep 2022 14:09:27 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E2EE475A150; Sat, 17 Sep 2022 14:09:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E02E175A0FE;
 Sat, 17 Sep 2022 14:09:26 +0200 (CEST)
Date: Sat, 17 Sep 2022 14:09:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: laurent@vivier.eu, richard.henderson@linaro.org, lucienmp.qemu@gmail.com, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
In-Reply-To: <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
Message-ID: <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
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

On Sat, 17 Sep 2022, Mark Cave-Ayland wrote:
> There are already 32 feature bits in use, so change the size of the m68k
> CPU features to uint64_t (allong with the associated m68k_feature()
> functions) to allow up to 64 feature bits to be used.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
> target/m68k/cpu.c | 4 ++--
> target/m68k/cpu.h | 6 +++---
> 2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index f681be3a2a..7b4797e2f1 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
>
> static void m68k_set_feature(CPUM68KState *env, int feature)
> {
> -    env->features |= (1u << feature);
> +    env->features |= (1ul << feature);
> }
>
> static void m68k_unset_feature(CPUM68KState *env, int feature)
> {
> -    env->features &= (-1u - (1u << feature));
> +    env->features &= (-1ul - (1ul << feature));

Should these be ull instead of ul?

Regards,
BALATON Zoltan

> }
>
> static void m68k_cpu_reset(DeviceState *dev)
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 67b6c12c28..d3384e5d98 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -154,7 +154,7 @@ typedef struct CPUArchState {
>     struct {} end_reset_fields;
>
>     /* Fields from here on are preserved across CPU reset. */
> -    uint32_t features;
> +    uint64_t features;
> } CPUM68KState;
>
> /*
> @@ -539,9 +539,9 @@ enum m68k_features {
>     M68K_FEATURE_TRAPCC,
> };
>
> -static inline int m68k_feature(CPUM68KState *env, int feature)
> +static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
> {
> -    return (env->features & (1u << feature)) != 0;
> +    return (env->features & (1ul << feature)) != 0;
> }
>
> void m68k_cpu_list(void);
>

