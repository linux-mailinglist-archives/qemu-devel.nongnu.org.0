Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C626D411384
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 13:26:48 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSHRf-00087a-EF
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 07:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHQl-0007L7-4Q; Mon, 20 Sep 2021 07:25:51 -0400
Received: from mail-vi1eur05on2130.outbound.protection.outlook.com
 ([40.107.21.130]:1920 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mSHQh-0005kL-BZ; Mon, 20 Sep 2021 07:25:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zm57ED86grSIplziC1feQSSHPt9nINOh2GhrHsCWglsXP9RClMNmKWIiGZlBj/6wUWJeDhrVm5FoP2qsSWMVOw0GY7WwPBM72vtARbEYF20BvFPM4UsSPc+Puuy9XwaUJ+ZS8+mJlFCW54rJ9YMqlXDiSu0Ui3OW02hZt436BGqxsV2pCxoDEs8Wj3dmAkL5jJCLLVjUX80pxKVGYIIRmHSKJqW1bF/06k/tESzGCQmqP9IrXKQ2kLWxJluSJOtW8EA8jnkXQ8asq3mc1rt6ytuA29B7mhb+HfKLD1Cnmp+vvm5wJL6qMNs/ipyf8h3ffyB21JUBmiWT3266BSeyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=RVZfbB4mgt/E5ikY6vxYCdwQpgcilxxwF/8HSYBkVHU=;
 b=EIJkEVEMRdvyfOmNW0V6flNHJGZwCiXV1o84FsyTbMYXj4JyGJSyR7jnLIAUhvJrfcvqD/pL56SuIZARxe5Dj/DsoP0XvoNMbkKrbeCNLb+f7H270UNJFTWARLQu6/Ac5YYJGkLjchy9ExJmKUewLu9EA4DKAB6b5j6Wnda1QkLFdC9O2rgRwZq5Qfa42YNDj4eOeG9qArVD7BJcoYZnnlfyUHFQu0vPCBI+tBFmZnSJOlL9xN3DVlR9TrVmyM3L5LvEUTIAWOi3XFzKUI9hiD/3pBKYaezwBSa4Eta3V+YCbWPR0NFRJa5Sh1m/a7fuCjys1q8bgEzN/6ewPxLrUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVZfbB4mgt/E5ikY6vxYCdwQpgcilxxwF/8HSYBkVHU=;
 b=MQzXvkNjp568qGZDPLDOETI/OA6zWDT2kfBq/H9aBs8tv7dqmxcPra/PtWh+QCRsapLRKK6zMkwY2dSAa9kVfy42C3E3CyIR8MfzpblJsOizSPdM0LYRiSpSiTKWN6zDC/KTg41UxSNOHZHcacVNbrUBOOOejEONw7DqPdOI//Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2097.eurprd08.prod.outlook.com (2603:10a6:203:4c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 11:25:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 11:25:43 +0000
Subject: Re: [PATCH 8/8] qapi: add blockdev-replace command
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
 <20210802185416.50877-9-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <19c31991-0a55-2b99-77f7-be84ace6b8da@virtuozzo.com>
Date: Mon, 20 Sep 2021 14:25:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210802185416.50877-9-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.205) by
 AM9P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 11:25:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e599b26f-8368-418e-a2d1-08d97c2961d3
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2097:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2097560247FA2B23166D57ABC1A09@AM5PR0801MB2097.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SzCuymLlnP/xB2llMmu8HhxgK/RATQg88TffZMh8siNeRHzgU1ZFt4w3+BZrRcwif1CLL1s63U9wMXCEoFyHFrlFKcbdURhYM+m1vAAMmaUip7UNpAuz0oyKCdKLQcjmu5UvQKHjz9yeh2ieZ8G3HnY6h5zb3xZdEqFxPhydr1qOxUpfZhbcPH6kFZBHVLP+y5+7rv+RgwSb7lVVKBRC5qyLThQFXOZ3ludjBwYpBNCJmgaUSjeucnICaMMsaHdCSFhGO5ijswvndWKRZYDRwSZB6MXhQ+QIAGPhQyGD53qZ2QM8Xzs7GsRQPDVlqOxYgddBvEolNujXt6ovpV7DRQfJEo6g8342ytaPatkkgeNWtLwBdqD4LfcRhABfo3NPs54k2Il2/Q1YxU8a2paMbpj01SGXWtDEAOslz/XccakjnSjjd+otR0Y1aB+AfR/IlMm+PrDYWPuxPQu2GsZ0mvZ/UamSk7805HG6SnlMQnqQ4QeYzkwR7LNzuf/su2TY/KFDDmJ7x8tuoI9hPOvrDDoMbsl8y0qRvAAlMdfyLorPjk9lzlDAQchWkucLotJyORr/mD0rGykuyjITEgTfOA+2GvwbNUNZYl4QKUUfDZIW8NJpq3mJC99tED6AcHEXMT9Xyrug/drqov9lrlpwcPVTSZjUEoryRNbqGFxcQgUNaFmunqtBXB8tMKjn7VRfR7fYxaNDEz2ySG2n7vI0CikVMZn/ojmcno+WwXzLkdxZDafWFBdF0ZEYleadl2xRENoSKKQsQIk6IakFIBejkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(16576012)(186003)(316002)(52116002)(5660300002)(508600001)(8676002)(26005)(66946007)(8936002)(86362001)(31686004)(31696002)(7416002)(83380400001)(38100700002)(6916009)(956004)(4326008)(2906002)(2616005)(6486002)(38350700002)(66476007)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE90VjhXeVRtN1ZKRFZ1SSt6UVZwUk03UmlJYm5RMzAyRHV1elViTkNpdzRK?=
 =?utf-8?B?Y0NHS2ZlVWtQU3pwR1IxTFdFaFVMN2Z0emVaM0tESWZld29YZVJBMC9YQ3hw?=
 =?utf-8?B?SnBveGRwcEZBdXpBdW4yWVpEM2g2MEZIclROWjh5ZFZXRHVMeW1qQjMzYktp?=
 =?utf-8?B?REplYkhqTU10TXRaUFJuQUs3VW80S1VRVk1HT05yWVB6QitKZ0k3QW1idWgv?=
 =?utf-8?B?NlE0dGdIY1NXNndPWDNYUmpPbnd0dlNFSVBUNHEwNWMzNXFtZ3F5ZjVKdFlo?=
 =?utf-8?B?TmpNVzF4VjRVc1ZUWjBaNmd0cXhIL3BBcUhjWWxYYmxSY1k3TWllNTUvcGxJ?=
 =?utf-8?B?NGJ6WTc0ZmhpR2pYUzkrY2VDRm1RN1VEazh5VEhJRHVZdFovM09pVFp1NmFD?=
 =?utf-8?B?cW5DRmhGN1A0bTM1cTFSOW4zaTBkTjZqbHZENWpqT0ZCMnRRWCtudnN1ZElH?=
 =?utf-8?B?d3dTaVphR0lRbzlSUi9WTEE4WWYwZVZXTmw5ckoydW1wOTQ0RDNSaGYzME1z?=
 =?utf-8?B?dzRSeUIzR2J0bVo2bERFY1dTWkxMWVorNXJvQXUvbU9LbmYzdW1CTVRtcEgy?=
 =?utf-8?B?Zi9NZTZNeGJUblBFWGhQc0JQT0dRSEZXS0M0amYzZXZFVm15WU9qejgvUWly?=
 =?utf-8?B?aHlaVXZ2SEd6U0Z6Y0xFY2dpYXNpY0FDU2VrY1NqODFVM1oxUFREMnNCdmpo?=
 =?utf-8?B?RXVYbXJTdUlKOEt0N1FEVlcyM2tDZ28rRjUyUkJIcmVFU1BtZlpwRndYRkFp?=
 =?utf-8?B?bVZ4bUZnNjNuY09lOGh5RUVmY2FEOW5CUlZvM0VJRU5PUE5WRlhnQzcybFk1?=
 =?utf-8?B?TlpoUXVSSDJHMkNJdTRjT05MME4rdDVkTm9XTEE4OXdod0daeDN0N2MvUlpT?=
 =?utf-8?B?b3V3ZHl5aVBYbURRNVREdEpBUEY1WkFQRks4c1IxUmNOQkNrOHpKc3UrVm5X?=
 =?utf-8?B?MzdaZzFNZEZlMTZ3S1hRSEI3WUdjRHJ4QnYrWHB0bS9qMEptdjJNaGpzSm4v?=
 =?utf-8?B?YXh2UzJVYk5GTC9ZUXI0VXM0aTVxNDZEN3owTkFzUnROOHhMRi9iRXV4M0Fk?=
 =?utf-8?B?RzR3bGNTT05rNTlhSXNReEY1S0RCRzdVdkNERXVhL0JJUExQcDI0dlFZVlVP?=
 =?utf-8?B?RDJlUTdtZDZRWnJtSk84ODJzb1IxMksvcHEzVVlncU02V2hnUUdSdWlUdndP?=
 =?utf-8?B?NjBsY2U3SnpCSFdVYnlpRUpqRWNXOHpOSSt4UG1PdWo3SDBEajAyaTZNVVUr?=
 =?utf-8?B?Y2U2TDgyUW9BUWFvbWt1Y2IyVWFZbWVuaEtXenZBSDdXaHdWaU5FZGVXUkwv?=
 =?utf-8?B?K1A3cldSM3V0eVdOVXFxem52dnhkWElTc3dvSHdiM2pwTzhaMGJKUXBUOUVr?=
 =?utf-8?B?SHFyajl3cFJucDdGWEEzaHBHU2dvOVQ3WU9WSkIrcnhjNDMzc1FUWktjSVla?=
 =?utf-8?B?Yk5COWp3LzFEdURSSEhJOVFLYTRIZnNtamNIZVZ6Rml1eDRDUzVMV3BlMkV2?=
 =?utf-8?B?ZVBoU21SVk1oVEtlc2dTLzRNVVRXaG1VV2s0R1VyYmY1dnJTZHdSV2JsSkFY?=
 =?utf-8?B?cnhhTXdPSDR5TXQyTm1IaTlDTUFnb25zUGhFcE5ESkR0SWU0MElzcHlyNzNi?=
 =?utf-8?B?R2kybm8vb2xlK29RUWhHMFhNVHJnUXRwUGtXeGFHT2lVZmEvYWNKTGNOWEdB?=
 =?utf-8?B?NDhwZ2s5VERSN1lYdlY4OElDcU9GUkx6QnR5c3BQV1RXVGZzZy9MTWxQZlFi?=
 =?utf-8?Q?dIsWC9EYyCjJ+0xUJ2TQKVBXZWLmQvDU99t6htb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e599b26f-8368-418e-a2d1-08d97c2961d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 11:25:42.9171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnIxT7SN7Ob14kmqFqYtNA4tzCqkaL37PCsxaw6aeskQbx/cRRBkzOz2j8M/TBEpvpS6pSDPXBVCy+t6tHoi/XjNyn6drcaHK21ADmKC7vU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2097
Received-SPF: pass client-ip=40.107.21.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

02.08.2021 21:54, Vladimir Sementsov-Ogievskiy wrote:
> Add command that can add and remove filters.
> 
> Key points of functionality:
> 
> What the command does is simply replace some BdrvChild.bs by some other
> nodes. The tricky thing is selecting there BdrvChild objects.
> To be able to select any kind of BdrvChild we use a generic parent_id,
> which may be a node-name, or qdev id or block export id. In future we
> may support block jobs.
> 
> Any kind of ambiguity leads to error. If we have both device named
> device0 and block export named device0 and they both point to same BDS,
> user can't replace root child of one of these parents. So, to be able
> to do replacements, user should avoid duplicating names in different
> parent namespaces.
> 
> So, command allows to replace any single child in the graph.
> 
> On the other hand we want to realize a kind of bdrv_replace_node(),
> which works well when we want to replace all parents of some node. For
> this kind of task @parents-mode argument implemented.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json | 78 +++++++++++++++++++++++++++++++++++++++++
>   block.c              | 82 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 160 insertions(+)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 675d8265eb..8059b96341 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5433,3 +5433,81 @@
>   { 'command': 'blockdev-snapshot-delete-internal-sync',
>     'data': { 'device': 'str', '*id': 'str', '*name': 'str'},
>     'returns': 'SnapshotInfo' }
> +
> +##
> +# @BlockdevReplaceParentsMode:
> +#
> +# Alternative (to directly set @parent) way to chose parents in
> +# @blockdev-replace
> +#
> +# @exactly-one: Exactly one parent should match a condition, otherwise
> +#               @blockdev-replace fails.
> +#
> +# @all: All matching parents are taken into account. If replacing lead
> +#       to loops in block graph, @blockdev-replace fails.
> +#
> +# @auto: Same as @all, but automatically skip replacing parents if it
> +#        leads to loops in block graph.
> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'BlockdevReplaceParentsMode',
> +  'data': ['exactly-one', 'all', 'auto'] }
> +
> +##
> +# @BlockdevReplace:
> +#
> +# Declaration of one replacement.
> +#
> +# @parent: id of parent. It may be qdev or block export or simple
> +#          node-name. If id is ambiguous (for example node-name of
> +#          some BDS equals to block export name), blockdev-replace
> +#          fails. If not specified, blockdev-replace goes through
> +#          @parents-mode scenario, see below. Note, that @parent and
> +#          @parents-mode can't be specified simultaneously.
> +#          If @parent is specified, only one edge is selected. If
> +#          several edges match the condition, blockdev-replace fails.
> +#
> +# @edge: name of the child. If omitted, any child name matches.
> +#
> +# @child: node-name of the child. If omitted, any child matches.
> +#         Must be present if @parent is not specified.
> +#
> +# @parents-mode: declares how to select edge (or edges) when @parent
> +#                is omitted. Default is 'one'.
> +#
> +# Since: 6.2
> +#
> +# Examples:
> +#
> +# 1. Change root node of some device.
> +#
> +# Note, that @edge name is omitted, as
> +# devices always has only one child. As well, no need in specifying
> +# old @child.
> +#
> +# -> { "parent": "device0", "new-child": "some-node-name" }
> +#
> +# 2. Insert copy-before-write filter.
> +#
> +# Assume, after blockdev-add we have block-node 'source', with several
> +# writing parents and one copy-before-write 'filter' parent. And we want
> +# to actually insert the filter. We do:
> +#
> +# -> { "child": "source", "parent-mode": "auto", "new-child": "filter" }
> +#
> +# All parents of source would be switched to 'filter' node, except for
> +# 'filter' node itself (otherwise, it will make a loop in block-graph).
> +##
> +{ 'struct': 'BlockdevReplace',
> +  'data': { '*parent': 'str', '*edge': 'str', '*child': 'str',
> +            '*parents-mode': 'BlockdevReplaceParentsMode',
> +            'new-child': 'str' } }


We also can make 'new-child' a 'BlockdevRef' and allow creating and inserting the filter in one command.


-- 
Best regards,
Vladimir

