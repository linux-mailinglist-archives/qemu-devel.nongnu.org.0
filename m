Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D60454347
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 10:06:38 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGto-0002br-Uw
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 04:06:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnGsN-0001fN-RZ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:05:07 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:41673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnGsC-0007JJ-Ek
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 04:04:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.58])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id CCF712135B;
 Wed, 17 Nov 2021 09:04:45 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 10:04:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0014d8ec1ff-d525-4cb4-9a17-7b9ab9950e56,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <595c68ab-cd7b-ab62-0d5b-d2246cc67c45@kaod.org>
Date: Wed, 17 Nov 2021 10:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] pci-host: Allow extended config space access for PowerNV
 PHB4 model
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Christophe
 Lombard <clombard@linux.vnet.ibm.com>, Ben Widawsky <ben.widawsky@intel.com>
References: <20211109145053.43524-1-clombard@linux.vnet.ibm.com>
 <67182075-8e5b-08ad-d17f-405b720a6fb5@linux.ibm.com>
 <1419c2a2-8e19-d9d6-d9aa-b6b7abccfb99@kaod.org>
 <085729f8-3e15-1a62-1b13-6214f0da2806@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <085729f8-3e15-1a62-1b13-6214f0da2806@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2a2b0d87-cbf4-4420-8515-e95aa981a088
X-Ovh-Tracer-Id: 14244041196878400434
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnrdgtrghmvghrohhnsehhuhgrfigvihdrtghomh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 08:59, Philippe Mathieu-Daudé wrote:
> On 11/9/21 17:04, Cédric Le Goater wrote:
>> On 11/9/21 16:51, Frederic Barrat wrote:
>>>
>>>
>>> On 09/11/2021 15:50, Christophe Lombard wrote:
>>>> The PCIe extended configuration space on the device is not currently
>>>> accessible to the host. if by default,  it is still inaccessible for
>>>> conventional for PCIe buses, add the current flag
>>>> PCI_BUS_EXTENDED_CONFIG_SPACE on the root bus permits PCI-E extended
>>>> config space access.
>>
>> For the record, this is coming from an experiment of plugging a
>> CXL device on a QEMU PowerNV POWER10 machine (baremetal). Only
>> minor changes (64 bits ops) were required to get it working.
> 
> Since this note could be helpful when having future retrospective,
> do you mind amending this note to the commit description?

Yes. I agree. Please do.
  
>> I wonder where we are with the CXL models ?
> 
> IIRC Ben worked actively, asked help to the community but received
> very few, basically because there is not enough man power IMHO.
> 
> Last thing I remember is Igor suggested a different design approach:
> https://lore.kernel.org/qemu-devel/20210319180705.6ede9091@redhat.com/

Well, the CXL Linux driver seemed to work fine on QEMU machines, Intel
and POWER.

Thanks for the info,

C.
  

