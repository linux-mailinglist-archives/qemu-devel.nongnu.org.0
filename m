Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06065F2CA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:34:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTnl-00077i-9A; Thu, 05 Jan 2023 12:13:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTnT-00072m-Kg
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:12:59 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pDTnN-0008P4-Vd
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 12:12:54 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C7F112CEAE;
 Thu,  5 Jan 2023 17:12:44 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 5 Jan
 2023 18:12:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004e249a75e-e4a4-4b87-b64b-2bb27481faf5,
 38A898BAFC987BCB81F2B5AC485E5C68320ADD45) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3f5a688e-c15f-8326-fdea-06a43fba7f37@kaod.org>
Date: Thu, 5 Jan 2023 18:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/5] s390x/pv: Implement CGS check handler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>
CC: <qemu-s390x@nongnu.org>, <qemu-devel@nongnu.org>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-3-clg@kaod.org>
 <61d70e15-770b-7f62-54aa-3cc0ac3b3a35@redhat.com>
 <20230105145823.6a7345e6@p-imbrenda>
 <41e8c81a-ac90-3b57-c34b-c4e461323391@kaod.org>
 <0ec1a61f-4ae9-e867-11ea-4f29944d31f8@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0ec1a61f-4ae9-e867-11ea-4f29944d31f8@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fab601c8-cf65-424b-a299-6f926e86f36b
X-Ovh-Tracer-Id: 363665672504511480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjeekgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhhuhhthhesrhgvughhrghtrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpd
 gurghvihgusehrvgguhhgrthdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpfhgrrhhmrghnsehlihhnuhigrdhisghmrdgtohhmpdgtlhhgsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

[ .. ]

>> The problem is that QEMU doesn't know about the S390_FEAT_EXTENDED_LENGTH_SCCB
>> feature when the PV object link is first checked. So #248 CPUs is considered
>> valid, but when DIAG308_PV_START is called, it fails.
> 
> Drat. Is there any chance that the check could be done somewhere later?
  
s390_pv_init() could be the place. It looks like a good option since the CPUs have
been initialized. To be explored.

Thanks,

C.


>> Let's simplify and use :
>>
>>      int offset_cpu = offsetof(ReadInfo, entries);
>>      pv_max_cpus = (TARGET_PAGE_SIZE - offset_cpu) /sizeof(CPUEntry);
>>
>> ?
> 
> Depends ... if it is possible to use 248 CPUs with -cpu els=off,diag318=off then it would be nicer to allow that, too?
> 
>   Thomas
> 


