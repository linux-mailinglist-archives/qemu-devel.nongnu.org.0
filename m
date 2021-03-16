Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0033DC86
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:25:45 +0100 (CET)
Received: from localhost ([::1]:58424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMENz-0007bN-Na
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMDoL-0004MX-TR; Tue, 16 Mar 2021 13:48:53 -0400
Received: from mail-eopbgr130100.outbound.protection.outlook.com
 ([40.107.13.100]:41422 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMDoH-0000wT-Pi; Tue, 16 Mar 2021 13:48:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7bApFRAYlQUl01gsNszO+jox7UgZLbWJ2W7xSP+4Hx1Ou3R6V/mwb+2ch71zYKeZ/4TmDmQ44+rgN4Jr4F2SlrxeY2+m79XwPP4HxFEpF/+aewglnOUn4UAS2vnnLj6UHxp9GwzRkjvMWbQsdW4x0KZnK2/NUHAu4CFadVl1GWPqP6NEym9ExMW/pNxC7Wlt4+s2YV7Zk+zoCbasm0cMzQ1TBzaK5FtpHKJkdF7f/abAA5WBzGYBBaiGUVCiewm/mp+fTKKtktr/RhI3pWfW3XqR6SUq/fgHrMC1L1gONtRcJZBcKfPFcaw+eGS4ASQDajO2oUam+ZsfgIqpqRPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELh6TJ2ZukALjEvmAyTQ9Vg47vBSYlEMKeS5WSdnjko=;
 b=GgKNIqzTL1vrBygd+pluk5sD+O47eCZ8RmtVI/TwxdqOUDBWqCNsginW9tnPsSTv588IQN99Tu8mWMEbJaH65r4sR4zDccom+mKHc7/k5ubgpZLwugsT0WfplPziXB5QElX2e44Bz6VbdGSJpuvH4CVYduISN48uBSEJEEmwtn93VlN3f2l8AaBPYiQZ9UJkUXVNbwaQZhPBe8HeOTHyH5VwnnOqp6a8LjIGkiznCyhbTK5KrBQqq84KQbVnR1uw2vJUzB4w4bW1SsBj88AdBfBfZtqfq+q504RHoutjCsRStQyLn7txmReyKpkkCjfO8icbhAacIGtSWCYwF7e13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELh6TJ2ZukALjEvmAyTQ9Vg47vBSYlEMKeS5WSdnjko=;
 b=hIJkO6MM4Rq02qpYqTOd+cV5tq4tCZi7ji6uIzfJ+/rnlGZmgayiFmByDQP/pRXV3n357W8gulxPPd+sLdUVGc+JFRJ/2QMUFGMVcKFpcMKoFNN2NDDjrB4L4dTrFJ5rDm03pG40nASDSvLvqIrG7B2NvhrJ3WhuRkRTLRGaLrY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR08MB3520.eurprd08.prod.outlook.com (2603:10a6:803:84::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 17:48:43 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 17:48:43 +0000
Subject: Re: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-7-vsementsov@virtuozzo.com>
 <e85d05f3-5500-9a55-0bd5-ceb581c27ef7@redhat.com>
 <d5acfe9d-2095-a601-20b7-bd0b677df68a@virtuozzo.com>
 <6056196d-a0cc-7de2-5d6f-b223fdee98ff@redhat.com>
 <7fb10a80-8001-966d-533e-3f74c739571a@virtuozzo.com>
 <cec9f2d3-af82-1de2-2ddf-be1b9dde73f9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c03cd2eb-f4ca-448b-91ed-16c6f0a7b283@virtuozzo.com>
Date: Tue, 16 Mar 2021 20:48:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <cec9f2d3-af82-1de2-2ddf-be1b9dde73f9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0036.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::49) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0036.eurprd02.prod.outlook.com (2603:10a6:208:3e::49) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Tue, 16 Mar 2021 17:48:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59bb98ea-64c5-48cf-e910-08d8e8a3bd97
X-MS-TrafficTypeDiagnostic: VI1PR08MB3520:
X-Microsoft-Antispam-PRVS: <VI1PR08MB35200AC761EED91FDA06118AC16B9@VI1PR08MB3520.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1zUSzn09zOKWqDipvLviD+hXrorbQjulzDDigbdVh8oKfire4sDUHvkPErXtqtqZbclwd+gg0GsSwgKZF3od/9g2QndWTfWTka4fr5CJn9EcKPDJ3zJzE5uMXC5Mwh7NwtqnKcmY4/t18o0aSIaRhexfuFfaEtiyluoNEuQetuvVFsw0y45S1zxwQ6wzW3CW7rAtcacpiCZ13Dlkh6Xy5aEf5yVHJmy7O/PIf9UnJDZLSCj3a8GTnPq9ET9ZzF72uJs3QiOVAQ20gDgD0CJhBuRCfjCxo9W7P9thY06DwgxmRSgiakVzDCalu6D0O2TNJwsFVq0BVx4M5gMLDN1c+Ly2jPdCk/IhEa0daIg2mEZ0u8Z7TRxe2Vd6DaMWCFm67XY3QNng1C0fUJFuLnD0fQfOn2VxPR70/FiHj5mNBmBs+df9E/qnM2KHAxpAaRxQx//ddCrLfjgtqBJ3dfjg46kgRQF2xJzWRPU652oBXKH1BerYdadoABvFA14Ky7iCddh6Z4xb00vzoLQZJyKDe3H5/4FzmTGh1GQiqQaFZF2tCOKdG1saqt0UgNTVabucqHxJTx0lOgdmMKOfKo5o46/MlPPH5a99LyZj3iQScnAkBfCKRBCK0AQD8ia4RX9nPWPFyXDRN2QlgBYhreGFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(136003)(396003)(956004)(8936002)(8676002)(2616005)(86362001)(31696002)(316002)(66556008)(16576012)(478600001)(2906002)(52116002)(16526019)(53546011)(31686004)(66946007)(66476007)(5660300002)(36756003)(83380400001)(6486002)(186003)(4326008)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QktCUmNiZU1iWm1LYy9IWktSRXg3TWM5dld4Q0F2Q3QzaERxdmlSbHRuZTRC?=
 =?utf-8?B?OWV3Wm9tanZOeHhhd0l6aERXL3lvWDVER0tXSHhrd2FqZkJQSnZRZE13WnNT?=
 =?utf-8?B?QjhLK3VMd3kyUWlUVk1nYjhxSS9KVjNoVkh2cXhlRlBqTmVVK0x4Ty9ENi95?=
 =?utf-8?B?ZHRheWhyUkU3Z29GNEp2cE9qNHp6Q1BmOUR0T3pXYnZWL3ZZc3hlTDFReTRv?=
 =?utf-8?B?SlZ3Y2FEbXRqejRteVJ1WGc1Wkd3UnliTHVvR2ZmeFNDdndLYlNJc1JDR01o?=
 =?utf-8?B?bm8zNG1qaDdZWXFvbGgxa3BEUHhYOUl5ek5Wa3loUTh0aFdkdGV2aVVTc2Na?=
 =?utf-8?B?blhVRG1laFJrUmtNYldiMlR0YldLUE16ZTdsZUpZR01XWFloN2V0a0xLdVFs?=
 =?utf-8?B?STJBOGxWRVJzalVoY2szRHR6czljMU4vMktQNkNZeDAwVnNJTi9MSk1Td0N5?=
 =?utf-8?B?c0liTGFWaGhYcGRLZjdGTkN4Y3pRdUdtcUtVN2swQUw5WDhycm9xdGo2ZzZj?=
 =?utf-8?B?dVNhMzMrbVdqTm15VmpneUswN2M1Y0IzY0xqR0JxVVJlcmV0Y2l2Z3IrenpH?=
 =?utf-8?B?amlnUExQR1J2RTcyVytGdUdrdmpmS2x4U1pMWGZ0WS9yZC9lV1IwZWFGS2lB?=
 =?utf-8?B?d2xWbzNCOHllU3ZNbHNFb0xTWTVEcXlmQlp5SlVYcG5mYkVSK2VCbVlwU0VT?=
 =?utf-8?B?MHZzOGtDMzR5emlBczNwZGt5TC83bTR0MnJuZ2U2TGNjMHQyTGd5VGFUOFJK?=
 =?utf-8?B?aUxPL1lpalRFNkJrTzZuRHJJcWhFZ3JySTcyZmx0bzBVQWFHbXp6aStTMk5T?=
 =?utf-8?B?SVVqZG1JZTNoL0QweFpJN2tRZzdRYTQzTlVieWdzVWpWQ2R0NUN3UFZpYThO?=
 =?utf-8?B?UGp2ZG5ERDJPZHk0SGpUUXp0N0trNDl5aU5veUZndnhSUEpFTVVmVmNMTnRs?=
 =?utf-8?B?d1VJSjJoYloxVDYyOElJY2V2Q1JyTFFJMWZxVE0xZ2p2VHlydStUaWRoMEJH?=
 =?utf-8?B?cVhzV2t5M2xRamZXeGs0Y3d1QTROQXJWU21uQWRHQVd4SkZpSFNkZ3ZSNDhH?=
 =?utf-8?B?V1VaNTNweDl5YXVWUHZQUHdneEVDNjBMWkkzdG9RUGhWUzNWQzltTUM2cGRj?=
 =?utf-8?B?TDM3NkZFWnFsMTRsS0N6U3FjN3F2cGk5Ky9TYk15S1JIbzM5WUs4cjVRTkJm?=
 =?utf-8?B?Vm9ueWRWOXE5aEpuOFluMEY4RG40VmhZaWFJdFBybXBJc1p1K1JXeEhvYUJD?=
 =?utf-8?B?T2ZHTjlCU255MDYzaXg1N3krSkE0N09iNzJ0YTh2am9DVkZBMVNlc3U1VXl4?=
 =?utf-8?B?Q050RzJPOWJxejRuMGU0SStTUkoxWDlRc2piaTZJcFB5UnladHNZQWNCRndr?=
 =?utf-8?B?N1p2WVFrSXNhRUdxYmdVTnJxay9ncjB6ODlpRUMzeGFSMDFIRFZPeG9CNlk2?=
 =?utf-8?B?RnR4cVJOM1FraEIxL2ZCY0NXSGxaYk9uY1kvUXR0Wmh5ekFaQjNTSys3MFQ4?=
 =?utf-8?B?dnVjckttMlIvZ1NXUlVzb0hTK0RWNy81TDJTbytiMndXRjUyV1BIUEd4d0c4?=
 =?utf-8?B?dWFnYUkvbThROS9va2ZDQzR1OVlTSXJmT3AzeHg3YnlaeFB0WnhIOVR5SFpE?=
 =?utf-8?B?MWFUQjYydzJ5QThscVBZbHdNQjFteVI0eUJMajc2WDJBM2F3b2JGNWxDN0o5?=
 =?utf-8?B?YStLSlU0VCsrd0RIcW01K3ZrVUo0WnhPYjJsdnB1Si9zMDdvL0FrNFMxRFNI?=
 =?utf-8?Q?EogwgIY6Je9DaPpSlwWFLitCziydWSpcfd2iVVJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bb98ea-64c5-48cf-e910-08d8e8a3bd97
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 17:48:43.3158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: biq6QFlEDtZvEHYTik41uXcYAxgeCOCaywMb7woJhBKnT+46pJwGUgiArGrMlhPDJn9bGudDpKNqJnfZQQ8tAuhlKxOg6QEjj2wAs/e/V/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3520
Received-SPF: pass client-ip=40.107.13.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

16.03.2021 15:25, Max Reitz wrote:
> On 15.03.21 15:40, Vladimir Sementsov-Ogievskiy wrote:
>> 15.03.2021 12:58, Max Reitz wrote:
> 
> [...]
> 
>>> The question is whether it really makes sense to even have a seqcache_read() path when in reality it’s probably never accessed.  I mean, besides the fact that it seems based purely on chance whether a read might fetch something from the cache even while we’re writing, in practice I don’t know any case where we’d write to and read from a compressed qcow2 image at the same time.  (I don’t know what you’re doing with the 'compress' filter, though.)
>>>
>>
>> Note, that for user that's not a parallel write and read to the same cluster:
>>
>> 1. user writes cluster A, request succeeded, data is in the cache
>>
>> 2. user writes some other clusters, cache filled, flush started
>>
>> 3. in parallel to [2] user reads cluster A. From the POV of user, cluster A is written already, and should be read successfully
> 
> Yes, but when would that happen?
> 
>> And seqcache_read() gives a simple non-blocking way to support read operation.
> 
> OK, that makes sense.  We’d need to flush the cache before we can read anything from the disk, so we should have a read-from-cache branch here.
> 
>> But rewriting compressed clusters is sensible only when we run real guest on compressed image.. Can it be helpful? Maybe for scenarios with low disk usage ratio..
> 
> I’m not sure, but the point is that rewrites are currently not supported.  The whole compression implementation is mainly tailored towards just writing a complete image (e.g. by qemu-img convert or the backup job), so that’s where my question is coming from: It’s difficult for me to see a currently working use case where you’d read from and write to a compressed image at the same time.
> 

External backup works like the following:

  - start backup sync=none from active disk to temporary disk
  - export temporary disk through nbd
  - external tool reads from nbd export

For this scheme it may make sense to use compression, and we get a use case where compressed reads and writes are used in the same time. Moreover this is possible just now, and no reason to not support it.


-- 
Best regards,
Vladimir

