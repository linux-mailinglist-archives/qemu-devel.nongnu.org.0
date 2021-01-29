Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0405830871A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:41:57 +0100 (CET)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PLn-0004Hi-Vs
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5PJX-0003Ai-PQ; Fri, 29 Jan 2021 03:39:35 -0500
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1l5PJU-00051z-Vw; Fri, 29 Jan 2021 03:39:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id C028C25F9D3;
 Fri, 29 Jan 2021 09:39:19 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 29 Jan
 2021 09:39:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044ce540c0-c2c6-43c1-8e5b-fb0512ad1570,
 1047C7D7CBF627F9D51619F8EB187DD3EDDBAFD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 4/7] ppc/pnv: Simplify pnv_bmc_create()
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210126171059.307867-1-clg@kaod.org>
 <20210126171059.307867-5-clg@kaod.org>
 <CACPK8Xfw-E8TetGdfDYpMZChFbY7cQNGLX8_xh390A-vanS--w@mail.gmail.com>
 <9ea1ce11-15ba-3eea-f7a4-b036a9db841f@kaod.org>
 <20210128224011.GB6951@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9cd3c937-90a7-5a5d-aefd-8f1d1fd4ff48@kaod.org>
Date: Fri, 29 Jan 2021 09:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210128224011.GB6951@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3d1f0eb1-b5c2-41fd-a013-59ed725c15e7
X-Ovh-Tracer-Id: 14535086323939445542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedugdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelgfejveehieefffduueehvdevfedtleeiudekjeegveeigfeifefhtdfffedtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 11:40 PM, David Gibson wrote:
> On Thu, Jan 28, 2021 at 08:46:01AM +0100, Cédric Le Goater wrote:
>> On 1/28/21 1:46 AM, Joel Stanley wrote:
>>> On Tue, 26 Jan 2021 at 17:14, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> and reuse pnv_bmc_set_pnor() to share the setting of the PNOR.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>  hw/ppc/pnv_bmc.c | 7 +------
>>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
>>>> index 67ebb16c4d5f..86d16b493539 100644
>>>> --- a/hw/ppc/pnv_bmc.c
>>>> +++ b/hw/ppc/pnv_bmc.c
>>>> @@ -260,13 +260,8 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>>>>      Object *obj;
>>>>
>>>>      obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
>>>> -    object_ref(OBJECT(pnor));
>>>> -    object_property_add_const_link(obj, "pnor", OBJECT(pnor));
>>>
>>> I assume it's ok to move the link set to after the realise of the BMC object?
>>  
>>
>> When 2 objects need to be linked, one has to be realized first. 
>> I suppose this is why it is allowed but I am not expert in that area. 
>>
>> Greg  ?
>>
>> That was the case already when defining a "ipmi-bmc-sim" device on the 
>> command line.
> 
> Well, the other thing here is that the IPMI_BMC_SIMULATOR isn't a
> POWER specific object, and doesn't actually know anything about pnor,
> so it never looks at that property.  Do we even need it?

It does through hiomap_cmd() which handles HIOMAP commands related 
to the PNOR. The link was introduced to remove a reference to the 
global machine (qdev_get_machine()). The PNOR device is instantiated 
at the machine level but conceptually, this is incorrect. 

The PNOR is a device controlled by the BMC and accessed by the host 
through a mapping on the LPC FW address space. It used to be controlled 
from the host also, through the iLPC2AHB device and mboxes, but these 
"doors" were closed sometime ago.

I am thinking of moving the PNOR at the BMC level. It won't change 
the default device settings but '-nodefaults' will result in no PNOR, 
same impact if the BMC device is an external one, but that's a more 
complex matter. We would need a way to model memory operations on a 
LPC bus shared by two QEMU machines.

We are doing something similar with the Aspeed iBT device but it's
very specific to this device. I hope the QEMU multi-process patchset
offers some framework on which we can build upon.

C.

