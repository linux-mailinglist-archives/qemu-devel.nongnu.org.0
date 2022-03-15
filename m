Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7A4D9514
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:17:55 +0100 (CET)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1RK-00077u-WD
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:17:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU1D7-0003p5-Qj
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:03:13 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:60293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU1D5-00030A-E8
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:03:13 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B35B4214AF;
 Tue, 15 Mar 2022 07:03:05 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 08:03:05 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058afccf4d-8c46-4b24-947a-b1815555f684,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fe9de14f-0929-26da-bd95-bf8d7c81babe@kaod.org>
Date: Tue, 15 Mar 2022 08:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] target/ppc: Replicate double->int32 result for some
 vector insns
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
References: <20220315053934.377519-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315053934.377519-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3048169c-0833-4446-b9bc-8c3b2b30156b
X-Ovh-Tracer-Id: 4190880931021753126
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 06:39, Richard Henderson wrote:
> Power ISA v3.1 formalizes the previously undefined result in
> words 1 and 3 to be a copy of the result in words 0 and 2.
> 
> This affects: xscvdpsxws, xscvdpuxws, xvcvdpsxws, xvcvdpuxws.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/852
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   target/ppc/fpu_helper.c | 43 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> index bd12db960a..e76d2ae83a 100644
> --- a/target/ppc/fpu_helper.c
> +++ b/target/ppc/fpu_helper.c
> @@ -2891,22 +2891,53 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
>   
>   VSX_CVT_FP_TO_INT(xscvdpsxds, 1, float64, int64, VsrD(0), VsrD(0), \
>                     0x8000000000000000ULL)
> -VSX_CVT_FP_TO_INT(xscvdpsxws, 1, float64, int32, VsrD(0), VsrW(1), \
> -                  0x80000000U)
>   VSX_CVT_FP_TO_INT(xscvdpuxds, 1, float64, uint64, VsrD(0), VsrD(0), 0ULL)
> -VSX_CVT_FP_TO_INT(xscvdpuxws, 1, float64, uint32, VsrD(0), VsrW(1), 0U)
>   VSX_CVT_FP_TO_INT(xvcvdpsxds, 2, float64, int64, VsrD(i), VsrD(i), \
>                     0x8000000000000000ULL)
> -VSX_CVT_FP_TO_INT(xvcvdpsxws, 2, float64, int32, VsrD(i), VsrW(2 * i), \
> -                  0x80000000U)
>   VSX_CVT_FP_TO_INT(xvcvdpuxds, 2, float64, uint64, VsrD(i), VsrD(i), 0ULL)
> -VSX_CVT_FP_TO_INT(xvcvdpuxws, 2, float64, uint32, VsrD(i), VsrW(2 * i), 0U)
>   VSX_CVT_FP_TO_INT(xvcvspsxds, 2, float32, int64, VsrW(2 * i), VsrD(i), \
>                     0x8000000000000000ULL)
>   VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
>   VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
>   VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
>   
> +/*
> + * Likewise, except that the result is duplicated into both subwords.
> + * Power ISA v3.1 has Programming Notes for these insns:
> + *     Previous versions of the architecture allowed the contents of
> + *     word 0 of the result register to be undefined. However, all
> + *     processors that support this instruction write the result into
> + *     words 0 and 1 (and words 2 and 3) of the result register, as
> + *     is required by this version of the architecture.
> + */
> +#define VSX_CVT_FP_TO_INT2(op, nels, stp, ttp, rnan)                         \
> +void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)             \
> +{                                                                            \
> +    int all_flags = env->fp_status.float_exception_flags, flags;             \
> +    ppc_vsr_t t = { };                                                       \
> +    int i;                                                                   \
> +                                                                             \
> +    for (i = 0; i < nels; i++) {                                             \
> +        env->fp_status.float_exception_flags = 0;                            \
> +        t.VsrW(2 * i) = stp##_to_##ttp##_round_to_zero(xb->VsrD(i), &env->fp_status);  \
> +        flags = env->fp_status.float_exception_flags;                        \
> +        if (unlikely(flags & float_flag_invalid)) {                          \
> +            t.VsrW(2 * i) = float_invalid_cvt(env, flags, t.VsrW(2 * i), rnan, 0, GETPC()); \
> +        }                                                                    \
> +        t.VsrW(2 * i + 1) = t.VsrW(2 * i);                                   \
> +        all_flags |= flags;                                                  \
> +    }                                                                        \
> +                                                                             \
> +    *xt = t;                                                                 \
> +    env->fp_status.float_exception_flags = all_flags;                        \
> +    do_float_check_status(env, GETPC());                                     \
> +}
> +
> +VSX_CVT_FP_TO_INT2(xscvdpsxws, 1, float64, int32, 0x80000000U)
> +VSX_CVT_FP_TO_INT2(xscvdpuxws, 1, float64, uint32, 0U)
> +VSX_CVT_FP_TO_INT2(xvcvdpsxws, 2, float64, int32, 0x80000000U)
> +VSX_CVT_FP_TO_INT2(xvcvdpuxws, 2, float64, uint32, 0U)
> +
>   /*
>    * VSX_CVT_FP_TO_INT_VECTOR - VSX floating point to integer conversion
>    *   op    - instruction mnemonic


