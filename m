Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4840FA0A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:13:08 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mREbz-0008QT-4R
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:13:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mREZi-0006oK-Q9
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:10:46 -0400
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:45211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mREZd-00028o-0u
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:10:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 43A2C225C9;
 Fri, 17 Sep 2021 14:10:35 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 17 Sep
 2021 16:10:34 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002e37934bb-a3a9-4de9-a15f-1974bc0b985f,
 2811AC2F724D5CB001CF4B7629903955A49C8FE9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b8545741-185f-c74c-f572-ad4b5372e825@kaod.org>
Date: Fri, 17 Sep 2021 16:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] target/ppc: Fix 64-bit decrementer
Content-Language: en-US
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210916143710.236489-1-clg@kaod.org>
 <CP2PR80MB36680A1BE91AFABE9DD3295BDADC9@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <a0661690-bdb4-f002-3862-306458b36d3d@kaod.org>
 <CP2PR80MB3668712B5A367E87089D724BDADD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CP2PR80MB3668712B5A367E87089D724BDADD9@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5259308f-c06e-46ab-9e92-bce40f62a091
X-Ovh-Tracer-Id: 11662915662756154217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudehiedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/17/21 16:00, Luis Fernando Fujita Pires wrote:
> From: Cédric Le Goater <clg@kaod.org>
>>>> +    target_long signed_value;
>>>> +    target_long signed_decr;
>>>
>>> Since these values will be the results of sextract64, it's probably better to
>> define them as int64_t.
>>
>> but then it breaks the code doing the logging on PPC32 targets :/
> 
> You mean here?

You need to define PPC_DEBUG_TB and compile the ppc-softmmu :

../hw/ppc/ppc.c: In function ‘__cpu_ppc_store_decr’:
../hw/ppc/ppc.c:883:12: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 4 has type ‘int64_t’ {aka ‘long int’} [-Werror=format=]
   883 |     LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
       |            ^~~~~~
   884 |                 decr, signed_value);
       |                       ~~~~~~~~~~~~
       |                       |
       |                       int64_t {aka long int}
../hw/ppc/ppc.c:51:32: note: in definition of macro ‘LOG_TB’
    51 | #  define LOG_TB(...) qemu_log(__VA_ARGS__)
       |                                ^~~~~~~~~~~
cc1: all warnings being treated as errors

>>>>        LOG_TB("%s: " TARGET_FMT_lx " => " TARGET_FMT_lx "\n", __func__,
>>>> -                decr, value);
>>>> +                decr, signed_value);
>>>
>>> While this reproduces the behavior we previously had, I think it would be more
>> consistent if we logged what we had before the sign-extension ('value' instead
>> of 'signed_value'). And 'decr' is okay, which is also not sign-extended.
> 
> It won't break if you log 'value' instead of 'signed_value', right?

Yes but it's extra change ...

Thanks,

C.

