Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05823318B87
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:07:07 +0100 (CET)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABgY-0005hH-1y
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lABTg-0003E9-I9; Thu, 11 Feb 2021 07:53:48 -0500
Received: from mail-db8eur05on2120.outbound.protection.outlook.com
 ([40.107.20.120]:26848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lABTU-0005r6-EV; Thu, 11 Feb 2021 07:53:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXu7yXnSXcUyk8lxnvtK9i5EW0WE0s3HdxwQaBGy6YqzY7DrBlC+ONweqjtaDohUiD24UE/T+AqFSkaeCw0bbLJvSnAbKCcJlPA+VykjvXnBIwgO7bfz10ArxtS7DHG270azmgFMYwoehULtAU4CpyIy1n2AeYMSom9ueVyzMGyGOuxQNWoBQTPu49Bi3HcIQujs+CLqCE02vqvmK/BDwh0vcj2TYh+welkg4ah27TDa2tTS4983baiRqoWU71GaseKPERAqnflfjXNHnjrTQeyRXUQ5ZQih/ETDImjF8alXg5lg8xmUiwN3jzJreBfM502soNFbXYXli/pt1VGS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlicL3M17+rLPMAMN9edtnN5cz3diSpzBDj4so+NZt8=;
 b=jTNKhmr43NvtiO7xdGzR8iGISmVwgCbBRW6i/DWviA7dzhzW2Ib5ZDCtJ3HNgCfC2Wrvv5ADTll12C4tQ7Z9hd4b9Q2n5Zi0EGs14UQw6aawPQYGYfEWiCJhdYBhncUtQitG94/yg2BBAqMvLbri1E9cBbedP9voGr+JpwzXapv/h9RAi63lJ2/gVHd3yHxx3ac0r/C2I611zMtAWT0pmzx3qaBwmwIS2VcRu/hsQ8sKgnFHG6KrpzqK5z5/5Wq325i15VIlkYeM5t+zndpOA5bEOc4N95P9c811KP54BhAQ5c2mZr+x2pmMSvibQu1cEeUc447l60FE2tdQ4lbGLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XlicL3M17+rLPMAMN9edtnN5cz3diSpzBDj4so+NZt8=;
 b=RjYSLgR7JOuqpKXLlAqIygkmjQEeXEzXH1sBqQxJ2ZKyd7ABofcreK1BfbWP44HbUgU05fBe3QQkALR7ACBnVphQy2W/pujT1iGIEPo/Tqs53H0uIJ4ZOvYhHtJjacQy+FBFq8S4BnTI/VH1ybfws/7Hc2zUcBxrB/VldM2hKRs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 11 Feb
 2021 12:53:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Thu, 11 Feb 2021
 12:53:32 +0000
Subject: Re: [PATCH 3/7] block/qcow2: use compressed write cache
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 kwolf@redhat.com, den@openvz.org
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
 <20210129165030.640169-4-vsementsov@virtuozzo.com>
 <446ebfd5-ac72-dc18-fde3-6cc7ffa73176@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <cf19abbc-7d37-d483-e1b2-c36c22e9babd@virtuozzo.com>
Date: Thu, 11 Feb 2021 15:53:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <446ebfd5-ac72-dc18-fde3-6cc7ffa73176@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.212]
X-ClientProxiedBy: AM8P189CA0001.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::6) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.212) by
 AM8P189CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 12:53:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7ad264d-a461-436d-b7b4-08d8ce8c09a9
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591153B9B1AA40A55D8C7DBEC18C9@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tbAoA86JM/msYvMuNTK6qrbF2R58RXosWeS5uNUd9XwYHJTy4LKGP19D68tPfH4nAkHZaSydreEy/VqRupWruZRmCz+opB/s/W0OaukhQlXTN6qaKaeK90JN1yfFW21cILkinvDU6LiIjrErmCgfH79y8eoGhGhJt0YK/LJ0j0KwA3obRuWns3VJQwXh+fiaeCdOxDPJTskpSWMcMZuIo1dfKWPoRdiRF3EY8NCkie9XWx6bJOPgPojIyOMvorLd9JfcAuOmyVYtgCOl8mgZPEbt2hLHucdyRa8q5PwEAdO+UuqUnYMxhZUGyjTticYRiUNk91VHjZ6px9YYyVYqnbbffecLRpLwcaHI+PykKQEsv5in0LJpWdUgjP8W1I+iQp9Ufe7Wsm0r62swv3G2bwrgtGL5oYQ8je1EbP1SMSOIryS5JcV13Tt8pVEOK7hZuTG+xP1jOLe+c8yJR4UNaUytN8kr4p8Q2wHnNucvy2Of9MEnEeeYlPTeMo97S/y9Vde+Wu/f4/93RNuG96ylRsVGf4J4HjKYf9ys/JHsBJHGEw3bniEULhDLlq5zDA3IyGDu5ZHMQW6LP+ZNI9fQ3GMg3hENrYj8PUdnLJXwVc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39840400004)(346002)(366004)(5660300002)(26005)(107886003)(66556008)(66946007)(956004)(83380400001)(66476007)(2906002)(36756003)(4326008)(31686004)(6486002)(478600001)(8936002)(52116002)(31696002)(53546011)(316002)(16576012)(86362001)(186003)(2616005)(16526019)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?KzY5SEQxV1hxdEprY08zRTZKWUJESU1lNUwwQjZXSERndTBxd0hIL1kvZmd4?=
 =?utf-8?B?R1BCVU8zcE14aU5oOVB1Z3d6QUZZZkN4dnpUVVVHdFNSdjllMFdHMUNxN09G?=
 =?utf-8?B?RVV2ci9OQkEvU0JTd0tPWHU4N2ZyYkU3RkRzUDdYSFNzNDF6ZzNZZlMxcTFK?=
 =?utf-8?B?QklCbFdCbkxuL3B0ai9UVGxSdHhmVDdkYkduREg2YnZ4SDJabU5BKzlQajln?=
 =?utf-8?B?SDExSFlYbk42WlpibXZZUzBNNjdSaisrSXN3MThqRXR0bGhvNU5md0sxb1l5?=
 =?utf-8?B?cFJuS25XTktobVBoU213d05XNEs4VDhDbTJVTlc5K3VpeUJ1UFV5MnVqRlNw?=
 =?utf-8?B?N3BIamNpaWlFbFVNdlZFRnhwWjJiRUlaU3pkRURnRUNmRy9kei9lcHVWQUpB?=
 =?utf-8?B?emJJV3dVMGJCVU9pNjlxdDNwUHVHZnY5MWJGZUc5bUExL3VGb1hGKzhaVkoz?=
 =?utf-8?B?NDdhRXViT1pDNHFpcFRiSEUwK0x6a2dYSlQ5ZVRoQk5CdG95dEs1V29KaUF2?=
 =?utf-8?B?TzhTMW5qQUEwVzFhZllIbjJEcUhUQm01MkxGZmk2RkI2OHNML1ZOZFUrY0FD?=
 =?utf-8?B?a0xNTDhaZ0FQRkdKZERTdnczVTRNOUN0QUxiR2pKL0t1bWUyck9xKzNXRWk2?=
 =?utf-8?B?dG1Xa3d2YXV3QWpGeGp4RThjRDVzRjJXZkVYRkwwb2JBYUNBSlArUldLV2pq?=
 =?utf-8?B?NHhoSDM3d1AyaVhIemc5Mytyb2pnc0ZFamRmV3FGSkhmNWJURUYwMWN6R2R2?=
 =?utf-8?B?b3lBNzVoeWcyRVB6c1F1cnJKZ3EwZHdEWDhML3lLQ0kyMjN2RS83ZjVyNmc4?=
 =?utf-8?B?LzZwamFCZ3QyM2RmSU1zVjNPNTZEVzdlYSs1QTFXalJ5V29jbHFYcWE0YjBv?=
 =?utf-8?B?c0JMZ09KOFhwZEhVUG1zUTFOVEFsWDhNSXI2WFNRVkwwdnN0WFl6aGdGQ0x2?=
 =?utf-8?B?QUhtWWJIa2tRT2pkUys2UU91SXY0YkJsNVlxcWJSNUp5bWF3dXA2eEVsWll4?=
 =?utf-8?B?U2dZOVhTYWs0a0ZSOHhvVktLdlhlSTRoZmxETGNGOXdSWU5xOFBDT1Fjc2t4?=
 =?utf-8?B?RnJMWjBocm42N0x2RHMrYTFtWkRIUlhTWlJLSkN1QVFlbkxEcVJJUXdscGQz?=
 =?utf-8?B?R2lFckxINUVGbEJFYlRCbDZSQWNqeDkvOXM5aVlCL1FSNVFNUnBua3NIRkph?=
 =?utf-8?B?MFpFN0hWTElZekcwMzFHellPUy9tMXpmeTBSYTZ6QVp5SmpQYWhRcXJuQXYv?=
 =?utf-8?B?ZnN3eDBuWWJFUWdXaHNEUTg4NWR0QXhVNTNobThUb3ZyZ1Z2MURsK0NxaGs3?=
 =?utf-8?B?ZU1hWDREd3p0VFNwcHB2WlJhRUxjS3JhdU81WGNkbHorbDJyWTc2NG9kSmRY?=
 =?utf-8?B?L2piRG5PdEVuTWJxU2xpZUNNTk1sb0dpUzZidytUenBSYXAvZkRtcTNYWEU0?=
 =?utf-8?B?elFnR1VSMWNWbkszUlZwNTVmN0NHTDVqTThzLy9qa2JoMnZZOWRWa01Rc0Vl?=
 =?utf-8?B?YTJsMWtFQXJPT25KSDBOd2FJZU9mbUFPSXYyS2l6bW8rNi9vYXRxbVI1bk53?=
 =?utf-8?B?MDBEOGlyUTBEaUNaOTJBRFp5SDlqZHo2aVlpK01LaU02Ukxtcnc0aTlQbjl6?=
 =?utf-8?B?ZUoyMFBWUy8zSXBqQmNjalRTbVFQc2pyQzFCTW5CU29XNlVjZm15QUtEMnIz?=
 =?utf-8?B?MDY5MytIaUZQR2J2U3J3RC9WZnRIai93ZFFQOERlckcvUWt6cU8rR2lTVUJC?=
 =?utf-8?Q?M/82ZL6HVhp4aQvodsZQEaSpiRLZOtwUM0m+IfH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ad264d-a461-436d-b7b4-08d8ce8c09a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 12:53:32.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KLsp4YzFlTCoNgchgm0QhK9VCJrnFwYYvmhSdJSSqEpMc4+Fz1gQwxyAZkVXvgq8y47NipPqoqc/tcwtW17Sg1DEvI/Iyob+J5IUfn80/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.20.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

10.02.2021 20:11, Max Reitz wrote:
> On 29.01.21 17:50, Vladimir Sementsov-Ogievskiy wrote:
>> Introduce a new option: compressed-cache-size, with default to 64
>> clusters (to be not less than 64 default max-workers for backup job).
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json   |  8 +++-
>>   block/qcow2.h          |  4 ++
>>   block/qcow2-refcount.c | 13 +++++++
>>   block/qcow2.c          | 87 ++++++++++++++++++++++++++++++++++++++++--
>>   4 files changed, 108 insertions(+), 4 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 9f555d5c1d..e0be6657f3 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -3202,6 +3202,11 @@
>>   #             an image, the data file name is loaded from the image
>>   #             file. (since 4.0)
>>   #
>> +# @compressed-cache-size: The maximum size of compressed write cache in
>> +#                         bytes. If positive must be not less than
>> +#                         cluster size. 0 disables the feature. Default
>> +#                         is 64 * cluster_size. (since 6.0)
> 
> Do we need this, really?  If you don’t use compression, the cache won’t use any memory, right?  Do you plan on using this option?
> 
> I’d just set it to a sane default.

OK for me

> 
> OTOH, “a sane default” poses two questions, namely whether 64 * cluster_size is reasonable – with subclusters, the cluster size may be rather high, so 64 * cluster_size may well be like 128 MB.  Are 64 clusters really necessary for a reasonable performance?
> 
> Second, I think I could live with a rather high default if clusters are flushed as soon as they are full.  OTOH, as I briefly touched on, in practice, I suppose compressed images are just written to constantly, so even if clusters are flushed as soon as they are full, the cache will still remain full all the time.
> 
> 
> Different topic: Why is the cache disableable?  I thought there are no downsides?
> 

to compare performance for example..


-- 
Best regards,
Vladimir

