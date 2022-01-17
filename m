Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2146490737
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 12:39:22 +0100 (CET)
Received: from localhost ([::1]:43220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9QM5-0000io-Fw
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 06:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9QJf-0007Zi-Kp; Mon, 17 Jan 2022 06:36:57 -0500
Received: from mail-eopbgr50121.outbound.protection.outlook.com
 ([40.107.5.121]:53735 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n9QJM-00080n-15; Mon, 17 Jan 2022 06:36:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P30N+2fMxOv5WHKhk+EPWM08q0bGlAvl7g9Js5tDibRwtWcPHfM+hmyCNvsFLYqTdcIWDfLD6lQsL+HRAR4QjWM6MTwlP8IUf72SW/W6zpc8iBloRv4tUj1U/tKVQSJztWws8fzlVHkJ2hC3/1HFqZMc2/nRKT8f5R6rAJfA3Eguo3Y66nqP8lqfN5DQYKp7dYEXd7MN6GUrO27cHze36KUWxtRKJRDm/+53E4vNX9p3XOhqS/IFHnC/o1PC1ga6WpOVDJGkOwGdv7yq/opPH4KgN3hhS/n0u5hUaF4SsYuH1Ulywyn+A3/X1/4HJEiuMo0GSj9mTeTY1+1Ez0X6zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qcbq9zi7pQ7TA/R4TEVsFZkf1cKfX4asrM6zG0HnvI=;
 b=Xi/2cht451Yukw0eYpKH9M+Ss11Q1/NIEuaPpQKSgVqeHY7KfVRQqw9/nPh2CaswBskGveT6raRq6IcqZS1QILRSa2ySC4W8wCaHbyf3DyU1ZvKXOuOyPwkdxTzlxBU5HSYfQ1selsgA+iJuu1LuHiHjOm69Z35UdM44T6kU+TmTVZ4MbXGfa3m/9M2tZmOqCP9xzBD4Y6FFwdlZYmt0qZmvGXA/b713eaQBU5+iOnC5tjiT99Veg6Nn/sUdC+9kU4uu5ZUYFd7xYRbHPBeloFygxMskZJqx+yKp9N7rsatyU+vpCdXhPMCJWq254XDRo/8w62uKOfc560MhruSEXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qcbq9zi7pQ7TA/R4TEVsFZkf1cKfX4asrM6zG0HnvI=;
 b=ImMJRc/yHujQxhDNskVCbeCUSRaZJFskkUtXitV5C4foglXPoR1ZCJE2oDjpjxaVPaMunIStlShfkM0EiFgzqcb1tDlukxkmu/4GvkuNQ33NOuSBVrst7rmVMfEecoMt58EutpY9WBDlYqlSCHx+p25e0iBMX5aNfdiTKJjtjVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Mon, 17 Jan
 2022 11:36:13 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b435:c0de:ef6b:5917%7]) with mapi id 15.20.4888.014; Mon, 17 Jan 2022
 11:36:13 +0000
Message-ID: <62f1f800-fdda-d9c3-a7d2-6369a5fd29a1@virtuozzo.com>
Date: Mon, 17 Jan 2022 14:36:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 04/19] block/copy-before-write: add bitmap open
 parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, nikita.lapshin@virtuozzo.com
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-5-vsementsov@virtuozzo.com>
 <947302c8-66dd-6b71-922d-c791cc87875f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <947302c8-66dd-6b71-922d-c791cc87875f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79a4bd83-f7e5-408e-df36-08d9d9ad90e0
X-MS-TrafficTypeDiagnostic: AM0PR08MB5443:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB5443B940D54664AB6D3F8AD6C1579@AM0PR08MB5443.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7MLr0jFms4jh5Jqsyl/gwum5LlI1X1BC6DL9mR/KU2otQE7UpgA7m7lVTTg9pZ6qD2q5Vhs/lt+Uct7/0e1OPRoqJSlNvjDg4jtpAk264xpxRXPODVBBVDPN6dhhmYWlNjtbL3x1p90OFUFMPWkKe0dHn69J/AUUOZ4VFdIMIE91UJ3ZpFBDXcfnJczszLAM8zpQhcthiiAIiP7eJSdAdH+lCQYJ4MqdQam9v3/V5gEWn+1SXguQmwxNabR26fyXX8H7wUD8arirhSoZo8JuDvfD79EcWfwm1ntDZBMkNJW4ffYIu1xcPhtb4isnXJTecrYyK5ZjPke752xHCUAmifOw0/2demk5Zw4myNdQG++YfdnyB0dQXlZY8ixVYxHVKKMr5tOrq0NaZZ7+EzhVPqFRh8glptl7L0vBSHj+XzlIZJbn4cOrmn7zUESB+iQKWlp3z/4fMtMz4A2sNgBS95D9rPFq7AWRV4Zesrq2xzw7Iu6HR8JnxsFyA0T/0UNEwjP2uUCp1LEQD4KGcp37drgKoXvvJ41l3wyupX5hi2AiscwKXikUxtBbmoOTGfBdPdKJx5Eu48t53GD5pdVOI4xW4f8Nwb3EqzmAeEkrBZKRyWFxEE/qQ9e1N9t4/4e7PcGev1Mdh0KoffICo/Kwjn64K/XurzxpeNTAYcQklCmziro42AjkDJLXyaPUP9k0cwATjavRQCO0XHAXV+EAvWXvn1AzQxRUp3Arr0KjzWx3FbEbSjGZ9SnwNbO0Xj1gC++yQwZuSUg/qTZZ8i8FFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(83380400001)(5660300002)(52116002)(36756003)(508600001)(8676002)(8936002)(31696002)(38350700002)(86362001)(107886003)(53546011)(38100700002)(26005)(66946007)(66556008)(66476007)(6506007)(31686004)(6486002)(2616005)(186003)(316002)(4326008)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdVRHpCV3Jrd0VsUHVPYThjTithbk5IYTlwNGVGeGZrOXJXTjVLcjZRZExV?=
 =?utf-8?B?ZXpyZzBmaWtlSFRnRHRZMTRsNlpNdmx1Y25hYUl2b3llZjR0RTMvNjRqcmpQ?=
 =?utf-8?B?MmhnNHFRN2hVMnVNSFYzeFZsa0c1YXhpR2xkSTUrNnphMXJHYmlYRVNYQXFn?=
 =?utf-8?B?blpEdVNMVGZrMHMrbnJ5a3RVSlhlaTh5YTZ6d0swcDAvZXJKczdIUDEwSGdt?=
 =?utf-8?B?QUg5SllRNFlSMmp5bFZCVXp0UzNFdTRJakMvMEpNdEUvSFVrNHZzVUxTc29p?=
 =?utf-8?B?M2FHYk9SV0dhZ1NBUlMvS25xeFE2RlkzbHlKbk5LRndSS0FWcEh0RzE5NVNz?=
 =?utf-8?B?dStYdHZsTFFEL2NacExqRUdCZHI5L0pSWWRmenpEUGtBSlUrRFFkNGsrQmQ4?=
 =?utf-8?B?MmdBMkZoalRlQzhNZWRKTGh1WG82R0lNYW92cDhOL1l0YXF6TWVNdXFtMm8w?=
 =?utf-8?B?Z0VPNk1mam5WcU4xVUhvNUU2cUwzNWhoZlE2RFF0U1h2SlQwaXUwQmYrcVVB?=
 =?utf-8?B?eGNVSmNETmZEbjNvSXdGZUdtdWNzVDNQTW5waGxoTFhyNjcyZFFGVjdHVkRL?=
 =?utf-8?B?Y0owbFA0VlhuOXlBNUJCTFVkRy9LbkEvY25VRmtjS2JNUlBiR0RUYjRQb05y?=
 =?utf-8?B?QVp1Uzd1dHkybHRkaTl3bUtuT3pHVVo5VFdZRzB2WllsQnByWHM2NzV1L3g5?=
 =?utf-8?B?T2xmY1cwdUxka3ZiRkI5Y2pmVThka3lxTlZUa3lPS2xSWVJHM25nY25Qb0dj?=
 =?utf-8?B?RjFQTE5LbmVzRWltYm0vazJWWCtYRStHb2ZXT05Dd05Cd2dBbi9IMkdpMjVD?=
 =?utf-8?B?eHJxd0toV1plREhadFB5d3MycEpET3ZkT0hjWjl5aW5rcityREF5Q2wvaEtQ?=
 =?utf-8?B?UFB4Nmx0QjUyc0YzZ2RlWjNhQ0ZSQ2hYWHhnaVFFanlLdkhHL0twNTFnWnZO?=
 =?utf-8?B?VmtMcXl0TjVnSlBlUlN1aUtOSXFkTk5ZTTJkbnpMZWd5R0RtN0laU3FNMDdT?=
 =?utf-8?B?UVgxTzZrZjRRYzgrNUYybUI1MWhibG9IdUkrU1FDM25ROUxTb1NxaS9QODJF?=
 =?utf-8?B?ck1ZVSs0cVc2SGQ5YzVkays0MWpqbWhKcGpFL05OS1ppbVpCbWY1OXFOSWJW?=
 =?utf-8?B?QWxwMDVHNXV1eW80THhldHlIUHFVMmhSS0l1M3RlaXpzRGNISTdGY0FtL2Yy?=
 =?utf-8?B?SndGYk5EZTl5ckd3aHhpK2VnWUMxd0hNbTlKdDRXMm9zZWtMYzRsSm1EM1VF?=
 =?utf-8?B?cDhzaVhOMmJ4V0E5aE9Eay9JTk5Ubk9FeE9TeUF3YVdyTHRTS0F3ZmZFZnRM?=
 =?utf-8?B?Z0cxSFJ3ZFFlR2Q2bWlDQncrRnBYaldKL3pOK0Z4QVkvRXFjRmxySlVOWGZ2?=
 =?utf-8?B?NHVOdzFudHg0dm1xcnlrZEtJMElBVHF2N0xHTVBCbDNpWXFxUi90UllqTjMv?=
 =?utf-8?B?LzYxczM4MlhiOHplTkp0Szc4ODhEY2tKWmJMOGZpb0N4Mnk4WGZIQ2FlTzJN?=
 =?utf-8?B?S0ZZb0VtTUdCall2ck1mNFFQSWJjWTlEUkVWTndZSnR1MGdhb1VqanRuNWhR?=
 =?utf-8?B?b2Q5VU5IZ2NoU0tvQ2NrYXRHUGkxc3FmYzQzeUdiT3ZCWmg3bEdLV2dFREwy?=
 =?utf-8?B?UEpoVmNUVklKd3FmYUZzZ1FVd0l5SVVINU9IY3VybXcxOVl3UHZQNitBaXFx?=
 =?utf-8?B?OHBiMnJGZDM4aGl5Rktmb3EyOVZZVm9BMjRsbDBJN1p1bUgzVFZNK2ZhVE04?=
 =?utf-8?B?WVZ5UkFDZ2NPZi9zc1g3a0N4YzByK1FDL0JMY2x6NTBabEpNSCtyQTVUNkU4?=
 =?utf-8?B?WEJJRmpneWR4Z2dQRGM0Y2hoOERVOW9NRjdlWTNsMEk1N2t3UnlHZlBFZGpk?=
 =?utf-8?B?Tnk5T0JmMWQvMWg2RFRSMmlEOUtUWkV6N2M0ZnVJTjkyd0JYQ1NBcEFYR3A3?=
 =?utf-8?B?OEhtZmtVZThwRlVyUVJwQnVlS0ZoVjdySFlTalZTY21TRk9JeVNrZHFIZkx0?=
 =?utf-8?B?SW9VVFJGUVlMUWFMWUtJQVlhSVprTE1Nc1NJNURLTnZZU2FtQm01d2dhYVA3?=
 =?utf-8?B?azV0cnVDRkc4V3A4VE5laTYrQWNGNXdicis4dGhING5kZDROK1lQeEpPb0pL?=
 =?utf-8?B?TEFIVFk4dW5Cb2dpTzdwcWJEMWlzY252b2h0REhFUk1yMlJ1SVk1M3hIRSti?=
 =?utf-8?B?d0dSR2tzd25sZS9Sbm1CaXhXNEJhZkNOOFRKYlJvUUFvOWlucTlndGhOOUVL?=
 =?utf-8?B?Zm80Q0JYd3ZjeHlUMElkSWZDMEZ3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a4bd83-f7e5-408e-df36-08d9d9ad90e0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 11:36:13.5061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2B/EV18+RqyTqqUSMBAVxlQKgPp5MVaz5vctsdxnfO9EvkgXxIboEdleQFcqbBjWQqRRRirUMuWonxlyVe2Zge+mrjSpbXnS4AoALQTaAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443
Received-SPF: pass client-ip=40.107.5.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

14.01.2022 20:47, Hanna Reitz wrote:
> On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
>> This brings "incremental" mode to copy-before-write filter: user can
>> specify bitmap so that filter will copy only "dirty" areas.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json      | 10 +++++++++-
>>   block/copy-before-write.c | 30 +++++++++++++++++++++++++++++-
>>   2 files changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 1d3dd9cb48..6904daeacf 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -4167,11 +4167,19 @@
>>   #
>>   # @target: The target for copy-before-write operations.
>>   #
>> +# @bitmap: If specified, copy-before-write filter will do
>> +#          copy-before-write operations only for dirty regions of the
>> +#          bitmap. Bitmap size must be equal to length of file and
>> +#          target child of the filter. Note also, that bitmap is used
>> +#          only to initialize internal bitmap of the process, so further
>> +#          modifications (or removing) of specified bitmap doesn't
>> +#          influence the filter.
>> +#
>>   # Since: 6.2
>>   ##
>>   { 'struct': 'BlockdevOptionsCbw',
>>     'base': 'BlockdevOptionsGenericFormat',
>> -  'data': { 'target': 'BlockdevRef' } }
>> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>>   ##
>>   # @BlockdevOptions:
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index 799223e3fb..4cd90d22df 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -149,6 +149,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>                       Error **errp)
>>   {
>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>> +    BdrvDirtyBitmap *bitmap = NULL;
>>       bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
>>                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
>> @@ -163,6 +164,33 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>           return -EINVAL;
>>       }
>> +    if (qdict_haskey(options, "bitmap.node") ||
>> +        qdict_haskey(options, "bitmap.name"))
>> +    {
>> +        const char *bitmap_node, *bitmap_name;
>> +
>> +        if (!qdict_haskey(options, "bitmap.node")) {
>> +            error_setg(errp, "bitmap.node is not specified");
>> +            return -EINVAL;
>> +        }
>> +
>> +        if (!qdict_haskey(options, "bitmap.name")) {
>> +            error_setg(errp, "bitmap.name is not specified");
>> +            return -EINVAL;
>> +        }
>> +
>> +        bitmap_node = qdict_get_str(options, "bitmap.node");
>> +        bitmap_name = qdict_get_str(options, "bitmap.name");
>> +        qdict_del(options, "bitmap.node");
>> +        qdict_del(options, "bitmap.name");
> 
> I’m not really a fan of this manual parsing, but I can see nothing technically wrong with it.
> 
> Still, what do you think of using an input visitor, like:
> 
> QDict *bitmap_qdict;
> 
> qdict_extract_subqdict(options, &bitmap_qdict, "bitmap.");
> if (qdict_size(bitmap_qdict) > 0) {
>      BlockDirtyBitmap *bmp_param;
>      Visitor *v = qobject_input_visitor_new_flat_confused(bitmap_qdict, errp);
>      visit_type_BlockDirtyBitmap(v, NULL, &bmp_param, errp);
>      visit_free(v);
>      qobject_unref(bitmap_qdict);
> 
>      bitmap = block_dirty_bitmap_lookup(bmp_param->node, bmp_param->name, ...);
>      qapi_free_BlockDirtyBitmap(bmp_param);
> }
> 
> (+ error handling, which is why perhaps the first block should be put into a separate function cbw_get_bitmap_param() to simplify error handling)
> 

Will try. Hmm. At some point we should start to generate _marshal_ wrappers and  handle _open() realizations like we do we qmp commands..

>> +
>> +        bitmap = block_dirty_bitmap_lookup(bitmap_node, bitmap_name, NULL,
>> +                                           errp);
>> +        if (!bitmap) {
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>>       bs->total_sectors = bs->file->bs->total_sectors;
>>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
>>               (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
>> @@ -170,7 +198,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>               ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
>>                bs->file->bs->supported_zero_flags);
>> -    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
>> +    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
>>       if (!s->bcs) {
>>           error_prepend(errp, "Cannot create block-copy-state: ");
>>           return -EINVAL;
> 


-- 
Best regards,
Vladimir

