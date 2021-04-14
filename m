Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E28135F5C9
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:12:39 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWgFw-0007ts-Qo
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWgEs-0007Ji-0V
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:11:30 -0400
Received: from mail-eopbgr80107.outbound.protection.outlook.com
 ([40.107.8.107]:13187 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lWgEk-0002y4-U7
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:11:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvNCi35r04i0XHesgaRqx1w53vetCL8oeqiiG69Z+6Bed5greLwbnBtg4ASZ8Pe88n2dOOOUCoSg6HucLq4/CUbJGjIswD1ycJidSiXelrC2nb1o8/7ZI0YvkTlEWx8CGg4a0IVqIetciTmyXAm/PkOMuUY6QeW+05A4/wsUoAn3Q08G5xG6K8/ei5HkY8L7QYoe/36uygsrFeATKPkQSHGX/f7ZxLByBXEcRuBRKDGbNF3pzchAkVDpGKIL4Pw6zJi53lcvKE0FnvjK39v2XQQIP8MDqDk4P13w7jLKlKRKJo9hvZvocJPFVhCMjrQB8pRmWji7lrCzquwubJBmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9UfneUeV1JOCP0Zhx8+b4aWZ9uJ+86c2bTPbFHD52o=;
 b=GhQ7gFpPS+tkVSZe0kDrfRdiJs5luLdrgi9N2z/5Ovz4Jmhn136XPHwmqzEpkmE14N/IotVlI7lO3DafmIb+aCyZu1WpGMuYYoYo+TAMw8WgIDvpAxGgB5BDMAtFw71Ys1v3Z+rW0fwoOew9jAKOJPG+NarOAqHStWnJlUf8DW6kQ4gvmTDpwQRsIZu+KFS+C2t5Jz5pEat9+C28iOVrI37KjNvPR5FXpjxrg4dMwCL1ys1ZMOJKD4/pfP8Gt72BRM4lEdAdYVlY5KpRiBILpXFQc11qkz31p6n/m86qM8vXnM8xXHN3P1XA/EFI+Jyp2qyKmWYN/wJckul2I5DVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9UfneUeV1JOCP0Zhx8+b4aWZ9uJ+86c2bTPbFHD52o=;
 b=hPr/S2P3L6lDTlEyfjQEUwCx6PtQKjQJVxePHeCh4hq7gq7HGtideNZ6hUq+FC8XLca8pCJyG4ZxwUivDD3FPWeNfVbHtB8gJP//Y+MScYPjPQp1HFQS2R/qS9DsJqcYAd1csjhSdkTodLUB4hzrndLtom9QxZ4AJzDl+6E2hx0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6261.eurprd08.prod.outlook.com (2603:10a6:20b:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 14 Apr
 2021 13:56:17 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 13:56:17 +0000
Subject: Re: [PATCH v3] qapi: introduce 'query-cpu-model-cpuid' action
To: Valeriy Vdovin <valeriy.vdovin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Denis Lunev <den@openvz.org>
References: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <581b5c0f-c866-bb21-226e-ee57f6e536aa@virtuozzo.com>
Date: Wed, 14 Apr 2021 16:56:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <20210326173000.18750-1-valeriy.vdovin@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.194]
X-ClientProxiedBy: PR0P264CA0216.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::36) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.194) by
 PR0P264CA0216.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 14 Apr 2021 13:56:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdde9697-3c0a-47d2-1ed8-08d8ff4d1302
X-MS-TrafficTypeDiagnostic: AS8PR08MB6261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62615B7A36560BB57F554E39C14E9@AS8PR08MB6261.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxLfftYC/kqXR8Kp0tcML++gmQdy3y25r67r+/ZxGWSkQMj7sTSCBHsLgL4qFzhceYjYxOkUg1SWLxW4+oBMmTe7VEc911j6svaNxLHnDOM6BhwrLP42oz1kaGTf/+5YPjF07SnQKd1yTKTwel9obV5UvlRENrW+D/rKhmJUU+495qHfYEMxdnWxWx624HIWs87ojli8t3rPsx5UUmo58LEUE++rM4ruy3fquxYPowzqvROrB7M0HHH7c/mytcgXxNDgktdDwtgQU75yoJc2RMr+H/92WZ4E6Y7N5uGI/qcnZ1aUhGX5mIIFW59CmCa871O/wedFwO9/cFg0YD4vLh1o3vpoxtOBKO+DB1/joXFe3d4PSb0y2+n5P5j2Tt3LBGq3DxHus2/tXxUUR1RZV0zst5YEzyWruTH3VsuCjdlPF7beYowvCwD18gpeX+mdW4W5wlqgM2PaD6Lh5ERK5t58nXao8uC6mp4OcNzDCHviiQau1WjcinrG6xUQV6uzDisNzaTH11z3QAY0JFOU8ySoqegKn/MnKTdFI6u+dWVv3DkDGP6ClnrIoCZgy6iTNkqUgpOWbZQRmB8Ufgs/YXMRE4teHY0rPJ5q9X55dUvnj5rRkwRTBlUZY7/TLYR7UAfKxcEtvYCTr4ImWiAGhMwev6GuNUzXCKGBClgCSvtV+HzqxOXnWEFbU+VVtDr6K4SJuztFzmzCzinLj93cm6uJRP4OOz9otR6Q2Q9L+BQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(396003)(376002)(136003)(66476007)(66946007)(83380400001)(31686004)(8936002)(8676002)(2616005)(31696002)(54906003)(66556008)(4326008)(186003)(38350700002)(956004)(30864003)(107886003)(5660300002)(6486002)(478600001)(38100700002)(86362001)(316002)(16526019)(26005)(2906002)(36756003)(16576012)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K21kVnBXK1ZFZFFzemF1RWJScDdkVjdJMno5bzRSQld5WlFNZlVCUnkwNkRx?=
 =?utf-8?B?anhqZVVXTmNGRXdFQ0wyTDI1REluSU1iQTYxWEc2ZjF0NkdISm4wM1JRMk1k?=
 =?utf-8?B?UnNaVDBDTXNvVmdCcW56RWNOeDdzU1l3Ukl1RkZBbWhHdkdtMW45c2NyK1lL?=
 =?utf-8?B?bEVpM094VGVmenVwYnEvQ0JpN01TakczZTZHOWlJUldIK2Z3VDRZWnp4NFR1?=
 =?utf-8?B?SFVkeWJvbEJKSUZvUUl5SnZ5aTBqakFYWXZ5eGN0S1VVbGhRY0xPZXNVclBR?=
 =?utf-8?B?N2FGZEFkNUJ1QzgrT0dsQWxIYjNlLzdZQStzWlBiai9IUEF2ZURmSXE3WE9k?=
 =?utf-8?B?YUVTZmlQRk9GYitDWWJJdXJxSm80RVZOclJRUENNSkhQcnUyUjYxSGoxR3o3?=
 =?utf-8?B?Tm9BaGVucHpIWm45UC9ZT3Y0a3hEOW9tUU5lNnlwT0ZsR21vYWxhUzBYTlkv?=
 =?utf-8?B?ZkFSakNpRW5PbjBsdjlQYnlxVXVsV3VnVFNWc0tNcmNoa2o4VnRlVTg5UHU4?=
 =?utf-8?B?TmFtSHRQajEzcTVtWDVPSEw1RFRTVXhYWGxaempTOVVKaW5CYXF6K3VEeTFk?=
 =?utf-8?B?Ty9maXc4SGoxTi9rckRubll4MlM3SHppTmNjWTZWbWFPbWxqRkhLTERRbko5?=
 =?utf-8?B?eThTM3B4YkxlSENhZjhpMFZWeDNOaS96MFRVOTBtYXRKQWQzS0Q0OW96cUxy?=
 =?utf-8?B?OHB2aUR3Ujg4RlUrRXBGKys1SmYrZmZ2dklqa2o3V1pkYm9qRjd0SitwTHNN?=
 =?utf-8?B?SEZsV24rM2h5M1ZycEtOUjRBR2VZblBDcDRpOEpIYjZtVmZIYU9zOFRCWElk?=
 =?utf-8?B?WWsxWjdJV1lBVkVSclpjaUNKemFxYk1qdnBQdlpZaURweWNuUDBQb2VqOFZM?=
 =?utf-8?B?SjVMamRoYURmNzVnSnlmdWtsT3pmZnV1L1MwdFgweTlPKzlWY095MThhYU9q?=
 =?utf-8?B?R2hWcXJXaTlla0V5V0xINWlNUE91WEM2bWVocTVQUmJJQ3JMQThTTEZOUEJ5?=
 =?utf-8?B?NmppUklad1ZuTnFUZkxRd3JRMlNEV0VXWVoyZ2J0aUpydzV1Rmk0SG1oL0Z1?=
 =?utf-8?B?Tkxya1JUS0NQVkdSV3Y1eG5xM2dQMFV1bVZLTmZYSGt5QVpaOWhESTAyNTF3?=
 =?utf-8?B?TzljRnV1VlA4bk0vU1pHeENCSUZWUHExYzB6alpxVFJMMnc2alAxLzZUVThj?=
 =?utf-8?B?N2QzMnBibVBBMU05aHlwNTduUlViY3VRb1ZIMytlczRVVnpyd05MQ3BLOVUv?=
 =?utf-8?B?eC9lK3dJMCtvZ3NrVWE0aEdhNk5zY0pGOEczKzc2Rm1hUHE2b01LMUtsOTY4?=
 =?utf-8?B?R3R1bFVVcUE5Uzh1MVdLWTQ4M3RVd0l6R3hFTEJ6RjhRWFExMjd5VStVWjV3?=
 =?utf-8?B?YS9PUWZtbVJlamhETXQwenhjM1QrcG1mZ2pXK0NTL0dOOGVkRGp4emFVMHEy?=
 =?utf-8?B?cTI3SE5xMGlaSGZRMnZiZjJNZTE2UFhkRlVtNTJqOU1zY2JzdFNzbUg4TzhY?=
 =?utf-8?B?UDhKV2N1VVdXS1dvSVlYa05kMXZhNVppVlcybklqTEwyNVNZcGZteklQWTA1?=
 =?utf-8?B?R2dCN2NhRm1sSG95a2s2SEIrd0p6RmFUOHY0cksxSk9PbS96bUU1NEtBbys0?=
 =?utf-8?B?ZFAraHJGbUxtV2NMME9SMjlNb1IzbVI4anhPSUcvb1dvdmFHc1RmekJwaGFE?=
 =?utf-8?B?Zi9zT3V2TXJJZ09xKzQ0RmxVSkdHak9OenZiSEhmeWpMWk9hZTBnUTVPNU01?=
 =?utf-8?Q?hlBQKKXon/5a4MaRBKoq4tZLD9gj0gcAAh4mw9B?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdde9697-3c0a-47d2-1ed8-08d8ff4d1302
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 13:56:17.2352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6fi+TmSg+ui4uH8LuLjR8m191aNykpu92WwGqq+U50nLPJNG9HSzfiwRXxWRRg3FPs9SEdLo910d6w2XJLC0nJ2DKmlENV5bTLvTNdiUo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6261
Received-SPF: pass client-ip=40.107.8.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

26.03.2021 20:30, Valeriy Vdovin wrote:
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
> v2: - Removed leaf/subleaf iterators.
>      - Modified cpu_x86_cpuid to return false in cases when count is
>        greater than supported subleaves.
> v3: - Fixed structure name coding style.
>      - Added more comments
>      - Ensured buildability for non-x86 targets.
> 
>   qapi/machine-target.json | 123 ++++++++++++++++++++++
>   target/i386/cpu.h        |   2 +-
>   target/i386/cpu.c        | 218 ++++++++++++++++++++++++++++++++++++---
>   3 files changed, 325 insertions(+), 18 deletions(-)
> 
> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
> index e7811654b7..6abbc1fb16 100644
> --- a/qapi/machine-target.json
> +++ b/qapi/machine-target.json
> @@ -329,3 +329,126 @@
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
> +            'subleaves' : [ 'CpuidSubleaf' ] },
> +  'if': 'defined(TARGET_I386)' }
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
> +  'data': {  'leaves' : [ 'CpuidLeaf' ] },
> +  'if': 'defined(TARGET_I386)' }
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

cpuid probably should be optional field, like this:
   '*cpuid' : 'CpuModelCpuid'

see [1]

> +          },
> +  'if': 'defined(TARGET_I386)' }
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
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878..19c1dfea60 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1926,7 +1926,7 @@ int cpu_x86_signal_handler(int host_signum, void *pinfo,
>                              void *puc);
>   
>   /* cpu.c */
> -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                      uint32_t *eax, uint32_t *ebx,
>                      uint32_t *ecx, uint32_t *edx);
>   void cpu_clear_apic_feature(CPUX86State *env);
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f1..a407978055 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5148,6 +5148,153 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>       return cpu_list;
>   }
>   
> +/*
> + * struct CpuidLeafRange - helper struct that describes valid range of
> + * cpuid leaves as returned by CPUID in response to EAX=0 or EAX=0x80000000,
> + * etc.
> + *
> + * The purpose of this struct is to deal with a sparse nature of leaf value
> + * space. The CPUID logic of returning the maximum leaf is not straightforward
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
> +typedef struct CpuidLeafRange {
> +    uint32_t min;
> +    uint32_t max;
> +} CpuidLeafRange;
> +
> +typedef struct CpuidLeafRanges {
> +    struct CpuidLeafRange ranges[CPUID_MAX_LEAF_RANGES];
> +    int count;
> +} CpuidLeafRanges;
> +
> +static void cpuid_get_cpuid_leaf_ranges(CPUX86State *env,
> +                                        struct CpuidLeafRanges *r)
> +{
> +    struct CpuidLeafRange *rng;
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

As far as I know, "inline" means nothing for static functions in .c files. Compiler decides by itself, inline the function or not.

> +                                       struct CpuidLeafRange *r)
> +{
> +    return leaf >= r->min && leaf <= r->max;
> +}
> +
> +static uint32_t cpuid_limit_from_leaf(CPUX86State *env, uint32_t leaf)
> +{
> +    CpuidLeafRanges ranges;
> +    int i;
> +
> +    cpuid_get_cpuid_leaf_ranges(env, &ranges);
> +    for (i = 0; i < ranges.count; ++i) {
> +        if (cpuid_leaf_in_range(leaf, &ranges.ranges[i])) {
> +            return ranges.ranges[i].max;
> +        }
> +    }
> +    return 0;
> +}
> +
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

You should either pass &error_abort, if you sure that function will not fail, like in x86_cpu_class_get_model_id(). In this case, if it fails, Qemu aborts. And in this case the function can't fail and you will remove errp argument at all.

Or, if it really could fail, you should check error and return. Otherwise you risk, that first call will fail and set errp, then second call will fail and try to fill errp, but it's already filled, and it will crash.

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

The logic of looping through leaves and sub-leaves looks fine for me.

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

[1]

So, cpuid is set not in all cases? Then you should make cpuid optional in qapi, and you should set also info->has_cpuid to true, when setting info->cpuid.

> +
> +    return info;
> +}
> +
>   static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
>                                                      bool migratable_only)
>   {
> @@ -5591,14 +5738,31 @@ void cpu_clear_apic_feature(CPUX86State *env)
>   
>   #endif /* !CONFIG_USER_ONLY */
>   
> -void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> +/*
> + * Emulates CPUID execution on a given x86 cpu model by filling the provided
> + * eax, ebx, ecx, edx output arguments according to CPUID instruction logic,
> + * where index is the value in EAX, when CPUID is called and count is ECX.
> + *
> + * Returns true if current index/count (leaf/subleaf) argument combination is
> + * valid and false in the opposite case.
> + * It's worth noticing that CPUID instruction already has it's own logic for
> + * responding to invalid leaf/subleaf argument combinations. Most of the time
> + * it will fill all output registers with zeroes. But there are cases when this
> + * function will zero out the result in response to a valid leaf/subleaf. Such
> + * response does not help caller to understand if the leaf/subleaf combination
> + * is valid or not, without knowing all the details about CPUID instruction.

Starting from "It's worth" - it looks like something that should be in commit message, not in the comment here.

Or may be reword somehow without "already has". The comment should explain current (new) behavior, not the history of the function changes.

> + *
> + * For such callers we explicitly return true of false to indicate exactly does
> + * the leaf or subleaf exist or not.
> + */
> +bool cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                      uint32_t *eax, uint32_t *ebx,
>                      uint32_t *ecx, uint32_t *edx)
>   {
>       X86CPU *cpu = env_archcpu(env);
>       CPUState *cs = env_cpu(env);
>       uint32_t die_offset;
> -    uint32_t limit;
> +    uint32_t limit, nr_subleaves = 1;
>       uint32_t signature[3];
>       X86CPUTopoInfo topo_info;
>   
> @@ -5607,15 +5771,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
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
> @@ -5675,8 +5831,18 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               if ((*eax & 31) && cs->nr_cores > 1) {
>                   *eax |= (cs->nr_cores - 1) << 26;
>               }
> +            if (*eax || *ebx || *ecx || *edx) {
> +                /*
> +                 * host_cpuid has returned some valid info, that means count
> +                 * is a valid agrument. Now we need to return true at function
> +                 * exit by altering nr_subleaves to pass the return condition.
> +                 * This is special for leaf 4.
> +                 */
> +                nr_subleaves = count + 1;
> +            }
>           } else {
>               *eax = 0;
> +            nr_subleaves = 3;
>               switch (count) {
>               case 0: /* L1 dcache info */
>                   encode_cache_cpuid4(env->cache_info_cpuid4.l1d_cache,
> @@ -5724,6 +5890,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       case 7:
>           /* Structured Extended Feature Flags Enumeration Leaf */
> +
> +        /*
> +         * env->cpuid_level_func7 returns the maximum subleaf index, whereas
> +         * nr_subleaves - is the count, that's why + 1.
> +         */
> +        nr_subleaves = env->cpuid_level_func7 + 1;
>           if (count == 0) {
>               /* Maximum ECX value for sub-leaves */
>               *eax = env->cpuid_level_func7;
> @@ -5777,12 +5949,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           /* Extended Topology Enumeration Leaf */
>           if (!cpu->enable_cpuid_0xb) {
>                   *eax = *ebx = *ecx = *edx = 0;
> -                break;
> +                return false;
>           }
>   
>           *ecx = count & 0xff;
>           *edx = cpu->apic_id;
> -
> +        nr_subleaves = 2;
>           switch (count) {
>           case 0:
>               *eax = apicid_core_offset(&topo_info);
> @@ -5812,6 +5984,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>   
>           *ecx = count & 0xff;
>           *edx = cpu->apic_id;
> +        nr_subleaves = 3;
>           switch (count) {
>           case 0:
>               *eax = apicid_core_offset(&topo_info);
> @@ -5843,9 +6016,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *ecx = 0;
>           *edx = 0;
>           if (!(env->features[FEAT_1_ECX] & CPUID_EXT_XSAVE)) {
> -            break;
> +            return false;
>           }
>   
> +        nr_subleaves = ARRAY_SIZE(x86_ext_save_areas);
>           if (count == 0) {
>               *ecx = xsave_area_size(x86_cpu_xsave_components(cpu));
>               *eax = env->features[FEAT_XSAVE_COMP_LO];
> @@ -5876,9 +6050,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *edx = 0;
>           if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_INTEL_PT) ||
>               !kvm_enabled()) {
> -            break;
> +            return false;
>           }
>   
> +        nr_subleaves = 2;
>           if (count == 0) {
>               *eax = INTEL_PT_MAX_SUBLEAF;
>               *ebx = INTEL_PT_MINIMAL_EBX;
> @@ -6031,6 +6206,13 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *eax = 0;
>           if (cpu->cache_info_passthrough) {
>               host_cpuid(index, count, eax, ebx, ecx, edx);
> +            /*
> +             * Because we pass to the host we can only check how it fills
> +             * output registers to check if count arg is valid.
> +             */
> +            if (!(*eax || *ebx || *ecx || *edx)) {
> +                return false;
> +            }

O! Could we do the same with previous host_cpuid()? This looks nicer.

Or stop. if they are not zero, you'll report true only for first subleaf, as nr_subleaves is 1.


>               break;
>           }
>           switch (count) {
> @@ -6052,7 +6234,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               break;
>           default: /* end of info */
>               *eax = *ebx = *ecx = *edx = 0;
> -            break;
> +            nr_subleaves = 3;

Hm that seems wrong. You should set nr_subleaves independently of count, but you set it only in "default" branch.

>           }
>           break;
>       case 0x8000001E:
> @@ -6063,6 +6245,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>               *ebx = 0;
>               *ecx = 0;
>               *edx = 0;
> +            return false;
>           }
>           break;
>       case 0xC0000000:
> @@ -6101,8 +6284,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           *ebx = 0;
>           *ecx = 0;
>           *edx = 0;
> -        break;
> +        return false;
>       }
> +    return count < nr_subleaves;
>   }
>   
>   static void x86_cpu_reset(DeviceState *dev)
> 

Also, seems you missed "case 0xA"

-- 
Best regards,
Vladimir

