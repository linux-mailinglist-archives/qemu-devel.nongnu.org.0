Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C430F427
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:48:53 +0100 (CET)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7f08-0007cO-OC
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7eyH-0006pN-8y; Thu, 04 Feb 2021 08:46:57 -0500
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:59366 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l7eyB-00021D-C1; Thu, 04 Feb 2021 08:46:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5pRPqUUYbdfZ3nYf1qnOsbPR5Y7ilVNX8eJzZ3F4TEWdu9j3ewR9UTb9FMbZ0K2kPGSDVxFvpuyLSEcPMbw6DrCqdVsURDzVHeN1Em2inA9byTM4poj9/Tx/LQWNz7HzymQOYvz+wAvecrwmmT7xPoOh2Iv8hVzMU2OSYi9zE1b7gkib+O6kO8R7gIlLRq3VvRfkH4TAF7qwN/GZnY4I8kr/jwC+eCBA7S5oU4IECTtqmWA6GEPijRBRw5EJ9OP8xrWHV/HJbR/9fpJLhzRzanR3lqac4VVW2ozlFgPdmP/u6PzKNIIOyVj1BHbmuu3Da+vgLOuDWgCp3JCHn1ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKVEV/ZrTHyfcyuPqzP2oXm8P3cvbrDmoyEFk1suNJY=;
 b=hBcvko/IEtm1K/nB/Rnqmo8sPmm8txMteGrSxq9Ne0F0t/T08OKBf6HrJCShXrscPAzdrqljuKg2fry+R8lTxM344sAnMX+xZr+c7P9z6dxcx5HD0tX7ERcDHx43E3PuewxbsS0U0dbIV3hfRdnuON3EpZ/N77qGNra9aQS8owJJT+Je7tv2lZCl4dqVRP9lN6IyQipWBzNHjeQVYSPDRPixBdNaoI7ubP1S92RF2ovOkEKGZbE05iJ+KnECzWGp+67MKpyhEdeRZ9zSCP1CufD5MPoE+INqjTzgyTP3acvOzDDzLJqQsnrAZMgy0Oqc48S5GRrk7RgJoviJjVAoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKVEV/ZrTHyfcyuPqzP2oXm8P3cvbrDmoyEFk1suNJY=;
 b=gvF9c5LSxAgzCMBlAUaPK4Wlsc5JrluVg41XGjqJkw/tORtAt4PzSJBA4Ut/F8JnfYaGQ/BmE4ROuJaVakKJKNA9V+hRWoKrQpqYUXpJ6KznY8eohjEfcbrii1VaIb5Eyw0TgElRKCiznn4kazqnsPSflxCZSU/zvhacD8wbIN8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 13:46:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Thu, 4 Feb 2021
 13:46:45 +0000
Subject: Re: [PATCH v2 26/36] block/backup-top: drop .active
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, mreitz@redhat.com, den@openvz.org
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-27-vsementsov@virtuozzo.com>
 <20210204122651.GE6496@merkur.fritz.box>
 <e29d97df-3a05-0164-09c3-c0336719c78f@virtuozzo.com>
 <20210204132529.GF6496@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cb558baf-2ee5-aa46-ef5e-228140f3bd44@virtuozzo.com>
Date: Thu, 4 Feb 2021 16:46:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210204132529.GF6496@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.214]
X-ClientProxiedBy: AM8P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.214) by
 AM8P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Thu, 4 Feb 2021 13:46:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07daea42-21f4-47f8-ec41-08d8c9134fe1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4343:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43438CCA4C07C459D83027A3C1B39@AM6PR08MB4343.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a9QPVgX2DeYHfY3X7QBxIY4d16AjSGRTbfehiAB8hpdZ0T3sbA3r+2ZbnEVcOLh11zb/05kq3QcQol2+sjpp7/5VXLkCdKD7z7c6f9HyZR8u2rxoAhnWaQUj4gnM9sRUMDc1I5gMU5km3BGGOMLBk9ZMQ0Ry+Ni6vRc3bgdQUIOVjKn5KeXptWMiJgg+a94/GtgiTxtjMxx7DGJ0pmuwNfRXnFWr0WxQcK/SaaXnKwX9niwFSFnSR12+oS9e3vMhUGpm5g7h6V2ubeQEbunGOBX7i9NTudX/S3pOMRxj6GqCwPbZBxKCh89QA86jLVK9dh3RBW398+o4GEUY9fLrcco7Ys9sXeRt+KnRi5Cqz4HrKSLFZH7h10EnMenh8xpQsMo2CoQX3x61CmqUuC1CCtSsp98riwmi53fIcgBnFaELN1fJ/6xruPHiJmacxPxq/AMy+L2rKma6cty/Z5nleYMJkmot8ty29oOYKggLSES7e4pJN42h27sxTzPXa3pEEx5VYeZ8dqJ3O89zJFUHsU3kRU3A2x/9Xhz5gHrdOzYd5Dqg6RyTabL2mgbR3AMaL8BeU0Zt41ftY/ZrnNf9gaoWZDxm9ks1cgZAUyEW1hfVl4wmcUJFyb8am7FoC2kW2xBfpLEGfie+iC7tRsU4ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(39840400004)(346002)(376002)(16526019)(956004)(4326008)(31696002)(26005)(52116002)(31686004)(6486002)(36756003)(186003)(2616005)(8676002)(16576012)(5660300002)(316002)(6916009)(2906002)(66946007)(66476007)(8936002)(107886003)(478600001)(86362001)(83380400001)(66556008)(142923001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWNHZDJLVHR2Z2RGMHhENVF4eXhEOTFrYmdhMmVOOFJra1lvNFJlOVgwRXVl?=
 =?utf-8?B?SENha0ZtQnpaY0tiWkFzSFFuZmgxNnNJNVdPT2s3M2E1SitmYkxLVlp1Z2Qy?=
 =?utf-8?B?UmtOMnJ5ek5HK1JmUTFqN1I3WGdNbVkvZkNVS2NmYVpkMTVwN1VwN1RIYVNq?=
 =?utf-8?B?aUo1NkVSLzNyYm81NmhWeExXUDVsTElTSkNnY1RYbHFiQyttSTBvbzcybVVj?=
 =?utf-8?B?d3kxWENLYWx2ZndWUUs5YXBTRTk5cFBjaTQ3OXhZQm92Q2NaQW5EZGxRSGRF?=
 =?utf-8?B?R2hybmZ0UmhpR0NPSVBkZTFTUDZZQlVmU29heHdCeVVMTzNiYjdSQmVSM3ZM?=
 =?utf-8?B?alhyNTlNcmtacVdBWkJaZTZ3eUkwTnREMmM0WWdrbFZNTnd6M2cvNEVOMGJX?=
 =?utf-8?B?UjVaYWErcjFlYU51L25tazFDZDRKVWY1TDNSM3BWaVVFcm40bUtleWQ3a1JH?=
 =?utf-8?B?WFFFREZwR1BQaE1Sd2Rad0lCaEtGalEzT01KZVVCU0dFeVdiMUlJWnlablNq?=
 =?utf-8?B?VU82cFBLQjNXdmdkSzJYNWpKUVVVRTY3dmlWV1lrNmsxUDZrL3lnSDBHL0lp?=
 =?utf-8?B?am5VQy9JZHVzUXVRNDZZTGVDSWpKSk1JOFBTRm9hWGpGaGRGcmI4UFFuaTVI?=
 =?utf-8?B?WmZ3TmtIZlJpM2NUbHFZOG5kdnNvOUFKT2RDNk1CS2lrZkUyY2hqZVpaS0ZM?=
 =?utf-8?B?cFhpbGR5enBmeVFmLzJ0R2ZzcUlaN0UwdVFOL1NRRVpzaWtkSWJXVEJxSldl?=
 =?utf-8?B?RDh0OWo0QmNMYzBNT1N5ZE51MDFGVVRqZ0NBQ1k4TGNuamNDUFdnQzVJRGhz?=
 =?utf-8?B?MlJhbkZvSGQ4cGh1cmpOZHlLQ0ZScitrYXBlVGlLZ29YZlg0bXcwSTVtVVpo?=
 =?utf-8?B?dFhyR2wxMzJTSXBQcm1kYU9sb1dTZHFxaEJqc0ZYT2crcW15OS96ekx2clFT?=
 =?utf-8?B?elI4RDQzSW1VZURWRzljR3N0M2Ixa3E5RmVVY2FIZENFemZVd09wcE9pclA0?=
 =?utf-8?B?TWV5NHBSaER4ZzRPRytRUDdRLzFKVGZmRDhTM3JOL0dhWGEzbXMyRFcxQVJv?=
 =?utf-8?B?SHBxTW96bHVLUTV0U0VyZ0NMK0ZxcnlCV3ZFdmhmNkhoZUhtU1dFSlRUdWlX?=
 =?utf-8?B?ZFFFelZTNm56MGVsQVR0WXdYaEZiMUhzbC9lRlNxcmlVajc0SXdlUllwNUNC?=
 =?utf-8?B?bUJpSkc2UW9hUWQ5OXF6a1hSRFhLQjd1Nmp3VnV0bFIrdkhhTVJDTUlzMStG?=
 =?utf-8?B?NlQ5RGdsdzZmZFZud0NOcllHczFQcFBaMXRYL0orQlBobnMxc3RRejBOdTNJ?=
 =?utf-8?B?R200RmpLRHpVL2Jrbit3WWFKRHl4VDczU2xOYStCYlhSWlpZanN6OXE2djE1?=
 =?utf-8?B?OVFKczh5a2wzQWYzR0dSVlA1WENIU2tzTERmakZKRkFTajhHRS9zYWs3TFo1?=
 =?utf-8?Q?osuHdcNV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07daea42-21f4-47f8-ec41-08d8c9134fe1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 13:46:45.5539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cEKuBQ8EGo96BX8imv8uHcfApsH9mM9mCq/CDln6uxBpZFO14AQ5XFLg4wgs2o0Wudav9FWFbI0Flp2pNZqtSSTNI+2Vorr0K7jJYQOfYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_NONE=-0.0001,
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

04.02.2021 16:25, Kevin Wolf wrote:
> Am 04.02.2021 um 13:33 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 04.02.2021 15:26, Kevin Wolf wrote:
>>> Am 27.11.2020 um 15:45 hat Vladimir Sementsov-Ogievskiy geschrieben:
>>>> We don't need this workaround anymore: bdrv_append is already smart
>>>> enough and we can use new bdrv_drop_filter().
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    block/backup-top.c         | 38 +-------------------------------------
>>>>    tests/qemu-iotests/283.out |  2 +-
>>>>    2 files changed, 2 insertions(+), 38 deletions(-)
>>>>
>>>> diff --git a/block/backup-top.c b/block/backup-top.c
>>>> index 650ed6195c..84eb73aeb7 100644
>>>> --- a/block/backup-top.c
>>>> +++ b/block/backup-top.c
>>>> @@ -37,7 +37,6 @@
>>>>    typedef struct BDRVBackupTopState {
>>>>        BlockCopyState *bcs;
>>>>        BdrvChild *target;
>>>> -    bool active;
>>>>        int64_t cluster_size;
>>>>    } BDRVBackupTopState;
>>>> @@ -127,21 +126,6 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
>>>>                                      uint64_t perm, uint64_t shared,
>>>>                                      uint64_t *nperm, uint64_t *nshared)
>>>>    {
>>>> -    BDRVBackupTopState *s = bs->opaque;
>>>> -
>>>> -    if (!s->active) {
>>>> -        /*
>>>> -         * The filter node may be in process of bdrv_append(), which firstly do
>>>> -         * bdrv_set_backing_hd() and then bdrv_replace_node(). This means that
>>>> -         * we can't unshare BLK_PERM_WRITE during bdrv_append() operation. So,
>>>> -         * let's require nothing during bdrv_append() and refresh permissions
>>>> -         * after it (see bdrv_backup_top_append()).
>>>> -         */
>>>> -        *nperm = 0;
>>>> -        *nshared = BLK_PERM_ALL;
>>>> -        return;
>>>> -    }
>>>> -
>>>>        if (!(role & BDRV_CHILD_FILTERED)) {
>>>>            /*
>>>>             * Target child
>>>> @@ -229,18 +213,6 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>>>>        }
>>>>        appended = true;
>>>> -    /*
>>>> -     * bdrv_append() finished successfully, now we can require permissions
>>>> -     * we want.
>>>> -     */
>>>> -    state->active = true;
>>>> -    bdrv_child_refresh_perms(top, top->backing, &local_err);
>>>
>>> bdrv_append() uses bdrv_refresh_perms() for the whole node. Is it doing
>>> unnecessary extra work there and should really do the same as backup-top
>>> did here, i.e. bdrv_child_refresh_perms(bs_new->backing)?
>>>
>>> (Really a comment for an earlier patch. This patch itself looks fine.)
>>>
>>
>> You mean how backup-top code works at the point when we modified
>> bdrv_append()? Actually all works, as we use state->active. We set it
>> to true and should call refresh_perms. Now we drop _refresh_perms
>> _together_ with state->active variable, so filter is always "active",
>> but new bdrv_append can handle it now. I.e., before this patch
>> backup-top.c code is correct but over-complicated with logic which is
>> not necessary after bdrv_append() improvement (and of-course we need
>> also bdrv_drop_filter() to drop the whole state->active related
>> logic).
> 
> No, I just mean that bdrv_child_refresh_perms(bs, bs->backing) is enough
> when adding a new image to the chain. A full bdrv_child_refresh_perms()
> like we now have in bdrv_append() is doing more work than is necessary.
> 
> It doesn't make a difference for backup-top (because the filter has only
> a single child), but if you append a new qcow2 snapshot, you would also
> recalculate permissions for the bs->file subtree even though nothing has
> changed there.
> 
> It's only a small detail anyway, not very important in a slow path.
> 

Understand now. I think bdrv_append() do correct things: bs_new gets new parents, so we refresh the whole subtree.. So for appending qcow2 we should refresh its file child as well. Probably new permissions of new bs_new parents will influence what qcow2 wants to do with it file node..

-- 
Best regards,
Vladimir

