Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D934AA3B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:40:20 +0100 (CET)
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPndL-00074A-HJ
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPnbi-000625-I8; Fri, 26 Mar 2021 10:38:38 -0400
Received: from mail-eopbgr80095.outbound.protection.outlook.com
 ([40.107.8.95]:37361 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPnbe-00013A-CO; Fri, 26 Mar 2021 10:38:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM26IfF2BbCr52PqBiUn9vlWnOdFXYqo27+lIZHQNdfQ+EXwD0evkHas63y4/WirFBgOYfEQW8TXAgYMaoF1RvD8YJQIgaQOO6E825EJCD1mswmBroXdVDeYSpd0GjrOqjVO/avIVqFm0fRyGixzhWibpeBS9lyOxeIV7n48XpuCm2kSDwr75tdD+DoMd4YxIvM6JaJU+sds2RsSD21AkOaq7QQ7+b0tR61bsBZLJFUqGRsWARmFWprmxxdYjh6+Y695FavySLQyNgIO9zc2hjZ4Q2GhPZTdYWu57oIYJVJciHZy17aDV4QYpE56EzlmpF+hBHRnUf5WBBopluhGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX1FyYG9CFDV6nRj/y86F/hHQEVHy7yYsR/xlnre/4o=;
 b=J6SDNb/bCDIe8YUGqmvH3Wj80qAd/7PkPCdAIb8bZAeRjYaD0cLjNS2zVOgHI8CE/o57/LGKC/zfzr9/fDjdseAl+pxCwBTQam+UX1G4tp4CK23kxJJHCFIk3RsjxTsCLkF/N0ZmLPuwprazJ4agNrWrsBx3Mssbh3515CFK0FLk/RMt+n8fxGxSRQQtNz0mMrkfC9lr9bF71Y/OF+6M8RS8Ifj2XDdSO4fjxh2W8LGXxHgXW8qemODmN53EGF5Sp3qUQkpGstXRBefxOmC/Alv0mB2VJd8czK1i49lyVPs23gBuN/w0Ui/QL+5sJPBAk+eBJSZQYFxEdnlzdr0v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX1FyYG9CFDV6nRj/y86F/hHQEVHy7yYsR/xlnre/4o=;
 b=vmNIhCp8yAIz+tZTPr7Ax0WNlzkVCoCmvWGany6mNnAYmKuJxV6903dPLm116U+/a7JCmBL/CvXMDDnU6cf4xM7a2PHZRWFjf5qk/vz2v3DGBIIsblurhHiS6ZD5uJm2IerUt3n+EBigLAzqi+10R7jEO+/TWHAEDf2fAWcA1IM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2452.eurprd08.prod.outlook.com (2603:10a6:203:9f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 14:38:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 14:38:30 +0000
Subject: Re: [PATCH 1/4] qcow2: Improve refcount structure rebuilding
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210310155906.147478-1-mreitz@redhat.com>
 <20210310155906.147478-2-mreitz@redhat.com>
 <969cd321-0cc7-ddc3-8a0d-75819be3a6bf@virtuozzo.com>
 <3eb1748e-012d-9c74-d9dc-c1a6f2644ba6@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <00643e93-6b18-6dc2-0463-291f7399eb7f@virtuozzo.com>
Date: Fri, 26 Mar 2021 17:38:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <3eb1748e-012d-9c74-d9dc-c1a6f2644ba6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM3PR03CA0064.eurprd03.prod.outlook.com
 (2603:10a6:207:5::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM3PR03CA0064.eurprd03.prod.outlook.com (2603:10a6:207:5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Fri, 26 Mar 2021 14:38:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abadcf5b-6ef0-4657-b1a0-08d8f064d31a
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2452:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24520AB0112E0784B4B765E1C1619@AM5PR0802MB2452.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwJMtwLvKngBqomBB0c+itWcLt35js5kiA3SzHytC4mp+iwtofL52DeCIefLkiNLVwuSfcxe0wVeHlEkoHtIg69OdyYXUzZmYjamRf2WafuouHN+g/zSdlne4Y4VCTjdfXpc1PBzJZL4N8G2X36707WTj6EKwSN+eAqHugxGby7B1X871Ap4Cydi/1idxOEgirerEwIUUPK0YLzUfRfANDx+SOP8C7cH5hs/gLlpBNYXcCuBUtUmzLriNayD0fI9fcPP7WyXhZqAc9i38VOvUnW6MCOOUbi/17zAGVcJP4rlACGMRZS3y52nccuXfpIqUZE6eRA6OTXwr40B4O38/J/RzIk4+kR7lws3AmpoYVVjb7vUzPAOma42IPTxrmdky8MquZErCt/S/NXakX9qvlQj0Sl0F8OD5bufIQq+CFkXgWAUlkTwISk6etfb/2Cs2SPucmy9tPfXIwU6KrjXedF8Jl+0u6Ep/hcegkdeqEBbj2y+drIoxgZon6ZpWtdJEg2zXK5TpDZ4wI+bcpCJaFDrIV8Q5pbZBBlT2GEAD0Nv5278hZx8ZP6+skzAGIqCZDbJqdv96f+Zf8L54vnsUClGAM/uXCYzNqliFt/CeD75Q0uIsbGPKbKFKs5+kDJNvycnJzpGsTOu4HB1NdtJrkd/HN9VwABipl9KNKSf4MiECt6suX5XkP4zsfM3O6GgAZCLQZgQA5K3wiS4VoeycpmOEBnzYG0rGlm+2rCjC9kAQ8WWgWXMEv1/f/b1nsWTCpO26NC2fCO+big/f9CbH8+SRSqoWaFgRba9MyZlEv0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39840400004)(316002)(6486002)(26005)(4326008)(16576012)(31696002)(36756003)(8676002)(478600001)(86362001)(31686004)(8936002)(5660300002)(66946007)(66556008)(66476007)(966005)(16526019)(53546011)(2616005)(186003)(52116002)(38100700001)(956004)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0JJMFB5bVlDUEpBYXVwN2ROdnRiOUo3Qit4RDlnNGJKL1IrbDFDQVRuQ28z?=
 =?utf-8?B?WXJKM1l4c08rTXNRbi9ibHFiNFo0ZGJBOTJmRXJGNzNoKzh2S2Q2dDdyVGNk?=
 =?utf-8?B?azA3eU1oZDV6anpFb0QzU21GY3l1WTA3azJDS0JUODJZVHhYbUdEbUpjQW53?=
 =?utf-8?B?clhuK1A2V0tZVmoxcDEwMTl3QlZweWJYUU4zL05iNjVxT1NhTTRiZ3krbFEx?=
 =?utf-8?B?V2RhdTRZMHlNTEVKMmFwdUZwRmZmcnB5djlxbUNjVDVVbUcrMEtzNFRUZkxu?=
 =?utf-8?B?cTQ5bWx5SVliRGRuZE1jS25DSks2cGFVOU0wcFB0WHJHQUd1bVQ0NVdwTldo?=
 =?utf-8?B?b2FZZ3JXcjdXaVI3bjliMEdjRVUweTY1M2tzK0tuWnZkMzVjMlR1QnBVRGd1?=
 =?utf-8?B?aG1mWHQ3TlZhd01LMS92SWRGbitVRHBTTlZnV1orYkJVQnhlTCtaQnlLSkxt?=
 =?utf-8?B?ZnQ4cndZM0ovNjR3eDJ1aFpXcVNBRVBwSURUaVNqNGNPdG9iMzFGS0NpZHla?=
 =?utf-8?B?bUUySXVadXJZeFVQc0pESlN4MUN3YTh6aVFyQkl6WnBscDZEMFBHcnFkSVN4?=
 =?utf-8?B?YmdwWGluTGVvdGV5U2hHQWpwSUNUbGtwb3I5eG5nVTRMZ3VhelhkL2J4WTZE?=
 =?utf-8?B?cElwaFZFUVBjTG1SWmdtdmwyc254clIzQ2xXeVM1ZDNtSjJsV0lDVmpLN3ZG?=
 =?utf-8?B?alN4TlZlVzZBOTdZdXAyQi9KOFUxcFI0WHYxTTBka0FWMDlkVGYvenowV3Vi?=
 =?utf-8?B?WmUvVUIxOWZNalJjU2xiVDR3TWpQczNLN2thQjR0cm5kdDFwbFpKaXIwaU4y?=
 =?utf-8?B?RFh2UkVBanMxd3dXMGZPUHZyL1VoRXhzRlp4YW11U2paKzJMUHRSeTBYbnky?=
 =?utf-8?B?dkpoWDM3d0l5Y3F5aFZUd0RXSXFSbzVqeTlnZmlEYWNFdzhCYkx4SXNXYitZ?=
 =?utf-8?B?T3dGVnR6VlZKYnJPY1dQNGFCY3FrVWVXcVhjbkRHbVBXTjdaWlI0aTRoSlZy?=
 =?utf-8?B?TUt4YndFdGlYQTZLaHdJUXltSDJPd3F0VEtwNFlwYVZNSVUzbWlMM21PL1BV?=
 =?utf-8?B?aU1UK1dhb1FjYjV0bjBUV1JWWTB5WEhKRTZHdFVNdXlrWStSYk5zS1lldDQ2?=
 =?utf-8?B?a1VuNGJDYUFGRnVkeTVuejVlYTR1SmNuL3pTU3F0U3d6eTdRTGhBRXBsV3RT?=
 =?utf-8?B?ZFMxQis2UTgxQndGVnNRVTNnMVRKaG1jbU44dnRsK3Fhci84L0FzMmlaSHJh?=
 =?utf-8?B?bFRkcHg0a05WSHl2S0h0blBab3pDVm5GZ083QkFhUnNQOE0ybHdxRmltMzRR?=
 =?utf-8?B?QjFwYllMRGJWd3FGVjR6YmUyQ2k3V2NzeXVIay9CZFhmNkZtT2hrODN4eXJ6?=
 =?utf-8?B?Q2lYYXlvTDhsMnM2NjVkU044UTNqUEFvWHdCZFY1bGhqM1Bjc09nNFVGQUhw?=
 =?utf-8?B?LzUzNXprbFQ1KzJKNUdZelRUL3NiQ1B4SGZWWkx4RlhYQUJVWW5qNlZqUWFY?=
 =?utf-8?B?YlRGUGlmbElnWUx6dmtTVk53bmFKbzAzSnRXRHA5Z0FWdVB4dzJvTmtIbE9P?=
 =?utf-8?B?MnZ2MWZYcUJ4M2x3c3dFSXRmNXRpRTNTOXlzUlRFb1owSUx3QlpBSitvWXZR?=
 =?utf-8?B?RE45LzRWcitJeHN0NVNrZVRlb3VGZUJmczcxM0VIN0xENU5maUxPQzJFVmxE?=
 =?utf-8?B?ZnNRajNBaTRObVZiZTVFeENjbEprVDlWL2szdEdnNndQK3I2azhwT1pFak9W?=
 =?utf-8?Q?CNfyr6p/7TYvXGBqfP3P+gds/UwW4gsNOSs7Rsv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abadcf5b-6ef0-4657-b1a0-08d8f064d31a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 14:38:30.4711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2DL9kq6MK7sJdzerxiW9I8pLrftvPCqONJiD8LFUsYX7oVXV7BEI5dxIs+eeS67xRCLACUaXwXSeD1M/LQebBklrXXIHkQP37WVLdZaatU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2452
Received-SPF: pass client-ip=40.107.8.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

26.03.2021 16:47, Max Reitz wrote:
> On 26.03.21 12:48, Vladimir Sementsov-Ogievskiy wrote:
>> 10.03.2021 18:59, Max Reitz wrote:
>>> When rebuilding the refcount structures (when qemu-img check -r found
>>> errors with refcount = 0, but reference count > 0), the new refcount
>>> table defaults to being put at the image file end[1].  There is no good
>>> reason for that except that it means we will not have to rewrite any
>>> refblocks we already wrote to disk.
>>>
>>> Changing the code to rewrite those refblocks is not too difficult,
>>> though, so let us do that.  That is beneficial for images on block
>>> devices, where we cannot really write beyond the end of the image file.
>>>
>>> [1] Unless there is something allocated in the area pointed to by the
>>>      last refblock, so we have to write that refblock.  In that case, we
>>>      try to put the reftable in there.
>>>
>>> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1519071
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   block/qcow2-refcount.c | 126 ++++++++++++++++++++++-------------------
>>>   1 file changed, 67 insertions(+), 59 deletions(-)
>>>
>>> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
>>> index 8e649b008e..162caeeb8e 100644
>>> --- a/block/qcow2-refcount.c
>>> +++ b/block/qcow2-refcount.c
>>> @@ -2352,8 +2352,9 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
>>>                                         int64_t *nb_clusters)
>>>   {
>>>       BDRVQcow2State *s = bs->opaque;
>>> -    int64_t first_free_cluster = 0, reftable_offset = -1, cluster = 0;
>>> +    int64_t first_free_cluster = 0, reftable_offset = -1, cluster;
>>>       int64_t refblock_offset, refblock_start, refblock_index;
>>> +    int64_t first_cluster, end_cluster;
>>>       uint32_t reftable_size = 0;
>>>       uint64_t *on_disk_reftable = NULL;
>>>       void *on_disk_refblock;
>>> @@ -2365,8 +2366,11 @@ static int rebuild_refcount_structure(BlockDriverState *bs,
>>>       qcow2_cache_empty(bs, s->refcount_block_cache);
>>> +    first_cluster = 0;
>>> +    end_cluster = *nb_clusters;
>>> +
>>>   write_refblocks:
>>> -    for (; cluster < *nb_clusters; cluster++) {
>>> +    for (cluster = first_cluster; cluster < end_cluster; cluster++) {
>>>           if (!s->get_refcount(*refcount_table, cluster)) {
>>>               continue;
>>>           }
>>> @@ -2374,65 +2378,68 @@ write_refblocks:
>>>           refblock_index = cluster >> s->refcount_block_bits;
>>>           refblock_start = refblock_index << s->refcount_block_bits;
>>> -        /* Don't allocate a cluster in a refblock already written to disk */
>>> -        if (first_free_cluster < refblock_start) {
>>> -            first_free_cluster = refblock_start;
>>> -        }
>>> -        refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
>>> -                                              nb_clusters, &first_free_cluster);
>>> -        if (refblock_offset < 0) {
>>> -            fprintf(stderr, "ERROR allocating refblock: %s\n",
>>> -                    strerror(-refblock_offset));
>>> -            res->check_errors++;
>>> -            ret = refblock_offset;
>>> -            goto fail;
>>> -        }
>>> -
>>> -        if (reftable_size <= refblock_index) {
>>> -            uint32_t old_reftable_size = reftable_size;
>>> -            uint64_t *new_on_disk_reftable;
>>> +        if (reftable_size > refblock_index &&
>>> +            on_disk_reftable[refblock_index])
>>> +        {
>>> +            refblock_offset = on_disk_reftable[refblock_index];
>>
>> In this branch, we assign it to ..
>>
>>> +        } else {
>>> +            int64_t refblock_cluster_index;
>>> -            reftable_size = ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
>>> -                                     s->cluster_size) / REFTABLE_ENTRY_SIZE;
>>> -            new_on_disk_reftable = g_try_realloc(on_disk_reftable,
>>> -                                                 reftable_size *
>>> -                                                 REFTABLE_ENTRY_SIZE);
>>> -            if (!new_on_disk_reftable) {
>>> +            /* Don't allocate a cluster in a refblock already written to disk */
>>> +            if (first_free_cluster < refblock_start) {
>>> +                first_free_cluster = refblock_start;
>>> +            }
>>> +            refblock_offset = alloc_clusters_imrt(bs, 1, refcount_table,
>>> +                                                  nb_clusters,
>>> +                                                  &first_free_cluster);
>>> +            if (refblock_offset < 0) {
>>> +                fprintf(stderr, "ERROR allocating refblock: %s\n",
>>> +                        strerror(-refblock_offset));
>>>                   res->check_errors++;
>>> -                ret = -ENOMEM;
>>> +                ret = refblock_offset;
>>>                   goto fail;
>>>               }
>>> -            on_disk_reftable = new_on_disk_reftable;
>>> -            memset(on_disk_reftable + old_reftable_size, 0,
>>> -                   (reftable_size - old_reftable_size) * REFTABLE_ENTRY_SIZE);
>>> +            refblock_cluster_index = refblock_offset / s->cluster_size;
>>> +            if (refblock_cluster_index >= end_cluster) {
>>> +                /*
>>> +                 * We must write the refblock that holds this refblock's
>>> +                 * refcount
>>> +                 */
>>> +                end_cluster = refblock_cluster_index + 1;
>>> +            }
>>> -            /* The offset we have for the reftable is now no longer valid;
>>> -             * this will leak that range, but we can easily fix that by running
>>> -             * a leak-fixing check after this rebuild operation */
>>> -            reftable_offset = -1;
>>> -        } else {
>>> -            assert(on_disk_reftable);
>>> -        }
>>> -        on_disk_reftable[refblock_index] = refblock_offset;
>>> +            if (reftable_size <= refblock_index) {
>>> +                uint32_t old_reftable_size = reftable_size;
>>> +                uint64_t *new_on_disk_reftable;
>>> +
>>> +                reftable_size =
>>> +                    ROUND_UP((refblock_index + 1) * REFTABLE_ENTRY_SIZE,
>>> +                             s->cluster_size) / REFTABLE_ENTRY_SIZE;
>>> +                new_on_disk_reftable =
>>> +                    g_try_realloc(on_disk_reftable,
>>> +                                  reftable_size * REFTABLE_ENTRY_SIZE);
>>> +                if (!new_on_disk_reftable) {
>>> +                    res->check_errors++;
>>> +                    ret = -ENOMEM;
>>> +                    goto fail;
>>> +                }
>>> +                on_disk_reftable = new_on_disk_reftable;
>>> -        /* If this is apparently the last refblock (for now), try to squeeze the
>>> -         * reftable in */
>>> -        if (refblock_index == (*nb_clusters - 1) >> s->refcount_block_bits &&
>>> -            reftable_offset < 0)
>>> -        {
>>> -            uint64_t reftable_clusters = size_to_clusters(s, reftable_size *
>>> - REFTABLE_ENTRY_SIZE);
>>> -            reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
>>> -                                                  refcount_table, nb_clusters,
>>> -                                                  &first_free_cluster);
>>> -            if (reftable_offset < 0) {
>>> -                fprintf(stderr, "ERROR allocating reftable: %s\n",
>>> -                        strerror(-reftable_offset));
>>> -                res->check_errors++;
>>> -                ret = reftable_offset;
>>> -                goto fail;
>>> +                memset(on_disk_reftable + old_reftable_size, 0,
>>> +                       (reftable_size - old_reftable_size) *
>>> +                       REFTABLE_ENTRY_SIZE);
>>> +
>>> +                /*
>>> +                 * The offset we have for the reftable is now no longer valid;
>>> +                 * this will leak that range, but we can easily fix that by
>>> +                 * running a leak-fixing check after this rebuild operation
>>> +                 */
>>> +                reftable_offset = -1;
>>> +            } else {
>>> +                assert(on_disk_reftable);
>>>               }
>>> +            on_disk_reftable[refblock_index] = refblock_offset;
>>
>> only to write back again ?
> 
> This assignment is on a deeper level, though, isn it?  I.e. it’s inside the else branch from above.

Ahm right.

I looked at it in vimdiff, and modifed pre-patch alignment so that it looks good.. but something went wrong.

> 
>>>           }
>>>           ret = qcow2_pre_write_overlap_check(bs, 0, refblock_offset,
>>> @@ -2459,15 +2466,12 @@ write_refblocks:
>>>       }
>>>       if (reftable_offset < 0) {
>>
>> at this point reftable_offset is always -1 now..
>>
>> Ah not. and now I am a bit close to understanding all of this logic. this thing with "goto write_refblocks" is not obvious
>>
>>> -        uint64_t post_refblock_start, reftable_clusters;
>>> +        uint64_t reftable_clusters;
>>> -        post_refblock_start = ROUND_UP(*nb_clusters, s->refcount_block_size);
>>>           reftable_clusters =
>>>               size_to_clusters(s, reftable_size * REFTABLE_ENTRY_SIZE);
>>> -        /* Not pretty but simple */
>>> -        if (first_free_cluster < post_refblock_start) {
>>> -            first_free_cluster = post_refblock_start;
>>> -        }
>>> +
>>> +        first_free_cluster = 0;
>>>           reftable_offset = alloc_clusters_imrt(bs, reftable_clusters,
>>>                                                 refcount_table, nb_clusters,
>>>                                                 &first_free_cluster);
>>> @@ -2479,6 +2483,10 @@ write_refblocks:
>>>               goto fail;
>>>           }
>>> +        assert(offset_into_cluster(s, reftable_offset) == 0);
>>> +        first_cluster = reftable_offset / s->cluster_size;
>>> +        end_cluster = first_cluster + reftable_clusters;
>>> +
>>>           goto write_refblocks;
>>
>> these three lines now looks like a function call in assembler :)
>>
>>>       }
>>>
>>
>> You didn't ping the series (more than two week old) so, I'm not sure that you are not preparing v2 now.. But I kept it "marked unred" all this time, and several times tried to look at it, and postponed, because I don't familiar with this place of qcow2 driver. And the function looks too difficult. Now finally I think I understand most of the logic that you change. Honestly, I think a bit of refactoring the rebuild_refcount_structure() prior to logic change would make it a lot easier to review..
> 
> Hm, yes, putting the for () loop into its own function would probably be a good starting put.  I’ll look into it.
> 

Thanks!


-- 
Best regards,
Vladimir

