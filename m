Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4139FDB8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:32:21 +0200 (CEST)
Received: from localhost ([::1]:39198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfaO-0004kQ-0c
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfZ2-0003uz-Av; Tue, 08 Jun 2021 13:30:56 -0400
Received: from mail-eopbgr20127.outbound.protection.outlook.com
 ([40.107.2.127]:50562 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lqfYy-0006Wd-Id; Tue, 08 Jun 2021 13:30:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LM9cZYbJWr5EpOGy+/IozZ7pY79Qwko3fnQfHwamGRL69lhFMf+tRj0SuUDfsCqj3/ADGWdDo8sXYl7o7qm3w/4sV/JXBl6smMLrorbe94/zopxO4Eqh1v9R2TRNXq31mO8tj+q9H8tEfFLrOvrERFnl/FI9vILJ25E0jXnr4XZLKzbfw70eG2Vwvzm2OE+B/O6d3hjOqwpVEOx5m8lmU+DCj8inAi1oQfg2eyJl5RnUncZ9PRxUCNqJ0yyyekre3p4M6rZ9qjtp8jOrS9j2JniUP5erVgV434qg8kBvwbY0IrhB5DGlkIw/z05YbMowT2MU9vd0WFB56j6vuaIaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY5LIAhV7Z1+TNB1tdn7lv1E35aOg8BFh4X/462jdlo=;
 b=d99QxElx/QKqL/GMi+YPmZ9D2G3cMluxs1TLaEmUYmbKTjy7EkOmBTAGiAuMP+PFfjeaAAfxWvyapAW5ejZb8pv4liSq3za+oYIi6tdrCp/h6HJi8J8PdUaR4U9WJsfRYh7gs/bSrmEmk4lFQYXCcSEqdILZZ2M7gjYXqeiGAf67JX2Bi6AzjA9Q6bh/kzvgKF6SsVS0lnQ4m3CyKLFO7/GFtD/l+OdaQ8y9YfYoq9PuZADFfrDwOOIbnp3s4eliPuxRluwoawLgNmnuxWvnQgWKz1efN2VJVK6qDMeJb94O8R6Ikv0wIKg7ba2/M7X9huNvHny96VLOaAgGe5oIZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VY5LIAhV7Z1+TNB1tdn7lv1E35aOg8BFh4X/462jdlo=;
 b=ccGJPB2Dngnw3z0Vbe+y2aeLrdhkHeKvcrKUmib6QLQ+DpxRkJaMYqTjHkNFsl3XTo6qv9CunxyG03z/jccBk2u4Po0wi2CqWcpXpaXayh/3TGUw1ZCEtW7qmB84liocHA8zu3TJBd3psOdH432LbI0aeRidOmYx18U3r2QY8uo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6871.eurprd08.prod.outlook.com (2603:10a6:20b:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 17:30:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 17:30:49 +0000
Subject: Re: [PATCH] blockdev: fix drive-backup transaction endless drained
 section
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210608171852.250775-1-vsementsov@virtuozzo.com>
 <e5e2f2b2-9dbd-0aaa-8c20-aa38ed168acc@virtuozzo.com>
Message-ID: <a69b5496-d264-59bb-8519-602cf8e2cdd1@virtuozzo.com>
Date: Tue, 8 Jun 2021 20:30:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e5e2f2b2-9dbd-0aaa-8c20-aa38ed168acc@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: PR3P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::10) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 PR3P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 17:30:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11751508-3e75-4ffc-0935-08d92aa32837
X-MS-TrafficTypeDiagnostic: AS8PR08MB6871:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6871B3215B4E7F1B1CC34AEBC1379@AS8PR08MB6871.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLrp01epLvldF+l4mcmaoAKV1J9WPh1Mq7/F5QaMXL3S3RX900FCFbk5CDtP3o1VYmlOloT7Z14g3EWCbhkQdXGVZucuiioLRvU7er/8R2PIe+brJXnhdbPoImRD5yOIN4iuFRxMKVjjXAzBxMKpT5+N5ngD8hQzKCLUdC6QXKhJy7EVnAP/gFPOVbYzakrduFjFjd3l4y64s5o84VIWo33uuB3VP3/QFThke/gOKNKF0e3IcAd837draeXyF6aBm4SNRRzxIuFNz0J4DzgCv2srpiCskyi41sfLXU+BOKdzLgzpzYoiHIWUipwEgHvOKHJR9CgQAAMRQYFFoX3tOnPfYzG1uxJwiPylyEo88N1JIQRuL0C/zwKfQAUIiGHkd38pJ+pHgMXFFKTfZFwWYkQc5g8ZBkDf6pPJH91RVNzZY4lOluIoDc4XwpI4WXhKqSOC2qBIXLY37ARkqwRhhdeTFaiUWyQ2Iw817MLy38qwnr5yIA1YD27dFy2utOz2TQ+Gii7BGI8IlsJrFrOUOe79dXSLkgtoW20bktdrBBGJMg/hEZKVvHCFVl5qnwO/ZNuodc/040xdv5ey53mgyTVd5i3WRyAD4H507/tKwAFX4tr9uvdCvmK+ObFM6KhS/hnQYQFV5i9daL1Xp5/+X52WUCEnAc5+m+OZU+RpckH13c/PgQEeMdUZ2+ITMVUHSeVcJZoXxx3fFwgpaS7aY3Dj5CvAs8keNJrClFgr673Vbru9giK3CGgkacKtK101RuV8AclyI7xWEpgxm9qD3c730btlbastnYANy6vJEavYygXfZGSU0kOQSei0+VVFTWt9hhT+VfRSVj8RSKVwE3CjAECj/z9R8IAEZWFSid4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(366004)(376002)(346002)(16526019)(66946007)(66556008)(52116002)(16576012)(316002)(26005)(5660300002)(66476007)(2906002)(186003)(31686004)(6916009)(8676002)(8936002)(6486002)(86362001)(31696002)(478600001)(4326008)(38100700002)(38350700002)(36756003)(966005)(2616005)(956004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qy9UbXJYWWt2YVkrdlhWWXZmSmxLNnEvSlVBOU1wdEsxOHRjV2FlY3Q1Q1M3?=
 =?utf-8?B?ZXRWZlUzMFVXU0dqT01rRi9aUjMyaUMrV1NOVnlISkpNNFpzc0pjTUdKNjZ4?=
 =?utf-8?B?Wkx0UEpBS2lRK3IzYmFpQkZjVUVNTzRVUmQ4S3NXa1A0L3d5dkZXOEpwdlBY?=
 =?utf-8?B?VnZuZ25UblhSRDdBU0pnVnNNdk5WaWJpWWNBZTNhSnUyRzhtQklaYVhNR2dR?=
 =?utf-8?B?TjZ1SnVoZVRZNnhLTDVGejEvT2JESjU1Z2VzQXpFOHVHVFBIeGlWemQ0R3FK?=
 =?utf-8?B?Wk55NEVTUFZhVW51elg2eDZWU2tXWEN1UnpyN1ZQZExaUTc5b01QRXdSaGdz?=
 =?utf-8?B?c0hGMVVFMWhoTC9RMDFURkdJT3FUWmt6Q1B0b2xUSitBWlB6UU02K2Q5OFl0?=
 =?utf-8?B?Rk0vcWtFUFpLY1JJVVIzRXY0d3E1NkU5dmFFdWdiRWZIMFdhcXhOb0VacEtl?=
 =?utf-8?B?b2ZUUzNZejBEdTZyN3hGeEgrTyt1K1NkWkh1U0NldWRweHdQQjM3bmdEdzVv?=
 =?utf-8?B?OXVxYVl4dElKUzdTME1BWUFBbGFKdXpnQmlUM2RsZHpkcStSQWVZMU1OZXJG?=
 =?utf-8?B?RDlWS3g0dXJMTElWcW1kU0ZWRFRnbE1wYkJYcStMR3dxTGVzYktVdWQrN2VM?=
 =?utf-8?B?VmdsRStXV1hXRFFUN0dlb0svY2V2c09uWlNEdTVYcnRZZmdSajVmYko1bCtO?=
 =?utf-8?B?V0VrdjEyYms3S0pHamVZUmZWVHU1WVpyZTBSblZtRHBKd2lRc1dlWVZJSlBv?=
 =?utf-8?B?RE9JbzFTYVZ2R3phVEpZSi9qS1MvOVhJVTZ5R3MzWXl4bmg4OWdLa09mZ1F5?=
 =?utf-8?B?Z0pBcG5oRnYwdFdnaFY3VTVNZjdSRXQxM2JKQmR6MUVPSkdxaThBRkZzbE5u?=
 =?utf-8?B?S0crTXMxRWZMOXJkOHo0d2VBc3ROM3NSRXpsVGJpZU1UMEk5ZnZLemJ2dGZN?=
 =?utf-8?B?UEMrdGJwcStCdTd0OUMzVE0vSXU4ZDBaUVNSOGdVZmd3QU9wZHBoOVo1bFEw?=
 =?utf-8?B?czloWEQrL1dtSVVtZlBjNTBVWW83aWszQWVCNXFvVEY5KzJSYk5EMnNzMXNF?=
 =?utf-8?B?c0poNkpRVXRMOFBOdjNYcXk1MnQwejhRWW5jV0xrQWd0bEZubGRMMkNJZHRM?=
 =?utf-8?B?Nk5lUElDZHhTMERXVEhYOS9leUJueGxYcnhRdHhYUW5vdlhGaXpJL01adjc3?=
 =?utf-8?B?QURMRkFMdXNqdmprUm1IZ3NjbllYek5idUYrVG5maGlzZE9KVzIwMlhkaFdt?=
 =?utf-8?B?UWQ4R2tCUTVHMmZsTFRWcDlRK0hTS2pSL2RGcTBGekRnVC9BZG9YWDlzTE90?=
 =?utf-8?B?eTJHbFh3S2R3VkgzNEQxMVdSdTZKVXI4WGhiWTl1eXZramlEb2JCbjZQZ1k2?=
 =?utf-8?B?U1dFeGJxaTdJaHVrWTBvV1g1YnM4dkc5TDJ5blhZeEhxZkZwcDFrdC9jQnln?=
 =?utf-8?B?WDY2cUxvNW1vMFVTOS9Ldng1SWRwOHlGcGhTVjE0N1FDNkxmSjcrTjl2VVRO?=
 =?utf-8?B?dnIraTFTdmE4ZHY2Q29CdERoZHdYU3B4a3VuME9rdGZ5SG1BaE1TNmtaUVRI?=
 =?utf-8?B?K2pZcU1qNGZKREFGWGEvWHR0UlY4cXhxS0JsTnBaQUYxTkNwNlVmbFVrcTg1?=
 =?utf-8?B?UEg0VStQa251c1BaVC96ZFU4WHlEU1FWYXpBZzJ4cVhvaEpYbmcyc2huMTh4?=
 =?utf-8?B?bjhhZlR5UlJqWWhJL0tYZ0x4TTl2WFR0cjNwNy9vL0xGVC8vV2NrUGhsQ1p0?=
 =?utf-8?Q?ShgiN4n+mJTxdekvzuNmINsI5JxejR829ra+QpK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11751508-3e75-4ffc-0935-08d92aa32837
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 17:30:49.3203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k8ECnsFwyxl/xnVXDXOm44MlolddFwle2q4dZsRxgMMmYJLOoux2B7AtLh5L9VPOE01BumptAGY3osO9QjeHjqoGtj7xRzkejff9ItwjN+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6871
Received-SPF: pass client-ip=40.107.2.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

08.06.2021 20:24, Vladimir Sementsov-Ogievskiy wrote:
> [try add gitlab issue email to cc, will see how it work :)]

That was bad idea. The message becomes a new comment at issue page. Formatting is broken, looks bad. I've removed that comment

> 
> 08.06.2021 20:18, Vladimir Sementsov-Ogievskiy wrote:
>> drive_backup_prepare() does bdrv_drained_begin() in hope that
>> bdrv_drained_end() will be called in drive_backup_clean(). Still we
>> need to set state->bs for this to work. That's done too late: a lot of
>> failure paths in drive_backup_prepare() miss setting state->bs. Fix
>> that.
>>
>> Fixes: 2288ccfac96281c316db942d10e3f921c1373064
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/399
> 
> Reported-by: Sergey Zhuravlev
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   blockdev.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/blockdev.c b/blockdev.c
>> index f08192deda..094c085962 100644
>> --- a/blockdev.c
>> +++ b/blockdev.c
>> @@ -1714,6 +1714,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>>       aio_context = bdrv_get_aio_context(bs);
>>       aio_context_acquire(aio_context);
>> +    state->bs = bs;
>>       /* Paired with .clean() */
>>       bdrv_drained_begin(bs);
>> @@ -1813,8 +1814,6 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
>>           }
>>       }
>> -    state->bs = bs;
>> -
>>       state->job = do_backup_common(qapi_DriveBackup_base(backup),
>>                                     bs, target_bs, aio_context,
>>                                     common->block_job_txn, errp);
>>
> 
> 


-- 
Best regards,
Vladimir

