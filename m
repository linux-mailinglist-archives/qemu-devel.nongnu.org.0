Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101475A7896
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:12:22 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTIpg-00070f-B6
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oTIn4-0005VE-B6
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:09:39 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]:63830
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>) id 1oTImw-0002nM-Uv
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:09:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2Eb6ifqmet+730swKjCiGcmVGy6upNne2Vdlh2qKwCVcUcfku/aoienZswbH3qMguNyxqj0k0U36oke0uApew/jmnMfUenRXzXwwvDgbMBMuM3Haga8sS32XLFrJdInKP5wzR/PuB6zQZNaj4ygXRTTu4mQw+q3Er8oTeOmyfKFVnNslhgq14kKBjzcmBGg7zCK3mkO+yBNipFil34a8LuJ1IZRIVmtypWqL+yyaNHp2cqNuvecZ9m5YRWXY6wA0Np7W4rgodOPx76PRx/e88sOoeoxDPA0SDGNeL0LgLgsPmYcXd0bjk9bdPGP6HgX35nhNomr3x2sw7McUWrGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfn5GIejtj6QxTSNoiUyGJsyFuxvafi6hyNVdAZjSK8=;
 b=kjmZtOpnmiGUw3ZWg968Uf/2I6j9atRrZw1MEkddR4XYcbOsNM5XPjf5Gh70ju4E4arKmZtovIiOYQp9EkUdeStffTBCb+33QingslQ8ar8vo33pRFKl2jqTylXHpAJMpHu03R14jFBAt9GD/yyjOYJsKwZT8RX1xGVjSDb9oIkDW+Rv2yO6DcE+N5Z3LZeRCFZ/aG7eQSusN+hYsGNkuCJUWp+1dnrsWdqaXM2RW4EXzfegpIjfV5Pha+uVgKGoXulXeSypJckK379l7W0B5sLxIauDiN4G7que1CeNhbUyOD8nDShjqayZaD7DHLMCDvz1erGVRIedPKwZcqRa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfn5GIejtj6QxTSNoiUyGJsyFuxvafi6hyNVdAZjSK8=;
 b=NP4juKiEYJsIPRO8zFM7QKUHLliF0buKGe94zKXA5H7qXH0w60M3QfAhh7caq7EXul8wMAZ2HexILd+GbrA9ZqmTIykDPlSrSx2vTVHcGeQG4o4NoENriYbA7job5AeVPrhySQkadfxkqJnc2QEE5VG8ZuilpW2Hyf/4u0oPOYspNXTrskjGd/VhlFQvORApQXAqbUBUOAe50NQVKq2dRdL5iRJoU+O1kkwQvVMkk+2mGg9TSUPyAv77zog2UalVHoGjtYlcZ84qgXUI2A2dcVKS08uvdNYr+SAZ/JNwASBlBpNHjVccFGwI8IliHgg8mqeltEF5BopD4156YKnnlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by AS8PR08MB9477.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 08:04:26 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::5593:9fae:255d:ee6%4]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 08:04:26 +0000
Message-ID: <0885c8cb-8834-40ff-0214-d790219ecd1a@virtuozzo.com>
Date: Wed, 31 Aug 2022 10:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/4] Add 'q35' machine type to hotplug tests
Content-Language: en-US
To: Michael Labiuk <michael.labiuk@virtuozzo.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20220829170106.110195-1-michael.labiuk@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220829170106.110195-1-michael.labiuk@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0066.eurprd02.prod.outlook.com
 (2603:10a6:802:14::37) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d81a7b15-03ea-428a-6e94-08da8b276c18
X-MS-TrafficTypeDiagnostic: AS8PR08MB9477:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNZZcSdvIbLdU1y4C/O4J0Uz6C9SX/6YZGSWIIPBABNO3ahSk5snl6Pa17GVpMEC13F4hsSrcYIb+0ovSXttu69tJR4CAiobOuLUetZqDs5iGQD86wXhp6aZXX/OfpBaCGsjj6iRCGDHOy98uOi3RoEk+INfvr4rWJuadW46HdljYAZ/ReOV7HRGt1FVlGV0+n//ZRlRiUC+1yVnVMRi52kwA1xkNQIlDWXpI2jSopW6WW5Uay16N6GQD1XQPOvaROK34Hazx8lwAe9Ok8c07dHJK/rjnXjrL6eWrYprtWYJzSvPLaFjtEOmPcfGvHTbnOJnfImVZkEQFIgaihpmfOjkSITaPoD5hSW8BRD9+TuVXsGOWg2a9dNoSI7N1aC4S/5VqUC+jl2UmZuhlcLSXmlkK6/ysDPQFtfYn2+2pOzqHK2SRrGkr5T1koxT9Wo31l/gxbQqw8w8LaZYId8ohN7MuCLBGdsEb0BU9tA9+RfT+C/k10gctppPDQYtLwo229a0QOhNmRFzODmvtt36+qcJs36oZh955OxKcZmasJGX6feD4GgM7W9qtXG9FZPvENYMUP5zv22C5ZBpXBylb6tz8gPm2U/3A8LLdK9fOgNom0kAkq9uT0ZRsVFAn2PWiaSvlgDyW0ZoESbLbrTE3DbCP0mhOQG8vYYK6G0rTsoh9U+pahBJ5fVSEMtMS3TrIj0t6DmUnajXZRojPlrYw2c29DLXrr6mTeaHxbBLccDxmRmWqyZ1lFiUyE0rSEfarILc1Z2ZLpodcbEmVnorFFvLtixVyHcPZJAoC0Zolzu3agr7/aRNfnJkuhoTvcw4zQTUCl7GN9xQEjf2+jXzAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(53546011)(52116002)(2616005)(66946007)(4744005)(66556008)(66476007)(6506007)(6512007)(6486002)(316002)(26005)(86362001)(31696002)(41300700001)(38100700002)(54906003)(2906002)(38350700002)(8676002)(4326008)(186003)(478600001)(5660300002)(31686004)(36756003)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2k4Zmw2M09xdzdNNGQ2L2tqN08xSGdJU0NONmd3V3RVV3RHNU95KzJXdGUz?=
 =?utf-8?B?SUR0ajc2MWtRN1l4OWdPTnpQQWdDbmFONDhJUUdqdnRLdDFrZ3N5WnY4bEp3?=
 =?utf-8?B?d2dJVml5R1l4YmVxU1JZUzNleVhJYmxicVFFUkxLU2NRbkc1TGJvMkJjT3Ur?=
 =?utf-8?B?OTlGQlAzRTFaVzZmZzlWcDg2TWdNRXdPc0QyYjVsYzFKclpRV1RDVHVkVGpS?=
 =?utf-8?B?R1FyUE40SldxelZQWGpXc3hNNnViQlBNeS9kV2lneGlKbm85Z1VUOHptWUY0?=
 =?utf-8?B?K3N0ZDZEZlp0VDVHUHFicVN0MVExZFBGallHZ1REbFV4aXFxOVF4TkV6RnY0?=
 =?utf-8?B?Tk05MDd6RzcyT0djMlZRNUVQS004S20zT3A0cHlQN2srUjFRUTh0VGtKbVcv?=
 =?utf-8?B?dWNIaFBBR1plVzNXRXJDTXlVV1RaTi9ITER4S2VybEN4ZzRKczcvc05mOHQz?=
 =?utf-8?B?ZTdqSUhrcUtKL1ZUUlZmbDhlWng0YktIYjNSb2QvOWdhL3FzS1I0aWp5Q0ps?=
 =?utf-8?B?aG5WVUNrTjYydDRKMGgzaFd2OU9tMjNGSm1TTS9lRlRDT1lrMHpZS1gwQTBX?=
 =?utf-8?B?dnM3bXJ3UnBDSTVEcjY3UE9VNUxyS0RYOE9ydmdUTDVMZVg5S20yYis3aG1I?=
 =?utf-8?B?TVRTS3JWaUhwdnE5bUNXdmV0RU5LYWpFejExR0RDNkFlVFRRSWdwNERESXhS?=
 =?utf-8?B?ZWhISVZDeVFqKzJVa0RhRG5uN0VMZ1BqdG41cXNFM2pZZGx6MnRiaWRQNU40?=
 =?utf-8?B?ZmZzWGRMbDVheS9mMnI5MmE4Y0JDaGoxMnI5TUdVWE9BVmtrMHcyWUNCS0pj?=
 =?utf-8?B?dUZiUEJFS0FyaVZsNFlRaGhXSDZXQnRZVyszanBSZW1uOFBoa1lPS05CSlNx?=
 =?utf-8?B?Q2hwRzlmeDFYRGNUdTJHemNjRGZJdmlBUWxGa1pid05OTmFwM3dGTHo0a1NM?=
 =?utf-8?B?bDNUOXhhRkNuZmNyWmJTTHR6MnVpNEQ1N2phczc1VHY4UU9kOXc2WUhyVm5v?=
 =?utf-8?B?bEZNMHJmZXVWTUd4aWZsWWl0VEg4NjRJMzhUNmUvb2ovNE5LYlRkNTc4QWZx?=
 =?utf-8?B?M0o0QTh5a3dFTGRjczNOSiszWDRZODFWTWVWVVIxdEc1aVcwWUNSQXMxWWNF?=
 =?utf-8?B?ZVVibWc4cElGdnl0dDQwZ2tlK0ttaGVWL0ROOUdtOHVCR3BJYnFMem53VjN1?=
 =?utf-8?B?ZVVIcldTRHYrc1kweHYzcU4zTEFCVjYvLzc5T1A2Yk02bDN3QWxEQ2U0M3Zu?=
 =?utf-8?B?TE0rampKc2Q1WGtOK1F2QXUwQjU0NWc0K0lac0VudDhjbzdRNW5OcjJLaHps?=
 =?utf-8?B?elJmcEpTN1lEZnY1Y01VMEZsWGd5cVN1ZEFBZG5qS1AxZitxc2k3ZnJiNjcz?=
 =?utf-8?B?WG1rbG9XQzJvNmFsL1djZFF3dWQ1SDdYNXRZUGNwSXp0N1lTNk5RL1FieXZ6?=
 =?utf-8?B?VzFvUUlJSzhpVkdmTGlNRW0vQVpiVGlLMzdXNjFTT2ZzZkhxNFJGKy82Y1cr?=
 =?utf-8?B?YjFNZkIrQVFOWm5CUHJ6clhxUXFlb0ZObXlVc3VQRVNLamc0QTB3ZnJuQTBR?=
 =?utf-8?B?WWZ3RmwxNC96bURhSnVZNWdZcXNGVEl4TGI0WmRHQ1FSb3MrRnFEZlVBZld6?=
 =?utf-8?B?REs3MWRmYjdabEdWQ1J1TmJtaTNuRVFRQkgvck1JUy9FMi80K2VtTFMwdk1a?=
 =?utf-8?B?RFAreUdEWmN3Ym9vVlpuZFdYMWpOVmdpMjZCQkFnSWNyM3FRd1JScWZZL01j?=
 =?utf-8?B?aFhYb2lKZ2pJTlhmbjFzSHFPV2lNN1JKSXFoMnpkcGliQUR2QjBOeFJsTlJz?=
 =?utf-8?B?dUw5SGszckUyVEtJWHpvKzI2M0lObVQycHM4RnppSzFWOVpPYXk2aDVSa3Bi?=
 =?utf-8?B?ZSttWnNOZUZYL0xEem0wUE40L2xrQk5ka1VkMUJxQ2gwTFYyV2JPS0tMczYv?=
 =?utf-8?B?NzZWc09YbFBacVFkUlREM3V6d2VxOUhwcnhnckFyQzRTUkFVYUZtbUR0alNL?=
 =?utf-8?B?NlFiRENmVXZTak8xb0tSQWg2d3QxbmlERGEwcmhuaWxWcmlYYVk0US9BeEJj?=
 =?utf-8?B?M1c2aXJjSXUzOUV2c2YzNHM3MWQvVWFHbkN5dENQZkU3b0pHY1JYSnArUDFW?=
 =?utf-8?Q?6PFa+ZW0FFyjS4CrKBWYOKLgb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81a7b15-03ea-428a-6e94-08da8b276c18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 08:04:26.1747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7wSeg5BYAifFL0TCleXr3n2nzjroHiAknfmzAR5DOnhfVDXt7Rqdvu/TBQD5keCENpevNDEVOugcvdTb6WCVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9477
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On 29.08.2022 19:01, Michael Labiuk wrote:
> Add pci bridge setting to run hotplug tests on q35 machine type.
> Hotplug tests was bounded to 'pc' machine type by commit 7b172333f1b
>
> Michael Labiuk (4):
>    tests/x86: Add subtest with 'q35' machine type to device-plug-test
>    tests/x86: Add 'q35' machine type to ivshmem-test
>    tests/x86: Add 'q35' machine type to hd-geo-test
>    tests/x86: Add 'q35' machine type to drive_del-test
>
>   tests/qtest/device-plug-test.c |  26 ++++++
>   tests/qtest/drive_del-test.c   | 111 +++++++++++++++++++++++++
>   tests/qtest/hd-geo-test.c      | 148 +++++++++++++++++++++++++++++++++
>   tests/qtest/ivshmem-test.c     |  30 +++++++
>   4 files changed, 315 insertions(+)
>
I do believe that there was neither discussion nor implementation
of my previous notes to the previous version of the patchset
except splitting.

Den

