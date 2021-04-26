Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D464036B806
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:22:09 +0200 (CEST)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4vu-0007Hi-S9
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb4st-0005QL-SS; Mon, 26 Apr 2021 13:19:00 -0400
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:25664 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lb4sr-0003Tc-AA; Mon, 26 Apr 2021 13:18:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHX4tLl2pI5DWfezUzjFVo6kpNjYUkAEEpZZd/1q901zunHEUQyJiaONRMlP01n8IzHNES2y6vYgxM0mz/xW5K3/OIyQYyDpnXNvdLrl0tAHZNz30Lx1Qib97RCIbk2rfo2CIaI1Ep+2QBR6POtYA1jDM9v9gECtRuxTt+RwyrZ46+rQN/3LGVe77/2V1PLGJGc/KcW0uPY+EJQ//bZOg9QafQThXJfgVhBK/ZRcYvjklWVjI2GKGRIxbsIQthFV5M9Mp2xltHDYNoGabeGGcp0YdwR4zArKFo9T6CYW6U7r7wuq5weLXRTIxe9YxH18A5NQJzajqGFFX0RMQ252cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXsP++jT6SPUngdSKgW6PYRcbeaHnXkVc9QimsPxAyw=;
 b=U1JslJJZsBzGJKYcSyhES7eAAm4SIfsoe/I/5DW7tmGZwoJYioa8K1V+SrXb2P+qr7KOJqBoTDu2OeqfCdpJmxArFKo2DxZFUVHzxO60e8YcVn7NUY9MIygx01AloXaOIQVnIydBgZgpx774fZZX89sK+6ovaaOn/gVlAqeLdIj8gBLupcDIBvlgXMKeOmAlcG7cAvAmcPH6W8eia/bWklG74Knd6Byp86GeOkaHl5yqDYMaa9aL/dTWepm679pP+zAuswbFAXPxkGJ9zdhCg9Ph9wF+rttRytm3nVAyQDJz8uNCGBgKhHbuBJA3EwKXHud9WaEV79JVN+FYLWUqqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXsP++jT6SPUngdSKgW6PYRcbeaHnXkVc9QimsPxAyw=;
 b=B7L8GALAcT/L3a+HuWP3YZ9hjdwQvaFkAcmgWpXu7tjK5yLDxDV0SmsgI0R2ARFVW5oOm7othR1xcHPYnMj+Iv00THs2YxattNcXRowwog6TcPoHvgG0U52dzJp4VEJwBI2tGVsc8FO6vo//AD/z1AQgv07vb79XykleuVjoeaI=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 17:18:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 17:18:53 +0000
Subject: Re: [PATCH v3 22/36] block: add bdrv_remove_filter_or_cow transaction
 action
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 fam@euphon.net, stefanha@redhat.com, jsnow@redhat.com, mreitz@redhat.com
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
 <20210317143529.615584-23-vsementsov@virtuozzo.com>
 <YIbpoWMyxkgRUtki@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f6bb0393-220f-09bf-9b2c-73fd68ee9967@virtuozzo.com>
Date: Mon, 26 Apr 2021 20:18:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIbpoWMyxkgRUtki@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR0P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR0P264CA0059.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Mon, 26 Apr 2021 17:18:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b08e3c44-be9a-44cd-9b65-08d908d75daf
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5334AE8FD95EAF560D30F96DC1429@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V8mEpiKIdoP5dGk7FVG+P20UUYfvYHw95ag2GC9fkX7mDDML6eSM/96b8xRn1rHF883IkegP3QvbC4rBnpTvOxmkJRILG2Z2TCO3JHr1NHKpAvKPzkzVhmWm26WoqLbeEKBtIGMr2S8yKL1Hnqpd0Ece8IXOIP5ff6vq0FkZesuBcA7VKscKzcq7tbsEbZL3EktYFoNVT9bPXcEh7TqSSbiQ1ftLIBjMTQVmQ0jmuQ0P7JsPWdX21BX9ShWv8BFXdHy6wLxL1YI5JAqt94es/LHQT1m9wQKsOxmjDA1y3vkebWXSfdNN4jrx6QsOI1Uudm1D9RLReQ1KBqSNq/8qt9kPfudPw0FLXzvofCRPYH/hBVqc9fZGEhiJ8YfM9Xofx/PESEToVRyorZX1MaDQrCaJTrXZN5aRjq/IfdSNMiertzrb03FwcquF1uaMgcm/9OQiZM4lqaNSKYp8W7ErHB8TGA9EBpkNOKGfK4FMR14Ysdz3Lx6ueQFmvpJEPSzmr5lx0Mt9YeUQ8EXouql6IBlJhoGgqjaJkZMrdfevjGR5wN9tPT4s5wsVpqXd7dcKRvA1yKGsff4iD1Q3TG+xHGBJSI8etNIgtbodamYV5x3EGTVyeK/H9so8bJkPjRKdEGGys6mnE3TEmHIUxd93SD6nDZ4KMn0Lvv584Rh9RrceuMgxsN1fqSZuMofG01R5XegzVXC6Yxo7JBC3Z0KZwBVdkWzedoQVNJUs5VWRgbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(376002)(396003)(346002)(136003)(66476007)(66946007)(66556008)(6916009)(52116002)(38100700002)(86362001)(5660300002)(8676002)(31696002)(16526019)(186003)(8936002)(478600001)(26005)(83380400001)(36756003)(16576012)(316002)(4326008)(2906002)(6666004)(6486002)(31686004)(38350700002)(956004)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFB6SllYdVMwdTRDd2xOZVpxQ0ErUVIrbWhPcU9wV3JoMEgzNmZYMzNKOWNp?=
 =?utf-8?B?SDNKNDBHVnZHUzhueStDYzRUdTZ1NExtOUp0bmYvdzI3WFZmcjFjc0YxTHNL?=
 =?utf-8?B?d2tCR3RGdksxc3J2V1IvQ3JmSmNSTGN1bHFTNlhWdWZ5WWVWL2lvUWRqV1N4?=
 =?utf-8?B?d0JTaVI3ei9kL2RKVCtLdWYrcmNDU3FpeHpkTGFOTWw0dm9LeWJ4T0dST3NX?=
 =?utf-8?B?NHdSLys0NkRadUt4bk1ZWXRjTVhCYzFCTHloNTYrbzl4dEpVT3FSdi8zaVhv?=
 =?utf-8?B?djliakt2S2VzSWRuS3dZYzRtbFRiWkN5TTd1c2N1YkVzMVdIbWRWMnhhUmU1?=
 =?utf-8?B?T2JmNmo4VmI1cXNPSFFseUErTFowTTMrRFBpWnZ1MFNkMXQ0NlRtZnJtQ2Zp?=
 =?utf-8?B?eS8veVZLYUN0cFhNaWNoZjh2RkdoQjdxcTAwZzI0Z3FLMGw2ejliQncyUWtm?=
 =?utf-8?B?Tys2Q3JlUjB1WWR3NENDL2JyUkFkTklMb0pnMVVUZzBCRmJDSFpxbk9qOVYz?=
 =?utf-8?B?a0NmdFFGZW80eTYzUlRqbW5TMFA3S2VVMm5lcTVMY1NTNWM1RFhHcktVaUxq?=
 =?utf-8?B?MitKa1ZqUjQ1NldHSnMrTXhoS0NkUFNxZ0ZjUlVVUitOV2RZUUNhZEhidy85?=
 =?utf-8?B?RGl1VnJMR1JrVEdJR3grWkVyU1M0ZFozYjcrcTN6SUlvRmtCcnJEdmk5QmtR?=
 =?utf-8?B?dXExRWRLNjFCR1lrUDRYSk90dlNNelZYaVlxZnR2bWVuVzJBNEFGTEpFemli?=
 =?utf-8?B?Ky9RRW9yTlRsWm1hc1FGUkxNdHcvc2hVTlM5NWYxSGFZOVFiblNBUnRITlRN?=
 =?utf-8?B?WmNEVGVOZVE1Mk0vYWVKeEtiaWFtYm1EQ0lDMzR3c2xqN25nblFzQVJJUFc0?=
 =?utf-8?B?Sm1lWGJQU05mV21JdXpkMS9wRDNFcGYzWjc5T2JHQ1A2d1c5SVpzQ2tONmxN?=
 =?utf-8?B?alNiNEJBRnRoeld1RkZjQU9TZk1UVTN4bFM2SjZ3aXM0NUd6N1BNQ3d4U0s3?=
 =?utf-8?B?cTZtTFI1Tk9wR29xSmhlWitWTlVmcUYwdSt1b2txd2wxaUJPeHBIZUQwZXF2?=
 =?utf-8?B?TFpRcWFEdHhiSVFmelpKMWwrU2ZwMEtSdlFCcUkvVnJjRHMwYXpna3F3dk5r?=
 =?utf-8?B?RjFjMlppcmg5MTFObHRDUCtwdVFYbEdqYlIzUmQyN1A4SWlsd2dEN2l4RUov?=
 =?utf-8?B?R3dmVjNmLzJHdEZIZU1CYVZDdG9rbFNBUE92ZVF5cUlyVU9BTTR2eVZob3p1?=
 =?utf-8?B?OW9WbElaM1llSnRrRUJxK01MWDRXOWJJdXZtV3ZJbk5VMm1OTnpaN2dWU0JC?=
 =?utf-8?B?bzZSS3d3eFlDS0FHSFJNdldvOTRYc2xuRGt6RXp4WVorbGhHNG5zdDY2Tzkr?=
 =?utf-8?B?QUNPOUdoNGhrL3FvbGlnd24xc2JKTG50bWNmU1NVd0lHU3dpRUFoSmhFZVha?=
 =?utf-8?B?M3U2RmwvTFR3SWhFbHF4a2pERlpWczlQdG5YaXcxK0t4aEh1Kzl6WGswY1Z3?=
 =?utf-8?B?RE0zK1VSb05DWlNwMUZtK3QxVGRHUjRSNWwyLzRhZGwxK1ZPUFBmSm9BbjFy?=
 =?utf-8?B?dDlEdnBPSi9WOVZxcDk4OFdzUDZMTE5XYUhXRllsMTh1OHZHY3hGV0FQSjl1?=
 =?utf-8?B?TWRVQUJaT0JFMWluTzFEK1pvSVF5ZVk2V0d6Vy9ESHhhZkZtNjU2QnhNNGh6?=
 =?utf-8?B?bTdYQ2Y5OFBDR3c1RnJic2FXaTAvTFpvNUdudEJNbVEzSnRKVk91QmUrdnRi?=
 =?utf-8?Q?1AkcSjTq2vVm/LZfANzai5z0JbxLeZR9zE9f8AL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08e3c44-be9a-44cd-9b65-08d908d75daf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:18:53.3984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hbP+SUbi5x5LXu/70XaKgjMmMzq5JQ+dmqMbj5wc2DAD22KHzcKOiMMxuN1XingS/16nAd5Ax7/DJYry8es1x5UrhhZIE2QYrEviDBQKktg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.20.127;
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

26.04.2021 19:26, Kevin Wolf wrote:
> Am 17.03.2021 um 15:35 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 76 insertions(+), 2 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 11f7ad0818..2fca1f2ad5 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -2929,12 +2929,19 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
>>       }
>>   }
>>   
>> +static void bdrv_child_free(void *opaque)
>> +{
>> +    BdrvChild *c = opaque;
>> +
>> +    g_free(c->name);
>> +    g_free(c);
>> +}
>> +
>>   static void bdrv_remove_empty_child(BdrvChild *child)
>>   {
>>       assert(!child->bs);
>>       QLIST_SAFE_REMOVE(child, next);
>> -    g_free(child->name);
>> -    g_free(child);
>> +    bdrv_child_free(child);
>>   }
>>   
>>   typedef struct BdrvAttachChildCommonState {
>> @@ -4956,6 +4963,73 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
>>       return ret;
>>   }
>>   
>> +typedef struct BdrvRemoveFilterOrCowChild {
>> +    BdrvChild *child;
>> +    bool is_backing;
>> +} BdrvRemoveFilterOrCowChild;
>> +
>> +/* this doesn't restore original child bs, only the child itself */
> 
> Hm, this comment tells me that it's intentional, but why is it correct?

that's because bdrv_remove_filter_or_cow_child_abort() aborts only part of  bdrv_remove_filter_or_cow_child().

Look: bdrv_remove_filter_or_cow_child() firstly do bdrv_replace_child_safe(child, NULL, tran);, so bs would be restored by .abort() of bdrv_replace_child_safe() action.


So, improved comment may look like:

This doesn't restore original child bs, only the child itself. The bs would be restored by .abort() bdrv_replace_child_safe() subation of bdrv_remove_filter_or_cow_child() action.

Probably it would be more correct to rename

BdrvRemoveFilterOrCowChild -> BdrvRemoveFilterOrCowChildNoBs
bdrv_remove_filter_or_cow_child_abort -> bdrv_remove_filter_or_cow_child_no_bs_abort
bdrv_remove_filter_or_cow_child_commit -> bdrv_remove_filter_or_cow_child_no_bs_commit

and assert on .abort() and .commit() that s->child->bs is NULL.

> 
>> +static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
>> +{
>> +    BdrvRemoveFilterOrCowChild *s = opaque;
>> +    BlockDriverState *parent_bs = s->child->opaque;
>> +
>> +    QLIST_INSERT_HEAD(&parent_bs->children, s->child, next);
>> +    if (s->is_backing) {
>> +        parent_bs->backing = s->child;
>> +    } else {
>> +        parent_bs->file = s->child;
>> +    }
>> +}
> 
> Kevin
> 


-- 
Best regards,
Vladimir

