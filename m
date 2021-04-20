Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCA4365DF6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 18:55:28 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYteq-0007rg-2a
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYtbp-0005yW-OW; Tue, 20 Apr 2021 12:52:21 -0400
Received: from mail-eopbgr130094.outbound.protection.outlook.com
 ([40.107.13.94]:47949 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lYtbm-0001se-OB; Tue, 20 Apr 2021 12:52:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zt+u5Aus/6Yq3tUpkL0uECxHupal/S27/Bn5OrkU/H30Q1TV/LK+uEII6K+XEhOa8tXeOvgVFGcJ6DG2ZyZ2eST25boh0N8CWZEPzEmbOuYA833l+hblMZ9ZWV/fIG21z/DiUWCF8xP5+NkTKEq51fotFMsw6tTdNxPG4BQPwCtiLxGkpA6ndaeOlfCXsMNFiX2HCGz13JkzFnBhuHrUD1p4yzy2r0LD2TFBqqpRYAHZ8+cK4RdlIwkGxh1wSi4aTcxUp+4QfQ+5FLX6zl+urxwlD65UvKIl1HYtqm0Wt0jSk4uVgdJXyVfwzm2yMl0wucj2Y62nbcFjpjoOebnLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzoDT0UNBew8Hfg77osxRMDkf1S1j5VCWe3Z3vmUqz4=;
 b=D8S0Sc0p4prECqoRGK/CR9oiYjaSI9dB9SVP6TqTAiglzOauV7c0mlksz4cDwB4q6Ww1buh6JiiNy3TikPgscD3mlU9Dh8R/HlzHzbZZF0X6GPeBQcs6Hj57h5Afyks3+qN5JoP9HtJQ0RnTwLGNPrbDvLZ9mLkkBHcBy9ADTNNuztb/Gr7UBftWcAfe6KhnegACIskqwkprbzBDNKlojOWXvFVJpzN42PcGuJVkkVgNmyQqfgPzZHhiLm3VkfwWEVjO6kvubOJpwFYsyPl42LKjbdrhXGkyMWfM9D4rwXPs9X+KIxN96XjSXk/64TX0dgyTMqsUtEbbUvf4/1X4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzoDT0UNBew8Hfg77osxRMDkf1S1j5VCWe3Z3vmUqz4=;
 b=R/sf3DPleGlqFnUH0jsB2WkXzO+y++fX1G7dAeDVYsV530h12m5C/QmHji3X/+zx880vPpyoI8WVk7JPMy7oahIK40i+sARrg2Nsm2ihJ+yY7/lyx0p7UrAQ9tVNsCSkl6eulM5ozCX05S+agANqk8t7CsF/VCtCcyh4I1r72U0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 16:52:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 16:52:14 +0000
Subject: Re: [RFC PATCH 2/2] qemu-img convert: Fix sparseness detection
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com
References: <20210415152214.279844-1-kwolf@redhat.com>
 <20210415152214.279844-3-kwolf@redhat.com>
 <06e1910c-102a-e41d-116f-00458f41243c@virtuozzo.com>
 <YH7tah47XxdYs3VW@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f0ba8d30-3380-41d5-e3e7-c1ee52fc46be@virtuozzo.com>
Date: Tue, 20 Apr 2021 19:52:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <YH7tah47XxdYs3VW@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Tue, 20 Apr 2021 16:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 699c1096-758d-47a6-f2fd-08d9041ca60d
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-Microsoft-Antispam-PRVS: <AM7PR08MB54477BC6F1890FF596A984DCC1489@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQm2BeyI3JJwlt4T/j0xR1o703JNHZOsgS97QP13DfQiyNdPof1vKlY0revTKtN0J7Jxm5KFW2k28YXiT4EyJwOnjRQCvCSQ8JDhIwa+RWGe8r2kUmgBvndI7J2b9We48FACg4Z9/OT2B8jENVSWgVxamZZdpuIltdZJ5mCcl9cPaG3gCZYSAy6dFYHJtcfT4UQr6vqG2J4TvQ67Dv33cRu1BYM7YimHQOBxaVYBpjBb1EIHEvqasmXa8ZrzdMWDdAQ/qfcNhacGrJbNZmxZyfK0cshkJQ+Dc5GYjfX9m/Gqg6VRNP2f8GXX9TY3op7fPoelEPi1m15WhIpRWEg1XpaebNkMDVj56lZooi8On87oUwZByAXc0NO/N/FkoTAa6aZyClDReR3i9XlMPqLbGN8irewzURivZE2480G6n1ntQrIE56FSioChrmmi5Ji+duLEtii3bAkN1rUBk/UYHzIfBlpIAe/OHWJAHkf7k2z0/7i8f4id2KlaRboq0jSQnJbwoxmIVcVjmKvnC7KZ7mQBVNyeCCmr4wPvp/vLP35tAXxckEAQ0kkKl4+paTH93uJjKUDhL3ZUGt4nXB5xg9p9tIcH6nbcvlARB3UhdxBqH3AkTz74jF8zUinib2R6Bxa4KpFWKiuwDVG8tqpEULRKu2o0hevUshNJvKZpMHz3uCGDWhR4HOJRR4PwtPc69Gzod/CZnrCaP7iL9xVUVP7xHfIEm3w6d7aE8fEoxU4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39840400004)(396003)(6916009)(6486002)(83380400001)(38100700002)(316002)(38350700002)(16576012)(8936002)(66946007)(66556008)(66476007)(2616005)(8676002)(956004)(31696002)(5660300002)(478600001)(2906002)(31686004)(52116002)(16526019)(186003)(36756003)(26005)(86362001)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ajVqZnNIY1g4OEVhQ3ZyUDdNamVua0t0SHdnSU4yVThrWDA3a0xsRERWend1?=
 =?utf-8?B?cUYxMFZFRjhTc2UvdnA0bUVqN2FUR2VJVnlvREN2M0xneEZDWUNxNWFnelN4?=
 =?utf-8?B?TzdSaExWUzFLTXBUV041WGdOKzd5STFlUXJrOHZaN2ZVTmR0OXdFUitWQy8x?=
 =?utf-8?B?VGN0ZlJpRjN5ZG1RMGp6Y01iSURBSjBNQi9ZYUVMajFnMGRVVzAwZFArWS9o?=
 =?utf-8?B?MjR5NnpSQ1VhdFc0bVhqSk1PZTQxQUh6MnBuanNmbGUyNjdaeXY5T2oyYWhX?=
 =?utf-8?B?dnoybTdSeDRlY2NidjVHSnlIUnhYby8yWU8wMDZ0ZnloallFM3hFcitkUG5O?=
 =?utf-8?B?VW53RUx0R0dZc0VZUG1yZXgreVRkbmhIT3RvcEltVWlQaDZnQUhNazQwOElK?=
 =?utf-8?B?OFV3cTM4MmJ2Z3hPRlZNZ000WHZYeDZLa20wd3VibjZCRWZrT2EvS0JncHRk?=
 =?utf-8?B?bjREQkE2YnZZVXppNzhjSVJyVEYydWdFQmVUT2pVQ1p1SVVjamFrYkJDNmxi?=
 =?utf-8?B?ZXRIZEM2OFhSMWNXcnIxV3ZCKytHSUpYQXlzL0lRNjNyV0RtYWtHZnBjVmps?=
 =?utf-8?B?Y0dxVlIwOTd3a1N1ZXhidGxWcDdvNXZ2dHRYMDBkMVN0dDBtazNMblk5VU1V?=
 =?utf-8?B?bC82dnNPb0cxbEJuQmtsSklDL0ZTM3FRNENEa0JkeDdpL2l1anZSNU1YU2Q3?=
 =?utf-8?B?ZExCeW15NHdXMFFjZnhVSG1USDhoRnlmZnM1OTFVem1RS2g0T1VWaWErTFlq?=
 =?utf-8?B?TTFwT1pPeEo0ZnVRQmJXS09mRFE0SC9mcDRzQVFlNkdicHVuUVVrMWIrSzNR?=
 =?utf-8?B?cVNkZHJ1MFZ4d3puQndGaUhKdVdQdy9XajRGZVVpNFFUeHBoNXBHQkdxNmVq?=
 =?utf-8?B?dlZuUWpkWVhZRmx1L0hzMzVKNnBjSFVRdndoTjQyL3Rnd2w2NitVTm1NMHlk?=
 =?utf-8?B?MUpGaHRGa0owQUdyaDR0TEh0eHNRQm1lVlNIcmpTMkZhd1prM1hLa05NOFpC?=
 =?utf-8?B?NEJSMlh6ZVV6TmRIS2F1VWU4K0hqNFJhMms1RnVRTUczc0g1dkVGWnZvR2Jn?=
 =?utf-8?B?Tkt1b2NVR0phem12OWY3VVdHNUdDL1pUU0RFYTVsa1BSQzhLMkdMWEhYRUFF?=
 =?utf-8?B?V2phR0RQUnNGdHVuS3krWjVIUDU0UUs0dUc5VGNGTGJkOTAzcU1jN0hCRGJa?=
 =?utf-8?B?MlZVWHhEMkVzYnI2b2NiYTF6Mk1SaE9KV3ArbHRlcXRHeXlpRWdmMmJycFBR?=
 =?utf-8?B?NTV5eUZud3liZnJsbWFnZkQweU9zZm9JbDE2UGgvN25wc0hoMUJRaWJVTmtR?=
 =?utf-8?B?RzlPWW53UmNXZzdtNURTdGV4aDFGUEFHcjhwS1dNa2xtZ3I2NXdrUndyYWs3?=
 =?utf-8?B?UENWR2pEbUtXQmc4S3NqdGcvYXoyQU54eGpyQlZoOVMvVkl5cHlhK2daWDFs?=
 =?utf-8?B?VkU2OHIzSUVMQ3RlSEZUMzNrSlZ2ZElkNWR1REZ2Y2dkRHFkSkJIS1J0ZFBp?=
 =?utf-8?B?Tmk3K0NjbzhUUC9zSTJpdzJaNG9tRUltSktsdnFyak9OM0hCeGh3ekNhSzRw?=
 =?utf-8?B?MWFmd2dqTHNUeit1bis1M2tXY2U3OXhkbVUrYnlBdkwwNXZRTk0yak1iUW9k?=
 =?utf-8?B?N2xrNVU3ejJnMGRwMzR1Ym5RZlp0ZERVNysvZm5lQ3I2UnB1RmkrajgwaXVp?=
 =?utf-8?B?UXI0NDFaeGlmNVhqUXlUMUw0d3h3OTRTZ1lzaWl6T1EyczZXcjFFaUFCQlE2?=
 =?utf-8?Q?LWJsgQR5QpqkyfcOh5Q4F53FgCf+ZHnP8ZjQL/2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699c1096-758d-47a6-f2fd-08d9041ca60d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 16:52:14.2497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i6D+ws0Jidc94qYC9gSwH2WiITbwMv1xIwxVGueJZuZWACFs3lErjLFZO4ZzgYVM+5kg76cyWQhB+8Mnj2y6Rq2bPO4Q5OZDsGEOSAome9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.13.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

20.04.2021 18:04, Kevin Wolf wrote:
> Am 20.04.2021 um 16:31 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> 15.04.2021 18:22, Kevin Wolf wrote:
>>> In order to avoid RMW cycles, is_allocated_sectors() treats zeroed areas
>>> like non-zero data if the end of the checked area isn't aligned. This
>>> can improve the efficiency of the conversion and was introduced in
>>> commit 8dcd3c9b91a.
>>>
>>> However, it comes with a correctness problem: qemu-img convert is
>>> supposed to sparsify areas that contain only zeros, which it doesn't do
>>> any more. It turns out that this even happens when not only the
>>> unaligned area is zeroed, but also the blocks before and after it. In
>>> the bug report, conversion of a fragmented 10G image containing only
>>> zeros resulted in an image consuming 2.82 GiB even though the expected
>>> size is only 4 KiB.
>>>
>>> As a tradeoff between both, let's ignore zeroed sectors only after
>>> non-zero data to fix the alignment, but if we're only looking at zeros,
>>> keep them as such, even if it may mean additional RMW cycles.
>>>
>>
>> Hmm.. If I understand correctly, we are going to do unaligned
>> write-zero. And that helps.
> 
> This can happen (mostly raw images on block devices, I think?), but
> usually it just means skipping the write because we know that the target
> image is already zeroed.
> 
> What it does mean is that if the next part is data, we'll have an
> unaligned data write.
> 
>> Doesn't that mean that alignment is wrongly detected?
> 
> The problem is that you can have bdrv_block_status_above() return the
> same allocation status multiple times in a row, but *pnum can be
> unaligned for the conversion.
> 
> We only look at a single range returned by it when detecting the
> alignment, so it could be that we have zero buffers for both 0-11 and
> 12-16 and detect two misaligned ranges, when both together are a
> perfectly aligned zeroed range.
> 
> In theory we could try to do some lookahead and merge ranges where
> possible, which should give us the perfect result, but it would make the
> code considerably more complicated. (Whether we want to merge them
> doesn't only depend on the block status, but possibly also on the
> content of a DATA range.)
> 
> Kevin
> 

Oh, I understand now the problem, thanks for explanation.

Hmm, yes that means, that if the whole buf is zero, is_allocated_sectors must not align it down, to be possibly "merged" with next chunk if it is zero too.

But it's still good to align zeroes down, if data starts somewhere inside the buf, isn't it?

what about something like this:

diff --git a/qemu-img.c b/qemu-img.c
index babb5573ab..d1704584a0 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1167,19 +1167,39 @@ static int is_allocated_sectors(const uint8_t *buf, int n, int *pnum,
          }
      }
  
+    if (i == n) {
+        /*
+         * The whole buf is the same.
+         *
+         * if it's data, just return it. It's the old behavior.
+         *
+         * if it's zero, just return too. It will work good if target is alredy
+         * zeroed. And if next chunk is zero too we'll have no RMW and no reason
+         * to write data.
+         */
+        *pnum = i;
+        return !is_zero;
+    }
+
      tail = (sector_num + i) & (alignment - 1);
      if (tail) {
          if (is_zero && i <= tail) {
-            /* treat unallocated areas which only consist
-             * of a small tail as allocated. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. So, let's just write data now.
+             */
              is_zero = false;
          }
          if (!is_zero) {
-            /* align up end offset of allocated areas. */
+            /* If possible, align up end offset of allocated areas. */
              i += alignment - tail;
              i = MIN(i, n);
          } else {
-            /* align down end offset of zero areas. */
+            /*
+             * For sure next sector after i is data, and it will rewrite this
+             * tail anyway due to RMW. Better is avoid RMW and write zeroes up
+             * to aligned bound.
+             */
              i -= tail;
          }
      }


-- 
Best regards,
Vladimir

