Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B739651B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:21:59 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkfs-0000KA-G8
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkcf-0006Pg-Kc; Mon, 31 May 2021 12:18:38 -0400
Received: from mail-eopbgr10100.outbound.protection.outlook.com
 ([40.107.1.100]:10145 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnkcX-0008IQ-GV; Mon, 31 May 2021 12:18:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKW2BKLh5Q6fJoHsRjk5UEJqlUbNqPs53nMhLQxlH3lIqrkeGlz51VCNlfEj+65p+lZFcOlMqfPxPg/AppJBzM9xfuLzOQth9mFsPtpYRTrgAbucJxx/qKnoSnlE8zBHOhZ2gCXyE7FfosZUIoZUaoS6FJH71XZ4ezDUFF2jY/B98hqAVbYZluZ5scLPT8QJJDHAAbFBZH2/7gc9hC5ayJBxYIVTREQ9Pzm2B6yV+y2Gabv/TJVZ/Y7xgb2jXaznP5ufAT6tcPiEujI3VSpHH26AsUp5PoKfvM7rJUKkF4HWn2cpGv9zoMIeQP00LeG23l+vUkORsX+Noq+dP6sVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isbRw+1g5yCsfQCq0zrCjNFchyjL3KGi48KI7yErVNU=;
 b=lPiLniCa+J7dWaQt8UEhYDF/geMQiGVeyLhdpox5b0fVCaEi8Fsyx7GJTjxn4PZjHl88UACNI7Y7vjT6ljOaaCjnPa9BngnxLo47BkUh/8N3yNn4XVBu2bvoznTvt6BQrUBaso0o7rTDsLzFIOJc9KFUsMLU8qERxms3VKgiX0Kz/Haco2pyLjjcfEczwfwJt3Q7WH6toH6SUD4rZdnvl8D7wwa2lQtyl31jhs7cp8CZphPYYKmLSM9GIpwgEp4yC+TI0sdR8ND7U38hGjV6jXjpE5yAiorCX8sukNA1ZVVfrbrd6l8xUucP7vcCgGYxYEDZqfHw2J4WtBid2zjD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isbRw+1g5yCsfQCq0zrCjNFchyjL3KGi48KI7yErVNU=;
 b=abWYnDCxiG5kzXmzCorZDDKx5BRSKS94Ohjvx58xQZoMn0sihee0lAABkM9g4ox6Pf7z7ZfDMQcB5H/mklWrZ1VswkUu++d4MId9j2tPkJ654SUTc72+zWBJ4ydKmPdHOZM66hIoBibKjN186GYgh77CSPsFFyGjQ0n4lbazuG0=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 16:18:21 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 16:18:21 +0000
Subject: Re: [PATCH v2 5/5] block: improve permission conflict error message
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 berto@igalia.com
References: <20210504094510.25032-1-vsementsov@virtuozzo.com>
 <20210504094510.25032-6-vsementsov@virtuozzo.com>
 <YLUJzdunvOGmfdkO@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e08592be-2520-217a-0b68-fb7f44ac6c47@virtuozzo.com>
Date: Mon, 31 May 2021 19:18:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLUJzdunvOGmfdkO@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 FR3P281CA0048.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.9 via Frontend Transport; Mon, 31 May 2021 16:18:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13974d0d-8a3f-403d-50ec-08d9244fb580
X-MS-TrafficTypeDiagnostic: AM6PR08MB4214:
X-Microsoft-Antispam-PRVS: <AM6PR08MB4214ED96317C79031B1AF3CCC13F9@AM6PR08MB4214.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CID3q58r7Rb+9qPW5w7O/ovMmmemDFFT/0azcCCeJSkCvIVft8fSEOU+hNsbjjnLu31XOye93xwUK+xIjp404T3XOde2bAyZ3NWnF6ei+MdB0yJRXknsLDuSb9sHEIy33AO3aAzctoNWpfuGuPeLK5d9E/0BXYwe/knh+6RFCTMnS8c47AG15p0JQPwy5fOqBkL38OgE6WbXkHhujHM03G6DsJ8P5T8CQ89AvzhDRc6W/183TzXuZ2iLdCdPtCu5d9PZBRzTmBSuADeLrt5WXzYAb2f9ZbK1wTl8z2S0H1vQWkqGjUadwCiAaO0d9VvysmiSbYKSjJsIlSy1Gjd+edvlZIzyT7N/Ebcf6qmeeYly8QmEcgNnELyEHkOpwwd355OxnIpDaEZA+l823i3rQido4gd8SEZFSyyOIEs7ZK2NmAaFpBzah53V/nPHhwbnUYIxprAKyvpELJvIhSaWIFyFZFehLXa5Ce36MVMyJO8tN2SBGcLrUufC/SY6oFwVpxemsGrIXy1OnTo0d41OCmUfKSnl4S3HFFk6MmBQcE//ZKwz/OLHYTG1vZo6c/b5Dz8/qpbPd8U9e+XqQ2Aw1UNvSyRXptD6dxtrwvfWpfR1sjZnWKW8szQJ/+C2xIDsLXHDk1DeDprm25MjR1fYTfn0/lTOj4sgFjEkPMddb8ZZxHDwlcy71EHe5aHwnYYIEBAzvaesEGB5fxU4Nox25Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(366004)(376002)(396003)(66946007)(15650500001)(66476007)(86362001)(66556008)(956004)(83380400001)(2616005)(8676002)(316002)(36756003)(31686004)(2906002)(8936002)(6916009)(5660300002)(16576012)(52116002)(186003)(16526019)(6486002)(38350700002)(478600001)(26005)(4326008)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MG1TNkJoOTNMSFFLUHNFenREK0JjeEE2SWxyRE5rdWlTYlhidDBUcFNzNTJ5?=
 =?utf-8?B?L0FGMmpwN1BCV2RzUHdLT05ZeFFoN3gwU1BmdVdTNjUxamp0NHVtbGp0SkNi?=
 =?utf-8?B?OFFEeml6Tzk3VDE2TWVFZ2dwRDRyM3grbXh4VytQVEY0bTNWTWk4SVN0bXcx?=
 =?utf-8?B?T0dta0xOYUdXWXdyRWhTSGQ1ZmRSdFQ5TGFkZ2xUT3ZVK2xUZGxlM3JwS0Nv?=
 =?utf-8?B?TU5PbkV2NlZQU1ExUmlKV1BCSEpSU05GeGJwZ1RvaXZWL1Q1ZS9iZEhiU05B?=
 =?utf-8?B?TlFkRVhmNGxTeEN5cm1CWXAxSG40V1JleW5oVFdjUzdJdmx3c3RCVlVSekJk?=
 =?utf-8?B?Y3cxSlNSaGtHODZBUXRVY3U1bDY4NFhrVzF1Mmt3OWhuY21TUlRSTDZXMXhr?=
 =?utf-8?B?ZWFxNWJhR3JGelRnTCtZZkEydGdHeG05V0duc0xkTFpNZ3dVaThraWlHVHh4?=
 =?utf-8?B?TUN1SDd5TTdsV1dMU1lacWJST3NDOEg1c0tnVnkxaW1XLzZxS25seU9BNWl3?=
 =?utf-8?B?QXprckRMQ1ErTHlRS29KZ241YXFCaHZqVW5EazhKSE9PUThpQ0VQamJkYk1Q?=
 =?utf-8?B?c051ckRvNU9nNzUzMm90YVd4WnhKTVl4YkpkS0hjQkRKOHpNall0d1V4NWs3?=
 =?utf-8?B?L3ZKM3ZSNEw5MlhCYjdZZXlES2NNZklLRDZoTldlb1l4R0YxY0pzd0VXaEpV?=
 =?utf-8?B?WUpvNE4yZlo3Y1IraWNSbTVXYy9DV0hHNTFVRFJ3c1dzanZ3YWUyT1lMQ2Ju?=
 =?utf-8?B?K3ZDTGJ4NEhOT2xYbHhsa3FwNzNrNzRkNlRNRUtMaytRMzFtSW9ZMERDeXI3?=
 =?utf-8?B?aHh6RWZFYUdHcHQwN2pYcXBhZUxsUmNVaFA0RExMTmlnSmJpQytJUGI5QXdo?=
 =?utf-8?B?bzdnOTkrT0hrL0ZKSlZJUUZtVWF4ckNYY052cHNUbmFMb1p3bXFTcmQrZk9p?=
 =?utf-8?B?UDcrV0JCU3dEZHlKbE9WZlY5OWRjOFJzOFdvWDBRbFNRd3ZXWHdWSnJGNWVW?=
 =?utf-8?B?aHNIUURLalNxRVdVeU9nQk1uNzdiTS8ydFJFbE1mWDVBbFdUZk9OOHlMTWdm?=
 =?utf-8?B?bk0zSGpLL252QTh2a2Jnd2NoSkJuWEEzMzJYdUdwTUVQdHNiZlZEUGJTNEJ6?=
 =?utf-8?B?a1BOa1pKbk1sME1qYy9UckpLcUdvdE9VYmIxSGxINUxCN3cwcnBmbVB6ZjRn?=
 =?utf-8?B?WVNabWVyWGRMYWRzTzJ6dkJReFgwWStXd1V1QUhkSStEVG9HWFdOZzQ5enJi?=
 =?utf-8?B?OVA4M1ExY2U0S1lJS2ljRHdMcGFzNm91dkVGYU1GbFV5b05xQmp0T0FVcUs4?=
 =?utf-8?B?TGFzS1hjUkN4YU00T0JCVldNSkxqWnRJYVdSNkNYUm56emIrMUh5RmlJbHhY?=
 =?utf-8?B?Mk5vRDVUZkJ6UHpBcEY5dHNoVHR3Zyt0WWR1S2NISUw0cmdVZlBRRHBuSVV4?=
 =?utf-8?B?WWo1TFFuQW5VWktGcDV4VytFaVh3Y0JPakdsRlo3QVBhcCtrME9HQmVtQm4y?=
 =?utf-8?B?bVNwZUJRWmR6YVFlMWQwLzcyNS9hOVVGZGhQVG9QSjdjTWhLTmp5N2dTVXRF?=
 =?utf-8?B?elRIZkJ0bEtaeWdOVisvdGczcXBNSXRNQnRKUlRIdHduRVlTSzdGWk9NN2hO?=
 =?utf-8?B?N2czWHh6WXpaUEk2eDVLWFBkaGFheElmb0hmdWpwVEppOVVOVGlJMHIwM3lq?=
 =?utf-8?B?dm9wektOdU1tZzZMWXcrRUkrRk1PSFltMkMyMkJSaTJDWEJSUHZnRDliSmtT?=
 =?utf-8?Q?2+xYnZ+SxJq02LfJLdXp9vEESd1GlsZEi8H2FXH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13974d0d-8a3f-403d-50ec-08d9244fb580
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 16:18:21.7698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EczkBruranuC4YvJ1ifoWvON6oawgv54WRT1JcTYGst5rCcEIYjIw8RFh4HCdhTKP2wjT9gILrNP/qLiszc6+zYQ+MSaPPjqNkYir51cwzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4214
Received-SPF: pass client-ip=40.107.1.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_NONE=-0.0001,
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

31.05.2021 19:07, Kevin Wolf wrote:
> Am 04.05.2021 um 11:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Now permissions are updated as follows:
>>   1. do graph modifications ignoring permissions
>>   2. do permission update
>>
>>   (of course, we rollback [1] if [2] fails)
>>
>> So, on stage [2] we can't say which users are "old" and which are
>> "new" and exist only since [1]. And current error message is a bit
>> outdated. Let's improve it, to make everything clean.
>>
>> While being here, add also a comment and some good assertions.
>>
>> iotests 283, 307, qsd-jobs outputs are updated.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c                               | 29 ++++++++++++++++++++-------
>>   tests/qemu-iotests/283.out            |  2 +-
>>   tests/qemu-iotests/307.out            |  2 +-
>>   tests/qemu-iotests/tests/qsd-jobs.out |  2 +-
>>   4 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 2f73523285..354438d918 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2032,20 +2032,35 @@ static char *bdrv_child_user_desc(BdrvChild *c)
>>       return c->klass->get_parent_desc(c);
>>   }
>>   
>> +/*
>> + * Check that @a allows everything that @b needs. @a and @b must reference same
>> + * child node.
>> + */
>>   static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
>>   {
>> -    g_autofree char *user = NULL;
>> -    g_autofree char *perm_names = NULL;
>> +    g_autofree char *a_user = NULL;
>> +    g_autofree char *a_against = NULL;
>> +    g_autofree char *b_user = NULL;
>> +    g_autofree char *b_perm = NULL;
>> +
>> +    assert(a->bs);
>> +    assert(a->bs == b->bs);
>>   
>>       if ((b->perm & a->shared_perm) == b->perm) {
>>           return true;
>>       }
>>   
>> -    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
>> -    user = bdrv_child_user_desc(a);
>> -    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
>> -               "allow '%s' on %s",
>> -               user, a->name, perm_names, bdrv_get_node_name(b->bs));
>> +    a_user = bdrv_child_user_desc(a);
>> +    a_against = bdrv_perm_names(b->perm & ~a->shared_perm);
>> +
>> +    b_user = bdrv_child_user_desc(b);
>> +    b_perm = bdrv_perm_names(b->perm);
>> +    error_setg(errp, "Permission conflict on node '%s': %s wants to use it as "
>> +               "'%s', which requires these permissions: %s. On the other hand %s "
>> +               "wants to use it as '%s', which doesn't share: %s",
>> +               bdrv_get_node_name(b->bs),
>> +               b_user, b->name, b_perm, a_user, a->name, a_against);
> 
> I think the combination of a_against and b_perm is confusing to report
> because one is the intersection of permissions (i.e. only the
> permissions that actually conflict) and the other the full list of
> unshared permissions.
> 
> We could report both the full list of required permissions (which is
> what your current error message claims to report) and of unshared
> permissions. I'm not sure if there is actually any use for this
> information.
> 
> The other option that would feel consistent is to report only the
> conflicting permissions, and report them only once because they are the
> same for both sides.
> 

Agreed.

So, what about:

   error_setg(errp, "Permission conflict on node '%s": permissions %s are both required by %s (%s) and unshared by %s (%s).", bdrv_get_node_name(b->bs), a_against, b_user, b->name, a_user, a->name);

?


> 
>>   
>>       return false;
>>   }
>> diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
>> index c9397bfc44..92f3cc1ed5 100644
>> --- a/tests/qemu-iotests/283.out
>> +++ b/tests/qemu-iotests/283.out
>> @@ -5,7 +5,7 @@
>>   {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
>>   {"return": {}}
>>   {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
>> -{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
>> +{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Permission conflict on node 'base': node 'other' wants to use it as 'image', which requires these permissions: write. On the other hand node 'source' wants to use it as 'image', which doesn't share: write"}}
>>   
>>   === backup-top should be gone after job-finalize ===
>>   
>> diff --git a/tests/qemu-iotests/307.out b/tests/qemu-iotests/307.out
>> index 66bf2ddb74..e03932ba4f 100644
>> --- a/tests/qemu-iotests/307.out
>> +++ b/tests/qemu-iotests/307.out
>> @@ -53,7 +53,7 @@ exports available: 1
>>   
>>   === Add a writable export ===
>>   {"execute": "block-export-add", "arguments": {"description": "This is the writable second export", "id": "export1", "name": "export1", "node-name": "fmt", "type": "nbd", "writable": true, "writethrough": true}}
>> -{"error": {"class": "GenericError", "desc": "Conflicts with use by block device 'sda' as 'root', which does not allow 'write' on fmt"}}
>> +{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand block device 'sda' wants to use it as 'root', which doesn't share: write"}}
>>   {"execute": "device_del", "arguments": {"id": "sda"}}
>>   {"return": {}}
>>   {"data": {"device": "sda", "path": "/machine/peripheral/sda"}, "event": "DEVICE_DELETED", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
>> diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
>> index 9f52255da8..b0596d2c95 100644
>> --- a/tests/qemu-iotests/tests/qsd-jobs.out
>> +++ b/tests/qemu-iotests/tests/qsd-jobs.out
>> @@ -16,7 +16,7 @@ QMP_VERSION
>>   {"return": {}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
>> -{"error": {"class": "GenericError", "desc": "Conflicts with use by stream job 'job0' as 'intermediate node', which does not allow 'write' on fmt_base"}}
>> +{"error": {"class": "GenericError", "desc": "Permission conflict on node 'fmt_base': unnamed block device wants to use it as 'root', which requires these permissions: consistent read, write. On the other hand stream job 'job0' wants to use it as 'intermediate node', which doesn't share: write"}}
>>   {"return": {}}
>>   {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
>>   *** done
>> -- 
>> 2.29.2
>>
> 


-- 
Best regards,
Vladimir

