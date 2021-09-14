Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E316F40AC52
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 13:24:16 +0200 (CEST)
Received: from localhost ([::1]:42412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ6Xv-00029b-GR
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 07:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ6WK-0000vR-3u; Tue, 14 Sep 2021 07:22:36 -0400
Received: from mail-vi1eur05on2102.outbound.protection.outlook.com
 ([40.107.21.102]:18208 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ6WH-0002hK-85; Tue, 14 Sep 2021 07:22:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeqfueQKXCG5hCxLXdVFwZrrjYzYMKkslQlDs1SdAkwBCbLOi+EJB5SHCBvkW/MP74msyPqwkLtBAYFLYeESOC0vEV/G0iwXlq8xffDbZnD9gLXNfHg+AMnd6pSJwp66dreq2304qR9PNkDs+5ldmQyGUsFdEnw4shJhcd/wzXiLrbI+mDEcU/FMNooGd6VmJQNcW7bI9MGSjqPNwYCRf1aR422DVE6AT1YrIQR3/y6ggov8GvBcxSOAlXrnwfjkX/lwjRtTf6jL7SW+XphEDQqkk2r+qmnRfAc4HmMLjsdxOZYn2wuNuLlqYt+xRuvShHjSQcLF5F6Tcc1utzrGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=vXsGEQ14ztLpugJtrhVQscKzz+XOykWj18sPhEz2tns=;
 b=UcrgcnHp9EfIQbw+j3lZ+B1kzT3ZH0wBWEIHvXpvyuuf1zsMmCDcMvFurqm0YtCnjF/M5CDtpr/VfSXI04F/mOdU56vN2mhq//U0lLkbdz6YjoBlysydLfI/cr2lXN1X1MwwpGWJwbGLVMcCIEw2r0q0RuSgLWdPUAsj2OU4GA8t/uX84WgIzrxf8gAcS2c3CHij6uzeIqBNkR0mrNs1UXFZ1HXMou5ZgeYBr5qJIDdxavGDCYSAxdpUw2UItNRRfmQ0FjlK0tK8JVRU5r7Io8kddL68PeDn5NStSgC9MzGqtCYG7tgjrosMf9DxLhKPGeNuMWnzfp7Y6hRVIQ8YyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXsGEQ14ztLpugJtrhVQscKzz+XOykWj18sPhEz2tns=;
 b=ABrwsCkdwKywjbvGP1KENRWbhz0+pfi50yzUlYSZo9QNDnNwHW6qFnSAdYTCKXdMbZah3nIn8Un2VxfqHnZmZZszgYSX+jCTe8VvKwknuxNIISXSgoeKp/HIjIpu8Z2bZ3qNv5pZTJKwx2TxSxkYQ6VSKr5E6jjXKhu8QH5ehDg=
Authentication-Results: igalia.com; dkim=none (message not signed)
 header.d=none;igalia.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Tue, 14 Sep
 2021 11:22:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 11:22:28 +0000
Subject: Re: [PATCH v3 06/10] qcow2-refcount: check_refcounts_l2(): check
 l2_bitmap
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com, eblake@redhat.com, berto@igalia.com
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-7-vsementsov@virtuozzo.com>
 <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f3bbb14f-bafe-b299-334f-70bc626a9454@virtuozzo.com>
Date: Tue, 14 Sep 2021 14:22:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <704ed8a0-387a-d2e7-827f-39957f67b892@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0091.eurprd07.prod.outlook.com
 (2603:10a6:207:6::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM3PR07CA0091.eurprd07.prod.outlook.com (2603:10a6:207:6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Tue, 14 Sep 2021 11:22:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5aaf0a81-ab7d-4377-ed69-08d97771ef9f
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591258D74A023AF93D029DC7C1DA9@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EopHmrbJfaLAppxZSOm6YODcizpcZtHlLhgNbH/AoRe5c6arb1cJBkMI8Irv2N1ZeWHRedEKAsx16rWsllLQUd8vZWKOMQ6qVVnuzU1ygnDK+rjrnp8hjc18Rv1NJ4hTwgxsqfQZF0ytxCcpZ6ZddKwToORW85/7/njSeQba5m78MlDkvpJ3MoUkpgZXH96x6Zx3qsHmFcuf4h1Ogkx+bKLWMk7J9ZZ5u+5qgwthr8biQHG2xt0486Xnm7saGN2e9LrTccS2MOVi8Q0F55zQVv7LeVGg7lyNOcEyZ+a/BW+VN50QnAoOZSSuDWBRaIslp99vu4HafcfQ5uP7mWcFDjM/NQOmvN3QFj8rxrn6AOWawiCUDWjJn+v2Xah4uVHP83phQ3r8Z50ZAKHxN0J0bDkD+ULBD7YIHmdzOsFbOSE68Faf49a1WfeKolUq0R0RIo0/w0klcemT/LvZFoY5KDZAww3Y7G379NMck8niUriPvl8dN2qsZYYBrI4TcjVGLEFpBnk4dgRiqmKI9hEJ5HjLvD+HFYddywySydgMBZh8OcaYXheMJvIB+XKrX+hAH1JL0yKfFAltnmK7ijSY6ytKKKPtyb9/NxqEbFKCChxRyunesJ/4k8HvUQrV2Ot7Rhb6/siFffucYh70Ow2Sxv/QrMhS28WMgJ1h56FyN+t1cPoEgP++H9HtpQ9L6B2/xGvzD3CDk02cmSeB1RuTxY0YW5BBlz336lEW2Th+fMku8lSTlQ0rz0jIJMjC/Dfy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(376002)(366004)(346002)(26005)(316002)(31696002)(6486002)(86362001)(66476007)(66556008)(31686004)(52116002)(4326008)(8676002)(66946007)(53546011)(38350700002)(38100700002)(956004)(2616005)(2906002)(5660300002)(478600001)(186003)(16576012)(36756003)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1gyQzhJdlJkZmhEWDNMZDBSSFg1UVVMODVWdmc3WDVVZkkzd0VCZEduVi9W?=
 =?utf-8?B?SFU1SERzRDRVbzVPU3o2bjhaVmlXbGtlYVQycG1EMThwZnZ3ZnMvSFUvaXhU?=
 =?utf-8?B?SDZsUW9LSkczUGp5MitvbmZoTE5DakNTTVNHbjVKRExGSmRIMUpBQStwL1B4?=
 =?utf-8?B?Nk5ZZG8rSGpVbkttN1FhNkF2N2J6b1JTS01NQkRtbXhvaFFlalZjTkVSMjQw?=
 =?utf-8?B?WXp1Si9JUUpzc0xtMkJxTWJqbzB1VnE4RmI2M1ZITnV1eVQ0ZGZzOFBTQTFa?=
 =?utf-8?B?Q21ieVBXblpLbnlFUk1xMTdIdm9iUUx6Q1U4a05GQlBRcnptYWZ6T0dLWTE5?=
 =?utf-8?B?anBwQWw5SHJxbVpjRFRkb0w2VkRvNzBzK2IrUzN5K2dTQkpSWGZvUDRRSnU3?=
 =?utf-8?B?RUJ2aHlGeUVicTcvKzUwUEJ4aVNqd3RwRk1TZ0ZsQjhFT0Z3Vm1DdHIrMEQy?=
 =?utf-8?B?bEh3SFVIamlraDJGbmlQNm5nb0JZOFEzeFpINEhGNUhlYS83Nis2ZDRCZTNO?=
 =?utf-8?B?Mmt2NUNuckVrRFFvVFJ1eVc4S2t1Qm5FMEIrWkx0U2VlUXVNMERIbHBpSllh?=
 =?utf-8?B?aXRlWEFQSVBva2FmcUhKakZLYXRyQ1JBZmdUNEt2VDQyYnFQa21DaVRsRmdh?=
 =?utf-8?B?dmhuUUtiL2RuYUthUmMxOHVqUEI2eWpjb2xqbGhRZ290c3FwcFRncEVPSDZV?=
 =?utf-8?B?czRyMU53cXZmWmg5L2RDRDhueStjRFowcWlaZWJ5LzVGM3BsYmtQNWNxbkRv?=
 =?utf-8?B?Rk90VFVKVkM0YmdEZ3c1TUhKTkFMbURZWllEdnVOOXdnTDZvUUNhUVVVVitX?=
 =?utf-8?B?WDFPd1JaVDdtand0WEd0U3BLNldyWFVoQ09LZVJhbXpCanRiVUpHUWZGQVoz?=
 =?utf-8?B?ZmViSnhvU2lCaStqRWdHUGJGYy9JaUJOQ3RYdTkyUUtkQUVJczQ1T0htWFN3?=
 =?utf-8?B?c1NSYm9KY2p1cWFmTmlDMSs1YUxrWkhaSHBBc25CQTZnMml3MjlGZm1XdGdN?=
 =?utf-8?B?dmVpN1Q0bFRSTmpOc0preU1WTGV2b0NBeTdBN3QzdzlwVDlQNDd6M3hUejhx?=
 =?utf-8?B?V2k2RHcxM0VSYm1WOHJkUVFQME9yaFRoQnRtV1N5QkZPb0RUc0F4RXpsbnBa?=
 =?utf-8?B?NVM0TDRvWFkzdjlVbUw4SFNjN2hzZi9MR2NqVXJZT0xNQjJXUlliOTVhQnFi?=
 =?utf-8?B?elBpb0IxTXZjUFF0VWlDQUs3dEdhRnpyU3kzWVFEVjFEdHdpWWxPOWJabmlD?=
 =?utf-8?B?MEdIamU3M2NGRitScm9wVGpJYmliVmFLTFRndjlZeDk4ZEJOd3Y1a1lHeTVN?=
 =?utf-8?B?VjZ0dkFiOVQvWDB3TjlRSEYxM2sxR2NVZGl6bStWZUZzQmZ5cVMreEE1QWVj?=
 =?utf-8?B?NkFYbVdrREJVb3VLbHEybXg0ZEpVbyttTkhOZWVCcWNXRGluYmZWOXNQN20x?=
 =?utf-8?B?b0QrdmlnSXhUNk5sY3lJdm84R3dzazhXQjBaUWFNY2lZb3h2V1paNXR4TlZa?=
 =?utf-8?B?OUJuYTdRZmN2MnJHS3dxdi9TaUZlWkVKcEcwcHo4b0ljbUJhY2V0aE83R3BU?=
 =?utf-8?B?ZUJQbml4K2ZweFRMcVBXM25TdkoxcEtYNDBjdVVMWUpxVVpiMzMwa01TckhT?=
 =?utf-8?B?c0x3UWZuZ1JYcnRzQzllM1RWYXZiR0lGR08wVVh5Ylh5ZnJSRWdTQ3pSK1Ez?=
 =?utf-8?B?L1hicEd6cFcrZXpRM0xoVXpjb2xuQWF3bk42dVJLZmNxOXpMeVhIVXdlL1Vv?=
 =?utf-8?Q?gYMYp2V/pV8wJtll7bo0It95EBniiES0qOSVLkI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aaf0a81-ab7d-4377-ed69-08d97771ef9f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 11:22:28.6474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFmeP5TmhZc9qaygLgwOCxdOIr+MUKqmnNUtS3GE0xebiGZOjLuWnrYGH6sq/6oLqHw+RpukatVxQfrqROa5PHv8HAFqcSahBhB68CBOlUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.21.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_NONE=-0.0001,
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

14.09.2021 11:54, Hanna Reitz wrote:
> On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
>> Check subcluster bitmap of the l2 entry for different types of
>> clusters:
>>
>>   - for compressed it must be zero
>>   - for allocated check consistency of two parts of the bitmap
>>   - for unallocated all subclusters should be unallocated
>>     (or zero-plain)
>>
>> For unallocated clusters we can safely fix the entry by making it
>> zero-plain.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> ---
>>   block/qcow2-refcount.c | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>> index f48c5e1b5d..062ec48a15 100644
>> --- a/block/qcow2-refcount.c
>> +++ b/block/qcow2-refcount.c
>> @@ -1681,6 +1681,7 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>           uint64_t coffset;
>>           int csize;
>>           l2_entry = get_l2_entry(s, l2_table, i);
>> +        uint64_t l2_bitmap = get_l2_bitmap(s, l2_table, i);
> 
> This is a declaration after a statement.  (Easily fixable by moving the l2_entry declaration here, though.  Or by putting the l2_bitmap declaration where l2_entry is declared.)

The latter seems nicer.

> 
> [...]
> 
>> @@ -1800,6 +1815,19 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>>           case QCOW2_CLUSTER_ZERO_PLAIN:
>>           case QCOW2_CLUSTER_UNALLOCATED:
>> +            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
>> +                res->corruptions++;
>> +                fprintf(stderr, "%s: Unallocated "
>> +                        "cluster has non-zero subcluster allocation map\n",
>> +                        fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
>> +                if (fix & BDRV_FIX_ERRORS) {
>> +                    ret = fix_l2_entry_by_zero(bs, res, l2_offset, l2_table, i,
>> +                                               active, &metadata_overlap);
> 
> I believe this is indeed the correct repair method for QCOW2_CLUSTER_ZERO_PLAIN, but I’m not so sure for QCOW2_CLUSTER_UNALLOCATED.  As far as I can tell, qcow2_get_subcluster_type() will return QCOW2_SUBCLUSTER_INVALID for this case, and so trying to read from this clusters will produce I/O errors.  But still, shouldn’t we rather make such a cluster unallocated rather than zero then?
> 
> And as for QCOW2_CLUSTER_ZERO_PLAIN, I believe qcow2_get_cluster_type() will never return it when subclusters are enabled.  So this repair path will never happen with a cluster type of ZERO_PLAIN, but only for UNALLOCATED.
> 


Agree about ZERO_PLAIN, that it's impossible here.

But for UNALLOCATED, I'm not sure. If we make all wrongly "allocated" subclusters to be unallocted, underlying backing layer will become available. Could it be considered as security violation?

On the other hand, when user have to fix format corruptions, nothing is guaranteed and the aim is to make data available as far as it's possible. So, may be making wrong subclusters "unallocated" is correct thing..

> 
>> +                    if (metadata_overlap) {
>> +                        return ret;
>> +                    }
>> +                }
>> +            }
>>               break;
>>           default:
> 


-- 
Best regards,
Vladimir

