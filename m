Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C04A58A7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:42:59 +0100 (CET)
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEokb-0004Yi-Nc
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:42:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEoFE-0006CL-Ke
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:10:44 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:52005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nEoEs-0002Dq-To
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 03:10:13 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 800F221CB1;
 Tue,  1 Feb 2022 08:10:07 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 1 Feb
 2022 09:10:06 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00570064fa8-9f31-4af2-9eb1-8998cf53c817,
 FC28BB27814F05D37416E671BAFA2F1ED858982E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <4c9d1067-441c-7640-09cb-5e3a26b7e8e2@kaod.org>
Date: Tue, 1 Feb 2022 09:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/11] target/ppc: powerpc_excp improvements [BookE] (6/n)
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
 <c9bb63f8-c2e8-31e5-fe24-b9923c2c1821@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <c9bb63f8-c2e8-31e5-fe24-b9923c2c1821@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 20a2f371-0d3a-4d88-86ea-233c47276682
X-Ovh-Tracer-Id: 16924245925505960742
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrgedvgdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgffhjeeghfdtvdeltedvteettdejffelhfegvdejffekteeiheegleeftdeltdeunecuffhomhgrihhnpegsmhgvrdhhuhdpghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Zoltan,

On 1/29/22 01:07, BALATON Zoltan wrote:
> On Fri, 28 Jan 2022, Fabiano Rosas wrote:
>> This series handles the BookE exception code.
>>
>> Tested the following machines/CPUs:
>>
>> == bamboo ==
>> 440ep, 460ex, 440-xilinx-w-dfpu
>>
>> == sam460ex ==
>> 440ep, 460ex, 440-xilinx-w-dfpu
> 
> What OS did you test with? Other than the 460ex may not make much sense on this board but checking it never hurts. If you only tried Linux kernel then something else to give more coverage could be the same MorphOS iso that used for pegasos2 which should also boot on sam460ex as shown here:
> 
> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos
> 
> or the AROS iso further up that page that should also boot on sam460ex.
> 

I didn't see any issue.

Could you please give a try to this branch :

   https://gitlab.com/legoater/qemu/-/tree/ppc-7.0

Thanks,

C.

