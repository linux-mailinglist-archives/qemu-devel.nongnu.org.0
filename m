Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3DA665073
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 01:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFP99-0006cm-4o; Tue, 10 Jan 2023 19:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFP8z-0006cY-4c; Tue, 10 Jan 2023 19:39:05 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pFP8w-0001y7-MN; Tue, 10 Jan 2023 19:39:04 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 26CF7745712;
 Wed, 11 Jan 2023 01:36:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B7FA8745706; Wed, 11 Jan 2023 01:36:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B51C17456E3;
 Wed, 11 Jan 2023 01:36:38 +0100 (CET)
Date: Wed, 11 Jan 2023 01:36:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
In-Reply-To: <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
Message-ID: <61305eda-439b-800e-2265-c2c48bc21be9@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
 <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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

On Tue, 10 Jan 2023, Mark Cave-Ayland wrote:
> On 04/01/2023 21:59, BALATON Zoltan wrote:
>> The mac99 machine emulates different machines depending on machine
>> properties or even if it is run as qemu-system-ppc64 or
>> qemu-system-ppc. This is very confusing for users and many hours were
>> lost trying to explain it or finding out why commands users came up
>> with are not working as expected. (E.g. Windows users might think
>> qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
>> then fail to boot a 32 bit OS with -M mac99 trying to follow an
>> example that had qemu-system-ppc.) To avoid such confusion, add
>> explicit machine types for the different configs which will work the
>> same with both qemu-system-ppc and qemu-system-ppc64 and also make the
>> command line clearer for new users.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>
> Some thoughts on this: the first is that not everyone agrees that for 
> qemu-system-X that X represents the target. There were previous discussion 
> where some KVM people assumed X represented the host, i.e. ppc64 was the 
> binary that ran all PPC guests but with hardware acceleration for ppc64 
> guests on ppc64 hosts. This was a while ago, so it may be worth starting a 
> thread on qemu-devel to see what the current consensus is.

I don't see how this is relevant to this series, Also likely not the case 
any more as qemu-system-ppc and qemu-system-ppc64 share most of the code 
since a while with ppc64 including the config of ppc and adding more 
machines.

> Secondly it's not clear to me why you've chosen names like "powermac_3_1" 
> instead of "g4agp"? Does powermac_3_1 uniquely identify the G4 AGP Sawtooth 
> model? For QEMU it is always best to emulate real machines, and whilst I 
> understand you want to separate out the two versions of the mac99 machine, 
> having "powermac_X_Y" seems less clear to me.

These machine model identifiers are used by Apple to uniquely identify 
(all of) their machines since new-world Macs (even modern iPads and Macs 
have them) so for Mac people this should be clearer than the informal 
names that could get a bit long and confusing as there may be slight 
differences within a family. In any case, qemu-system-ppc -M mac99 is not 
corresponding to any real Mac so I'd like the options which do emulate 
real Macs to be called in a name that show which Mac is that. For the PPC 
Macs there's some info here for example:

https://en.wikipedia.org/wiki/Power_Mac_G4

And everymac.com also has info on all Macs. There were actually more than 
one G4 PowerMac with AGP but the other one was informally called gigabit 
ethernet. So the model ID is a shorter and better way to clearly identify 
which hardware is it (and it's also referenced in the device-tree of these 
Macs).

> Finally can you post links to the device trees that you are using for each of 
> the new machine types so that we have a clear reference point for future 
> changes to the QEMU Mac machines? Even better include the links in the 
> comments for each machine so that the information is easily visible for 
> developers.

I still have those I've posted over the past 8 years when I made changes 
to OpenBIOS to make the device-tree closer to real machine. I've 
downloaded it back then, don't know where to find it now but searching for 
e.g. "PowerMac3,1" "device-tree" should get some results.

Regards,
BALATON Zoltan

>> ---
>>   hw/ppc/mac_newworld.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 94 insertions(+)
>> 
>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>> index 60c9c27986..3f5d1ec097 100644
>> --- a/hw/ppc/mac_newworld.c
>> +++ b/hw/ppc/mac_newworld.c
>> @@ -642,9 +642,103 @@ static const TypeInfo core99_machine_info = {
>>       },
>>   };
>>   +static void powermac3_1_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    core99_machine_class_init(oc, data);
>> +    mc->desc = "Apple Power Mac G4 AGP (Sawtooth)";
>> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
>> +}
>> +
>> +static void powermac3_1_instance_init(Object *obj)
>> +{
>> +    Core99MachineState *cms = CORE99_MACHINE(obj);
>> +
>> +    cms->via_config = CORE99_VIA_CONFIG_PMU;
>> +    return;
>> +}
>> +
>> +static const TypeInfo powermac3_1_machine_info = {
>> +    .name          = MACHINE_TYPE_NAME("powermac3_1"),
>> +    .parent        = TYPE_MACHINE,
>> +    .class_init    = powermac3_1_machine_class_init,
>> +    .instance_init = powermac3_1_instance_init,
>> +    .instance_size = sizeof(Core99MachineState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_FW_PATH_PROVIDER },
>> +        { }
>> +    },
>> +};
>> +
>> +static void powerbook3_2_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    core99_machine_class_init(oc, data);
>> +    mc->desc = "Apple PowerBook G4 Titanium (Mercury)";
>> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
>> +}
>> +
>> +static void powerbook3_2_instance_init(Object *obj)
>> +{
>> +    Core99MachineState *cms = CORE99_MACHINE(obj);
>> +
>> +    cms->via_config = CORE99_VIA_CONFIG_PMU_ADB;
>> +    return;
>> +}
>> +
>> +static const TypeInfo powerbook3_2_machine_info = {
>> +    .name          = MACHINE_TYPE_NAME("powerbook3_2"),
>> +    .parent        = TYPE_MACHINE,
>> +    .class_init    = powerbook3_2_machine_class_init,
>> +    .instance_init = powerbook3_2_instance_init,
>> +    .instance_size = sizeof(Core99MachineState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_FW_PATH_PROVIDER },
>> +        { }
>> +    },
>> +};
>> +
>> +#ifdef TARGET_PPC64
>> +static void powermac7_3_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    core99_machine_class_init(oc, data);
>> +    mc->desc = "Apple Power Mac G5 (Niagara)";
>> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
>> +}
>> +
>> +static void powermac7_3_instance_init(Object *obj)
>> +{
>> +    Core99MachineState *cms = CORE99_MACHINE(obj);
>> +
>> +    cms->via_config = CORE99_VIA_CONFIG_PMU;
>> +    return;
>> +}
>> +
>> +static const TypeInfo powermac7_3_machine_info = {
>> +    .name          = MACHINE_TYPE_NAME("powermac7_3"),
>> +    .parent        = TYPE_MACHINE,
>> +    .class_init    = powermac7_3_machine_class_init,
>> +    .instance_init = powermac7_3_instance_init,
>> +    .instance_size = sizeof(Core99MachineState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { TYPE_FW_PATH_PROVIDER },
>> +        { }
>> +    },
>> +};
>> +#endif
>> +
>>   static void mac_machine_register_types(void)
>>   {
>>       type_register_static(&core99_machine_info);
>> +    type_register_static(&powermac3_1_machine_info);
>> +    type_register_static(&powerbook3_2_machine_info);
>> +#ifdef TARGET_PPC64
>> +    type_register_static(&powermac7_3_machine_info);
>> +#endif
>>   }
>>     type_init(mac_machine_register_types)
>
>
> ATB,
>
> Mark.
>
>

