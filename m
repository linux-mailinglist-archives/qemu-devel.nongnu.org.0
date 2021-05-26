Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8F3391CC9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 18:15:30 +0200 (CEST)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llwBt-0004UZ-Pq
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 12:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llwA7-0003TO-EZ; Wed, 26 May 2021 12:13:39 -0400
Received: from mail-eopbgr60107.outbound.protection.outlook.com
 ([40.107.6.107]:35843 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llwA4-0005fp-AL; Wed, 26 May 2021 12:13:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2Cfmu5gRWEcpnlnFxLxjI3l8J1FP/6G/DI/D4L14/E9Ag+XIK/2jl2cHMBBmzdm7Jn1IT55VCrbm//VKqusSjSrM7jwrbPy39pyOCIm5qYb+fcUDdzfuMxCB/xyxrPlyizL5iw5OXrpBEkL3O8fJknaGZi3job/EAewVngnUwfMX6YdjYMjdLbJ3UohCzqvWVhjdNfviP4X+GU0d/zIi24dndM3o5YVVlOLUDkGTu4kAS59LDFgKupaZeplxGPvVF8LJ8+MGTszqAXHJbG/KhiNow9ee+QaY1WFTd8ZhxbIGEORZbDfVsaj14+ouexIf4qMs0k+PV9A3J7w8pAo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8IE0hje4gd0pzd+9JOLkGvpIxTTT8kDLitHvMXfaYE=;
 b=gMPp4yOpB3/MO4UxoSF8HLbg6t/i+cmf8n6rPN2H4dGSZ0efbNeYr7aRCajYzPp215MwBoyZyEzcC10TP7/b7Hw2evF5VIFs19Gb2VWlLUwiWRoLFuWuvFUsojeI9llGTa89U7zXwiItjhNjufLyzgCypI8Ia9dlTtL+7hrt8ojyy+wftiXiM1VbxC1XUgQgpUKzCAGsXQvN+uymbY8/cJUsF1qV5OQmpBHJkD1HSUWeG9Ln/xjfIJLUW33oyuPx3l2AoenriCE00Tn3dB/5NKNdogRH0hMXAQ4b0uViz6MJv8f+ifw4XqofFTlJjMTNxIfIDL19lfRc01olpHrtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8IE0hje4gd0pzd+9JOLkGvpIxTTT8kDLitHvMXfaYE=;
 b=P7IRktWHVUgW9DL5O7kkc06nHjME3E3q95e96Fi7i4NZ2c4vFOOS1GIeWqPUB4nILLlo9jrrhsh72IaU+/2qwRBnqh9Ij+bTEzlsH/OKhuemLS2Tim8OmdKpNSpSdYqkvtt6Xo24qebMAFFFoKq8Q+YcftilnyRMJRDYAzjyn6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1907.eurprd08.prod.outlook.com (2603:10a6:203:4a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 16:13:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 16:13:32 +0000
Subject: Re: [PATCH v2 4/7] block-copy: add a CoMutex to the BlockCopyTask list
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-5-eesposit@redhat.com>
 <a3626fa3-359f-c746-74ac-b1b942ae56b0@virtuozzo.com>
 <26cc90a9-756d-902e-3559-81cc01439e24@redhat.com>
 <fae5f204-ceb7-722c-ab02-4a1671c52624@virtuozzo.com>
 <2a60c691-12c1-fb53-ae47-0e56ca8a0ad1@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <32a95fc2-b9e7-96e6-40ce-360e027d04ab@virtuozzo.com>
Date: Wed, 26 May 2021 19:13:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <2a60c691-12c1-fb53-ae47-0e56ca8a0ad1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: PR3P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 PR3P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 26 May 2021 16:13:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebbb522e-1e39-43ce-90d3-08d920613528
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1907:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19074FC9286FA975A9045455C1249@AM5PR0801MB1907.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zihJxaGxLaThdp/O3BogO/iwoprbOKBVdZt8Wrw1yx7+jhWEtUMpv61/FBffTTpTgH+SsbddyuWfp8PYqF8UjplB4gVVSUVBpVGwVkIU0HimyABQTdq7gs3ea47xURDP2Nq2BmBVt4HFI4/NkJt+Bvb1VbIW2qrbtJu7uW/7soTu3I3iRhhWSApiJARCyGY5HBjVX3mC3G+M7T6ufiQ0wHAR6YSbt2/IywOGV1evv+n0JS0DmLItUV3ike6KfTDx9EarEx6H156AQB9o/ID+scat8d9OfpRHRg3+Bqq1OqSLiTgLzQaIH9JTUFmGPW5/L2JZYCIUEeo2f23v0WIvUcAQyEptu57aPbTBo1Nly4mMZy3HmWJnKgBq+q6vobjJLvnU2yAZcoM1s5TeBMNC1e7xBMt70zWt51pfeLl9I0P7Xvd07R4Jb/8hw3tHvzPEQFEClcN//JwHjMK2VevR9uE9T8N8/1qr8oaGeoQ1FWV95sp0M3ioHXgvDUIV3SpDUyVTTgMHxhVftmtQDoG7UTEysMmPZvqNWJnMPOB8Bz64t5Y6d5ZdVnroo0FgOX/We4Drq3r4OFEdI8u/Q5kd7x2zG6S+UxcnvI4sHVP94dLUF2N8FNbOhT9lwARXmi7Mixr3lFMpq/MDsXHiNgZYRf+giwos017ERd737D92cdtRmmZ2wkF1UUDtmW+uiYGvGQ8V1EtoVrvrDUQooadlq4/KyuAO2aijnyqAvxYtWuI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(4636009)(346002)(396003)(376002)(366004)(136003)(39830400003)(66476007)(66556008)(6486002)(956004)(66946007)(16526019)(5660300002)(31686004)(52116002)(53546011)(478600001)(31696002)(16576012)(38350700002)(54906003)(2616005)(186003)(110136005)(26005)(8676002)(86362001)(2906002)(38100700002)(4326008)(316002)(8936002)(83380400001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGZqTThuVHJKZko3MUQrSnoxcEhzb2hTbUtIWWhaL1NKQkF1MmgzbnFpc1Nr?=
 =?utf-8?B?anAzRHNkbEdjaHdIdVRhcXIwa3JkUUlRVk8vODIvdmZqbEhUTG5FU1lzQjFy?=
 =?utf-8?B?M0FhbWpyRFBXV1pxcnl1UEdRVzVDdkZCZHdOK3cwTEk0YW85WGo5Q0trOWxa?=
 =?utf-8?B?dkZOdkdNMVZaM0d0dk8rZkJKb2VhNmpmR3lSSEVuRUltc3RyQlcwdGsvakpu?=
 =?utf-8?B?SjR1WTkwNGZxNTQ1aGdVVFRaVkw4K094MzZUcjA0dmxka3M5bU5iQ3RHYTg2?=
 =?utf-8?B?RDlUTzRUR3pHY01iYlNtenJhaUEyWDMrUVFsY1B3Vmx6d0w5SDRpWmdOSWEx?=
 =?utf-8?B?b0plWWhBZFlaUUhMOXlvZlB5Q2o5alM3eTgybUlyWnJGM2hWREVjNTBhT0g3?=
 =?utf-8?B?ZkxPeXVUU2ZTc2JhMURCT3JWVzluTURYcmkrSTNRZDlhd2dNdDJ3NnJDS3ZJ?=
 =?utf-8?B?TS96cjJvVGNzV3hTd3BhUlk0WXU4SlFkS3pSd0hTTzZzRmpkQ0tHMkVSQ1Qz?=
 =?utf-8?B?bXBxSitSK0lVSUg2SnJpUzZvSE02NXU3UHRuZUFzQmlJd2lJdWp5SXRpOS9L?=
 =?utf-8?B?cXR3TmlaT0FmZkw0bERUcUxwRHRqTVFmeFZNWE9HQzdCWmVERXNZajhSOUlr?=
 =?utf-8?B?ZndiRStrQjdPay80VjN4TlVSUUZIU1Q5OUlVQUl6bUplYVhIdFh5U0twdVdw?=
 =?utf-8?B?bDBicTR4WWphdXBVcEZmQVd1V1NxOUVzL0lxOG5zVmJCQ2NKV3dnM2VtVFBq?=
 =?utf-8?B?ZkdNNkNNVHJXZWpQTkNLYjZ2TXcxNTZleFV1OThydFYxa3JmUVZET09QM1Fk?=
 =?utf-8?B?R3krNjh1NU84dWRYQnlKVEtwdXFOenFaL0w5K2tzVEEySUppMUJpTkp4VVBz?=
 =?utf-8?B?dUY5UDhuM2ZRWi9WR3hDMldWUSthdFVHMVYvb3FQMHdqdUVxT3VIVWVSaU9v?=
 =?utf-8?B?NGZZNG10ZWgvK0NWendmY2FSKy9nNERYZXluV1R0bEhqL24wZ0VFelVpV3lN?=
 =?utf-8?B?WUp5eUl2dlFBOHErRk45R0VOK3VzaUwwNy9xdTRkaHNLc1ZvaE5ZVmpYVVVH?=
 =?utf-8?B?Q0kxTHd4OWg3N1pxaVpSN0dtbkJvN3ZBM01OZm84MSs4LzhuNDBqOTZyRGxM?=
 =?utf-8?B?ZVVIZVd6VWlkTnRXcVNWWlNLTDFzSWRjWUpjZGZHbEdKRGJjUHhvM3doTDRk?=
 =?utf-8?B?VWZkZXd5M1llbWVzSVhKYXdYQnVjZ3M3L3NkVzFnbTMxQTlGN09nbXF5WTNo?=
 =?utf-8?B?UnY4ZjNNWXU2Wm9HYXMxamxKWGRScXNMUDliYUMyZGFkVEk1L2JEQ014em9k?=
 =?utf-8?B?T01WczNtQVBOZVpDUmdidURYL0cvU2Y2NjV2OUpGaGRBSTlVNUgrZWh0dGMv?=
 =?utf-8?B?aG0wYnpUQ0x3bjVBNWZmMThGSG9hMGRQWDJlTmxoQkh0VDdkeTU0RU9tbDZq?=
 =?utf-8?B?MEtSeXlwMmRwMlBtM2FNZW8rNm92T2gyYnBrTUZISzMvRVJmRkZqT2tBNUlQ?=
 =?utf-8?B?bENJZ3B0VFhWSk5kVVliNXZxNjM3Q01WMzhybG1qak5NQ3VzVlkxSFAxNEVZ?=
 =?utf-8?B?eW1Mc05BdDI5L2ZlZjg0VXZQOUZScUpBeUdpVVNsWjBVWnlBZ1pPOU9OWnBF?=
 =?utf-8?B?a2N2eWgwa2hxQ1hzYUdld3Z5Z3ZZOHY3aW5ZaTA4WkNRQXN2eVF6eDk1VGFt?=
 =?utf-8?B?OUhUTytNclRHcTZqRG9mY01lM2RzVllrekpsMGR1cXYvakw3ODNxVG9JVUpW?=
 =?utf-8?Q?X8F8A4nL//ds1MFgemKxsqK2CRFo/ut5AYl58lu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbb522e-1e39-43ce-90d3-08d920613528
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 16:13:32.6737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYeh0DjrmkqGmO/4IOGrCgPMw1ItJvbjpgEkYjtFbwCuly8fwsfdUTzrWVbRowzn1K63kPpVOSkxVzzCnOeI5w63trir8eh3IQWqvtGkZcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1907
Received-SPF: pass client-ip=40.107.6.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

26.05.2021 17:58, Paolo Bonzini wrote:
> On 25/05/21 12:25, Vladimir Sementsov-Ogievskiy wrote:
>>>> Next, even if we take bitmaps lock in bdrv_dirty_bitmap_next_dirty_area() or around it, it doesn't bring thread-safety to block_copy_task_create():
>>>
>>> The simplest solution here seems to protect bdrv_dirty_bitmap_next_dirty_area and also bdrv_reset_dirty_bitmap with the tasks lock, so that once it is released the bitmap is updated accordingly and from my understanding no other task can get that region.
>>
>> Yes, we just need to protect larger areas by outer lock, to protect the logic, not only structures itself.
> 
> Locks protects data, not code; code must ensure invariants are respected at the end of critical sections.  Here we have both problems:

Hmm. Anyway, if code doesn't work with data that is potentially shared with other threads, it doesn't need any protection. So, I agree.. I just wanted to say that, if we have two data structures A and B, each protected by own lock, it doesn't mean that our code is thread-safe. In your terminology we can say that the whole data (which is a combination of A and B) is not protected by partial locks, we need another lock to protect the combination.

> 
> - it's protecting too little data (the bitmap is not protected).  This is a block/dirty-bitmap.c bug.
> 
> - it's not respecting the invariant that tasks always reflected a superset of what is set in the dirty bitmap.  This is solved by making the critical section larger.
> 



-- 
Best regards,
Vladimir

