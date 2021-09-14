Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054640AFAA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:53:12 +0200 (CEST)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8rz-0002ID-9Z
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mQ8j7-0007Zy-8L; Tue, 14 Sep 2021 09:43:57 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:47163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mQ8j4-0002Tb-Gc; Tue, 14 Sep 2021 09:43:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 06CA613EC8B;
 Tue, 14 Sep 2021 13:43:50 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 14 Sep
 2021 15:43:49 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006ccb1da17-c82c-4590-a357-672aeaadc122,
 2B4DCE8296B83A4DEFDF4253AFCCF2A4AB0DDD95) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Subject: Re: [PATCH v2] target/ppc: Fix 64-bit decrementer
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
References: <20210914085404.3889441-1-clg@kaod.org>
 <CAFEAcA9epGAoHPNV=N+x2TWbFoRPgQSUML-RCDkMhvtYK5SEFQ@mail.gmail.com>
 <45fca4ca-55ed-b75c-e1d6-f0903562c1e6@kaod.org>
 <516bb260-3837-5692-b31b-5990f5c5106e@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7a30313d-60e1-5db6-4093-24a34f89bf22@kaod.org>
Date: Tue, 14 Sep 2021 15:43:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <516bb260-3837-5692-b31b-5990f5c5106e@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74698d3f-b0ac-4a3f-a4ff-cc3eb683fed5
X-Ovh-Tracer-Id: 12039810656279628652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On 9/14/21 3:21 PM, Richard Henderson wrote:
> On 9/14/21 2:47 AM, Cédric Le Goater wrote:
>> On 9/14/21 11:19 AM, Peter Maydell wrote:
>>>>       /* Truncate value to decr_width and sign extend for simplicity */
>>>> -    value &= ((1ULL << nr_bits) - 1);
>>>> +    value = sextract64(value, 0, nr_bits);
>>>>       negative = !!(value & (1ULL << (nr_bits - 1)));
>>>>       if (negative) {
>>>>           value |= (0xFFFFFFFFULL << nr_bits);
>>>
>>> I think these lines that say "if negative then force all the
>>> high bits to one" are also no longer required. That is, this
>>> entire section of code:
>>>      value &= ((1ULL << nr_bits) - 1);
>>>      negative = !!(value & (1ULL << (nr_bits - 1)));
>>>      if (negative) {
>>>          value |= (0xFFFFFFFFULL << nr_bits);
>>>      }
>>>
>>> is an open-coded sign-extension, which can all be replaced with
>>> the single line
>>>      value = sextract64(value, 0, nr_bits);
>>
>> 'negative' is used for more tests afterwards but you are right. I will respin
>> with more changes.
> 
> After the sign-extension, negative needs no complicated expression.
> 
>   value = sextract64(value, 0, nr_bits);
>   negative = (target_long)value < 0;

Yes. I was wondering about the 'target_ulong' type used for the value 
and decr variables. The code has below : 

    ...
    if ((value < 3) ||
    ...

and then another sign calculation on a target_ulong

       ...
       && !(decr & (1ULL << (nr_bits - 1))))) {
       ...
 
We should introduce intermediate 'int64_t' variables to extract the 
sign values from the target_ulong. That would be cleaner.

Thanks,

C.

