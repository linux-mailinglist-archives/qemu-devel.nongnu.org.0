Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6D452D33
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 09:53:12 +0100 (CET)
Received: from localhost ([::1]:48868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmuDH-0001wr-Oq
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 03:53:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mmuBK-0007v6-MO; Tue, 16 Nov 2021 03:51:10 -0500
Received: from mail-eopbgr00108.outbound.protection.outlook.com
 ([40.107.0.108]:30009 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mmuBF-0004Cm-O5; Tue, 16 Nov 2021 03:51:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3SaOQabEAdb1qOCHPqqiIksFcpmIz+ZHAMkVSASnBgi8hQ7xwjok4wAr5ucOV/KvkcIbup64GZEVNOWss834TJoh0O58NkcOm9NiF84SrT1VaGggSejW9SUGzkx+PRlReDoMjyGl32G/fbMYTYHgrlvUlcN22ZjTXz2/Fr+6Cx9l0YkbYyVGak4nnt7M6PclXtvgyAGVKBRbE3kgmF4gWaKIyjcaFBBqoFImMGV7Wwp5Q0BZPijkm8ZSk7p0FSQ907rEsc9fislbLK5mC2uClTWg3luC1Ojw7vF84ygT4sa128KhXNJqNWMjcv1hJ9+ufBIODWCJ5y7kaWI2ke1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWE/ccMkv6VoKRZLnCP9KnvBqdTEB7/YKFREovGo4ZI=;
 b=P4bqr71vOpxHpDf0pDaVTrPTGggSRxB93/LqZSLiRIl/6wq/a/VFGXR2cxY4DrScoDcbXoRZn5Bqcy1qzN7lQCx1mbPgr5/V0i5Gp7v0OiNWN0dLRBJirkXrwc2Wbz+Xc8N3pprZXs/fpA14/NUsfiQ89xD/4W7B2CKUD96zhV56gW+Cv5mYbc5UKwb52XRcwaMRx4AZ34HGCurCkMz58D/ua/dAWVnEUdkWuFOT9mGhRAPhMI7kL8+V6KsWqXaY3uywnlGS6EyXWbaWkOSUu+oOz7/B0vqGfXxpWoyM27nS9b+L2nKa0Uay8BFSySu1E8UK/ZMGUqioxAoBJFvxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWE/ccMkv6VoKRZLnCP9KnvBqdTEB7/YKFREovGo4ZI=;
 b=bmos1vyvbeTVy6KA6BU1Gh/4YnhfmbBnBunaHDahchc8dNa6VhZ1QO6qDBrIEfygWQ/IgqUouJA79fK20StxYIztjACJhlGg9tI/orS/cJm1DzA7vRTalp2ZCKGLPNrhNTct6elfNcjhkeys8a/1ez7R6sRlfXNOXWlP6oeGVqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM8PR08MB6562.eurprd08.prod.outlook.com (2603:10a6:20b:355::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 08:16:55 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.022; Tue, 16 Nov 2021
 08:16:55 +0000
Message-ID: <b60ae05e-da72-148b-37e5-c6d8212c7404@virtuozzo.com>
Date: Tue, 16 Nov 2021 11:16:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 09/10] block: Let replace_child_noperm free children
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
 <20211111120829.81329-10-hreitz@redhat.com>
 <c631468b-2e2d-f5d9-6afb-6868ce00d2f9@virtuozzo.com>
 <74992b21-77cc-5d34-6ccb-d5a4fa5fc59f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <74992b21-77cc-5d34-6ccb-d5a4fa5fc59f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.233) by
 FR2P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.15 via Frontend Transport; Tue, 16 Nov 2021 08:16:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51271943-015d-48d2-9ca2-08d9a8d9732d
X-MS-TrafficTypeDiagnostic: AM8PR08MB6562:
X-Microsoft-Antispam-PRVS: <AM8PR08MB65621B9D23FFFC1DA225D0BDC1999@AM8PR08MB6562.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vw2c+WuzmASMKNUFAeuEVb9UbwE37GdCMjtZYeIr8uH5iR5UK6h7ErSL2hZ03h9S/qBE6ryLkQFKHNUJLskGd8ldNF9V0WqOpZhGw2gS2Av49UDfF0ZWS0b4O6e86i8VCOXFonNaI8WMZp7MMMiwOW7hfY2NJmx5rldkEanUd26W6eoFyON8dGOHu2V+R7Y3u7lMSubriEbTR7hn4iDpjxMo2kzA+QschTPVlqF2Qfxlq7pq2KQW8X+yiSHgypGQcjMaGu41XvsdhQ41vjv3Zb4eRrV1Q6OJaZ7kMXXYuR1MviKPk5DH/sDIg7mTieeGO2JltcoLqFIXDQCAQ94oSDmkN0o24UfgVNIeKG4/F/c8T09lbNR2L/8g7OgRCp3w8xJzxLasWX7qYDuhc6rEGrNjsIRdog1w4nCJmKx2ynK3SzeNzfKgH3RBSrwVEZUuUL7Yeogh2GV4Vw0Tvqtfe9ER8cVe89B/F1V98N8p9A3vqdnfnS6Rji0FOuJQREV8f4yBoMco2yzgxVSKkiGDSP/WDJOb72wDt0c/9BzYmOKNq19RkuCHzzyKMkszNVj/XmkX3GT0VXfUP3KA8diGBQWXeVNFIn6ZiOFeVu8DYcSbMJXI5/+ssiisExf/pW6T1xa6nWI2ohI54a5AZZIBKkJryih4hjAMcei358EnSJja5jtt/Roy5yHRtjOfi/Zp4z2RZrRBe92q3yRW59EPiypZtrSD2/yZlBfp14GdhmHyBcekSy8ggH0vY6zyCwldri9mIOxOk/kIJm01LAfY9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66476007)(38350700002)(86362001)(31696002)(83380400001)(38100700002)(53546011)(52116002)(956004)(2616005)(16576012)(4326008)(316002)(8936002)(8676002)(31686004)(186003)(36756003)(2906002)(5660300002)(508600001)(66556008)(6486002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkFhV3B1cWRMODgwTWRBNTBrNktRRjBlYkUzckpwMDB4Qmt6YlZ3Vmxxd1c2?=
 =?utf-8?B?VytDV0tMRW0vWWFvMWdQVXRwcGMzdEtTZWt0aFhhenMxdzZyNDZOWm5RTUFp?=
 =?utf-8?B?UjYwenoveEFibGFZNGczemNGaS9qWkRNeTBqSWFYVGU5ZU1nYjlCOU1SL1RB?=
 =?utf-8?B?bDA5dDZvZmt4QlU2WTNuNHkzeTJIWDdmeTh0OGxaU0FqbXpiYzZvRFNIMkFX?=
 =?utf-8?B?dVRkWk5qeVEyRnlkR2tLMFcxS0xtVjA3SzRhTGxtQk1pQnJYeGhaUGVqMlpV?=
 =?utf-8?B?UmVuRFdBcitQNW9mRzFwS0lGalRSUjdjVk11SGtML0MwVjE1STVMYVE5bWdE?=
 =?utf-8?B?YVI2ZXZ3MThKajNITDlOT0gzcDNIMnN3OWNZR0dCdG9lUkVmd2NzdWlpODZ4?=
 =?utf-8?B?c2syS0J0dFhaNUxGdi83WkZoYlRZVHFUWVNKbytkRVUxOTYxTlBCa0ZvTUtU?=
 =?utf-8?B?Z0NoeWJHSUxianBLb2hNVk4zR05qYWZLV0JETWQwZnFmcDFwWXhhVFNUOEJy?=
 =?utf-8?B?NmU0WGxQNi9rNU8xT0FldnA3cWpZWFlYNnNPa1NNUTJwSUVoMUtFWk9Pd2Qx?=
 =?utf-8?B?aHhaYXZJZGJyaWorY1JvSXpQWi9rb2lBMWU4bEFEUEVCaWxYNUZNUTdDRHVX?=
 =?utf-8?B?M2U1K0JkK0JyREVaWWUrN1c2b1pKVHpyaHBkTExyUzdXMzZJdm9ZblY5ZDZ0?=
 =?utf-8?B?VEVnNEcwY1AzR1grSUFIRngrQk96S2pEUTRKcFVMcFNKb3RGMDByUks1cHUz?=
 =?utf-8?B?eWZTODhhU3NCeGQ4OE43T3FhampmamFNL21mVllhV0lqYVlCSDJ5UmhGV2l6?=
 =?utf-8?B?K3lydklwa3EwaEJiako1dFBtUXZ0UkRHZGI4b3FENGFRZDlDR1NBSFBqNzNo?=
 =?utf-8?B?Q0t6c0J1dzRubVpJT251VUpBaEtKOVo2YlJWb3pPT3Q5WWMvRzJaRHBONk84?=
 =?utf-8?B?NWk1U1VJWndGalNydEthSzI1UUozS1NDOHk2NjNKTzdUOFMzalZyT1R0NEE3?=
 =?utf-8?B?TVJ2TVJoS3ZxSlZ2ZnJBK2twS2RhTWJpRU5DbmtWMFNmOVZCS1hhemtkdzhE?=
 =?utf-8?B?a1ArdCt1aGVLNGtHbXNtNEZWMW5mYjFjR09qUjV4SVpKQ25HZTVSQXhUb1BK?=
 =?utf-8?B?ZEZLWHdhZnZDTDlkTE1Ba3pNejlTZTJxbWZyamdNMXBvbGpNWlVFSm5JM05B?=
 =?utf-8?B?Y1I5M0t1djN3bVgvNEdjb0JsZ2Y5VFJrT0FUWlNySFh4L0FZWG0vbE5KdExx?=
 =?utf-8?B?RWdtNmVqd1hySm0vVUdCckNLWDdBTldpTFVJaElYZ2l6b0xXclBYbEVweWVv?=
 =?utf-8?B?bzErTjFiZndOQUdkWHFxTmE0QllYbERObHRrZUM1Vm9Zbm1IZm84SWQybzY3?=
 =?utf-8?B?bzM4Umc5akQ3cXRaUk5MZ21LWm56ZEhQUWNiRHdVK2NqNEZrRjk2V3QrOWtw?=
 =?utf-8?B?SkZYejNvaWt5R1JvRXJHYTI0RmNGWU1iRDZWWllRenFyaFMxdWdDRW5xUklE?=
 =?utf-8?B?WFNXa3RBUk91WHFqU3JFMHIrM29jU1JHZmNhNUU3YWNKMFl6NkxrdVNRa0dm?=
 =?utf-8?B?SG9pRlllYzBQdEFKVmFQOS9ackRRTXNpSUphc09FMVdHd29yMzhFUjJKeTdw?=
 =?utf-8?B?TVZEeXBTNVpiWVFGWUl6c2FaRjdwVnI5Y2p6RExsY05qNVBvYVpudDVSKzZl?=
 =?utf-8?B?a1IrWFJGdzNIeU1BQU5ldVk3Z25iei9CZ0NucVBUaHFDeTRjNUtYN0V5MnFU?=
 =?utf-8?B?OTIrc1JVUmNTd0EzWk41cWVUZU9yTjR1TDJTa0lFUmFNaE1BMGo3dGxjQ2Zq?=
 =?utf-8?B?WDdLOEVOTXd3WXgyN25VazArTGY3OVp1ZlhYL0I0SmcrVThrbTVqR0dFaXlO?=
 =?utf-8?B?czNEaG9laFAyZWhnWTQ1OUpITGF1K0Y3NWZrVlZHZGoxL0Rvd1oyY053YUV2?=
 =?utf-8?B?NWphQ0RveTNPa29yb0VFMEF0anhhU3FpRVFjY056elJnYUdTTzl5RkZBdXpM?=
 =?utf-8?B?VVpLci82YjRzb1cwN0k0eVNYWGV1VGZuY2VIY3Vyam8vbmh3QzJmbUUxU0Z5?=
 =?utf-8?B?V1BLVHZvZHk4dHlHTmFsb01JTFpiUHlQWW8yN0ZMMjZyejdhdlp0RXRlUDZJ?=
 =?utf-8?B?SUFkZ0s5aTZEZjB5Y29tSHIyRjB5S0dYdlZHZkpKZ29wdGZtSTU1NkwxVzIw?=
 =?utf-8?B?ZnVJQ0hDaFQ5ZThQa3hHZ3M2NHpZQU1sckFIVjhvVzY2dzU3OHdHSUNMUG1l?=
 =?utf-8?Q?l0SvFJatNxNcQR8V+4j587+bEzfAsm46le6D9hM7xo=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51271943-015d-48d2-9ca2-08d9a8d9732d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 08:16:55.4256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuAv/7PfzYbLdkFNx02mTLjM8fGiHbQxTYGV9W9GTFOtgv88uWwTY6hR8QqLv7bgWzZS4IQKbrW5amnUZ88ZlWmmq75eHOCzsY8w9M2Gu3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562
Received-SPF: pass client-ip=40.107.0.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

15.11.2021 16:04, Hanna Reitz wrote:
> On 12.11.21 17:10, Vladimir Sementsov-Ogievskiy wrote:
>> 11.11.2021 15:08, Hanna Reitz wrote:
>>> In most of the block layer, especially when traversing down from other
>>> BlockDriverStates, we assume that BdrvChild.bs can never be NULL.  When
>>> it becomes NULL, it is expected that the corresponding BdrvChild pointer
>>> also becomes NULL and the BdrvChild object is freed.
>>>
>>> Therefore, once bdrv_replace_child_noperm() sets the BdrvChild.bs
>>> pointer to NULL, it should also immediately set the corresponding
>>> BdrvChild pointer (like bs->file or bs->backing) to NULL.
>>>
>>> In that context, it also makes sense for this function to free the
>>> child.  Sometimes we cannot do so, though, because it is called in a
>>> transactional context where the caller might still want to reinstate the
>>> child in the abort branch (and free it only on commit), so this behavior
>>> has to remain optional.
>>>
>>> In bdrv_replace_child_tran()'s abort handler, we now rely on the fact
>>> that the BdrvChild passed to bdrv_replace_child_tran() must have had a
>>> non-NULL .bs pointer initially.  Make a note of that and assert it.
>>>
>>> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
>>> ---
>>>   block.c | 102 +++++++++++++++++++++++++++++++++++++++++++-------------
>>>   1 file changed, 79 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/block.c b/block.c
>>> index a40027161c..0ac5b163d2 100644
>>> --- a/block.c
>>> +++ b/block.c
>>> @@ -87,8 +87,10 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
>>>   static bool bdrv_recurse_has_child(BlockDriverState *bs,
>>>                                      BlockDriverState *child);
>>>   +static void bdrv_child_free(BdrvChild *child);
>>>   static void bdrv_replace_child_noperm(BdrvChild **child,
>>> -                                      BlockDriverState *new_bs);
>>> +                                      BlockDriverState *new_bs,
>>> +                                      bool free_empty_child);
>>>   static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
>>>                                                 BdrvChild *child,
>>>                                                 Transaction *tran);
>>> @@ -2256,12 +2258,16 @@ typedef struct BdrvReplaceChildState {
>>>       BdrvChild *child;
>>>       BdrvChild **childp;
>>>       BlockDriverState *old_bs;
>>> +    bool free_empty_child;
>>>   } BdrvReplaceChildState;
>>>     static void bdrv_replace_child_commit(void *opaque)
>>>   {
>>>       BdrvReplaceChildState *s = opaque;
>>>   +    if (s->free_empty_child && !s->child->bs) {
>>> +        bdrv_child_free(s->child);
>>> +    }
>>>       bdrv_unref(s->old_bs);
>>>   }
>>>   @@ -2278,22 +2284,26 @@ static void bdrv_replace_child_abort(void *opaque)
>>>        *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
>>>        *     will not modify s->child.  From that perspective, it does not matter
>>>        *     whether we pass s->childp or &s->child.
>>> -     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
>>> -     *     pointer anyway (though it will in the future), so at this point it
>>> -     *     absolutely does not matter whether we pass s->childp or &s->child.)
>>>        * (2) If new_bs is not NULL, s->childp will be NULL. We then cannot use
>>>        *     it here.
>>>        * (3) If new_bs is NULL, *s->childp will have been NULLed by
>>>        *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
>>>        *     must not pass a NULL *s->childp here.
>>> -     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
>>> -     *     have NULLed *s->childp, so this does not apply yet.  It will in the
>>> -     *     future.)
>>
>> What I don't like about this patch is that it does two different things: zeroing the pointer and clearing the object. And if we look at the latter in separate, it seems that it's not needed:
>>
>> Look: bdrv_replace_child_tran(): new parameter is set to true in two places, in both of them we are sure (and do assertion and comment) that new bs is not NULL and nothing will be freed.
>>
>> Similarly, bdrv_replace_child_noperm() is called with true in two places where we sure that new bs is not NULL.
>>
>> and only one place where new parameter set to true really do something:
>>
>>> @@ -2960,8 +3013,7 @@ static void bdrv_detach_child(BdrvChild **childp)
>>>   {
>>>       BlockDriverState *old_bs = (*childp)->bs;
>>>   -    bdrv_replace_child_noperm(childp, NULL);
>>> -    bdrv_child_free(*childp);
>>> +    bdrv_replace_child_noperm(childp, NULL, true);
>>>         if (old_bs) {
>>>           /*
>>
>> And it doesn't worth the whole complexity of new parameters for two functions.
>>
>> In this place we can simply do something like
>>
>> BdrvChild *child = *childp;
>>
>> bdrv_replace_child_noperm(childp, NULL);
>>
>> bdrv_child_free(child);
>>
>>
>> I understand the idea: it seems good and intuitive to do zeroing the pointer and clearing the object in one shot. But this patch itself shows that we just can't do it in 90% of cases. So, I think better is not do it and live with only "zeroing the pointer" part of this patch.
> 
> I see your point, but I don’t find it too complex.  Passing `true` is the default and then calling the function is easy.  Passing `false` means there’s a catch, and then the caller is already complex anyway, so it doesn’t really make things worse.
> 
> I find the condition on when to pass `true` and when to pass `false` simple: Always pass true, unless the child cannot be deleted yet.
> 
> There are two reasons why I’d rather keep the parameter:
> (1) That’s how it’s already merged, and I’m biased against respinning given that Kevin will be on PTO beginning tomorrow, and that we’re in freeze, so I’d rather not miss an RC.

OK, that of course makes sense)

> (2) I really dislike a function that takes a pointer, NULLs it, and then doesn’t free the object it belongs to.  I find that a bad interface. Unfortunately we sometimes need this behavior, though, hence the additional parameter.  And this parameter basically asks the caller whether they want the reasonable interface (`true`) or the weird one where the pointer is NULLed but the object isn’t freed (`false`).  I find this makes the interface palatable to me.
> 
>>
>> Another idea that come to my mind while reviewing this series: did you consider zeroing bs->file / bs->backing in .detach, like you do with bs->children list at start of the series?  We can argue the same way that file and backing pointers are property of parent, and they should be zeroed in .detach, where element is removed from bs->children.
> 
> Yes, I did.  The problem is that to make this right, .attach() would symmetrically need to put the child into bs->file or bs->backing (e.g. when the removal transaction is aborted).  That would not only be more invasive (we’d have to deal with and modify the places where bs->file or bs->backing is set), you’re then also facing the problem of giving .attach() this information.
> 
> Perhaps we could let .detach() clear the pointer and not set it in .attach(), but that seemed sufficiently wrong to me that I didn’t consider it further.
> 

OK, reasonable.

If I have a good idea, I'll come with patches on top of this.

-- 
Best regards,
Vladimir

