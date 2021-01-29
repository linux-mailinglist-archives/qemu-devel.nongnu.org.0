Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426CC30875C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:31:46 +0100 (CET)
Received: from localhost ([::1]:59336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Q81-0007DP-Bj
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Pwn-0000Ii-4A; Fri, 29 Jan 2021 04:20:09 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:36763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5Pwl-0005Lk-8H; Fri, 29 Jan 2021 04:20:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 8740D86F622C;
 Fri, 29 Jan 2021 10:20:03 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 10:20:00 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0021d782c6f-47dc-4c83-9b28-a07bc79dceee,
 1047C7D7CBF627F9D51619F8EB187DD3EDDBAFD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 3/7] ppc/pnv: Use skiboot addresses to load kernel and
 ramfs
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-4-clg@kaod.org>
 <CACPK8Xdp12MC2yg23t61pLjFL-HEQg1tqL=aOjrQ-jrZ17b=cQ@mail.gmail.com>
 <48a1fc34-88fe-105c-35af-729dae73e1fb@kaod.org>
 <20210128223650.GA6951@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <266e34b1-f31f-95af-5881-55b58b528122@kaod.org>
Date: Fri, 29 Jan 2021 10:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128223650.GA6951@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 27ad4e57-71db-47f2-b89f-b7725a09f574
X-Ovh-Tracer-Id: 15223011167119117094
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedvgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeglefgjeevheeifeffudeuhedvveeftdeliedukeejgeeviefgieefhfdtffeftdenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 11:36 PM, David Gibson wrote:
> On Thu, Jan 28, 2021 at 08:02:41AM +0100, Cédric Le Goater wrote:
>> On 1/28/21 1:45 AM, Joel Stanley wrote:
>>> On Tue, 26 Jan 2021 at 17:11, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> The current settings are useful to load large kernels (with debug) but
>>>> it moves the initrd image in a memory region not protected by
>>>> skiboot. If skiboot is compiled with DEBUG=1, memory poisoning will
>>>> corrupt the initrd.
>>>>
>>>> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>>
>>> Note that the machine's default ram size will change with this patch:
>>>
>>>  mc->default_ram_size = INITRD_LOAD_ADDR + INITRD_MAX_SIZE;
>>
>> Ah yes. I missed that.
>>
>>> So we will go from 1.75GB to 768MB. Does anything break when the
>>> machine has less than 1GB of ram?
>>
>> There is a warning if the machine has less than 1GB but we should
>> also change the default RAM size to 1G to be on the safe side.
> 
> I've merged the patch, but I'm happy to replace it with an updated
> version, or fold in a change, if that helps.

I will send a little fix to set the default RAM size of the machine.

Thanks,

C. 


