Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E00CE34E723
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:07:53 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDA0-00058z-II
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRD83-0004KC-J7; Tue, 30 Mar 2021 08:05:51 -0400
Received: from mail-eopbgr10102.outbound.protection.outlook.com
 ([40.107.1.102]:35746 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lRD7z-00018B-Nd; Tue, 30 Mar 2021 08:05:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oeOeeQ9HCs6PkQaEsOPtvIVO8o29hxW4SPGPIRPv4V9aYqiFZ1P9SNzDomJf3UAB1SnnK33200dGjm5q89kG8fQ++FQKZk6/TadsKZrnZjxXPJhRDNY0a8xdF5Gn1rRSGwzGJybwXutPd/VrwpwgAa8yZ+/wxG63GOKKfO28ek66kxSpwPqdwLUJer3GF1nFS9OOg9tE4EXwZ3JaqDmkS85HriMhuA6KY6ViJckWALepAXBIyk7SnLdV8CGJTZuHwfzDtw+AN/Pgx8PhWxW53KZ4ZCzNQ/XPBB1dxXkdcVBa547P5G/Tn9vO5Q7MJJB5qBSOO29JDNaspPmVfd39kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqS9jrWSO+wIoNClD8aZnlB2IfJQGcXHGGC/1CKhRrI=;
 b=BrQ5RhnDk9T81m1knaTr5Lw7Wzfa40lhUJzg8ujOEzIGmuC41nnyXwNIWoqGPOF/58aXcGo+FRZI0Iv0hBmgLl4NMhG8n35t1yFaw5dp6tD4J43IzEBPo2pqUn/ZIQsrWx8yfNbYbTpnU/9ush3+fPFwOoi1EwnqUHKPJTwLmqDM4aiiUmLSgRKeqss690quHgFemCdFlpw+d/NF8Vv4MQUZpBmPRnKzvelG84dqf3l92Bcy3Cp9m6HAzMNudZDLH6hjl1pZLR8Efqu7EFO1rzg6mgXsLjuKfpqe95rWa9c37mW4LC57CQVs7BUu4LYBwYPfM10uUx4jBYy1xWcWvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqS9jrWSO+wIoNClD8aZnlB2IfJQGcXHGGC/1CKhRrI=;
 b=UiiuAyQTYqpRVpFVFU6J+ExiZc0PE7BAaoMbnbnNo6FsOcBUSq0sm+hEEGYV9DO9jZfYdczf6ps5MGu4qt7HgijIQmHFFgIHBIfv1E+aBFnwqnPnNO95ePDNiviocpyB7Ska+t3W7+RLrR+GZnizfcthgnC7xIWtt3wB3mHCtZ4=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1843.eurprd08.prod.outlook.com (2603:10a6:203:3a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 12:05:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 12:05:44 +0000
Subject: Re: [PATCH v5 4/6] qcow2: introduce inflight-write-counters
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210326200045.363290-1-vsementsov@virtuozzo.com>
 <20210326200045.363290-5-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <093efcd2-1e5d-e4f0-7c0c-e4ae2a92402e@virtuozzo.com>
Date: Tue, 30 Mar 2021 15:05:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210326200045.363290-5-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.207]
X-ClientProxiedBy: AM0PR02CA0147.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.207) by
 AM0PR02CA0147.eurprd02.prod.outlook.com (2603:10a6:20b:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Tue, 30 Mar 2021 12:05:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3adc3a93-c8af-4e5b-81e4-08d8f374253f
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1843B0065EE7249DE2D35C35C17D9@AM5PR0801MB1843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:232;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xX/MszZSNsYrPXBuXHzH19SwXo50dA1xhlH1rJ3cJbN6QLZwFOvCloYSiBoK6b7srTUZ2NRFT4H9xPI0Ej+ns1xiAQiaJq9h1FLsebhiTDVc//eJcILp9IgLY6ZlwykiNDJR2vIIsiEwU/mdbnr/uAE3++uzzc+T8HGWHd1HNUp5gD3syTVt3wJRFpIcB2juiqy9buRrROSWMAzxtzFDXys5+3W89veChqnJu72omYCGFkuBMvQOSISIjTbu8+3JOAS7xk/vv8qdiRStquadqJvyq9yf/cbmkLc0FHtnwevgfDMZ77h1jU4AkzXeGc7FYxEuW7aIt15/yYNYBrF0R5ZpeXcg/iqQxP6Y1pmQx70t0cQ0hB/TownX+QBy7yud+VObYAqyxl0hwQj+8wMYnUQLClLVObPqL8C+6uZv92Lroo/jO07XyJxiLyO3Sl1kTIAyvBmRy4wDMoRz820qT60xcbl3qJdGsSGbiVIE0q5GdvotLVa8q8HrhpG2+Lufhz50q8n/WYTl220jnF/Q5hN69+xs+oeP5vPjptwQA6HVpwewP3JpUbSpBy1XwyaMF2SZb3yjL82lw2N7qge8b5XZZHhXnTbv95PVkI55P818m4QgKdjSBQ+r7HjfAyiaHJu8mkOwGEIrWRi0zOZSy72uFKYnW9f1bq+WrQGm6fhS6PNkUHU/9roShwBq4+a6s1nkVSXvC+o10NfZnh02I8uMm73zrGXB2l2BC16TzwXPUgujdVYoxvhdTNhbpHL0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(2906002)(6916009)(66946007)(8676002)(66476007)(31696002)(8936002)(19627235002)(38100700001)(66556008)(5660300002)(478600001)(6486002)(36756003)(86362001)(26005)(956004)(186003)(2616005)(83380400001)(31686004)(316002)(4326008)(16576012)(16526019)(107886003)(52116002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3dBMU1BVW13cHRzQnlhc0pZRFhJQW9UWEZSd2RNcDFBY0RnajVqa2ZIZzFm?=
 =?utf-8?B?ZnJzS2ZHUUZHSzdzTzJOTXlHc2hpamg1MFFBYkp2TzY5UXVKOC93THgzMC93?=
 =?utf-8?B?TkdnTHBZZFJsOXpWSTR1N0xUU0gvajR0Wmc2RHpzc0daY0I3WUtrT0FxYWJL?=
 =?utf-8?B?anJMS09VUXM1OWR1UTRMY2pSLytOUWVQNEZCTWpacDRYandIbXVaakRVT0U3?=
 =?utf-8?B?SjF1UmkrbjlXMlBiVVBZWXBTV2VzNTRsczJzemI5L3BVM0JuTmFJM1hYc3o2?=
 =?utf-8?B?TkFJZjZPZEZnTGw1SkFFaDl3WkFSajlDWFpidGtEbmRsZGJYYnVPbjVOZjJC?=
 =?utf-8?B?aGFuaW1idzF0SFJZN0R1eXFXVjdqaWxQMHU5YXVCZ2RXaUxJbkUyaHY3L012?=
 =?utf-8?B?Qk5LN1U2RFBkcjFBS1pOcFE4SXI3YWdlYzhoUWp3cGZ0Y3VSM0poUmdacmx3?=
 =?utf-8?B?Q2ZnaDRpREdvOTlMNUZxVFEwMFg5M1RYbnhyS295Ykx3NmxnK0s0VGNGMlAz?=
 =?utf-8?B?dktYK2Yxa2EvMmMvWnlWa1RSam11cHI5QmI5Y3lUMUUrQWV0b3JzOUVPNzQw?=
 =?utf-8?B?bjR4eGtHSzd2WDhybkFLMTBBTUVHR3F5OFBEbFNuQUZ0eE8yMnFHZ0FxOXdl?=
 =?utf-8?B?RkFRTkJHU2pwK3c1VEVHcitIanYwaVNnMG5MRVVHSE1oTERKby9TT3dMWDF3?=
 =?utf-8?B?ZC9uU1ZscVk0b2RVelBMK0cvNzFkaW9FWkJMeGx4SENxeEhrQ3NWMkM4MzZP?=
 =?utf-8?B?K2dMTDBFSzg4Q2lVazhuWUNSQWIwWFZRQXkvSGN6WW1ZY3RGQ0pBVFhFUkEy?=
 =?utf-8?B?RUN3bHZSSE9DKytkd1VUYmZuRkZQaDZhVGhDUTBUcEtYNktERGFtVlY1TlFZ?=
 =?utf-8?B?Qk1LMnZSTGxwd3ozQlVqbkkzbTQ5QytZS0xmRk05STRHbWRvZVdBZDd6SGNs?=
 =?utf-8?B?MC9oTDhjbWRXRVAwT0JZbXZ6bjlaaW9QQ2FqdTM3cTRHeDJFNGhId24raStm?=
 =?utf-8?B?WHFkYjJkQklueXRHZ1QzTExEOVdDUGpBQ2FISXJqMlV3NmcwQUprcDdjWXdx?=
 =?utf-8?B?dDB1RTVEckh6TDMrNmV4T0x2cGZXY083VnI5Sm1SeXA3VkU5VlY1WURSYjRu?=
 =?utf-8?B?UVJnU09oTURIaFRDcmQ5SGlVeVBvTk5MYkRHczgzYmdqclVtaHd5Smtzb1Bi?=
 =?utf-8?B?MDRGOTlKQ1lBOUpIaUJCajJRUTNaYnZsOEtjTUtoeEVGbEZseWpOME9RdlV6?=
 =?utf-8?B?OWZweXduM0RrZytrR1FXeTdaTmZHVUFPL1pFWVQxcWhnNC9vWHJ6bFUyb1NK?=
 =?utf-8?B?cC9QNTR5U3o2SUNSQlBtR3BlVlpuUDl4YW84ZUJlVGl2OXhWZi80NWRvVzEw?=
 =?utf-8?B?MGpFUC9WSmpyeDZFUkVoOUh4WWFBZzBPcVdDL2toSjg1c3A5TUVhaEZteWhD?=
 =?utf-8?B?UmFGaE4vRUs3MXVXejN5NlptYUs0THRGL3BvdkZOVDNRWEhBLzYrOVUwbUJC?=
 =?utf-8?B?VzFRSXhBRnJwMVpDMHQzOXFCb0pmaG5id2dmU2o3QnJKTlp5cDgrNXI5M01M?=
 =?utf-8?B?WjczVUZ2T2dUTFh6bVdwTUNjYTBVUi9sL1ltanlKbHFTRzgrMDFPdHByLzhj?=
 =?utf-8?B?cGhaL1BYMUUza3VmWGovMnZWL0xHZEFpRHNYQm5ZNUNERmhyZXFOV1FseEUz?=
 =?utf-8?B?RjFnQlNTc2U4bWpERXJ5RUl0ZmpTMTFhQ3RtbmhaT05jRThOemh4KzRlYVJQ?=
 =?utf-8?Q?2PXFpxyZ1cxV8hJWP0ckOmUQkia6lB0hbdZG91Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adc3a93-c8af-4e5b-81e4-08d8f374253f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 12:05:44.0605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hO2yFzq5TBpamH2DLptl+GIA0OftqbvkcRTyvUljrcpqtGrP9YzZr6RM8bMngxpTvYn9UU3Ps8GSpMugmDWSL+/SvlCDrDBl1QfJjAc6j40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1843
Received-SPF: pass client-ip=40.107.1.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

26.03.2021 23:00, Vladimir Sementsov-Ogievskiy wrote:
> We have a bug in qcow2: assume we've started data write into host
> cluster A. s->lock is unlocked. During the write the refcount of
> cluster A may become zero, cluster may be reallocated for other needs,
> and our in-flight write become a use-after-free. More details will be
> in the further commit which actually fixes the bug.
> 
> For now, let's prepare infrastructure for the following fix. We are
> going to track these in-flight data writes. So, we create a hash map
> 
>    cluster_index -> Qcow2InFlightRefcount
> 
> For now, add only basic structure and simple counting logic. No guest
> write is actually counted, we only add infrastructure.
> Qcow2InFlightRefcount will be expanded in the following commit, that's
> why we need a structure.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2.h          | 16 ++++++++
>   block/qcow2-refcount.c | 86 ++++++++++++++++++++++++++++++++++++++++++
>   block/qcow2.c          |  5 +++
>   3 files changed, 107 insertions(+)
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index 0fe5f74ed3..b25ef06111 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -420,6 +420,17 @@ typedef struct BDRVQcow2State {
>        * is to convert the image with the desired compression type set.
>        */
>       Qcow2CompressionType compression_type;
> +
> +    /*
> +     * inflight_writes_counters:
> +     *   Map cluster index (int64_t) -> Qcow2InFlightWriteCounter
> +     *
> +     * The map contains entries only for clusters that have in-flight data
> +     * (not-metadata) writes. So Qcow2InFlightWriteCounter::inflight_writes_cnt
> +     * is always (except for when being removed in update_inflight_write_cnt())
> +     * >= 1 for stored elements.
> +     */
> +    GHashTable *inflight_writes_counters;
>   } BDRVQcow2State;
>   
>   typedef struct Qcow2COWRegion {
> @@ -896,6 +907,11 @@ int qcow2_shrink_reftable(BlockDriverState *bs);
>   int64_t qcow2_get_last_cluster(BlockDriverState *bs, int64_t size);
>   int qcow2_detect_metadata_preallocation(BlockDriverState *bs);
>   
> +void qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
> +                               int64_t length);
> +void qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
> +                               int64_t length);
> +
>   /* qcow2-cluster.c functions */
>   int qcow2_grow_l1_table(BlockDriverState *bs, uint64_t min_size,
>                           bool exact_size);
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 1369724b41..eedc83ea4a 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -799,6 +799,92 @@ found:
>       }
>   }
>   
> +typedef struct Qcow2InFlightWriteCounter {
> +    /*
> +     * Number of in-flight writes to the cluster, always > 0, as when it becomes
> +     * 0 the entry is removed from s->inflight_writes_counters.
> +     */
> +    uint64_t inflight_writes_cnt;
> +} Qcow2InFlightWriteCounter;
> +
> +/* Find Qcow2InFlightWriteCounter corresponding to @cluster_index */
> +static Qcow2InFlightWriteCounter *find_infl_wr(BDRVQcow2State *s,
> +                                               int64_t cluster_index)
> +{
> +    Qcow2InFlightWriteCounter *infl;
> +
> +    if (!s->inflight_writes_counters) {
> +        return NULL;
> +    }
> +
> +    infl = g_hash_table_lookup(s->inflight_writes_counters, &cluster_index);
> +
> +    if (infl) {
> +        assert(infl->inflight_writes_cnt > 0);
> +    }
> +
> +    return infl;
> +}
> +
> +/*
> + * The function is intended to be called with decrease=false before writing
> + * guest data and with decrease=true after write finish.
> + */
> +static void coroutine_fn
> +update_inflight_write_cnt(BlockDriverState *bs, int64_t offset, int64_t length,
> +                          bool decrease)
> +{
> +    BDRVQcow2State *s = bs->opaque;
> +    int64_t start, last, cluster_index;
> +
> +    start = start_of_cluster(s, offset) >> s->cluster_bits;
> +    last = start_of_cluster(s, offset + length - 1) >> s->cluster_bits;
> +    for (cluster_index = start; cluster_index <= last; cluster_index++) {
> +        Qcow2InFlightWriteCounter *infl = find_infl_wr(s, cluster_index);
> +
> +        if (!decrease) {
> +            if (!infl) {
> +                infl = g_new0(Qcow2InFlightWriteCounter, 1);
> +                g_hash_table_insert(s->inflight_writes_counters,
> +                                    g_memdup(&cluster_index,
> +                                             sizeof(cluster_index)), infl);
> +            }
> +            infl->inflight_writes_cnt++;
> +            continue;
> +        }
> +
> +        /* decrease */
> +        assert(infl);
> +        assert(infl->inflight_writes_cnt >= 1);
> +
> +        infl->inflight_writes_cnt--;
> +
> +        if (infl->inflight_writes_cnt == 0) {
> +            g_hash_table_remove(s->inflight_writes_counters, &cluster_index);
> +        }
> +    }
> +}
> +
> +/*
> + * Works both with locked and unlocked s->lock. It just doesn't touch s->lock in
> + * contrast to qcow2_inflight_writes_dec()
> + */
> +void qcow2_inflight_writes_inc(BlockDriverState *bs, int64_t offset,
> +                               int64_t length)
> +{
> +    update_inflight_write_cnt(bs, offset, length, false);
> +}
> +
> +/*
> + * Called with s->lock not locked by caller. Will take s->lock only if need to
> + * actually discard some clusters.

outdated comment. actually we don't take s->lock.

> + */
> +void qcow2_inflight_writes_dec(BlockDriverState *bs, int64_t offset,
> +                               int64_t length)
> +{
> +    update_inflight_write_cnt(bs, offset, length, true);
> +}
> +
>   /* XXX: cache several refcount block clusters ? */
>   /* @addend is the absolute value of the addend; if @decrease is set, @addend
>    * will be subtracted from the current refcount, otherwise it will be added */
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 0db1227ac9..0a5bd4ea4e 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -1833,6 +1833,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
>   #endif
>   
>       qemu_co_queue_init(&s->thread_task_queue);
> +    s->inflight_writes_counters =
> +        g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
>   
>       return ret;
>   
> @@ -2709,6 +2711,9 @@ static void qcow2_close(BlockDriverState *bs)
>       g_free(s->image_backing_file);
>       g_free(s->image_backing_format);
>   
> +    assert(g_hash_table_size(s->inflight_writes_counters) == 0);
> +    g_hash_table_unref(s->inflight_writes_counters);
> +
>       if (has_data_file(bs)) {
>           bdrv_unref_child(bs, s->data_file);
>           s->data_file = NULL;
> 


-- 
Best regards,
Vladimir

