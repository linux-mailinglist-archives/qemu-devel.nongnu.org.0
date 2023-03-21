Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41B6C3835
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 18:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pefoj-0002cQ-4u; Tue, 21 Mar 2023 13:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pefog-0002Zt-JO
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:30:34 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pefoe-00013u-Tw
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 13:30:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 181C32075A;
 Tue, 21 Mar 2023 17:30:20 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 21 Mar
 2023 18:30:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002e3ec6770-96b0-487a-88a5-19d1de8a36b4,
 5B067CF34495ED4C60685936DF3BC55C5DDA2181) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1d364b78-3dbb-87cb-daff-e92f40444ab7@kaod.org>
Date: Tue, 21 Mar 2023 18:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: About the instance_finalize callback in VFIO PCI
Content-Language: en-US
To: Yang Zhong <yang.zhong@linux.intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>
References: <ZBgn90bjw9iRaTrw@yangzhon>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ZBgn90bjw9iRaTrw@yangzhon>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ebfea848-0ea6-4c79-8025-40c4993ed4d2
X-Ovh-Tracer-Id: 16837833110475410400
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohephigrnhhgrdiihhhonhhgsehlihhnuhigrdhinhhtvghlrdgtohhmpdgrlhgvgidrfihilhhlihgrmhhsohhnsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/20/23 10:31, Yang Zhong wrote:
> Hello Alex and Paolo,
> 
> There is one instance_finalize callback definition in hw/vfio/pci.c, but
> i find this callback(vfio_instance_finalize()) never be called during the
> VM shutdown with close VM or "init 0" command in guest.
> 
> The Qemu related command:
>     ......
>     -device vfio-pci,host=d9:00.0
>     ......

well, the finalize op is correctly called for hot unplugged devices, using
device_add.

> static const TypeInfo vfio_pci_dev_info = {
>      .name = TYPE_VFIO_PCI,
>      .parent = TYPE_PCI_DEVICE,
>      .instance_size = sizeof(VFIOPCIDevice),
>      .class_init = vfio_pci_dev_class_init,
>      .instance_init = vfio_instance_init,
>      .instance_finalize = vfio_instance_finalize,
>      .interfaces = (InterfaceInfo[]) {
>          { INTERFACE_PCIE_DEVICE },
>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>          { }
>      },
> };
> 
> If my test method is wrong, would you please tell me how to trigger to
> this callback when VM shutdown? thanks

I would have thought that user_creatable_cleanup would have taken care
of it. But it's not. This needs some digging.

C.

  
> By the way, i also debugged other instance_finalize callback functions,
> if my understanding is right, all instance_finalize callback should be
> called from object_unref(object) from qemu_cleanup(void) in
> ./softmmu/runstate.c. But there is no VFIO related object_unref() call in
> this cleanup function, So the instance_finalize callback in vfio pci
> should be useless? thanks!
> 
> Regards,
> Yang
> 
> 


