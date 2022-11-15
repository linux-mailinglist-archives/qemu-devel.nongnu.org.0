Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A876629B86
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:06:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwZE-0003NL-4L; Tue, 15 Nov 2022 09:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <JBeulich@suse.com>) id 1ouwZ9-0003ME-Sm
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:05:32 -0500
Received: from mail-ve1eur01on060b.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::60b]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <JBeulich@suse.com>) id 1ouwZ7-0001jf-IK
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:05:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLGARLFu0OCksTqjfABCFLeyK7Gvl8w8BpZ7pxPhQbqFoIzmTCrOB7cGB7+773+ZJJvyZJefmH3g1hNnAwl2+3qdlLmr0g5KNd9vJ+vZgGvlitAg4XCZYkCMSEipYoKM4e8Czt6/KkTBNm/k35pCcrg5iEJ0Ir8bgqBMUdiztNzVcM+ob+GdrvX2xypRrrLWufwWXB6HFsYC0P2URwgq0X11mca13Vw3NHnHqWui6bdv4ZTCVsoKacXEHmgH1iS7igont8sSzNT8/dqkAMwms3MA54cNl8MGWZBeYjZJV34HplEhnLRVduPFpcBu4flrAkJip8RrR63VmJn0cgDoVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDUWyWScZMXji1y9yEi0ju0eOiWvng1aTwJR6Pj7BFM=;
 b=JXNdaEAXSYJ0BoXckqbdApDtEVqscNItlzails6aTsocaNg5vcaGzn3EqmRTH+D3BZudlKCz8V10G5l1HmV7//jb1n3ruK10tCj5mr0ufPj8xpHuaJGLMXfxCDRG94vXCqHx/jr3MXLAyLwyFL7i7Aj7KyK6O+4uxy3VQ4gE7DfPQF2B27TaTWmrjgoN8EBUeC94OuJOWAjlPmxY5NtssNr9qo5h57fFVtKmVa4XWkwXO2loF4N9NbAPZNMNIqIpPiLR5sOnn6IVHmHMnUTzL8ya47OzCgsCS+pztThw1ioNjs3B1oM6eGlsNmJnOrLWBRBiwX2AZSExWM6KQxE6zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDUWyWScZMXji1y9yEi0ju0eOiWvng1aTwJR6Pj7BFM=;
 b=NWxv5ALeC8uf8wT5YzTR8IOmzAIaLCgB0I7Nz2GaJn2kVd6J2W4sSS0+GD12DDM4WMZ50MbgImWABCNWSS6teCV66huAl/wpfyCWzQsM7HLp4bDKwsISlm1tyI8J2bF8tzvYwaAnHy2rJ5k+u1U7wbm9hrlxO4DiLFCFHcWk3ZV6cyIw3lfAy47HaPj5jm0yrPp1owrsz8vjbJzWOJZunqJOHjCAPVpAtgnEdfpnsky7U0lyjz232NK/j/+X9FlSKgS5quQPMdlti79Z9wyMXGCeqN0FIHgGhxRFdxeEsLJ/FrQKseMnq6bVfpNyah9JkBr2N1dSeuvoBy/qxMpDuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Tue, 15 Nov
 2022 14:05:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 14:05:24 +0000
Message-ID: <61bdb870-0169-26eb-3d2a-a3b167148b3c@suse.com>
Date: Tue, 15 Nov 2022 15:05:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com> <Y3N6PZN0AnldeQdQ@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y3N6PZN0AnldeQdQ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd35154-d48f-49d1-a124-08dac712708e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CB5tgRbkTMV8KwsnP5KZXlsy2JY5SpQocnYwpC4VlNeDu3L5N4IymIy6OaX0YKfH4k4Hh23F3s9xc6BwdRBZ5ZdYImmIfHSNlcOKAuDIEczgEkuH/D0UhpxsBbqxBGbuqmGsd27bwys8sIgaWLEqrR3FXRvstuhv5X+d3LOy6wf1jT6qW0ldTm8SMBlqgt1xKKYXSfz31qnoijhzs+gwNCEoGs48AgfvYdVAVxcv4nYjMJYzrPURjQMDe2ZDiea1bUhFR/n0rQ3zGZitx97+FkdgxQzXdaXxT+FyaYV/0OnKJvF91Trn7KzFFWQQ+IRD8nUZksjNaQexlXbxfn+yRPkWLduFzInt1MeZ3C/E5GHJ+agAuvMiWHYZDLuf48rNW/onN0c4dg7TNbRiCElPXegDogZc+sB57Bpa6fY7PRKRZA3w2JLLKmSVXXB+CrJCLKgnEIloR1wWNrUk9RkD2zYA+q4MqWgBai1Ajms8RJiz0ket+X/EDc5HowuFsh3g41x6Yr+/xfxG4o+IkJZc45qPFWJE9L8TA9JzAg+RqZvg5O4Q661J7clkrL3MACdbY18ONycGqRt/jVYwV/tJXGy9XPuT0lf5bQkiu4zO9c9HWFvxdUB3Bjt8kxfhGlDHvPJ6fDDH7YyHwahfeMYi4pDLzo8hbNxk1PiXUztG7onI0X+mh1Yitu/8amSagE+f7GzXRgOxbJZvfb41vKabVU89k+c/Nq17N4NdXzB/geo4KS3VXkgZfmhzqpJecuqPOld5Ll+PQymV+pAF+UhdrrbP2Py5LcHgNzqW400LdEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199015)(478600001)(2906002)(53546011)(31686004)(6506007)(6486002)(6512007)(26005)(2616005)(41300700001)(186003)(8676002)(4326008)(36756003)(66574015)(66476007)(66946007)(66556008)(5660300002)(316002)(54906003)(6916009)(8936002)(86362001)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emRJLy9LcVM4Z0x4RUYyZWE4UjdEYTdveUEyYXpIYnV0VXZqckpIazhJbXh1?=
 =?utf-8?B?UWJhR0l3dVlOd1VSdnpwUkoxeTA0OGNDSTlxMk11ZHNobGhrRFE3ZlRFK2xH?=
 =?utf-8?B?NGNaMW1BNVcvNTN1NXlaaExROGlJOWxrNWVDd0Q4M281ZkQ4TkpwYkdKZzBw?=
 =?utf-8?B?OVE2Zi9hY1lHTlVZWFdmakVnSnVzcXFIRmJOS3J1UUUycTR6RCsySGIwZDFs?=
 =?utf-8?B?R2ZXdW5TTGRHS2JIeDVlZUtVVkVXeW0zd0dDQUJkS0JlM0RnNU5WWnpkbjRT?=
 =?utf-8?B?UTQyeGVMYWZ6ekhnaENwS2w4RHkvenpXNXRqNWRROThNSG0xYnpSdXNKV3U4?=
 =?utf-8?B?YWg1ZkUrNERLMGZSMVZBejVZQmdsNVMvNkpoZFJGN2hubkNmWUlhblI1eDI0?=
 =?utf-8?B?MnRSVzJFRkkvWmlCcWh2RDJTMll0bDRtVURJeThnTWlYL2ZvWXFML3cwc09a?=
 =?utf-8?B?QlkyRGlmQ2lrNmdWaUZwR2xXMXJVMEhzbHhVQVVlOERKOTU5bWVTYUlCRUo1?=
 =?utf-8?B?QVkrMDhzcDBKdHV2VjdrMjF2bFpqQnRmdFlvbEZVOExqZEpQTHdpYzdCQnJv?=
 =?utf-8?B?QmZadjk5WWZZWUVwMUU3T2F1dFM1Y2RRaWRVM1Z1VDc5WFpqVjhSUWxSRHU1?=
 =?utf-8?B?TXhpdXFYZzJ5a2pCQTNVTmRkK0tTNENzZTRpalVEeElmVHpuM2lQY3F0NXQ4?=
 =?utf-8?B?OGZCOEhkNXBsSnBoOURlZWhBcGxodFJXTTZ6QTd3SEl3bWo1MGFzZ1c4anpG?=
 =?utf-8?B?VlBEZTBxdlJHK2JsektzL2FYcVpsdW9xNllXeXFyVUpnSXZaSFpPUUp1YjZi?=
 =?utf-8?B?d2FKNjg3N0ttQ09lSFJDaEZDR21YclozMTcvdG5aZWNHNjZXSnpNUUlaZ2RH?=
 =?utf-8?B?SkJyd09sWWRVbk9HMkFBa1dUdFZpdkZBVFZ5cjhYRUpXZEVBaHNjUUJFNVBs?=
 =?utf-8?B?U1pMR1RyUGI0RGdMVG96TWZ4MzBoN0kwUE9tRHNONTAxOHNzYnFyTkJMZkxa?=
 =?utf-8?B?bEh3Ykc3R28xY3Y2ckF5RDN1bTgvZVl1U0c1QU1vcnIzZ2ZTV1dvVkVwUU0z?=
 =?utf-8?B?L0ptejVkRW03eVd3MXFoT3lJY2xiK3ZNVjhkSDJEVTRVOUUwU3dqTTEvN2R2?=
 =?utf-8?B?L3p3UTZlN1NoaXY3cTRJdHd0RndCblZtalV1N1hLQXpCS21DRE9MSUtiQWI0?=
 =?utf-8?B?eGVXcHZUNEpWYVBRbW1Qa2dGYTE2R05PQXZsRVhJUmxCZHNKeitlNnBvOTQx?=
 =?utf-8?B?cUtHTGFVcGtYeWowOUhGRjdwUXNOajB3Z1VocThyZDZ4emk1b2hBa2daVUdl?=
 =?utf-8?B?VTdyZ1VQenJnaWt0SzNnMTYwbm5pM1ptanVzaXM2QWdNQjB6Uk51NCszcGZL?=
 =?utf-8?B?UFBLZ3d1bzJXVUxxU3I4cnpwWnB1QWlJVmd4bmhnK3hLUkFTQlVtcXJjd2FE?=
 =?utf-8?B?SHFlQXlUNWxDaVVERy9FVmIrSCtEV1lDUEJFdEs3ZEoxZDArZDRmK3VvYWFw?=
 =?utf-8?B?a3BxQ0poTDZvZVV2eDFGNkxtSmtzejNuNE91M2dybzBISkt5ejVWUVpYYzRo?=
 =?utf-8?B?RGFKUUJtT3NKOHBiMTZzNDkzczFScWlnS0tEa09mNWFLaVN5K2RHWE5zWVVY?=
 =?utf-8?B?cFU1MXBlenpGWkRrUG5rVEtLbFBic2xjSVlpcStweEZkaVJTMUR6MTJqYzNK?=
 =?utf-8?B?R213eVNDUzEwdGVTa2xQdXMxODBzTDQzajZ1NHA1WWRsRnU3V1VUK0RDT2wv?=
 =?utf-8?B?eWgrYTBRUUd0UW50eVNybkVjT1hiTWQvNWpYRDg3eDJQN0NHSktRMHdicmtS?=
 =?utf-8?B?N01VbDl6KzdweXA1OWpCeG1zcHFKdENkTTQ3VkVmZ0xKdFV0Mkpib2ZSNkhz?=
 =?utf-8?B?MmQxVldlUVJmQ01ra3VibS91RkxKb250RzYrellrUTFOMlZMOGhqdlhOMk1h?=
 =?utf-8?B?RVpEVGhWclBPRzVDOFQ1aStrMm5kTk54OEN4MTBqMlpuSllCVG5Wd2tvd3Uw?=
 =?utf-8?B?NU5hdDZGbXdUN3Y0Qmk5RUFaellpTkpKYTRrWXZFNDVMcWQrZ0xQK3ZOUVE5?=
 =?utf-8?B?L0l5NC90Snd4RXFVYVByY2JtTDFvMWRIdW9sNTZJVGhvQ2orUHhST3oyUXB6?=
 =?utf-8?Q?9ce2v0KTerRdtfSNth+q220xm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd35154-d48f-49d1-a124-08dac712708e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 14:05:23.9486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSKCUfyzE9OuGSG8LupydM0l/hATgP8SFqPba6154Refc5F6MH4uvl1VYw5i/U93CX2DNKyiuhHThSQqPNBLMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8898
Received-SPF: pass client-ip=2a01:111:f400:fe1f::60b;
 envelope-from=JBeulich@suse.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 15.11.2022 12:38, Marek Marczykowski-Górecki wrote:
> On Tue, Nov 15, 2022 at 09:14:07AM +0100, Jan Beulich wrote:
>> On 14.11.2022 20:20, Marek Marczykowski-Górecki wrote:
>>> The /dev/mem is used for two purposes:
>>>  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
>>>  - reading Pending Bit Array (PBA)
>>>
>>> The first one was originally done because when Xen did not send all
>>> vector ctrl writes to the device model, so QEMU might have outdated old
>>> register value. This has been changed in Xen, so QEMU can now use its
>>> cached value of the register instead.
>>>
>>> The Pending Bit Array (PBA) handling is for the case where it lives on
>>> the same page as the MSI-X table itself. Xen has been extended to handle
>>> this case too (as well as other registers that may live on those pages),
>>> so QEMU handling is not necessary anymore.
>>
>> Don't you need to check for new enough Xen for both aspects?
> 
> Yes, see my response to Andrew in the thread. I'm open for suggestions
> what to check specifically (Xen version directly?). 

I guess we should first see what changes we (you) end up doing in Xen
itself, and then decide whether to surface the new functionality in
some kind of feature indicator. Generally I'd prefer to avoid version
checks, because they don't fit very well with backports nor the (rare)
need to revert something. But sometimes a feature can be probed easily
without requiring an explicit feature indicator.

Jan

