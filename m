Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D042411289
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 12:04:48 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSGAJ-0003h5-Bp
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 06:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSG8Z-0002so-47; Mon, 20 Sep 2021 06:02:59 -0400
Received: from mail-eopbgr70090.outbound.protection.outlook.com
 ([40.107.7.90]:22314 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSG8V-0006xP-SU; Mon, 20 Sep 2021 06:02:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgULGQVBkDF8jnF+q4MWiIUuQt2sXyp5XsnraWaUjYTaFUp3SMoAbqWIzlrY/3ihrkQuEE3YIEHOhBmncqE0qTQhAJ17dG6+rROarBOT0KzBBMyxLDq2PTdz/VAy3219u6EvZ+gvuEQpj6gLE71FP8RhvqdrH2TcIjkje0mAl5ecjxt/VDoX7t2n3ZazwmdXwSLpCowvwfellLPMcHq/tgcHwm+eM69ctX1LUDStb6UeWeT/Fqgz70vvwInEgJGXVpKxIBktYM1aPgmpLeegp5elYP5glYn7jJ79vkTOqGb4rol9a6e87QGN/gNIOYtYSK6RxJu9kWmJhhxBDr8CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=lhK7WppmHsgZqB3auc0wu90fdMdVj1mCtdyR/Dzjj6w=;
 b=GqnUhh4rQ/axrQZ5vFvO9+mRjOgQbvXyJViVic1tgvjIA9oHL7rludnTXMOsowTqsSDVmP5gRz9rTpEPGSxup9Y4jkREUk19x7PpBemOAjYvsOhh4ns43op63tgcYbB3OW17ihtk6Decfom6TaW0gK3J2QOuMc/tOEWUHdvNmzrUu0c12INyTTntppIRBa30DhQZZvUAOirHBbLlm5cRzV3Y1PdXnD7y42hi+nl+JlmfjznOQ+10fwmL3QfPTKdUsg1F5dxEWAz2VcVUQy7okGwOQIttU0h8sJIPMbrO/l7oJy5VtZkITqpu7DrPSAcUer/3Uct5sJgbP9nGn3f6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhK7WppmHsgZqB3auc0wu90fdMdVj1mCtdyR/Dzjj6w=;
 b=pDd3hqRYwtWNBaXOxdb9eqELQIhK5ZzaMjGga2GeNfq9deemhOlfq0oR2IWKFjiqjIfZduTd1OhhgTjUSCcbjSiylLOaIZfPuwpkwv3P2oP0OXmiwbWBe6lNDDU7HW9QHRsAN/Jg1G/yjA/Uccz6WUvKcixjh5TfMuwadG6PgDU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6887.eurprd08.prod.outlook.com (2603:10a6:20b:38e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Mon, 20 Sep
 2021 10:02:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 10:02:48 +0000
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
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <08aab083-a8c3-a026-70cb-ac65d378515b@virtuozzo.com>
Date: Mon, 20 Sep 2021 13:02:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <87ilyv4ugk.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 PR0P264CA0227.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 10:02:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34c33c2a-ce22-4815-fd50-08d97c1dccc4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6887283DBFF80134C146012FC1A09@AS8PR08MB6887.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UHKuxvlBUKMcl6L4Cta1bv5XmmmPmw4gUbzZNAcseEvhXL3TNxPbJ9m3VT4lfVuKDWHGKPiuRJ4cNv0WHeZf8MEyu6+zCUhqp0mYg5KHLmkdKDEnyto4LnZQwLe5AJ7clO0ws94HnmB6a2qVHM6OB2d/mUZ2Yl14tHzvOIrcyWg1/G+tjFKuknlW0nOVGBwU8B79iJZyAYEIexsbNkrAOcTt0dHoRi1RxdW96/8KvvAWVdKBh23gEe5z5ueBdHfblN7h8ASOMwczwsf/lUBGNgejdLA2zMDyZNUhqoqL++spxR8YOnR1Hk6mEhYBYVg5lLtWaBhZdkRVQNv8GEaBnrOAN6/rZ3/QDNALOKFuzeu9NRajcrlKev8q9/wZrcJQVD1BY3U7C24PKMIhsEmY8T4UovmQBW1ORqghwKsGZ61nX+zVGZsGduP90rx6FdivPRIluI12ULFsZ9udsVMOV19zfHhg6WrJno5FAbO7Jj65vxI4Q0XlUrstaXbUWpVVhptpbqzImQQSGIQqbyMOV5CRJIns1XU8xcoOmncRxxI5VjlDbzPNVMPU7Vg6EMf3qbftjRnP+K6l7lls3C0dnbe1iwBqn4QTqhAmJKSk/hSUKZSPlnEj4DBC/ZRZ47JkldvI3ojz90k5yBhojobnt/jCCnAx+53OnPNUJ+AjkQcqlnZbZXC6qfYrjSuFs9KVlXjz+uiQbL+WBZl7zZT/8dYluVmSYCcnVHy2lvCmwnmq0XsnMwhSFLaN9vVYsfA0DbYD/mwrnrgx0aiqQyVjNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(66574015)(8936002)(31686004)(30864003)(186003)(66556008)(66476007)(66946007)(36756003)(31696002)(16576012)(6916009)(86362001)(2906002)(956004)(83380400001)(38350700002)(38100700002)(478600001)(316002)(8676002)(26005)(4326008)(5660300002)(6486002)(2616005)(52116002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVFicmxhUVU5MExBczZOQWRHSS9XcVVOSzMyQXA1OStzMHZXTTVRNHpRT0dx?=
 =?utf-8?B?S1VRVzVJMThhTy9RRm1SWG5DTVFNU003NUc4Rzdxak9JOTU2QnB4N0ozTU1M?=
 =?utf-8?B?ZUpEam5UeTN6S25iQXFsV2k2OS9Ea3piKytXOXVnbVlVWW1aWGY5SWZkaHN2?=
 =?utf-8?B?aHhCTWJ6R2ROOTZkTVVIdzFuc29XQ3ZaMEkzemFWb3BBQVpXOUpXYWZDQUtS?=
 =?utf-8?B?VTdPdUI2MDlxZFIxa1dJSU1zWHpOSjJHOUJSWE9hRkhzRVdtclYxdjJlZ1J4?=
 =?utf-8?B?Wm44R0tnTmprSG85SXhEV2t6YXB4TzJpV3Z1d2VmQWVFTUhkSGtNSGMxckl6?=
 =?utf-8?B?K0pqcG8xZjRiYmwyb2R2UlRKS3hWcEl2REV5RGI2d2hjd0FJV0JMYTN6YnBn?=
 =?utf-8?B?ai9NNngwNlF3TWViZVhiUDVETE1tdHRSMlQyOWo4WGRjTTV4bjJLOTd5SDZD?=
 =?utf-8?B?eVozbHpVT20wbkQ2dHJZa29SYWhHTjJvUis4azN3R1F0bXVHTGUxbXhQRWVi?=
 =?utf-8?B?OHE4b0I5UHVTV2VkSk0yVlVRRmR3VGJkeFRpQXR2VUwyM0ZMYmh4cFR6dXpx?=
 =?utf-8?B?ZDZUYWtheUdFS0xFZFFPV2hKQllQeC9EVldBTDJrQUZnREJOL0NJNTZlWkY4?=
 =?utf-8?B?QXZGYkFvakt0RHMxRC9yLzdoSHNjV2tTa3VXaWJnNVdMR1J2dGxsMXFTYVRK?=
 =?utf-8?B?RXhkaDNPYmtTcDVFZ3BISGVuemgxVWRCZlZ1UkczTGdSVTRYM2duR1RJU2k5?=
 =?utf-8?B?NTY4d3VIeWNwSnJaNXFtUmNpcldtVnMvOU9sWlJQQ0ZqS1lIR2t4dUd3Um9Y?=
 =?utf-8?B?Ykw5bzdwZWkzeUtIeGNwQkswTkhnKzdGRFB6WkE3MUZ6YVJ4UXRDaU1YSmdG?=
 =?utf-8?B?WFFJRGhoalB4b1NLSWpHaytjam5vK3NhNStPdnhma2dIVko3c1g5eUE2aGNB?=
 =?utf-8?B?SXVmbWR1eWQ1b0lqbjJ0SU9IU01GNUN2L0owQi9GZjZzbEl4d2lyZjluUjRh?=
 =?utf-8?B?YWc3UXZ1Q1NGOVcxU0hFb2dtR0xlQnN4cHZ3cDlDU1Z6VndpeUd1Z25WTVl4?=
 =?utf-8?B?VG9BeXpqK29IS3FTbzkyTVNRUVBSdXJxQ2RVMjlud3VISWpmWTExdGY1alM0?=
 =?utf-8?B?TFFYb3draTRNYnN2YVpyYU5tN093MFlBYUdqUUNoUFA3WGphYVE4ZkxPV1dt?=
 =?utf-8?B?djdFNEd0RWczaUxscWQ3TXdjQzluR0pBVXp4WFRjY0dBZW93cTZ0RmxMeEJp?=
 =?utf-8?B?N0l1TUsvWlRZSjRVUzlJN2hyVDBROVlKTVRuU1N2cUNRVzZxRmNhcnI1eVZS?=
 =?utf-8?B?NHVPM1RWQ1J6bFh4RDNSNWNVZnVtQ0d2VHY1bkxSU05KdVJSZVJBS295bngr?=
 =?utf-8?B?dGRmRkpaWXVRQmtWZWZKR1JnZHBuanBoN3djNU5UVXRKN0FKRkRoWFowUEVW?=
 =?utf-8?B?a3MxajI5UWRBMlhETjVoNzN1VHJ2cFpXL25YWDJDdlNmY3AzUmRDK0Y2c0Fw?=
 =?utf-8?B?NzEyUk9XSGFjckxwVEFOUGdNQjJ5VTN5SGZpblp3S3lZYURNT25rNGIyallQ?=
 =?utf-8?B?K3FFM2tKZ0NkUFRHSlNkRUVUYjBTR2xqUjc0SDRBcXBXNlRYb0Rtb2JIaFpx?=
 =?utf-8?B?QXlYc0xQQlcwS0VGR0lodTZ0b1NLWXYvdDBqYUxWOUh2c29oUWVZKzBuM05w?=
 =?utf-8?B?RTc2MW13bnFtUTRQYlRiZDBRUnpxK3RzR3N5LzVUMVFRU0NPZ3BFRlpLUjRm?=
 =?utf-8?Q?e01RWILKACFsiPtRsRwMtuebKev4Nl36h+zm2aQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c33c2a-ce22-4815-fd50-08d97c1dccc4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 10:02:48.3174 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPoAwoKF9Hns/ox156dpOiRTtNxSXq8l/eaPnBW0PRgNIeBftTzYtL9v8OAJt93BwACMZNeT6zGx/FC05+Y0eI/ZJLNQPDFk3RSAH+fC8+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6887
Received-SPF: pass client-ip=40.107.7.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Thanks a lot for reviewing!

20.09.2021 09:44, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> Add command that can add and remove filters.
>>
>> Key points of functionality:
>>
>> What the command does is simply replace some BdrvChild.bs by some other
>> nodes. The tricky thing is selecting there BdrvChild objects.
>> To be able to select any kind of BdrvChild we use a generic parent_id,
>> which may be a node-name, or qdev id or block export id. In future we
>> may support block jobs.
>>
>> Any kind of ambiguity leads to error. If we have both device named
>> device0 and block export named device0 and they both point to same BDS,
>> user can't replace root child of one of these parents. So, to be able
>> to do replacements, user should avoid duplicating names in different
>> parent namespaces.
>>
>> So, command allows to replace any single child in the graph.
>>
>> On the other hand we want to realize a kind of bdrv_replace_node(),
>> which works well when we want to replace all parents of some node. For
>> this kind of task @parents-mode argument implemented.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
>>   block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 160 insertions(+)
>>
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index 675d8265eb..8059b96341 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -5433,3 +5433,81 @@
>>   { 'command': 'blockdev-snapshot-delete-internal-sync',
>>     'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
>>     'returns': 'SnapshotInfo' }
>> +
>> +##
>> +# @BlockdevReplaceParentsMode:
>> +#
>> +# Alternative (to directly set @parent) way to chose parents in
>> +# @blockdev-replace
>> +#
>> +# @exactly-one: Exactly one parent should match a condition, otherwise
>> +#               @blockdev-replace fails.
>> +#
>> +# @all: All matching parents are taken into account. If replacing lead
>> +#       to loops in block graph, @blockdev-replace fails.
>> +#
>> +# @auto: Same as @all, but automatically skip replacing parents if it
>> +#        leads to loops in block graph.
>> +#
>> +# Since: 6.2
>> +##
>> +{ 'enum': 'BlockdevReplaceParentsMode',
>> +  'data': ['exactly-one', 'all', 'auto'] }
>> +
>> +##
>> +# @BlockdevReplace:
>> +#
>> +# Declaration of one replacement.
> 
> Replacement of what?  A node in the block graph?

A specific child node in one or in several edges

> 
>> +#
>> +# @parent: id of parent. It may be qdev or block export or simple
>> +#          node-name.
> 
> It may also be a QOM path, because find_device_state() interprets
> arguments starting with '/' as QOM paths.
> 
> When is a node name "simple"?
> 
> Suggest: It may be a qdev ID, a QOM path, a block export ID, or a node
> name.

OK

> 
> The trouble is of course that we're merging three separate name spaces.

Yes. Alternatively we can also add an enum of node-type [bds, device, export[, job]], and select graph nodes more explicit (by pair of id/path/name and type)

But if we have to use these things in one context, it seems good to enforce users use different names for them. And in this way, we can avoid strict typing.

> 
> Aside: a single name space for IDs would be so much saner, but we
> screwed that up long ago.
> 
>>                         If id is ambiguous (for example node-name of
>> +#          some BDS equals to block export name), blockdev-replace
>> +#          fails.
> 
> Is there a way out of this situation, or are is replacement simply
> impossible then?

In my idea, it's simply impossible. If someone want to use this new interface, he should care to use different names for different things.

> 
>>                     If not specified, blockdev-replace goes through
>> +#          @parents-mode scenario, see below. Note, that @parent and
>> +#          @parents-mode can't be specified simultaneously.
> 
> What if neither is specified?  Hmm, @parents-mode has a default, so
> that's what we get.
> 
>> +#          If @parent is specified, only one edge is selected. If
>> +#          several edges match the condition, blockdev-replace fails.
>> +#
>> +# @edge: name of the child. If omitted, any child name matches.
>> +#
>> +# @child: node-name of the child. If omitted, any child matches.
>> +#         Must be present if @parent is not specified.
> 
> Is @child useful when @parent is present?

You may specify @child and @parent, to replace child in specific edge. Or @parent and @edge. Or all three fields: just to be strict.

> 
> What's the difference between "name of the child" and "node name of the
> child"?

Although we have to deal with different kinds of nodes (BDS, exports, blks, ...),
children are always BDS.

But, may be in the context, it's better say "id of the child".

> 
>> +#
>> +# @parents-mode: declares how to select edge (or edges) when @parent
>> +#                is omitted. Default is 'one'.
> 
> 'exactly-one'
> 
> Minor combinatorial explosion.  There are four optional arguments, one
> of them an enum, and only some combination of argument presence and enum
> value are valid.  For a serious review, I'd have to make a table of
> combinations, then think through every valid row.
> 
> Have you considered making this type a union?  Can turn some of your
> semantic constraints into syntactical ones.  Say you turn
> BlockdevReplaceParentsMode into a tag enum by adding value 'by-id'.
> Then branch 'by-id' has member @parent, and the others don't.


OK. Now, after some time passed, I see that some additional clarifications are needed. Even for me :)

So, the actual modes I have in mind:

1. Replacement for backup: we want to inject copy-before-write filter F above some node X, so that all parents of node X start to access X through filter F. But we want automatically skip parents if modifications leads to loops in the graph (so, we can first carete node F with X as a child, than do replacement, and don't replace child of F by F :).

That's  parents-mode=auto & parent=None & edge=None & child=X

2. Replacement of any specific edge in the graph.

Edge may be specified in different ways: by parent, by child, by edge, and by some combinations of these things. It seems reasonable to allow any combination, if it specifies exactly one field.. Assume we have A -- backing --> B relation in the graph, and want to replace B by filter F in that relation.

2.1 Specify parent:

We may specify all information bits, to be sure that we do what we want and for high probability to fail if we have wrong impression about what's going on in the graph:

parents-mode=None & parent=A & edge=backing & child=B

We can omit edge:

parents-mode=None & parent=A & edge=None & child=B

  - that should fail as ambiguous if B is "double child" of A, with two edges from A to B. But I think, that's unused combination for now)

Or we can omit child

parents-mode=None & parent=A & edge=backing & child=None

  - that should work well, as node shouldn't have more than one backing child.

and we can omit both edge and child:

parents-mode=None & parent=A & edge=None & child=None

  - that will work only if A has exactly one child and fails otherwise. So, that's bad for format nodes but good for filters and for block devices.

2.2 Don't specify parent but specify child:

parents-mode=exactly-one & parent=None & edge=backing & child=B

  - works if B has only one parent with B as backing child

parents-mode=exactly-one & parent=None & edge=None & child=B

  - works if B has only one parent

======================

Now, what's more?

parents-mode=auto & parent=None & edge=root & child=X

- replace only child only for root parents of X  -  may make sense


And all other combinations are

parents-mode=ANY & parent=None & edge=ANY & child=None

  - don't specify neither parent nor child. That works bad with any mode.. Theoretically, we still can support it by looking through the whole graph. If edge=backing and we only only one backing edge in the whole graph we can serve the request.. But we can simply fail and not care.

=====================

What's bad, is that 2.1 and 2.2 are not symmetrical. So, right, it seems better to turn it into union:

1. mode = auto

Replace child in all it's parents where edge match to @edge and avoiding creating loops in the graph

child: required, specify child
edge: optional, if specified, do replacement only in such edges

2. mode = one-edge

Replace child in exactly one edge. If more than one edge matches - re[ace nothing and fail.

parent: optional
edge: optional
child: optional

  - all fields optional, but user is responsible to not be ambiguous. Still, we can enforce that at least one of @parent and @child should be specified.

> 
>> +#
>> +# Since: 6.2
>> +#
>> +# Examples:
>> +#
>> +# 1. Change root node of some device.
>> +#
>> +# Note, that @edge name is omitted, as
> 
> Scratch "name".
> 
> Odd line break.
> 
>> +# devices always has only one child. As well, no need in specifying
>> +# old @child.
> 
> "the old @child".
> 
>> +#
>> +# -> { "parent": "device0", "new-child": "some-node-name" }
>> +#
>> +# 2. Insert copy-before-write filter.
>> +#
>> +# Assume, after blockdev-add we have block-node 'source', with several
>> +# writing parents and one copy-before-write 'filter' parent. And we want
>> +# to actually insert the filter. We do:
>> +#
>> +# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
>> +#
>> +# All parents of source would be switched to 'filter' node, except for
>> +# 'filter' node itself (otherwise, it will make a loop in block-graph).
> 
> Good examples.  I think we need more, to give us an idea on the use
> cases for the combinatorial explosion.  I need to know them to be able
> to review the interface.
> 
>> +##
>> +{ 'struct': 'BlockdevReplace',
>> +  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
>> +            '*parents-mode': 'BlockdevReplaceParentsMode',
>> +            'new-child': 'str' } }
>> +
>> +##
>> +# @blockdev-replace:
>> +#
>> +# Do one or several replacements transactionally.
>> +##
>> +{ 'command': 'blockdev-replace',
>> +  'data': { 'replacements': ['BlockdevReplace'] } }
> 
> Ignorant question: integration with transaction.json makes no sense?

Recently we allowed do several reopens in one blockdev-reopen. So, it's reasonable to behave same way in blockdev-replace.

Still, I think combination of different commands in a transaction make sense too. So, in my thought, transaction support for blockdev-* graph modification commands is a TODO.

> 
> [...]
> 


-- 
Best regards,
Vladimir

