Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBE52FBFEC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:29:32 +0100 (CET)
Received: from localhost ([::1]:49884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wh1-0002Zo-Fj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1vla-0007wU-1H; Tue, 19 Jan 2021 13:30:10 -0500
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:58607 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1vlW-0000Xu-Ig; Tue, 19 Jan 2021 13:30:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCf4ucw10Ss2aXwnJLi/wAmqQQlvJoA3ywk/5uCBRds/t/DmdoqX6kRYS/G1cKIjDAArx9JHVIEPkWGzaQQVC0P9UtaK9x6MKI7xVUaklHkmqZ1JuBrLJ1VM6h8KjlZeX25w8KF2ygfM9EKURGkfJFsNNTLGCGMDnfF1E1xgjPA7susb0LrJaju+28yvUeoBWG8HltAtdKwcrT3DoUEggTv8oK6oSLAzTdq3h41WhAi/1WrH9EsfibIwbHG0y9cao6JMqw1gQii4BgDUhFn74XFsDnj8emeu/YI7FL8p788MbiJlfPU3pM8nZlYSnIBhOubVyNTDRHid9Nf8Ne47Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTzDRt+6itu2buzM8DSoT2ZbLcUto4WdCiSeI9H9crw=;
 b=L7W3m6wSw3LxYkDlUyN94uYWPrDiBLSji3mND9nzQ34Wht36rPNGTjbVJ7FPt8C1mEk/rwyq0H3mjvegpqYJLs7BRzMZJQyhKSjd2lTyadf6g+MWnPpOZZC87+o5zXZw9DbW+2I3omXFHediQEXm6ekHI7bqWDQWwbaaX1c/ujp8d/7Tp1Ia9moKlbjJ6zOryaSZW3YLwikVELXzQGKXG7gsJdj+No8aB62F+lAVcGMZQO/SnGDi84X2RVXSC0xE4SMnt2fo2LHEcPYV7gWcGRGyuW+AGmM4HUFDjjr5vfFFLpnzqGohGYcTgr/T1+u33mn7tgx2IJkxRwOm3D4kyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTzDRt+6itu2buzM8DSoT2ZbLcUto4WdCiSeI9H9crw=;
 b=iymlqtz2ZVnvZxjZsNhC1A4uazXNhg4qw59aPIGrir0FIk8gikcDxr/n+ZwR6Jm8PrBtKuA9BAb9zSIElfBEd03GENt+PGydprrSBSwy0o+De3g3wwtYrY0s17XiWIT3/ArBj8IsA0E2ZIrctDPN6PSgOKxIliCsCXb4vaZymKY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 18:30:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 18:30:02 +0000
Subject: Re: [PATCH v2 12/36] block: refactor bdrv_child* permission functions
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-13-vsementsov@virtuozzo.com>
 <20210119180909.GK5012@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0b634f73-b997-d72d-e7ab-3a1dcdfeb509@virtuozzo.com>
Date: Tue, 19 Jan 2021 21:30:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119180909.GK5012@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.84]
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.84) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 19 Jan 2021 18:30:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23258b07-c2d7-4894-ad7a-08d8bca83c5b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5383CFE0AE897B03A23F957EC1A30@AM7PR08MB5383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJpJXPj/5mGdkcfC8dD043n63Z01prgvKk9St1KfL7Ay/FxL0/oJowuz+oe7sVeFjbgfB47eAb+7OtTf2dQV/KIeWe9EwhrTan4v68U1F64ughWpDNgAbZMK2ViWtsUJLq11tr5jl3uILk0kCh6cn2uCxgS9ezoybcoilVTjjzZDNVdZsRyTfNSm3fnRiXzAuBHdyhKDDtnwHviWBqTSJOa7gim41+L4jVO8kv6JjDlMYRDjKbtZUQFk6NSaPJjlgtfvx7wkPBwVvON1F+UnEJ2qRAe0/ThKAt7jTq7lPHNHJufORB2EF30ZGera8rTSniQH3JIqf+XJVzfjEiFBv+XmjL1eZ8JYxOLHUS8Kr9uVIM8VinzmT4vgFZRoQ8n6ePZr3pGUcLqCVNVyMblVeVXAlYF12iHraIcL8WL6yweekLuq7NL2pOuOI8sdez38iIs5Kqz6QsIzR75We0AwATIgqMOrcG/L1wxRhnOtOpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(5660300002)(31686004)(6916009)(478600001)(66476007)(8936002)(66556008)(66946007)(186003)(16576012)(83380400001)(4326008)(26005)(2616005)(31696002)(6486002)(86362001)(16526019)(8676002)(107886003)(52116002)(316002)(956004)(2906002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L25iTzdySHNrS1VyYW9PTXBEenErNnRoVE55QXBIdlRSTC9rNncyQzNnd0hw?=
 =?utf-8?B?MEZ5NURHQUFsS3FpZGRXa1laME5ESmw2enhlNG8xNWZvWFZ4ank2UmZkcmt3?=
 =?utf-8?B?SHZSUEVlaXBxaTVoaVNjUWxQMk1vTUxWMUgzY2k0Uk5mOExvSHdZdWtpYUVl?=
 =?utf-8?B?Z1hvUTBJVnVQdURXNDZWdUw5bzFrMDdRWk92aU80azZOS1pUalJqTmNqRVNy?=
 =?utf-8?B?MXVKQWtVRHoxenBxSmJsK0ZaUGtNdXB1NmxsWFdDMDFVbGlVUTNjczZPS0Zi?=
 =?utf-8?B?bU9GVEI1TnBjVFF1enFNbnNKNHRTckdkMFRVWFJaR3NPeWRsVHdVRS93TVlL?=
 =?utf-8?B?U3FGUGhiL0p1ZzhKRk1LcHpHMWh3Y0NVNHB1NXpSUHIzUXlaWklUU2xValVz?=
 =?utf-8?B?aXNRL0dyOEo4T3poS0VhRDZtemhTSnVvSzdMN0FESE5oVy8wcmVrVThydzRO?=
 =?utf-8?B?WVNERGk2eHJ2cm5lalhvVmxjRmJJZ3JmYWJydnh1UlA3YmpvTEhuamVKWnVB?=
 =?utf-8?B?Y1Y1NXdsWWZiUlNRZDlqRUVCY09WK3lqRGJoTkRMZzZ2MHMwY0kycEdZQVFq?=
 =?utf-8?B?UkVCdXN5aVQ0Z0N3SnZtNGtNUWxpQW1FQlM4ZDZTaXdZZlM3SlRlc1d1dEZH?=
 =?utf-8?B?aVN5THA1dzBLZVBmSG5NQjZIWktRS1ZwMzBnb0szVi9VZmFXSXA2V05remhi?=
 =?utf-8?B?eEMvU3VlbmM0R2VxZEg1NEtnM2E5bHU4L29zS2MxQUUvMVpWZEozREJKYXph?=
 =?utf-8?B?U3hWL1hiZ1RnMjA2cFpSMlprd0ZLNEY1NkVjZWVHRzFJTEU2Tyt1ZlY0U243?=
 =?utf-8?B?QlBKemZJbmNFUzJpVVMrR1pqV0s1YVVoV3BLRmFHVFF3YkVMSmsxd0k4dlVR?=
 =?utf-8?B?WFA2ZytOQndqRWo5T1F2VUcrNGZ1V0hMeWttTkNuQ2I3UlJFZEhqOFFnSW9i?=
 =?utf-8?B?WGQzVUcvbm1OMU1aNi9WNnZqWS9lc3J5MTlnOWpCWDJrVFhsakR5MG41MDBM?=
 =?utf-8?B?SUhRZlFQNkdJYVB0ZnVTNHZMbm5ZNlgzSW84bzYvWTgyaEJDQk83Z04rQVR3?=
 =?utf-8?B?VU5EV1lRSlhkaHVscGZ5d0J1bEljbEN6S1N3QllZWkpJSkp4UXJwMTBod0Vw?=
 =?utf-8?B?RVNTR1Y2NnVvN1o1bTRjKytrOHdiMjJMVndsS1RDRmQyTm5UdU1DWjZ1VTM1?=
 =?utf-8?B?SVZjekZ4TEUwZEJua2RKR2dZYTQ3NUFlbFpGUExuYWhzd0RwTVlYcDcvNG41?=
 =?utf-8?B?MWUwclNEaC9YakVJRzVaTVpjcVBpY25XQnU5QnVEK1Nsa3lJWEliUjNrTEFZ?=
 =?utf-8?Q?3d3AizwPaK95S8B3XuKBqQcvz8JtU+aAZr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23258b07-c2d7-4894-ad7a-08d8bca83c5b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 18:30:02.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /0yHpYGC+Bt6pqS+OTrl8hzeN2a1c9wcAL3xR4KKd6sdejvciRFU/M34cJWrQSLCBuPLmYpysF7IPiqtXovM1DX+qJ0wkMg3qwa2E3qDvds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

19.01.2021 21:09, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Split out non-recursive parts, and refactor as block graph transaction
>> action.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 79 ++++++++++++++++++++++++++++++++++++++++++---------------
>>   1 file changed, 59 insertions(+), 20 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index a756f3e8ad..7267b4a3e9 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -48,6 +48,7 @@
>>   #include "qemu/timer.h"
>>   #include "qemu/cutils.h"
>>   #include "qemu/id.h"
>> +#include "qemu/transactions.h"
>>   #include "block/coroutines.h"
>>   
>>   #ifdef CONFIG_BSD
>> @@ -2033,6 +2034,61 @@ static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
>>       }
>>   }
>>   
>> +static void bdrv_child_set_perm_commit(void *opaque)
>> +{
>> +    BdrvChild *c = opaque;
>> +
>> +    c->has_backup_perm = false;
>> +}
>> +
>> +static void bdrv_child_set_perm_abort(void *opaque)
>> +{
>> +    BdrvChild *c = opaque;
>> +    /*
>> +     * We may have child->has_backup_perm unset at this point, as in case of
>> +     * _check_ stage of permission update failure we may _check_ not the whole
>> +     * subtree.  Still, _abort_ is called on the whole subtree anyway.
>> +     */
>> +    if (c->has_backup_perm) {
>> +        c->perm = c->backup_perm;
>> +        c->shared_perm = c->backup_shared_perm;
>> +        c->has_backup_perm = false;
>> +    }
>> +}
>> +
>> +static TransactionActionDrv bdrv_child_set_pem_drv = {
>> +    .abort = bdrv_child_set_perm_abort,
>> +    .commit = bdrv_child_set_perm_commit,
>> +};
>> +
>> +/*
>> + * With tran=NULL needs to be followed by direct call to either
>> + * bdrv_child_set_perm_commit() or bdrv_child_set_perm_abort().
>> + *
>> + * With non-NUll tran needs to be followed by tran_abort() or tran_commit()
> 
> s/NUll/NULL/
> 
>> + * instead.
>> + */
>> +static void bdrv_child_set_perm_safe(BdrvChild *c, uint64_t perm,
>> +                                     uint64_t shared, GSList **tran)
>> +{
>> +    if (!c->has_backup_perm) {
>> +        c->has_backup_perm = true;
>> +        c->backup_perm = c->perm;
>> +        c->backup_shared_perm = c->shared_perm;
>> +    }
> 
> This is the obvious refactoring at this point, and it's fine as such.
> 
> However, when you start to actually use tran (and in new places), it
> means that I have to check that we can never end up here recursively
> with a different tran.

I don't follow.. Which different tran do you mean?

> 
> It would probably be much cleaner if the next patch moved the backup
> state into the opaque struct for BdrvAction.

But old code which calls the function with tran=NULL can't use it.. Hmm, we can probably support both ways: c->backup_perm for callers with tran=NULL and opaque struct for new style callers.


-- 
Best regards,
Vladimir

