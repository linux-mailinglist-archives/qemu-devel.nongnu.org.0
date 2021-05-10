Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58F377F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 11:32:36 +0200 (CEST)
Received: from localhost ([::1]:50640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2HD-0000Nc-8L
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 05:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2Fq-0007JY-NI; Mon, 10 May 2021 05:31:11 -0400
Received: from mail-eopbgr70132.outbound.protection.outlook.com
 ([40.107.7.132]:14678 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lg2Fl-00076O-66; Mon, 10 May 2021 05:31:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1swYQll3Lhuu80Q9HQl+ilFR5XxaGyFQ9i2KmpK+xjl+GMcZaC+yDjcXjEjIVHr3685SAGO3xOVoBlSn63oALN8Zy8itSr9EnOlT8WdljWqB2zCQ8kRITEc+BYyNKyNub9FlffpbIeKNUEz5ThE5Jzsh4cpIqrKnqNh0fGpeJaQja7aJPz/tcViUDXrHW6dJ42RcnaF0usiTk6ASKrRRbUw1o+gG7KO9KfTv6z9GY1H65rG6imyGdOkKjHqfwVSZikeI25kx4tddWv2WL47xcvuFH7vzNrenjdxDJIYErbsvAMnDsdgeu+PmnCESbbmDLOk82QAqP/zv7jSDlrIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNoWHAcrO0s8tbUgubYfaoHGyeKGisDqwnWX11zXbzw=;
 b=lc0xs/8fwLc330bzchK+rS0K25OJynmfRcyKLi/9L8Hj7mYSsCZK7aEQce2NYS1Pmr8X3T0NkpjJB1/y8ooCVTxJt32JeCEg9Z04JK81EmzsYk6f6ZxF4cYt+ofrSIGrZefWH77HZc3yUr6yQKuGfqQeX3eM9QNvoCHErAkvN/HN5U38kjTsUT30XhdN60PwEd6sx1b71NMhSjxoInFLxOaMNsXnxCgu4wvgrSoKsYiAVLQ3Q8fMgEIHya1gZ4naEkYIqNy4DHCzvrIEZ8wycUL0yI78IynDz9xzRMrBoxQqu05pPRpXH6ppj2TOt7QsA+ALLyWSDLx+g85sIn5cjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNoWHAcrO0s8tbUgubYfaoHGyeKGisDqwnWX11zXbzw=;
 b=nEUlRyEGkp6h2tOjylsr/dFqli1NRzL7X5NjzRz862U5N3C6Jgkvxhmf05ojNoisjUZkb/diGG3aqE0UXNcPUIorKxf4Owbi5yxzD8DpQV7ZSVOqhmEpEwTUF3/Gl8se0LZWExBGjrtUH7G7YSbXVvxJxRGYXtT1w3WhY5qeBTk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3717.eurprd08.prod.outlook.com (2603:10a6:20b:8e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Mon, 10 May
 2021 09:31:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 09:31:00 +0000
Subject: Re: [PATCH v3 5/8] block/write-threshold: don't use aio context lock
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, eesposit@redhat.com
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
 <20210506090621.11848-6-vsementsov@virtuozzo.com>
 <700a25a7-c2aa-51fa-45c8-e97932c07c2e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dd163ea8-3702-4c50-4930-6cd1fd86cf32@virtuozzo.com>
Date: Mon, 10 May 2021 12:30:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <700a25a7-c2aa-51fa-45c8-e97932c07c2e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.203]
X-ClientProxiedBy: AM9P193CA0016.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.203) by
 AM9P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 10 May 2021 09:30:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4115158-ce53-4ba0-63a7-08d913965269
X-MS-TrafficTypeDiagnostic: AM6PR08MB3717:
X-Microsoft-Antispam-PRVS: <AM6PR08MB371765D6B99119B6F224149CC1549@AM6PR08MB3717.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r/CSuE1nW8AIh9k8BOduUJpwQc7jX0swu/D0ksKBCFldUpQ51Y7qK72SEKFOF6FMl7aJKls9IYM/588Yy8Ahv/ceS4QrYhAje0ajkYaGUF0inTMLV1okNiLuBkFHrvb2XzLLHfAJNFKsCCqwn/k2Hwrdc8XEK2F45jzvoe/HdbJwWRaiX9tSuXZGb0084ehZX3Ws2eyCPI5QEmDj+P9atS8rKThouUEIumxbd3gYxJOCJ2baQYntiz1I5sfuLXJgidMTlW5k/tfFwE0dLwhAJM8PCjS6vvEP2ytV+n01DU2L3Y4/v0oILEAD14Fg3qfXdw+K2JxN2LHEJJpWB72RbI0ltjptc3Wdf7SiBD2In5qd7YTUP7qnMm3tNk+2NM4oKSmSpvkPWHWEPzIIwWZvykNuHfKNZ75WK01YY7Rt6kWmdlzHinD2TSufm5umyEyS74zbj/wbf0yhAn+6NBtfXJQtlWgzQFwsWJoI14SZntUtI+FD6PCiLaJSkGnG2gZi09PR+wPLVIiSmOnx2AKvUg8FDxbekq+ymAKxfvyYnQYsHmFCfWSyWqL63dH36KLiXWYUDQPbFT3pgjUt7pfp6XEJEHfjCJtALGyMVoINHpgL5Aagku/HDagfebcEZNzQMFGS0doaz9XBgj2EDTeZhiyavuEkQtfPUJRT7I6hhFRib5A6H3nk1DYyjaclrs+bCOTvKEfJT+S15m61TMiDrIk3RO4KjEQcBOsUZ25KX2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39840400004)(136003)(396003)(16526019)(31686004)(52116002)(478600001)(5660300002)(53546011)(36756003)(186003)(26005)(83380400001)(6486002)(2906002)(316002)(16576012)(66946007)(8936002)(66476007)(31696002)(4326008)(8676002)(86362001)(66556008)(2616005)(956004)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHpQbm44Zm50ZnZWRHpWMGx1OGNSQkNuYS9aMHhPbHQyb2hxTEIyRWxJQXZL?=
 =?utf-8?B?UHVTRG9hMUE2WHIxelRleUs3MTdNakxsNUx5enQ0UVVvODByUDJLYmFmWVV1?=
 =?utf-8?B?VWhTWWs5eks1N2RwK1J3clJVc0NkaUhLekJ5YmRzNHdWN2hSdVJPUDBFRnFT?=
 =?utf-8?B?alZQSUZEbExja1J3N0wxaVB6ZGIrcUdkUU5pWXYxcE1GOEh5YUZqb2pmNENP?=
 =?utf-8?B?eDVPZGlqaXViNWZWQVdHUGQ1aXVma1lUeUZ5WTdXZm8xYkNHdFdFR2dBSzNs?=
 =?utf-8?B?cHN5TFBDNFN1UXR6eEUvMkxZTXRCMkJteXpOaE16dnNJYSszYnFFOHVkSWo0?=
 =?utf-8?B?SzBSR1Z0cGZIblpEcGpNTFBhbTlGT3Zwa3dlSWw4cEo3Rnc3dDZGSFRCNjF0?=
 =?utf-8?B?L05pYys3cVVjc0c5K0ZqOTZkK0lYd0crMkE2MmVsM3VBREdFVlAxelFvOEFl?=
 =?utf-8?B?SnZvcVRJVkcrTHg3WklLcVRSNTJWMmtuVkp2UmE1N2FuV3hCeXpkUjAvdzNq?=
 =?utf-8?B?TkxiUlExRWtIL3hUdUZvbitkS2VkRjNqcTJIMW1DQnBHSGFaWjI1a3F4Y1RB?=
 =?utf-8?B?U1NhdktLNWVKaXZRS25OWGl0VnVTU3VYeGFBZWhsaUZXRnJoR3hpRisrSjZw?=
 =?utf-8?B?eGR1cVU0YXR6alhGbEZiNmdPOWFESmF2Y0dFQVhrUEgrZ3gvSjkvSTkzdks0?=
 =?utf-8?B?NnhrNjU1WDlKMEZxcFd4S0FqSllZZ3pBYzg0czFSdXNtWEJxUEczeU11bzJx?=
 =?utf-8?B?WVR1SGlJamZvdS9yMmVrQzVVdGdpQ2MxUkMveDFrOTlSNm5IZkJibE9vcWFY?=
 =?utf-8?B?QTJ3bHRYNkRubzFBZkFqUWdVTzJqTk8vL1JIQWMwYkp4UVJPUXlWcFo5QWFQ?=
 =?utf-8?B?bVZTZndqK2s5aUY0U3RPbzNqZmlpdFIyOGcvRzJBMTl3aEtiU25qVWQ3ZkRm?=
 =?utf-8?B?Q2N5bFpVY2JtcE5IQ1A5MTcwTkkxS3FFbEpMWThtb1JPbGlMRFB5RGNia3Ay?=
 =?utf-8?B?RTdpSXMxcm1Ra3k3TU1ZeUR3eEZPWU9TdStHN2U5c2dOSDArL1hUYnhDVXo5?=
 =?utf-8?B?cDhGWHBNZEFCSytSUU9STmlnWmtiV085T2dKN2twQ3NxMDRUTEpxR293eFhx?=
 =?utf-8?B?UW5HRytNUWJVOS81dVNrY3JHUzNYQ3cwT3JjaThKTHZ2WFM2NHgxNUQxT1U5?=
 =?utf-8?B?VlZUTWhVeVBTNTl0SGFXZXJsd3pTVUp5blQwcDRTNHNDeVhsWVBOOVYwdlF0?=
 =?utf-8?B?LzJMZ21LZFBKZGhWbTZEbGhyZFNsdm1pN1R6cnJwZXdRemZoWlhmK1BWL2Nw?=
 =?utf-8?B?ZXZPNXBnZzB4ZnM1ZW9Ld2p6cWVwbkFZbWViN2d5WTBsSlpkVEdqemE3alQ5?=
 =?utf-8?B?YTlnM1NMU3NpVjJUTFN0cFhjZHlGQUpYREs0aUt5OTNpaldmQmhrOVErK204?=
 =?utf-8?B?OW1yK3llYkZBTXNmekNEY1pPRlkwTVZKZjRKQm1KOXE0cC8wVnJIZzBQdy9p?=
 =?utf-8?B?Y0VvVFJ2eitOck1Dc2FXNGdEZDRTeXJaT3MwN1E0bVVpeWJVU0RRcmNuc05L?=
 =?utf-8?B?ZlloNDVaTHU0citWWVFTcW8yMUdpNjBXaEJPMEZaSThrQU9IbXcrdllFaFRO?=
 =?utf-8?B?UGVBU1M0SkdkQnN4NXBMUlFwbWhmaTZGallJb1I2WXBmMm40YnZybkFOWmha?=
 =?utf-8?B?L1lGTWhPc3B0NW5JbENBRnJ4S0pMQkRLRmRxS3VCT2FYUzYxb2dXc0sxWWsy?=
 =?utf-8?Q?cQJJAUSft+2/hzFODejaFh1vu0yViNJSQjiWBcr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4115158-ce53-4ba0-63a7-08d913965269
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 09:30:59.9321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ipIgD47Rb0g3ho7gh2rARjIeXWJnNF0cePCE4UwbdMTLRPwPJt0Gmx1EItROS4q7ue/X8gSE++hzh9A0eo7nO6eiXEQgVqXzOeVcjQxGNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3717
Received-SPF: pass client-ip=40.107.7.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

07.05.2021 16:45, Paolo Bonzini wrote:
> On 06/05/21 11:06, Vladimir Sementsov-Ogievskiy wrote:
>>   void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
>>                                         int64_t bytes)
>>   {
>>       int64_t end = offset + bytes;
>> -    uint64_t wtr = bs->write_threshold_offset;
>> +    uint64_t wtr;
>> -    if (wtr > 0 && end > wtr) {
>> -        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
>> +retry:
>> +    wtr = bdrv_write_threshold_get(bs);
>> +    if (wtr == 0 || wtr >= end) {
>> +        return;
>> +    }
>> -        /* autodisable to avoid flooding the monitor */
>> -        bdrv_write_threshold_set(bs, 0);
>> +    /* autodisable to avoid flooding the monitor */
>> +    if (qatomic_cmpxchg(&bs->write_threshold_offset, wtr, 0) != wtr) {
>> +        /* bs->write_threshold_offset changed in parallel */
>> +        goto retry;
>>       }
>> +
>> +    /* We have cleared bs->write_threshold_offset, so let's send event */
>> +    qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
>>   }
>>
> 
> This has the problem that 64-bit atomics are not always possible on 32-bit builds.  We can use a spinlock (and probably just drop this patch for now).
> 
> Paolo
> 

OK, let's just drop it for now, the series originally not intended to make something thread-safe, but only to clear the way for.

(And honestly I doubt that write-threshold worth the complexity of this atomic cmpxchg retry loop, mutex would be simpler anyway)

-- 
Best regards,
Vladimir

