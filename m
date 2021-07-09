Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480003C1F92
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:56:18 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kQq-0002JC-Fe
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1kP4-0000fx-JX; Fri, 09 Jul 2021 02:54:26 -0400
Received: from mail-eopbgr20110.outbound.protection.outlook.com
 ([40.107.2.110]:9395 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1kP0-0005jA-Us; Fri, 09 Jul 2021 02:54:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OygVo3K88jBU56AweaKKJoq7UBe1GkUa9xK5NHZituXoEA6OW8cyxWs7uGzoz/2+uGDjyavysdMGkoPH0sOMpGIkfGbLlft9oAzvYSPb4b0VwABwj3OZnmiy/F5dGXHrRdRXwa9kb24wx0tU+C+Qwn6CrPuVQRv9SnAJzavXtNblq517EumA1sTHkSzFTIuSrgTebzTEGBKAET6ZryfvfbN7eT2L2Q3SFsPPVFBft12XPBKAM+PL90wcjrDRp0ZN+GQx8DNa1XFgjhwCHAfVuZkVwU+E79WyfuPHz21sPBBax4Vb3khjyugyZeqxTr0R9+k3mTAYo0Smm8gZuxLo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJSejlw6nNAQSVvjKY4IBswj9nluW+Bj8cYG9SpkOuw=;
 b=DH5SMEeE5XmTTLoGv1/oT/Dir3Jc01W6qmd2YJSZ3bA8nKqKZOx9TBhkH6QFGp5r1VAcng32w++DqGLKmRkzpeGdowBmD4LAg6S3nZp4nsPsygeDnGDDI0Y4LuDvbP9kmNS9P1bekDfpzmleSoQ+uEgfzrls7OQKM/iFVpYrQ10vIhxRdUvnc4TIYkpyB3GxJiGc903kbwmvDP0jjbYpJv08OnXSNhToaWCs5P5sx1PE+prEfWKNd/rfrHDLN+jmHCxKJTgMellFdN3+e+xguWvYtJb30lFGDobgcX+VOR7JtfcyRz4uiZtHDCCToCypLjizwQ5bzYs4Ppd6+Ix2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJSejlw6nNAQSVvjKY4IBswj9nluW+Bj8cYG9SpkOuw=;
 b=vQ9xtmJ0iM0ZkaZZDkbe7S6ulstXcbcnk5Y42dBrz0VwG8cwWzYX1x6vV3kNUsH16TFWk0no5oiyqqJT+Ph6U8D0ZFdmjOscMabyJL9bsLBrSP2iFwn8WYRP6uMKl17nTljY/JJivUqmq0wN8cF/8vMT/xVvesnr4seIBgvx9U8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6134.eurprd08.prod.outlook.com (2603:10a6:20b:291::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 06:54:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 06:54:18 +0000
Subject: Re: [PATCH 2/2] qemu-img: Add --skip-broken for 'convert --bitmaps'
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: nsoffer@redhat.com, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Max Reitz <mreitz@redhat.com>
References: <20210708013001.2576991-1-eblake@redhat.com>
 <20210708013001.2576991-3-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <04495bb1-402e-819f-e9d5-fbe9a9a8c44a@virtuozzo.com>
Date: Fri, 9 Jul 2021 09:54:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708013001.2576991-3-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR05CA0181.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR05CA0181.eurprd05.prod.outlook.com (2603:10a6:3:f8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.21 via Frontend Transport; Fri, 9 Jul 2021 06:54:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 216f266e-5631-4946-c89f-08d942a65f6d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6134:
X-Microsoft-Antispam-PRVS: <AS8PR08MB61349FEDFCF349806E65DB57C1189@AS8PR08MB6134.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ZqmYS8hkO1YBZHk1EvrA1/iUixKai3MaxlvjbK0dnX6ArVhdnofdpl1n4Hi66t+a208luosIW7sbA83hXmWcPAuFp9nzv20k3vF+wusEXmrI+bJOXHg0ZzHOMDVyMe8z3bPbaofPSqYv06yz4lsEwx8JrSAFF7470IkjprANy+8qJxc+KRd5+XAnfeG48dArG9jn+S0wzEqejw5E841IoA3rc1UznYOnXDl3qslSq6tgy/BupPMkli66WZeXK+lRUjBewIaiQC7dIXJ3lEJb1rbwbladFduNw7/y2J9EO/ldgVRcOT8IOLGA3Ubd2LIdQqt1lgJTgYH6c+gzF8er6a4Nsm1kife7DIQSTnXrcXJw77YsKC7e6h3t5LK5qmNj1PQLvcMom3KrzJo38UBeqzt6n1p0SiWXfBT4CvMjS07T+mS4cHD7uWPxgUh1glq1eL6Hznl+w3XQd61y74FEIr92Bz9mQ+vLO+YzhE03KNtmH6eHE0DC16j8k3B9O6+MA1HNvZyjww/pNHBrtRGcAVawV3Nt6ZvFOiqaTL52iVCrX/risfc7nIAu/AqpUI9poGfMsVIeSICfhQ35MvOGD0biOkSBGi7bZtceaoctARVI1r+147EA2tclKHIAYckpSSTHgn2Pyw5JQv5MCJLu46o3dfL6BlikimvJ3LnXmPVoe6todmRTWL9HM1rnt/i4lLrkx++YJQb0v6EPcK4GJLzZ0NrjA4197nAxuRRZY1e4jdKVKWTYe2U/qaTeCXgLhVd7MnEus4uH6ZJ8sgcxlfwBtcLq3RfHeV8uPxsceziBCu9SsVm0D0laVl75TnNS+rOAvXv7JX4Fi/9q8dn8mg0BH6JwZ84PFifzRV9iMM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39830400003)(376002)(366004)(4326008)(2616005)(66556008)(26005)(38100700002)(2906002)(31686004)(83380400001)(86362001)(956004)(186003)(54906003)(66476007)(52116002)(66946007)(5660300002)(6486002)(966005)(31696002)(36756003)(16576012)(316002)(38350700002)(8676002)(8936002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3F5bENINS93bTJMc1pidFlPTzBtYlBLOFRDdmpObUpxRzRZK1RKQjZDUDRn?=
 =?utf-8?B?NHY1ZnRZZ0RxUkZoRitjbHFUNXlxRVVkQ0FhelNSMFVVaGtOYWpuQy8rRjIz?=
 =?utf-8?B?ck05K1k5ZGZxZy9qejZIZ2RuclgvTjMzNzBFa1JHWU5iYm5ZZGFEaDFjY09m?=
 =?utf-8?B?UzEvZ2NFK0lrd0JIZkhCTlpGUTJkM0hWNWppK0RwRWxwVjgrZ3gxRUhvQjJD?=
 =?utf-8?B?VUZ1Tys5cmFpcDJEZ0dpT2dFbExXaFJBcDQ2L0NYd0xKcXZ0Z3ZBNHV2RDNQ?=
 =?utf-8?B?NGpTcWNBeW9GV0xMc3Y2NEFpUjFqc0ljVlFkWlpaVlRkTFRya25yVUxDZG05?=
 =?utf-8?B?TVRDSjBUOUxRWFlySUtUdEJ3UlN6QS9FKzNRcTlNT2pvaHlud2d4QzN3UEFs?=
 =?utf-8?B?RnQ3czZDSWNsTzN1eGpjNjlPaUhFTVNJeEVYQml1WnVKSXZUaDB4NTZJd25H?=
 =?utf-8?B?TEdzVENhcXlkaytKT0s5WWFRaFpCTFFNYmloMmZRM0haYVNxNEswcUxNTm9G?=
 =?utf-8?B?MjlOTk8wdE5GT1lPR05qNHU2RU9xYTZDYk9Ja3FLL09KY0pRMVF6clJkMnJ2?=
 =?utf-8?B?ZGlNL2FrWW1LS3hBNjh6czZPekFPeTZmWHBUU1JrVDc3VlRVbjg0K3JVQlB4?=
 =?utf-8?B?bGR1a0oyVlJYQjR6eHlRMldpYnNzNndLZi9MM0p2MFowZnExZW9Eb2RJOWJE?=
 =?utf-8?B?YlZzK0RPalh5Ni9KYzdOVE1ScXFyc2Y3RURNbEsyR0Uzc2E3TGVUNGtrVWJI?=
 =?utf-8?B?NlBSMVhXUE50eVFrR0RCVVo2cVpJUDRzZGM4RVVMTHFPL01GRTBKTFRRMURZ?=
 =?utf-8?B?NkRZZUJWcHQrOEkwZjgxTVRRR1pYV1RvVGdDOVdibnFXSzZTdVVBYUR6OGls?=
 =?utf-8?B?bnY0WmxsQmt5aTIxV2hQU01MQzhQTG41QU92Nm1CMVB1OTBvZDRWTHl0MHVH?=
 =?utf-8?B?Sk1Tdzg5U2xONndpSG5XOGZTb3R3R0VjSDNTL05pQUh4SWpodmVqVWlkZnBp?=
 =?utf-8?B?aDU1U0NWbjljUXluNUlydWkyeStSVjVZd3I2alNWRzlJdXQvMkhtdlF3ZEdS?=
 =?utf-8?B?MWxDTzIyVkkwTmVpT1EzRDJDMGh0OTJjZjhVdzRIN0IxVFdiYUZ0Q1orOTRy?=
 =?utf-8?B?MEV5TDZWVjFXV2xwRVBNby94NnhrK0RWZUJleGZTRkJEMGl4NEVMN0c1ZDhp?=
 =?utf-8?B?TG1Rcy82TVdjcHBJOUpOazBYUmVLM2lPdEhvc1dRM3NnWkRuUkxFTUFtREY1?=
 =?utf-8?B?d0VwZHVsOVZRR1RzaE9TYU1EL3M4SDNmLzFpbmdCQTRIcXZPWXluZ0lSeDFz?=
 =?utf-8?B?QkpBNThrM2l2VTNrQVZLaTV0cVdlc2NsMzVkSGVyUXhHNWRHR0k2M1NHL2lP?=
 =?utf-8?B?eGxFd1lwMjFnVUN6VG5ya0lxcmwydXkwTzJVYjdUcEZMKzU4MndwbCtMM2lz?=
 =?utf-8?B?ajVzY1R4bWVGTkVSVU0rRWJyQmI4REZWSDdxVGFrMmwxRUpVRjJyQkZkUExF?=
 =?utf-8?B?a3plalVQOFVoYjhuSENwbGJrQXIyaGNuZzFxejBWcnZoN21kbzhmQkc1ZjFi?=
 =?utf-8?B?WGpIWUxjUkNjSFhheDMydkxIT2ovR1FyRmVhcDdrVW1MQmYyZGJvM0pnM0Ru?=
 =?utf-8?B?MldBZXNZSGlXWXdsRGdLQnA1QmhDZFRGUjlueWROSGFtZk9RRDhpQW1DWEUw?=
 =?utf-8?B?Vjg1aWdEeFNPUHBuUGdaa0hlUVZ5YUJWbHJteFZXcW16YTVreE9vMWptTUJ6?=
 =?utf-8?Q?0srcbfQXAyUs4IdIlaLdfyTftRk1eRS+AJtm3Hk?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216f266e-5631-4946-c89f-08d942a65f6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 06:54:18.3616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0jOhbJof7bxNo7/UPa48oAzBfUOX0QhX7U4c1kUlcQbnruD5hZc7QW3a4xEGGqRSqECbnKyFmXqN+gsaiZblu2uB0D47r0A+M7WxGh7mjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6134
Received-SPF: pass client-ip=40.107.2.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

08.07.2021 04:30, Eric Blake wrote:
> The point of 'qemu-img convert --bitmaps' is to be a convenience for
> actions that are already possible through a string of smaller
> 'qemu-img bitmap' sub-commands.  One situation not accounted for
> already is that if a source image contains an inconsistent bitmap (for
> example, because a qemu process died abruptly before flushing bitmap
> state), the user MUST delete those inconsistent bitmaps before
> anything else useful can be done with the image.
> 
> We don't want to delete inconsistent bitmaps by default: although a
> corrupt bitmap is only a loss of optimization rather than a corruption
> of user-visible data, it is still nice to require the user to opt in
> to the fact that they are aware of the loss of the bitmap.  Still,
> requiring the user to check 'qemu-img info' to see whether bitmaps are
> consistent, then use 'qemu-img bitmap --remove' to remove offenders,
> all before using 'qemu-img convert', is a lot more work than just
> adding a knob 'qemu-img convert --bitmaps --skip-broken' which opts in
> to skipping the broken bitmaps.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1946084
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/tools/qemu-img.rst                       |  8 +++++++-
>   qemu-img.c                                    | 20 +++++++++++++++++--
>   tests/qemu-iotests/tests/qemu-img-bitmaps     |  4 ++++
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 14 +++++++++++++
>   4 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index 1d8470eada0e..5cf1c764597b 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -414,7 +414,7 @@ Command description:
>     4
>       Error on reading data
> 
> -.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME

Of course, [--bitmaps [--skip-broken]] looks like --skip-broken is a suboption.. But actually it's not so. So, shouldn't it be named more explicit, like --skip-broken-bitmaps ? To be sure that we will not interfere in future with some other broken things we want to skip? And to avoid strange but correct command lines like

qemu-img convert --skip-broken <someother options> --bitmaps <some other options> src dst


> 
>     Convert the disk image *FILENAME* or a snapshot *SNAPSHOT_PARAM*
>     to disk image *OUTPUT_FILENAME* using format *OUTPUT_FMT*. It can
> @@ -456,6 +456,12 @@ Command description:
>     *NUM_COROUTINES* specifies how many coroutines work in parallel during
>     the convert process (defaults to 8).
> 
> +  Use of ``--bitmaps`` requests that any persistent bitmaps present in
> +  the original are also copied to the destination.  If any bitmap is
> +  inconsistent in the source, the conversion will fail unless
> +  ``--skip-broken`` is also specified to copy only the consistent
> +  bitmaps.
> +
>   .. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE] [-F BACKING_FMT] [-u] [-o OPTIONS] FILENAME [SIZE]
> 
>     Create the new disk image *FILENAME* of size *SIZE* and format
> diff --git a/qemu-img.c b/qemu-img.c
> index 68a4d298098f..e8b012f39c0c 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -82,6 +82,7 @@ enum {
>       OPTION_MERGE = 274,
>       OPTION_BITMAPS = 275,
>       OPTION_FORCE = 276,
> +    OPTION_SKIP_BROKEN = 277,
>   };
> 
>   typedef enum OutputFormat {
> @@ -2101,7 +2102,8 @@ static int convert_do_copy(ImgConvertState *s)
>       return s->ret;
>   }
> 
> -static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> +static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst,
> +                                bool skip_broken)
>   {
>       BdrvDirtyBitmap *bm;
>       Error *err = NULL;
> @@ -2113,6 +2115,10 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>               continue;
>           }
>           name = bdrv_dirty_bitmap_name(bm);
> +        if (skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> +            warn_report("Skipping inconsistent bitmap %s", name);
> +            continue;
> +        }
>           qmp_block_dirty_bitmap_add(dst->node_name, name,
>                                      true, bdrv_dirty_bitmap_granularity(bm),
>                                      true, true,
> @@ -2167,6 +2173,7 @@ static int img_convert(int argc, char **argv)
>       bool force_share = false;
>       bool explict_min_sparse = false;
>       bool bitmaps = false;
> +    bool skip_broken = false;
>       int64_t rate_limit = 0;
> 
>       ImgConvertState s = (ImgConvertState) {
> @@ -2188,6 +2195,7 @@ static int img_convert(int argc, char **argv)
>               {"salvage", no_argument, 0, OPTION_SALVAGE},
>               {"target-is-zero", no_argument, 0, OPTION_TARGET_IS_ZERO},
>               {"bitmaps", no_argument, 0, OPTION_BITMAPS},
> +            {"skip-broken", no_argument, 0, OPTION_SKIP_BROKEN},
>               {0, 0, 0, 0}
>           };
>           c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WUr:",
> @@ -2316,6 +2324,9 @@ static int img_convert(int argc, char **argv)
>           case OPTION_BITMAPS:
>               bitmaps = true;
>               break;
> +        case OPTION_SKIP_BROKEN:
> +            skip_broken = true;
> +            break;
>           }
>       }
> 
> @@ -2323,6 +2334,11 @@ static int img_convert(int argc, char **argv)
>           out_fmt = "raw";
>       }
> 
> +    if (skip_broken && !bitmaps) {
> +        error_report("Use of --skip-broken requires --bitmaps");
> +        goto fail_getopt;
> +    }
> +
>       if (s.compressed && s.copy_range) {
>           error_report("Cannot enable copy offloading when -c is used");
>           goto fail_getopt;
> @@ -2678,7 +2694,7 @@ static int img_convert(int argc, char **argv)
> 
>       /* Now copy the bitmaps */
>       if (bitmaps && ret == 0) {
> -        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs);
> +        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs, skip_broken);
>       }
> 
>   out:
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 76cd9e31e850..3e1a39bc81e4 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -28,6 +28,7 @@ _cleanup()
>   {
>       _cleanup_test_img
>       nbd_server_stop
> +    _rm_test_img "$TEST_DIR/t.$IMGFMT.copy"

Aha here it is. It should appear in a previous patch..

Also, it may be simply

_rm_test_img "$TEST_IMG.copy"

, like in 110.

>   }
>   trap "_cleanup; exit \$status" 0 1 2 3 15
> 
> @@ -139,6 +140,9 @@ $QEMU_IMG bitmap --add "$TEST_IMG" b4
>   $QEMU_IMG bitmap --remove "$TEST_IMG" b1
>   _img_info --format-specific | _filter_irrelevant_img_info
>   $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> +$QEMU_IMG convert --bitmaps --skip-broken -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> +TEST_IMG="$TEST_IMG.copy" _img_info --format-specific \
> +    | _filter_irrelevant_img_info


We still can now remove remaining inconsistent bitmaps and retry convert without --skip-broken, just to cover more nearby cases.

> 
>   # success, all done
>   echo '*** done'
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index 17b34eaed30f..685bde6d1d63 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -145,4 +145,18 @@ Format specific information:
>       corrupt: false
>   qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
>   Try block-dirty-bitmap-remove to delete this bitmap from disk
> +qemu-img: warning: Skipping inconsistent bitmap b0
> +qemu-img: warning: Skipping inconsistent bitmap b2
> +image: TEST_DIR/t.IMGFMT.copy
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +    corrupt: false
>   *** done
> 


-- 
Best regards,
Vladimir

