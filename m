Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618586B761C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgRz-0005SY-Is; Mon, 13 Mar 2023 07:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pbgRs-0005S1-Ob; Mon, 13 Mar 2023 07:34:41 -0400
Received: from mail-db8eur05on2070b.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::70b]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1pbgRq-0001vd-T8; Mon, 13 Mar 2023 07:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMfMYVg16o0rvjnVy6+AeaAfIdGpVVUGD3xjvwTG2rXqpuuTGUvMnGLvSZ+2ieWYI21sAbwr132jSnWrp15pbKSdnKynkYHVRFSQB7jnlo87lT8Ddn1VVWnF/UvVtSdMRCfvISqg8eSRgtzynMTDSQtgvtrUgg/QVAzSEy0RE/wbMhZqxFanUG2CMb7NTx5USieVJ1MYx/9QbGco9zfZt8idSRWPbvoEAqv1Kp//yImlmIYKfLvw3ne2+VQzIBw0Ka8JT5leGBPa0czxUDCiJlDSD9aSImAoXIVPaN4ZFlvcNUuglYMc+KX32IXtxUAQVmYAHnEEj295ebsz1nMcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKiBsecI4/uO942ACRQy7EgIG7hsCMS7Ycvz93M5Zd4=;
 b=LeR1rHqR2dN51nqJoSqZ4ccYRUzp46kgT9aQcKL8kxjNEEHdHVQ8jQZjZ3wLOMR+7NEROuROcBpiqJSVfNF4WuZsSwxQChvWpiFhZTOJb3WlbG1GcE8YkOXhzcJYwoODAtpl/dUxVQq3x6zkx+nFS9njkQNl9IbkBWJHXTLY4xkKsZhAtiLUUOzxBCf8gweS8TYWqpnQUxdeTQkJ3jtIn6Fke0x0MehQRHxx2WMatr5Q5ETjqNjawOnNRZAhTRFbDcjHLsf/V2MjLusLSF5MwM/e+w07bVGeVvw7w962VEgD+uDY3xArTal4tHsJGZ1pFjwWYGlh/uYBjj1QUiI0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKiBsecI4/uO942ACRQy7EgIG7hsCMS7Ycvz93M5Zd4=;
 b=UYFuyibFeQYDsU7fzohNMMhuB4KRDji/Ul+ELTxwCB6GzXo0TsO47xV/22ZOBZonbeywwc+JorPNzEZzi3tk1EwoG01wxHpOQeMbxlAl54J1g/xzdpys9BEPkNztlR9ojz5RrPu4J2Rw+r4KPznyJtYpPrJ5s4NZWN/gLBbE0bn+CCBpQIqbx70gpLYRYk5IVBW8yQh3H/774Rf/8+9I4OOER/XdTtjRlsQrdRFr6Qe8h7Z2upF16Srtr8XqRIjaSmoGvIroBMalF1IlOvlLVwEfmHycxsTBLBpte52Rlrd753YQP8YRsK/Ngn2BDQUa5rNGr4ZMUEftN/S4xDg6RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV2PR08MB8317.eurprd08.prod.outlook.com (2603:10a6:150:b5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 11:34:24 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::edbc:a240:6fd9:fd0c]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::edbc:a240:6fd9:fd0c%6]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:34:24 +0000
Message-ID: <87af3aca-00cb-4378-394a-6c014be6fd4d@virtuozzo.com>
Date: Mon, 13 Mar 2023 12:34:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v10 00/12] parallels: Refactor the code of images checks
 and fix a bug
Content-Language: en-US
To: Hanna Czenczek <hreitz@redhat.com>,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru,
 kwolf@redhat.com
References: <20230203091854.2221397-1-alexander.ivanov@virtuozzo.com>
 <6bbbfd5f-90c3-5e15-d417-a54fc25222d6@redhat.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <6bbbfd5f-90c3-5e15-d417-a54fc25222d6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0272.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::39) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR08MB6956:EE_|GV2PR08MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 68832901-7e27-4061-5567-08db23b6e581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0rkzcI1HrtbOZOwv9CIarPfOUpvyNwRqrE8SLy1/j5xgZY6sZwpgKpb0o2yweUBG0pM7f+0OER+GfLMDrALq8ko+P5CdlaRv+aPiLzcDzCxyM5ke+KDslI4wCRX0gWWde9r2sivJH8pyaumsTxPuOLUCThHTnISpfGzbU7e/imdp0nOYEmpeWmwro5R1k9JF828sXbOt7JAT3bwgTfdRjm2HxAkETCXpVyPtJrayn/tSaKUMRF1SYLAmEUOcXZiuaVMF/U11EBWzqhXkXyN5jraA3vUcEhCwOTJWsmdtM8aeOmC0btGO9ZU/GNlY/EnMIHUb0cZhqRxK8TjZiIa61XzIqm6ZrWqpi2rhbQeAk7tZGN5RH6cK2Jc0BqqpG2L6mPuT50xat8J25UTyF2Jx3YhTDYqhZfbRyFdRMDwEobrirf6AVggKR/d9TGnS6kyuEvv6z3YIktcKYUPC+xUL3TsCGzkSINXN+aoYV1duqNQy5mpFkNzjXVO4KihzY7WVzkAxIdyhtm8LA3xJw3eUjd5ipRZu6CWpdEs9IrzN5w7kLSfuaTIG2NFv/MbQimMML1SSGpUZ6qZp1Lbw3iJrJ0Y+mfEfl471ef6SKq1Rk/T0H54cAHNauVdnvzKE4Tc5hIOLmNmHSeG/BUCAS3A95QpEpQLZbzEAYKXjScudqrV7jrB8ERJ25JiFt+vs4CV0DLflMao8+VzTCzYxJqfm8FH7BTd3BOl9qq0UZP+yrk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39850400004)(366004)(376002)(396003)(136003)(451199018)(5660300002)(4744005)(36756003)(83380400001)(186003)(478600001)(6512007)(6506007)(6486002)(2616005)(26005)(53546011)(4326008)(66476007)(8936002)(66556008)(66946007)(8676002)(86362001)(31696002)(110136005)(316002)(38100700002)(41300700001)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGVydjcybHdoNS9rYWtxNFNaSU1PclZjNVZnZmFSaGFqQjkrNHllL00zcGRD?=
 =?utf-8?B?U2xaWEkvdUlLTVFrUWRLMVBUdG90TDhwbVcrbDFDZkpEeXkvNzlwSkcybndi?=
 =?utf-8?B?bXp2TVNpbEhQemxBQU5oU1BuZkIvUmw1cjF1NXRVSTRtdW8xNlVxd1Bmclh1?=
 =?utf-8?B?QS8wSlM4cXZJTWlYYklkM1IwZ1NTNTA5L2QrMGVuaDdHbytlUEc0VmJYS1Zp?=
 =?utf-8?B?OFBGY05ybFZycXZLZ3VUWW92ZjQ0OGhxQjYwRkFzeGsrektWNjh1a1VKUDhr?=
 =?utf-8?B?UXpZYVFWNUd2TWZ1alVzTFc5aTcrYnhpeTVSVjIvVm1laW9ka0RBYjBCVWhn?=
 =?utf-8?B?b0JKTEF5Sjh5Q0hRcUdxWUgrSnc5REMxYlJURDc3a3k5ZjZacVhSWWtOaXMw?=
 =?utf-8?B?MC9FaGE3RnppVEFKUTJGM25EQ1VjV1QvYVo2NXlVT3VEUmltL1hKUlR4S0lN?=
 =?utf-8?B?MC9yY3lqVG5MeWVBMWxxd0xFZ3J3dFRPcDk4b05MRVhZb3NMK1RobFNHOXdp?=
 =?utf-8?B?ajZUL3FvNkNFODVNNEN3amFLNmVGM1kvWFZZU0FEQ0RyeHZQeDZrajJIWThD?=
 =?utf-8?B?VUVkU05NQ0NJLzh4QjJSTnFBYnRycms3Vk8wTTd0OFdscmpQR2gwL2Frbzky?=
 =?utf-8?B?YWNmeSs1bmlGMmZxV0xxbVB1UjJEUU5TczR0ZW10eGJEeVljU0taK2xJVGY2?=
 =?utf-8?B?alU0bVl2dzR1Y0h3c1FHTWtWdXc2RG9yaEd0VlJrVmVBbGtOMTJPZzVOQSty?=
 =?utf-8?B?WEF1WWszbmc1UEl1T21nQmJhTk4wMW1BWUlZMXIyQjMwYmxTWkJaaGgyOE12?=
 =?utf-8?B?UmJYTEMzZmVVb1RPYkhUekZUWllPRE5iZkdpc0x0ejFNTUEzbkhRVm42UnZr?=
 =?utf-8?B?cXdUWTJtTTdiWUllelNBSCtYYWNoczN3R3dVR1hrTjBKMlVqUVJucnNNcTdZ?=
 =?utf-8?B?cDlsRGZ0NWtPTmdKS2tPYUhCT2lVZnhKZzc1K0FUOWRDWFRDVUhDdnFOQjRR?=
 =?utf-8?B?NlhzRVl2bDhBaVI2NjM0N2QvbUwwTkFwUVpwQmxkZWo5eVlQSHZHQ2J5d3Zp?=
 =?utf-8?B?WU9aVW1peVdVN2FlTUVRWTVpTTZyZk9jSGpRcnVCdEtoSi9LYjk0THR1ZnlW?=
 =?utf-8?B?MHdBOUxDdW9WSEMyYUhuOU5tZDRtbU1tR0RZNXVyVTg0aXFJQVJiMS83YkJZ?=
 =?utf-8?B?MVRzdXJzMVhCK1pqZFBPdWdlcFI3eTFkSDdMK3hFVUx4T1VBMkRVUUlOaDNH?=
 =?utf-8?B?eTJHT09DdnUzQlhqTENzdklad3A0YWRVZTY5Znpzc3EvbFJyQm9LQ3VrZnNJ?=
 =?utf-8?B?M3dsSDhBVHUxQmV3T1pRUDdROHV2MkNBeWVuTXMzVWxDVGhBVlk4c0dZMG1Q?=
 =?utf-8?B?cm9ISkdYdDFsbmpsWXRNaWZydXorZ2g3STJraExCQURyQVFuWHkwVlczTTVJ?=
 =?utf-8?B?d3QrbjgwODhycFpHeUFiUlUrY20raFQvODZVdENsRUxlTU1acW5ZVDZRQTFs?=
 =?utf-8?B?SE5jQWdaMGg5R2VPVStWLzdzOVJaa1RqSVBkbjlVSVJ0YU9uWjg1U3VMUTlr?=
 =?utf-8?B?TmFNak54L3h0V1VyUFJqcEpjZ0prZEphdnJNakpNaUgzcktrSEhLR2RzWEZX?=
 =?utf-8?B?Ujc0TnpLMGhnZTViMzF3dU81SUFQc08zbWM3empOajBwdVVCT1NlcERKbWxT?=
 =?utf-8?B?eDVYYUdCRVRGK3lLa2FvRUdoYXFxVzcxK20xZERzSnBDMVo2c1Y5d1lpYUdu?=
 =?utf-8?B?SEdESnZsR1g4TFBYRGlUbGhaTHk0L0FSZFFZb0pxdTIvbDZSTjVSQittQzg4?=
 =?utf-8?B?SFVvTXpyZ0U2dmpPR0tYcEQ0VzdDY0MzVjEzVmNTTUVQLzVQeWJIRVJ5b2ln?=
 =?utf-8?B?VE9Ba3c1dWV4akpqMUc0Vm5yc1k2aW52VW45SGVuWklYVXIrZ1ZjSmxUdVgy?=
 =?utf-8?B?T0NlamlXL0hsWjluY0dVeDlYa0E2WGo3U1FOT0YyZ0NFZlUzNVZRWVhPYVkz?=
 =?utf-8?B?VDJmVVVCaXozWHFGTUMyNW5Wc2tES0tVOXEvaWJkYk40QW9PMWFkdTB2enJ5?=
 =?utf-8?B?QmhXcjVsZGFIdFpnK24vQnc4VVIzZTFkaC9IY0t3S1UydG0xbTQyWlA0YWJM?=
 =?utf-8?Q?GuZtrAC8GafBn6Gy5YnWHhHId?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68832901-7e27-4061-5567-08db23b6e581
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:34:24.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkNPbqC4cZC1Pe2C01mUZxxiNZouDwC3ofOP0333R+GwpyTPzxEFriQt8LO8hw8ENb/TukbmpTKh8Mbc/ixS0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8317
Received-SPF: pass client-ip=2a01:111:f400:7e1a::70b;
 envelope-from=den@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/7/23 13:20, Hanna Czenczek wrote:
> On 03.02.23 10:18, Alexander Ivanov wrote:
>> Fix image inflation when offset in BAT is out of image.
>>
>> Replace whole BAT syncing by flushing only dirty blocks.
>>
>> Move all the checks outside the main check function in
>> separate functions
>>
>> Use WITH_QEMU_LOCK_GUARD for simplier code.
>>
>> Fix incorrect condition in out-of-image check.
>
> Apart from my comments (and I think regardless of what happens for 
> patch 1), looks good to me!  Some patches will need to be rebased on 
> the GRAPH_RDLOCK changes, but that looks straightforward.
>
> Hanna
>
I think that I should pass the process of learning how to send
pull request and make it as soon as possible in order to
learn.

We are really good enough.

Den

