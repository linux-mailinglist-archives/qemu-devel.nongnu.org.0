Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52B2F9C3B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:17:55 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Rbe-0004m6-5f
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1RZU-0003nL-9K; Mon, 18 Jan 2021 05:15:42 -0500
Received: from mail-eopbgr150110.outbound.protection.outlook.com
 ([40.107.15.110]:55344 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1RZH-0005Qb-Co; Mon, 18 Jan 2021 05:15:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL+WZehb5RurrhNMELn8ybldpo+Gjni4vaaJ3PVdD4Ro1Bc9OkedoCNS7sjrHxpGJQHb6Hj4yeOJl+kiH23EuZASuLbN8/CLRf4HOyr3WpvUWzRTIWRsNAflApLW+RvTpTcyMtGeMDsOp3a35mFOU2+G6Eva/f+iR071GcV06az0rUV86QBwPVLplFTA3uOE/iqnjSGteQ/tDxaQBfxB8G1M9clKCWGbZsCN5i5SFU9z1x/hVKxdWIflfpA3k3QyQMCq9rlZay9PDSnxA30dCSiBx/vfyvHNCqs9YyK3T+opZ0KSPADlhTxgAs1AsEttl3lzJdkM5wURD93VJOoZuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rhl2nGWjrLOZf4dZIKXDEISdj5+Unheruq/MiYlzxoQ=;
 b=kp9tRp3UQINN3HYDObuj20518ug3rkZFyZ3lsAEY3qYMsGM8khKR2OXrHqREWqFRDOhxlN/dOTuWDEzHnJG0lWB0+frNZQ/PX5IPyon5+nXAT82rz9NZ3obNrYmzopDP2q6GB0x/rUmmQRRVh8O/Mm8cGAB3mNU2G9mC+ZAt4tug/ffeDjUS8ShJNCsay4n8AZtCpm2BwkFH2szQwhSrP3b3RZaP51ZJu7KlIOIhfrjz1yYw8AB1YvuVcvGUaEi5wcV+vjEA8+SkwBJu/nrnz2IwJhQFr5x/PK/gmLXbBMEzte1wZce+moWcZ7DxjwwpIKbSI7HmMuP7zs96C+G5Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rhl2nGWjrLOZf4dZIKXDEISdj5+Unheruq/MiYlzxoQ=;
 b=EAlv0xrdfFJvJgQUcwx/ju1+Y6XC0NLRX8fNSeXM1iW0bJZwEfV6GIL2AAH6qZeTnphgmbGhJydyhtAwmmo70QVBGv9Gh59dDpj81zG4dxWXC53tzXn6K/AogTqwJJbDRi9NjktPca1XR7Zu3Q0XWO17gOrEe3sqrWVuOhBA/EY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4088.eurprd08.prod.outlook.com (2603:10a6:20b:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 10:15:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 10:15:19 +0000
Subject: Re: [RFC PATCH 1/2] block: Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
References: <cover.1610715661.git.berto@igalia.com>
 <1a9b457d93c0732e8e4785a0cc4b5f3b935f2cf6.1610715661.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <53852b77-1b29-0c27-0083-ac6e263b560e@virtuozzo.com>
Date: Mon, 18 Jan 2021 13:15:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <1a9b457d93c0732e8e4785a0cc4b5f3b935f2cf6.1610715661.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.116]
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.116) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Mon, 18 Jan 2021 10:15:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c703ab3-97b1-46b3-4dee-08d8bb99f544
X-MS-TrafficTypeDiagnostic: AM6PR08MB4088:
X-Microsoft-Antispam-PRVS: <AM6PR08MB408835CE41F8D6A561AEBEAAC1A40@AM6PR08MB4088.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zP/KGUWCrTB03sQH8yRZkpYOe/6dX2/MiewRhXc31HYVlGuaeuIr96byQ8eo4sTSQ+qfzKDNxB3rBELjXtLM8FTy7+i5+/upxXzaA+vS5acmanhdF/mvbE3l23i9QDIRW+Qxfc46VrPOEQIM+TcgWSimGeS2c0WYrTx/pvniIXt8o/7uuH7/xAuvkbV9JX0ew6Jk6jH+AFFZY2egldUtLs7eAe5kofjO43Jnmi/KtRAYjJhrQRDswsyqbpPWpsl5XfLVimfb0c1wl9T0LQz9GfL94lrVWQ9kRN9jeUiAu44jLcvBadZAek92uSwkaEGjkMSdwjgUIW/zultlhIL5LJxJkMY+GeM3hEvK4YGDiAk4WXJ8NUsa2OqEDpKpLEhEqpWxg+gcQVqdMlMRvftJp2QpfsoUeAIzztemyd0RASAohvvUAp2aWCt+QUOU+VSovkNcKsZEEs0h2O5sSK3cvRX/jLCIUCaeuqKBoY8TnNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(66476007)(54906003)(66946007)(2616005)(8676002)(66556008)(83380400001)(316002)(186003)(6486002)(16526019)(16576012)(52116002)(956004)(86362001)(36756003)(8936002)(478600001)(31696002)(31686004)(5660300002)(26005)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEFGM1J5L25xSnE3OW9SbEJBT1NQYTZlRk44cDJpQXlhSDBZWDFYVEJiRFlJ?=
 =?utf-8?B?ZWpyUm1PMllFVGFodnVka2Q0WEFnRDNURnM0SkVFOHFHL3ZjSjVNVjdQWGpH?=
 =?utf-8?B?WndhQTVuSUFQM2lBTlpoaEZpeG92TWozSWFDMUpZbTMzRU1lUTlSNG5MeEUr?=
 =?utf-8?B?RnF4T09xMW82QStTeDAwd2RLN0xvOERnMzNJc1crZUxsYjY3U1MvS0xCZzlG?=
 =?utf-8?B?SWd1YWsrQ2pkbDNDcWtwd0thN3U5VUVMWW8vOGVsbElFUTczbko2K3JoUDRj?=
 =?utf-8?B?Vng0bzlsU1JEQitwMXpRNHY0Kzhta1ROK1VRaStTV2l5NTJoQ0xnT3VwL0p3?=
 =?utf-8?B?VmVrcnk2MVhFMFB5cnZhcWFPQ3VLQi84MXBjcnp1eHN2RWJ2eWtEYytFeGhz?=
 =?utf-8?B?ems3SGtxRllCNkRxbE5pSXNMd09rZkRiNmZqUmlhaVJxTVhTaDUxb3NPYkVE?=
 =?utf-8?B?RjBwR3JxVkpLZ3A2cjkwK2dNcHE3MEppaHNvTmhGc2JVUldvT2RDZWk5d2RC?=
 =?utf-8?B?bXpqQTRLS3hoaCsxenRHNExKM1FXaGx6VWRubUI5V25TUy9BUkp4U2pXcDZO?=
 =?utf-8?B?UkpSRDNYTzQ1UGNUS2xDclkzRzRiNk9DTGhBVGdyc2kwdWxBY2hkemFPVm1N?=
 =?utf-8?B?L0V3Wi9sQ3gyaWJMOFhmcHNzOFBTWnRJMXhad3lZMHA0a1M1d21laXVFNmZM?=
 =?utf-8?B?bklYenpWUkU4SzZwc002NmFhVnk0bnFTUHVEbmlCNW1LM2JCOFU3MEtuVlFP?=
 =?utf-8?B?RVJrSTM5UVluUUlZQTVlRjZtbEk4ZXA4ZnNROTFHaDNUTGdUaEFQWk5nVnNj?=
 =?utf-8?B?Z0pNazVmdm9IekZwQTFiUXhBblhRYVAzZFBLbDIwcTJQVjB0eFprdithT3Zj?=
 =?utf-8?B?dGVPSlkxQlNhSzFDRjZtMk5tcjlFUDVGU0hiZFE1TlMyRlRmRmdyRVlLc3N1?=
 =?utf-8?B?M2pnYVd2V01EbWRjMHBWbTdpSDhrV1FrbFhOaXdLWWxabUFRcGdDbUNtUVNP?=
 =?utf-8?B?a29XMXZDbVNnT3BTNUw2ZGgwZWt4NDAvYVB1NUdETGRpcHNlNUpoUi93VmFj?=
 =?utf-8?B?YUlnS0txZnVyN2czYUhQN0c4RDlOeVRzcEhmejQzS1VmVmNoKzd0UzYrY0ZT?=
 =?utf-8?B?SCtWSzV0OGtFYlQwTHdaaGgrcmhKeWNoNjQ4eW45NjZ2eWQ4N08yVWV0MXFj?=
 =?utf-8?B?V0tlTkt0STFRblVRZ1haZi8xOWY1RXBENFR0eU1yY1dTdHdYbjJxN051Z2hQ?=
 =?utf-8?B?TnpUcUN5Q3IrVVdZaDRkdkloeDBaMTc1RlhZSTNkL29QUDI2cWNhaTFpUStU?=
 =?utf-8?Q?csihAtkRIa/35FeIEhFazeQ6jE04fStZI1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c703ab3-97b1-46b3-4dee-08d8bb99f544
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 10:15:19.3768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBmnXpIxgZTwBFr+zAhEwpPMKbeZOM64Zg/cnPLu1HWIJq8Lwv3Ox6NeljYI1zspiWyAKd6A1a9j9OqxMn9owGxuDFPk+sqT9vHKkLjObjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4088
Received-SPF: pass client-ip=40.107.15.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

15.01.2021 16:02, Alberto Garcia wrote:
> When the x-blockdev-reopen was added it allowed reconfiguring the
> graph by replacing backing files, but changing the 'file' option was
> forbidden. Because of this restriction some operations are not
> possible, notably inserting and removing block filters.
> 
> This patch adds support for replacing the 'file' option. This is
> similar to replacing the backing file and the user is likewise
> responsible for the correctness of the resulting graph, otherwise this
> can lead to data corruption.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>	
> ---
>   include/block/block.h  |  1 +
>   block.c                | 61 ++++++++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/245 |  7 ++---
>   3 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 82271d9ccd..6dd687a69e 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -196,6 +196,7 @@ typedef struct BDRVReopenState {
>       bool backing_missing;
>       bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
>       BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
> +    BlockDriverState *old_file_bs;    /* keep pointer for permissions update */
>       uint64_t perm, shared_perm;
>       QDict *options;
>       QDict *explicit_options;
> diff --git a/block.c b/block.c
> index 576b145cbf..114788e58e 100644
> --- a/block.c
> +++ b/block.c
> @@ -3978,6 +3978,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>               refresh_list = bdrv_topological_dfs(refresh_list, found,
>                                                   state->old_backing_bs);
>           }
> +        if (state->old_file_bs) {
> +            refresh_list = bdrv_topological_dfs(refresh_list, found,
> +                                                state->old_file_bs);
> +        }
>       }
>   
>       ret = bdrv_list_refresh_perms(refresh_list, bs_queue, &tran, errp);
> @@ -4196,6 +4200,57 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>       return 0;
>   }
>   
> +static int bdrv_reopen_parse_file(BDRVReopenState *reopen_state,
> +                                  GSList **tran,
> +                                  Error **errp)
> +{
> +    BlockDriverState *bs = reopen_state->bs;
> +    BlockDriverState *new_file_bs;
> +    QObject *value;
> +    const char *str;
> +
> +    value = qdict_get(reopen_state->options, "file");
> +    if (value == NULL) {
> +        return 0;
> +    }
> +
> +    /* The 'file' option only allows strings */
> +    assert(qobject_type(value) == QTYPE_QSTRING);
> +
> +    str = qobject_get_try_str(value);
> +    new_file_bs = bdrv_lookup_bs(NULL, str, errp);
> +    if (new_file_bs == NULL) {
> +        return -EINVAL;
> +    } else if (bdrv_recurse_has_child(new_file_bs, bs)) {
> +        error_setg(errp, "Making '%s' a file of '%s' "
> +                   "would create a cycle", str, bs->node_name);
> +        return -EINVAL;
> +    }
> +
> +    assert(bs->file && bs->file->bs);

why are we sure at this point? Probably, we should just return an error..

> +
> +    /* If 'file' points to the current child then there's nothing to do */
> +    if (bs->file->bs == new_file_bs) {
> +        return 0;
> +    }
> +
> +    /* Check AioContext compatibility */
> +    if (!bdrv_reopen_can_attach(bs, bs->file, new_file_bs, errp)) {
> +        return -EINVAL;
> +    }
> +
> +    /* At the moment only backing links are frozen */
> +    assert(!bs->file->frozen);

I think it can: file-child based filters can be a part of frozen backing chain currently.

> +
> +    /* Store the old file bs because we'll need to refresh its permissions */
> +    reopen_state->old_file_bs = bs->file->bs;
> +
> +    /* And finally replace the child */
> +    bdrv_replace_child(bs->file, new_file_bs, tran);
> +
> +    return 0;
> +}
> +
>   /*
>    * Prepares a BlockDriverState for reopen. All changes are staged in the
>    * 'opaque' field of the BDRVReopenState, which is used and allocated by
> @@ -4347,6 +4402,12 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>       }
>       qdict_del(reopen_state->options, "backing");
>   
> +    ret = bdrv_reopen_parse_file(reopen_state, set_backings_tran, errp);
> +    if (ret < 0) {
> +        goto error;
> +    }
> +    qdict_del(reopen_state->options, "file");
> +
>       /* Options that are not handled are only okay if they are unchanged
>        * compared to the old state. It is expected that some options are only
>        * used for the initial open, but not reopen (e.g. filename) */
> diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
> index e60c8326d3..f9d68b3958 100755
> --- a/tests/qemu-iotests/245
> +++ b/tests/qemu-iotests/245
> @@ -145,8 +145,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
>           self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
>           self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
> -        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
> -        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
> +        self.reopen(opts, {'file': 'not-found'}, "Cannot find device= nor node_name=not-found")
> +        self.reopen(opts, {'file': ''}, "Cannot find device= nor node_name=")
>           self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
>           self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
>           self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
> @@ -454,7 +454,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           # More illegal operations
>           self.reopen(opts[2], {'backing': 'hd1'},
>                       "Making 'hd1' a backing file of 'hd2' would create a cycle")
> -        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
> +        self.reopen(opts[2], {'file': 'hd0-file'},
> +                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
>   
>           result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
>           self.assert_qmp(result, 'error/class', 'GenericError')
> 


-- 
Best regards,
Vladimir

