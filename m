Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F2409D87
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 21:57:45 +0200 (CEST)
Received: from localhost ([::1]:50952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPs5H-0002JI-RC
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 15:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPs3R-0000mv-VL; Mon, 13 Sep 2021 15:55:50 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:43725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPs3K-0000br-GV; Mon, 13 Sep 2021 15:55:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B957F2115E;
 Mon, 13 Sep 2021 19:55:37 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 21:55:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0056f92a782-b277-401a-acf3-7d0cb8aee7f1,
 B58C78742DCB5DC23679A7A9E2785397667D7E18) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] target/ppc: Fix 64-bit decrementer
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210913162758.3806730-1-clg@kaod.org>
 <1a8d9768-7763-91b6-5faa-8e984370adef@amsat.org>
 <CP2PR80MB3668E1FEBAC42ECE29175B94DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CP2PR80MB3668565CE360D6FB1E098461DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
 <CP2PR80MB3668B15986C856C4BF48DFC9DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dec8bdba-c61a-28e0-3015-ef1db0450347@kaod.org>
Date: Mon, 13 Sep 2021 21:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB3668B15986C856C4BF48DFC9DAD99@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e85d8967-de35-4e14-bfb0-f1eee7864be7
X-Ovh-Tracer-Id: 12445979048121043750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgudegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefggeehhfdtkefhteeghfeghefgudfhteevteeltefgffevhfeggeffhfevleelfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 8:05 PM, Luis Fernando Fujita Pires wrote:
>>>     value = extract64(value, 0, nr_bits);
>>>     value = ((target_long)value << (64 - nr_bits)) >> (64 - nr_bits);
>>
>> Oops, sorry. 64 might not be correct here. It would depend on the target being
>> either 32 or 64.
> 
> In fact, sextract already does the sign extension, so this should be all that's needed, right?
>     value = sextract<32,64>(value, 0, nr_bits);

I am fine with any solution ! Please give a try to this machine  :

  https://github.com/legoater/qemu/tree/microwatt

It's the only one with a 64 bit decrementer :) 

(We should come up with a simpler test case)

Thanks,

C.

