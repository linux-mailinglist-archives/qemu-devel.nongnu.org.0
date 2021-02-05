Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6D310D9B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:07:51 +0100 (CET)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83eA-0003yA-Tl
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:07:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l83cl-0002zM-85; Fri, 05 Feb 2021 11:06:23 -0500
Received: from mail-vi1eur05on2098.outbound.protection.outlook.com
 ([40.107.21.98]:18817 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l83cg-0005CH-C6; Fri, 05 Feb 2021 11:06:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdNLUoAOL+9fWwvOLGIEGlJLe1TvJuFCIEJeuHRIVj6sQp0aNRSk87rQdQ6WB2CB8ZOEEAds8LoR4Ug2FsnP8pHcmnIeXjUc/kwonkGaXYw9jkbJLE7G7DPgruva58C1mfgHxdHRaoZ+Hxn3O3g+iGE43xH2rLYOESZ8P8zcA+ATb2dRsoH6DEUj6ERkCAnChFDNhQyAonffPEUUEAybQ+1V7Ibaih2MJZUoT2SsBIS9JO/g0DMR9yOrnPijlXxRwH5dwe79TARP5lMBGKMNrpXD8APfwndRg4UkBYDAEOd8t7zAmuz5QOQn6P+JyISRTSMFdpHJRlBC0HWe24J0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QII9fBwy9dg2YYlSOsN/jXDH7R4zkZaEQ8YcUUaeDgM=;
 b=Pkjjd/RrQBrhm2eYG78LuvT9vzdUwvseybSZNvVDF5kvNs1F+M3LYHMmvQIYfs5YiDKPV+sdk89sVkYsTQKHwjkJ+I8RZc2mh4hGfIyDhNn49u4Kw5eUWRXll3RMHBU2f3am4uZdM1ikklaBIpHyNALqmXGljgMMKjXYwJL40OZ/ONIetVHUuMXIQQpLGhPHMoz4b7+XDJTnFUwQloZ1BX1lHhLoKrZhZHuFmGOEjFHzfn3/I1VCvAHesik3HowNKQ1OCF6XHZTu1M/tdTd3QRGq63JDvZMguKvbF6lBTJ/3jKWMT1wlb3ecvnnWKJMU/fDaJBPIdlAXZz2kjPVHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QII9fBwy9dg2YYlSOsN/jXDH7R4zkZaEQ8YcUUaeDgM=;
 b=dN81JyCvcQA7Y3ivIeyapCCFukdfTbK7U31wOuSDxgAgqpHPdeix8CzRsGi5UwTAF/anarxWEF1ZAM0iGzCqSrGNBsF3s2pHJPcBkQWG3ATDCASNU6h4NEI7OOI8UTL2ITB4Mk/uIOQK2AD6gI4VHq3k9FNuGCZkdNLl0RzQVHM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:06:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:06:13 +0000
Subject: Re: [PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-29-vsementsov@virtuozzo.com>
 <20210205140028.GC7072@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9fe6a325-4af7-5d97-fc0d-06911f7c677a@virtuozzo.com>
Date: Fri, 5 Feb 2021 19:06:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210205140028.GC7072@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM3PR05CA0150.eurprd05.prod.outlook.com
 (2603:10a6:207:3::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.213) by
 AM3PR05CA0150.eurprd05.prod.outlook.com (2603:10a6:207:3::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 16:06:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f204e96-672e-43bc-643e-08d8c9eff581
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376C0250DD05CBD2A9FD676C1B29@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ENbT4/oPomIXdyXcq0uviWgRIfiV7j5Pmosm5qtmIYiUuYtdxMTTipm2JuPDHpbW3NSwkPUQaJ4tzcii8r0Kh+81NiCrYoMxIPR1QQDJzVpNSG0MUuvPaViTfIeSuFert7/UOTtOqUUbs9ryTKUKCpm+AoJ41GzvCs4pKjWl+VJBIxmWCIa2bvHhxkyx9MMaTJCDZW4J+/h0poQYESWB+4USUjmb8Y+CVzsiFoTkLi4Lku46baQCbMs7xXTYDeZwPqvESBUJ2l+KWhxw/RG5DUhm4T6/SqvXeC7xK3HfW/Btcr60xKd1Cq08XWIiq9VOQMh9CJybeabwHkSMfWjQYd1HXwvnET0zUKO4mH3NXORPNfYnFS7jdo7QMQQSvkLwc4bn9Av+X4efKIg2+hIPDD/rTVrHRJjz24aFsjzK0ri5VXh9iAjgJU0O4HMIizM6el4qz0cSWqlgJv8cdHZYRTHRucnO7mOaXVbmz8/06896hYtETCG58m4OxlpfmyHY0tc/gmqxOeErWNIVI+M6TrWis21eACHThnNwKHp+5QHPErimwBYj9sFHovRWvWJhkacbL1Gt6H5MaPft2k2y1JbRmWW3v/0zEpsAvbAdnZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(396003)(346002)(376002)(366004)(86362001)(8676002)(83380400001)(36756003)(6486002)(8936002)(66556008)(66946007)(31686004)(2616005)(16576012)(4326008)(16526019)(956004)(107886003)(478600001)(186003)(5660300002)(2906002)(316002)(52116002)(31696002)(6916009)(26005)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VFRGUW1zSm13YWhIbGR6WkwrcFNqMW9sUVpPSWxjbmxFYjhDV3crR1oxOXkv?=
 =?utf-8?B?Zk5ndU5XdWt5ZGlBVkxTOURRRzNQSlRxOUxuY3hyYldSYmFrUHR2ckxBVFJj?=
 =?utf-8?B?VU4zZnpRcGx3bGFUblR6eTA3QlhjekZ5bTdiNmhvRXgxTWxXdk8zWElZUXc2?=
 =?utf-8?B?ZSs2cXJTVjFsd0dFOHYwZ29jdTlHTzNZdmJGcTlHZjE5WC9uSHdXSlF2MzNJ?=
 =?utf-8?B?YVdNU1lNb2ljYk9OM1FraFBOVFJpWHM1UzUvWHBnM3lhUDc1NXVmaEdsRHhz?=
 =?utf-8?B?WlJIRGpmZzA5enN6ZmpsYU9hRFBUOWhhaDhLb0xvZExMOXB0ZTBXaGhxZ1lh?=
 =?utf-8?B?UkhreG1lVnNjeitTUFRXUkFpd1BDQXZ6d1g5MjhadGJxQzh0N0Ewd2NXNmFQ?=
 =?utf-8?B?UWVGemdPc01mcFFkQ0hGR1lKYzVSdTNCTStJdFlOclJyK3MxYkNnTHU1Sm9L?=
 =?utf-8?B?cWthSUpSOE9pTUtIbXo2MWQwdnFFbjg4L3FKdnJoa2Jkdk9jSnJ3WGtMVjMz?=
 =?utf-8?B?d3pEVllVSk1YYUc4MUhoVUYyb25rMno3OExVYUpxUGFQQTRSV0FEU3p3R3Vm?=
 =?utf-8?B?alY0Q01jYXVhVVN4UXRvMEVLNEZONWczbC82UUowTzhhZjFuYUJqYlNjVWx5?=
 =?utf-8?B?V0lCU0dIdXlCSkM3TGZzM2pkT2pFcG1zUjlXWUFWdGJQZUVhbFc3V01mQTYw?=
 =?utf-8?B?OEJTT1FHY1hHQVlUenhFV0pzU29qeE5MVnBzbGZOdzdyV1JhWUZXVUxtYnho?=
 =?utf-8?B?eUlzekM5bTV6OENDbDZjN3l6RGgrKzlMUzdjbHRrNXNGcVdxR0pUY2ZvL1VJ?=
 =?utf-8?B?VFUrM0FuSU5USVBrTlJNYXdqMTBrWlZ6U08wdml6alg4TG11ZVdlWDdTdXhO?=
 =?utf-8?B?d2xFWklvOS9HRFRzZWJsYXZCc1VBV2RCSXNxazk5dVVzcVJ1Yy91ZUE2ZERt?=
 =?utf-8?B?V3FveU9NS1ZKL2lSN2VSYnA3UEU2Z1JQaG4yOGE1Q0U5STQ0NXo3K3NPUWdY?=
 =?utf-8?B?b3E3TXZMN3pnRzFYdy9jSmRON3lkMmdleVA2ZFlwM2RNMjBFOHhnZlUra2pk?=
 =?utf-8?B?YjJCbHlGa0lKMmJrWFZNZ0lybE1vNDEwU2kwUE40S0x0QjZxMUwvU1ZaSzJP?=
 =?utf-8?B?cnNhRWd5b0pwVkZJZm03bTEwZVVCNzNJN0hzd3BsVUVMb0ZQbmtXYnVwNjhx?=
 =?utf-8?B?MDhDOFZzS3JvMTRFLytIOHZxUmt0RG9ZWVJkMFc4b011Rk0yY3Y3SU40M2xp?=
 =?utf-8?B?UG9JZWJWRmpRdlIyM014Z09IUjR6SVpFUE1HTGpmZkMzSmhuaW9lV1lQU2Y2?=
 =?utf-8?B?OWxNUlpmYWh5NXFZUUlqU0ZIaUhOQTZpMWRlUS9DOFZsZlVEMEQxU0VkYnlZ?=
 =?utf-8?B?WVFGanZRaDh6NWVuSHJZUWtkQk5xbkhOMERmOE5TaTVWYnplcHJHV1c0aW5V?=
 =?utf-8?B?dUxzaVExYXNuL2hQVTU4dmJ3UVFpYTB6Z1Vxc0ZuaG5TZStGaHdjMmZDVTNP?=
 =?utf-8?B?cXR3U3hOWVJlVnI2TUZEd0ZzZHlDRUpWY1FvajVBVXdmaDJZY2JYR2lzaWtK?=
 =?utf-8?B?Vkd1RU9Mdm42V3Iyb2luZHN5aE5NNjlCcWdFOXdFamJ3RUdBTGM2cXNlY0Uw?=
 =?utf-8?B?RzZwa2dYNUt2VXFXTk9FZWpJMi9OR21FeGtQbEV3cnJ0aHZFdVgvMG5OcjRo?=
 =?utf-8?B?MFBsRER0cDJtNFU2Tzlvb2h5WE1Rci9ocHJ4YjdTQTdXWnhJcS9DOGZ3c1Bi?=
 =?utf-8?Q?8CMv99z1jTPwpt5DEaHjPNdtYR1ahLoWG0/EMu0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f204e96-672e-43bc-643e-08d8c9eff581
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:06:12.9176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3HqpU8+s4CrGNGPelPBeVhiZtgbILsifgCffuw5a/hbK17I9JH9CDLAKpNvmSIWfeumxXsLyr4BLy2DGeuws7Kw4AAYJCJBYT8XduQ88+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.21.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.33, RCVD_IN_DNSWL_NONE=-0.0001,
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

05.02.2021 17:00, Kevin Wolf wrote:
> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Split out no-perm part of bdrv_set_backing_hd() as a separate
>> transaction action. Note the in case of existing BdrvChild we reuse it,
>> not recreate, just to do less actions.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 111 +++++++++++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 89 insertions(+), 22 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 54fb6d24bd..617cba9547 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -101,6 +101,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>>                                       uint64_t perm, uint64_t shared_perm,
>>                                       void *opaque, BdrvChild **child,
>>                                       GSList **tran, Error **errp);
>> +static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
>>   
>>   static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>>                                  *queue, Error **errp);
>> @@ -3194,45 +3195,111 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
>>       }
>>   }
>>   
>> +typedef struct BdrvSetBackingNoPermState {
>> +    BlockDriverState *bs;
>> +    BlockDriverState *backing_bs;
>> +    BlockDriverState *old_inherits_from;
>> +    GSList *attach_tran;
>> +} BdrvSetBackingNoPermState;
> 
> Why do we need the nested attach_tran instead of just including these
> actions in the outer transaction?
> 
>> +static void bdrv_set_backing_noperm_abort(void *opaque)
>> +{
>> +    BdrvSetBackingNoPermState *s = opaque;
>> +
>> +    if (s->backing_bs) {
>> +        s->backing_bs->inherits_from = s->old_inherits_from;
>> +    }
>> +
>> +    tran_abort(s->attach_tran);
>> +
>> +    bdrv_refresh_limits(s->bs, NULL);
>> +    if (s->old_inherits_from) {
>> +        bdrv_refresh_limits(s->old_inherits_from, NULL);
>> +    }
> 
> How is bs->inherits_from related to limits? I don't see a
> bdrv_refresh_limits() call in bdrv_set_backing_noperm() that this would
> undo.
> 
>> +}
>> +
>> +static void bdrv_set_backing_noperm_commit(void *opaque)
>> +{
>> +    BdrvSetBackingNoPermState *s = opaque;
>> +
>> +    tran_commit(s->attach_tran);
>> +}
>> +
>> +static TransactionActionDrv bdrv_set_backing_noperm_drv = {
>> +    .abort = bdrv_set_backing_noperm_abort,
>> +    .commit = bdrv_set_backing_noperm_commit,
>> +    .clean = g_free,
>> +};
>> +
>>   /*
>>    * Sets the bs->backing link of a BDS. A new reference is created; callers
>>    * which don't need their own reference any more must call bdrv_unref().
>>    */
>> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>> -                         Error **errp)
>> +static int bdrv_set_backing_noperm(BlockDriverState *bs,
>> +                                   BlockDriverState *backing_bs,
>> +                                   GSList **tran, Error **errp)
>>   {
>> -    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
>> -        bdrv_inherits_from_recursive(backing_hd, bs);
>> +    int ret = 0;
>> +    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
>> +        bdrv_inherits_from_recursive(backing_bs, bs);
>> +    GSList *attach_tran = NULL;
>> +    BdrvSetBackingNoPermState *s;
>>   
>>       if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
>> -        return;
>> +        return -EPERM;
>>       }
>>   
>> -    if (backing_hd) {
>> -        bdrv_ref(backing_hd);
>> +    if (bs->backing && backing_bs) {
>> +        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
>> +    } else if (bs->backing && !backing_bs) {
>> +        bdrv_remove_backing(bs, tran);
>> +    } else if (backing_bs) {
>> +        assert(!bs->backing);
>> +        ret = bdrv_attach_child_noperm(bs, backing_bs, "backing",
>> +                                       &child_of_bds, bdrv_backing_role(bs),
>> +                                       &bs->backing, &attach_tran, errp);
>> +        if (ret < 0) {
>> +            tran_abort(attach_tran);
> 
> This looks wrong to me, we'll call tran_abort() a second time through
> bdrv_set_backing_noperm_abort() when the outer transaction aborts.
> 
> I also notice that the other two if branches do just add things to the
> outer 'tran', it's just this branch that gets a nested one.
> 
>> +            return ret;
>> +        }
>>       }
>>   
>> -    if (bs->backing) {
>> -        /* Cannot be frozen, we checked that above */
>> -        bdrv_unref_child(bs, bs->backing);
>> -        bs->backing = NULL;
>> -    }
>> +    s = g_new(BdrvSetBackingNoPermState, 1);
>> +    *s = (BdrvSetBackingNoPermState) {
>> +        .bs = bs,
>> +        .backing_bs = backing_bs,
>> +        .old_inherits_from = backing_bs ? backing_bs->inherits_from : NULL,
>> +    };
>> +    tran_prepend(tran, &bdrv_set_backing_noperm_drv, s);
>>   
>> -    if (!backing_hd) {
>> -        goto out;
>> +    /*
>> +     * If backing_bs was already part of bs's backing chain, and
>> +     * inherits_from pointed recursively to bs then let's update it to
>> +     * point directly to bs (else it will become NULL).
> 
> Setting it to NULL was previously done by bdrv_unref_child().
> 
> bdrv_replace_child_safe() and bdrv_remove_backing() don't seem to do
> this any more.

Hmm, yes.. May be we should move bdrv_unset_inherts_from() from bdrv_unref_child() to bdrv_replace_child_noperm() ?

> 
>> +     */
>> +    if (backing_bs && update_inherits_from) {
>> +        backing_bs->inherits_from = bs;
>>       }
>>   
>> -    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
>> -                                    bdrv_backing_role(bs), errp);
>> -    /* If backing_hd was already part of bs's backing chain, and
>> -     * inherits_from pointed recursively to bs then let's update it to
>> -     * point directly to bs (else it will become NULL). */
>> -    if (bs->backing && update_inherits_from) {
>> -        backing_hd->inherits_from = bs;
>> +    bdrv_refresh_limits(bs, NULL);
>> +
>> +    return 0;
>> +}
> 
> Kevin
> 


-- 
Best regards,
Vladimir

