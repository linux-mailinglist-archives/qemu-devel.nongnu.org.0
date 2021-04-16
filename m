Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929E2362067
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 15:02:36 +0200 (CEST)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXO7H-0006Iv-N3
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXO5h-0005eQ-VQ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:01:00 -0400
Received: from mail-eopbgr30118.outbound.protection.outlook.com
 ([40.107.3.118]:64261 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXO5d-00047t-PD
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 09:00:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhELHhhVCnayEafec0nMHJuemmdkjvEHrgbiIQD5/x6S0afT/WXeXgNkxClM48rvmOeQ6FcEZY4wlSNWP5J77ccDnaN1/3B00VXD8EC98DPxr+PmGy4EHxGEmUv+hXOEBbKFdrubhd1V11rXvNFlq8lzduZnm/DDvir4YUcQayxxPQezahKY7kcICA2xB+uioHkjUO/+ofe7hYrsJosIYcjnZEBXycbY+Ug1j6BOv/TE24gLtsU86/UDR8wQq0Bl3CJ1w0DRmuWXsUyfEuJIQ6pgv5EYTbWyoTwwUp0WPKE2PFiLnsYfE/KeWaeaIGHOfqh4cxMyYehdlqo/nVTUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou24U1ThPIyk41FJHI2ySd2O0Z8X3LPqOsfWAMRv5mQ=;
 b=U0O72d+JrRtAeSv48PHNk7hljvOzsjstcNHRR/imx3ocH5VQts24hV2FVdr44ZFoaLumUueq3Drc5INzWeZA/Crolc5168yxWxxY8aEvG2j3u6f0Ivv70Ur4IjsH3XrvL361TrQEsfBR6xo+6nXG5B7Yl0SA2EI9dZf6zS9i31CsqRScGOF27JnV8OeykFfGAqg2R2rpnw9nZoQxPUYFx8zpbHTCry7XCC/6kMPxAq8OFu8ffsXEWhl3b+S7pSeEPVyq1IM2RSkO3LQnm2b6uu7+JYtFp35VKifkV4ljlzG6bdgDmXpQn8rgqYDeCjerBIqaRxnJJlrU0w4HIn7Gyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou24U1ThPIyk41FJHI2ySd2O0Z8X3LPqOsfWAMRv5mQ=;
 b=rDOQM5zckpb5WE/UnBYbagUnBic2x21b7YhjOaB8UoXaRCQhS35aLYKQnHNR8Raq7eHAxUV0EFAp0+7MH0+3CHVCFJFmgyHGY9V6B43l4jyafVmCcqeNu3AdoeqvZwlgX/o2gGy+muGM2I77Wd5GADy1FW1GGxPOf4Oqe3btIkU=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5910.eurprd08.prod.outlook.com (2603:10a6:20b:296::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 16 Apr
 2021 13:00:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 13:00:50 +0000
Subject: Re: [PATCH v4] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210415104426.9860-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5f962269-9555-3a3e-a65a-a220589789a5@virtuozzo.com>
Date: Fri, 16 Apr 2021 16:00:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210415104426.9860-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: AM3PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:207:8::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 AM3PR07CA0135.eurprd07.prod.outlook.com (2603:10a6:207:8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Fri, 16 Apr 2021 13:00:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bae30ee-112f-4c89-723e-08d900d7a8bb
X-MS-TrafficTypeDiagnostic: AS8PR08MB5910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5910FC71AA345F7334923CC1C14C9@AS8PR08MB5910.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AHa8Da9y7Dp4QwwYDHcBucXBDx9TKss2rGRL3W/34DXwusJUfP8elR+PKKggd23bliP8CA9lfax3Lu96ijfwu+nvCq3ZmfegJv9nGFT98XbXQ8Xcozeec/LmOP4J75eSE3wFxACiEWBWjXLs3+Rg1tb3o/wMxgd02CQtPiPXKFzLohS4PDkbn0XPJg1kUisAdyqF5Lq3//5GGhIfRBqe3dvygketnIGufB8B+vnPnQUklg+pD5r0cTLPh839bpN7yEi+McleZBBar8kpXPvVtvEabKvbgu7a1kid8t29V0i/l8FygsDWOJT8DD4HFxwRxfao/UYRfYqEBCb8gPpKYKTt6rnoibeyFTjM2LnASILL9TvdhKJu4rFyoQZv0XKT0WlqcJjJWF9LeSow7Bo/wxVgz0+m7ASg5chjUtBBAwjY5amo5veEC1hmuCkMDw+8CptTq8Sab19+o6v0RpLGY7IscKkXOaAKn65+FI0T4WZ2DpRnoNck0U36ts/qGSK8nlBZnyL0HXx+LSFni6lsIE+FVEC13a4TqOJjy83KMHYbPYApjetl+DrTB9gKqEAVgdNNFe2J7biCWiTWgAYpRTZObAzS9NX9MFMF32TgzyUe9ZfHqG5jaS2cc/iQHJ3sZ/Cuc7rBKXhuWfX49NZs9supWj/pTymEmcEjVx/tdYYVfIqmAMNo16qjv1LlL4yfIi2180K0CVnDcxycQd6MQZEQDglDEf8f5flgJm/+Pbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39840400004)(376002)(86362001)(52116002)(2906002)(8676002)(83380400001)(31696002)(38100700002)(107886003)(316002)(16576012)(16526019)(186003)(54906003)(31686004)(2616005)(8936002)(5660300002)(956004)(36756003)(66946007)(6486002)(66476007)(38350700002)(4326008)(26005)(66556008)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WFBXZEV0MzFWR3R5SUZZd1ZBMjhZMU82K0FKZkxURWdQZGxpbnFUOU5wQmFS?=
 =?utf-8?B?a29YR2twanRiRzRtSTZGc1NRTiszMHpiYzBvcVpxdlJ5RVBpWjZlcTkvMUJO?=
 =?utf-8?B?dkZFaDdZc1YzLzJJQ0lWVit6WkV4TFNUSXZ5M3ZiOWc1SWJObE9rbkhJbEUx?=
 =?utf-8?B?QjJHMXg0Yy9aT1VnaHRiTDNtRUt5bnZRK1BsMzd3T2p2OUwyTzF3aEs3Qk5v?=
 =?utf-8?B?UjJmUVp0SVBpaGphZ1I1dmMrd3V4dkVUTFNsRS80RkhQRTNHQnFFTkk4YUZ5?=
 =?utf-8?B?cndydkFiUksyanVKVEsyV3RYYkJYSzE5bmZ3WWhYQW1aUlo5ZDZMWkRXSXBw?=
 =?utf-8?B?UStFUGJRdWNlbUkyMkNLWU4yTWVQbFB0cGhueGQ4dEFjQWRkdjRuL3dYWU1O?=
 =?utf-8?B?QkNxVVVSeG00bUJvSnVqYkxKNzNXRkttcTFwaTlGeWxPOTJDV3ltQkhBWDZU?=
 =?utf-8?B?b3hDTnpGb0ZjQVpxUGRPbG9ObzQxR3FiZE42b29FTWtsN0tJcDVLMGZYdXhX?=
 =?utf-8?B?T0F2V2ZCS1JuTkc2eWxrWmxheVJMVVpZUWcxZ09hSi9GaThHakFYQXZDaFFP?=
 =?utf-8?B?Q3pmM0cvMW5YakphMi9kZzZseCt4NGR5ZWF6NVpaeTlZRHJKNFJYallUbnEy?=
 =?utf-8?B?QWZKTHBNSXpRZHFJa1phYlU2OEZsbnQ4RXBGUUpOZ3NjMEE3QkVpS0ppMTVn?=
 =?utf-8?B?SEFpU0FqYUlFRE1jN0E1bXhLMk9KWGUyNTJYeFFoL2hVY1hyOEczdjllK2RH?=
 =?utf-8?B?dit0d1VVSnhHMGQwQ2FkenlIV3JPR2FEZHRwZEFDdDJHNDBobHFqY3VmREZ4?=
 =?utf-8?B?Y1hodXpORUZTMUx0UUZSa252YVhwZXJEVGFVN05zM3lTZXFOZWIwSkY0SzZP?=
 =?utf-8?B?OFNvVUwvamFpNnBoOFY2dDcyNjZ3ZVhzWkxycndlVGM0NDRZQTJtcGt1bVVl?=
 =?utf-8?B?ZGRMN0hPZkhTTUZOZENIRm1JTkRJemhIODdVUTcwcmNXRTd1ZFk3VDByY3pp?=
 =?utf-8?B?TjYvOU42cDR6aUNpZlBDM3VLTzdqMTlReGVTcCs3ZzFxNTJQbjhFbExiaWJo?=
 =?utf-8?B?YUFxVThrOU1rcGE5RFVZZDEvZjY0TUZSbndiTDU4ZEVUa2xDdkM5OWk5Nmx3?=
 =?utf-8?B?cHZTWWJCSkticldzV1lSSWdtU09Uelo4dFBMck9VaEVEaHVkOFpxeE8xRmxa?=
 =?utf-8?B?b3p1SHBzeG85UnR5ZUNkWDI4ZVluYUZwaVNTb1lqLzNyUFVtUEhxT0FEQ01p?=
 =?utf-8?B?YUVqV3VPeWZ5VHcyZEh5WUZWZ25DQ0JqRVQ0aSsvMGR0WGVsYjh5c3FQNjFH?=
 =?utf-8?B?UHdTYmdXYVlGM0VpRDU1aFkvRjVWNmdJUmhBcGFIaXdsRVVaMjlYUno2SEIx?=
 =?utf-8?B?WEJvdVJ0NlVMN1lqL0VHb1RtNnNJV290R3R3VWkrTE42MjljTUlUTXlPeGhI?=
 =?utf-8?B?QVhoVytvSytEUEE3STBGcHBlYkZINzlJVTdnbFc1R1dZeWlIb3c4blA3ZmY3?=
 =?utf-8?B?WTZpVFJDQWF4K1h3VlpjNXM0WXU4aGx4K2NGM1R3dkt5MnZwZ0U4NHdQTjVx?=
 =?utf-8?B?c1FpNHYyM0k5UnRsS2FHVEpuRWNTeWdMZmNZNnlTM3gwWkVIS2tHTkxCRVBZ?=
 =?utf-8?B?WmxxaDdvTWNUM3hYWXNrZVJZY0gvTWtEL0FhYmt4ajZMaXYzQ1ZCdUNlbjZz?=
 =?utf-8?B?K0NSZ2k3azU2MXdwVWx0aHNOSHMyRy9zSlJuVlZiVk50VkRoY0JMeTY2Wk1V?=
 =?utf-8?Q?dbfuknnE1qDdzD9lzeZhCXKDm9hw10y0St4wThG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bae30ee-112f-4c89-723e-08d900d7a8bb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 13:00:50.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhja7laKf0upTtqONajVZZ9waKEpjVPe5OD4txyJGsBPhLhisZM1yJiT3UAxv5k4IHrE/P5BOPiuXnmOaxUeh3mtqxWay5MypeqycvkOPf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5910
Received-SPF: pass client-ip=40.107.3.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.04.2021 13:44, Valeriy Vdovin wrote:
> Introducing new qapi method 'query-cpu-model-cpuid'. This method can be used to
> get virtualized cpu model info generated by QEMU during VM initialization in
> the form of cpuid representation.
> 
> Diving into more details about virtual cpu generation: QEMU first parses '-cpu'
> command line option. From there it takes the name of the model as the basis for
> feature set of the new virtual cpu. After that it uses trailing '-cpu' options,
> that state if additional cpu features should be present on the virtual cpu or
> excluded from it (tokens '+'/'-' or '=on'/'=off').
> After that QEMU checks if the host's cpu can actually support the derived
> feature set and applies host limitations to it.
> After this initialization procedure, virtual cpu has it's model and
> vendor names, and a working feature set and is ready for identification
> instructions such as CPUID.
> 
> Currently full output for this method is only supported for x86 cpus.
> 
> To learn exactly how virtual cpu is presented to the guest machine via CPUID
> instruction, new qapi method can be used. By calling 'query-cpu-model-cpuid'
> method, one can get a full listing of all CPUID leafs with subleafs which are
> supported by the initialized virtual cpu.
> 
> Other than debug, the method is useful in cases when we would like to
> utilize QEMU's virtual cpu initialization routines and put the retrieved
> values into kernel CPUID overriding mechanics for more precise control
> over how various processes perceive its underlying hardware with
> container processes as a good example.
> 
> Output format:
> The core part of the returned JSON object can be described as a list of lists
> with top level list contains leaf-level elements and the bottom level
> containing subleafs, where 'leaf' is CPUID argument passed in EAX register and
> 'subleaf' is a value passed to CPUID in ECX register for some specific
> leafs, that support that. Each most basic CPUID result is passed in a
> maximum of 4 registers EAX, EBX, ECX and EDX, with most leafs not utilizing
> all 4 registers at once.
> Also note that 'subleaf' is a kind of extension, used by only a couple of
> leafs, while most of the leafs don't have this. Nevertheless, the output
> data structure presents ALL leafs as having at least a single 'subleaf'.
> This is done for data structure uniformity, so that it could be
> processed in a more straightforward manner, in this case no one suffers
> from such simplification.
> 
> Use example:
> virsh qemu-monitor-command VM --pretty '{ "execute": "query-cpu-model-cpuid" }'
> {
>    "return": {
>      "cpuid": {
>        "leafs": [
>          {
>            "leaf": 0,
>            "subleafs": [
>              {
>                "eax": 13,
>                "edx": 1231384169,
>                "ecx": 1818588270,
>                "ebx": 1970169159,
>                "subleaf": 0
>              }
>            ]
>          },
>          {
>            "leaf": 1,
>            "subleafs": [
>              {
>                "eax": 329443,
>                "edx": 529267711,
>                "ecx": 4160369187,
>                "ebx": 133120,
>                "subleaf": 0
>              }
>            ]
>          },
>          {
>            "leaf": 2,
>            "subleafs": [
>              {
>                "eax": 1,
>                "edx": 2895997,
>                "ecx": 0,
>                "ebx": 0,
>                "subleaf": 0
>              }
>            ]
>          },
>        ]
>      },
>      "vendor": "GenuineIntel",
>      "class-name": "Skylake-Client-IBRS-x86_64-cpu",
>      "model-id": "Intel Core Processor (Skylake, IBRS)"
>    },
>    "id": "libvirt-40"
> }


[..]

> +static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
> +                                 Error **errp)
> +{
> +    CpuidLeafRanges ranges;
> +    CpuidLeafRange *range;
> +    uint32_t eax, ebx, ecx, edx;
> +    CpuidLeaf *leaf;
> +    CpuidLeafList **leaf_tail;
> +    CpuidSubleaf *subleaf;
> +    CpuidSubleafList **subleaf_tail;
> +    X86CPU *x86_cpu = X86_CPU(cpu);
> +
> +    int range_idx;
> +    int leaf_idx, subleaf_idx;
> +
> +    info->cpuid = g_malloc0(sizeof(*info->cpuid));
> +    leaf_tail = &info->cpuid->leaves;
> +    info->model_id = g_strdup(object_property_get_str(cpu, "model-id", errp));
> +    info->vendor = g_strdup(object_property_get_str(cpu, "vendor", errp));

you forget to fix errp :)

if you fix it to &error_abort, and therefore drop errp argument of cpu_model_fill_cpuid(), or otherwise, check output of object_property_get_str and handle error correctly (just by return of course), take my:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

(a bit weak, as I don't have good knowledge of the subsystem. The logic seems OK for me, still I have no idea about object relations here, for example, how much sense in calling qdev_get_machine(), and then go to ms->possible_cpus->cpus[0]. Or, could we always get model-id property from cpu object or not (and use &error_abort). So, for me these things are "OK if it works". The logic of filling qapi struct is clear, as well as modification of cpu_x86_cpuid)

> +
> +    cpuid_get_cpuid_leaf_ranges(&x86_cpu->env, &ranges);
> +    for (range_idx = 0; range_idx < ranges.count; ++range_idx) {
> +        range = &ranges.ranges[range_idx];
> +        for (leaf_idx = range->min; leaf_idx <= range->max; ++leaf_idx) {
> +            subleaf_idx = 0;
> +            if (!cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax, &ebx,
> +                               &ecx, &edx)) {
> +                continue;
> +            }
> +
> +            leaf = g_malloc0(sizeof(*leaf));
> +            leaf->leaf = leaf_idx;
> +            subleaf_tail = &leaf->subleaves;
> +            do {
> +                subleaf = g_malloc0(sizeof(*subleaf));
> +                subleaf->subleaf = subleaf_idx;
> +                subleaf->eax = eax;
> +                subleaf->ebx = ebx;
> +                subleaf->ecx = ecx;
> +                subleaf->edx = edx;
> +                QAPI_LIST_APPEND(subleaf_tail, subleaf);
> +                subleaf_idx++;
> +            } while (cpu_x86_cpuid(&x86_cpu->env, leaf_idx, subleaf_idx, &eax,
> +                                   &ebx, &ecx, &edx));
> +
> +            QAPI_LIST_APPEND(leaf_tail, leaf);
> +        }
> +    }
> +}
> +

[..]


-- 
Best regards,
Vladimir

