Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B155C6F3E26
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 09:07:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptk5N-0002jH-BI; Tue, 02 May 2023 03:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ptk5F-0002fS-2K
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:05:59 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ptk59-0001iW-LG
 for qemu-devel@nongnu.org; Tue, 02 May 2023 03:05:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4EFD920A51;
 Tue,  2 May 2023 07:05:39 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 2 May
 2023 09:05:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034764ed68-c9ee-43a2-95b2-cee711d44e9e,
 E090D36E4DC625C434D5D892E9869795142AB5A1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0435d42f-e48a-3c51-108a-df284fc496ab@kaod.org>
Date: Tue, 2 May 2023 09:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] tests: tcg: ppc64: Add tests for Vector Extract Mask
 Instructions
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, <philmd@linaro.org>,
 <richard.henderson@linaro.org>, <danielhb413@gmail.com>,
 <lucas.araujo@eldorado.org.br>, <qemu-ppc@nongnu.org>,
 <david@gibson.dropbear.id.au>, <groug@kaod.org>
CC: <john_platts@hotmail.com>, <qemu-devel@nongnu.org>
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
 <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <168141246968.3026479.12755025628496245070.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: c6e31c50-b671-496a-a76d-f5f28a9be650
X-Ovh-Tracer-Id: 13133340942631275442
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvhedgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeetffdvvdeitdevvdfhtdetgfetfeehfffgheffgfefleekteelgefhiedvfeevnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehssghhrghtsehlihhnuhigrdhisghmrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdplhhutggrshdrrghrrghujhhosegvlhguohhrrgguohdrohhrghdrsghrpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdgurghvihgusehgihgssh
 honhdrughrohhpsggvrghrrdhiugdrrghupdhjohhhnhgpphhlrghtthhssehhohhtmhgrihhlrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/13/23 21:01, Shivaprasad G Bhat wrote:
> Add test for vextractbm, vextractwm, vextractdm and vextractqm
> instructions. Test works for both qemu-ppc64 and qemu-ppc64le.
> 
> Based on the test case written by John Platts posted at [1]
> 
> References:
> [1]: https://gitlab.com/qemu-project/qemu/-/issues/1536

Gitlab issues should be referenced as :

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1536

However, this patch adds a test, not a fix. So it is the previous patch
which should be annotated as resolving the issue.

Also, I think the code should be using  HOST_BIG_ENDIAN instead of
__ORDER_BIG_ENDIAN__

Thanks,

C.

> 
> Signed-off-by: John Platts <john_platts@hotmail.com>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
>   tests/tcg/ppc64/Makefile.target |    6 ++++-
>   tests/tcg/ppc64/vector.c        |   50 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+), 1 deletion(-)
>   create mode 100644 tests/tcg/ppc64/vector.c
> 
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
> index f081f1c683..4fd543ce28 100644
> --- a/tests/tcg/ppc64/Makefile.target
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -20,7 +20,7 @@ PPC64_TESTS += mtfsf
>   PPC64_TESTS += mffsce
>   
>   ifneq ($(CROSS_CC_HAS_POWER10),)
> -PPC64_TESTS += byte_reverse sha512-vector
> +PPC64_TESTS += byte_reverse sha512-vector vector
>   endif
>   byte_reverse: CFLAGS += -mcpu=power10
>   run-byte_reverse: QEMU_OPTS+=-cpu POWER10
> @@ -33,6 +33,10 @@ sha512-vector: sha512.c
>   run-sha512-vector: QEMU_OPTS+=-cpu POWER10
>   run-plugin-sha512-vector-with-%: QEMU_OPTS+=-cpu POWER10
>   
> +vector: CFLAGS += -mcpu=power10
> +run-vector: QEMU_OPTS += -cpu POWER10
> +run-plugin-vector-with-%: QEMU_OPTS += -cpu POWER10
> +
>   PPC64_TESTS += signal_save_restore_xer
>   PPC64_TESTS += xxspltw
>   
> diff --git a/tests/tcg/ppc64/vector.c b/tests/tcg/ppc64/vector.c
> new file mode 100644
> index 0000000000..3cb2b88c87
> --- /dev/null
> +++ b/tests/tcg/ppc64/vector.c
> @@ -0,0 +1,50 @@
> +#include <assert.h>
> +#include <stdint.h>
> +
> +int main(void)
> +{
> +    unsigned int result_wi;
> +    vector unsigned char vbc_bi_src = { 0xFF, 0xFF, 0, 0xFF, 0xFF, 0xFF,
> +                                        0xFF, 0xFF, 0xFF, 0xFF, 0, 0, 0,
> +                                        0, 0xFF, 0xFF};
> +    vector unsigned short vbc_hi_src = { 0xFFFF, 0, 0, 0xFFFF,
> +                                         0, 0, 0xFFFF, 0xFFFF};
> +    vector unsigned int vbc_wi_src = {0, 0, 0xFFFFFFFF, 0xFFFFFFFF};
> +    vector unsigned long long vbc_di_src = {0xFFFFFFFFFFFFFFFF, 0};
> +    vector __uint128_t vbc_qi_src;
> +
> +    asm("vextractbm %0, %1" : "=r" (result_wi) : "v" (vbc_bi_src));
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +    assert(result_wi == 0b1101111111000011);
> +#else
> +    assert(result_wi == 0b1100001111111011);
> +#endif
> +
> +    asm("vextracthm %0, %1" : "=r" (result_wi) : "v" (vbc_hi_src));
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +    assert(result_wi == 0b10010011);
> +#else
> +    assert(result_wi == 0b11001001);
> +#endif
> +
> +    asm("vextractwm %0, %1" : "=r" (result_wi) : "v" (vbc_wi_src));
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +    assert(result_wi == 0b0011);
> +#else
> +    assert(result_wi == 0b1100);
> +#endif
> +
> +    asm("vextractdm %0, %1" : "=r" (result_wi) : "v" (vbc_di_src));
> +#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
> +    assert(result_wi == 0b10);
> +#else
> +    assert(result_wi == 0b01);
> +#endif
> +
> +    vbc_qi_src[0] = 0x1;
> +    vbc_qi_src[0] = vbc_qi_src[0] << 127;
> +    asm("vextractqm %0, %1" : "=r" (result_wi) : "v" (vbc_qi_src));
> +    assert(result_wi == 0b1);
> +
> +    return 0;
> +}
> 
> 


