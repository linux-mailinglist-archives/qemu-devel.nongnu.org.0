Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB89383221
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 16:47:16 +0200 (CEST)
Received: from localhost ([::1]:51944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lieWZ-0008TE-HQ
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 10:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lieGz-0007yL-U0; Mon, 17 May 2021 10:31:09 -0400
Received: from mail-eopbgr00135.outbound.protection.outlook.com
 ([40.107.0.135]:54337 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lieGt-0000QI-2y; Mon, 17 May 2021 10:31:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KUa6p68zqDGYzrvz5vZmRTDtmH1+NE8lCSjCosbq154sbD79LaK0Dr1dZezzotrS/KBVolDaOuDud9TmfZCRxkrGONYtZABgJf+Tt2Q8CfRLUVmsHFNiIWgwwOvOtxxho9boC7VZaeIz70zaR9uR/vuwi83vRh5wsyoB9FWdveUzG8GG+dRZnglhQrszFGQli664EIyF0sY9fFp6Pz55kPEjI5O1OeJQirw0KzkER8HuWMJcyP9UfwFhhz82yAle6i+n2O+uReLUxcBSLcoWDg5MREpm8feSM0CNnD4ikH1RO1z4IWpe6VyKqt9Yz+CkMwE3ZBF2381X/Qige6vdZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqN9D0VFoe5I7V0uNCEyy8gM3KA/E9fYTwpzVuDmCq8=;
 b=eKifJBDrth2mZOrsAovmhM8wSBb48LL3fDMTsQk/zzjsQA+SbZp3txMmRWnaLCZpBSUahUybpQP9nhW7T1VSwjcEqtthLDpycGhDi4ThhPsbGHxsbMj2Y191XHkeS7vK2nmfHetrybP5oRVVfYc9tUh0Fp0NK2rsmbJXWGC5unC1Ge70Yaz4l46FiQHE/oVqytS/TAQcEWjg8SfoOn3F8RwywuHvNGMVKeg/AxYDQ1qn0zTUlPTZEycO60vgPsWOac+oi0Y5F0/soVysn1p9YN0lcRIER6Yu38aX0xof/xpZr3066txsBCy5TCJwAlTvGqsLl1OF2lmltPVQzFmu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqN9D0VFoe5I7V0uNCEyy8gM3KA/E9fYTwpzVuDmCq8=;
 b=fIIjPkQ/mx4V0JDeZ391pxidgBNlL3Gc1IJ9PksHFP5+XcDgdG6iNOpHwttsWkItBhXvadT/ZGd9BbfzE4b3xJinl8M+qXlCDB0/PedbYIqqm96RwH7onAa2ng3Z6gj0oWLIIunC7/usU1SDiUjreyTvRzjFP+3cPyueNYgvaWM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2100.eurprd08.prod.outlook.com (2603:10a6:203:50::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Mon, 17 May
 2021 14:30:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 14:30:59 +0000
Subject: Re: [PATCH 01/21] block: introduce bdrv_replace_child_bs()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-3-vsementsov@virtuozzo.com>
 <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <554dc7c4-c16e-932b-21b1-e803cb1cee32@virtuozzo.com>
Date: Mon, 17 May 2021 17:30:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <ee302de8-bd22-b43c-f30f-eedce438d825@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.231) by
 AM0PR10CA0091.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 14:30:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ff84c65-6b62-4aaa-3b3f-08d9194063f0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2100:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2100859A8C6CC0FD225E79DBC12D9@AM5PR0801MB2100.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekh+TY9lHLQpeJk2cafZfJfbBif/ZrDnBGlCg5TxWy/m/ozTEG6D9dOj1xeqRef1FK/rh6LEQM2Tevg6MJRn8IPCJQbXf3gT20AFDyx/yohYsuL0g2kkXdH1r8K4UBmUTicejmzAbftnTJIs3Ax4LIcza9m1VGGZaYEwDEfRewHNtxf4en+UDvR3dkpwEPaKvQdhNy7eDnF/WY4Fifr/NXhQJCsohvBYjV9/bcnE5HJvJtzNZPQ7xwiG1WNcNPXIUQr/n6JbR0NbFn/Z355GcIV4d3YcL4ppyWK9XZt80f6jrUTsJSc2IY3bG1+87JzGrRq+co2sD7hs8YSMnQMtchI2Bf7P7+8DN2cdoJV/pXiYAPEt9xKuLqSvjeh93De3gtMkebEt4JI/7BCS8iaYdvgD5UHN92UGMTyYo6sPM4DVczDTIL5YgQGA7RE/Nh/lBiMYlNnGX7v3HnUVPjReW7nwKGzNuDPb/o5ORLVVG0+OtRksk0Tdh5rlqe1pVrKwj3FOGpo4B7zzAY0XqccAGfwQKSYhxIC1ztBTyLIlqb6VMoB4kKNPtRtYO6Z7tp1PVd3NUZrlv0/+nwYdpsrvqApNSGZV2CXlaiRtnFpcX5/TLTYiwKAg6LhYduPKQF+601YKdDfVgpeSjUeH8A/E44CPlOlD2xZDbN0jKer8yaXqE6w4g8KSkDWjFp0xCqAE8IkHVA/1332LwDTpTW1WIoF4oCJWdfssLQvbTEg52tE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39830400003)(396003)(136003)(31686004)(31696002)(86362001)(4326008)(52116002)(83380400001)(66946007)(53546011)(16576012)(478600001)(16526019)(2906002)(8936002)(316002)(8676002)(2616005)(956004)(186003)(107886003)(66556008)(66476007)(7416002)(6486002)(36756003)(38350700002)(26005)(38100700002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z0FNOGFPcDNMd3Nyb0FTVFZ4eGJnbkFYWVVPcUZJYnF2V3pSaVk2NFJ6MVdI?=
 =?utf-8?B?Ym5UNHEySjdnNCs3RjdvaHZHdDBnUXlEMVF4YkZyV1ArbjBuTHYySzVPWkp4?=
 =?utf-8?B?SGtKWFZlTkpyLzhkcG1DZnpkUWd6TG5HYThYUDZGSmZSNlhET1pCNGhkQk8v?=
 =?utf-8?B?K1owL1pqaFVoS29OTGJPajhmTTdqZUgzRFpYclJrVXg3QTJ4UHYwRllUbll1?=
 =?utf-8?B?ZmF4S05pR2FHRXhaSmVGZm9QcCtyWnZ3Y0ZCc3lEdy8wMk96L2FYaHcxUWVj?=
 =?utf-8?B?UjRxRi9ubzdEd3Y2ZEh6VEVtNmw1S29Ed3NIekYyZERVTGRBYXM0TG9HMy8w?=
 =?utf-8?B?NWQxUmUrWGRETVJxdk94VEFETEZ5MFZpdDFCVnptQ3UwNjdvWkJpRGhZZUpK?=
 =?utf-8?B?d3JiUkhKMnZWdUlBUkFmZWZYNWpiMEg3RUgwUjMyVUlZRW5FYWpHZ2x0dVp2?=
 =?utf-8?B?V3ZuRVV0MHNUL29vVmthMHhyVklTb2k4WWhYdlYvVnFiODRpVlF5OWp0bnNT?=
 =?utf-8?B?RFVwZXlZQkplZFZ4TWNzTVdkZm1OdlBPaXhoU25FUzdnM0VXVTB2ZjlPMjd2?=
 =?utf-8?B?d1RWVjAyL2hDVUdYeFhGQWcwd3dNN0FUU3dpdFFyaTNJdmpRKy9GWU1xMW1I?=
 =?utf-8?B?N1lzSkpGZTB5U1JnOU02NWVvYlJ6Y2QxSFdpZ1VZTy8wQ2dDUW93S3NzMDBm?=
 =?utf-8?B?R0UrcjFseUlJTnFPZ01nbGdpWTZya1Nkd0VnV0hLUkxBeFJBdUJjSnAzNDlP?=
 =?utf-8?B?OTlya29Ic1M1SnF1QVNDUW5NcTBNM2c1TThvODMyQWNqemVhWjdDUTdrQmIw?=
 =?utf-8?B?V3MzS2h2RER2VUdBWitoTjhSUFd3Y0llZ0cxYVN0QWVoeXpyTUlVMVM1bVZL?=
 =?utf-8?B?MUVzMkFEV00yTFAzVTZFYTcxTU03MHZGUks2WEJEZG5xREtYR2c0L0t2RzV5?=
 =?utf-8?B?M2tITTlPM2ZhVENYYS9vZVVmTzFsL21pYnhodU0vSjBhWC9OQ0dKMkF0RnJY?=
 =?utf-8?B?N3htVXlCdnE3WUx6aGsxdWpJY2tYMFJvRnM1a2pKdWN1S2JWM2liNG5uQUVR?=
 =?utf-8?B?bGxqYXhObUdtVFNNK1VLTFhVaXc2T2ZiY0o1OWZyMmE3aUVuZnpQTlRsbnZr?=
 =?utf-8?B?S04wdHk0cXVXc1BjSkc0Y3pOZlNmRWdjTG96RWNnMDdCbGhoa3FXZ3JjMXFL?=
 =?utf-8?B?ZjRuSUdsMHBTdkVGTVBDMnV6NEJuUi9yZS9DVUw1YWVKckVXQzJidGRrYmNv?=
 =?utf-8?B?UGFTbDVvSkdYalE3ekhxZmNVeEorc1RyM1cvTFpGYVA3SkQwS3VsQUUrOUh1?=
 =?utf-8?B?QVF6QmpHVFE5bWdqMnIvdGlPQndjMHI4YitSRlRmUzVqb1ptUWFzVDJvbWd4?=
 =?utf-8?B?SXhONStXbTViR2dLbkg3b3pBMjczNDRpMUd1bTdhQVU2Wk9oV3l2eHVOcWlX?=
 =?utf-8?B?UWNqMWd3bTQzMThVS3JQby9HQUx1NjlmRjFvQ3lBbmtkWHpxSTQ4UWlOT1Zv?=
 =?utf-8?B?S3pKeFlwZHNWT3BCUmdvczRBMzNzODlYQUZKUlJVYTBxU20xbTU3aGs0K3JF?=
 =?utf-8?B?aDJjVzB6bHRaYjEyZ1JIeDBYS3BIeTd5b1FOUmJOamtNamEzL0wxb1ZDTmp0?=
 =?utf-8?B?ZXQ3L3dyMHVHUTZSZkdSbldGT2orcEMvajR4TXRvdjNnSVJ2WFVKWWx6QThM?=
 =?utf-8?B?MDM0d2lSd3EzT09TOHhJbXpyWW1mQ1QyYTl6TExyM3VVNUVqbFd0MWt5Tmln?=
 =?utf-8?Q?GCoRHJVU0ULFUW2VoXc9JDhafSihZ9SXnYc+Szy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff84c65-6b62-4aaa-3b3f-08d9194063f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 14:30:59.7115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPpKwa+yfeG+o0bgUL0+x5db5nZwIqJ7bS+IwD80e6x/SGgu/CVnpLQG9GFo8FZ13V1OxXYiVBSREG6+aedute4W0MSoE9wm2T5SCaltxEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2100
Received-SPF: pass client-ip=40.107.0.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

17.05.2021 15:09, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> Add function to transactionally replace bs inside BdrvChild.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   include/block/block.h |  2 ++
>>   block.c               | 36 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 38 insertions(+)
> 
> As you may guess, I know little about the rewritten replacing functions, so this is kind of difficult to review for me.  However, nothing looks out of place, and the function looks sufficiently similar to bdrv_replace_node_common() to make me happy.
> 
>> diff --git a/include/block/block.h b/include/block/block.h
>> index 82185965ff..f9d5fcb108 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
>>                   Error **errp);
>>   int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
>>                         Error **errp);
>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>> +                          Error **errp);
>>   BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
>>                                      int flags, Error **errp);
>>   int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
>> diff --git a/block.c b/block.c
>> index 9ad725d205..755fa53d85 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -4961,6 +4961,42 @@ out:
>>       return ret;
>>   }
>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>> +                          Error **errp)
>> +{
>> +    int ret;
>> +    Transaction *tran = tran_new();
>> +    g_autoptr(GHashTable) found = NULL;
>> +    g_autoptr(GSList) refresh_list = NULL;
>> +    BlockDriverState *old_bs = child->bs;
>> +
>> +    if (old_bs) {
> 
> Hm.  Can child->bs be ever NULL?

Hmm. Most probably not :)

In some intermediate states we don't have bs in child, but it shouldn't be the place where bdrv_replace_child_bs is called.

> 
>> +        bdrv_ref(old_bs);
>> +        bdrv_drained_begin(old_bs);
>> +    }
>> +    bdrv_drained_begin(new_bs);
> 
> (I was wondering why we couldn’t handle the new_bs == NULL case here to replace bdrv_remove_filter_or_cow_child(), but then I realized it’s probably because that’s kind of difficult, precisely because child->bs at least should generally be non-NULL.  Which is why bdrv_remove_filter_or_cow_child() needs to add its own transaction entry to handle the BdrvChild object and the pointer to it.
> 
> Hence me wondering whether we could assume child->bs not to be NULL.)

bdrv_remove_filter_or_cow_child() is "lower leve" function: it doesn't do drained section nor permission update. And new bdrv_replace_child_bs() is public function, which cares about these things.

> 
>> +
>> +    bdrv_replace_child(child, new_bs, tran);
>> +
>> +    found = g_hash_table_new(NULL, NULL);
>> +    if (old_bs) {
>> +        refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
>> +    }
>> +    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
>> +
>> +    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
> 
> Speaking of bdrv_remove_filter_or_cow_child(): That function doesn’t refresh permissions.  I think it’s correct to do it here, so the following question doesn’t really concern this patch, but: Why don’t we do it there?
> 
> I guess it’s because we expect the node to go away anyway, so we don’t need to refresh the permissions.  And that assumption should hold true right now, given its callers.  But is that a safe assumption in general?  Would there be a problem if we refreshed permissions there?  Or is not refreshing permissions just part of the function’s interface?
> 

Caller of bdrv_remove_filter_or_cow_child() should care about permissions:  bdrv_replace_node_common() do this, and bdrv_set_backing_noperm() has "_noperm" in the name..

The main impact of previous big rework of permission is new scheme of working with permission update:

  - first do all graph modifications, not thinking about permissions
  - refresh permissions for the whole updated subgraph
  - if refresh failed, rollback all the modifications (main sense if transactions here and there is possibility to do this rollback)

So a lot of internal functions with @tran argument don't update permissions. But of course, we should care to update permissions after any graph modification.

> 
>> +
>> +    tran_finalize(tran, ret);
>> +
>> +    if (old_bs) {
>> +        bdrv_drained_end(old_bs);
>> +        bdrv_unref(old_bs);
>> +    }
>> +    bdrv_drained_end(new_bs);
>> +
>> +    return ret;
>> +}
>> +
>>   static void bdrv_delete(BlockDriverState *bs)
>>   {
>>       assert(bdrv_op_blocker_is_empty(bs));
>>
> 


-- 
Best regards,
Vladimir

