Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30E4101D0
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 01:38:04 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRNQh-0002pt-2T
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 19:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mRNP2-00020b-RQ; Fri, 17 Sep 2021 19:36:20 -0400
Received: from mail-eopbgr10133.outbound.protection.outlook.com
 ([40.107.1.133]:24818 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mRNOz-0004o4-8t; Fri, 17 Sep 2021 19:36:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzjfCv28/VusuLspWzWZAWN0YNk8ZaZCxo5k7wmVB4o0aiAfoRA0ar4mYGlAEgZLfT44m4fYOPJjzIJNum99gq/VohJv4jsQs2nKCFP6An3C0QqSfYw8Mb7uqJkB0RinVYyuMBc2ls2U6fMOaefGbwrBqZseB66tic9z0I3qtmpMOKRkWuH0KMeOZcCf69itwm9Y2zncoMi1/E68YmfWvvLCj3jqyGQVYPB4Zn0QxPgI+n4fsQ+17hQsd7B5Cflsq/SULRqV0G+q42sbwCAt1t2KSahm42prRoAuZTAfcCoQCkQw7H0jrWIGnNgvLkM3k7SDAvwagPHNZRy/sS3LUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=8qefXiApFb7qHxv3UhzD7VKSEvx9kpknBeARBR3lDLA=;
 b=evGfyqIYTzSNhMHtk6mSYzqRF/L8d9T0xCHEPn6XgOrkDawdTrQfnIs8STrVPP4iB/KkS66t3SxLnBKKs6hswlXaQ4OOPrdNmjEk+pIfsD+d2LGIrdzEZqZbB5ZWjIuV82gUU/i6HwNgqjkzZnvNU0mTvUGIUOrpuPZP/qUORRKmNbGVbxHYhsay9a5JSyTlvvXNCM1gZeQFWUrRyaamAMEM3IzTLr/MZ0CaiQti2j5RZjeoqwf9hzdcPCpupMpd62SSW+UXAt6Wl3wrPHtbj56TpIoOyb7sL9xxwyvh4Bf5Ejwv7HjEHJjRSKlVdQb7d27pubWzJStYHCesTpUeTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qefXiApFb7qHxv3UhzD7VKSEvx9kpknBeARBR3lDLA=;
 b=GobLkBUZruiLgXFkVjNTJMiJDc2gLWJjXE/0mpyqyEVkBNjBYChz3aKwcBqGoVzHIFJSSNlkI6PlzPw3Ery/Wes6ZWzypWlW85puMPZH8gRCEuirN+V7/GInyhslGPb2IfLWPKJrbyxQwMBGbEfV9mTXk4E9U7T8Y588VPYHYH4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3894.eurprd08.prod.outlook.com (2603:10a6:20b:90::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Fri, 17 Sep
 2021 23:36:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Fri, 17 Sep 2021
 23:36:11 +0000
Subject: Re: [PATCH] qemu-img: Add -F shorthand to convert
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org
References: <20210913131735.1948339-1-eblake@redhat.com>
 <20210917201347.aaiwgds6ykyybx75@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <30925a50-0b9b-ea3f-2a7f-f70588e9ba7d@virtuozzo.com>
Date: Sat, 18 Sep 2021 02:36:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210917201347.aaiwgds6ykyybx75@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:208:14::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 AM0PR03CA0015.eurprd03.prod.outlook.com (2603:10a6:208:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 23:36:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd6d13b-5aae-4d97-54ea-08d97a33ee57
X-MS-TrafficTypeDiagnostic: AM6PR08MB3894:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3894BC7D4B68980ECDA2FB11C1DD9@AM6PR08MB3894.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iyrrq6GySAS+oqZa783oVH9oa65YDIcoak246Y1aC5ZLHLHYQOXMyBtI4VMyKQsTMPYNaSOSReYvuFNNlEBK9T/gh/IwONexfELuWdIXzVbcrJ8AEf4nzwRDTNgsfe+Kz1iLxsSFYlKq4DP9Df21+J9MsGMcgL9EsXBs8x+SGmuH4/8BRxjgUIpZLW6fEnl1u6TiT2dq+PQxSs3jea6J7MFRxtsCH7xjHm+0FPKncCi6tE1DuSn1bWtcrsYMolGCdtDJ2maMn1dx9iHHi8AcWyVkqFsC+4Iy7Kb369N8jTEwyBrAuwp+Cg+TNh0AoWPfmjAlOWhYOwXK2NdlPrY0Jj/0yFEqVPfH0lj0otiJ2VczcUdJrQr1gsAXtbjrXDsgrrspexVredtjwHGLiK87uSIEm2qOhRaa3Cr1vcXIri5XE5IBKxoW6s8Mh5XEyFCvHQnO7VTqo9FL/5F0TSQ4rO35GutSdLvfS/RpUF/z/Q772+PJVUeszAU9hK6WkPNd9ffTx6blOW8ZiyPd+0Uv4891KSJubiDaHga4o1P1FOZwzcq0eZzcrBdaDmUloda8PPRHF4fUFTQ783lGUZiMH2AAJrMGmXvq4rMr910gtmEHLpZ/qiLLEmT3lceGTFJP78XiOvJ6OZSj4tmp78bb8fa44UfZXQG1946iQ1yR52J0Ad/PDmRs0yy6XOToVOkzo1uHlpjsHzCc60l53mi4CMuPPmjOncLEvW4GA9OTCtiHvcaTfcPUtmKkGjEA8KPcapwcqdbahJBZEPAkrNB9tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66946007)(8676002)(66476007)(508600001)(66556008)(26005)(52116002)(186003)(38350700002)(956004)(31686004)(38100700002)(86362001)(5660300002)(16576012)(54906003)(8936002)(36756003)(2616005)(83380400001)(6486002)(316002)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWE5Y3MvdVU3b1d5eUNZSnFRQTRZSi92MGFFYmswQ1FodFV3dkN3aDNvQjQ4?=
 =?utf-8?B?N0VKT1FtejJWb1A4Y2R3Q3MyT1RCek04L0Z1ekYxWmpid3MzbG5ZcHY5Ri9h?=
 =?utf-8?B?blBXZ0tTSUQzZXhhQWxBakRyMGpTN2hIWkxyZE02S0cyNlpRRUF5Q2p4Sk9u?=
 =?utf-8?B?c2ZSWGpMNkpFT2ZvMzZLNGxiZjdEbkN6SW9kbFNodGdqa3JzejVjbWZpUmFk?=
 =?utf-8?B?U1BMakkrZE82UkVkKzdTQTdxNWpRUFJNS24rZ3VWRjFxa2tHNnNyOGxldlZC?=
 =?utf-8?B?OHRIQmprNGdzaWlLakUwSXAwaEYzWHp3VXN4c0kvWVFURmRXQ1dLV2xSNUth?=
 =?utf-8?B?TFAzTGx3UEUwZE9VUFhWYWtCQ2FQdE5yQXowVHZGOG5kMDdKM3p2a051V3VL?=
 =?utf-8?B?dFFoYXIvRlZ1V2pnZVQrS1FtRE5LdlRnSWZ5RFdiZVFzWFNrZXAvbi9lZWlm?=
 =?utf-8?B?Vml3WGNjM09kdm9Oc3Z2UjVvei94Z1lZd3BkYlhkenhJWklEUHJjb3dDcE5Q?=
 =?utf-8?B?Y1pTNGd1T1lwMVJMMEZjb2Fwd3hDZWpMSWNmS0pUTG5XNHZwenNDMFJEZm0y?=
 =?utf-8?B?WnRpQXRxcUtJL3R0ciswczFLZW1XZmtmZkg2TFFoNFVFaStFUHBJM2I0bzlI?=
 =?utf-8?B?a1B4bFdwZDBiU1Q4YjVEeng2Z1dydEpxK0IyQmpMYThSSm9zRUErckRtK0Y4?=
 =?utf-8?B?eTVYdy9kMW1aSkp4eHgvOWlOaFlrRDZpSXdZeEtUdTJrZjJBSTM2RWM5b0cy?=
 =?utf-8?B?S0paeDRrTldvcVIyVnlNejVwQkNQZmwyK2VqcHpWK1NUMU1QY2h0dnlYTzVt?=
 =?utf-8?B?Y1VHNExGNkxVMlBXS3M2OCtrNGV5d0RibDlvd1FySGpacGZXdXN3a2RRVmF0?=
 =?utf-8?B?VEQyRFNTOStkL0hSS2xFQWNzeXNnZjVCVDJwME5UK0dBTkhWeUM3UkVKemdp?=
 =?utf-8?B?ZVJNY01sWlNZd0VYblFqTUxvRGkyeHpWZHhEK1pRNnZLcnI1aTUwVm5kSHFX?=
 =?utf-8?B?aVIzMmdnOFVRUkF1Ymk0NUZsODlVOUpudHVxY0pVVk44MGpLQndzM05qODJh?=
 =?utf-8?B?KzREanJ2QVIzdkZJaWZOZFFhNzNGQ2wyT0llYTNZUzlydXNRTUtOT2xjUWlL?=
 =?utf-8?B?bjhLRU5IbEptaHNPZUEwRENDVTFCaU03QWdhd1pDSlgwa1J6ZzI4TDhWclhq?=
 =?utf-8?B?Q3Z6STdjcjgzdW5SaGQwU3BaVVpaMms4bW5DYWJQRDRiUzNlWUJyVjl6SGJK?=
 =?utf-8?B?OU1vSWhPeEJYdTk1UnYzcjREUGt1T0tSY3R4S3pzOXBmNmhJVU5QZkkvemlF?=
 =?utf-8?B?MmFpb1gxSElTVXgwY0loWURueXNacWFwbFNSU2ZDREN3cVFZV1FvUU4xeFNF?=
 =?utf-8?B?d1lnMG5CK2w0VUpLV2t5NHpiNXo0bGJidWROS3VlYUNHOW42MHZrZ3dnaklM?=
 =?utf-8?B?UmZuYVk1bCt2Y0kzWEF4MDBSR3dmdVlNNzNzamtqclpoZWVmNmMrd0lKbnVS?=
 =?utf-8?B?N0s4QkVncWJzUG9vamtyMVF0LzQrb2YzbVBjdE1QOXBwUkU3UXB0UTNuc1Zx?=
 =?utf-8?B?V3hPbXZFajdlQjN1VklMTHZpSTNzS3NobS9rdVFKYU1POFVXY0dzSDFtS0tG?=
 =?utf-8?B?L2JkY1pKRjZTbnFBTkRpTFgvWU0zRENMbUNFTmg2RHgwMG1qdk42NFFkTDRz?=
 =?utf-8?B?N21tYnU1MHkvRDF5QzY3dnJzTmgwSUhCNHFkcU9XMGJUSzAxYzZrZjZCSDlF?=
 =?utf-8?Q?g+WqXQhY2u187VZTE1skLULDGK70Eic2XgWYUoA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd6d13b-5aae-4d97-54ea-08d97a33ee57
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 23:36:11.3816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0QlXkfo7P6AIllP3g0IpZ5BUgQgz6mILT3g3lMXuE1x67xRFnJVs3ORjHLfbtg0NOBjKmA431a2f7JdDUC9ZaypJrUZPAgG+3auDwiZA8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3894
Received-SPF: pass client-ip=40.107.1.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_NONE=-0.0001,
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

17.09.2021 23:13, Eric Blake wrote:
> On Mon, Sep 13, 2021 at 08:17:35AM -0500, Eric Blake wrote:
>> Although we have long supported 'qemu-img convert -o
>> backing_file=foo,backing_fmt=bar', the fact that we have a shortcut -B
>> for backing_file but none for backing_fmt has made it more likely that
>> users accidentally run into:
>>
>> qemu-img: warning: Deprecated use of backing file without explicit backing format
>>
>> when using -B instead of -o.  For similarity with other qemu-img
>> commands, such as create and compare, add '-F $fmt' as the shorthand
>> for '-o backing_fmt=$fmt'.  Update iotest 122 for coverage of both
>> spellings.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
> 
> Self-review (and late, too), but...
> 
>> +++ b/docs/tools/qemu-img.rst
>> @@ -414,7 +414,7 @@ Command description:
>>     4
>>       Error on reading data
>>
>> -.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
>> +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE [-F backing_fmt]] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> 
> s/backing_fmt/BACKING_FMT/ would be more consistent here
> 
>> +++ b/qemu-img-cmds.hx
>> @@ -46,7 +46,7 @@ SRST
>>   ERST
>>
>>   DEF("convert", img_convert,
>> -    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
>> +    "convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file [-F backing_fmt]] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename")
>>   SRST
>>   .. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] [--salvage] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> 
> and I missed this line here. We have too much not-quite-identical
> duplication :( Followup patch coming.
> 

That's for sure accidental complexity :)

-- 
Best regards,
Vladimir

