Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05CA32D61A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 16:09:27 +0100 (CET)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpbS-0005ST-QA
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 10:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHpQB-0002gQ-BI; Thu, 04 Mar 2021 09:57:47 -0500
Received: from mail-eopbgr20122.outbound.protection.outlook.com
 ([40.107.2.122]:21310 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHpQ7-0003ON-Mx; Thu, 04 Mar 2021 09:57:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWX0xDKGsSc5myPQrrtNF/tu4A2vW79/262AQh9BU6ET6QXpStXtauBZEQ9Tnp017LwfygdhVDk5N1/opzv1eIPqoHbhmFVZfTTBr+cV1zb5f0d2AjsoQlgUKwLcloksP6TKF5OEbuu6IbjHFy3OIjnpuPZ7RUHvFEZn1ln2E2pAdjvu2AffKKuLYRENoJOQQXl72bHqWeW6OJoGH4XmURhVURqAoflSUSEoRroL/vIUqNML7iMr4adGPBrtwR++LMnvbTmsh07yka/Q/EMBF3kL7O06XLkqJh1URp8sJp95btb/0sfWOroFsHGCt1PeysPmnRdgEJ1otmnzmRgRSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzeSd1M29qOUX8CeFDhZH+7cPa/3ZwTUF0wk8pDlqyg=;
 b=MvT62/xGfQu+vlJJs9MOWv65cRIfG3a2yq/j1XVrTn9qjkt0KYpGlNaG7ZZq1PeeaWHuY2Yjgh8ZNoIiGv4mxVctpEdIGaFkEQhiuVfQv2lQTh48w13RxAGbx2uUKseMWEAykLpPOzCykBYWl9hm2Z1YfUQ2cXULYk44lOX+mG8QNcDKFbwm8CZVbyR5KLEReS1deZllp5oyt17cjxd+6bTfkS/JBo7s1EiCCyR7nrjE6NEQBP8X4xZIL7S5NowVU0O3tooLrmb6UJkakz6Bqb1kXLCaBEF31jSMcv2wfYqNCXCdjdcqOHR+FZBKESIVqs/YhCrimBoT/Aw/W+GomA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzeSd1M29qOUX8CeFDhZH+7cPa/3ZwTUF0wk8pDlqyg=;
 b=n5CG+RNJdWnNyN8S+w41y+6oXYmsg6PcbROzD7i82uElFvUI0F/+KsC3/36jk6q0L5F8MV5PcN6LXG9oBuUpXaJZjR1/ncHhpSkXkmMev4U31joEClvLJ+RfEBpa5R3utLTjVCFGHJSJvTG5kMgcu5BijQarwa7rk4Q3UbdnRbs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB3158.eurprd08.prod.outlook.com (2603:10a6:209:44::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 14:57:39 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Thu, 4 Mar 2021
 14:57:39 +0000
Subject: Re: [PATCH v2 3/6] block/parallels: BDRVParallelsState: add
 cluster_size field
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210224104707.88430-4-vsementsov@virtuozzo.com>
 <20210304142450.GD9607@merkur.fritz.box>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <1891d7fb-a7fa-73fa-e6df-e3f281fa759c@openvz.org>
Date: Thu, 4 Mar 2021 17:57:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210304142450.GD9607@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: AM4PR0302CA0010.eurprd03.prod.outlook.com
 (2603:10a6:205:2::23) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.63] (31.148.204.195) by
 AM4PR0302CA0010.eurprd03.prod.outlook.com (2603:10a6:205:2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 4 Mar 2021 14:57:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082b6855-e8fe-4727-a0d8-08d8df1ddac9
X-MS-TrafficTypeDiagnostic: AM6PR08MB3158:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB31581E95A7CE125959DBA831B6979@AM6PR08MB3158.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/wRL+I73UcAwmmN6FWHRTZL5Ey9XSSzQpwZ9oP5KkkkUhN04eS6OuVxKBPs7oOSMMk4rg+aGhXeh8f2sPr5mJk3ELZDQVtpmXvnwltsDfeDHu7ChcCtSlCWOEYZQhDa9h6rqsr6wObDjRK0/6nfqQIedN3F3Wl5OIuwLHUOFOx4PiVLyINeCTPgOco0WRtebAJGbpRZwDtfWGSusVR3sPDqnGupaPZ+ogOn2oYFo2rKx7K4fRx90N/+Pn67cuGHCkOGmazyxh8d64MMvRqn1vNupMvK7JENVCsIUaMQUj+QWHPnr7ywms+9COkuWr2YcD+fDkRGD6DZRdVcUzP4NoTFu8gqWwfHtv+NHKzMxasp34+Ljqdci0v9iF/p4iZJpkR1bd3XO2e+w+e9/DOUaJHIL+I6yWwuNZoWybQs9HL+dr8oflPBhjSNPzu0SDUXPZP+cbISwIrxU20pmmas1nxT1x7dAbRbUYyDCuRLhO9yibEYZ3/xpq1usRQvaZDxt9Hcgrtxa0sOfgFXq0Foe1oA7OJGoCtDbMJa7FkBpe7dqu17ddoPjNyPB2ft4wleHzC968Qb+T7G9fCYSk/vUcsZ6HMLJFd9h4yQxgG+O+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(346002)(366004)(136003)(2616005)(956004)(186003)(8936002)(16526019)(8676002)(478600001)(36756003)(26005)(42882007)(83170400001)(6486002)(5660300002)(2906002)(83380400001)(31696002)(31686004)(52116002)(66476007)(66946007)(66556008)(53546011)(4326008)(316002)(16576012)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2JHNGxpeU9UY0NpYytacndXUjFkRldRRnVxVEt0ZmRuWURsMStxZWl0RERm?=
 =?utf-8?B?b3daSjVWejBlUlpoaEZabjFUdlkxN1BDZGNSbjJwM1E5a2RMcmVyYTA5Wk1l?=
 =?utf-8?B?N1BsdjZzN3o5dHJjUGlPckc4QitVWkc1bk42Z2ZuWitxSWZKZ1BxNWRRcEFK?=
 =?utf-8?B?WlBReGY4Q0xVUkdvZHZ6T3BQK1YwTm9DdW9IdmlZTTErbjRabjA4Sk1Galdj?=
 =?utf-8?B?SUlSQytlcHNuMUVpMEVRNWdGYTVzb2VOUmRlMzVsR1JWSnkwZjNZdGpMT2ti?=
 =?utf-8?B?ZDdKRlBFUkU2aFk1TlZxcE9hV3J1dmxlUUUxMEZjSHM3MkdtTGpmdDZnaW5O?=
 =?utf-8?B?ZEorMUxGSTk0WG9xNDNqdkJmWW5TRFZKTmoyczRPaE1wcFkxaVlCcWhwV2FZ?=
 =?utf-8?B?STM5S0ZBenBHcFU3WHV3dEJVdC9OZDQ3Z0d6OEdXL3pmcE0wMlc2aVBvcUlM?=
 =?utf-8?B?WHhDWnJkWm5XV2YrWkxVWUhrVmZzTXhRTEh3MGZDREpaQnBuN2wxaERud1ZO?=
 =?utf-8?B?Ym1RTjUvQURnZGxpQWR2OFBNWTgvMzZ2UUZiSWpmS1JDWDlMYkp5eUJ2eW9o?=
 =?utf-8?B?SUplNW5RUE5JaTM2MVVCbStIQkh3UExmT2Z1WTdJMW1BUXNrT3YrOUZTWGFa?=
 =?utf-8?B?Vm95YmcyNmd1RmFrQWpSRm4xTlRQVFpkemdVWlFTWHdDc29DWWlpc1IzOHlr?=
 =?utf-8?B?WkFndVVmNEtQMlpUVTdjZlNmZzd1OGx0NDlySkFsY0FVSG1hSEhkVkhkS1g1?=
 =?utf-8?B?UjlPQ3VIZ204SXB1MFF4WnZxUVlKKzJhQ1ZLWUJESElXSmtlU2hnc1BTaUI1?=
 =?utf-8?B?Q3NGYUR5L1hNeWduVFN4bmlRaWpibU1pRmpJV0FBVjBJTW1CQUs1UUNDbjBJ?=
 =?utf-8?B?dHJyV2xEZGY2YW8xNEJLNGFpQ1dkMXpHeC9jL0FlZ2NPTkVqZ1ZNVHA5WW5E?=
 =?utf-8?B?WlRPdzZPMTM0dERuYnVOOW1HeWFPRVRPOHNrc3RNT2FCRWkxQlN5TEVPMmRG?=
 =?utf-8?B?ZFN6MGhMK2Y5Q3E3RE8wcnFTNkpGemRJZ0h3aGozMUdHNzRKY1gxZHB4K1d1?=
 =?utf-8?B?aDM0Umg3Wm90SDNtWTN5aXRQWE9qSUpNVDdNM0RReGhraHRuZHFnTXhNdFB2?=
 =?utf-8?B?ejJibE90b2loOHhucnRjbU5qWWdEREtsLy9OeVg0alVDb2RPemk1c0FVckZl?=
 =?utf-8?B?bW5iTzRhdWtZRW9CNFVKYjVkVjBtM2MvU2tiNkVOSjA5UWtzQzNOSGVQd0F3?=
 =?utf-8?B?M2QzMEFvYkRGeWc2R1U3TVpoMXVOTTN4WFdzSjFiRHd3STBtNXgyaVlpT0t1?=
 =?utf-8?B?SUNpck9rd3k0NWk0VEhXMWRoc2crZkRLSHUrUXZXL1VZUTFYMzUzK3pZZXlq?=
 =?utf-8?B?Z0pYT0FnbHhnYkVBVk9qdzNXRGIwSWNLbmJLMmdzRFZmcGU5QzRLMFhhY09r?=
 =?utf-8?B?QTlWaEZXSTk5NjBhVHRvajhoZlFTSXpodit4dGg2UWxwMEExZ0VENkN3aCs3?=
 =?utf-8?B?azRneE8yN1pRYkVIb1dlU2JMWlRqTHdJeUtLTmtzZVh5VHpwd0VjOXg5RzlR?=
 =?utf-8?B?QTJ6c25GcFBnTUVNTmFrQkhhdGpyM3dSLzBTY3hKZnc2QllsL3hGVDR3YWZu?=
 =?utf-8?B?ZDZXSWIwVG5FRVlMcUtwQ0txdDZ0ZS8rSlVUcklFL3EzT2hNbW9LNnkxZDVm?=
 =?utf-8?B?cnJhbGNNSlJHYnVCYXVHR0hNZHVBcjdiNWRmMnc3NDd3NVgzMTF0UllLRk9h?=
 =?utf-8?Q?giuUjeHlkK4mewMO7CpwqJekSpAYZnV9lplOBaF?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 082b6855-e8fe-4727-a0d8-08d8df1ddac9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 14:57:39.3736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPsyN5qWeOBUxPi6KxhDJeEWGG7S0D6/3WF/Jpb4hXMWZ18JCR2cmEsBnVT6lvZqVN5VETGLrPlhkXC5DV9nFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3158
Received-SPF: pass client-ip=40.107.2.122; envelope-from=den@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-block@nongnu.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 5:24 PM, Kevin Wolf wrote:
> Am 24.02.2021 um 11:47 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We are going to use it in more places, calculating
>> "s->tracks << BDRV_SECTOR_BITS" doesn't look good.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> @@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
>>          ret = -EFBIG;
>>          goto fail;
>>      }
>> +    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
>>  
>>      s->bat_size = le32_to_cpu(ph.bat_entries);
>>      if (s->bat_size > INT_MAX / sizeof(uint32_t)) {
> Checking the context, I saw this a few lines above:
>
>     if (s->tracks > INT32_MAX/513) {
>
> Is the 513 intentional?
>
> Kevin
>
I can not remember why I have written this at that time,
but original comment for the commit was

commit d25d59802021a747812472780d80a0e792078f40
Author: Denis V. Lunev <den@openvz.org>
Date:   Mon Jul 28 20:23:55 2014 +0400

    parallels: 2TB+ parallels images support
   
    Parallels has released in the recent updates of Parallels Server 5/6
    new addition to his image format. Images with signature WithouFreSpacExt
    have offsets in the catalog coded not as offsets in sectors (multiple
    of 512 bytes) but offsets coded in blocks (i.e. header->tracks * 512)
   
    In this case all 64 bits of header->nb_sectors are used for image size.
   
    This patch implements support of this for qemu-img and also adds
specific
    check for an incorrect image. Images with block size greater than
    INT_MAX/513 are not supported. The biggest available Parallels image
    cluster size in the field is 1 Mb. Thus this limit will not hurt
    anyone.
   
    Signed-off-by: Denis V. Lunev <den@openvz.org>
    CC: Jeff Cody <jcody@redhat.com>
    CC: Kevin Wolf <kwolf@redhat.com>
    CC: Stefan Hajnoczi <stefanha@redhat.com>
    Reviewed-by: Jeff Cody <jcody@redhat.com>
    Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Thus I believe that this is intentional.

Den

