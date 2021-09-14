Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F099540AB21
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:49:45 +0200 (CEST)
Received: from localhost ([::1]:58868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ54S-0008WJ-IB
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:49:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ52j-0007RK-MT
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:47:57 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:48399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mQ52g-00045n-RW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:47:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 8107513EE0E;
 Tue, 14 Sep 2021 09:47:52 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 14 Sep
 2021 11:47:51 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b33cf58d-c132-4ae5-bf19-884c5f9434f4,
 2B4DCE8296B83A4DEFDF4253AFCCF2A4AB0DDD95) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210914085404.3889441-1-clg@kaod.org>
 <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
Date: Tue, 14 Sep 2021 11:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a0fb8cd6-022a-49c1-a23d-cb492fa954f1
X-Ovh-Tracer-Id: 8054687934813539177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 11:19 AM, Peter Maydell wrote:
> On Tue, 14 Sept 2021 at 09:56, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The current way the mask is built can overflow with a 64-bit decrementer.
>> Use sextract64() instead.
>>
>> Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
>> Fixes: a8dafa525181 ("target/ppc: Implement large decrementer support for TCG")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  v2: replaced MAKE_64BIT_MASK by sextract64
>>
>>  hw/ppc/ppc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
>> index 7375bf4fa910..4f14464c9220 100644
>> --- a/hw/ppc/ppc.c
>> +++ b/hw/ppc/ppc.c
>> @@ -876,7 +876,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
>>      bool negative;
>>
>>      /* Truncate value to decr_width and sign extend for simplicity */
>> -    value &= ((1ULL << nr_bits) - 1);
>> +    value = sextract64(value, 0, nr_bits);
>>      negative = !!(value & (1ULL << (nr_bits - 1)));
>>      if (negative) {
>>          value |= (0xFFFFFFFFULL << nr_bits);
> 
> I think these lines that say "if negative then force all the
> high bits to one" are also no longer required. That is, this
> entire section of code:
>     value &= ((1ULL << nr_bits) - 1);
>     negative = !!(value & (1ULL << (nr_bits - 1)));
>     if (negative) {
>         value |= (0xFFFFFFFFULL << nr_bits);
>     }
> 
> is an open-coded sign-extension, which can all be replaced with
> the single line
>     value = sextract64(value, 0, nr_bits);

'negative' is used for more tests afterwards but you are right. I will respin 
with more changes. 

I am reluctant in changing too much because this is common code for PPC32
and PPC64. But, hey, I will do my best with the images I have.

> (and also: if nr_bits is 64 then the "<< nr_bits"
> is undefined behaviour.)

That's the initial issue raised by the new little PPC FPGA softcore called 
microwatt as it's using a 64bit decrementer.

Thanks,

C. 

> 
> thanks
> -- PMM
> 


