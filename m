Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E073A411A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 13:16:49 +0200 (CEST)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrf9c-0006UV-0c
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 07:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrf7n-0003s3-4z; Fri, 11 Jun 2021 07:14:55 -0400
Received: from mail-eopbgr150117.outbound.protection.outlook.com
 ([40.107.15.117]:44608 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrf7j-0007kX-TH; Fri, 11 Jun 2021 07:14:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mSMlxbv5ug1SdKIDS7oVCFxG+Y+CamRpMRWoH9UTgSV0nyjHIMcrwOrUC9oa0X51osV+xEFgyRkNrFfQr6XMtyBl9iMAYE0qhVD3chzWP2ALg1p6gRlrXsA4OHT4AyaLpijm/XEQxvgrqhz5NSK/J4LHaZhaIBXwCXJh52OredbVaLzSWshdk+/GaRLQHJTxiXsq62K07hWwnPn/zZThvdXsjNUgMGAPHkOaX+ZjmDdOE4v7BvB3ZIQqN1gcB3kksBZ9rRc+ez3zaJQpk8cGy+yX2qFIqIfG4CR6h2o0dExC1ey4IQqmw9p3o85Nh5cHiGoKx1M8fLKoXpuLWs4Emg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AParCTLJZRQuHx/U5KrYESgxOoEePPa1DgSFidmsBA=;
 b=CrUCh0hpZXzxFgXJ1zRceHrrVb89tktLzx0L/Qb7tMlItLITvy8xChVI3E8EY3QBujWLbNoZD8cMNo9AVE4kuQ1MpoCImZBIGbY8HhGZDcfV90u+803ffri99seA4mxei6HxoawkNL/X/+jbwBHt5Ulhcfx84i3Y98olWUzzB54LZBKVFNEzwCP7e/mfRJ//VdUt7uDCtNKBAGdO3V8/4ca6/Iu6951rIYSmyyChLuMVgoASX0l69mqTy3BuWw0CQhQn80b1TvyjZpCbbt/KV6gUMhZV+Nc6xopKvLARFLXyYukpj+LXiHWY1+sYVRAetBG2+Z0m3y80iNAzLuF1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AParCTLJZRQuHx/U5KrYESgxOoEePPa1DgSFidmsBA=;
 b=hWkijZJAB2sjlOnT7GpEGWDlNeHZAZ3z5gSUfLTIasdn8MW/IPmOsphk7E6Pm9Xga9lHAhAomaMZZam/Vc2wEtR1pwvHYRxwaRlkQU5L50ZsQc1zTGSQvzQa+7/cCCqk4/WSUX7SQPB8OC3aAl7zQXQsPwrq0o+fp/thR8/LbM8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4021.eurprd08.prod.outlook.com (2603:10a6:20b:aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 11:14:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4219.023; Fri, 11 Jun 2021
 11:14:47 +0000
Subject: Re: [PATCH] qemu-{img,nbd}: Don't report zeroed cluster as a hole
To: Nir Soffer <nirsof@gmail.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
References: <49ed9c03-eb24-4e8a-1b5f-8a291466a7b9@virtuozzo.com>
 <DC0BA400-DC91-4450-9408-915B2152EFD5@gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <29a4714d-d781-eebd-3613-872b2017063d@virtuozzo.com>
Date: Fri, 11 Jun 2021 14:14:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <DC0BA400-DC91-4450-9408-915B2152EFD5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P193CA0019.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 11:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30a756fe-9dfb-4481-ffcf-08d92cca1f3f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4021:
X-Microsoft-Antispam-PRVS: <AM6PR08MB40214A402935F3D04229F830C1349@AM6PR08MB4021.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tbmtmIni6ljjOUfQptW70kD4BDDOBHowIE5FQKIZeoR7xTk8P0ozoD9y9nIcPntzTgH33//uu9+vx7/N1PgdEaFgTy5a6nit64kUgo4Pdr8EA0/5i7HWSkgRLzqg05g/VWDJgtBgxFZxxz3W7Mi5eA9Ho5ahS6KQEsNZggHDLfv84Vzgj7S/9qWqqIa6L/HAtbe6sqYh5wnKViGr9jD4vK7XK8+I507iGm2nL9zVjc+ciplFjHSVmiMJ33rgf05ZOugZbGgi0ablV9U2vOhGQvZsTnpif8LikV3a525Bbp0w+v/huL33LGlZCezer0idEmy4P7XA5axr6L6uZO/3iVNtqDwZAQ5PUyHddx8a1xK9THhXfVU14qNiCVS4jLuAyHIE3Qt4OqzKYpMyXSfoUFocUuBNLem0m3BbwlyUiid424QNb0LZfjPWqT2RQyzIoe38WMMSel0H6saG9EzAvru+ISRcgMLJQ7h8PeIoLsUGEiEJ2T5EynFnjkBT20ojKl6dq4IpTp+V+Fr+QVTOIXidA9IE2xO/9xUtY9jGIIrBsmUewLjmX/divCrAaeki0xP1FHq1yyWdEh/IPQmWg23u8QWzpjiyMmnYlV1ddq915E/7o/SZRLuWJ9v45iX4w82RSdMM/3XeZWmbL1g61XiQ5MOq2vRPEo2HQ4yveTTaUgk5ry+7RSR9EC5Gwv1J2CJ24PupNpvTHjnL83gctE5dT2wpi9JaY7hVFWEviUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39840400004)(366004)(136003)(16576012)(66946007)(54906003)(36756003)(52116002)(8936002)(2906002)(5660300002)(66476007)(31696002)(38350700002)(478600001)(66556008)(26005)(16526019)(186003)(38100700002)(2616005)(8676002)(956004)(31686004)(86362001)(6486002)(83380400001)(4326008)(6916009)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVPVncxTWlJSnRDVTdzOVFlWEFHTS8xazROWTdWUnVmWkdXSXFDa0RkV2lp?=
 =?utf-8?B?TXZjMlNxblorM1BpWkFlQTQ0cXVLK0xzS2V0UWR1ZFcxdU1rd3VqTG0xUzdG?=
 =?utf-8?B?TDNiWWZXbmxLMjh1aDJ6dHZLbFhVWmpURnlTQ1RQQnJhTjRVQ3JsMzZiS1dP?=
 =?utf-8?B?N0ZwaXdUL3plUzN4Yk8xMk9xT0FmUWp3dktnY2pXV3pDMFBuK05zRUd0Qkt2?=
 =?utf-8?B?KzBIeVJ1SVdOKzZBUTFwaXJlL21rY1RXZXVPZXlIKzdTU3dUN284Q1ozVHpB?=
 =?utf-8?B?ZFhyREU3VE9mOTJuTHB4dVdULzEyYzROc0VWS1B2OHZLMjBnQjF5VTgrVUZD?=
 =?utf-8?B?Z1UxSjFrc0Flcko2dlUzYkhYQ3NVTzNqQjVTVjZjZnFnbnB0ZVcvZWtEbklr?=
 =?utf-8?B?Ui9uY0R6RGJRNGZHY1QybnFzZlZ4KzkyL21pU3prUE1mOHNIaFhhMWo2MjM1?=
 =?utf-8?B?bnlubThYS0kycWNzQ2tkamRDV0ltWExhenBWTzV2UHJwMkFZN1U4MlJoNm1E?=
 =?utf-8?B?VUY4YWZnNDNoVUExQXJNbnNRYzliYTBaczVSSDJobC9LZEZBWXp6S2F0WkRr?=
 =?utf-8?B?Tk1Od2ZUYzNYK2x4Um53b1NWbEdvK1E1ZzVVZG1SbDFJWU1nQ1ErVXNYSHB1?=
 =?utf-8?B?Y08xazlaenRCM2t6ZEt1d2tLWFl1ZUpPdGg1bSszSVlOaWdyeXo5Sml5Z1l6?=
 =?utf-8?B?WngzTlV2QnBtaFQ3bmp5TU51eDVNWGhlbnlncERESzE3ckNRSmVZUEJBcmdI?=
 =?utf-8?B?czhUYUFRL0ZTU2EwK2U3QU94VGlHc1gxVDNlNUJFU01GblVmN1owVExiT1lv?=
 =?utf-8?B?Q2xZMFNzb011Y0ZYcmRUVGdaLzN4VExtRC9mSlVmUlhycHNablhwYjYxMnJp?=
 =?utf-8?B?S1NRZzQ4dDlQTXFEa3R4cE5nZTdIZzFwanNpd2JQOEszWFVZbVVZSE8rMGhU?=
 =?utf-8?B?T3FtVUpVNVhlcmFtTzFvWUg3blVENnd6b21OQ2V3N1JkMEdzSUMvOW9sRytQ?=
 =?utf-8?B?TnN2MXNQZS9sKzRlN0pIV1REOW9MZkwyT1VRQks3bmhZNnZkQWxYdmZyNWlG?=
 =?utf-8?B?b1daN09hNnp6NFFiOG5RZmpTc1hTV21qRWd5aHBtKzFjUXNkNkR0L28rYS9v?=
 =?utf-8?B?M3ExeVh5b3BUclZITmcyOExZK29ucHl1bG8yQXo5R3M4enpJTHlZWUpIVGk1?=
 =?utf-8?B?ajVRaWxCNk5kN0MrTENwN0VWRk43a3FSaE1BYnRiNC9wVXcwZWRNcU1lTk5R?=
 =?utf-8?B?eVBZYU1oVnpkaDZ6aTI2YXhDS1ZHUUFuL0xFWFczTDJSRXU2VUtNRm9aWk1F?=
 =?utf-8?B?YWpvQmd6c3pZWUJKK0lnK3AvaU8wTFhmWW9VT05kZGdkOXYya3hSdzNHM21i?=
 =?utf-8?B?Mmx3Qk05NVFILzMyMld0YmtLV3MycnNwMmtIcVU0OU5kMnYvMFU4Z2RacDRE?=
 =?utf-8?B?ZFl1b3QySURLbTZDUW9tZUowTndRdzlyTEZXcFlraFdoUUt3U1RXUGhHNFp2?=
 =?utf-8?B?eHplY01PaWRncjJMeFZmTXNYRm1zSjRoTGtYYVZTZmxOMXVRbnFZTm1NL2o4?=
 =?utf-8?B?ckowVTVoaFU4emlTUkppNDNkSnVjYmlMTTZHWlB6SU9DM1E0RWpoY3JtQUZr?=
 =?utf-8?B?NUJwQnorZHk2dm5tYVo0b1kzVnFDMFpua0ZnTzhXRXhFUDJhYWE0UnpKMGRq?=
 =?utf-8?B?dHd2RkxHTllQK09FTTNVY3czVS9PNWlTaXArSktlblIwdExkYUltU0FSOWVP?=
 =?utf-8?Q?oFmaff5ZZ/JIOY8Gg4puEne+o9g0pX49DJN/+hf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a756fe-9dfb-4481-ffcf-08d92cca1f3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 11:14:46.9835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdsq8LDopZgprBnxLsQCLKmBaBmLmNwSFa0VY/UzNCKwIopHHPh3LKqccCUZhT3I62+Eme4UPBZFi6zIre0SqjYgQvWeyJ6OMLbBq1/j6cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4021
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

11.06.2021 12:05, Nir Soffer wrote:
> 
> 
>> ‫ב-11 ביוני 2021, בשעה 11:14, ‏‏Vladimir Sementsov-Ogievskiy ‏<vsementsov@virtuozzo.com> כתב/ה:‬
>>
>> ﻿11.06.2021 11:09, Kevin Wolf wrote:
>>> Am 10.06.2021 um 22:46 hat Eric Blake geschrieben:
>>>> On Thu, Jun 10, 2021 at 11:09:05PM +0300, Nir Soffer wrote:
>>>>>> But:
>>>>>>
>>>>>> $ qemu-img map --output=json -f qcow2 json:'{"driver":"qcow2","backing":null, \
>>>>>>   "file":{"driver":"file","filename":"top.qcow2"}}'
>>>>>> [{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>>>> { "start": 131072, "length": 131072, "depth": 0, "zero": true, "data": false}]
>>>>>>
>>>>>> also reports the entire file at "depth":0, which is misleading, since
>>>>>> we have just been arguing from the qemu:allocation-depth perspective
>>>>>> (and also from bdrv_block_status) that the qcow2 image is NOT 100%
>>>>>> allocated (in the sense where allocation == data comes locally).
>>>>>> Perhaps it might be better if we tweaked the above qemu-img map to
>>>>>> produce:
>>>>>>
>>>>>> [{ "start": 0, "length": 65536, "depth": -1, "zero": true, "data": false},
>>>>>> { "start": 65536, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
>>>>>> { "start": 131072, "length": 65536, "depth": 0, "zero": true, "data": false},
>>>>>> { "start": 196608, "length": 65536, "depth": -1, "zero": true, "data": false}]
>>>>>
>>>>> It will be more consistent with "offset" to drop "depth" from output
>>>>> if we don't have it:
>>>>>
>>>>>     [{ "start": 0, "length": 65536, "zero": true, "data": false},
>>>>>      { "start": 65536, "length": 65536, "depth": 0, "zero": false,
>>>>> "data": true, "offset": 327680},
>>>>>      { "start": 131072, "length": 65536, "depth": 0, "zero": true,
>>>>> "data": false},
>>>>>      { "start": 196608, "length": 65536, "zero": true, "data": false}]
>>>>
>>>> Yes, that might work as well.  But we didn't previously document
>>>> depth to be optional.  Removing something from output risks breaking
>>>> more downstream tools that expect it to be non-optional, compared to
>>>> providing a new value.
>>> A negative value isn't any less unexpected than a missing key. I don't
>>> think any existing tool would be able to handle it. Encoding different
>>> meanings in a single value isn't very QAPI-like either. Usually strings
>>> that are parsed are the problem, but negative integers really isn't that
>>> much different. I don't really like this solution.
>>> Leaving out the depth feels like a better suggestion to me.
>>> But anyway, this seems to only happen at the end of the backing chain.
>>> So if the backing chain consistents of n images, why not report 'depth':
>>> n + 1? So, in the above example, you would get 1. I think this has the
>>> best chances of tools actually working correctly with the new output,
>>> even though it's still not unlikely to break something.
>>
>> Did you consider just add a new field?
>>
>> So, "depth" keeps its meaning "which level provides data".
>>
>> And we add additional optional field like
>>
>> absolutely-completely-absent: bool
> 
> hole: bool?
> 

That messes-up with file-posix holes which are UNALLOCATED_ZERO..

I think, we should somehow start to honestly report backing chains and use "backing" concept in interfaces..

maybe
nobacking: bool

   May be true only together with data=false and zero=true, and means that all layers refer to backing for this region, but last layer just don't have backing image currently and therefore returns zeroes.


-- 
Best regards,
Vladimir

