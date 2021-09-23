Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D04167BC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 23:52:47 +0200 (CEST)
Received: from localhost ([::1]:37806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTWe6-0004Z9-Cg
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 17:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTWcI-0002pp-GB; Thu, 23 Sep 2021 17:50:54 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:52672 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTWcE-0003gE-4I; Thu, 23 Sep 2021 17:50:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpQLuHnyXCfT7M9dHxrUg8PdON5XfxZmsHegjxoXrvTg6HYXsp7csYl9bVzOHc9QT124Dd+rwdlDN3g/yW1F1fy2ExEGXNBhNJom7DcAmfGR99KBTCzAV9beHu1X1Wvof6v/c9zzWQScqeYRH82EBD0v8fZo/KgLNii5sFrvzhzavxY/yHy1NM3/zKHlxegeltwIyWY3TATVG+uqFw5soHTw0AdWhwIfKTitrU01WXGs+fUGPeZfkh0BVo+YUhygkOW2sLd8X0hiHOuIebZyLBTeD9Xj620/aEojTp3UlmEk+hCaKqorztIIOs0GH9ENxUs2w1xcJMqt35Og9Pu2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=TRQGOYhA0iGev2XaMhZ0hce//V8te6CkSi+8LCKHaqE=;
 b=QK+Zk7dHsm2Jny7uTs6kubyERcgIB7XiHwspKJTrnCjsDa3FH2YFmuTZXSExCAVqN7ox/mvqb0nLl1iH/Vlk/wCk6+/OVjrki2a8asSXZ1AUF3RtgXB0j0EKdUowq5xrQ+E6f05wefUwNcW5KMCsDuIvn6snyr4UbLM6WGhV09lW9NTMJtZVJTMfaTyYCyyjOiGmsWPGGnQMFZuB3SnrAhfjYyosn9vypUFyX0+4th7TvPEPUA4whezMA4LL72hFzL4IWJ4tU3gf9QpP2zSHo+zwJR+6awXFoZZPAPj5BXdZhS2/xpVSN+OjXEFchIFbyRAU1osjDazqjor9kXuQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRQGOYhA0iGev2XaMhZ0hce//V8te6CkSi+8LCKHaqE=;
 b=vB/k0Cag/zEf2mlUn5ugrrR/eQKAlugxam1HIJBNpKYfnC+88B3Hv/esG4P3LD0TqHSZn1NAyYfypB0Osg+dGojVvg3xAa8iZcEK5bSKVE4l4HSI8NUj/w+/CI0oX5krzi6zOKvrzlMIovT8zhFnvyVfYaaykCHtY1JJf+e+EbA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1906.eurprd08.prod.outlook.com (2603:10a6:203:48::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Thu, 23 Sep
 2021 21:50:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 21:50:44 +0000
Subject: Re: [PATCH v6 07/11] block: use int64_t instead of int in driver
 write_zeroes handlers
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, integration@gluster.org,
 kraxel@redhat.com, idryomov@gmail.com, berto@igalia.com, philmd@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 jsnow@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 pavel.dovgaluk@ispras.ru, ari@tuxera.com, hreitz@redhat.com, kwolf@redhat.com
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
 <20210903102807.27127-8-vsementsov@virtuozzo.com>
 <20210923203345.efajcgbm3qd2sam5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <07e2d433-766a-4a46-44f2-a8e19729c04d@virtuozzo.com>
Date: Fri, 24 Sep 2021 00:50:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210923203345.efajcgbm3qd2sam5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P192CA0017.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:102:56::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 PR3P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:56::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 21:50:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0af0370a-f6c0-49f4-7317-08d97edc31d9
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1906:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19067439AA0007FE4B21B131C1A39@AM5PR0801MB1906.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kamp7Oq8LEWv3qZLj2gLXwyvKrpO69pBteT8mjLqkR/e6xLMZ6YzIZCVWZqg+eWPE2CM9ajrKtDB9YMBu4dKH8yCcBjjJHO5Nh/ebqCgbPuN6BNPe0qMo95NsmKCRgUmB7dLZYCeL0PG0rwlOZ5g7n218PHzdIikhp9iH952o68uEdye523N0rh054/Ps+Mu1FkZmUKu/zcye/UKrdHyscuYLpRr475QgIAB5Xr12vkN1GBxHuhwiKyQ/21uX0N2sW1ohia/nkl11v8M7TCf8thRdNIE5pP4hg7yk8QIoF3BuWiOUQygOBJ9wnyHwFCGV88Hei9f7Q2SyDlMaVJdcaBOk4XRAWwf39wtczvAFOGXJduuUXbFy06v/mc1A1UTuRnmstKUdkcOIiYuRkgl8BUpU2e2FxGtCE9pX8TqfAEjcBeLBoid+jIH0rLXFyU+En8yRUGc3awyWFxyidqCyp1Q2L5dDJntLAzJG2xUBy3O+EFrXUYfNVUZPAePdnZTMJsgR4AxdiZSVoOotz+7dWvjqJ4ZHZdeGWu+6QRYnQ8xuWgIEbRQVOJ6/qcDMwPGtSwsRItvuI8pWeDWtV6X0oVoRVZ5wKW6ZxrD4S9iwZTip9IrvNAIzoskcq2RJ+uLcDK/nsNfiUWTwNBiy/zsptD8bh4kcfnO9kFxSI4Hyx606bI+DfskwBKvplzT+gQfMcTt1a7+otPqOcwagtuc1OiJWUp2egfdTQPH6D06IAF86zjKaBWWCQyVVUvz1T3X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(83380400001)(66556008)(36756003)(86362001)(8676002)(4326008)(2616005)(31696002)(956004)(16576012)(7416002)(6916009)(38350700002)(66476007)(31686004)(38100700002)(52116002)(508600001)(8936002)(66946007)(2906002)(6486002)(316002)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FQVFdteWxRajdIdGpGNWc4MFdrTHRzK3A3eFpiMGVXdC9NUUg5K0o2RlN4?=
 =?utf-8?B?YWMyZWhyYzlnQTJBNmhFOGFWcERIR3E2R0pzOFNEZDR5bUlJM2tTMzBWM2RV?=
 =?utf-8?B?MVdhZ3ozVXF2RWp3L1NJazFJcitCaTdKODJJQnpEclBQZDhodDNUK0JlTXZR?=
 =?utf-8?B?RWZ2NHlYNmMwUE1QU200d2IvRXU4WFVkQ0pkWkdtTXZVenNONU9CZ1htYXMy?=
 =?utf-8?B?ZXhML1liVnFsdk4vaDgxY21qRDJ3WkZlejNxaGpoc1U1OGdWL2ozN3ZzTEdZ?=
 =?utf-8?B?TVA3UTByejFSMFVOVTJ1QU9YbHZYSnRtb1hyMWJzdHUrRlZrNkdBTkhoNE45?=
 =?utf-8?B?SnJ2dnBaRENacmgzdis2bXduRllOMVBsYVZTamZHY1YyZ080M0FTcWg5RE96?=
 =?utf-8?B?djlwTDlOQ3orcVg1clMrcUVsbzBsNXF2d2srOHdTNTgvSUpsQnh6cU5xN2pW?=
 =?utf-8?B?SEROczNISXMyZkRDcVBJSFVuVFZuMFdPTDZ6aTlqV0RwYjNtWDZobGkwVXdq?=
 =?utf-8?B?Z3RhOURLSmJHTzNoZlZrTTlnNlMrVGFnOThFQUxHaG8rSFIvNXRoNWU2ZjV0?=
 =?utf-8?B?TVAwdzViOGV3cndkVndtNmg0QWsyZ0gwbXBaQW9ra05aQVVnbjNGTTRTaEFB?=
 =?utf-8?B?SzFOWTJhdStHUGN3ajYvb1dSY05GUXUxL0wza3hoVWhIUDdtVGx4eTRPUWQ2?=
 =?utf-8?B?Y1dCaXZ0TWM3eHltMFhxWVh4WFJiekltME1NbHBHWU5mUm9CaStCTGE0QWxo?=
 =?utf-8?B?RjZTWHV1MVY4ZGE5YmVzVzdZblpZNzd1emhOS0x2VlZjZnJTc3R0YXhNM25s?=
 =?utf-8?B?d0N4eis0czM2eVhUY1JBaHJ0TW1oNzh6RVd1YzBTdCtDZWhpbFNHbTNIbGlW?=
 =?utf-8?B?b204eFFCNzdjRWVWZ3NvZHRlZDFaU0FzMkV3MmdyeUQyWmQ3VU5ZNndZRjZs?=
 =?utf-8?B?UUdxL05QaGpxanNwTVd0YmxqYjhDcGo4ai93SFBWYTdrS3EzTUlkNDRtWFA2?=
 =?utf-8?B?QWtjNmVqN1ZQOG9WU2QvQ2JyZjRZSTNLQ1ErQnpIVUsxdnpHQUVIZmNMK2Y0?=
 =?utf-8?B?eVQrY254MVAwY1FCd291UkszOXYveUIyaEZrS1psbmEwU3lvS0U2NlNsNmxY?=
 =?utf-8?B?NWUwNk5oY0o5TzZxcHNrNTlxcEZWaXY3emh5TjluSTljenV3SVY0dG5kVng0?=
 =?utf-8?B?dVRkYjdQV0JVUlEzR2p6M3lRQTFYSVJ1dHl0V3Q5cGtGRnlFR2ZVRVlTUjJt?=
 =?utf-8?B?RWFqWXFSTTJJekpaWURVVkN3ZEl4RFNoTk5LZjBDUjlncVFpVkdObGVCQVZi?=
 =?utf-8?B?amZ3V3N1OVFYbkhRNkhrQjQyUnBMbmE0RWx3d2lGZmp4cmdJbmpnOG1jM0Vp?=
 =?utf-8?B?bmU1MU94K0l2RTdnWkg3dWUxMldTTHNyM0x4OFFsckFrenNSZ2N1bXAzUGdR?=
 =?utf-8?B?MXpBQWhyVkZNQXY1cWZwdjVRMDZhMGJrd2Yyem1OMmd1aGxkMiswMldMbng5?=
 =?utf-8?B?Q2p3SFRUSjY4ekVmbzh4bWxqWkRVUFV0Y2hONmg1bTg5d0dlK1EzMUJCOURl?=
 =?utf-8?B?aHNOV1ZkZzR6Ym1HWHl0QVU0NVRrNENvN2xXVUVxdmVtaEx3WjdIenRaTEtu?=
 =?utf-8?B?Y1BiTlRGY3ZUSUUycDZnZWFobmtLNXFsR3QvZzNNb0t2NHpVYW9MN0ZVYzhL?=
 =?utf-8?B?Sm5lV1lpMDlZOGg0TjhEbTJVKytYYUlXRXZtbUNsUEJJR1RYK2RnV3B6dHhU?=
 =?utf-8?Q?IpY7BXwD2B4Oc+9pESoHgmsTBbhetT+B1o7LqjT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af0370a-f6c0-49f4-7317-08d97edc31d9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 21:50:44.6503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeeSatBF+i7Yt80fViWFSmPSMHMhFREyKljvek5e0qbhNUYb/KrSeefFSPsmVw6TrSTZxBuaAihzW38M3le+NiXuy71dr7aOhyn5Ayxud8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1906
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

23.09.2021 23:33, Eric Blake wrote:
> On Fri, Sep 03, 2021 at 01:28:03PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> We are generally moving to int64_t for both offset and bytes parameters
>> on all io paths.
>>
>> Main motivation is realization of 64-bit write_zeroes operation for
>> fast zeroing large disk chunks, up to the whole disk.
>>
>> We chose signed type, to be consistent with off_t (which is signed) and
>> with possibility for signed return type (where negative value means
>> error).
>>
>> So, convert driver write_zeroes handlers bytes parameter to int64_t.
>>
>> The only caller of all updated function is bdrv_co_do_pwrite_zeroes().
>>
>> bdrv_co_do_pwrite_zeroes() itself is of course OK with widening of
>> callee parameter type. Also, bdrv_co_do_pwrite_zeroes()'s
>> max_write_zeroes is limited to INT_MAX. So, updated functions all are
>> safe, they will not get "bytes" larger than before.
>>
>> Still, let's look through all updated functions, and add assertions to
>> the ones which are actually unprepared to values larger than INT_MAX.
>> For these drivers also set explicit max_pwrite_zeroes limit.
>>
> [snip]
>>
>> At this point all block drivers are prepared to support 64bit
>> write-zero requests, or have explicitly set max_pwrite_zeroes.
> 
> The long commit message is essential, but the analysis looks sane.
> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
> 
>> +++ b/block/iscsi.c
> 
>> @@ -1250,11 +1250,21 @@ coroutine_fn iscsi_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>>       iscsi_co_init_iscsitask(iscsilun, &iTask);
>>   retry:
>>       if (use_16_for_ws) {
>> +        /*
>> +         * iscsi_writesame16_task num_blocks argument is uint32_t. We rely here
>> +         * on our max_pwrite_zeroes limit.
>> +         */
>> +        assert(nb_blocks < UINT32_MAX);
>>           iTask.task = iscsi_writesame16_task(iscsilun->iscsi, iscsilun->lun, lba,
>>                                               iscsilun->zeroblock, iscsilun->block_size,
>>                                               nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
>>                                               0, 0, iscsi_co_generic_cb, &iTask);
> 
> Should this be <= instead of < ?
> 
>>       } else {
>> +        /*
>> +         * iscsi_writesame10_task num_blocks argument is uint16_t. We rely here
>> +         * on our max_pwrite_zeroes limit.
>> +         */
>> +        assert(nb_blocks < UINT16_MAX);
>>           iTask.task = iscsi_writesame10_task(iscsilun->iscsi, iscsilun->lun, lba,
>>                                               iscsilun->zeroblock, iscsilun->block_size,
>>                                               nb_blocks, 0, !!(flags & BDRV_REQ_MAY_UNMAP),
> 
> here too.  The 16-bit limit is where we're most likely to run into
> someone actually trying to zeroize that much at once.
> 
>> +++ b/block/nbd.c
>> @@ -1407,15 +1407,17 @@ static int nbd_client_co_pwritev(BlockDriverState *bs, int64_t offset,
>>   }
>>   
>>   static int nbd_client_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
>> -                                       int bytes, BdrvRequestFlags flags)
>> +                                       int64_t bytes, BdrvRequestFlags flags)
>>   {
>>       BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
>>       NBDRequest request = {
>>           .type = NBD_CMD_WRITE_ZEROES,
>>           .from = offset,
>> -        .len = bytes,
>> +        .len = bytes,  /* .len is uint32_t actually */
>>       };
>>   
>> +    assert(bytes < UINT32_MAX); /* relay on max_pwrite_zeroes */
> 
> And again.  Here, you happen to get by with < because we clamped
> bl.max_pwrite_zeroes at BDRV_REQUEST_MAX_BYTES, which is INT_MAX
> rounded down.  But I had to check; whereas using <= would be less
> worrisome, even if we never get a request that large.
> 
> If you agree with my analysis, I can make that change while preparing
> my pull request.

I agree, <= should be right thing, thanks!

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

