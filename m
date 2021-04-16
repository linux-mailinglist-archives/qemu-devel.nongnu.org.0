Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988B362532
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:08:47 +0200 (CEST)
Received: from localhost ([::1]:33608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXR1S-0003KF-1P
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXQmb-0006V7-Q9
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:53:26 -0400
Received: from mail-eopbgr150117.outbound.protection.outlook.com
 ([40.107.15.117]:20226 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXQmX-0001eP-KL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:53:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWcYg8+qn01Ixt1NMZ3q5gL/NHNB/bFXpa4+7TsI5aPZJJmWlA2647HKdHl0aCTMYvM5hXzW2ThXCI0fgRDcfTPb/JluAfVp6I1PN7rGRuOkzVKFFgVao/Q8dWqmaIPYshpCBVeeP32UnXuDOx/Uqzt5mA9JwlM3SeyhzpD7r2ReKnvsPH8dtMGeIuGb6n7C13HTrUGVTEd6G3xpU/0HS/Drj0K4vKzqbwBtA4I8yxjpjdUxHM/gWPXd581B2oyFWa9kgOA59x/12WHi0tPSw0wXW5Ww/wjJ940jQMuJTeumRAab9Dqm+vo0q2VuQHvGUpmOEotq/KyiJXqt+6utKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fAHTbiyG2cD15JRFmQS4ZbJn8HEfKNSM6TWwuHyHDI=;
 b=MKMnR8pUCm0a3GOaqHwuAC3VIK/7p51DtXIrb05kTeuQbnKm/tS55yMVn52YXvwPx+sN/VutqbqHYnmEUgTvqAkLRdhJRlFqsOsZRIhc3SIRRkUCUwKP29WFvKyRbUw+i/bbbaDYpvL3kxQpMJwxPoyckwspxOa4rq2so8JJPwHQ/Ylc5QK+s5CM7xVpvGx7ZN0HOzg3MC3Qvm5A4GWol8vgCFSQNNr9EhqQlTf8LCvBYuefvvc4xoNntCY+TuPj4Pq8fTfymwzwh55VMcHZkmkYKBhnGTGIXpXrIf2huIS+altXdMAbnw1OmkK2vrPo6VFUjD50v40ccNSY+UqTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fAHTbiyG2cD15JRFmQS4ZbJn8HEfKNSM6TWwuHyHDI=;
 b=JjLrm0UonwyJTY2S+KwVbpDUg/A6ZiyLfHJP6qWBPJiy+GD6ZFTPykuwl/ApkN335Ntr2AzKLG/381GTngjXbqWgzlaWmN+ADCNhuiTWmsvSWeSBb23Svw/lGW/Bnya4zjCh8Idpf5+CTkIl9BIncpqXBIKEidheEu/IdPlivco=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 15:53:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 15:53:17 +0000
Subject: Re: [PATCH v5] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210416143342.25510-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <97334512-8d70-62d6-a37a-4387bebeaaeb@virtuozzo.com>
Date: Fri, 16 Apr 2021 18:53:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210416143342.25510-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.206) by
 PR0P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 15:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f9add48-aeb3-4285-529a-08d900efc065
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1651181E86432B8FBBDC3B4CC14C9@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: idhwyfjYUC8xZfXqwmnwUQ3ggSdOKz2WsDuHkILMbayyMJF9pBG+U9VQ9VdG2UPGadwIwJBhemgP1PaypwwxDR37S2TmVTUNGurPyrx8zg5naWvXuoeW4uyGFRKMxV2If8b6KyTdyxQivGVFxkWgACzQuOJy70QX3vfRgOBlMZxK88i2tK8G9oehgfT8l7PtvoyR+QT9nAI4trNDdhr9TKuUgp5PtBePOsZuqO66YbY4jcu2DCGih9kgKwmmk8Xh3hyNuUt+UAV/WWXL0h8tr/ZAPj2vpgJEqJP5sE904f/tMlFFkBLfjIsh5V+u2niAomJtKrY1oTDtzs7fdZbt3BedPhnFIQvNSWDAc8bsRviCzLj16mvTZOfhWyv1/UxuyQBRk2jtvMTrVpFxo2KP/eLYX6eA81QIULMf6OvEphB6MRl5XYsDWo5v9C0YnTzRLB0VfOUMI7/4LKibVNWkueaTx9mbh3ypyvFpm/GLpK+wrzJPA9mBh7r8BsfU3PnopAPTOTyb7MJ1+DCk9YwH9vn27If9PzcDUBVNliCDk/0AicPKYQDTH4ic533EE7r646fgu0kCRx+wShTKK6nThtHq8m3DuueKm6fE403dH4IDxkM03qeK5SHejWwsUrdaJQIpIfgxc3IuRo4XJqg70ZgaNzlcM3TGDsnYPV0uc19+dmAdX4OVzpcGGwbWkkZVrRyL1/nh2U1xS7/OVTe33ug2o5w/h1YwjdAQamGFtI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(346002)(366004)(376002)(52116002)(5660300002)(54906003)(107886003)(66946007)(66476007)(26005)(956004)(66556008)(16576012)(316002)(86362001)(186003)(16526019)(31696002)(8936002)(478600001)(4326008)(36756003)(31686004)(2906002)(38350700002)(38100700002)(8676002)(6486002)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q0M3NS9LNktCNGtPR2J0V29FNUI2UFdPMEFiZjdNYmMvTW1XbFM1WjNqc01B?=
 =?utf-8?B?RHNGOHllanovWlFNYzZEeEFDRDZ6dU1rLzFNME9UQnBtaTV5REFwK1hLMnJ6?=
 =?utf-8?B?aHdja2FPNkdFbE9sd1ZrMTlwYVAwRnVkT05kSFJyK283bjdzbmNqQVlZQWM3?=
 =?utf-8?B?RXhTcFdXRHFXTGNlcGVWV1BIQTdiZDFsS2FrY2VhNFVMSjMraUtURld2RTBh?=
 =?utf-8?B?eXZzQlkxZysreitLNkcyWkpIT0ZqWHErU2VMbXhHZFlEc0JUVGF5d2lPdXAr?=
 =?utf-8?B?d2FhMThxcEdjRDI0UGtzYWFJTjhVQ1Y2ZmVseFk4NW1BYlIzQXZYKzJBM2Y2?=
 =?utf-8?B?R254UnJUb01LTk5nN1FZTEhKT1RMSllRYlZBWFExVTQ1Ri9uYWdGVFRJK2VV?=
 =?utf-8?B?eHpTUDFzcCtuS1lkR3cyQktZZEg0QkRMT0grQnI0MUpPR2pEWDZTSWRJRnRI?=
 =?utf-8?B?ek40ejRmenM2N0pLSjhyWUFKS3h3cjhaM1VMakE1TkErdlN0Z3BLVGdoMGpl?=
 =?utf-8?B?Zjlyb0VVWnJDemJnTVJkbDYrOW9aS2ZtUUN1NmtJSWc4NHo4UnhBNjY3RFdR?=
 =?utf-8?B?VGwxWVV6cVpTbVRoai9GS3pGV0tSRG1pbGZzWGdpd2hqbWJqUW9KK0h0Rnpp?=
 =?utf-8?B?dFh0Q1FOWW02V1Nsa2Z5OGdrbE03T3NtK1hYOU0yMzUyYWZvLzBDS0s0eHEw?=
 =?utf-8?B?ODNRaUF6SmRLdTYzaXlMWTRyMU5hcWlsS2kwMExxU3ZRc09UM1VRTkpxU2F5?=
 =?utf-8?B?WVZibnduUXNialFMS05jUVBOZW9GOWJTWGo5eXgrOTBUU3p5eS9qNHkzTlk4?=
 =?utf-8?B?NGR2KzVhZDhrT3R0ZUVmNjVpN2ZRRFJTK0djTkNvM0hUY3lxc0hpQ3dHeDFK?=
 =?utf-8?B?K3M1aVNhMmJXRUFqL0p1SnRzdFRzV3F3aC9sMTA2Ti91MVkvU3VaZS8yK1Zz?=
 =?utf-8?B?TWQvdk1YcDFnVVlOSWxIcHp5cWhIY2hFRndIWWNnMVBzTGk1VVhaWW53UjBL?=
 =?utf-8?B?RVdrYy9GMUtGRWo2NUZLT1M4b3lCMFR6azh2aGtHVU5KNjUyaVhIb0tsR3Jz?=
 =?utf-8?B?RTZqZ1BBMDBSRlhoRUNSQWVoY0dtWVNMTmRuVWd6eG4xODJRYVlPOWdhNERV?=
 =?utf-8?B?ZGVWMm5ldS90eW1LOU0zdGRSaDVmclcxN3VPVHltTks4eS9UOG5qbXdsY0tI?=
 =?utf-8?B?QXR0T2RQaWV6SDNkcUZGeHdlMjJydmJpdGlYWXpCeWc1MG56SnVwbERtNVcx?=
 =?utf-8?B?c1g3TkdpaUoxQWk1VFY1ZmdaVkhQNmdqT1NUcGFXYXYxdnNLY05qTUpiS0pB?=
 =?utf-8?B?dXR1WnppWjc5Y2ZpU3RLKzI5RWN4QjY0RnBZZTZZZmtOT3ZoWVc1UWFSY0Rm?=
 =?utf-8?B?aUJCZWU2Zzl2RStmcUx0em1XK3JucmJ0UlYvUHQ1Y0tLMmxrNjBSZVhwenk1?=
 =?utf-8?B?c2x4NnNCa1FiaEJjZzhIUVc0QjBhMklQUzkzR3ZiRk5Zby9BeUxURWZSb1pk?=
 =?utf-8?B?T1hEd2RIemE3VzBwNVlwWTdOaWRpcHJXcU0xUEl0dm5aV3BGZW55ek1ub2Rl?=
 =?utf-8?B?b0MwV2ZNMW9jQWlmeERGYnFHRVV5T3R6a0J3RUllblY4T0xodEUvbW5uUlE0?=
 =?utf-8?B?cTl3Rlo5VGlJUFR1WkhoWDVvaDdmSS9pTWJqQUovZU00YmVzNE9uZ3d4VFlu?=
 =?utf-8?B?bm5sdGZ6U281TE01RkJCQUEycUtjemtHNXVKZ0Rlekc3Y1ZuRU1jWTRaaW83?=
 =?utf-8?Q?s2xluAFROYzEYQWyNzq22Ej18hYV3qaO3FcckXj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9add48-aeb3-4285-529a-08d900efc065
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 15:53:17.5432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pXzEqArNeJ+4uNY+M1KeynltlCxBrqEB4x5rhUVy1VS1D1ofmINjcl9sUZ5jIWcMpCro09/FkJ2P75LwQoGuTgEeGBo4dnl2FYQAjUTV6xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Received-SPF: pass client-ip=40.107.15.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

16.04.2021 17:33, Valeriy Vdovin wrote:
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
> 
> Also, cpu_x86_cpuid function has been modified to return bool
> value depending on what are the arguments of leaf and subleaf
> (or index and count). In cases where leaf/subleaf arguments are
> invalid the function returns false.
> 
> Signed-off-by: Valeriy Vdovin<valeriy.vdovin@virtuozzo.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

