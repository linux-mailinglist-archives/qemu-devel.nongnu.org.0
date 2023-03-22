Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1E6C4B33
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:57:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pey11-0006bN-Hw; Wed, 22 Mar 2023 08:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pey0w-0006aU-HP
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:56:26 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pey0u-0006cQ-Hj
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:56:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.108])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 99B502B298;
 Wed, 22 Mar 2023 12:56:19 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 22 Mar
 2023 13:56:18 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00687bcd0ab-1be3-4e7e-96b5-7050d7f7ea17,
 0238FB4F90E64FBF2D0582C5546B9BA65CD8F58A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <62b9e8b3-a619-573d-c641-d80a12c3ab59@kaod.org>
Date: Wed, 22 Mar 2023 13:56:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: About the instance_finalize callback in VFIO PCI
Content-Language: en-US
To: Yang Zhong <yang.zhong@linux.intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <ZBgn90bjw9iRaTrw@yangzhon>
 <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org> <ZBr0dr7xPjZrn3e5@yangzhon>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZBr0dr7xPjZrn3e5@yangzhon>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 661365ac-ece5-4fc6-9a18-bc984d2ec397
X-Ovh-Tracer-Id: 18082796932707879904
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegvddggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohephigrnhhgrdiihhhonhhgsehlihhnuhigrdhinhhtvghlrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/22/23 13:28, Yang Zhong wrote:
> On Tue, Mar 21, 2023 at 06:30:14PM +0100, Cédric Le Goater wrote:
>> On 3/20/23 10:31, Yang Zhong wrote:
>>> Hello Alex and Paolo,
>>>
>>> There is one instance_finalize callback definition in hw/vfio/pci.c, but
>>> i find this callback(vfio_instance_finalize()) never be called during the
>>> VM shutdown with close VM or "init 0" command in guest.
>>>
>>> The Qemu related command:
>>>      ......
>>>      -device vfio-pci,host=d9:00.0
>>>      ......
>>
>> well, the finalize op is correctly called for hot unplugged devices, using
>> device_add.
>>
>     Thanks Cédric, i can use device_del command in the monitor to
>     trigger this instance_finalize callback function in the VFIO PCI.
>     thanks!

yes. I think that in the shutdown case, QEMU simply relies on exit() to
do the cleanup. On the kernel side, unmaps, fds being closed trigger any
allocated resources.

Out of curiosity, what were you trying to achieve in the finalize op ?

Thanks,

C.

