Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6CA4BC8CB
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 15:10:26 +0100 (CET)
Received: from [::1] (port=59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLQRM-0004Gq-Mj
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 09:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nLQPL-0002qi-Hs; Sat, 19 Feb 2022 09:08:19 -0500
Received: from [2a01:111:f400:fe0e::717] (port=43236
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nLQOV-0005Ag-Ny; Sat, 19 Feb 2022 09:08:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1qGfUPEJ5w36koVYI9AvFeetMQaJ+7kMX2wIqVP/SAmTMmCKu2/K2IquVHyf1xrXqP2xGZcyQ8Jz5xb1ibZoglz31WTNPr/+w0y0cS0q093rTWap+o9g1lBcBZTSNnhqbGQt9A+GkCcclpTBmyPkyVXTBe5Hg+tj71ZDJ7aesvAXbd94MqPBSkzcWx17TIJCI5NHSdOZW++UflBBUZyKxWTXKhEE3fsQHl1avMYP2ohaueJY5JCsx7HF3xk0ZTWTVhqJ8BbkBdKucZXk8UDF9WGlhU8WFE20y7AEbPWgmh297WgI9Gv3nZAYvy9Ur9008F01mQcO52WmKQuX6/PGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dp1YY1UMJKIAJVLgh5NHvxOheknqQVh/mhOOSk7DjFI=;
 b=APnzmWQ+4kxH59s019I/CfcxNQG1rzmovXZ20r1CAFRw/A9nJZ54k4tKipwXuAwe92n+eyaZ1a1RaunyuP1WKZR6ofR7MPzjjPpkgPks5DzSN4iqkKu2/H+gKGbKNPRRdTtks94Z5Uw/awbB52j7b66HJPU2r3852+KIAMCUc7W2u6ZTIThe+u4tJ4rtUuJ2eDgnW8vTmGErubPboEHwI8R/bDGVsEQ0dj9+ni9aT1qbop7/Uf9gymUB/B81CGvjyfCESJqAkJ/aNowTP+2PwVDYJPu5rXa52c6hufRAM9ICRgKfa9MmhJKn6cJuBECwBGwHL5u4va37sNUU4wta7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dp1YY1UMJKIAJVLgh5NHvxOheknqQVh/mhOOSk7DjFI=;
 b=hXXAFq7m6pGhNyBDnxZNwx2D4dKnRWS19aeikV+QD4YRC1zlH/iurV4QMahx9hkDyD6vJXp8HxX6tK1ZqFuGqXzpZ3lzV0TFinGNDL2QQdW761K0ICtdDvdVSOkyeQiQJt9duP4vqXiZfVS4Vm9DJABaadpqRbbNDAxxdEHBI0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB9PR08MB6811.eurprd08.prod.outlook.com (2603:10a6:10:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Sat, 19 Feb
 2022 14:07:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.022; Sat, 19 Feb 2022
 14:07:21 +0000
Message-ID: <6df37639-95c3-106b-2e34-799d16f117c2@virtuozzo.com>
Date: Sat, 19 Feb 2022 09:07:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] block: simplify handling of try to merge different
 sized bitmaps
Content-Language: en-US
To: Nikta Lapshin <nikita.lapshin@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
 <20220215175310.68058-5-vsementsov@virtuozzo.com>
 <fe21dd14-1387-87e4-73e5-5d7945a3103b@virtuozzo.com>
In-Reply-To: <fe21dd14-1387-87e4-73e5-5d7945a3103b@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf36dcf4-ffad-40ed-f501-08d9f3b12584
X-MS-TrafficTypeDiagnostic: DB9PR08MB6811:EE_
X-Microsoft-Antispam-PRVS: <DB9PR08MB68113C8F989E3A51CFA67290C1389@DB9PR08MB6811.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFRI7/BbxfV7UogI4Rl4Sme4p+t+sIQvOuBPAqLWSOXNmooWNU641IzF2+4r2VisLzU8LPSrHpqenwAaNlh/EoXFunURBoEHt7vqtON7rnOtxjjEpGH0YdQzShLipYvH3HSsWoX1GKQckuAzzNyi2YbFwrDDpjaGyrZodwgVsCTLgXaMd5eMU4brwK+R5EWqNO9kdaQn73XWP/MoONxHPgr0bDS43klPu8g/J4pfIciLruflez3bLKhY88RYS40uHdfp6/tvh97cYWPg2l4VKaFlGEruaCI7Ni6pKsfGb3ygGbqST7O69hVP6FIIaG97VWsMTdDmbaBAkOg0y9crC2jOiVi4z3rFwymCrutPBjcagGfYT/e2TFuA2ZQGkj8IMY6wv7gYqyR+3QPyTv4t64DpX4SJAYuwcqvt13a8n0Luj/7mAna4IXyGRkGQmOHMvD++fl/HSJaTij9OZCRC3eZorYLd5HL8TR0LU5/qXUYuT8siBhZLQEuv03ZdPHmuJeM6uIPSjQzFu4UHUd21/6SE/CZmR+rXUEvIqkC0OgrUaejzu2FY58C/gcZ/S0k/Mf/B6KUgehOxumpXFJSV8nJnP6jjWUZFe0CJY5TJK8h3kSkFGpnGycRO5CDGH13iN+4Qq3Gw7RyIkJuVcQz8tng5xzZbsmxMBxysNXXgHHUb6cSbqJmAxA8sO9+J+dT5MFarUbCiq/p+FVZG7XFmrZOpmP1vmlJxoyuQmNrqBV0KY/nw7pnh1WgumsEmsU7Lc1+ESN5ovQem/D7WPnNbUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(6486002)(38100700002)(86362001)(2906002)(31696002)(38350700002)(66946007)(2616005)(186003)(66476007)(66556008)(31686004)(4326008)(8676002)(83380400001)(52116002)(53546011)(316002)(36756003)(6506007)(6666004)(508600001)(26005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SCtSMnVIM2krV1RWcVdETDJrSVhqN2dCTUdOakkxSEpSTUxxTGdYd2lPU0FN?=
 =?utf-8?B?WjcrL1JhdmtyMFZBTk9GLzRDSjBSbXhHcjFYL0c1RC9WbDdSdGJUT1pEOTM2?=
 =?utf-8?B?elB6dFJJTFBvelRRdWFNR2ZsTmNPTFZSZEduWUE4M1RRaSs3bmlkdjBmNWhZ?=
 =?utf-8?B?ekdDR1RlMWVvT04weGwxaDg0REdWb1pPZ0dQRk9uQ0VLaFkxdmtUQ0NJTk5B?=
 =?utf-8?B?U0RUTDlMVWd5NWFBNTN4WGd6Um9hTnNCbytkdDljQnJIRW1XRDZOYytHYktF?=
 =?utf-8?B?Znl0QU50NG1vcEJiTk5Qem1iQmFuSXJIOWRrWnkrQ0xIQzVaWGQxSTh6akFU?=
 =?utf-8?B?ZHJGTXlWTWd4YVU1L2VzMVp1T2hhcDZtRG9oZ1laM3lwUDV6TUpPVXEza1N4?=
 =?utf-8?B?TVI1bmNoRDRVOGEvKy9rRjVnYjF1SlAveUtrcnBrTHgvYXphcU9pak15WEpO?=
 =?utf-8?B?cm1oQ2JUeGloNTJqNDlDTmd0L0lnbnJpcU1HN2FLV29ueUtpZ1VadGNiZ2xH?=
 =?utf-8?B?YnFDc1dIU3d4U2pmcjVQdE82ZEgvazVNL2dCN3hBY3MwSVVsajdEeTVZVTNO?=
 =?utf-8?B?eFRqWFhVQ2RocUdNNVovdEd4MEttRFhZOFZYSGg0MTljTEo1cUU4SHNkdVNP?=
 =?utf-8?B?Zmh2R3plYnhxalREbW1yK2JHK09Selk3WUFzN3UrVVlLY25mRnJTWmNzRTdj?=
 =?utf-8?B?bnptV1UwUUpqRTFSb1BKTFJzS0NhK011akpoN3Rkb0FlL3gycElJVHczV2Zi?=
 =?utf-8?B?NWU5dFBwMXAySXpPVm9QMmgzbkVtVzRGQ3hnL2NEbm9yM1ZYaEdYVTkrUHpO?=
 =?utf-8?B?L0FpTGJrM2JLYUtobUh3RktzK0ZrQkg2UnI0enQ3Q1VtNlZPcTJFM3I4WmNJ?=
 =?utf-8?B?Ukl3UWcwVDkzSkZ0dEJPbDdTSk5xbDV1QUVHRExtUS80RlBXL1VENDE2WDJP?=
 =?utf-8?B?WnZLZ3IrdFNPemlDMm5qQnNtVUU4WW5QR2JVd0dvQmo4eVhnZ0k5SzBsZUQx?=
 =?utf-8?B?YzdKdVFNMjliRXBFd3paSnh6UjR5UTB1OVp4WGw3Y2RQREd1ZFBFTUc3QXht?=
 =?utf-8?B?MHJKcXRWUVNWWFFVZHZkcURGb1c2RmNlZi9GQVFVbUdCUFJ6enhSUmRET1JO?=
 =?utf-8?B?YmtYa3I2ZU9QOUdrQ3dpWnl3UE1NQjl0MlFPNXd1VXlIQUF3RG9GOVFBRDNV?=
 =?utf-8?B?eXlWbkhiMUVGRDU3dUNJa0U2N2pSZ041eW5HSnB0ajNkT3hvNGFYWHN5ZlZl?=
 =?utf-8?B?eU9qNm5PWGdzTTl4OFZtQ3N2RGZTVSs3VCsvYSsvcStVaWErQTRDOXBDYWRJ?=
 =?utf-8?B?TEE1T2NURStmUjI4d3ZsY0N1WWZKekc0QTVKZWp5dExhL0xtQ1BON3BvNjQy?=
 =?utf-8?B?cHh5NDJ4Y0F4R2VnS0RWTFhQV3ErZEdCTXQ5RlRIUGF3VlBRcFpyMGFYVWRS?=
 =?utf-8?B?T1A3c3pYS1lidEVnVHd0MlBSRmJjZGd4STAzZmYwVDVUK09XeW9KOTFEWFow?=
 =?utf-8?B?YjhOUzVYUHhuV0VqTVlvV2ZzcHRPWXNGSlhyeXdYU3NFbk5JVVFVTTFkaUMw?=
 =?utf-8?B?MkZkT25WQTJwVVpFcHZxK29zakZrWGV3aGdrMHZlUnZIbXdZUXgwNVRRdTk5?=
 =?utf-8?B?cThNTTlPR2VLeVgrd1JyZXVkeGlPTkQ4V3BMT1R1Y0xQR2M3WWo5TFhxRFlT?=
 =?utf-8?B?Y01TTllBMGx6R2FkaEtISDlxM0pmbXlYRVA4WmFNWnp4REJiRFU2NUxjdjNX?=
 =?utf-8?B?bUFGV2JEVjRoZHUydEx5VkhVZG54aUdVRTBocy9EUXRQeTdhOXcxeG8yaGtz?=
 =?utf-8?B?emh6N1FlVmF2bWFETlU1REdXcWhRTEZpYVR1RzJ3TzlZTzJaNkVRQTBSdjh6?=
 =?utf-8?B?Rmx3a1hNNlJtbWRrVVdzdWNZNytpS1FsQmp2UkJTYnRwMkZsSFRUUmVwNVA5?=
 =?utf-8?B?SE5YOUM5eW5XbEZPdk5rMEsrU2RKZTk0SnNYWkgvVWlhMVJRQ0wwVUFPdDNN?=
 =?utf-8?B?VlhmcDNSVTZIRXlnaUVtUExka0t0aWR1dy8rNXY0ZGZPL1pTMnQ2Vlo3aDQv?=
 =?utf-8?B?aXhaMG1Za1dzYTdwVTFTcTEzSlUrdzUxZFZMbEY5eURvNlZxYk00ZVNuQmJw?=
 =?utf-8?B?THJTTnpaVzBPRHZERFJNa3NBSENHS1JObWhyVk8vMWpIb2NoQjl0ZUJoRzI4?=
 =?utf-8?B?TjUzbkZjUlBveDNMbDJIS1JZVlhKa2xPbTRHL2FGRlU2ZFF2d1lVTXdPTGZ3?=
 =?utf-8?B?ZVJZWVZoOE1yMTRFcmV3Wmp3OE5BPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf36dcf4-ffad-40ed-f501-08d9f3b12584
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 14:07:21.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUJr/zWs2F59FVdqNnEFFGejiTxDLWYHGS/hbTsCAwkY89Utsg8aMcT2ke9RYqJlQQjwH0vfCb0lwpm1q6E7ARdcdvl+nAow5H3e/C7J/TE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6811
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::717
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::717;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

19.02.2022 06:04, Nikta Lapshin wrote:
> On 2/15/22 20:53, Vladimir Sementsov-Ogievskiy wrote:
> 
>> We have too much logic to simply check that bitmaps are of the same
>> size. Let's just define that hbitmap_merge() and
>> bdrv_dirty_bitmap_merge_internal() require their argument bitmaps be of
>> same size, this simplifies things.
>>
>> Let's look through the callers:
>>
>> For backup_init_bcs_bitmap() we already assert that merge can't fail.
>>
>> In bdrv_reclaim_dirty_bitmap_locked() we gracefully handle the error
>> that can't happen: successor always has same size as its parent, drop
>> this logic.
>>
>> In bdrv_merge_dirty_bitmap() we already has assertion and separate
>> check. Make the check explicit and improve error message.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
>> ---
>>   include/block/block_int.h |  2 +-
>>   include/qemu/hbitmap.h    | 15 ++-------------
>>   block/backup.c            |  6 ++----
>>   block/dirty-bitmap.c      | 25 ++++++++++---------------
>>   util/hbitmap.c            | 25 +++++++------------------
>>   5 files changed, 22 insertions(+), 51 deletions(-)
>>
>> diff --git a/include/block/block_int.h b/include/block/block_int.h
>> index 27008cfb22..cc40b6363d 100644
>> --- a/include/block/block_int.h
>> +++ b/include/block/block_int.h
>> @@ -1382,7 +1382,7 @@ void bdrv_set_dirty(BlockDriverState *bs, int64_t offset, int64_t bytes);
>>   
>>   void bdrv_clear_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap **out);
>>   void bdrv_restore_dirty_bitmap(BdrvDirtyBitmap *bitmap, HBitmap *backup);
>> -bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>> +void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>>                                         const BdrvDirtyBitmap *src,
>>                                         HBitmap **backup, bool lock);
>>   
>> diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
>> index 5e71b6d6f7..4dc1c6ad14 100644
>> --- a/include/qemu/hbitmap.h
>> +++ b/include/qemu/hbitmap.h
>> @@ -76,20 +76,9 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size);
>>    *
>>    * Store result of merging @a and @b into @result.
>>    * @result is allowed to be equal to @a or @b.
>> - *
>> - * Return true if the merge was successful,
>> - *        false if it was not attempted.
>> + * All bitmaps must have same size.
>>    */
>> -bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
>> -
>> -/**
>> - * hbitmap_can_merge:
>> - *
>> - * hbitmap_can_merge(a, b) && hbitmap_can_merge(a, result) is sufficient and
>> - * necessary for hbitmap_merge will not fail.
>> - *
>> - */
>> -bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b);
>> +void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result);
>>   
>>   /**
>>    * hbitmap_empty:
>> diff --git a/block/backup.c b/block/backup.c
>> index 21d5983779..fb3d4b0e13 100644
>> --- a/block/backup.c
>> +++ b/block/backup.c
>> @@ -228,15 +228,13 @@ out:
>>   
>>   static void backup_init_bcs_bitmap(BackupBlockJob *job)
>>   {
>> -    bool ret;
>>       uint64_t estimate;
>>       BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
>>   
>>       if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
>>           bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
>> -        ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
>> -                                               NULL, true);
>> -        assert(ret);
>> +        bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap, NULL,
>> +                                         true);
>>       } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
>>           /*
>>            * We can't hog the coroutine to initialize this thoroughly.
>> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
>> index d16b96ee62..9d803fcda3 100644
>> --- a/block/dirty-bitmap.c
>> +++ b/block/dirty-bitmap.c
>> @@ -309,10 +309,7 @@ BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *parent,
>>           return NULL;
>>       }
>>   
>> -    if (!hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap)) {
>> -        error_setg(errp, "Merging of parent and successor bitmap failed");
>> -        return NULL;
>> -    }
>> +    hbitmap_merge(parent->bitmap, successor->bitmap, parent->bitmap);
>>   
>>       parent->disabled = successor->disabled;
>>       parent->busy = false;
>> @@ -899,13 +896,14 @@ bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
>>           goto out;
>>       }
>>   
>> -    if (!hbitmap_can_merge(dest->bitmap, src->bitmap)) {
>> -        error_setg(errp, "Bitmaps are incompatible and can't be merged");
>> +    if (bdrv_dirty_bitmap_size(src) != bdrv_dirty_bitmap_size(dest)) {
>> +        error_setg(errp, "Bitmaps are of different sizes (destination size is %"
>> +                   PRId64 ", source size is %" PRId64 ") and can't be merged",
>> +                   bdrv_dirty_bitmap_size(dest), bdrv_dirty_bitmap_size(src));
>>           goto out;
>>       }
>>   
>> -    ret = bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
>> -    assert(ret);
>> +    bdrv_dirty_bitmap_merge_internal(dest, src, backup, false);
>>   
>>   out:
>>       bdrv_dirty_bitmaps_unlock(dest->bs);
>> @@ -919,18 +917,17 @@ out:
>>   /**
>>    * bdrv_dirty_bitmap_merge_internal: merge src into dest.
>>    * Does NOT check bitmap permissions; not suitable for use as public API.
>> + * @dest, @src and @backup (if not NULL) must have same size.
>>    *
>>    * @backup: If provided, make a copy of dest here prior to merge.
>>    * @lock: If true, lock and unlock bitmaps on the way in/out.
>>    * returns true if the merge succeeded; false if unattempted.
>>    */
> 
> There is no return value after this change.

Right, thanks!

> 
>> -bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>> +void bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>>                                         const BdrvDirtyBitmap *src,
>>                                         HBitmap **backup,
>>                                         bool lock)
>>   {
>> -    bool ret;
>> -
>>       assert(!bdrv_dirty_bitmap_readonly(dest));
>>       assert(!bdrv_dirty_bitmap_inconsistent(dest));
>>       assert(!bdrv_dirty_bitmap_inconsistent(src));
>> @@ -945,9 +942,9 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>>       if (backup) {
>>           *backup = dest->bitmap;
>>           dest->bitmap = hbitmap_alloc(dest->size, hbitmap_granularity(*backup));
>> -        ret = hbitmap_merge(*backup, src->bitmap, dest->bitmap);
>> +        hbitmap_merge(*backup, src->bitmap, dest->bitmap);
>>       } else {
>> -        ret = hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
>> +        hbitmap_merge(dest->bitmap, src->bitmap, dest->bitmap);
>>       }
>>   
>>       if (lock) {
>> @@ -956,6 +953,4 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
>>               bdrv_dirty_bitmaps_unlock(src->bs);
>>           }
>>       }
>> -
>> -    return ret;
>>   }
>> diff --git a/util/hbitmap.c b/util/hbitmap.c
>> index 305b894a63..d0aaf205ed 100644
>> --- a/util/hbitmap.c
>> +++ b/util/hbitmap.c
>> @@ -840,11 +840,6 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
>>       }
>>   }
>>   
>> -bool hbitmap_can_merge(const HBitmap *a, const HBitmap *b)
>> -{
>> -    return (a->orig_size == b->orig_size);
>> -}
>> -
>>   /**
>>    * hbitmap_sparse_merge: performs dst = dst | src
>>    * works with differing granularities.
>> @@ -868,28 +863,24 @@ static void hbitmap_sparse_merge(HBitmap *dst, const HBitmap *src)
>>    * Given HBitmaps A and B, let R := A (BITOR) B.
>>    * Bitmaps A and B will not be modified,
>>    *     except when bitmap R is an alias of A or B.
>> - *
>> - * @return true if the merge was successful,
>> - *         false if it was not attempted.
>> + * Bitmaps must have same size.
>>    */
>> -bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>> +void hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>>   {
>>       int i;
>>       uint64_t j;
>>   
>> -    if (!hbitmap_can_merge(a, b) || !hbitmap_can_merge(a, result)) {
>> -        return false;
>> -    }
>> -    assert(hbitmap_can_merge(b, result));
>> +    assert(a->orig_size == result->orig_size);
>> +    assert(b->orig_size == result->orig_size);
>>   
> 
> When hbitmap_merge() is called it is impossible to know if 'a' and 'b' have
> the same orig_size.

orig_size is the same as size of corresponding BdrvDirtyBitmap.

So, for QAPI, we can simply check sizes of BdrvDirtyBitmap objects. And for all other uses we always sure that bitmaps are of the same size.

> Of course there is workaround as it is shown using
> bdrv_dirty_bitmap_size. However one function for checking looks to me better
> than workaround. May be I missed the idea so I don't insist on it moreover.
> 
>>       if ((!hbitmap_count(a) && result == b) ||
>>           (!hbitmap_count(b) && result == a)) {
>> -        return true;
>> +        return;
>>       }
>>   
>>       if (!hbitmap_count(a) && !hbitmap_count(b)) {
>>           hbitmap_reset_all(result);
>> -        return true;
>> +        return;
>>       }
>>   
>>       if (a->granularity != b->granularity) {
>> @@ -902,7 +893,7 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>>           if (b != result) {
>>               hbitmap_sparse_merge(result, b);
>>           }
>> -        return true;
>> +        return;
>>       }
>>   
>>       /* This merge is O(size), as BITS_PER_LONG and HBITMAP_LEVELS are constant.
>> @@ -918,8 +909,6 @@ bool hbitmap_merge(const HBitmap *a, const HBitmap *b, HBitmap *result)
>>   
>>       /* Recompute the dirty count */
>>       result->count = hb_count_between(result, 0, result->size - 1);
>> -
>> -    return true;
>>   }
>>   
>>   char *hbitmap_sha256(const HBitmap *bitmap, Error **errp)
> 
> With changed description:
> Reviewed-by: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
> 

Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

