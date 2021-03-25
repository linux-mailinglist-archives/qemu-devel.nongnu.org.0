Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1CF348DBF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:13:00 +0100 (CET)
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPMz5-0001Xo-KT
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPMy0-00015a-3J
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:11:52 -0400
Received: from mail-db8eur05on2092.outbound.protection.outlook.com
 ([40.107.20.92]:17824 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPMxx-0002Po-3Q
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 06:11:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US807g0e7hScHH+Vc7qlyQvXD3dRrt6o2M5F+Dm1RUUAmqVEmnKhwNUwuyLoxCGTn83q//uHuPGUIqV+859cdPUFE7hzZ9ro8imid2lnfYvSZicmpChYqWlz3mPC1JfN8HJNE9xpEfKZP5YPdzsXrz3fdb5OMHuJCbCLHa5m7aagRYHJif3E4py+WTfVIx8DiA0StxZO1AeouE042jeHqoRclD18tOT7DHtSXK3HSybNxesdOz7tWzhWkCestNi99XNK7wUm/isAaymIjg7633Dvbd3wztNleSruwf7smsvOgURRikxRTW2qff1zhLCClWf7/YTbSfXuveMpU0oiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX0Pv2FNtgfUlp3moJm4H4KJGimHAr5i5LAT8n7WYUQ=;
 b=Yu1hojUwewpqNoF+hgeuTDNqDY9kL48ns8PkAZZEBT5P4ej6uFWJKl3go9FonAex5bRAPoFTlpe38IU0lB9iGMa2jq82jd2DJrQivPirt+Os+htkmrxgq1qS5MbRUb4Y4CWzCLLMqD91QL/RCr4FjmYcd1XDUinjLsMxN0zMsQ2qiGaVHhzOGPHYnnvo4wjRJPfo6YTHr8bPplnASfK0LE4dweeH1SA1pBYJ6FkbSrbG6g2q+9uXx6PwigtvqVr3XMtjV86REpE5W11KuRB0h3XVTfidQYFE/CP7ktxMv4Jd235QSXJanSQGth66X3lLiZEGaPfKQKzgJnj5yJU+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX0Pv2FNtgfUlp3moJm4H4KJGimHAr5i5LAT8n7WYUQ=;
 b=DmQjQmIhJ3jZv7orUyu7EjdSXogpU9vcwb7P8MA3Xdde89fta8/wVcihkh/c7lmoE2dMibiE5mdGKbigYmybVIvqifqfXJvHe3sWfGgxudO9p1pp7YvCdEjDkIqORJGiUadmiYF3N6Y1KQstsIMpO6CJn8OXrMyeAz/Yx87xziM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB4814.eurprd08.prod.outlook.com (2603:10a6:802:ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 25 Mar
 2021 10:11:42 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 10:11:42 +0000
Subject: Re: [PATCH] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210324133933.18967-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a6de481c-a07b-231e-80fc-7698f38c2392@virtuozzo.com>
Date: Thu, 25 Mar 2021 13:11:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210324133933.18967-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:205:1::46) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:205:1::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Thu, 25 Mar 2021 10:11:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 678dbf0e-8113-43fb-1eac-08d8ef76633c
X-MS-TrafficTypeDiagnostic: VE1PR08MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB48146EE8D919B0AB8AB410A8C1629@VE1PR08MB4814.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7dV64NhcIDVAR2IH5ZMQz2BqrXrY6zKT0UxFS/BmdW4dhNFKyID4QNpu0kNScAoXGGP9BLS5B0b526nBnqYHi1mtMAB4X8AQvQx39mEEGh5UcpenG44uKHoPNFmfHl6kKPNWZDx04NenZk645+a2SLeVeAgULRT1Om4MiI5Clqt9CPYpbqmwYGuGedSncveybDx0Cyu6LrUGFDARyEVrOxiJIZ0rJuITNBU1gr0t/lxTAm/FUlcatDAVAXVTkbH67bICqDZl9WOMdgEzmI0aA6CC6Y2k0E8ESnCuMGLGvQfb3TkQ+1PY01irDsdjdrtxoMaP2OKFaNa1NvQS/+VbfsVKymPO+1UpBehR0s+uvjjfJb1Eb+9zvXj37EOoISXN9ROy3VwHp3zdnuh5qsyyrFKYBF30/7iuqppL3b7YwFrdaKkFhoIU1anZ3PqZR+Kd17V/LRKCM04+/rs7AFCZDrhztoiV64W5hEuJsq+r7a9wQLbrCJvKLSfAVJ2MQEH9FiufyJ0A6xqzkCs+k3NY05l/bRugoMjA0RNN4yktkdoSfDgkf+mBGOwDDU4PVMNICQ1TB9iwQbLpR3fRkmtdolvAMeV7tS941IX7VPaHelTicOKI+Mmv4tFANRnjIZiPolyNLy8e45ydj9ygHb29VzxPLgz/Jo/IYrqrFfo52zPTH4UT1ZR1bYMI+yt32Wn3wvBvNMKn7+5mvWbdB9Qmm5lj0wQ4Qd4cgLUdG+1ULqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39840400004)(366004)(26005)(66946007)(16526019)(107886003)(38100700001)(4326008)(31686004)(186003)(956004)(16576012)(66556008)(478600001)(52116002)(2906002)(8936002)(86362001)(6486002)(36756003)(66476007)(316002)(2616005)(8676002)(54906003)(5660300002)(31696002)(83380400001)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZVg2RmFLSWhSU0UwV3l6RXh6TGhMdDRCQmdEMFJZakVjQTBnemJ0ai95Qkls?=
 =?utf-8?B?K1ZRbllBM1JJVUNTU25sV1NXU2RXWTNSRGFsOHJnQWhFV2VITVcyS0YyK3pF?=
 =?utf-8?B?d3hmbldkclRoMUVKZFBMSHl0QkE5TTF0bElGZG04VGNBam1wcStNY1d2VkI5?=
 =?utf-8?B?RFpnclpzOE43ZUplQ2xvQ2xqeWFhbGMxdXhlVnZHZzExb2RhSndGVXF0ZzFF?=
 =?utf-8?B?b25ib1UxTDU0MzZ4eWx4MXlrNHVJNGswRmpBbzlRTXRscUhoMFRTNDE4anp0?=
 =?utf-8?B?OU9jcXpZY214Q1p5NWZ6SldWUFk0bEIrY1ZCSVY5MVBTTlhMUzZVT2NweS93?=
 =?utf-8?B?MUJkeFFCMGxSdTZFU1dXdEhGTGRHdGY5cTFnTUVRT1BZR1lLUkpTejhTV0tS?=
 =?utf-8?B?U0padVdsMjJpSlRMYVBIdTZjbmY4NXQ0RlJvSGszTWZ3VjlEekwzYS9seVFG?=
 =?utf-8?B?YkpXQ0FldXpRK2kzNzN6SGs2UjhTc2UzeE92TUZxUjBoOHRkY0UyU0R5R0Ur?=
 =?utf-8?B?NnA4UkNuSlM3Sk8zcEFXaGxzQkVXZnZxTWswT1MrM1FDcDRSVm5GT05sTVFZ?=
 =?utf-8?B?eVRxYkF4NVZGbkU5YnBoVzFiVHJhWVFZdWRaNmFjOGx5UHFzVEE5ZnhKNEZl?=
 =?utf-8?B?cm9uWEVVVC9tSFJIaytGZnpCNXQxRWNkOUxZcXFZMGc4MnNsc0VZaGhQaHZQ?=
 =?utf-8?B?Ri9RZ2ZGZ1c4OUNqaXpQQW81cmZoc0JReEpoZXhZbHNDSWpjSEsyY0w3Z3Zz?=
 =?utf-8?B?aUNyOVNlVVFZdzNVRnFPLy8yZ0N1cktleGs5c3E1bm45TE9BcWw0a1B5c3pl?=
 =?utf-8?B?YkFrMi9XczhheERqS3RubHA5ODd0bDEyRDB6UzVFY2lyTXhHVDlmTmdWeXZp?=
 =?utf-8?B?SkMzMkN3b0ZWaklXY3VXNm9WUGlWUVdIczh5a3dybExET1huYUM3Y0JtcDB2?=
 =?utf-8?B?Z204QzNlTUlwUW9vV1NENU1kRHg1b3Q1QjFYUEJGMVJXUFhJejYvUk9ZWXFs?=
 =?utf-8?B?dDRUam41bDAyNWl4MEtqQUdaWWdyNUxxd1QwM1Y5ZnF4SElwMXpxRllsUW53?=
 =?utf-8?B?eERaY3NzakNlRm9STU5DcHhZWDhVb2lqamwyMXZoQjdRcVBKWTAyOHlSbjFG?=
 =?utf-8?B?YjdWTGJVWW4vL1hhRFA0V1l0YXRJczc5U3FTYm1reXhGbnl3WWtpUW5idjNW?=
 =?utf-8?B?UXVzMVhWY1BrWHl3MEpSZEw2bm9NT01KR2Q5UzhtZS90ZE55KzlMZzNoMnR1?=
 =?utf-8?B?S2NkTS9ISCtoSkRHWWU3U2VjSUhzNmorcStaejBmbkx3NGpiUVBmWlJxemtZ?=
 =?utf-8?B?OU9RTExDTWxEWkR3cHBSR3FLeks3VndROHBVMlVOQ01jZnErdWd2ZGYxcVVr?=
 =?utf-8?B?NkZhYjArR1VwZ0tieDE3VUdEcGhSMkkwd2c0QWVUU2MvRkp2QzlyMk8rTVFq?=
 =?utf-8?B?NytWY2ZqWEVRRGNpbWc5YkxuVHd0ZEd5bjBtT3ZyckFVVWlFTnZKNFdyUTZK?=
 =?utf-8?B?TkJXV204NFIyaHZEb2tIQTMvbjFEVU9BVUg5TCtyR1YvZmMyMGVvOWc3OVFE?=
 =?utf-8?B?SGl1WUtGdjlBN3lIcGNWd01CZ3BzUUh3K2NhZFlFazlBTVFVbHE4WWhxTGxJ?=
 =?utf-8?B?K2dzT2YvbmsxK3F6Q3dOYVQxQmIzS2UwWGY3RllWUk1hOEJpYWRRa3hZRms1?=
 =?utf-8?B?Wk5FNnl3Q0VDV01yMUgyalhnMzgzNUJZdzlHOXUwTy9rQVB1RGxtTm5Ub01X?=
 =?utf-8?Q?5+sCtQi9lDYwWGKkvPvsHw8uiH7XNCZDigRzlgn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678dbf0e-8113-43fb-1eac-08d8ef76633c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 10:11:42.5358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El3x8pr4gaSw0ovCWDLRjEiGIi2+ydZAZcB4MI9c9ga3xfhM4kcdIPTfJAD9eWI2KSW0TGHXQKYluUISRnyCMUyVbm7M86QFDLstNUY5tP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4814
Received-SPF: pass client-ip=40.107.20.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

24.03.2021 16:39, Valeriy Vdovin wrote:
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
> Signed-off-by: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>
> ---
>   qapi/machine-target.json | 122 ++++++++++++++++
>   target/i386/cpu.c        | 292 +++++++++++++++++++++++++++++++++++++--
>   2 files changed, 405 insertions(+), 9 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..c5b137aa5c 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,125 @@
>   ##
>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
> +##
> +
> +
> +# @CpuidSubleaf:
> +#
> +# CPUID leaf extension information, based on ECX value.
> +#
> +# CPUID x86 instruction has 'leaf' argument passed in EAX register. Leaf
> +# argument identifies the type of information, the caller wants to retrieve in
> +# single call to CPUID.
> +# Some but not all leaves depend on the value passed in ECX register as an
> +# additional argument to CPUID. This argument is present in cpuid documentation
> +# as 'subleaf'.
> +# If CPUID ignores the value in ECX, normally this means that leaf does not
> +# have subleaves. Another way to see it is that each leaf has at least one
> +# subleaf (one type of output).
> +#
> +# @subleaf: value passed to CPUID in ECX register. If CPUID leaf has only a
> +#           single leaf, the value of ECX is ignored by CPU and should as well
> +#           be ignored in this field.
> +# @eax: value in eax after CPUID instruction
> +# @ebx: value in ebx after CPUID instruction
> +# @ecx: value in ecx after CPUID instruction
> +# @edx: value in edx after CPUID instruction
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuidSubleaf',
> +  'data': { 'subleaf' : 'int',
> +            'eax': 'int',
> +            'ebx': 'int',
> +            'ecx': 'int',
> +            'edx': 'int'
> +          }
> +}
> +
> +##
> +# @CpuidLeaf:
> +#
> +# A single CPUID leaf.
> +#
> +# CPUID instruction accepts 'leaf' argument passed in EAX register.
> +# A 'leaf' is a single group of information about the CPU, that is returned
> +# to the caller in EAX, EBX, ECX and EDX registers. A few of the leaves will
> +# also have 'subleaves', the group of information would partially depend on the
> +# value passed in the ECX register. If the leaf has subleaves, it will
> +# only have more than one item in 'subleaves' array. If the leaf has no
> +# subleaves, only one item will be present in the 'subleaves' list.
> +#
> +# @leaf: CPUID leaf or the value of EAX prior to CPUID execution.
> +# @subleaves: array of subleaves.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuidLeaf',
> +  'data': { 'leaf' : 'int',
> +            'subleaves' : [ 'CpuidSubleaf' ] } }
> +
> +##
> +# @CpuModelCpuid:
> +#
> +# Virtual CPU model.
> +#
> +# A CPU model consists of the name of a CPU definition, to which
> +# delta changes are applied (e.g. features added/removed). Most magic values
> +# that an architecture might require should be hidden behind the name.
> +# However, if required, architectures can expose relevant properties.
> +#
> +# @leaves: array of all available cpuid leaves
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuModelCpuid',
> +  'data': {  'leaves' : [ 'CpuidLeaf' ] }
> +}
> +
> +##
> +# @CpuModelCpuidDescription:
> +#
> +# Virtual CPU model.
> +#
> +# This describes information generated by QEMU and used by it to respond CPUID
> +# requests from guest along with some general information about the cpu model,
> +# that might be useful for the caller of qapi requests.
> +#
> +# @class-name: class name of the CPU model in qemu object model
> +# @model-id: CPU model name string that will be passed in CPUID, EAX=0
> +# @vendor: CPU vendor name string that will be passed in CPUID, EAX=0
> +# @cpuid: Full tree of CPUID leaves, that is generated by QEMU at virtual cpu
> +#         initialization step by parsing "-cpu " option and creating the virtual cpu
> +#         model. CpuModelCpuidDescription can be examined to predict QEMU's response to
> +#         CPUID instructions from the guest.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'CpuModelCpuidDescription',
> +  'data': {  'class-name': 'str',
> +             'model-id': 'str',
> +             'vendor' : 'str',
> +             'cpuid' : 'CpuModelCpuid'
> +          }
> +}
> +
> +##
> +# @query-cpu-model-cpuid:
> +#
> +# Returns description of a virtual CPU model, created by QEMU after cpu
> +# initialization routines. The resulting information is a reflection of a parsed
> +# '-cpu' command line option, filtered by available host cpu features.
> +#
> +# Returns:  @CpuModelCpuidDescription
> +#
> +# Example:
> +#
> +# -> { "execute": "query-cpu-model-cpuid" }
> +# <- { "return": 'CpuModelCpuidDescription' }
> +#
> +# Since: 6.1
> +##
> +{ 'command': 'query-cpu-model-cpuid',
> +  'returns': 'CpuModelCpuidDescription',
> +  'if': 'defined(TARGET_I386)' }
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f1..14d29c9136 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5148,6 +5148,288 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>       return cpu_list;
>   }
>   
> +/*
> + * struct cpuid_leaf_range - helper struct that describes valid range of
> + * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
> + * etc.
> + *
> + * The purpose of this struct is to deal with a sparse nature of leaf value
> + * space. Ther CPUID logic of returning the maximum leaf is not straightforward
> + * and requires inner knowledge of what cpuid extensions are available on a
> + * specific cpu. Also this logic is designed to be expandable across many years
> + * ahead. QEMU code would have to be updated as well. That's why there should
> + * be only one point where all cpuid leaf ranges logic will be modified.
> + *
> + * In practice this will be used to detect if any arbitrary cpuid leaf value
> + * is valid for a specific cpu model. For that one will call
> + * 'cpuid_get_cpuid_leaf_ranges' to get all valid ranges for a provided cpu
> + * model and then call 'cpu_leaf_in_range' to find out which of the ranges
> + * contains the leaf in question.
> + */
> +#define CPUID_MAX_LEAF_RANGES 4
> +
> +struct cpuid_leaf_range {
> +    uint32_t min;
> +    uint32_t max;
> +};

pls follow QEMU coding style (docs/devel/style.rst):
   
   Structured  type names are in CamelCase
   ...
   Each named struct type should have a CamelCase name and a corresponding typedef.

So you need

typeder struct CpuidLeafRange {
...
} CpuidLeafRange;

or something like this.

> +
> +struct cpuid_leaf_ranges {
> +    struct cpuid_leaf_range ranges[CPUID_MAX_LEAF_RANGES];
> +    int count;
> +};
> +
> +static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
> +                                        struct cpuid_leaf_ranges *r)
> +{
> +    struct cpuid_leaf_range *rng;
> +
> +    r->count = 0;
> +    rng = &r->ranges[r->count++];
> +    rng->min = 0x00000000;
> +    rng->max = env->cpuid_level;
> +
> +    rng = &r->ranges[r->count++];
> +    rng->min = 0x40000000;
> +    rng->max = 0x40000001;
> +
> +    if (env->cpuid_xlevel) {
> +        rng = &r->ranges[r->count++];
> +        rng->min = 0x80000000;
> +        rng->max = env->cpuid_xlevel;
> +    }
> +
> +    if (env->cpuid_xlevel2) {
> +        rng = &r->ranges[r->count++];
> +        rng->min = 0xC0000000;
> +        rng->max = env->cpuid_xlevel2;
> +    }
> +}
> +
> +static inline bool cpuid_leaf_in_range(uint32_t leaf,
> +                                       struct cpuid_leaf_range *r)
> +{
> +    return leaf >= r->min && leaf <= r->max;
> +}
> +
> +static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
> +{
> +    struct cpuid_leaf_ranges ranges;
> +    struct cpuid_leaf_range *current_range, *end_range;
> +
> +    cpuid_get_cpuid_leaf_ranges(env, &ranges);
> +    current_range = &ranges.ranges[0];
> +    end_range = current_range + ranges.count;
> +    while (current_range != end_range) {
> +        if (cpuid_leaf_in_range(leaf, current_range)) {
> +            break;

you can return from here, and avoid extra "if" after loop.

> +        }
> +        current_range++;
> +    }
> +    if (current_range != end_range) {
> +        return current_range->max;
> +    }

I'd use for-loop, its shorter and needs less variables.

> +    return 0;
> +}
> +
> +/*
> + * cpuid_num_subleafs_map - array of values that map leaf values to the number
> + * of subleafs in it.
> + */
> +struct leaf_to_num_subleaves_map {
> +    uint32_t leaf;
> +    uint32_t num_subleaves;
> +};
> +
> +static const struct leaf_to_num_subleaves_map cpuid_num_subleaves_map[] = {
> +    { .leaf = 0x00000004, .num_subleaves = 4 },
> +    { .leaf = 0x00000007, .num_subleaves = 1 },
> +    { .leaf = 0x0000000a, .num_subleaves = 1 },
> +    { .leaf = 0x0000000b, .num_subleaves = 2 },
> +    { .leaf = 0x0000000d, .num_subleaves = ARRAY_SIZE(x86_ext_save_areas) },
> +    { .leaf = 0x00000014, .num_subleaves = 2 }
> +};
> +
> +static uint32_t cpu_x86_cpuid_get_num_subleaves(CPUX86State *env,
> +                                                uint32_t index)
> +{
> +    int i;
> +    for (i = 0; i < ARRAY_SIZE(cpuid_num_subleaves_map); ++i) {
> +        if (cpuid_num_subleaves_map[i].leaf == index) {
> +            return cpuid_num_subleaves_map[i].num_subleaves;
> +        }
> +    }
> +    return 1;
> +}
> +
> +/*
> + * struct x86_cpuid_leaf_iter - CPUID leaves iterator.
> + * cpuid leaves iterator will hide the complex logic of walking over a full
> + * value space of leaves available to a specific cpu model.
> + *
> + * Purpose of this iterator: for each specific cpu model, initialized in
> + * QEMU, the amount of available cpuid leaves may vary and their enumeration
> + * is somewhat complex, considering the need to jump from basic info leaves to
> + * extended info leaves plus some additional more specific leaf ranges.
> + * This iterator hides this complexity and helps to separate leaf-walking logic
> + * from the actual use-case logic.
> + */
> +struct x86_cpuid_leaf_iter {
> +    CPUX86State *env;
> +    uint32_t leaf;
> +    bool valid;
> +};
> +
> +static void x86_cpuid_leaf_iter_start(struct x86_cpuid_leaf_iter *i,

I don't like "i" name for iterator, I'd use at least "it".. But it's up to maintainer of course.

> +                                      CPUX86State *env)
> +{
> +    i->env = env;
> +    i->leaf = 0;
> +    i->valid = true;
> +}
> +
> +static void x86_cpuid_leaf_iter_next(struct x86_cpuid_leaf_iter *i)
> +{
> +    struct cpuid_leaf_ranges ranges;
> +    struct cpuid_leaf_range *current_range, *end_range;
> +
> +    cpuid_get_cpuid_leaf_ranges(i->env, &ranges);

So we recalculate "ranges" on each iteration? I think we can put ranges to iterator structure or even to env..

> +    current_range = &ranges.ranges[0];
> +    end_range = current_range + ranges.count;
> +    while (current_range != end_range) {
> +        if (cpuid_leaf_in_range(i->leaf, current_range)) {
> +            break;
> +        }
> +        current_range++;
> +    }
> +    if (current_range != end_range) {
> +        if (i->leaf < current_range->max) {
> +            i->leaf++;
> +            return;
> +        }
> +        current_range++;
> +    }
> +    if (current_range != end_range) {
> +        i->leaf = current_range->min;
> +        return;
> +    }
> +
> +    i->valid = false;
> +}
> +
> +static bool x86_cpuid_leaf_iter_valid(struct x86_cpuid_leaf_iter *i)
> +{
> +    return i->valid;
> +}
> +
> +/*
> + * struct x86_cpuid_subleaf_iter - helps to iterate over all subleaves
> + * in a given CPUID leaf. Most of the cpuid leaves do not have varying output
> + * that is depenent of the subleaf value in ECX at all, but this maps into a
> + * single iteration to subleaf 0.
> + */
> +struct x86_cpuid_subleaf_iter {
> +    CPUX86State *env;
> +    uint32_t leaf;
> +    uint32_t subleaf;
> +    bool valid;
> +};
> +
> +static void x86_cpuid_subleaf_iter_start(struct x86_cpuid_subleaf_iter *i,
> +                                  CPUX86State *env, uint32_t leaf)
> +{
> +    i->env = env;
> +    i->leaf = leaf;
> +    i->subleaf = 0;
> +    i->valid = true;
> +}
> +
> +static void x86_cpuid_subleaf_iter_next(struct x86_cpuid_subleaf_iter *i)
> +{
> +    uint32_t max_subleaf = cpu_x86_cpuid_get_num_subleaves(i->env, i->leaf) - 1;
> +
> +    if (i->subleaf < max_subleaf) {
> +        i->subleaf++;
> +    } else {
> +        i->valid = false;
> +    }
> +}
> +
> +static bool x86_cpuid_subleaf_iter_valid(struct x86_cpuid_subleaf_iter *i)
> +{
> +    return i->valid;
> +}
> +
> +static void cpu_model_fill_cpuid_subleaf(X86CPU *cpu, int leaf_idx,
> +                                         int subleaf_idx,
> +                                         CpuidSubleaf *subleaf)
> +{
> +    uint32_t eax, ebx, ecx, edx;
> +
> +    cpu_x86_cpuid(&cpu->env, leaf_idx, subleaf_idx, &eax, &ebx, &ecx, &edx);
> +    subleaf->subleaf = subleaf_idx;
> +    subleaf->eax = eax;
> +    subleaf->ebx = ebx;
> +    subleaf->ecx = ecx;
> +    subleaf->edx = edx;
> +}
> +
> +static void cpu_model_fill_cpuid_leaf(X86CPU *cpu, int leaf_idx,
> +                                      CpuidLeaf *leaf)
> +{
> +    struct x86_cpuid_subleaf_iter it;
> +    CpuidSubleaf *subleaf;
> +    CpuidSubleafList **tail = &leaf->subleaves;
> +
> +    leaf->leaf = leaf_idx;
> +    x86_cpuid_subleaf_iter_start(&it, &cpu->env, leaf_idx);
> +    for (; x86_cpuid_subleaf_iter_valid(&it);
> +        x86_cpuid_subleaf_iter_next(&it)) {
> +        subleaf = g_malloc0(sizeof(*subleaf));
> +        cpu_model_fill_cpuid_subleaf(cpu, leaf_idx, it.subleaf, subleaf);
> +        QAPI_LIST_APPEND(tail, subleaf);
> +    }
> +}
> +
> +static void cpu_model_fill_cpuid(Object *cpu, CpuModelCpuidDescription *info,
> +                                 Error **errp)
> +{
> +    X86CPU *x86_cpu = X86_CPU(cpu);
> +    struct x86_cpuid_leaf_iter it;
> +    CpuidLeaf *leaf;
> +    CpuidLeafList **tail;
> +
> +    info->cpuid = g_malloc0(sizeof(*info->cpuid));
> +    tail = &info->cpuid->leaves;
> +    info->model_id = object_property_get_str(cpu, "model-id", errp);
> +    info->vendor = object_property_get_str(cpu, "vendor", errp);
> +    x86_cpuid_leaf_iter_start(&it, &x86_cpu->env);
> +    for (; x86_cpuid_leaf_iter_valid(&it); x86_cpuid_leaf_iter_next(&it)) {
> +        leaf = g_malloc0(sizeof(*leaf));
> +        cpu_model_fill_cpuid_leaf(x86_cpu, it.leaf, leaf);
> +        QAPI_LIST_APPEND(tail, leaf);
> +    }
> +}
> +
> +CpuModelCpuidDescription *qmp_query_cpu_model_cpuid(Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    const char *class_name;
> +    CpuModelCpuidDescription *info;
> +    SysEmuTarget target = qapi_enum_parse(&SysEmuTarget_lookup, TARGET_NAME,
> +                                          -1, &error_abort);
> +    Object *cpu = ms->possible_cpus->cpus[0].cpu;
> +
> +    class_name = object_class_get_name(object_get_class(cpu));
> +    info = g_malloc0(sizeof(*info));
> +    info->class_name = g_strdup(class_name);
> +
> +    if (target == SYS_EMU_TARGET_X86_64) {
> +        cpu_model_fill_cpuid(cpu, info, errp);
> +    }
> +
> +    return info;
> +}
> +
>   static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>                                                      bool migratable_only)
>   {
> @@ -5607,15 +5889,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>       topo_info.threads_per_core = cs->nr_threads;
>   
>       /* Calculate & apply limits for different index ranges */
> -    if (index >= 0xC0000000) {
> -        limit = env->cpuid_xlevel2;
> -    } else if (index >= 0x80000000) {
> -        limit = env->cpuid_xlevel;
> -    } else if (index >= 0x40000000) {
> -        limit = 0x40000001;
> -    } else {
> -        limit = env->cpuid_level;
> -    }
> +    limit = cpuid_limit_from_leaf(env, index);
>   
>       if (index > limit) {
>           /* Intel documentation states that invalid EAX input will
> 

OK, my thoughts:

1. I don't follow, why we need iterators. For me it seems a lot simpler just go through all of the leaves and subleaves in a nested loop in one function. Or may be in two functions..

2. There are some "holes" in ranges if you look at cpu_x86_cpuid(), for example leave 8 is abasent. But you report it.. Not a big deal probably.

I have an idea how to fix [2], which also helps to avoid cpuid_num_subleaves_map, where we should register some things from cpu_x86_cpuid():

just return bool from cpu_x86_cpuid, which sais is this list/sublist exists or not. In this way, we can go through all lists and sublists like this:

for each range:
   for each list in range:
     sublist = 0
     while (cpu_x86_cpuid(list, sublist, ...):
       add this sublist to result
       sublist++
       


-- 
Best regards,
Vladimir

