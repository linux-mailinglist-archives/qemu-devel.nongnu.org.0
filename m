Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D5337CB4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:33:53 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQ88-0002sz-DK
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKQ3f-0000nc-Hn; Thu, 11 Mar 2021 13:29:15 -0500
Received: from mail-db8eur05on2099.outbound.protection.outlook.com
 ([40.107.20.99]:56417 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKQ3a-0003u8-Se; Thu, 11 Mar 2021 13:29:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/dhuyLJJabo3mQwjDlHM5qhZ7TN1iUJfsAlQcwco6Hjj3Bqljyk1KWoohz9x4CJ/F3S72R/si3MrNMEAa8uavVxx68ityvgWTz18L2v+19AaZEdAVbt+lylDnGA/6YaLrzYRWf0v/nGD/IEmUaXGh0bSbzYVOi7MGf1UlSekhydUgofAwY6o9/qB9VeogQo7Whne5f2zlnfZQU1VC/UIHv42OKG9Sc/mOPjW4QSKnXJLG+g7YaGzL6qEp7DXXMBOtoe5O4VzUp8OFxl+1JrGAjfACq7YbER4tXNzsJII3IhIV1QruTxCBJ+OxDf12jbNsc2ynTVNhSMlForfyILKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkvQQcWb8uykq49wTmisPjafJr5r/3CyfRuqv4mK/FI=;
 b=UJNBEf0TI1u8f6n4vgZ1vvXAr+m1ei/0WBkCJabhU+AtFBkI4aqDtYrTprAyOtE2MbeVZNbCRxzDOb+uBc2nZODkXkBS/h/CVlfL5qLKqm87siZgpVQww0/hs+HdstzLqApjODbYkiSEIwBzVvmijBqFsjiaH4EsQoA4Fhi9wXhbJaFtufVcHj35j8WF5tcp/UMXciUEsR1hsnFcB/Bb6MptO4ptipCFMlCom6DtsbMKyN0RC4qRgY+DbwuxfGz43OKXggz+jUrHPZwhRyV3qunYT90YW31Ordg1F8ZSKgz0o6zl3Cm0FQFIuXZHX9vmu5mEBnkJtmJK5vep5gnb2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkvQQcWb8uykq49wTmisPjafJr5r/3CyfRuqv4mK/FI=;
 b=ZU5LO2kNUzXQvLh1j7Y0D4UZMKU9sa6/RqQyXMpcgGQnGaWrE3bFv1VcVTMSRfZpACFNICY4j6hHtV7fdctjPXpqSAEAOv8NsUlS2eD68GkrsN61MXLHbz+b0zHAQEZn8skBH2TNk/xoDI/u/FOum9rlUAw8YWc2lNX3fHP5dCo=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 18:29:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 18:29:05 +0000
Subject: Re: [PATCH v2 28/36] block: add bdrv_set_backing_noperm() transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-29-vsementsov@virtuozzo.com>
 <20210205140028.GC7072@merkur.fritz.box>
 <9fe6a325-4af7-5d97-fc0d-06911f7c677a@virtuozzo.com>
 <20210205163029.GG7072@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5d9e5b3b-1d12-f9fd-d421-a406cea9a6a7@virtuozzo.com>
Date: Thu, 11 Mar 2021 21:29:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210205163029.GG7072@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0075.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR01CA0075.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 11 Mar 2021 18:29:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11500c66-8110-4dcb-d519-08d8e4bb8d2b
X-MS-TrafficTypeDiagnostic: AM7PR08MB5495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5495FE1320E6FE70FB32C33DC1909@AM7PR08MB5495.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uT05qXsriKn6WBd8NqL8odzaMp54wKdCXwhVU7EBIeO/buj3ecvqrSUE1udYt535XBwbH5c5osMMiGUk6kpq6bfPCshS8dozwyoXGVahAGP9Jw7ctpMIhVoAW/3lVjqu97OeMnO5wfCdfeLIYgZgXBHaYxqsHqdrAD5zRMli2e3oDicg2XI7FY9Ot9UthJxdhEyR70br6u4JVMg50J83hoI37cRBs6kk5OM0PLWEOc2VloLNI7IoS6f3WJCGISPYJ1KwCcgaZkUstq9n6Pniw8Xni/7x2slhjh6xZGoKEoqDwZ+NbyPgaV6vpAawvXL3pKVRb0fNH7pp+lyvMofGD42yvUFGK5M0m6EqgszbquvhNKHVlt5kSl05wq8pOtH5MaZm5ZIldoc7TgzQ8MwU4hLwh3exMnqdrpu6t4Gi+bjsiFi7dxenEImnYIp+Dy0vik+hXPuumjoTFCCrHfWGZjXzvfmgbVUJdDcC/31Uoyr/ZmdgB8G6hYUDx9h3e5gymhHagKhRNi+ftMuUpdDTNGReLWgGVYFwRtaupiDmggD6+sG8e2jVjzBM8J7URpVSu5uMQCdELAgLFbqEbl+H0GYB48xLuGQ+MhH1LSUqpgmkuGBgbjYhtiq1P6GINayI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(396003)(366004)(376002)(6486002)(107886003)(316002)(16526019)(8676002)(956004)(16576012)(52116002)(5660300002)(31686004)(86362001)(31696002)(2906002)(66946007)(66476007)(2616005)(83380400001)(8936002)(36756003)(6916009)(4326008)(26005)(186003)(478600001)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGlwRE1PbVZDVXVhbDIwQ1cwSHlKeEVveDNsSFhFZ3pJbGV1c25uOG9JV1U2?=
 =?utf-8?B?ei9hYmpHeG9DQmlWM3MrRGRNYjJEcGtvZWJPVU1EK0NpUmNranJidXRURUxr?=
 =?utf-8?B?cXl4Z3B4YW8zV29rREVxcS90VUJEMmRSUFlnTkhVNW0xZ2RwNzVIVjVBVTdV?=
 =?utf-8?B?UFQvZlRVUGhSdWtqcmNqcmtzVE90bXZ4OGxlcHN0VW5NM1RhQXJLYStycENj?=
 =?utf-8?B?Zko1S2ZVdEJ2TjhRVERxRE5XL2N3Z1FXcW5lRkpCcSsyK0NNOFI1NHl0cjA2?=
 =?utf-8?B?VmcvL1FpalZjL0pwNXFIWURpbkFYdlN0eGEyZlN6dU9nTW42ckpZcnY0UkY0?=
 =?utf-8?B?aEU0WVR0U1Y1eTdVems3YWpjZHVoQzhVMnpWUGt6ME54b0N5Q0twYjVQMmtp?=
 =?utf-8?B?STRKMWQ1RmdSOTJtWldRd2dxODBKVXFqL1RvNkhURk1XT1J3alZOSWFIdzJt?=
 =?utf-8?B?d0hsTEV3RnpPTS9wa1BUTGdQMnB6OTNHNFJPUHFpTXlXbStIZkZ3N1dOVUpo?=
 =?utf-8?B?TjM0cTNMSkRZQVhYNkwxV0NESld4TEpLbEVVblRMS3dzWlJuTkptWWZaRXht?=
 =?utf-8?B?dFhmSXJBREp4dUtERENDa3E1WWdnd1NNbmxnVXFQclIvclIzbzBHdmJPUnRE?=
 =?utf-8?B?NWFSUzh4VmlqMUxxR3hMRGNNS1I0TFBuSmRRYS84SzJBV0g1cFhvbHdnSElm?=
 =?utf-8?B?KzhEQ3BSSTlhNmsxQm5ZRStpVVdqOUZhVnl2ZnFUWkRDRVRqSEJHdmxIZXpT?=
 =?utf-8?B?akFlTzlLK21kZ2ErU2JndWNZRmxpZ2RmVlgzdHFPU2VTRzFsL042Qk5OVkNm?=
 =?utf-8?B?dmdhVXVYaXpKMURHKzc2RGROSisxSytxczBDREgxQUdmYTFrU0FTYm10MHhp?=
 =?utf-8?B?WitjVnFHT2hCYXJWdWYwYVg4OER0djBrWVpXeVlSRlc4bkVDbFRBKzh2NWJl?=
 =?utf-8?B?STRJZURWQzcreUx6N21DeVpwcC9yVkFFOUQ1N3NTaFBHUDBmRkxhV2xxWkxC?=
 =?utf-8?B?WGQrVzlTUk9WYkdXMkpTNENEMkRSWDZvNWp2dC9JTU9rV3YrZThWV0YvSUpH?=
 =?utf-8?B?enF4ampNanRjOHZTdUVEaGZmS0pjWTh3R2Era2JjT0tTbVdIMHFORFF6WStl?=
 =?utf-8?B?dDZMSlI1SjNLSGNjMnNrK1dwdUtCS0NwcnlaS3pqc2FtbXdKSlVoa3Q3MGFq?=
 =?utf-8?B?NTJvWjJRVVFkRTRrUzB5WnZMR1VzRDlXUDM2UXZOb1c0Mko2c0FYRnBhVXIr?=
 =?utf-8?B?QWhWdmRNZVc1MURYaU05aGU1d2lqYlBldUpidVJZYUZqWDJjV2JyZWR6WW9z?=
 =?utf-8?B?ckNCdlBHZDhMYk8xYUFxcm1zREpyV2N5cC9OK3pTZXY0L2hlOFVITHZ6OCtS?=
 =?utf-8?B?MmhZdE85djlWY1lEOVo0b0F4NmVnVU56TU8vZDBFSE11akwyeTZOczFGWk0z?=
 =?utf-8?B?MVRrMVpMZ2NTU0tTSVZ0ak9xMzBQSHloa2ZBSXd5S0tqeHRYb1pXMUhoaDJo?=
 =?utf-8?B?aENCUDIrQzgyc1FtRlFDMlBlOThLOVlCS2taT0QzbnBGeU5Id1IvdnEraXha?=
 =?utf-8?B?b0dNRHNIV3dVWEJuWlU1VFNla25abXd1R2Z2M0NiUEZXVisrK3ZScFVrZkRx?=
 =?utf-8?B?K2wzMGVaSHN2WXh2YkttQ0RBUktndmJXcEpRSFBtVlJHNEJ6Q1k3bk8xYlc4?=
 =?utf-8?B?Y1lkbGdWTjlIRnFBUHg1cFV2anVrV1cxUlZVakJVdUFNcWJDY1hIS2RQd1o1?=
 =?utf-8?Q?GfEP1O+8Pn1KCijB/nPeNGn9IAkMWw/MPZSNMle?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11500c66-8110-4dcb-d519-08d8e4bb8d2b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 18:29:05.5066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/KtF+w+Gc44epTH/DWSuc1jM8b5qjL8C4fPRcvryhOShAUUUpzHxX9GPa5m0MMTSJBhjt70RvS6qCM/hp1ES/pdc/dS/eGlH1iwRlAnvlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495
Received-SPF: pass client-ip=40.107.20.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

05.02.2021 19:30, Kevin Wolf wrote:
> Am 05.02.2021 um 17:06 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 05.02.2021 17:00, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> Split out no-perm part of bdrv_set_backing_hd() as a separate
>>>> transaction action. Note the in case of existing BdrvChild we reuse it,
>>>> not recreate, just to do less actions.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block.c | 111 +++++++++++++++++++++++++++++++++++++++++++++-----------
>>>>    1 file changed, 89 insertions(+), 22 deletions(-)
>>>>
>>>> diff --git a/block.c b/block.c
>>>> index 54fb6d24bd..617cba9547 100644
>>>> --- a/block.c
>>>> +++ b/block.c
>>>> @@ -101,6 +101,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
>>>>                                        uint64_t perm, uint64_t shared_perm,
>>>>                                        void *opaque, BdrvChild **child,
>>>>                                        GSList **tran, Error **errp);
>>>> +static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran);
>>>>    static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
>>>>                                   *queue, Error **errp);
>>>> @@ -3194,45 +3195,111 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
>>>>        }
>>>>    }
>>>> +typedef struct BdrvSetBackingNoPermState {
>>>> +    BlockDriverState *bs;
>>>> +    BlockDriverState *backing_bs;
>>>> +    BlockDriverState *old_inherits_from;
>>>> +    GSList *attach_tran;
>>>> +} BdrvSetBackingNoPermState;
>>>
>>> Why do we need the nested attach_tran instead of just including these
>>> actions in the outer transaction?
>>>
>>>> +static void bdrv_set_backing_noperm_abort(void *opaque)
>>>> +{
>>>> +    BdrvSetBackingNoPermState *s = opaque;
>>>> +
>>>> +    if (s->backing_bs) {
>>>> +        s->backing_bs->inherits_from = s->old_inherits_from;
>>>> +    }
>>>> +
>>>> +    tran_abort(s->attach_tran);
>>>> +
>>>> +    bdrv_refresh_limits(s->bs, NULL);
>>>> +    if (s->old_inherits_from) {
>>>> +        bdrv_refresh_limits(s->old_inherits_from, NULL);
>>>> +    }
>>>
>>> How is bs->inherits_from related to limits? I don't see a
>>> bdrv_refresh_limits() call in bdrv_set_backing_noperm() that this would
>>> undo.
>>>
>>>> +}
>>>> +
>>>> +static void bdrv_set_backing_noperm_commit(void *opaque)
>>>> +{
>>>> +    BdrvSetBackingNoPermState *s = opaque;
>>>> +
>>>> +    tran_commit(s->attach_tran);
>>>> +}
>>>> +
>>>> +static TransactionActionDrv bdrv_set_backing_noperm_drv = {
>>>> +    .abort = bdrv_set_backing_noperm_abort,
>>>> +    .commit = bdrv_set_backing_noperm_commit,
>>>> +    .clean = g_free,
>>>> +};
>>>> +
>>>>    /*
>>>>     * Sets the bs->backing link of a BDS. A new reference is created; callers
>>>>     * which don't need their own reference any more must call bdrv_unref().
>>>>     */
>>>> -void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
>>>> -                         Error **errp)
>>>> +static int bdrv_set_backing_noperm(BlockDriverState *bs,
>>>> +                                   BlockDriverState *backing_bs,
>>>> +                                   GSList **tran, Error **errp)
>>>>    {
>>>> -    bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
>>>> -        bdrv_inherits_from_recursive(backing_hd, bs);
>>>> +    int ret = 0;
>>>> +    bool update_inherits_from = bdrv_chain_contains(bs, backing_bs) &&
>>>> +        bdrv_inherits_from_recursive(backing_bs, bs);
>>>> +    GSList *attach_tran = NULL;
>>>> +    BdrvSetBackingNoPermState *s;
>>>>        if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
>>>> -        return;
>>>> +        return -EPERM;
>>>>        }
>>>> -    if (backing_hd) {
>>>> -        bdrv_ref(backing_hd);
>>>> +    if (bs->backing && backing_bs) {
>>>> +        bdrv_replace_child_safe(bs->backing, backing_bs, tran);
>>>> +    } else if (bs->backing && !backing_bs) {
>>>> +        bdrv_remove_backing(bs, tran);
>>>> +    } else if (backing_bs) {
>>>> +        assert(!bs->backing);
>>>> +        ret = bdrv_attach_child_noperm(bs, backing_bs, "backing",
>>>> +                                       &child_of_bds, bdrv_backing_role(bs),
>>>> +                                       &bs->backing, &attach_tran, errp);
>>>> +        if (ret < 0) {
>>>> +            tran_abort(attach_tran);
>>>
>>> This looks wrong to me, we'll call tran_abort() a second time through
>>> bdrv_set_backing_noperm_abort() when the outer transaction aborts.
>>>
>>> I also notice that the other two if branches do just add things to the
>>> outer 'tran', it's just this branch that gets a nested one.
>>>
>>>> +            return ret;
>>>> +        }
>>>>        }
>>>> -    if (bs->backing) {
>>>> -        /* Cannot be frozen, we checked that above */
>>>> -        bdrv_unref_child(bs, bs->backing);
>>>> -        bs->backing = NULL;
>>>> -    }
>>>> +    s = g_new(BdrvSetBackingNoPermState, 1);
>>>> +    *s = (BdrvSetBackingNoPermState) {
>>>> +        .bs = bs,
>>>> +        .backing_bs = backing_bs,
>>>> +        .old_inherits_from = backing_bs ? backing_bs->inherits_from : NULL,
>>>> +    };
>>>> +    tran_prepend(tran, &bdrv_set_backing_noperm_drv, s);
>>>> -    if (!backing_hd) {
>>>> -        goto out;
>>>> +    /*
>>>> +     * If backing_bs was already part of bs's backing chain, and
>>>> +     * inherits_from pointed recursively to bs then let's update it to
>>>> +     * point directly to bs (else it will become NULL).
>>>
>>> Setting it to NULL was previously done by bdrv_unref_child().
>>>
>>> bdrv_replace_child_safe() and bdrv_remove_backing() don't seem to do
>>> this any more.
>>
>> Hmm, yes.. May be we should move bdrv_unset_inherts_from() from
>> bdrv_unref_child() to bdrv_replace_child_noperm() ?
> 
> Sounds good to me. This should hopefully be called for all graph changes
> that could possibly happen.
> 

This will break current "feature":

block jobs don't break inherits_from at all: when filter inserted inherits_from is broken. But when filter removed, it works again, as .inherits_from is not changed by bdrv_append().. So, I'll just try to keep current behavior around inherits_from as is.



-- 
Best regards,
Vladimir

