Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD82D7DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:21:06 +0100 (CET)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knn2M-0005LD-VK
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knmXN-0002F5-OF; Fri, 11 Dec 2020 12:49:01 -0500
Received: from mail-eopbgr50091.outbound.protection.outlook.com
 ([40.107.5.91]:45955 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knmXJ-00086h-MD; Fri, 11 Dec 2020 12:49:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCGKxEvSA5KMHMVz8mP4XbPc8nfjyUUcv5QEga3ofEA9XLPiiP5C1BXCGCZOTYa6I3odMTmmGcmCIbqzb6+zsq/DXyMH41OJ/gOZMn1xrNYOyDIVJOlsS4s72WQdhiY4jT+EeztgSPC+0oHUWuqVby3QvJeqPtBukFVf2Gpq3VX27bKx6GThg07k9PavTQSh8wrP56ijj+CKS1J1xp/fuNtEzuLwegjl1vySwy1mI2+a5hZqONefXXqgDqXgg2hqjsc9XWq6h5TvGeUw8cLGka8rj1kgz1uE9Tfwb+48biDqYR0iNr+twplmbRkukKbxZDCa+2E7FftSE6GYGtiKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEIW3ih/haYsL5Ms/hJXxYYwEedjoPLU/coYmuEVSXM=;
 b=SpRCs7BJmnuCGbDB1EMIOKpaGw14pjuOVeooXIymTQCLmo5yYkzAEp5hpDAouii5aPbeJ+jxZilqah0YrurUmdGH9q4AEKheks8viTYwIlB3IkUSlUoXQfaLQApxkVsc7a/iEcXrvRjdnr+gYyhc8nn5H9i+wLsU7EnEN2ELYJkT8saO9eQBq+y0KKoskUOAHxvbpTRN+bgYP2/J48Wmgzzq+junh1M9HuGogVrZyl2+G8p82LHouStj0DQv+TfbHONV2KFPRxnrlXQLLSQdANrHG0Kdnf0LPG3W6wV9/wBVQVtpcGRkNW35/b09PL8SDmi57ji3pFucwp1/GNJRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEIW3ih/haYsL5Ms/hJXxYYwEedjoPLU/coYmuEVSXM=;
 b=N+eC9nI7cRNGW6xV6gJuNwolh1oEwIaJXqBkwc1gzLfXPCSewsuXCC/9fhFZgUbJLUR1M40Q7FYEJyRKjDIFLcQKuSWQ6FZoF2o/mgsXUZXPbvrx81xe/G5ad9lrJ7nhZ/wvJxA/Jq36N/wyAjrZitUKB8A49PnPdP1mLvTgOhI=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3718.eurprd08.prod.outlook.com (2603:10a6:20b:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 17:48:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 17:48:54 +0000
Subject: Re: [PATCH v14 13/13] block: apply COR-filter to block-stream jobs
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-14-vsementsov@virtuozzo.com>
 <6aa8bbb7-6745-eed3-ade6-3ef47d5ee08d@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <eb3656ba-07e2-df0f-87cd-0dd32862f70e@virtuozzo.com>
Date: Fri, 11 Dec 2020 20:48:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <6aa8bbb7-6745-eed3-ade6-3ef47d5ee08d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM3PR05CA0138.eurprd05.prod.outlook.com
 (2603:10a6:207:3::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM3PR05CA0138.eurprd05.prod.outlook.com (2603:10a6:207:3::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 17:48:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a96f5d3d-2768-481f-d9d7-08d89dfd0738
X-MS-TrafficTypeDiagnostic: AM6PR08MB3718:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB371816ED355A61FDBF0C0143C1CA0@AM6PR08MB3718.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cf23+ogLiX66tHAy5BGX++WiJKrTnGsVyxWqxtI8U5yxATHDP8DFLaFxBQ6duZEkUNCZ+wCvHxgpElfHKolb9wHuDYM8DAVEoCookaUKbgBKulSClzSJhc61O6yVmUHmP6fVH15BwmOxGfJMguM3X7anxGYYhE1QPyFIzEs1I9/W0p3ZEUEUNNN7A5VC20mXUsZ1gcPEqPdGDpd61djnJv/RSB1ZcTtSnt5dkcu6poZSROQYCeozhzCRTEVjXjyekDYNG2INn13jGLbJFoIwLNq0UIaJxYYH4X/n9FPNArObu6v73hNmMmVQAefbc3bT9YoXM6W413An31JiCiXxBTYo7cgTuXwtQWd+TIswi6LyRCrFpXDBaO2GVid3FLfpahXFvV4uBLa0AD0s0xItRFVKi1JfGHi51VC6MvDY9Ds=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(16526019)(16576012)(107886003)(53546011)(186003)(2906002)(26005)(6486002)(8676002)(4326008)(8936002)(2616005)(86362001)(956004)(316002)(478600001)(83380400001)(66556008)(66476007)(31686004)(66946007)(52116002)(36756003)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGpTNEhxWEovOHM0MFBYdlJqbHBFaVZUbVM4MnN3UXQ2SHVvdWNHZjJSdkpv?=
 =?utf-8?B?amlwRDRMY2MwVFpSNUFmNDBMREZVeXBPdllNUjE3Ym5NSXZmUTU0Z214cGpJ?=
 =?utf-8?B?NCswRDRMV1h5T0x1a25aY2l2ZTNFWE0wN3dmK0xYc3ROTUUvdzNCVlJ0VmpI?=
 =?utf-8?B?empQbkZHMWdaZGNrSXdHeHdGRVBjTnZKZy81UEcyL2N0ckJpNnlNTTBvaVho?=
 =?utf-8?B?VUdmMi9MRkx4SnppRk1Ed0dXaUd0QUlOUnZhb1FHdVg2NjFORTFHRUNCL1Vz?=
 =?utf-8?B?djdKcTdURUtpaUUycktzWk1ZZUlpejFLZTJhZWMyVGhLUmdWT05HU0drNEU0?=
 =?utf-8?B?WGlXYjRnbEZDVnBGMzU1cjhlOVNzdWExV2wxL05kU0E2amRiWndTdXRRa2lZ?=
 =?utf-8?B?T0NpTHNWUjlBb2VUYXNLdjFmTlIxUUpjRnBQcDJFWS9JUlFFdEVaRURNMXlJ?=
 =?utf-8?B?cUFyRkxtdHZ1TWU3ZXpnWGgybGlFOEFlOUM0TUNnNW1ZczR5eUczMXpVTzgw?=
 =?utf-8?B?Qnh3RzR5b2dWVXp2WllZandFVStIMzNnMkNPS2Y4eXFqd09qM01mRFpFaWJQ?=
 =?utf-8?B?SHlQU3RDUVlhZmxBTVd0aU16UDNNTnRsejArMjk4NnF6OHpsSUNJcjFEUlpx?=
 =?utf-8?B?aDNUamtoc2cvcDFEb3RpVnIzb0MzNVE3QVIyVmg4RVZLTGxmVS9uTlZ5VjFk?=
 =?utf-8?B?RE9mK2NaQitPdSs1dTBrelJVMXQ2TUdkN2doRFJGRUpyWHFiTm50SThhR0pN?=
 =?utf-8?B?ZExYU1J2bU8xeVNJRU9uazhwZ2tFZzNUWkNRa1lnMHhQcnVEL0UwcWhVQ2gx?=
 =?utf-8?B?a1hpRmZieVVhWDhBTXM3NHFSOGJ6Z3daUTF2dU9ldzVsUi9RaXlVSklFbGhl?=
 =?utf-8?B?VDdEdDNXbDZZUFg3cS80UEw1enVHb0dadjlwalJUSExySzBVOEF1NVI5VElJ?=
 =?utf-8?B?dXBYeE1vd1BFVklLaGZqQ252ZzdHYU9SVzZsZTVHZzRndjl0WkdJd2N1aUFT?=
 =?utf-8?B?NDM2VXdYY0tnY3R0SFVUaEo3dkxtcGxINGdZemdMcmRDNUxBNmJ6eUY2ZlVY?=
 =?utf-8?B?RGx6UlZrb2VNdWlUdWlSci8weUE3Q2ViUlBMNjZjMDE3dnR5cUczWkxVdHd2?=
 =?utf-8?B?dVFydWwzd3hHRlJzUGRJNmJiZHBJSTMwYmZpR1l5OXNUeDJDVjVIdTFzaEpr?=
 =?utf-8?B?Qm13VnByRW1VajE5ZDFBbENBR2Z2U21pcDdpeEMzTThxSW9PUWVjY1FKamdr?=
 =?utf-8?B?Ukt3bzZPTmI4RnBZKzIxbCsyM205dG8rL0tUcFU5eUJFdk9ycE55K2Y2bmtJ?=
 =?utf-8?Q?v/A9+V06C1kKM8550F4RaZhz5FO/riZ9ni?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 17:48:54.5701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a96f5d3d-2768-481f-d9d7-08d89dfd0738
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWnUCKINu0h++PMYbMNUjxIPwxDz/vy/6bCzt3tMD3CtrDpMwjoO4xKCcgQAH6WxR5IFk7+p4bvIyAaylr0u7/3eaSLBwBEk3ZEa+bV0AMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3718
Received-SPF: pass client-ip=40.107.5.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 20:21, Max Reitz wrote:
> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>
>> This patch completes the series with the COR-filter applied to
>> block-stream operations.
>>
>> Adding the filter makes it possible in future implement discarding
>> copied regions in backing files during the block-stream job, to reduce
>> the disk overuse (we need control on permissions).
>>
>> Also, the filter now is smart enough to do copy-on-read with specified
>> base, so we have benefit on guest reads even when doing block-stream of
>> the part of the backing chain.
>>
>> Several iotests are slightly modified due to filter insertion.
>>
>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/stream.c             | 78 ++++++++++++++++++++++++++------------
>>   tests/qemu-iotests/030     |  8 ++--
>>   tests/qemu-iotests/141.out |  2 +-
>>   tests/qemu-iotests/245     | 20 ++++++----
>>   4 files changed, 72 insertions(+), 36 deletions(-)
>>
>> diff --git a/block/stream.c b/block/stream.c
>> index a7fd8945ad..b92f7de55b 100644
>> --- a/block/stream.c
>> +++ b/block/stream.c
> 
> [...]
> 
>> @@ -295,17 +287,49 @@ void stream_start(const char *job_id, BlockDriverState *bs,
> 
> [...]
> 
>> +    opts = qdict_new();
>> +
>> +    qdict_put_str(opts, "driver", "copy-on-read");
>> +    qdict_put_str(opts, "file", bdrv_get_node_name(bs));
>> +    /* Pass the base_overlay node name as 'bottom' to COR driver */
>> +    qdict_put_str(opts, "bottom", base_overlay->node_name);
> 
> Hm.  Should we set this option even if no base was specified?
> 
> On one hand, omitting this option would cor_co_preadv_part() a bit quicker.
> 
> On the other, what happens when you add a backing file below the bottom node during streaming (yes, a largely theoretical case)...

Yes, that's what I was thinking about.

And more: we are moving to using "bottom" and deprecate "base". So bottom is the main concept, and it can't be NULL. If user don't specify it, than default bottom - is the current bottom node in the chain.

I think, we are not going to introduce a different behavior for stream "without bottom", when user can add more nodes to the chain during the job, and all of them will be removed after the job. It will require rethinking of freezing and keeping references on intermediate nodes at least..

>  Now, all data from it is ignored.  That seemed a bit strange to me at first, but on second thought, it makes more sense.  Doing anything else would produce a garbage result basically, because stream_run() doesn’t take such a change into account.
> 

yes

> So...  After all I think I agree with setting @bottom unconditionally.
> 
> And that’s the only comment I had. :)
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 

Thanks! v15 will come next week)

-- 
Best regards,
Vladimir

