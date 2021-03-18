Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A7D340818
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 15:48:27 +0100 (CET)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMtwi-0001BN-Qt
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 10:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMtu3-0000As-5p; Thu, 18 Mar 2021 10:45:38 -0400
Received: from mail-eopbgr30107.outbound.protection.outlook.com
 ([40.107.3.107]:61825 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMtto-0005Px-4G; Thu, 18 Mar 2021 10:45:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZRj07Sdbn+OczkL5cEOY1np+vAsIhyC2DhBSHjq6uvNZtpFoz1utTsCnZOp7T6zp8d8Vlr5xicgH15S0nFp4rw5dsCNHTDjbNWHc4DuVBa6/QlX8/VchKsQeIHpjfILGbAhLJFJ4P8HouX10h839NzqLwXxPznkLuk7VLPy/R9KgUBFiXMrC6D/9zEuXOGV+6VIZoPmBholXEy+oiETlMK774LT+mk2MX1EjDHpgKfPnNrTfu7Zz+E4XkfF1a8qj9cGlqOCHll1Vs0q3QCU9WbiPWYj0RlEajbUE+RHiCDLGDZYYf+eMp2EG2qHbL0hrPbq1Edjp19MjZw7Vj/TEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIpLgiit3PuocY29LjS+JRAcf3oayEzDGgXwEcEjoGQ=;
 b=eQaCJqLoKyibn1bZF/c5dFdAUdEgtQf6NWNgBnmOUfyC2JJ/GiVdRyU8JpMu9RNHmudeIoYiexL/IAHGvzLyhvdbbfgiB4fPVp6GaBI04ud/BcjZod0Bbxq9KGfAOo2VhT/xjlu8YlVTznwms6SjOeTmTwBlpONgTbclgovCvj0yLyYmx7Eokn166eAQ4fJblGA5jcLFnE28lyDbGwDd3oKO5oQRsccumkGcPzM0Zsp5OzcLNQdthqckif7k7Wh/Zf1rGLxF82AB+8Cql2EZvT6MoywSn+0iCF7z8CKIPZJlGraFeoev5HHrP6fdYrTJc7YePQvy9TEei4hc/2QoAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIpLgiit3PuocY29LjS+JRAcf3oayEzDGgXwEcEjoGQ=;
 b=JTjb+eo8+gSkxRDIOTYBprXXkqUdbym1wBwpboYxbT7tW8lcrGY28o2wstp4AQ6Y8pXaIesbLjUNbDBcocfo/vbiW1tL/04U1dyw4xHAjjJHQo34GiOh7Wyi4UXEFt8gUyroPB935ZaZvzGLcixxjBGKIkWoymvjZGYNwchPtTg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2610.eurprd08.prod.outlook.com (2603:10a6:203:97::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 14:45:14 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 14:45:14 +0000
Subject: Re: [PATCH v4 4/6] block: Support multiple reopening with
 x-blockdev-reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <ed95ecd1018e45869d02e4525fc65216e7ebd370.1616000692.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <b0f51127-d3c0-7334-6dcf-45f7d66270c2@virtuozzo.com>
Date: Thu, 18 Mar 2021 17:45:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ed95ecd1018e45869d02e4525fc65216e7ebd370.1616000692.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR02CA0187.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM0PR02CA0187.eurprd02.prod.outlook.com (2603:10a6:20b:28e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 14:45:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0a87a53-063d-40da-6ad2-08d8ea1c706b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2610:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2610CA9D3A86DE5722015AA6C1699@AM5PR0802MB2610.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIVJweSLEBLFbcunBdLWAjs/Mh24nCc91gM1AwEZntrKe9CxUQwPKPfYZYePGujeuei7UzMQwNtFmD+BF8vdnyRTZxi6UDdbyyl4l9qWE1NLIGs5+iTvljSkLtxezyEHwXmhUtjOAeYee6bvCSk4zAS+xmWyLuv0w8219cfZdyhYJ5VaX99kx74g1fQalbeQXZRxtpQxozqOArHA0ZlxjoKxwfW8Z9KHtT5LXgoxq3S9BUS6Tq4IpvFhb7Ig6psX9lfEnfB2d0EoPo/iVwnuFNq0nGzGxdewnL/4JXq5Dzc1sxuog02f76hTHNK1XPliFs9xMNXYD586EtC9DYetQCL6F1PqeVdWCuwPW1KdvAKj8nhyu0c35dvWR9lDrRJlhLA6RcSJi3qBFJs5+0JGyOknhVsWv99ZAfvrHewL+oi5ozVfW6ly070nwH4d2JCTNGNh+FUX9W25+sveAmh3is3ACdC3Cvw9qc12B2uOQoWO86ouc9JyAc8WrhkzdN4xw8grg6ZRrLEo0AjedUFR/R2CMRF78Yvp8l3B4RqsBg0a1zprxF5iJMOwkhui27iVgHJDlA57E6QmymRIwX6CXz2GxyaYv4qjjzfxssWPI7uheZgnVhu95SYO78Z4lAQWbrebMEBXbEazQCFzA1D3UG65FHpRV8RDdsVh0JOVmILACecwJNM0OCd4+O/4gCtM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39830400003)(366004)(376002)(136003)(83380400001)(52116002)(2906002)(86362001)(6486002)(478600001)(316002)(54906003)(31686004)(38100700001)(36756003)(4326008)(16576012)(26005)(8676002)(8936002)(66556008)(5660300002)(16526019)(186003)(31696002)(956004)(66476007)(2616005)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enVQdXQwY2djeHJRRkNkWjkrcWdCU3dWUlNSWlNEY1FDQ0IwOGcwYjE3Zkhv?=
 =?utf-8?B?Yzgxd0RaV1FaRXV3RTAzSXczRGFLTXpDTGNjNUtRQTUvMlBJTnNZS3ZscEhu?=
 =?utf-8?B?QXZlRE9vT1NRNnpZQTArYkg2d0grcllrU1Q5ak16cEMxdFRPVE9IQXFrOWhF?=
 =?utf-8?B?OFpSVjdDUUloYVgwSGM2U2xFTmU2eFZlbTU3Zkp6bFp2dFVHZW5ITVRZc0NB?=
 =?utf-8?B?QXZoZlJ6U1hQS1JwZUNVUk85eTk5ODhsRVowMEJySHdKdXBUbExzaHMya240?=
 =?utf-8?B?MVUyZnEzQW9rdEE0MFpOUklNUW9HWS9QRlR6d3lJQ2x2TVVaVDNENytPNlNu?=
 =?utf-8?B?OHE2NjY4OElTcUlIQlUzY0c0djJQMDNFTHRBajdZa3VwQTE1RkdKMmxxMHdw?=
 =?utf-8?B?RkgxaHdIcFo0Z2IzQjlCa2k2Q2pkNEx2S0FwRExPeVNBeWtvQk1nSzFmMExp?=
 =?utf-8?B?V04rNWtMV0hNNjhoSElvUEw1Mms3elJWYUR6Z1d4bVBrbTY2d0oyTjZvdTNz?=
 =?utf-8?B?ZExqbEdZaUlDSU1RQW5SUHJ4aUkwVXU0NGdRS0w5STViRHVYMlB1THFKa0d1?=
 =?utf-8?B?TFJFZGR5N1ZhTnRwT2YyRmtJNjJPN0prNEU5YURXNmkzYndGUTlqV1FKNUtt?=
 =?utf-8?B?L3FNZlFRclBsVUxiREduc2k5TDU0K042NFRjVnpIdVpGTWp2M1A4dEFOTUhU?=
 =?utf-8?B?T0ZBNXFNRmtlZTBzeFVETDVXK2RvdTZYTmpsb3Z6M1VkL08wRHB5T2d5Z0VQ?=
 =?utf-8?B?OE5saWhVdm9tdDFKd2x5MmozcUhzTnVMUVNNanRxTnFueHFmT0JrUDM4di9Q?=
 =?utf-8?B?ZHpHRjdFaEM4WVNWYTByWlJ4ckcrMmJMTUFEVEFaRldsQzRkZXFOdm55NUFH?=
 =?utf-8?B?cmJmY1lyV29CWkUrSnVVRmFsNXZkRWZ4djNaRU1pT2oyK2xBZ3N1eUNYdEdU?=
 =?utf-8?B?bWVZdDJ1blZoTXE0WUt6UURJb2YycGtHT0REZlQ3Z0FYeGxJeU53dXhuUmhR?=
 =?utf-8?B?QUg2L2l0YThvTlZoUjNycmNaVTdtb0UrVXphWDYzajRTS09aRHdBMGt2RGZI?=
 =?utf-8?B?ZnFiQ3E4d2ZrN3Q4bW9yc1J4Q0lqRkZlMXRRTGpPSFRwWjdZYWFoUkZKWGdl?=
 =?utf-8?B?QjRWNFJTNkhTbWFvYzhhZlhBa012VGR0bVNDOVlWN1hoMi85UHpHcnNwWERv?=
 =?utf-8?B?d1dZVkhlYzB3MHJjZWxoUVpwcGxVTHkrOG0vVXBIRkJSSWJBeDU5dkhJUHR0?=
 =?utf-8?B?L3Y2R0xnVDJZdHI2bVFkdkVVaW1pWTlUa25jbXRjU1VUdHFHVUxvb1BycTN6?=
 =?utf-8?B?bUdMYzl0azdHTWxQb2YyTklKV3pJT0ZCL0JLUFJ4T0U2Y1pQdXJsYWpnaEwz?=
 =?utf-8?B?eGNQa2RWdld0SDdRUWVvakw5VGNBaUNlbXdaMHpqL0s1ZkY3M2NtQWFPblVi?=
 =?utf-8?B?WS9jMVEwN2xkcEd5RkF5NkFSYmt3ZmJJY2tPZ1hjdjV5VVV5Z1lFYjU0UFlF?=
 =?utf-8?B?YzNONnZCemh0QXlaSENwK2hsU1VKNmI3eHhiRXRFREs2WEg1ckJSY3ZCcGJp?=
 =?utf-8?B?cUo0R3VLMDNTS2R1cVNZU3hLN01ZVDZ5Q3ZBRGhJNFJQSExRSTV1R3lzYkRF?=
 =?utf-8?B?L1F3MTBqVFZrUFdQM21VYlF5OTQ1alU1OStZWlBldU55elhYVCtIQklYc0F1?=
 =?utf-8?B?dVJ0clNDKzNaU0doQUh5aC9FQjJ6bVVzZHRsNm9Bd2l6aXQ5Vmc4WnFTcERS?=
 =?utf-8?Q?QmodMa1IjSRJQtevK7MjL45zON2CHjhRP7oVxmf?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a87a53-063d-40da-6ad2-08d8ea1c706b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 14:45:14.2342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CGKRiszOt7DtBq/5rSiXWG0N3vtdODXi+/RfqpiF5Jfm8jg862LdgyF0XcpBbkVmcMZXlWllkjYcFBMWZwNbvXV7S1jBHqhGrhH9uem3pxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2610
Received-SPF: pass client-ip=40.107.3.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

17.03.2021 20:15, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   qapi/block-core.json       | 18 +++++----
>   blockdev.c                 | 78 +++++++++++++++++++++++---------------
>   tests/qemu-iotests/155     |  9 +++--
>   tests/qemu-iotests/165     |  4 +-
>   tests/qemu-iotests/245     | 27 +++++++------
>   tests/qemu-iotests/248     |  2 +-
>   tests/qemu-iotests/248.out |  2 +-
>   tests/qemu-iotests/296     |  9 +++--
>   tests/qemu-iotests/298     |  4 +-
>   9 files changed, 92 insertions(+), 61 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9f555d5c1d..9150f765da 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4181,13 +4181,15 @@
>   ##
>   # @x-blockdev-reopen:
>   #
> -# Reopens a block device using the given set of options. Any option
> -# not specified will be reset to its default value regardless of its
> -# previous status. If an option cannot be changed or a particular
> +# Reopens one or more block devices using the given set of options.
> +# Any option not specified will be reset to its default value regardless
> +# of its previous status. If an option cannot be changed or a particular
>   # driver does not support reopening then the command will return an
> -# error.
> +# error. All devices in the list are reopened in one transaction, so
> +# if one of them fails then the whole transaction is cancelled.
>   #
> -# The top-level @node-name option (from BlockdevOptions) must be
> +# The command receives a list of block devices to reopen. For each one
> +# of them, the top-level @node-name option (from BlockdevOptions) must be
>   # specified and is used to select the block device to be reopened.
>   # Other @node-name options must be either omitted or set to the
>   # current name of the appropriate node. This command won't change any
> @@ -4207,8 +4209,8 @@
>   #
>   #  4) NULL: the current child (if any) is detached.
>   #
> -# Options (1) and (2) are supported in all cases, but at the moment
> -# only @backing allows replacing or detaching an existing child.
> +# Options (1) and (2) are supported in all cases. Option (3) is
> +# supported for @file and @backing, and option (4) for @backing only.

A bit of it should be already updated in "[PATCH v4 2/6] block: Allow changing bs->file on reopen"

>   #
>   # Unlike with blockdev-add, the @backing option must always be present
>   # unless the node being reopened does not have a backing file and its
> @@ -4218,7 +4220,7 @@
>   # Since: 4.0
>   ##
>   { 'command': 'x-blockdev-reopen',
> -  'data': 'BlockdevOptions', 'boxed': true }
> +  'data': { 'options': ['BlockdevOptions'] } }
>   
>   ##
>   # @blockdev-del:
> diff --git a/blockdev.c b/blockdev.c
> index 825d40aa11..7019397b05 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3580,46 +3580,64 @@ fail:
>       visit_free(v);
>   }
>   
> -void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
> +void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
>   {
> -    BlockDriverState *bs;
> -    AioContext *ctx;
> -    QObject *obj;
> -    Visitor *v = qobject_output_visitor_new(&obj);
> -    BlockReopenQueue *queue;
> -    QDict *qdict;
> +    BlockReopenQueue *queue = NULL;
> +    GSList *aio_ctxs = NULL;
> +    GSList *visitors = NULL;
> +    GSList *drained = NULL;
>   
> -    /* Check for the selected node name */
> -    if (!options->has_node_name) {
> -        error_setg(errp, "node-name not specified");
> -        goto fail;
> -    }
> +    /* Add each one of the BDS that we want to reopen to the queue */
> +    for (; reopen_list != NULL; reopen_list = reopen_list->next) {
> +        BlockdevOptions *options = reopen_list->value;
> +        BlockDriverState *bs;
> +        AioContext *ctx;
> +        QObject *obj;
> +        Visitor *v;
> +        QDict *qdict;
>   
> -    bs = bdrv_find_node(options->node_name);
> -    if (!bs) {
> -        error_setg(errp, "Failed to find node with node-name='%s'",
> +        /* Check for the selected node name */
> +        if (!options->has_node_name) {
> +            error_setg(errp, "node-name not specified");
> +            goto fail;
> +        }
> +
> +        bs = bdrv_find_node(options->node_name);
> +        if (!bs) {
> +            error_setg(errp, "Failed to find node with node-name='%s'",
>                      options->node_name);
> -        goto fail;
> +            goto fail;
> +        }
> +
> +        v = qobject_output_visitor_new(&obj);
> +        visitors = g_slist_prepend(visitors, v);

I'd better just call visit_free inside the block instead of putting v to list be freed later after the block..

> +
> +        /* Put all options in a QDict and flatten it */
> +        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> +        visit_complete(v, &obj);
> +        qdict = qobject_to(QDict, obj);
> +
> +        qdict_flatten(qdict);
> +
> +        ctx = bdrv_get_aio_context(bs);
> +        if (!g_slist_find(aio_ctxs, ctx)) {
> +            aio_ctxs = g_slist_prepend(aio_ctxs, ctx);
> +            aio_context_acquire(ctx);
> +        }
> +        bdrv_subtree_drained_begin(bs);

I expect Kevin will complain that aquiring several context and drain them all is a bad idea as it leads to deadlocks..
For more information look at the branches
   [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all contexts
amd
   [PATCH v2 30/36] block: bdrv_reopen_multiple: refresh permissions on updated graph

So, probably here we should acquire context in a loop to call bdrv_reopen_queue() (which I think shoud not require drained section).

And then, bdrv_reopen_multiple() is called with no aio context acquired, and no drained section.. And it shoud be refactored to properly operate with acquiring and realeasing the contexts and drained sections when needed...

(note preexisting problem of reopen, that during reopen the whole tree may be moved to another aio context, but we continue operations with acquired old aio context which is wrong).


> +        queue = bdrv_reopen_queue(queue, bs, qdict, false);
> +        drained = g_slist_prepend(drained, bs);
>       }
>   
> -    /* Put all options in a QDict and flatten it */
> -    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> -    visit_complete(v, &obj);
> -    qdict = qobject_to(QDict, obj);
> -
> -    qdict_flatten(qdict);
> -
>       /* Perform the reopen operation */
> -    ctx = bdrv_get_aio_context(bs);
> -    aio_context_acquire(ctx);
> -    bdrv_subtree_drained_begin(bs);
> -    queue = bdrv_reopen_queue(NULL, bs, qdict, false);
>       bdrv_reopen_multiple(queue, errp);
> -    bdrv_subtree_drained_end(bs);
> -    aio_context_release(ctx);
> +    queue = NULL;
>   
>   fail:
> -    visit_free(v);
> +    bdrv_reopen_queue_free(queue);
> +    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
> +    g_slist_free_full(aio_ctxs, (GDestroyNotify) aio_context_release);
> +    g_slist_free_full(visitors, (GDestroyNotify) visit_free);
>   }
>   


-- 
Best regards,
Vladimir

