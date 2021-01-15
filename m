Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 115F62F776D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:18:29 +0100 (CET)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0N7c-0003EF-4N
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N5v-0002ml-QD; Fri, 15 Jan 2021 06:16:43 -0500
Received: from mail-eopbgr140102.outbound.protection.outlook.com
 ([40.107.14.102]:19534 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0N5t-0006E4-Nx; Fri, 15 Jan 2021 06:16:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRZjRi7cMs+8AEY+KpBFxoUcxYeZ6FMMYwF/nvDZufcDNnThVm0f7uHocc7jAo8rqgr3GptN40rkNJ9jJa6I4LImkNKrGFxO8Gwj4NosGl04HcAU8pzpi0eCyheS6qVHirnaAf2Hi1jo/Ly+k8cEpqY9UJQDM5yapDci2lQlu/+Sk2dDsqNd2jXkdRU7LTgfVxPSDAlp2EjygBHICx4eZSBXOLrIbYkL9urJ0CvF0TBD74YaDLrlUsDOMe4XkxLBSp8KhbcR7xptw5yUMmjjDFlFb5zmJKNI7tAH4N6feJl4DAEpived0KHvpuxmoKqpryYqDvM9T6z6KCjbuMVs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSp/hp8bfDgeuDTJNUI4mzYjxmUXt3Msbz6KqXoDUEg=;
 b=Iz/aB0w4itWuQiwcYNE0hWaTGBJFBRrZRM4EJSs3VKLCFOJlWLrPtSt3motStr+VgIZ5RgIGRzSpf5wYJRsK+KJKQEcHSN5gdbNogYp2ZIJuKBemUH+TspyBcKP7QIHLw9EsOTjTG6Tbejvz0Nu/ZHLyocnVVmGtUUs+4HnXt5a3A+vavMup/uu4Q1ABCN+qa0ZxyVuswOlmK8JgomVIlmMBqPIOWsEkp1/j3iCCEZHolQhY6Hiqz5dCvFHZwSJQXsZR9qIb8A+rR1bB3VpAcQmKd0xtnbuciQ5QWN5WPrHZH/OhOasPTIz5Ki5VKC//MV0I/slo/jliK6ORp4aLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSp/hp8bfDgeuDTJNUI4mzYjxmUXt3Msbz6KqXoDUEg=;
 b=WQ5D9bnazt44CsIHqYe295kjhJNhChdS/1r/cA020hIoo5qe/lxgqu7d73tsjPmnEnkOM+Z+Fvl39nagXkGDKl6GpHphCeQfR4iQingFoLiFB+DxdQm+lci28Ynyfah9frUvjqW3GfqPoqOl74PePmswwNRl86olwli6KdreZQc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3221.eurprd08.prod.outlook.com (2603:10a6:209:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 11:16:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 11:16:38 +0000
Subject: Re: [PATCH v3 06/10] iotests/129: Use throttle node
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210114170304.87507-1-mreitz@redhat.com>
 <20210114170304.87507-7-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <858dfc32-24f6-1b4c-48b4-7c340c2e5269@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:16:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114170304.87507-7-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.75]
X-ClientProxiedBy: AM8P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.75) by
 AM8P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 11:16:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 933c7732-7521-4a39-42eb-08d8b94706d1
X-MS-TrafficTypeDiagnostic: AM6PR08MB3221:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3221B8548A084425EC5324B1C1A70@AM6PR08MB3221.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X/pkp5Q/n3J6rsJJ7XlYGM+CkkDWPoR8OIAtwK2VlcI6GDFXVAW+9CbcRPYe9liKwosa626hgN3e5qsyP+hqH/oZph3U8y7ZL/K+wydC4D4J0LaONgimSLhQWNK751tk2LIaIoys4vk3MfIgrxmdEWksxrO1GGcq8CqC5tnXjoSu3Muxg7pHGXXSYDRIqf5rkG9CT1T2EmkwhSC0pKp3LWRkOg4MN2q7WK3gjNWIRb997L4wguZfFSJqADzuoOPv3UdMdU2OKeSDDgfkGgefOD5qH8g4T+BaDZkD8xs6CuVsQ6sLK8y9+vsBwZ+vO6kdRXXGHWzVmYhR/5WBn9mscF6gWXAW377NfiTY7nnQNtKqGKmc8FEFVXI9MN5qx4IX2clIGZFfeWyOmFZFXR9Lg1u7olDUMxgsqyHWXBX57H58+26uauQH3qxImSq3/kIO8NKu7cfDSOgfpjuPV1YwBv0ORO0/EPZlpy3IaYGScDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39830400003)(136003)(396003)(316002)(4326008)(5660300002)(16576012)(186003)(16526019)(31686004)(2616005)(478600001)(86362001)(66946007)(2906002)(52116002)(54906003)(8936002)(6486002)(83380400001)(4744005)(8676002)(956004)(31696002)(36756003)(26005)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWZwRk01WHpUcmtFTWx3a2dVNWcwNk51UmU5VFhWMm8wRkJJR21ndzNCZTda?=
 =?utf-8?B?eGxMRC9JZW50alZpZks0K2lYUnBneURYSStrc2IzY3UyQ0duTXZTOHpYQnhH?=
 =?utf-8?B?N1d4RStiNTJNeEZrbDFHRTUvSWpXQ01wcVpGMDJYL2FZTUsveEZrUG90SmtN?=
 =?utf-8?B?SE8zZ3NFVkZOODRRdXlRUVp3RnFCWFpzUTZkbEJHTWNwNkovcCtFU0RuNW9R?=
 =?utf-8?B?eUVoYkxJVG1vam5MT0tpR0pvck9jT0swRm9RZVFnbGpwR2IxOUhsbDZ1Sm0y?=
 =?utf-8?B?YVJRNFBEMC96RnRVQngwWURLTXNwS1lKd2tXQjg1c250YVRUTEl3bFZTaFRK?=
 =?utf-8?B?UjgzUkhmSkJHMHZpWldKL3JIbzNwc3A0Qno5NXhYTGdQMzdNall4cTZkR1R0?=
 =?utf-8?B?NmVoNnMrMnBIK0FUV3lWWGZ3SVAxUDNzMVk3NlJVY0V3VWNMZ0EzY2ZEUlVn?=
 =?utf-8?B?c2tYM1VFNFlBSXEvOUZ1d3o2UmNOclpybnlFbUpxTFRxYnQ5SGk5RnpSQXNV?=
 =?utf-8?B?OG5wbEthZkFhbWowVGNxQ0FuZlROd1IrbUVjVEVPRlJMZmw1dXZrb1NZd3VU?=
 =?utf-8?B?bFFSUlRHalVOYUtyTnpNK0NPYmxlRExBUXkrZFBvSHNYYnNoaG9KbWp5Q2Jt?=
 =?utf-8?B?ZlFEcHdqU3Q3S29iUUJZUzUyTE1xZmVCUEV5TGRJaXpNcENOWjZjeEtxSjdy?=
 =?utf-8?B?TExHR0JPclg5ZnNoMVgrY0VCbkNibGJib2ZiaUdkMkJGQy85cGt0MThsYXdF?=
 =?utf-8?B?c1h5TGVCcU9FSzJLQjQzMUhMZEdDTzc2ZzZRKzBiOGI3aHJDMUdhSGRmaFlG?=
 =?utf-8?B?MDR4Vm5hSldzOGVRSm9SYi85SUp6Rk52dEtoQlBZdWNGTFluaU8vNEN5ZmVs?=
 =?utf-8?B?ZndFWjBBN01CZ0c2UitqZU4vWkVsbFl6cWZMSFhhWVhqMk14RExOMjRZL3NG?=
 =?utf-8?B?R1JxNUczSlFRMUtEK3VKM2RBd3Zsak1ucCtyUllWUlZJTTNjb1NEanRnRG5X?=
 =?utf-8?B?LzVsRU5xM3NEUFpZL2hUblNxSE80aXhvM0pidG5EUTJKbUhmQUR2dlcvV2FF?=
 =?utf-8?B?ZVFhVG1JYkg4UFlKNlpxZG9NandjTUJ2YTB1dE0yR2w0YTBJT2V2dnBZL1lZ?=
 =?utf-8?B?NmRIeGxldDBraENDaHZnQ1Vmc3FDVkdxeTZ3Q1M3bjVKZ00zMEpIMTR6NWg0?=
 =?utf-8?B?OWllQ1lhUlN1VzRMOSs0QTExU2JYdkVhaVV3aVMwaUE0dkEraGplRERaNWhL?=
 =?utf-8?B?Sml0YUQxZGx1TW1pTVkzWkpUNG9NeDZCaFdxTlo3azhNU1I5VjBza1Y5NVdS?=
 =?utf-8?Q?3QBiOVoMxAOcSQb2nksyjOC0d/cvNGq9wo?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933c7732-7521-4a39-42eb-08d8b94706d1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:16:38.2194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nX8x3LN2K4IR7kxemp6wdosBN9A19RrUPe8J4YYN7A9XagoEdDag9Dmh17d+0a+j8GQ7WXa6mSv4/FnhQzXt4oZoLDF7l1hpYZvw+UFxGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3221
Received-SPF: pass client-ip=40.107.14.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.01.2021 20:03, Max Reitz wrote:
> Throttling on the BB has not affected block jobs in a while, so it is
> possible that one of the jobs in 129 finishes before the VM is stopped.
> We can fix that by running the job from a throttle node.
> 
> Signed-off-by: Max Reitz<mreitz@redhat.com>
> Reviewed-by: Eric Blake<eblake@redhat.com>

you forget my :)
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

