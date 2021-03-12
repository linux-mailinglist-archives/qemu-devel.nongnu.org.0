Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A886D338D68
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:49:23 +0100 (CET)
Received: from localhost ([::1]:53696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhEG-0000UY-Ot
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKhC1-0006R4-Ct; Fri, 12 Mar 2021 07:47:02 -0500
Received: from mail-eopbgr00092.outbound.protection.outlook.com
 ([40.107.0.92]:20806 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lKhBx-0005Qj-2U; Fri, 12 Mar 2021 07:47:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHviRdS4GQOP92IXVo/bISJQNhCxkfTgzCsyMfQUBuiAH0qn5i8ScblpYLtMk0Y4oE9F6a/ivjhwR4gDXNQ1d5+cBZ4lMqVcLq/agobJV3vRf2EyvdYCRzPTb3TGpmUyQx6HhPUsNMoJZij4WdCZoZIbluUkY3H5/5Oc45EBBYJz4z5UajXEEB0wMBSR4+JlbraICpGyfAoRpH9Iju3Htc1EosfEAU+sFgJ9EeFsLauRKEQBVgpg3TE/6PKXDMDYwqC8MXeV6RP7+81j4XEcvnZW56uCmgVweeN9rqt0QvITBEFisU7cv7ISIh8xi+CrWs5+Hmq1251n+HMYc5Bs4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjX1RgvuxBnEwKipBIaT/0jQT13e58MQzkAENQCFa3s=;
 b=UXS3xgeUQVyCoMWxZ3EhAQQh1T94n/0yiXcXA4nuSHnOaSL8jdQkaKBf2t9tmIxMDzWmLEX2sgSYefep0ZEWDuJd48arqN5u0fNdWM16hsxCVpEhZMW/Out4pGukrBtJXAFsHxTlIXA9xro7jwsVSBsy77/FHRwJGhIiIwuSmlzeKtrYSEV3R7uNKCXervO3pOciI+/3mpAajweToYr1WSAsk1mQr9ojbvrdbRhTDVWiZixKKiDksrk+ro0JqVXOaVBxG2sCa7Rf3CVDiRZ7wTqOwmk8T9jjOaQft5VCcGdwujuM0B9clSwy122hlIIZCn0jEYwgD6MYaerUFUvX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjX1RgvuxBnEwKipBIaT/0jQT13e58MQzkAENQCFa3s=;
 b=u0c2aW2esMPUmD3v/SDsl32L7UluNiFFtB9st1h+IOcB0h87ZbWpF00AP41TilNob4mwVyJpT7xE6UPyZuWivmDrQft3kq9uC4L6cupsqhafCLfV2HwL9qsqyL7WS72Y+BMWeopmIhp9WLaqJa8/8nvvU+vlMEMlTUEWt8vKJTo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Fri, 12 Mar
 2021 12:46:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.030; Fri, 12 Mar 2021
 12:46:47 +0000
Subject: Re: [PATCH v3 3/6] block/qcow2: introduce inflight writes counters:
 fix discard
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
 <20210305173507.393137-4-vsementsov@virtuozzo.com>
 <72a42f79-a608-6605-c0e1-8f35303b9c81@redhat.com>
 <3f4e3e81-8750-cbe2-0d54-d7c9e0055d38@virtuozzo.com>
 <a1656b5e-8333-885f-f0c6-0a4e6dec8bd2@redhat.com>
 <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
Message-ID: <dcc0caaa-f8b6-6139-a02c-643397f0a787@virtuozzo.com>
Date: Fri, 12 Mar 2021 15:46:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <89d3bfd8-3a22-a9da-dbb8-370aa6ac2653@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR10CA0035.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Fri, 12 Mar 2021 12:46:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f84ffa7a-482d-4de9-4f94-08d8e554e614
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1971EC662ACE3FBBFA4E9824C16F9@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABIyH3ih/KRhlleEv5YpL3IyfBGDiR+MJ95G8f2DDOiQDBVRZbkDmFbduAOle83PuiixRylxawwB0Hc2N+btOAK+MKpctVhwWg+2iyNTHTGIhNBzTq62Tk8ezgoZgKX1q6asgS46VGJ6UgQYwfIHUV0w705/Suk7wWlzbbH6oYEYXCHbB3XOIfmNIcMdn97wJbyT1iZQF+yu9Ezzo/GEZ8ch8X8nFFjsncNp488wTRJJA6M2fuxi4JKWgZALRkn6ZBr1fsJwiieU9AmzF5FaaxmO6d003+0/uTcfDzZ7Hpz7BQ2oH1dS1wK5T7GB+aayrwaSt/Ckmh9LOARggcyzQZem+TjjUpjyKC59kI0Fv0QueQDbIlApKCDmmwEiKOlYpX/C7BDPLd5HkN6Qt4OtH4/KGJECKYhA+lkTFscZDnYlSp2QA5RC81zQlPtndsrKpCnMyc3ULQVdyGTJHJmvZxrqCmV/Si9vY/RP+x+oBNwLU+AjWQ75t6Pg52nnHbjXPt808PnLHldM6zmYNDYJzXWNbuoUMEfeAJVr06zWXVZao9OCGqltk2JPPNuPtCT35AQ8KegrXqkEur/lhyW3noI17fcYW+7EZGL5/1pT7mE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(376002)(136003)(346002)(66556008)(4326008)(36756003)(83380400001)(316002)(8936002)(16576012)(66476007)(66946007)(31686004)(6486002)(86362001)(8676002)(186003)(53546011)(956004)(2616005)(31696002)(26005)(478600001)(16526019)(19627235002)(5660300002)(52116002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T3lQem9zZWJ1NnNINnAwZzkzT3FoTE5HajlMYjl0RFVGUGFpSmtWRk5BU2hh?=
 =?utf-8?B?WWg3bDZ5NWpXRFBIa0R5TEhCUkNTeHBOdU1ObEhJRFBwRWtCak5TYWVMTHBq?=
 =?utf-8?B?WW1tS043bzljMzU0anpvNTJhN2NkNkdtd29pNXVxcFF1L1VwRDdiQkxrV0dq?=
 =?utf-8?B?Q21hNGUyRTBHNE8xSWJ3cTNMaHhnS2VldE9oN3VXWnRXYmg1b1A0R01Cei9O?=
 =?utf-8?B?OVJZMyt6R0w1b2pmTWpMc0RXTHlrZWE0U3c4S2orQXQ1cGh4a20ybTBRS3B4?=
 =?utf-8?B?ek5VZ2ZCL2pLV243SEZUQXNLejB4bzU3bm1uRkZsRTRrVEhZOWttU1lEL3hh?=
 =?utf-8?B?UmJSOXBFWFp1YjhBRHBPWU5TWkwybDVCZTVOSkt0VmVweU9vazloaUJYSW0x?=
 =?utf-8?B?eTN5OE1CZUIxbHJ5bzBuNmt2QWN1bDBjY01hM1Z3S0FESWtUamdnbFl2cTlX?=
 =?utf-8?B?ODhVYUVYUWtqWjN3b3lPUCtFcGFKRjRjRkZsTlFURWwvTUxUYnJzQWlYMUdj?=
 =?utf-8?B?bzdxc1JHSmU5UDVjYXU4RGZVNWsxSzRaaExxN25TMjI3VmNmNUQ1SzFLU0JR?=
 =?utf-8?B?U0FFZzlZL21HZ0dEakVSa2h0THpQdUlnL29kNitOeE02UE5vTUFDWXdBWnRa?=
 =?utf-8?B?TmFjcGFyMzBUU254ODdzTm4zeTFhMHdYODVjeVpQN00wVXR1RytSMWlBRXVC?=
 =?utf-8?B?a1dZZjNweWltTEVvWVpNNTVtcDZaTTRRYnNSOS82VWlXSTJKYm5DZWxJeE9N?=
 =?utf-8?B?LzhkTlJLZ3VQNFBVWjQ2Mk9TTzZZekc1Q015ODB3OXFNLzhKWFZVd2d4SmUw?=
 =?utf-8?B?SEh0em9vZC9abTV1UUN2L1VaSG9SMnNTTEU2SUZjWW1JeTU1dzNOUU5mRlA1?=
 =?utf-8?B?VFlwaUMySFZoTzlYRTQrOGVSNituQUVaRVZFTVo1MFBzOWZnUVViS3dkNFpV?=
 =?utf-8?B?Vk1kMnBTYnU2L09hRWl6ZS9KMm9Vb0o2ME82VDR1L3BJaCsxdXpZSWVINng3?=
 =?utf-8?B?cGtRMGFyTTJ3TUozb0ZxWG9iZDVRQkVrUEZ2SFI3cGFaTHJzeDZ2VFRIZEdH?=
 =?utf-8?B?ZTF4ZGR3ZzhlRURmUDI3QWNnUGt4MFVGaVdGSWlCV3hlaVFjYi9hSTZkQ0lY?=
 =?utf-8?B?QUx2WU9pL1BaRjIzNjNHSVVmQVVrMkxjTkNFZnAxNlUxbDUxMk50OFA1ZGxF?=
 =?utf-8?B?bm1oaXptenJsVGFWblNDbkFFbmxhT3phdHEydHQrWS96MnRTVVZZenRDYytL?=
 =?utf-8?B?d3ovZzY0aU01SStJNko0cDFVSElCTmg2R0VpNGZCOS9yemlGNXlOaklKaDFn?=
 =?utf-8?B?czg1b2ZCNUxNZmdqbmlXdExmRGFVQTFNaGdLUWdSSWFXdzYwVHZBNkc0Z0t1?=
 =?utf-8?B?MFQvN3NjTW1RSk5Kc1ZUbkYwemcrNXRrWXdWRTRKa1Y4bHVmOE1aK3lyRFN1?=
 =?utf-8?B?M01MVTcvYTFSUUF0b29VdG9PbE9PUDZ3VTBHbm1HQzRFWXJUTXpDWXo3MVRV?=
 =?utf-8?B?UGppZnBlRlRhNXVkOW93ZzV4dlFsbWVNWkM4ck1OL2psRzQ3bEpuc3lnTS9J?=
 =?utf-8?B?YXNFNkpZTDZzQlZHQ2M5MXN4WkNmYi9ia1paOWs4M1U2SEwxeEdkNDZwbjJQ?=
 =?utf-8?B?aDNRTUlBQzRPYVUyOGhMeXZmQ0VaUGZaRlZpUEJVS1pzSkRIVnVRNVpBcmZM?=
 =?utf-8?B?OWpWYTRYbmozUU5OVHc5UUtXOERuSWlpL1Z2eEpMWW1Oa0xqZUhwc1hLWXR6?=
 =?utf-8?Q?hV/GG10cnxdgUY3I+zrBWzigcBcrSobb/mGYwF6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f84ffa7a-482d-4de9-4f94-08d8e554e614
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 12:46:47.4010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV3vvpholNxVviJ/6Uq6RPaqLxxwJs/ogTeMrAEemMBH0f1JAf9kENdrRVYFRKq2FIi4TisK0l8WGz1DuLcJ0UXl+EmhK6DXJ7od0T6WXJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.0.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

12.03.2021 15:32, Vladimir Sementsov-Ogievskiy wrote:
> 12.03.2021 14:17, Max Reitz wrote:
>> On 12.03.21 10:09, Vladimir Sementsov-Ogievskiy wrote:
>>> 11.03.2021 22:58, Max Reitz wrote:
>>>> On 05.03.21 18:35, Vladimir Sementsov-Ogievskiy wrote:
>>>>> There is a bug in qcow2: host cluster can be discarded (refcount
>>>>> becomes 0) and reused during data write. In this case data write may
> 
> [..]
> 
>>>>> @@ -885,6 +1019,13 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
>>>>>           if (refcount == 0) {
>>>>>               void *table;
>>>>> +            Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
>>>>> +
>>>>> +            if (infl) {
>>>>> +                infl->refcount_zero = true;
>>>>> +                infl->type = type;
>>>>> +                continue;
>>>>> +            }
>>>>
>>>> I don’t understand what this is supposed to do exactly.  It seems like it wants to keep metadata structures in the cache that are still in use (because dropping them from the caches is what happens next), but users of metadata structures won’t set in-flight counters for those metadata structures, will they?
>>>
>>> Don't follow.
>>>
>>> We want the code in "if (refcount == 0)" to be triggered only when full reference count of the host cluster becomes 0, including inflight-write-cnt. So, if at this point inflight-write-cnt is not 0, we postpone freeing the host cluster, it will be done later from "slow path" in update_inflight_write_cnt().
>>
>> But the code under “if (refcount == 0)” doesn’t free anything, does it?  All I can see is code to remove metadata structures from the metadata caches (if the discarded cluster was an L2 table or a refblock), and finally the discard on the underlying file.  I don’t see how that protocol-level discard has anything to do with our problem, though.
> 
> Hmm. Still, if we do this discard, and then our in-flight write, we'll have data instead of a hole. Not a big deal, but seems better to postpone discard.
> 
> On the other hand, clearing caches is OK, as its related only to qcow2-refcount, not to inflight-write-cnt
> 
>>
>> As far as I understand, the freeing happens immediately above the “if (refcount == 0)” block by s->set_refcount() setting the refcount to 0. (including updating s->free_cluster_index if the refcount is 0).
> 
> Hmm.. And that (setting s->free_cluster_index) what I should actually prevent until total reference count becomes zero.
> 
> And about s->set_refcount(): it only update a refcount itself, and don't free anything.
> 
> 

So, it is more correct like this:

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 464d133368..1da282446d 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1012,21 +1012,12 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
          } else {
              refcount += addend;
          }
-        if (refcount == 0 && cluster_index < s->free_cluster_index) {
-            s->free_cluster_index = cluster_index;
-        }
          s->set_refcount(refcount_block, block_index, refcount);
  
          if (refcount == 0) {
              void *table;
              Qcow2InFlightRefcount *infl = find_infl_wr(s, cluster_index);
  
-            if (infl) {
-                infl->refcount_zero = true;
-                infl->type = type;
-                continue;
-            }
-
              table = qcow2_cache_is_table_offset(s->refcount_block_cache,
                                                  offset);
              if (table != NULL) {
@@ -1040,6 +1031,16 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
                  qcow2_cache_discard(s->l2_table_cache, table);
              }
  
+            if (infl) {
+                infl->refcount_zero = true;
+                infl->type = type;
+                continue;
+            }
+
+            if (cluster_index < s->free_cluster_index) {
+                s->free_cluster_index = cluster_index;
+            }
+
              if (s->discard_passthrough[type]) {
                  update_refcount_discard(bs, cluster_offset, s->cluster_size);
              }



-- 
Best regards,
Vladimir

