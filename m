Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3C6DB918
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 07:46:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pl1Nf-0000z4-00; Sat, 08 Apr 2023 01:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pl1Nc-0000x7-1P
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 01:44:52 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pl1NZ-00042t-7u
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 01:44:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 3081C20BDF;
 Sat,  8 Apr 2023 05:44:38 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sat, 8 Apr
 2023 07:44:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0015862bdea-5458-4291-959f-72e702a7c833,
 1909A0EEAF64E87ADFA7DA466C66E424CDDE72D7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <57c8ba7b-a777-f032-4165-58bef25b67ed@kaod.org>
Date: Sat, 8 Apr 2023 07:44:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0] target/ppc: Fix temp usage in gen_op_arith_modw
To: Richard Henderson <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
CC: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>, <groug@kaod.org>, 
 <qemu-ppc@nongnu.org>, Nicholas Piggin <npiggin@gmail.com>
References: <20230407183628.3239304-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230407183628.3239304-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f6186bc4-b19f-4c2c-875a-dc0cb59eeb69
X-Ovh-Tracer-Id: 18394389728428198761
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejiedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpnhhpihhgghhinhesghhmrghilhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehgeekpd
 hmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 4/7/23 20:36, Richard Henderson wrote:
> Fix a crash writing to 't3', which is now a constant.
> Instead, write the result of the remu to 'ret'.
> 
> Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 9d05357d03..906fc46723 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ctx, TCGv ret, TCGv arg1,
>           TCGv_i32 t2 = tcg_constant_i32(1);
>           TCGv_i32 t3 = tcg_constant_i32(0);
>           tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
> -        tcg_gen_remu_i32(t3, t0, t1);
> -        tcg_gen_extu_i32_tl(ret, t3);
> +        tcg_gen_remu_i32(ret, t0, t1);
> +        tcg_gen_extu_i32_tl(ret, ret);

These routines require a TCGv_i32 and ret is not on ppc64 :

../target/ppc/translate.c: In function ‘gen_op_arith_modw’:
../target/ppc/translate.c:1810:26: error: passing argument 1 of ‘tcg_gen_remu_i32’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  1810 |         tcg_gen_remu_i32(ret, t0, t1);
       |                          ^~~
       |                          |
       |                          TCGv_i64 {aka struct TCGv_i64_d *}

and

../target/ppc/translate.c:1811:34: error: passing argument 2 of ‘tcg_gen_extu_i32_i64’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  1811 |         tcg_gen_extu_i32_tl(ret, ret);
       |                                  ^~~
       |                                  |
       |                                  TCGv_i64 {aka struct TCGv_i64_d *}


C.


