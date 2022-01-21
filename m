Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C7496524
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:34:47 +0100 (CET)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAykH-0002ee-Hg
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:34:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAyAO-0007YD-Lz
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:57:40 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:36239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nAyAL-0003L7-RT
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:57:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.27])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 82D42227F2;
 Fri, 21 Jan 2022 17:57:35 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 18:57:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003514f822e-297e-4e75-8e73-6aea91ab2239,
 0868046A3D5FFD4A19DAA1F3199B5438DDC438D4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7fc4a74-2f20-451e-6a4f-d89c395c24ff@kaod.org>
Date: Fri, 21 Jan 2022 18:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Help with ppc e500 tlb usage
Content-Language: en-US
To: Jesse Millwood <jmillwood@masten.aero>
References: <PH1P110MB12849EB7B10C757A6B9FEA4FB0589@PH1P110MB1284.NAMP110.PROD.OUTLOOK.COM>
 <a05a8a93-3d82-2703-f509-c0e047e6b00d@kaod.org>
 <SA1P110MB1293AF07B83EE30F41B8DD58B05B9@SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SA1P110MB1293AF07B83EE30F41B8DD58B05B9@SA1P110MB1293.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3d25dd5d-9722-4ebd-aff9-55366481199c
X-Ovh-Tracer-Id: 17586275070933633955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: David Gibson <dgibson@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Thanks for the background info Cédric, I wasn't aware of the MMUv2. I see now that in target/ppc/cpu_init.c the e500v2 and e5500 have the same mmu_model, the POWREPC_MMU_BOOKE206.
> I'd like to be able to set the initial tlb entry size from the platform definition by indicating the size in kib. I'll just use the 2^TSIZE then.

Well, the approach of adding a class attribute and for a new machine
is the right one.
>> The e500 only supports the following page sizes:
>>
>>              0b0001 4KB
>>              0b0010 16KB
>>              0b0011 64KB
>>              0b0100 256KB
>>              0b1011 4GB
>>              0b0101 1MB
>>              0b0110 4MB
>>              0b0111 16MB
>>              0b1000 64MB
>>              0b1001 256MB
>>              0b1010 1GB
>>
> 
> Is that how much the emulated e500 supports? The E500 Core Reference manual states that it supports up to 4GiB.

Yes the list is out of order ! :)

Thanks,

C.

