Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9358C36C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 08:44:52 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKwVP-0004bp-An
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 02:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oKwTC-00033t-5J; Mon, 08 Aug 2022 02:42:34 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:49869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oKwT9-00072Q-1J; Mon, 08 Aug 2022 02:42:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A04A711D49801;
 Mon,  8 Aug 2022 08:42:18 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 8 Aug 2022
 08:42:17 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0062f93ee5d-fee5-42d9-b7c5-8ba1074b538e,
 014009DFAA8B86078D729D00C01D9476BEEC0396) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a5e205f9-d5d4-45c6-f10d-32d75315529c@kaod.org>
Date: Mon, 8 Aug 2022 08:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Peter Maydell
 <peter.maydell@linaro.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, "list@suse.de:PowerPC"
 <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
 <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
 <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
 <ceb063e-b796-a5b1-5bd1-4cd81c5ed2d@eik.bme.hu>
 <CAFEAcA_eTMV5DKVfe6wdPgbXPTp6aw7FoMjxPratgohMA5F+7Q@mail.gmail.com>
 <27b7eacd-6946-9eb5-5320-7a404de75a7@eik.bme.hu>
 <b4f8b5cd-aa53-b89-4ccf-6be71babdc77@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b4f8b5cd-aa53-b89-4ccf-6be71babdc77@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 1c5febfd-4938-40a0-b94b-81f505b0ae72
X-Ovh-Tracer-Id: 12702965699241872291
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/22 11:38, BALATON Zoltan wrote:
> On Fri, 5 Aug 2022, BALATON Zoltan wrote:
>> On Fri, 5 Aug 2022, Peter Maydell wrote:
>>> On Fri, 5 Aug 2022 at 17:50, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>> This also
>>>> allows to get the cpu without a link with something like:
>>>>
>>>> PPC4XX_MACHINE(current_machine /* or qdev_get_machine() */)->soc.cpu
>>>
>>> ...and now you have device code that's making assumptions about
>>> the machine and SoC it's in.
>>
>> Since these devices are strictly part of this SoC making this asumption should be OK. Making assumption about the machine may be a valid argument
> 
> I think this is my really last comment on this topic but I can't stop thinking about this. If we can't user parent or get the cpu any other way and we have to use a link property then we probably need a PPC4xxSocDevice abstract class that has the cpu link and all these devices derive from that. 

When experimenting, I added a PPC4xx_DCR_DEVICE implementing what
you are proposing. I didn't keep it because the benefits are limited
and adding a DCR address space would be a better change. If you think
it would help QOMifying the other PPC4xx parts, I can include it in v3.

See below,

> That way the boilerplate for the link property is confined to this SocDevice class and does not have to be repeated in every other SoC device. Unless QOM properties don't work that way and they would need to be aliased in which case it does not bring anything.

You still have to set the object link before "realizing" each object.

Thanks,

C.


#define TYPE_PPC4xx_DCR_DEVICE "ppc4xx-dcr"
OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxDcrDeviceState, PPC4xx_DCR_DEVICE);
struct Ppc4xxDcrDeviceState {
     SysBusDevice parent_obj;

     PowerPCCPU *cpu;
};

void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn,
                          dcr_read_cb dcr_read, dcr_write_cb dcr_write)
{
     CPUPPCState *env;

     assert(dev->cpu);

     env = &dev->cpu->env;

     ppc_dcr_register(env, dcrn, dev, dcr_read, dcr_write);
}

static Property ppc4xx_dcr_properties[] = {
     DEFINE_PROP_LINK("cpu", Ppc4xxDcrDeviceState, cpu, TYPE_POWERPC_CPU,
                      PowerPCCPU *),
     DEFINE_PROP_END_OF_LIST(),
};

static void ppc4xx_dcr_class_init(ObjectClass *oc, void *data)
{
     DeviceClass *dc = DEVICE_CLASS(oc);

     dc->user_creatable = false;
     device_class_set_props(dc, ppc4xx_dcr_properties);
}

static const TypeInfo ppc4xx_types[] = {
    {
         .name           = TYPE_PPC4xx_DCR_DEVICE,
         .parent         = TYPE_SYS_BUS_DEVICE,
         .instance_size  = sizeof(Ppc4xxDcrDeviceState),
         .class_init     = ppc4xx_dcr_class_init,
         .abstract       = true,
    }
};

