Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EA12FE665
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:34:38 +0100 (CET)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WMP-0002xK-8p
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2WKt-0002RH-Bj; Thu, 21 Jan 2021 04:33:03 -0500
Received: from mail-eopbgr00090.outbound.protection.outlook.com
 ([40.107.0.90]:1413 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l2WKq-0005g2-8L; Thu, 21 Jan 2021 04:33:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/baPPgvL6FjR2ya5GR7zz0Pg5CL5HFJ20NNlKRRGisShso622BDo6oDeBTWhI4L4nAkb13OOpMryYbFDJD839UFsIOiwKxNlUhaEHrN1gwjDQi9oCMKsGV8IpNzl+2uusxcg7WKfxr/Hi8h57vyITZTvnovdtaKE1ChCy/izOvTAQW+FnsJAYqwm86ijP59jJBL0xRJL8ZUPuvh/L+qG88qsx+fD4mocm6OhWhRbOkUIP4jFxS94z9Nhz6ELiJNSeS9E+60pLxjOJkr+NMj1SLq24B192+RLLAA9QHUanOLC6bcBYfBtlLWud7Br3hFmbH83EqwjUMjGyXNyaSMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV+1mixZdYkuh/1l1AaJyTwR5NgvkTVe1wIpMf2QULk=;
 b=l3E2wN4MCd66yV/Qb/EVxB515GTygPkmC9vQw8n3HHe4h3lqIeYycDrQh9C0R9/TioduwM0ZgG8WeKNxKzBgMoxIUBkUBJxWWCNprXJ5e3GBCL8u4LeK3In82ShshK5UZ37EsaYhPIGsCwteGPyTJ2/gaNNx7ntDYdfj9jk9QyH/81er+tJ5tO4haCzz3r3lQCBhKnWSvpX34YzWS7ni3X9Ktbv0/lEL/YaIgm/9Mp8OkQ408zChnIcbyYKheyw9rkkbjimmy8ClLalurQnZcJkhG5xn9gENIMQpMASMnpMsUSMHn2ltCBE9ZWoIcr7bcw5RD6MkSLz8+bibx/XObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV+1mixZdYkuh/1l1AaJyTwR5NgvkTVe1wIpMf2QULk=;
 b=n6skcBU0Fd8iriPFpxpslY1oLxdH8eu9v55FxXVLwA+KvkSip+5kj+M1o3bn6yXd4ozka0rV+xQK3E5VugL9QgmwGe9UTe+si+8vONy3TogEXR+S3HoZMazvHQojkB/KhCQy5lgd9Wvb7fqCJK9mWjDFzjDfc+BEGkZQD/mllss=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Thu, 21 Jan
 2021 09:32:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 09:32:56 +0000
Subject: Re: [PATCH 04/11] job: add .cancel handler for the driver
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <20201118180433.11931-5-vsementsov@virtuozzo.com>
 <0db5f8be-46e8-775e-1eb1-4e74941ec916@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3d7a2143-19b0-8f43-f7e9-49e40f1b16d0@virtuozzo.com>
Date: Thu, 21 Jan 2021 12:32:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <0db5f8be-46e8-775e-1eb1-4e74941ec916@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.101]
X-ClientProxiedBy: AM4PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:205::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.101) by
 AM4PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:205::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 09:32:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ea551ec-c42a-4bd2-715f-08d8bdef88d6
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB35421247A0714AD429523451C1A10@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sdgP5i8NcvEXrwWb41KjwJtrlBqy6G4FJzqik3E+VvH6oq5zVBBQiFApdnBokH43lpZvXzU/n3IW5ZdICTSrdE+kgyx22SCpDRFc5sDOMVVXSuKzDxIZlbtme2k4gDd3VmnuVp1EGuMumkOAr92zpiULoFRYF7kfk2h6rUG4Tkhq13mvBNqEKy/EpoVS4rHA6/BbbHX/iMTcMBXck3URv2TqgQGfUAlXA0YrEzd4I+SPBzxvbDg4/+cCDlAdPSgU3bwBun921EDjl34TBnaMz+Y2MRLvFPFaFyD5W7X82jgGAY8LxiDCgvN+kb1WdXKTx2BgG2sFt+h6YBRWm1McPdOks5/sUZpQ/3NRyeuZvMq0NZW3i4zmBmuNdjihsmvtgukWe3ndOW+QjGVkUi+/Gv49R8unEJ9wbifmiqzef2Bd/SO6gz7YFT16zeS4IUBvq2I6/zqqsUtEeWQc2zlJii5C+cQD2+dHwB7exPND51+RTnviL0xik4SdUD2QhgvVJioD4n1+6AykMg5hMCx39z5mMtFyMx9vFQOj6qujOr2X4h4yhf6hYB9Iee2rhWloQyQBB3wG91YwaKs1xgQzKTkCu13Am05G+kolBmKp69w6sDtiQDbtxgqjTROXVV6DqcdJTPDm+Mnhy1zLiLosng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39830400003)(2906002)(66556008)(31696002)(16526019)(186003)(66476007)(4326008)(66946007)(8676002)(31686004)(107886003)(8936002)(26005)(316002)(478600001)(2616005)(53546011)(52116002)(36756003)(86362001)(6486002)(5660300002)(956004)(16576012)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aW5TT29iejRRM0pScC8yckF1RktwUEx5RnlWMFRwdzZ3RW96ZDFjWkl5V004?=
 =?utf-8?B?dlRPYStLUlhIYVpvZUF2Q2xwS0k5SXdSdmRuZFpWRlVSYy92L2lzZGVVNWla?=
 =?utf-8?B?a0t6eWd4YW84ckdqOFRvM0t6K0ptVDg0dUFON0ZuSEttVWlHWUFwQ2UxMHM5?=
 =?utf-8?B?UUFYRGl0ZFZRbjhvOVkxMVpodXcyempaS0cvS21LTm9ZRCtrS1NDd2FKUmVN?=
 =?utf-8?B?K0tEbXUwbmNVdnNML0VNNW5MT3FmTndMc0huK3IySEloZ1k0OFJGd05WeTJK?=
 =?utf-8?B?aVVvWkh0aW0xcDl6NXpsSm5ZS0EzNktMREhNck1SMVpOemlTckYyVVp5L2Zv?=
 =?utf-8?B?OXNoYWxYT0p3ODBRd2FqeVZDMVFmMXMvRXFoalltcVBSb2UzT3FKM3A5VUIv?=
 =?utf-8?B?c3ZTL2phby9HM0srNHd6cGVVczFJOFFzcWhsL3BUdWRSQy9STjZBQ3YreXE2?=
 =?utf-8?B?OFBxRzZSTkdxNlh2eHpsM3IrNlppZ05BaHhBZlNQSGV5Y1h2VysycTdqdUF5?=
 =?utf-8?B?dE9aRGhScXg1REhPOGpwdzFCZ2llZWx5QUd2VTRweGZxWERNQ1NVYXNPREs2?=
 =?utf-8?B?bHlLdzlaUkMvcWVDUHR4Y2J6VEJnNGJuSkVyTmp4bGVnTEU0K1dWWW9MMmdq?=
 =?utf-8?B?akxwN0VMUVg0eHV4UVFKbXMvbGx6ZFVIOWFEMXJGYW85L3ZZdEo1akw0TkVs?=
 =?utf-8?B?czRGa0UxSVpKRTFDakJIaWtsdjByckdBK1VqTUZXb3lzUnRvbDNaVld4M1Qv?=
 =?utf-8?B?OXpzbXF0NHVEcGhDcVFCMUI1Q000UVpSVk0rbWF3d0E1ZVo5V3NaZ1JNcGk1?=
 =?utf-8?B?VmFIN3U3YjJLOUk4UDNZZy9zUzdzMUFTTjFMZlRmV2RhbGlvOThsQXo0UjNv?=
 =?utf-8?B?MjRzWTkreE9KWGVsS0kvMm00RnNmRkhpcFUyOEprQ09KdHZyOFdWZU1SUHFa?=
 =?utf-8?B?b3p1N2cyajZMVGNkRUJiN0I2WEQ3bUx1K1FlYTdYNm5McEt5WWxQYTFqZEJk?=
 =?utf-8?B?cStFK1BWa3NjR2s3WmdBK09zaXhuQXVHZEt5cUtaYlpqYjBmNTFNYXMzZklP?=
 =?utf-8?B?NGNrVHA3ZUxZaDBDZnFpeTJLa1o3dkZGWTZGNW90N1Rxd3pvbzQ4dmVnWC9x?=
 =?utf-8?B?VCtSS3FxaGErUW9KUCsxZHdRbVJtMDlqNDJGdFVyN2JWUXlQamJSKzI4TEN2?=
 =?utf-8?B?ZmpFRzV6aEs1aWdvZmU3SmRNMk9XaCs5QkZyV1V0WTNHRTJlVGNHcURsakF6?=
 =?utf-8?B?UTR0NUYvRWwyNUltVjNnM1diOGovUVA4SytWc3JJUUpzcmpySGtUcHl6NHl0?=
 =?utf-8?Q?aE5sfucF041rT/VYXCJ/eCW+gLVkFi+wgR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea551ec-c42a-4bd2-715f-08d8bdef88d6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 09:32:56.5569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h08Rb1ki1yoIRjAn1qBhclSmZmxRUy+R0Xd0+K7ckTF4Fnec0laUmxBroaRNf8bBSXdootHQxIII9qT94EBd9YQneOxbMxke0M3+PmWgVrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.0.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.01.2021 02:17, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> To be used in mirror in the following commit to cancel in-flight io on
>> target to not waste the time.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/qemu/job.h | 5 +++++
>>   job.c              | 3 +++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/include/qemu/job.h b/include/qemu/job.h
>> index 32aabb1c60..efc6fa7544 100644
>> --- a/include/qemu/job.h
>> +++ b/include/qemu/job.h
>> @@ -251,6 +251,11 @@ struct JobDriver {
>>        */
>>       void (*clean)(Job *job);
>>   
>> +    /**
>> +     * If the callback is not NULL, it will be invoked in job_cancel_async
>> +     */
>> +    void (*cancel)(Job *job);
>> +
> 
> Does the call need to be re-entrant or even worry about being invoked
> more than once on the same BDS?  Or worded differently,
> 
>> +++ b/job.c
>> @@ -712,6 +712,9 @@ static int job_finalize_single(Job *job)
>>   
>>   static void job_cancel_async(Job *job, bool force)
>>   {
>> +    if (job->driver->cancel) {
>> +        job->driver->cancel(job);
>> +    }
>>       if (job->user_paused) {
> 
> can job_cancel_async be reached more than once on the same BDS?

what do you mean by same BDS? On same job?

I don't think that job_cancel_async should be called several times during one "cancel" operation. But if it is, it's still safe enough with only .cancel implementation in [05], which just calls bdrv_cancel_in_flight() (which of course should be safe to call several times).

> 
>>           /* Do not call job_enter here, the caller will handle it.  */
>>           if (job->driver->user_resume) {
>>
> 


-- 
Best regards,
Vladimir

