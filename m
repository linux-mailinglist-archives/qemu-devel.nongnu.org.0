Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE76C9D92
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 10:21:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgi67-0007SI-Fo; Mon, 27 Mar 2023 04:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgi5z-0007Rd-My
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:20:52 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pgi5v-0004am-UG
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 04:20:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 09BD821B1E;
 Mon, 27 Mar 2023 08:20:44 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 27 Mar
 2023 10:20:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001ead2eb2d-5bd0-473e-afa5-60b2e838695e,
 A6C3435B678E6C193C864925704A598F32E2E8B9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f633240f-f8b5-bb7c-6967-7408837181fc@kaod.org>
Date: Mon, 27 Mar 2023 10:20:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 0/3] Add support for TPM devices over I2C bus
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Ninad Palsule <ninad@linux.vnet.ibm.com>
CC: Ninad Palsule <ninad@linux.ibm.com>, <qemu-devel@nongnu.org>,
 <andrew@aj.id.au>, <stefanb@linux.ibm.com>
References: <20230326224426.3918167-1-ninad@linux.ibm.com>
 <CACPK8XeZA8nqhgjH_SUDrk3A49dUqnKVONtj+QtcnjOsLUjvGQ@mail.gmail.com>
 <a9ba4cf8-cd4d-2038-6328-66f61ad3ed70@linux.vnet.ibm.com>
 <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfrM0cCdW7a2+Leiw8dD2RAc8Xakx4ptdE5wdtjp=P27Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fb260b6d-1115-4043-9e7f-6fffa0cb74c3
X-Ovh-Tracer-Id: 5898308139531275046
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeffffgleevgfduveefjeehheetgfefveeluedvjeekieelleettdeivdekleeiveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhnihhnrggusehlihhnuhigrdhvnhgvthdrihgsmhdrtghomhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

>>> However on a clean boot into the TPM, the u-boot tpm commands fail:
>>>
>>> ast# tpm info
>>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [closed]
>>> ast# tpINTERRUPT>
>>> ast# tpm init
>>> ast# tpm info
>>> tpm@2e v2.0: VendorID 0x1014, DeviceID 0x0001, RevisionID 0x01 [open]
>>> ast# tpm pcr_read 0 0x81000000
>>> Error: 256
>>> ast# md.l 0x81000000 16
>>> 81000000: 00000000 00000000 00000000 00000000    ................
>>> 81000010: 00000000 00000000 00000000 00000000    ................
>>> 81000020: 00000000 00000000 00000000 00000000    ................
>>> 81000030: 00000000 00000000 00000000 00000000    ................
>>> 81000040: 00000000 00000000 00000000 00000000    ................
>>> 81000050: 00000000 00000000                      ........
>>>
>>> This doesn't need to block merging into qemu, as the model works fine
>>> for pcr measurement and accessing under Linux. However it would be
>>> good to work though these issues in case there's a modelling
>>> discrepancy.
>>
>>
>> Yes, Please provide me details on how to reproduce it. I will take a look.
> 
> This is the buildroot tree I've been using for testing:
> 
> https://github.com/shenki/buildroot/commits/ast2600-tpm
> 
> git clone https://github.com/shenki/buildroot -b ast2600-tpm
> cd buildroot
> make O=ast2600evb aspeed_ast2600evb_defconfig

I have pushed binaries here also :

   https://github.com/legoater/qemu-aspeed-boot/tree/master/images/ast2600-evb/buildroot-2023.02-tpm

Cheers,

C.


