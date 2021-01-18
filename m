Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6FE2FA788
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:29:08 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YKx-0004Rc-4f
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:29:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YIH-0002b3-GV; Mon, 18 Jan 2021 12:26:21 -0500
Received: from mail-eopbgr60120.outbound.protection.outlook.com
 ([40.107.6.120]:58021 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1YIC-0004Rf-Me; Mon, 18 Jan 2021 12:26:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6qWO2z8QjpVuGzUhnGmp28WMPZgdZrlEI1G+JGNxoNdaQds26XfqdCPpgt14+29+5ZZL1t4qR4MVVOgZFYB6U4L3m9AAz/ZXxPg+OPj9N3EUZXSwffGV8YCDK/YosKonbH+QtkeczQiPjZKyreEr2crAy8452CVvSEuv5k4TZdEhCYkxgeXhMR/vZPgTj1/YjfW82iMDWm/FGaZEwqdP+otxW59Aap1PD4gBT0+Q8iifH3VmFqrfd5cpwp2OJfotvofJCGvjJdu/ktBEHxB0+2vrWQxscYiKe9PcbaAeYqykcEulc3HKxo2IDjULVLpaS23Iprb/y7E371eQ5aj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ziz041TR85uDg+PjneX9aey1FylKgiqPwqSxQaqDFaA=;
 b=E4Y6ocqEWuFYzDpvTO4n+dcC2ImVc+YrgmwNi0JkRfOAFX5AExPxtBurb0b4Yq3cuzvLbpTbbz33Yco5pO2yVBfWBE6R+XdgbFx9art32PaYipgr6v6MYWoGsrFlhzzfUKxTQS+joawE8xvn8iVUOmDGlGRQ1esordo5XPP1SsaoeeSAyod394rlVr9GA+v9iyJqmZ9YL/wRRT1Jzh+CY/awoBp8R1XocxwEOC3SiVlPf9NkJz71hM3PnkJPRShWNioaGdye2ve6LtzsXI5yYXzYohtOCVdUBborJMp958R7jnAPN2eaj99Nrb8kGdBWE93Rv+aayAQTIif3i6pN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ziz041TR85uDg+PjneX9aey1FylKgiqPwqSxQaqDFaA=;
 b=q2ZiZh0TElGoWaFSjEKJLlcmYqNCmma6/2dNGWJ9CBRp7HKbWv52VJHyPzSkU3fgFnUu4vLyzbE9FrZNZvOJX0oduNQ+Dz9R5npNfMjAOHNZOoq+9TjopKVbzCysUoFJR95IvNxGLGRCCfl9xJxS0qBGIK0Ia7uVfNGqzogk4Js=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1908.eurprd08.prod.outlook.com (2603:10a6:203:4b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 17:26:12 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:26:12 +0000
Subject: Re: [PATCH v2 05/36] block: add bdrv_parent_try_set_aio_context
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-6-vsementsov@virtuozzo.com>
 <20210118150819.GF11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <61df94ea-31eb-4e5b-d1d8-1efcc4a3a636@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:26:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118150819.GF11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: AM0PR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::49) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 AM0PR01CA0144.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Mon, 18 Jan 2021 17:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01fd6e31-0245-4914-eefa-08d8bbd626f5
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1908:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19085F431E00877844A99C95C1A40@AM5PR0801MB1908.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJ2e8dKFmSq0bRWYwZ2Es1oGYSG9abOUvyxRC/otbsDMoUI/uAbBFOhrb0zdojGWrtBlkk0ZduNHrXgwTKYzio+Bji5GYprxXYAskAryR6KX93MbH4AU7EOhA2U9gk0oE7Zu7AarytUIPe33AyWKlj+x/WYopREsLBSiDRzZe2UGUM289lWBozvu4eP5hIZg8hKeK21BGpXDgJq7XFOKqpXOK/IUgufrI4vsqN9GUmm8uKqJkchjXH8MNnBpjCeLNudpEqwXXAXMeyIeWwPHK7QZ5m2dCaCHpBB+lqkg56QWSoeo89dKLpGnFcilK8NZ3CoySPCkN2JiJT67OtewPsmGQ457BxHtXKruZAN8p0J1m5T5aKN4PKyAyWbJsKeXjcoJ4IEoqtWr/9eGqyynav2excgAmZ/V3YaUF1IAICaL3492wN8mwy62W7H/QOBM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39830400003)(16526019)(5660300002)(26005)(31686004)(4326008)(6916009)(478600001)(186003)(8936002)(16576012)(66556008)(66476007)(66946007)(86362001)(6486002)(316002)(107886003)(8676002)(956004)(2616005)(2906002)(52116002)(36756003)(31696002)(83380400001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y0VpTEx3ZGpSYnpJM2Fia2k0blZYREdOaDhzQlJRVG1BUlEvUURxbGdQbkUy?=
 =?utf-8?B?Vlo0YTNjcHEvbm12SGFmZDRzWVpocmoveFFodFpTbWtrQ1hHT0RCM2p2YkJz?=
 =?utf-8?B?YnFEU2l1eVFUQ3AwMEtkZjkvNkE5WGFJUFhFU0l4QnowYS9waVlEUGlTeVFY?=
 =?utf-8?B?OXRhQlB1dXh1akhscVlFODR5c0srR3Rtano0c0FWbHRpOGtnbUpKNVdnY0VO?=
 =?utf-8?B?T3NtdEFIWTl3RkFkMmljSll5a1VYd3F4ZFZSeXlKeGRobCt4SnpXaTAzNVFZ?=
 =?utf-8?B?aGM5bUNYbGszM2pNZnpLTFdGSWI0bXNGZCtZcGxGMFY1M1VvVmlOOE56VTY0?=
 =?utf-8?B?STBaWlJUM1RZRjJFenZZdUdIUTlORHhuM05uZ1VGY21rNFhhY0o5WE5aeEVO?=
 =?utf-8?B?VjRxMTN3ZG5PLzZpTVVyU1N0SmJFM251NFF2bklXUUl3TnFiOGdDSm9IQzZR?=
 =?utf-8?B?eW5WTkN1aTNXaDd6ZzludktQeU1LUGZydjUzL3AycXFtdGFyRWlhMUdoc0R1?=
 =?utf-8?B?TkdTTGlVRDViZmpHTTcxbGZQY1JCZGFQTnZHOXJocXZZM2c1bWZqdFRhM0Zw?=
 =?utf-8?B?cWI5M0dDbUhBdW5RcGY2QnR3N2oyU3lNSEgza25OeHZUUm41Ym5qNTArUVYz?=
 =?utf-8?B?L1VWaGRZMHBTQUZhUzZZV1M4V0tES0N3OXlkQnpLQ3dkZ3lybTduaU4weUdh?=
 =?utf-8?B?UHd1enREeWp6Tk8yNUJRVzBlcmViVStvWW40MiszblF4QzNjOVlEcitYeVpn?=
 =?utf-8?B?LzFvWTFGdVByb2p4SE9tcVFOTUozTEY2NTRWTFRLZEUzU0wrTVc1YUk0T1Qr?=
 =?utf-8?B?bndXeWh4OHc0cnZlSHlXeFY4dGlTbEMwdDdFTDhzRHh2SnBjVmZldTE0R1Vo?=
 =?utf-8?B?ZVJJRFpSMG9LeGEyRitVV2FjVjhTTGI2ODhhbzl0VVg0QkhoaXNkWnpVbEVo?=
 =?utf-8?B?NzVHVjM4VVZXbVlKYk5ocW9WZ0ZYeU1rdDZwemRMZTdDVm44TXhlTjBGSWVl?=
 =?utf-8?B?NVFJK2Q5aE5aTmhRbVZZZnlYKzVqQ1IxWVlRUzgybHdKbmdabTcyVkx2T1ZG?=
 =?utf-8?B?Zk9tbW5SaytiTTNhakhxQ2FvWmpvTDJPNFJCS09kL2EwNWRra0NwUzlpSi9j?=
 =?utf-8?B?N1N4eE9BTTJVM05OOG9yL2FDNjFleWtxcC9rTVJXUVJZSi9WZVhVSDU2dTdQ?=
 =?utf-8?B?RnhIaTZYTS95b213NlNQYUFsb3A5c3NHdmZKWkgxbVJZMG9jeFdEeUNtbnhs?=
 =?utf-8?B?dGoyeERCa2NoMkt0VTJrL3BPT2xjSEJTc0NOMXJza3VtdUpIMHo5YkxXZ3lu?=
 =?utf-8?Q?FSDslMiCXSS6/e2kLS+S/UigfqBTJrIx3f?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fd6e31-0245-4914-eefa-08d8bbd626f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:26:12.6366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qYNGX1vjLYFkESA5qKWoiCMZu/Jg/tBotPaS43OjgyawkyApply/7mFbAV8LIGjpvwRRr6LRT7eawEKnC4QJaxyLEZNVpcyJ8rpgUUOLs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1908
Received-SPF: pass client-ip=40.107.6.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001,
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

18.01.2021 18:08, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We already have bdrv_parent_can_set_aio_context(). Add corresponding
>> bdrv_parent_set_aio_context_ignore() and
>> bdrv_parent_try_set_aio_context() and use them instead of open-coding.
>>
>> Make bdrv_parent_try_set_aio_context() public, as it will be used in
>> further commit.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h |  2 ++
>>   block.c               | 51 +++++++++++++++++++++++++++++++++----------
>>   2 files changed, 41 insertions(+), 12 deletions(-)
>>
>> diff --git a/include/block/block.h b/include/block/block.h
>> index ee3f5a6cca..550c5a7513 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -686,6 +686,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>>                                       GSList **ignore, Error **errp);
>>   bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
>>                                 GSList **ignore, Error **errp);
>> +int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
>> +                                    Error **errp);
>>   int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
>>   int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
>>   
>> diff --git a/block.c b/block.c
>> index 916087ee1a..5d925c208d 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -81,6 +81,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>>                                              BdrvChildRole child_role,
>>                                              Error **errp);
>>   
>> +static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
>> +                                               GSList **ignore);
>> +
>>   /* If non-zero, use only whitelisted block drivers */
>>   static int use_bdrv_whitelist;
>>   
>> @@ -2655,17 +2658,12 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
>>        * try moving the parent into the AioContext of child_bs instead. */
>>       if (bdrv_get_aio_context(child_bs) != ctx) {
>>           ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
>> -        if (ret < 0 && child_class->can_set_aio_ctx) {
>> -            GSList *ignore = g_slist_prepend(NULL, child);
>> -            ctx = bdrv_get_aio_context(child_bs);
> 
> You are losing this line...
> 
>> -            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
>> -                error_free(local_err);
>> +        if (ret < 0) {
>> +            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {
> 
> ...before this one, so I think the wrong context is passed now. Instead
> of trying to move the parent to the AioContext of the child, we'll try
> to move it to the AioContext in which it already is (and which doesn't
> match the AioContext of the child).
> 

Oops, right, will fix

> 
>>                   ret = 0;
>> -                g_slist_free(ignore);
>> -                ignore = g_slist_prepend(NULL, child);
>> -                child_class->set_aio_ctx(child, ctx, &ignore);
>> +                error_free(local_err);
>> +                local_err = NULL;
>>               }
>> -            g_slist_free(ignore);
>>           }
>>           if (ret < 0) {
>>               error_propagate(errp, local_err);
>> @@ -6452,9 +6450,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
>>           if (g_slist_find(*ignore, child)) {
>>               continue;
>>           }
>> -        assert(child->klass->set_aio_ctx);
>> -        *ignore = g_slist_prepend(*ignore, child);
>> -        child->klass->set_aio_ctx(child, new_context, ignore);
>> +        bdrv_parent_set_aio_context_ignore(child, new_context, ignore);
>>       }
>>   
>>       bdrv_detach_aio_context(bs);
>> @@ -6511,6 +6507,37 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>>       return true;
>>   }
>>   
>> +static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
>> +                                               GSList **ignore)
>> +{
>> +    if (g_slist_find(*ignore, c)) {
>> +        return;
>> +    }
>> +    *ignore = g_slist_prepend(*ignore, c);
>> +
>> +    assert(c->klass->set_aio_ctx);
>> +    c->klass->set_aio_ctx(c, ctx, ignore);
>> +}
>> +
>> +int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
>> +                                    Error **errp)
>> +{
>> +    GSList *ignore = NULL;
>> +
>> +    if (!bdrv_parent_can_set_aio_context(c, ctx, &ignore, errp)) {
>> +        g_slist_free(ignore);
>> +        return -EPERM;
>> +    }
>> +
>> +    g_slist_free(ignore);
>> +    ignore = NULL;
>> +
>> +    bdrv_parent_set_aio_context_ignore(c, ctx, &ignore);
>> +    g_slist_free(ignore);
>> +
>> +    return 0;
>> +}
>> +
>>   bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>>                                       GSList **ignore, Error **errp)
>>   {
>> -- 
>> 2.21.3
>>
> 


-- 
Best regards,
Vladimir

