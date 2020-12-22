Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3740A2E0E00
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 18:56:09 +0100 (CET)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krltG-0006QP-Rl
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 12:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krlrO-0005RG-AW; Tue, 22 Dec 2020 12:54:14 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:52431 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1krlrJ-0004Ms-F7; Tue, 22 Dec 2020 12:54:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APrBYdD04P5jRwdNM5uD+hMrR5n7JSB+G0v5jgPRudfz1Iq5d7mrrqmIWiy65H51UnidaA7zfH0/tsv3aCiBvBCygBZGqoRbj9OW7ZWvK9nqk2IWxryofWnuJDIM6Ghb7tuJBB9hm5YjTo16j+lCdiGo5JaWHx4c2zXRHx2evJZBK1Vn8Bxpgb+urW5fiaFnfzAYELW+LHRNFjgUXelqpsaqjmLKgUDXWGajZgWpZUwFIBMo5xf5cTurlAPrV4JP/2/NCHVacMIegIZz93YZZGHKz08BLb3JjTe5dWwhEdPqIXufKfim8IkEiwkOToP6JZlemdBr6MM9wGx3PoJBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/G533OAyztT/eRcMBLdcwuWWj7f6Np352HdikUNneA=;
 b=GvauTqCPfHL7KsZyMiTasl43b0O0UUql/aCPlpf1s1uvjeRBo24HIboQZoRzBsW8F7x1lW3yypoAsQ1oNXWAlLTimSZ5WCc9YMCvXGJRTvwHChBtZ/w2hgKZkKvwznhR2FTAjdRq6rgp2rFywcZw6YkA+bTDSmy8VnzdNB+rXCDKc9iKFIUT1U7lGnXZcH+3Q1bqx/CzBryK0Ls9WG94jf9qmk6FgZZg0W646K0lBn0febKmHjycQ4hfEpXOndrpZcCyHWvmEqmqS6xzBsmgKYhA+6XxYKsWKB/2hak0iV5ASu3pbeJRucR/RbDczHKWaGYyxbX5GCzrhM3udvTN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I/G533OAyztT/eRcMBLdcwuWWj7f6Np352HdikUNneA=;
 b=rPKm3rwWchoPnS7IC0E8/tQyjw59DCIjXiOgf5K9K/LFqKNMY0OCTEP7lFQgu57gaKWFmZb2BP7yQzLJWx4rUYy5yEMT6mhZW3yn5x3uaVx7j3n4/2vPQYpX9789FW0xYwHHTyXpx+b05kdszeEMNLskyjnOMTkngjQ7OPZZ3Y0=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Tue, 22 Dec
 2020 17:53:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 17:53:58 +0000
Subject: Re: [PATCH v15 09/13] stream: rework backing-file changing
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
 <20201216061703.70908-10-vsementsov@virtuozzo.com>
 <48f91f57-3463-4f99-d15a-9a83446502f2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a1a2ec98-517d-ae6b-21b5-e6ef9312c847@virtuozzo.com>
Date: Tue, 22 Dec 2020 20:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <48f91f57-3463-4f99-d15a-9a83446502f2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR01CA0154.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR01CA0154.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Tue, 22 Dec 2020 17:53:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7ad89eb-f99b-47d9-b516-08d8a6a28ee3
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53356982CA7540E9E25A25AAC1DF0@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQYJtQJwfDhHHpHVpjUkyMa4uRQNJXDAIkjwahE8bUm5aGDeQsRPyuVp1T87mIbNzD2LF8A8T1S9WYQ6QDjMQRGgjp5qJHHP5yXcjHRQWJtBAMI0XP9qTOMoBEDvEoAOAca9q/J29NgGTE5Us0ZI+8jaXkqGIyORQdW7xpxBTNT/7pjHHkid5Me4HbruhwKMgJ1pjD6mcMJcQhyfLXhWQHKkO47n0j4sGysQeBks1tCHFD+H9fdMfIA2kazhNoBekaenXP19pO+tLAsWeqjwU4pj4YpmCDol9rbZhohp5e7Q7ql/jiY0jtCwiWPLsNtYS8jgJYmsxEXj5/yD6v4qfhPJDMVTHutUQT7T+ALqNSEnf9XpBoWWEqUyT9ab2T5MUdxQ0BlWiBGC1nfBA3j+ZWJxfK+5MaOTZ2RSzpOh3xVyNq2AkzAzwcuLBfTksEwG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(16526019)(5660300002)(26005)(66946007)(107886003)(16576012)(498600001)(6486002)(31686004)(36756003)(8936002)(53546011)(66556008)(956004)(8676002)(52116002)(2616005)(83380400001)(86362001)(66476007)(2906002)(31696002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UVpONCszdVcraEJmOVhCdlEvSHlhbWx1a1AxNU9Ocmt3VFY4NTArM2p0MHk5?=
 =?utf-8?B?TkhKUzNNQjd6VDdWcWkrUHRpQVJRVDVEQzZ3WVZzeG9lUmdSVk44QXN0Q2p5?=
 =?utf-8?B?Y2tIYTFmVWJpQ2k4WGQrRGhlTHVOWTBuUWhEU3M3ZlFYcU9wQzg3VHdobTBR?=
 =?utf-8?B?bHorRzRMUDM3YXR0cnV4anpzWUEwcW80T0tYa2paQ2lUb2tDVlZxMDV1SFUz?=
 =?utf-8?B?bzE3TS8yTm9HSUFDU3BCTStrbTJVbXVyTUpReDVGS2IwRENFWWlYK2NuU09V?=
 =?utf-8?B?VEt4Wlk4bjZLbHg0R0lqRGMvbDkyM3N1Mi9TU3ZiblVpYU1zZHpUWVVUOFdq?=
 =?utf-8?B?aTlCUGJIU0NpZ1FWSWRpWk1RQjRqMHdjNmMwRDQxV3M3a3VGeDhOZ0luRWM3?=
 =?utf-8?B?bXFobVE2cnEybVQ4YVM2TkJLUWN2bjVVMGJLY0FHeXdmQitOUFE5aGdQdDFP?=
 =?utf-8?B?THMyLzRMZ3JnaVlPb1pqazBaQWU2eEo0dnRrWk0vaGFBY3B4S3ZVeDV3UVpI?=
 =?utf-8?B?VkRPR3pvTm1PUFJmK2psWVYvaTJkN1ZmNmpUS05jNWtDS3N2N28vOGhoaERz?=
 =?utf-8?B?N2tXL1EyZ0ZrNEEwMmpielVDMnM5TlVKbnVvUGJoU201RlVpTC80MHo1VXE1?=
 =?utf-8?B?WEE2Nkt4MUE5ekV1OUdZMTYwcktLZHRFSzJDU3ViRzdZejdnSE0zSE45ME56?=
 =?utf-8?B?Q01XYTlhWVFXRW9OajN0ZldGTStsMVZFUU1kdjEzWUZCTzV1M2FSTVFkMDJU?=
 =?utf-8?B?NGRaa0tPcEJBNlpmZTRGQ2hqWHRQR2lUOEVDelM1NnNaaEVhTjRoZ0kzMnRw?=
 =?utf-8?B?aURac1duTU9DUmY5cGswSEFIcFZWVHhGUU5xcitOS1pGcHdTVThWdDlFVWRX?=
 =?utf-8?B?a0Zqa0ZZT0dQVklHQjB4ZDFOVTBOYUpSNUdkRG1TR0ZkQTZodGxTaU1xQkpi?=
 =?utf-8?B?S3ByOW84UlRueU5NSmFxc0Z0TmRRdUNGbnlRWEdLUGFiRU9ZdmM0VDJYd28z?=
 =?utf-8?B?SmplUXp5V25hU1hHb1B6WVFvVW9IYmpJb2ZjUEpkRG91QUU5VHNUc3J0QXd6?=
 =?utf-8?B?OWUrME1JWnBtZ3M3ZERXRTJKbGNGTkt3M01KUmlEeGh5K1ErSlVzTXkzMTJm?=
 =?utf-8?B?TitVd01NT2d5S3VJUjk4c1NGU3VmN3lJZXNzRkM3ZEp0QmxXSUs0bVI0TlpR?=
 =?utf-8?B?N0puMGw4SEo5OVhMZzdjRXhsaW1LS3NKSDVkYW4zOVorL1U1SEJOOUx0Y05a?=
 =?utf-8?B?OExvdFNzTVhqcE1NVWZaMU8yOGU4VFF1eEJCMVhLWWV1aDNKUUxuNXplMElU?=
 =?utf-8?Q?0foWs8muwGCV5VHoRZdIwiX4NENiw8UvxE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 17:53:58.4050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: f7ad89eb-f99b-47d9-b516-08d8a6a28ee3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kljn6edBiSD85PLhyTdOndGQtokVyiU3pvy56rwMfcLaJMimRIxswGmxp++k5UrK4e01WdhC6vaA/ooErdQ9eIyFW78ykpJ9vWBNR4QyBe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.12.2020 18:59, Max Reitz wrote:
> On 16.12.20 07:16, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> Stream in stream_prepare calls bdrv_change_backing_file() to change
>> backing-file in the metadata of bs.
>>
>> It may use either backing-file parameter given by user or just take
>> filename of base on job start.
>>
>> Backing file format is determined by base on job finish.
>>
>> There are some problems with this design, we solve only two by this
>> patch:
>>
>> 1. Consider scenario with backing-file unset. Current concept of stream
>> supports changing of the base during the job (we don't freeze link to
>> the base). So, we should not save base filename at job start,
>>
>>    - let's determine name of the base on job finish.
>>
>> 2. Using direct base to determine filename and format is not very good:
>> base node may be a filter, so its filename may be JSON, and format_name
>> is not good for storing into qcow2 metadata as backing file format.
>>
>>    - let's use unfiltered_base
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>    [vsementsov: change commit subject, change logic in stream_prepare]
>> ---
>>   block/stream.c | 9 +++++----
>>   blockdev.c     | 8 +-------
>>   2 files changed, 6 insertions(+), 11 deletions(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
>> index 6e281c71ac..6a525a5edf 100644
>> --- a/block/stream.c
>> +++ b/block/stream.c
> 
> [...]
> 
>> @@ -73,10 +74,10 @@ static int stream_prepare(Job *job)
>>       if (bdrv_cow_child(unfiltered_bs)) {
>>           const char *base_id = NULL, *base_fmt = NULL;
>> -        if (base) {
>> -            base_id = s->backing_file_str;
>> -            if (base->drv) {
>> -                base_fmt = base->drv->format_name;
>> +        if (unfiltered_base) {
>> +            base_id = s->backing_file_str ?: unfiltered_base->filename;
>> +            if (unfiltered_base->drv) {
>> +                base_fmt = unfiltered_base->drv->format_name;
>>               }
>>           }
>>           bdrv_set_backing_hd(unfiltered_bs, base, &local_err);
> 
> I think I preferred the v14 behavior of not setting a backing file format if backing_file_str is nowhere to be found in the current backing chain.  (I just noticed, I had a typo in my reply to v14, though; the “continuing on with setting a backing_fmt” should have read “continuing on *without* setting a backing_fmt”...)
> 
> Anyway, this is still an improvement on the pre-patch behavior, so:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
> (And as we discussed, the best would be for the user to specify a backing format through a yet-to-be-added option.)
> 

We discussed that the original aim of backing_file_str arg is something like fd-passing, when qemu doesn't know real name. In that way what was done in v14 is a degradation: we'll never find such name in a backing chain. And acutally, using format of backing file is a correct thing.

So, as I understand now:

We set backing file to the node which is the new backing-bs (maybe, skipping some filters). Nobody should set backing in qcow2 metadata to something absolutely different. So, using format_name of backing bs (skipping filters) is a correct thing.

We want to support cases when qemu doens't know real file-names. So, trying to check filename, or search it in a backing chain is wrong idea..

Hmm, or when we search backing name, we really track what was written in backing_file field of some qcow2 image in a chain, so it should be something correct? Hmm, then may be v14 was OK.. But in this case again, user should not pass backing_file, but we can just use backing_file field of cow-parent of the base at job start.. Oh. Anyway, we can adjust it later in a separate series.

-- 
Best regards,
Vladimir

