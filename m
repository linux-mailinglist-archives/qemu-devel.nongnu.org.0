Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973866621C4
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoRv-0004Qx-HB; Mon, 09 Jan 2023 04:28:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEoRn-0004Ly-E5; Mon, 09 Jan 2023 04:28:07 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pEoRk-0005nK-LH; Mon, 09 Jan 2023 04:28:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6BC2515202DED;
 Mon,  9 Jan 2023 10:27:48 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 9 Jan
 2023 10:27:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064b132e77-35f8-4a86-b216-baae548b4ac4,
 1F76CF3ACB56F17C32A409AA235EFAF7B7A61927) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bc3ec4b4-1c7a-a4a9-01ea-78fca7ad10c6@kaod.org>
Date: Mon, 9 Jan 2023 10:27:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 3/4] s390x/pv: Introduce a s390_pv_check() helper for
 runtime
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, <qemu-s390x@nongnu.org>
CC: <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230106075330.3662549-1-clg@kaod.org>
 <20230106075330.3662549-4-clg@kaod.org>
 <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <49bf32c7-4a44-a3c9-29b5-b6580113700c@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 5f2858b5-dbce-484d-a360-fe694f340d0c
X-Ovh-Tracer-Id: 16002415378306403317
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgddufeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhhrrghnkhhjrgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdhsfeeltdigsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdhprghsihgtsehlihhnuhigrdhisghmrdgtohhmpdgsohhrnhhtrhgrvghgvghrsehlihhnuhigrdhisghmrdgtohhmpdhimhgsrhgvnhgurgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesrhgvughhrghtrdgtohhmpdhiihhisehlihhnuhigrdhisg
 hmrdgtohhmpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdptghlghesrhgvughhrghtrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
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

On 1/9/23 10:04, Janosch Frank wrote:
> On 1/6/23 08:53, Cédric Le Goater wrote:
>> From: Cédric Le Goater <clg@redhat.com>
>>
>> If a secure kernel is started in a non-protected VM, the OS will hang
>> during boot without giving a proper error message to the user.
> 
> Most of the time you see nothing in the console because libvirt is too slow. If you start the VM in paused mode, attach a console and then resume it, then you'll see a nice error message.

If you wait long enough, the VM fails to mount / and falls into the dracut
initrams.

>> Perform the checks on Confidential Guest support at runtime with an
>> helper called from the service call switching the guest to protected
>> mode.
> 
> If we don't have PV support then the subcodes >=8 are a specification exception 
> so this is never executed AFAIK.

It is. The test on huge page size was added just above this change.

Thanks,

C.

> 
>>       if (env->psw.mask & PSW_MASK_PSTATE) {
>>           s390_program_interrupt(env, PGM_PRIVILEGED, ra);
>> @@ -176,6 +177,12 @@ out:
>>               return;
>>           }
>> +        if (!s390_pv_check(&local_err)) {
>> +            error_report_err(local_err);
>> +            env->regs[r1 + 1] = DIAG_308_RC_INVAL_FOR_PV;
>> +            return;
>> +        }
>> +
>>           s390_ipl_reset_request(cs, S390_RESET_PV);
>>           break;
>>       default:
> 


