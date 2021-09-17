Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE1C40F977
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:43:54 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRE9h-0006VG-Qs
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mRE7v-000510-O2; Fri, 17 Sep 2021 09:42:03 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mRE7p-0007Z7-Q8; Fri, 17 Sep 2021 09:42:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.134])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 65BCFBE9153B;
 Fri, 17 Sep 2021 15:41:44 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 17 Sep
 2021 15:41:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002d8ba091f-5929-4afa-b1bd-2ba328f05c31,
 2811AC2F724D5CB001CF4B7629903955A49C8FE9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
Date: Fri, 17 Sep 2021 15:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] target/ppc: Fix 64-bit decrementer
Content-Language: en-US
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210916143710.236489-1-clg@kaod.org>
 <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 39358e6f-5fde-413a-bd4c-82a707a54358
X-Ovh-Tracer-Id: 11175401004070308713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieefiefgudethffgkeelvdfhledvvdekudejuedttedtkeekieffuddvleeutefgnecuffhomhgrihhnpegvlhguohhrrgguohdrohhrghdrsghrnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 9/16/21 20:22, Luis Fernando Fujita Pires wrote:
> Hi Cédric,
> 
> These changes look good and seem to replicate the exact behavior we had before, while fixing the 64-bit dec from MicroWatt.

Yes. That's the goal. I would like to minimize the possible impact on other
platforms. I checked MAC, pSeries and PowerNV but there are many more.

> A few notes, in case they help others, too:
> 
> According to the Power ISA:
>    When not in Large Decrementer mode:
>      - the maximum positive value for the decrementer is the maximum possible signed 32-bit int (2^31 - 1)
>      - the minimum possible value for the decrementer is 0x00000000FFFFFFFF
>    When in Large Decrementer mode:
>      - the maximum positive value for the decrementer is 2^(nr_bits - 1) - 1
>      - the minimum possible value for the decrementer is 0xFFFFFFFFFFFFFFFF
> 
> And the decrementer is decremented until its value becomes 0, and then once more, to the minimum possible value (0x00000000FFFFFFFF or 0xFFFFFFFFFFFFFFFF, depending on the Large Decrementer mode).
> 
>  From what I understood from the code, the 'decr' value passed to __cpu_ppc_store_decr is the value of DECR before the change, and 'value' is the new one.
> 
> Now, back to the code... :)
> 
>> +    target_long signed_value;
>> +    target_long signed_decr;
> 
> Since these values will be the results of sextract64, it's probably better to define them as int64_t.

but then it breaks the code doing the logging on PPC32 targets :/

> 
>>       LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
>> -                decr, value);
>> +                decr, signed_value);
> 
> While this reproduces the behavior we previously had, I think it would be more consistent if we logged what we had before the sign-extension ('value' instead of 'signed_value'). And 'decr' is okay, which is also not sign-extended.
> 
>> ||
>> +        ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value
>> < 0
>> +          && signed_decr >= 0)) {
> 
> The 'signed_decr >= 0' is ok. It catches the case where the previous value (now sign-extended as signed_decr) was >= 0 and we signed_value just got negative (which should be exactly 0xFFFFFFFFFFFFFF, after being sign-extended to 64 bits).
> 
> One point that I found odd, but not directly related to your patch, is the implementation of _cpu_ppc_load_decr:
> 
> static inline int64_t _cpu_ppc_load_decr(CPUPPCState *env, uint64_t next)
> {
>      ppc_tb_t *tb_env = env->tb_env;
>      int64_t decr, diff;
> 
>      diff = next - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      if (diff >= 0) {
>          decr = muldiv64(diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
>      } else if (tb_env->flags & PPC_TIMER_BOOKE) {
>          decr = 0;
>      }  else {
>          decr = -muldiv64(-diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
>      }
>      LOG_TB("%s: %016" PRIx64 "\n", __func__, decr);
> 
>      return decr;
> }
> 
> The diff < 0 case:
>          decr = -muldiv64(-diff, tb_env->decr_freq, NANOSECONDS_PER_SECOND);
> should probably just be:
>          decr = -1;
> to comply with the minimum possible values specified by the ISA.
> But, again, this doesn't impact your patch directly.

We can try to address that in a followup patch.

> And also:
> Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

Thanks,

C.


> --
> Luis Pires
> Instituto de Pesquisas ELDORADO
> Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
> 


