Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B3D415D34
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 13:57:52 +0200 (CEST)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTNMN-0007NI-Fk
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 07:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTNJK-0005CW-Dl; Thu, 23 Sep 2021 07:54:42 -0400
Received: from mail-am6eur05on2097.outbound.protection.outlook.com
 ([40.107.22.97]:11232 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mTNJF-0001et-Eh; Thu, 23 Sep 2021 07:54:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoD/Yp6laR4VGPKHvXlj0WCB8tvnsJEnRE1skQ7fWXDB3ap+cLtvO+L6PKVGeMtZ71Ey49dESriVvccU+kaT+MXdezwhEWI5Yp5q33IOF8hwlNeYajqOnyYxMu5KdpMTS4GsHL+6o0FQiNUZt1u8bBGPXVTKHysngEeRxqddo8NuwGzLgqtwgWhrvTVZJbKJc7PIO4uI+fzwl3e3k+g6gxVK4jAeCw49/FwcgwZ50CDvy4NpMepYoIaVnKEpBiNo8zoPcnpiUam/iHjSUM8FPXxrk++QGis+NGp338XdbNt7CC5Z+wGRxVAf7qFCH0f5v00XPT3pMqZklNpbl0qR9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=85JvHi0gLtdaGKDLxLubDFSsRYdsAUoutAaZuynQPwM=;
 b=e2DwFfE9IYkczWwKmR2R1zXz+NJrHnJRcgn0E0/FeKYK0bXqq/dO9ab5fHPiQqQZxDwr+qa8BpVlNe41K47BirL9WY/XidOgbQM/gjuh7eybjX3fvk5oK//drw/3ZQXww/s2ZWFRrxtGcl8jdNzjyfdp/JmV6yKfG7LURx/APDxG8xWQw7X/9SLNil9qD19dahqmVTRauqZBf0pGoMPg3hgeYz6/PSWdZOyoeJDtBr2ZPsSjc6P4dGhTORuyTv9RrnnTGaThKF3FF33vf3zBwUCX46uuAToCqjn7K/avdL7M9MCGnUxyRDCosvUxZuSyjMm+n9IYYlHhjYDxnBWVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=85JvHi0gLtdaGKDLxLubDFSsRYdsAUoutAaZuynQPwM=;
 b=EplQWPW+mEnfTA46TLb9ZinUsW9Wae8WeWv+GQA2XJardhHonDgY1f8TFPxuF0yN904KqEvJjJCKw+L/4WC32tj2F2CJ666DiYw+RnrcQZjXtgnrVKWOPj1LoKVI/3mznyeA2xQ+4TWtsnzOWSTasVLX7kRNe2vTGIkP6fidboc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 11:54:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 11:54:32 +0000
Subject: Re: [PATCH 8/8] qapi: add blockdev-replace command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, ehabkost@redhat.com,
 berrange@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-9-vsementsov@virtuozzo.com>
 <87ilyv4ugk.fsf@dusky.pond.sub.org>
 <08aab083-a8c3-a026-70cb-ac65d378515b@virtuozzo.com>
 <87lf3nfvrq.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f667d9f5-79d5-84f5-7b06-6098ebe13aa6@virtuozzo.com>
Date: Thu, 23 Sep 2021 14:54:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87lf3nfvrq.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
Received: from [192.168.100.5] (185.215.60.205) by
 FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Thu, 23 Sep 2021 11:54:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2e61f4b-abe6-484a-2374-08d97e88e80d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB47243C509F285A652AB878A7C1A39@AM6PR08MB4724.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sz8yc2l2b5ODNA9j67EntAddZM0jRRHexEHnKTneRtfqacR+C0oQUrEsJ+716ORV/zqmr/6vnGHDVgC6/BY41/NU0r/qml6CmPkVoM/TFovrvIF0wdXrvR36Cb9CuLdGud/cYFjAoF/0hHo7h3+GkWcrdc3msXtEpLtxnRacYuKvB/M7XFjYAdc9J0mUu5nATNJKuqxCMUH3DTcORhf6+rIyYivT2euOiymDL1mD22ApiUDiZlTzqforg3SWw4lVNrt2LqYPLJ69Hq+iKPpfQGlEK8/EWbTuuzJP+akNOITfZJOTRzX2YNGwLrlwnLaHhPI4cYxKeO0OotC0Xf0l4c+7a5YuCLkwaXQJsbCgHRUKJl3ur7Q6bV5XCCUmRmbK0rXYaAfCL2EIdwyrjkQ7bETTmc01+I1EwQfMeYgcgDs2a7G4JhiWnGQhbDuq8jP8CzluS5lsFESIQgYFNhHsq2MG9iUP7wqH//s0OHThQ6qoMhnT6j2rwy1jwAntXhDuaz+9NMkgRLrAn26zTN9lF6iEHzsAoAH9UM6Od8xolwEoyqipK9n7a6TTNVDkwI4O/bQShESMuHln86e0Ax7A4KeOlTVepmag6vibzIFihvFee4W9HsVs4G1XF+Gp+maT74T2GM7q7US82KmwNsMi68AWWvzooq2PdDfC3Puolgc7rYdNFJALxV5E8sM1VOBuQiypbBiJrLr9dIH0DO9xWx8sHwDkXpyucnDO34MRuyYStji/TqcAypK0Fe3cHXYTgiaVaHtL25jbZgHOHk1Dlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(4326008)(66946007)(66476007)(186003)(2616005)(956004)(8936002)(38100700002)(16576012)(31696002)(52116002)(66556008)(8676002)(36756003)(38350700002)(26005)(2906002)(31686004)(30864003)(508600001)(83380400001)(5660300002)(86362001)(316002)(6486002)(7416002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FDTmlHbmNnT01kVmtlRFBoNVJuSSsvSFdMTnBRYUN3Q3hEcU9LZjR5NnNi?=
 =?utf-8?B?TXdjNk8wVFJYS0cvNDhOS012RHVqZGNSSkcvb255VEJJaU5VQnRta0NiQTlt?=
 =?utf-8?B?aG5jSTBvc21hUFNCMDNRdFJBeWhaM01VZHRkNHBpN2JuYkpxYTFrTVhxOEtp?=
 =?utf-8?B?TTM2N2VBSFpPNXBqWVhCRndSaTFjUysvOC93RTNIWnNybXMvMHVvdGF4bENn?=
 =?utf-8?B?Q1VhOS9vRTllRVIvWWNyMWNKeXVNTUVOa2tId1haWmNna21kVU5GTldOLy9G?=
 =?utf-8?B?Nkk0Sk1xOCt1Rm1wWjh0SnRBU0tWME9xajlvTHlnSFkyNStKSklJYzAxUTBz?=
 =?utf-8?B?MTRIby9NdG83SW9saTF4alBPM1JLVzhjTkdFVVdBdUhVM2tnS2VjWkZ0U2Zh?=
 =?utf-8?B?WVhZdm9ONHhHVExQMGFRcFFnbGgyakY5NWhsOWJQTE14NElKWXNDOUUvRkhD?=
 =?utf-8?B?Q2Q1Q3g1U215bWJEM0R4ditCRzR5cGRWTkVJUkV3UHgySmVPOGFOdm83NHdS?=
 =?utf-8?B?bXJ6d0E0d2dYanhhRWFaSlZDK1ljRXdwSEVvd2orazlRMEdpKzJUaHZLZzFp?=
 =?utf-8?B?UTExOFV6c3hEYlFUSmhBT0pKMi9HTHhYL3ZCd1I3WkZod0ZUa2VGOE9BYmho?=
 =?utf-8?B?dUVJYzRVckFlQU5vdE5rUWxNbXE0dHlRUjU1QlU4bVJQbkxvZ0gyYW5wc1NG?=
 =?utf-8?B?d0tkTkRIem9vWEcyakJ3bnZRWnJTRnBNUkMvc2JoQVFHVGwzQkoyNWV4dFk5?=
 =?utf-8?B?OE9PSUwwc3VZUU8rLzRDS1Y1SEVyVEdRa1kyV3V2RmpPdUhXRWhKMmdEMlZK?=
 =?utf-8?B?c1llVDZYR21KMFVmQTNYczdYSUFpVG9RRnpSQlZDTXEwTkVVWVBzZFY1eHF6?=
 =?utf-8?B?NFBpSmJIbUMveEY0YWc3SStXUXl0cTQvZm1rejgrUlVnL1pvNXBiNENvSjJv?=
 =?utf-8?B?aHkzNnE5SVJrMTdRZk5FMGtob01pSnp3SE9VMlZHYlgyS1pMczk4ZDR3dXhM?=
 =?utf-8?B?bTd4c3FOelFqWUZENFBqLzNDUWVSdWdYK0hDSTI4M2UzZjFjUEdGWkcwUTFk?=
 =?utf-8?B?Q1dRSFV4QnI4WjhHV1d2ZmhIcGNzN0M3K1lOSVJjdklPQUt3emREWXdXbFI5?=
 =?utf-8?B?TG1QNlFPVS9qZWhwdXQxSUkxT2x1a1grbWZPTndrajNRaU1KcE0zQ29reG1P?=
 =?utf-8?B?b0k4bzhxem44TUQ3RGQrMmJNYjNlUFdBdXd5WjgzbDJNamJ4VEVCMUlCM3Q1?=
 =?utf-8?B?TFFXaXkxVHBSUHMxMkhobW5LRWFMejdnTk53bXQwTHFvWjc1c0drQ01kcVhO?=
 =?utf-8?B?VzdSeGgrWk5leDVVOUVhdVI1VFVkb3Z4blpwRnVIOTN5L1ljaGNrQjBTU2Fm?=
 =?utf-8?B?dmlGV0VMWDVVU3NPcnhuTy8rTmx3cVFWQ1RDSzVTUS9lZlRSN09IbjhJeDlC?=
 =?utf-8?B?aXE5cmRoU2dFSkZyQ2kxZWMzWHVUNFZxcFl5TTRxTUtYV3lZRm1NdUdPZkxF?=
 =?utf-8?B?Ny90MGN4amRrVDNFUWlieGhKNU93ZXBLVDRvdUsySXQxSjBWN3JLYU5NaDJ1?=
 =?utf-8?B?WjR4Vmdtc2VEdjkwVmp0Z3U0Z3YzeHVDaCtRaGkwdG1KTy9uLzEvRVJPTTRx?=
 =?utf-8?B?REtjRzhZOGNSc3UzRVBxY1AxbDZPanNSdlhmY0R6UEVTMVJjaHdCbUhTeGZH?=
 =?utf-8?B?NHNvU0FKRDM1ZlNCdGhIMWQ5TG05VkFrNmlVOFJQY1VsM1g4K1luYk1mYmJa?=
 =?utf-8?Q?EcP4wPLgFBNd4LzxQ7oBnDVnLg2Q35uMszNyYvH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e61f4b-abe6-484a-2374-08d97e88e80d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:54:32.5663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfFKRuWDIQ3dIHGlsiNQv+K5hvN8ETWODo5Ok8PG4UbQHRHaqEM2oOdkP16aoywsJlEe23TM99OZMdCetSeCyOu/zF4b24D3J9n30ZIvbeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Received-SPF: pass client-ip=40.107.22.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

23.09.2021 13:09, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Thanks a lot for reviewing!
>>
>> 20.09.2021 09:44, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>>> Add command that can add and remove filters.
>>>>
>>>> Key points of functionality:
>>>>
>>>> What the command does is simply replace some BdrvChild.bs by some other
>>>> nodes. The tricky thing is selecting there BdrvChild objects.
>>>> To be able to select any kind of BdrvChild we use a generic parent_id,
>>>> which may be a node-name, or qdev id or block export id. In future we
>>>> may support block jobs.
>>>>
>>>> Any kind of ambiguity leads to error. If we have both device named
>>>> device0 and block export named device0 and they both point to same BDS,
>>>> user can't replace root child of one of these parents. So, to be able
>>>> to do replacements, user should avoid duplicating names in different
>>>> parent namespaces.
>>>>
>>>> So, command allows to replace any single child in the graph.
>>>>
>>>> On the other hand we want to realize a kind of bdrv_replace_node(),
>>>> which works well when we want to replace all parents of some node. For
>>>> this kind of task @parents-mode argument implemented.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>>> ---
>>>>    qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
>>>>    block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 160 insertions(+)
>>>>
>>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>>> index 675d8265eb..8059b96341 100644
>>>> --- a/qapi/block-core.json
>>>> +++ b/qapi/block-core.json
>>>> @@ -5433,3 +5433,81 @@
>>>>    { 'command': 'blockdev-snapshot-delete-internal-sync',
>>>>      'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
>>>>      'returns': 'SnapshotInfo' }
>>>> +
>>>> +##
>>>> +# @BlockdevReplaceParentsMode:
>>>> +#
>>>> +# Alternative (to directly set @parent) way to chose parents in
>>>> +# @blockdev-replace
>>>> +#
>>>> +# @exactly-one: Exactly one parent should match a condition, otherwise
>>>> +#               @blockdev-replace fails.
>>>> +#
>>>> +# @all: All matching parents are taken into account. If replacing lead
>>>> +#       to loops in block graph, @blockdev-replace fails.
>>>> +#
>>>> +# @auto: Same as @all, but automatically skip replacing parents if it
>>>> +#        leads to loops in block graph.
>>>> +#
>>>> +# Since: 6.2
>>>> +##
>>>> +{ 'enum': 'BlockdevReplaceParentsMode',
>>>> +  'data': ['exactly-one', 'all', 'auto'] }
>>>> +
>>>> +##
>>>> +# @BlockdevReplace:
>>>> +#
>>>> +# Declaration of one replacement.
>>>
>>> Replacement of what?  A node in the block graph?
>>
>> A specific child node in one or in several edges
> 
> Spell that out in the doc comment, please.
> 
>>>
>>>> +#
>>>> +# @parent: id of parent. It may be qdev or block export or simple
>>>> +#          node-name.
>>>
>>> It may also be a QOM path, because find_device_state() interprets
>>> arguments starting with '/' as QOM paths.
>>>
>>> When is a node name "simple"?
>>>
>>> Suggest: It may be a qdev ID, a QOM path, a block export ID, or a node
>>> name.
>>
>> OK
>>
>>>
>>> The trouble is of course that we're merging three separate name spaces.
>>
>> Yes. Alternatively we can also add an enum of node-type [bds, device, export[, job]], and select graph nodes more explicit (by pair of id/path/name and type)
>>
>> But if we have to use these things in one context, it seems good to enforce users use different names for them. And in this way, we can avoid strict typing.
> 
> Is there precedence in QMP for merging ID name spaces, or for selecting
> a name space?

Hmm, I didn't see neither of it.

> 
>>> Aside: a single name space for IDs would be so much saner, but we
>>> screwed that up long ago.
> 
> Throwing some of the multiple name spaces together some of the time
> feels like another mistake.
> 
>>>
>>>>                          If id is ambiguous (for example node-name of
>>>> +#          some BDS equals to block export name), blockdev-replace
>>>> +#          fails.
>>>
>>> Is there a way out of this situation, or are is replacement simply
>>> impossible then?
>>
>> In my idea, it's simply impossible. If someone want to use this new interface, he should care to use different names for different things.
> 
> Reminds me of device_del, which simply could not delete a device without
> an ID.  Made many users go "oh" (or possibly a more colorful version
> thereof), until daniel fixed it in commit 6287d827d4 "monitor: allow
> device_del to accept QOM paths" for v2.5.
> 
>>>
>>>>                      If not specified, blockdev-replace goes through
>>>> +#          @parents-mode scenario, see below. Note, that @parent and
>>>> +#          @parents-mode can't be specified simultaneously.
>>>
>>> What if neither is specified?  Hmm, @parents-mode has a default, so
>>> that's what we get.
>>>
>>>> +#          If @parent is specified, only one edge is selected. If
>>>> +#          several edges match the condition, blockdev-replace fails.
>>>> +#
>>>> +# @edge: name of the child. If omitted, any child name matches.
>>>> +#
>>>> +# @child: node-name of the child. If omitted, any child matches.
>>>> +#         Must be present if @parent is not specified.
>>>
>>> Is @child useful when @parent is present?
>>
>> You may specify @child and @parent, to replace child in specific edge. Or @parent and @edge. Or all three fields: just to be strict.
>>
>>>
>>> What's the difference between "name of the child" and "node name of the
>>> child"?
>>
>> Although we have to deal with different kinds of nodes (BDS, exports, blks, ...),
>> children are always BDS.
>>
>> But, may be in the context, it's better say "id of the child".
> 
> I'm confused about the difference between "@edge: name of the child",
> and "@child: node-name of the child".
> 
>>>
>>>> +#
>>>> +# @parents-mode: declares how to select edge (or edges) when @parent
>>>> +#                is omitted. Default is 'one'.
>>>
>>> 'exactly-one'
>>>
>>> Minor combinatorial explosion.  There are four optional arguments, one
>>> of them an enum, and only some combination of argument presence and enum
>>> value are valid.  For a serious review, I'd have to make a table of
>>> combinations, then think through every valid row.
>>>
>>> Have you considered making this type a union?  Can turn some of your
>>> semantic constraints into syntactical ones.  Say you turn
>>> BlockdevReplaceParentsMode into a tag enum by adding value 'by-id'.
>>> Then branch 'by-id' has member @parent, and the others don't.
>>
>>
>> OK. Now, after some time passed, I see that some additional clarifications are needed. Even for me :)
> 
> Sounds familiar :)
> 
>> So, the actual modes I have in mind:
>>
>> 1. Replacement for backup: we want to inject copy-before-write filter F above some node X, so that all parents of node X start to access X through filter F. But we want automatically skip parents if modifications leads to loops in the graph (so, we can first carete node F with X as a child, than do replacement, and don't replace child of F by F :).
>>
>> That's  parents-mode=auto & parent=None & edge=None & child=X
>>
>> 2. Replacement of any specific edge in the graph.
>>
>> Edge may be specified in different ways: by parent, by child, by edge, and by some combinations of these things. It seems reasonable to allow any combination, if it specifies exactly one field.. Assume we have A -- backing --> B relation in the graph, and want to replace B by filter F in that relation.
> 
> An edge always goes from a source node (a.k.a. parent) to a target node
> (a.k.a. child).
> 
> Each edge from a source node has a unique name in the source node, such
> as "backing".
> 
> Correct?

I'm not sure.. Of course node can't have several backing children.. Quorum cares to name children differently.

But for example, block-stream job may have several children named simply "intermediate node".

But block-jobs children is so internal feature, that I'm not sure we can allow user simply replace them. That's why this series doesn't allow select jobs as parents.

> 
> The obvious way to identify an edge is (source node name, edge name).
> 
> Throwing in the target name is redundant.  Observation, not criticism.
> 
> All other ways can be ambigous:
> 
>      (source node name, target node name), because multiple edges can
>      connect the two.

Still, I have never seen such a use case)

> 
>      (edge name, target node name), because multiple source nodes can use
>      the same edge name to connect to the target node.
> 
>      ...
> 
> Even ways that can be ambigous need not be in a specific graph:
> 
>      Just source node name suffices when there is only one edge leaving
>      it.
> 
>      Even just edge name can theoretically suffice.
> 
>      ...
> 
> Do we really *need* this much flexibility?  Why can't we simply require
> (source node name, edge name), and call it a day?

I don't know) That just what come into my mind. It's simple enough to restrict the flexibility for now and add it in future if needed.

> 
>> 2.1 Specify parent:
>>
>> We may specify all information bits, to be sure that we do what we want and for high probability to fail if we have wrong impression about what's going on in the graph:
>>
>> parents-mode=None & parent=A & edge=backing & child=B
>>
>> We can omit edge:
>>
>> parents-mode=None & parent=A & edge=None & child=B
>>
>>    - that should fail as ambiguous if B is "double child" of A, with two edges from A to B. But I think, that's unused combination for now)
>>
>> Or we can omit child
>>
>> parents-mode=None & parent=A & edge=backing & child=None
>>
>>    - that should work well, as node shouldn't have more than one backing child.
>>
>> and we can omit both edge and child:
>>
>> parents-mode=None & parent=A & edge=None & child=None
>>
>>    - that will work only if A has exactly one child and fails otherwise. So, that's bad for format nodes but good for filters and for block devices.
>>
>> 2.2 Don't specify parent but specify child:
>>
>> parents-mode=exactly-one & parent=None & edge=backing & child=B
>>
>>    - works if B has only one parent with B as backing child
>>
>> parents-mode=exactly-one & parent=None & edge=None & child=B
>>
>>    - works if B has only one parent
>>
>> ======================
>>
>> Now, what's more?
>>
>> parents-mode=auto & parent=None & edge=root & child=X
>>
>> - replace only child only for root parents of X  -  may make sense
>>
>>
>> And all other combinations are
>>
>> parents-mode=ANY & parent=None & edge=ANY & child=None
>>
>>    - don't specify neither parent nor child. That works bad with any mode.. Theoretically, we still can support it by looking through the whole graph. If edge=backing and we only only one backing edge in the whole graph we can serve the request.. But we can simply fail and not care.
>>
>> =====================
>>
>> What's bad, is that 2.1 and 2.2 are not symmetrical. So, right, it seems better to turn it into union:
>>
>> 1. mode = auto
>>
>> Replace child in all it's parents where edge match to @edge and avoiding creating loops in the graph
>>
>> child: required, specify child
>> edge: optional, if specified, do replacement only in such edges
> 
> This is almost the same as a transaction of one-edge replacements for
> all parents, optionally filtered by @edge.
> 
> They differ when the parents can change spontaneously.  The transaction
> then might be for a stale set of parents.  Can this happen?
> 
> The other difference is of course that having to enumerate the edges
> could be bothersome.  Some amount of bother is okay.  QMP provides basic
> building blocks.  When we try to provide more, we tend to fail.
> 
>> 2. mode = one-edge
>>
>> Replace child in exactly one edge. If more than one edge matches - re[ace nothing and fail.
>>
>> parent: optional
>> edge: optional
>> child: optional
>>
>>    - all fields optional, but user is responsible to not be ambiguous. Still, we can enforce that at least one of @parent and @child should be specified.
> 
> Do we really need this much flexibility in edge selection?
> 
>>
>>>
>>>> +#
>>>> +# Since: 6.2
>>>> +#
>>>> +# Examples:
>>>> +#
>>>> +# 1. Change root node of some device.
>>>> +#
>>>> +# Note, that @edge name is omitted, as
>>>
>>> Scratch "name".
>>>
>>> Odd line break.
>>>
>>>> +# devices always has only one child. As well, no need in specifying
>>>> +# old @child.
>>>
>>> "the old @child".
>>>
>>>> +#
>>>> +# -> { "parent": "device0", "new-child": "some-node-name" }
>>>> +#
>>>> +# 2. Insert copy-before-write filter.
>>>> +#
>>>> +# Assume, after blockdev-add we have block-node 'source', with several
>>>> +# writing parents and one copy-before-write 'filter' parent. And we want
>>>> +# to actually insert the filter. We do:
>>>> +#
>>>> +# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
>>>> +#
>>>> +# All parents of source would be switched to 'filter' node, except for
>>>> +# 'filter' node itself (otherwise, it will make a loop in block-graph).
>>>
>>> Good examples.  I think we need more, to give us an idea on the use
>>> cases for the combinatorial explosion.  I need to know them to be able
>>> to review the interface.
>>>
>>>> +##
>>>> +{ 'struct': 'BlockdevReplace',
>>>> +  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
>>>> +            '*parents-mode': 'BlockdevReplaceParentsMode',
>>>> +            'new-child': 'str' } }
>>>> +
>>>> +##
>>>> +# @blockdev-replace:
>>>> +#
>>>> +# Do one or several replacements transactionally.
>>>> +##
>>>> +{ 'command': 'blockdev-replace',
>>>> +  'data': { 'replacements': ['BlockdevReplace'] } }
>>>
>>> Ignorant question: integration with transaction.json makes no sense?
>>
>> Recently we allowed do several reopens in one blockdev-reopen. So, it's reasonable to behave same way in blockdev-replace.
> 
> I didn't see that going in.  I trust reopening multiple in one
> transaction is useful, but commit 3908b7a899 fails to explain why.
> Mistake; we should *insist* on capturing the "why" in the commit
> message.

The reason was that to remove filter, we should do two replacements in one transaction, otherwise filter may conflict with original parent after replacement..

But finally, I had to add "if (!QLIST_EMPTY(&bs->parents))" hack to cbw_child_perm() of copy-before-write filter, so it should be possible to remove the filter in two steps: 1. replace child in original parent 2. remove the filter. (and filter will not conflict, thanks to the hack).

And that time we thought blockdev-reopen is good for manipulation with filters. Now it's obvious that it is not.


> 
> I dislike having multiple ways to do the same thing (here:
> transactions).  If there are reasons why the transaction command cannot
> be used, fine, provide another suitable interface.  But when the
> existing interface serves, please don't reinvent it.
> 
>> Still, I think combination of different commands in a transaction make sense too. So, in my thought, transaction support for blockdev-* graph modification commands is a TODO.
>>
>>>
>>> [...]
>>>
> 


Oh, that's all makes more questions than answers :)

1. It's OK to use one BlockdevReplace instead of a list and concentrate on transaction support. That's a mission I keep in mind: moving qapi transactions to use util/transactions.c engine for native integration with modern block modifications.

2. It's OK to limit "one-edge" flexibility, anyway, I don't know do we need it or not.

Still, are use sure that for user it will be simpler to replace root node by qdev path then by node-name? Both variants allow to determine the edge in the graph : qdiv --root--> node-name. But node-name may be preferable in graph operations.
Hmm, on the other hand, if user rely on possibility to specify edge by child, he'll make implementation which will fail to support several qdev parents for one driver node. So, maybe you are right, better not allow it.

3. I'm not sure that we can avoid "auto" mode. It makes inserting copy-before-write filter rather simple. If we force user to specify all parents by hand, it may complicate implementation in libvirt. Note also that we don't have a good way to query all parents of the node..

4. And I'm not sure about id namespaces merging, how much is it bad. Now I tend to agree that it seems unsafe.

Do we want force users use different names globally, or instead use pairs (type, id) to identify them? Like ("qdev", "<qdev_id>"), ("export", "<export-name>"), ("driver", "node-name")..


Peter, Kevin, what do you think about this all?


-- 
Best regards,
Vladimir

