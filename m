Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BCF4633F7
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 13:13:04 +0100 (CET)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms20L-00062g-TD
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 07:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ms1zB-0005Np-Bk
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:11:49 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:42479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ms1z9-0005Gi-3c
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 07:11:49 -0500
Received: from [192.168.100.1] ([82.142.5.50]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtOSu-1mbCBy1qX8-00uocN; Tue, 30 Nov 2021 13:11:44 +0100
Message-ID: <e38ca477-ed69-001a-9f11-80c413eb76ed@vivier.eu>
Date: Tue, 30 Nov 2021 13:11:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] target/m68k: Implement TRAPV
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211130103752.72099-1-richard.henderson@linaro.org>
 <20211130103752.72099-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211130103752.72099-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6ujESQVQHeTg8Dppke/ZZ89gTvPKXmnFbHXnUPVrS9Fn1TXh+RH
 r5duapYZ6DDyR0R7sbioqdpE1oqJxjgZiCWTZyBSPWZkse3yyCnpbcaEKiorCLBoDCZ8Vsq
 4QAZ2o5H2oCqy0H1Eiu1T9057LP0BhseTpxYubJjLezg+daK2TGVeGaIZ4FKUbsooBG0bZh
 FxTsXKm+debphYi5G16EQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:voRI3vYjjOs=:u4lHnehizhoydQFKiedZ2p
 Jnept5/HOgdBoMLuMQg7KxuzpoUgyV7FL5HnUvvsyLo/acvpOu+XjUYGOCWmm4cuB0v6gP/K6
 VaBHkGnurwSV1HC8xeye+5CW0m8Ymrt1cT14+EHcxbwaCouk083oD0sqd2jNan4sQJbev/ICe
 +xW+pqgaQ+zRRiOBEYqv9cok8OcSTCw0ANtqE9Z7DaFkRw0CxNPHzY11K6h/oxxtbI1TIg4BD
 FsgAAsckkZING9d9XyqDvYTpPyWMftTBgDY1jYp9V21WWHPic9Uq+9NNcTYAYz0Hy9x2lXMOd
 ODiuqNHT7deX3rsaSLJOgrNfxeDexcHo+8TW1djguQQurnYteKyqVcR0OCYCy5Gpo4hJYJBJv
 cl7xsNE+mogsbNYkjkEJShu10IyM+dvXaWwyEKEYJn1uFfi5TjrM5zRujWckN+dH+I4ayQC3C
 6pxQqeFOe+Aea319czrTLkg7A3/XOG1WhthB9U9H6M5EmqPV/+TkY8mg/2vKq1+CgNAtLgF/S
 BB5zYOCb6+esHqIy26LJQUZdAXuFr8Hf80IUey2YhUaI7UqHssmpBZmfmk4f8tPAFY1hQOumX
 urvJ3RfjkMFP3woaI88eyAV0SAAZOC2eVwn6TznpPkPsfDogZEOD8b++nxbNoTE1Ww0VAgfIe
 T4yDhcB/ECYMzNS4voEQ6InFj4YMdDDQCuD4zcgGXMWsI91LzkIgDqEC4aCuvQfYuSzs=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 30/11/2021 à 11:37, Richard Henderson a écrit :
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index af43c8eab8..858ba761fc 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -4863,6 +4863,22 @@ DISAS_INSN(trap)
>       gen_exception(s, s->base.pc_next, EXCP_TRAP0 + (insn & 0xf));
>   }
>   
> +static void do_trapcc(DisasContext *s, int cond)
> +{
> +    TCGLabel *over = gen_new_label();
> +
> +    /* Jump over if !cond. */
> +    gen_jmpcc(s, cond ^ 1, over);
> +
> +    gen_exception(s, s->base.pc_next, EXCP_TRAPCC);
> +    gen_set_label(over);
> +}
> +
> +DISAS_INSN(trapv)
> +{
> +    do_trapcc(s, 9); /* VS */
> +}
> +
>   static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
>   {
>       switch (reg) {
> @@ -6026,6 +6042,7 @@ void register_m68k_insns (CPUM68KState *env)
>       BASE(nop,       4e71, ffff);
>       INSN(rtd,       4e74, ffff, RTD);
>       BASE(rts,       4e75, ffff);
> +    INSN(trapv,     4e76, ffff, M68000);
>       INSN(rtr,       4e77, ffff, M68000);
>       BASE(jump,      4e80, ffc0);
>       BASE(jump,      4ec0, ffc0);
> 

Same question as for PATCH 2 regarding m68k_interrupt_all()

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

