Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00061343E52
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:48:54 +0100 (CET)
Received: from localhost ([::1]:42814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOI7B-0007J4-Fr
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOI5R-0006qy-QW
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:47:05 -0400
Received: from mail-vi1eur05on2091.outbound.protection.outlook.com
 ([40.107.21.91]:2976 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lOI5O-0007yy-72
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:47:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cEBhWJzCjy3RSZzqHe8sg2za1n4Ki3l52PfxB43alCk32JkJuAAVbanPGsfkvqt3XBGE8N7q8aoi3/VmlxVmXnP4rAfoC/v2IZscONrTuF83OtyREs7Gm/OJTc1xAoOz+XLvajzS+RGehxqxAry+LNAzBRxBeCaNLPlFV7tVKugaqJBHqHEjEjcrah1DIHagij9V9+QmH38BsVFSXp92SIbonwETeQHd9be+OTC+Zm8f7jo6GakyOKZdkCEtjeacw5qipIaYO2CDQGlXG4ukfcF0cHMfqP5rQMyKPhgUF61NTKXw5ifsDrvuJjxqqUNToLh+X+Gje7faPDeY7PefpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd2wt1s1awY2jKsic6tQ39ApOchT7qCH60WvtOGQQ08=;
 b=dPRr6J5emt+77eHawA213IVZr4uoOmjUgz67ck2itew0mK7T1c038x3jVD05ML8kC8OSe+p/jhtG05Lk85c/q6zI3e9fF7rwREgYVzmK+v3jHK4M9PipduzsNfoBRXtyeb9gFBAonyx3VjwuNf6EpUmumRNaK6u9uSZDDBBurxfCnUZRawyrgwvY795XUlL1DgJJGHxXOOKgrMS2yMZ2IVdhUoj0UI8QEcSreLhpXsrhLM73zbcC1/PcLOR+RhTcvck291m/G73Vlp9mj/zboOX67195qhi6vhjSt0cCaj3xqN5ce2fyRZFu4KS7pdZ7luSOQB6iqPEOLM2TLgSTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yd2wt1s1awY2jKsic6tQ39ApOchT7qCH60WvtOGQQ08=;
 b=v1PwbRgxuUaHZ4yaz3sFvvIBrOH8XJeQFQW+JqozXmIGp7rkdWVI4kZfBBmsFDHzPH2kbIXwjdzCkJVIU2rG48D1YkfDA/2D5FSGQZnKdtiLLmNIlLWXt42EPyFcuiTf6L2oRW05v+e7dbI9P6xKfCi8v3TQSEf3rbwdqVAGSBA=
Authentication-Results: kiv.zcu.cz; dkim=none (message not signed)
 header.d=none;kiv.zcu.cz; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 10:46:57 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::f947:3484:b0d7:ab52%9]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 10:46:57 +0000
Subject: Re: [PATCH 1/2] block/raw: added support of persistent dirty bitmaps
To: =?UTF-8?Q?Patrik_Janou=c5=a1ek?= <pj@patrikjanousek.cz>,
 qemu-devel@nongnu.org
Cc: lmatejka@kiv.zcu.cz
References: <20210320093235.461485-1-pj@patrikjanousek.cz>
 <20210320093235.461485-2-pj@patrikjanousek.cz>
 <ee8fc7cd-1da8-45f3-6cfc-05ea5f1e9430@virtuozzo.com>
 <4848c5a4-b301-a8d7-b21b-b59ebbeb12c7@patrikjanousek.cz>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c65eddbd-d29f-207a-2295-7176a9e65fae@virtuozzo.com>
Date: Mon, 22 Mar 2021 13:46:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <4848c5a4-b301-a8d7-b21b-b59ebbeb12c7@patrikjanousek.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR03CA0013.eurprd03.prod.outlook.com
 (2603:10a6:208:14::26) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:208:14::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 10:46:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72716e5c-9bf2-4f2b-13d5-08d8ed1fd079
X-MS-TrafficTypeDiagnostic: VE1PR08MB5838:
X-Microsoft-Antispam-PRVS: <VE1PR08MB583843BB18B583F8C44EC48EC1659@VE1PR08MB5838.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGnqs964vzEn71qVGlDX/gP380rRalB+SA8fnMSfZkZWKcHdvdY28dx0euzoCiVpLgSFczHLx+F4YwsLVpuhHBGi2yCQxS08rs7wByXKQcJQaGLehEfwGPGMqzNmx+wQIZoN+V4jSW18TgPNjwgNlgUTpTakY8tA7fOc51pROgUm/3W2EQVyS9zILo8Leg7zoLRvDLRK9nE4FbniMTxVXcc4Px9fS5d5bhhKVKMPOQnrssnupvK0ldDYb9pWXNDAgrZXuTvJhqN58q9gSgIkPna0VuWFvJnYoy9oaiWLYZtIAJegWH9xvYq2qc7t96cHs10aTPM3gqikCbN7zQC++VAnVwxaJ6li0K3Y47GCr4BNWlab9Wsfj14QPtkC9RDIzErdus4pu2TVO5yU5I5jRUh4EbToklUO0+O6hmozAmQUCMHibSa35gzctNLBS9fNEW3NwOubTzPE3Wx4c6nu36PK9W0P+1F3vVwhHCnjUGtJyW5Ku2AZASLq59KgIaGvkz9F24c/TWflgV1EDXc9iiC6rpjVVH/tJ9DXGVYXvEpDX8ohsfOWIDQ0OCwYrhyEHVGthaebLe5CwoU/n/7Vr4SSXhrBixayeBRV2Bpj9XLBwtyJhVzcHo2Xz8dndTbFM3Fk9zg0n/2tDQMUVe6XUC9VLkRQL9g7ZzRbaN55XbB3Dc1U3B+r8k1Mh/lYZeI8cnBst/idVYoN3OJYw71DfpoCA1nU8GbU+NfGz1VQ4nhhqrlgKePFkJPL+d43iaXV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(376002)(396003)(66476007)(66556008)(83380400001)(2906002)(38100700001)(478600001)(8676002)(66946007)(4326008)(66574015)(6486002)(8936002)(31686004)(26005)(186003)(2616005)(16526019)(31696002)(956004)(53546011)(52116002)(316002)(16576012)(86362001)(36756003)(5660300002)(14143004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YktoWmZVT1k2VVFhUi9iRGttVGJJbUxYc2xnb050MTIzVHFzQ2tXb1E0bjh1?=
 =?utf-8?B?WGlRV0VhUEhTQzNQbzdvNFZoN2Fuc2Q5Z3JONVhsQUtYVHM5TXlJRGZoeUFF?=
 =?utf-8?B?Y2FYYXhIcG5qZUoxYkJ4Z29MR2pIQ3BtTHhqMEQ5WXRtVlJpY0lkY0JWNlpS?=
 =?utf-8?B?NTBmNHhyNUsvVHc2ekZDdmMzU2UxQXZDZmF6WmVjSDFtSDQyR2RNNlBranlH?=
 =?utf-8?B?Q0prc3dVN1ZySHNKcnNBTnAwbkFwU0lvWUs1Y1ppZmFXdzYzbUx4MHFEM0pj?=
 =?utf-8?B?ejZ0bkJlajdad3pmNm5iNnQ4MkJQcGg3eU0yek50RXptcFhBd0pvenY0UzNh?=
 =?utf-8?B?NEgvZUJHaUxGYU56S3FQdnVzV0NKanVSaEwzVStOSlp3Y2FoVlBZdjc3ZVBU?=
 =?utf-8?B?T1dpWUVRa2hEcjlPeWxNMFAvQnJWL211VHZsWUNtbDBLNitGZ0E2RGlOUzls?=
 =?utf-8?B?bE1IUUtJMWd4dWdueEQzN0gyWXpnV1JlUzIyaEZvOWtMM3ZRa0IyR2VqTktl?=
 =?utf-8?B?Z1VaRi9MYTFlS0ljN0JVSzE4aTdwUXRhM21qOEJtRlkwYzJITzdBVlk4QXNr?=
 =?utf-8?B?M08yK3dTVFNJMnB6MDBaZTJnYzZuQkZKbURFWmxtTzUyWTZSM0hUTkllZW9m?=
 =?utf-8?B?aThTOGtYdWNtMGNKNHVxRlZ1ZGNZcFdwSkk4OVQ4QjJFb2xzRVQ0dHpSaUp5?=
 =?utf-8?B?dEVEOXRKb3g4NUx1QkxBYlc5UUNvZkRzc3RGYUluaTJkdkxHblNFcmJyS1Aw?=
 =?utf-8?B?R1E4amtCek1MNnNUOWVRRDdDNDIybmxoOTNxVU54ZzMrTm5RMyttVWFEUXg2?=
 =?utf-8?B?aEtzbjkwSGJXblhWdmNSVUtXNldwZHZybytYUGhUU01sb2hPMEhBbHZpVWNl?=
 =?utf-8?B?ZGRNekFFekNabzVMV29NaDJkYmFZRnBCckhORkttS3UxdWtIV3BXeS82UXJU?=
 =?utf-8?B?ZngzRkl5T3hrVi8wMnZuV2w0SEZCcUJUM215WWhMVDlFZXMwVmtiL3d0MDZm?=
 =?utf-8?B?TVN2c242ZVdaWE1pbVJaQUE2cEJjQysxU1NSYlY2K1d5ZVhMM2lNUUxwY1Nl?=
 =?utf-8?B?R3MyVlBKblFhVE11V3FnTXZhU0M0bWkrQ0ExNTdmQXJWcTBtYVYwbVJTRDZw?=
 =?utf-8?B?ZGppOCt0RVdOUkdvVzRTaHR3c2tVdUNyZEdjMUE2YXJVMzNXcVlpSTkrZmg3?=
 =?utf-8?B?OEJOb21ZajFRdGZOQm8yNFJuc0pOWjVQbCtFK1JDN0JiVlZzalZ2ZHZ6WVBN?=
 =?utf-8?B?bDFvNkRMWHMwcWFUOHZwZmthWmgzMjkxQ2RQa29iaHpHRHR6Q1NSMVR0ZTdY?=
 =?utf-8?B?TVJ3NDcyanlzV0NLUHM3R2FuaGEzdTVjaVdLUjNVWmRiaW1JYk9EaHdyZ000?=
 =?utf-8?B?bjNnMkJYd0dUazF2YUNYWWF6ckQ5YkorVjg1TC9XODhuWmVzR3hSejN1M3ho?=
 =?utf-8?B?QXVKTXdTYWZTSHUzZkE4MEIxVGJsUEIxM2h0a2h2S25FQUJLcFhiZHlxNUUx?=
 =?utf-8?B?L2pFZFpZYkcxYzR3RG5jcmRlaEpVTFBaaXhzMFUyVzh5NHo1VG5LTWNaa1J6?=
 =?utf-8?B?bVd6LzEwTWhvOHRiaVlnL3pCZTRjZS9qK2VlN2xvbmJaSDdjRXBQUTc4QXVp?=
 =?utf-8?B?UXdiaTRITk4xdDNhMXBtMDVldWxTMCsxNWlEa0Y1NkpYVGVmYW5hMTN4cjQz?=
 =?utf-8?B?clNJVm0wZFFBY2d1U0NKcGVPZlNwOTltWCtvSUdOTTJzaS9FRlRSd1RmUGpp?=
 =?utf-8?Q?+2i/2/RXEGEE9k1q24nkHoIols4mHzFHi+6ZEfK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72716e5c-9bf2-4f2b-13d5-08d8ed1fd079
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 10:46:57.1962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8OWeMvjWysAOwMQluEcQt9K87SIgX/4lGBp/KvsB8Y5c86fX6X5RbW/EHxVir6m4DAUwfifqWERzD/1LE+sFMjD/kaYHUfuLaHwONhvSLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
Received-SPF: pass client-ip=40.107.21.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

22.03.2021 13:18, Patrik Janoušek wrote:
> On 3/22/21 9:41 AM, Vladimir Sementsov-Ogievskiy wrote:
>> 20.03.2021 12:32, Patrik Janoušek wrote:
>>> Current implementation of dirty bitmaps for raw format is very
>>> limited, because those bitmaps cannot be persistent. Basically it
>>> makes sense, because the raw format doesn't have space where could
>>> be dirty bitmap stored when QEMU is offline. This patch solves it
>>> by storing content of every dirty bitmap in separate file on the
>>> host filesystem.
>>>
>>> However, this only solves one part of the problem. We also have to
>>> store information about the existence of the dirty bitmap. This is
>>> solved by adding custom options, that stores all required metadata
>>> about dirty bitmap (filename where is the bitmap stored on the
>>> host filesystem, granularity, persistence, etc.).
>>>
>>> Signed-off-by: Patrik Janoušek<pj@patrikjanousek.cz>
>>
>>
>> Hmm. Did you considered other ways? Honestly, I don't see a reason for
>> yet another storing format for bitmaps.
>>
>> The task could be simply solved with existing features:
>>
>> 1. We have extenal-data-file feature in qcow2 (read
>> docs/interop/qcow2.txt). With this thing enabled, qcow2 file contains
>> only metadata (persistent bitmaps for example) and data is stored in
>> separate sequential raw file. I think you should start from it.
> 
> I didn't know about that feature. I'll look at it.
> 
> In case I use NBD to access the bitmap context and qcow2 as a solution
> for persistent layer. Would the patch be acceptable? This is significant
> change to my solution and I don't have enought time for it at the moment
> (mainly due to other parts of my bachelor's thesis). I just want to know
> if this kind of feature is interesting to you and its implementation is
> worth my time.

Honestly, at this point I think it doesn't. If existing features satisfy your use-case, no reason to increase complexity of file-posix driver and QAPI.

And if existing features are not enough, we should start from understanding why they are not enough, and probably true way would be improving the existing features instead of implementing from scratch.

> 
>>
>> 2. If for some reason [1] doesn't work for you, you can anyway use an
>> empty qcow2 file to store bitmaps instead of inventing and
>> implementing new format of bitmaps storing. (Same as your approach,
>> you'll have a simple raw node, and additional options will say "load
>> bitmaps from this qcow2 file". But for such options we'll need good
>> reasons why [1] isn't enough.
>>
> 


-- 
Best regards,
Vladimir

