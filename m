Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73446314B0D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:09:22 +0100 (CET)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9P1N-0002Oy-6x
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9NzM-0005WC-Uo; Tue, 09 Feb 2021 03:03:13 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:12525 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9NzJ-0001Ce-8K; Tue, 09 Feb 2021 03:03:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtrSRnxK/GegxCx2ZhazcfgPtBDZgb77dugHtuO2KcGp8t6XMLxeAcxtMXtQ7qbRUkofxlrxdYoFWP/qswpL2OVoXo/1rOd2oUmBehBOk2td8QmhKPYbdDKmgEPwovAHX5lz9je3OTO0jOWyh4XpYsi7Ni0p81aZQ87Sjzg/2W+2S2re9+YEj151SKv53uCmKAjOUwr9H9E73K5/DWjBwHpG2joLl/j0ToLADYuNkTE4YgDQ+iVwn+9Op+EvY5ZFTsOGiMEGMIdzjH9bfTbjZm2fmT077+pVc4c1GXxzaUE6y2owW9FfIG7RyMXsp1q3TiiGJbSfBtqFONG8o53x8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW3iO977nQmZ/VFJhBkY+oHz8BZJny/wGBxK1XHqHlo=;
 b=d5YVwMElz431Cm9wgzdlxfeY7CrQKdIEDr2nxRc+/B3SYTgOz3YF7dMI/Y1iJBbcwxq5za/FGePI1Q4QrB1VH5k2TPS1iYhrbALEGeLR9bS6SX52+rQTvbrQ6nkWP8RFNyXguGUwmzilpq2mKDuE3SOPp1n/y/liZL7cs3zr8Im9FSIxi5+Z/4s8KlJeb2feHtHTLmQSrD/d4wRgf/ic5dQZxNnfroPK+oBaeSbW6MdRUvm86SOxjdMPzeKHghI5GhEzZ5277DxyQxJ1hWAdDDK7qbNa7kKwEVXgT3qY8l92U46l/REiAbZ8GhLXY/mGly7kANJVKVlcXbn75V7hZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dW3iO977nQmZ/VFJhBkY+oHz8BZJny/wGBxK1XHqHlo=;
 b=n1v9BYga7H0pdswzzmdplD2snTG2dMeGbc5aWAzVSoL1ThZIE8IuEwopVKJdw6qBxPMoiaFgMtRBPho7yHlFe8mSHAcI45dMb/csS2l9umEIQV7cXg6NW5Qb6q/pLaRMLn1EA7hm8Am2j5X1JNg07y5kZF51ex1BJCK49eiBgzM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Tue, 9 Feb
 2021 08:03:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 08:03:05 +0000
Subject: Re: [RFC PATCH v2 3/4] block: Support multiple reopening with
 x-blockdev-reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1612809837.git.berto@igalia.com>
 <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <06587add-3242-6041-6a76-e2fd41e8c040@virtuozzo.com>
Date: Tue, 9 Feb 2021 11:03:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <145882bca942bb629bce2b1f5546fe0946ccdfcd.1612809837.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR02CA0214.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR02CA0214.eurprd02.prod.outlook.com (2603:10a6:20b:28f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Tue, 9 Feb 2021 08:03:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a630447f-8554-41bf-84cf-08d8ccd12108
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720A8AED5A9BEC6858B2D9DC18E9@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Xx68QBvHHNDQqxbag075mRQQuZemPrgKq1mCg+iXvHORuBBYwum9POQ1y75Xf/9cMDkIO43C0Y2x6KVEbBFY/EJ9O2Buv3qBIrOwS4njCU24Gds9tr4mOxRSTxPIc7Yn2jK+CBWJd7yE9tf7AOzLWyQcKr0sLhMVlSKF3//Q/7wwF2n95KjZWCkbnkCXB1Vp5+gm8zk+MicxmvlTtRg+nMjcGqR/ix32TXObZWHGD4ZkiH23xA5unA9eWapfSAtHaXCIACVNmhEPb1XAp6DXFdix6Bxig4abjwhUz7qu56HHjJa9Go+R0XTz+RR9CD9yEsQXmkTR6xdP/hQh7GuORZxNXTXsCdSXmktBTA6K5MaCV6BPsVi3GDjW0XJEIKEXPMXTijzb2Eh/2eBXU63ou2u4xAsnUBFZNWyM/GErBuboQblflua4lgpyaQw9H3ZxEd9jnVBQLu/y9yCwubCnx7KrwF/FlnvztDR9I8R93sQ8wLj65rMZWNUJUf6ZCNj+Cn2k81nzywWLPz7eSku61sbkLzGSfMvEvGHlyXyoQePSYYx27qAYBoBKyZH67bUyo4bJUG7ri07T1S3rfFpRdrDDuGpxP1PJqHnTOhokdU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(66556008)(66476007)(66946007)(2906002)(478600001)(186003)(2616005)(956004)(8676002)(26005)(30864003)(6486002)(4326008)(16526019)(31686004)(16576012)(31696002)(316002)(8936002)(54906003)(83380400001)(52116002)(5660300002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDdHVUFYbW5TcFg2dnNHK2hPVk12U1phZDZCTE01bm9sd0tOZkJwb0hCZUZK?=
 =?utf-8?B?eUNXUGN6Ynp6cFZPRG9WcnVLd08xWlJ1SGo5d2ZJK1JDdjVYZzRGVGNPSi9Q?=
 =?utf-8?B?cU5jK0k3d1JMRmkvRURqN2h2ckswc1d3SnhMWURReThib05NdTdBUzBCNHA4?=
 =?utf-8?B?OGZaSWJXWEI0NVFZWVBNL1lXcVZhNGhZM0tjK1huM1RyZ01QRTB2amJGamtE?=
 =?utf-8?B?TFkrUkZaanhLRmxZV0diRUU3M2sxK1hBM3pXam4wWHBuT2VSMEowTXpEN2xj?=
 =?utf-8?B?ZTJDL29lcTl6SzdGL0taeTl2b0gzbVRzd1BqcFFvVjJwTGVmS242bGlNTUwv?=
 =?utf-8?B?SU9rSGNrNWtnQVlhaUhCditLeGNZLzU3Nno5SUxXY2E3V2pjV3ZZT1RtZmFJ?=
 =?utf-8?B?ZnZvbkEvenh4eDZUUUtEb24yU0lUNkVUZXhoL3RRM0pBK3FYQXZnSGxXVW9y?=
 =?utf-8?B?L3ZBSWRkOXdEL3VFZko3SEFFeTY4Y0JjaUdZWE84UURPTUdZWmZJNEY4RjZi?=
 =?utf-8?B?V0tWYjV4RHNNejRmc2JTdTdWK3k3STB2N3MwNGU4VXREN0tpWmxWVExrK2tY?=
 =?utf-8?B?VFVseTE2cGpUMXhzRGo3d0ZFRWMrdVEvSDJ6K1ZZU0NvOUoyUUlsUUZ0bVdM?=
 =?utf-8?B?anNpMk1sRUZjVFRRTFcrZUN6RUptL0UzZlJKUmRCZUwvWlY5NEZUamJ2TmVq?=
 =?utf-8?B?emhndkRxY2dDMXJRMXFZZ1NoaHJYRkhYSFMyK1N3NnhTMU1BRmVHdnBDQmJ5?=
 =?utf-8?B?TG5hWU53QWpPWVhjMC9xQ3E2NitXWk9WWngyZklTTHp4aWNWNllRVE1NNFhh?=
 =?utf-8?B?MzdZVm5HQjVpWFgrZFFuNjhiNUplVTlrV1dQcWRNVTZEYzM0K3JWVlZWVWZL?=
 =?utf-8?B?aDFIZ0FhOUJEdnAxeE0xNmQvLys0UWQ5SkNIb3JmVlNPaGZscHJiNDltbWhn?=
 =?utf-8?B?NHRobHIra3VkMHlPWW1tMmNEVEVCMjJhZXc0R2ZjTW5GQ2c2ZEdYcVFiZll1?=
 =?utf-8?B?eThydEppQUJzRVV5RExwamMyMEQ0ejAxVnFvVThBZE9oN21wKzRDclFGT212?=
 =?utf-8?B?Z3o4emplMFJ0MDBKRkZjcDNCbXZlT05YcnlIekhpVHNXZ2k2M1V3dHVOY25Q?=
 =?utf-8?B?VTlUVndwVjZzeHBmVytOanFEaGFDMnpnV0ViWUF1UXh4WGNGVUYyb2l2cHJj?=
 =?utf-8?B?bWdpZEYvY1Yyd2ZMM25ScUgrTVRpNnNoa2xKN21vZC8wY3Z3YlBSakR1bkFX?=
 =?utf-8?B?UE5ReUNNa2FXTGRnb0l1MVBPSDlCaVlZOVZGM2lOanBRVTQwdFN5YTBjL0Fx?=
 =?utf-8?B?REhCelRINVZBbXpGaWlkc21NVFRZMXFEbVdOcndReTJ0N2h5SEZJenRZc3o5?=
 =?utf-8?B?dFR1VUdiRUR5QysvK0pEbzIvRTVGbS9VWDkwQU5qUS9WSGZEUHBkUHRXN3NV?=
 =?utf-8?B?dUNJNjN0Qjh1bEQvSlhvOTFJZTZZbS9iWGZTMlF3SVNrMXJsVHZ3WFE1a1J2?=
 =?utf-8?B?TU1VamJxNnVYdkg5MVN2RWVOR21CTEM5ZmE2ZkNSZUVhZWh0aTdwd3lzRDJK?=
 =?utf-8?B?ak1sNC8rQ2tOU2Z5dDc5bGFaaFBIZ3lSdkovRS8rSVV1SDR3eVpneFdrdE5i?=
 =?utf-8?B?RlRwNkZnT3ZJK0J2SS9ndS9XTlh4WjhPNExtRVcwd1d6VUxyWHhPaHZSbGJO?=
 =?utf-8?B?Z093RE1pN2pmZzZrbjA1RWVpeG9JcnNWRGlmYmNKSTlZNFFPb0EyWkc2aXp0?=
 =?utf-8?Q?BsgNv3BAz7wShoMs451I7BPmT4g1WskdNn6vfaI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a630447f-8554-41bf-84cf-08d8ccd12108
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 08:03:04.8995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmHMeV3VL0AbZcgR4hvuZsXruQ9qhtctx1UcrVW2HaW+gQwn3G9piR57kVX2lCtXE8hK5Bbc96AmuqZxFAPyTgXFeK4Zkf2iS0rZ57OiMXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7,
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

08.02.2021 21:44, Alberto Garcia wrote:
> Signed-off-by: Alberto Garcia <berto@igalia.com>
> ---
>   qapi/block-core.json       |  2 +-
>   include/block/block.h      |  1 +
>   block.c                    | 16 +++++--
>   blockdev.c                 | 85 +++++++++++++++++++++-----------------
>   tests/qemu-iotests/155     |  9 ++--
>   tests/qemu-iotests/165     |  4 +-
>   tests/qemu-iotests/245     | 27 +++++++-----
>   tests/qemu-iotests/248     |  2 +-
>   tests/qemu-iotests/248.out |  2 +-
>   tests/qemu-iotests/298     |  4 +-
>   10 files changed, 89 insertions(+), 63 deletions(-)
> 
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index c0e7c23331..b9fcf20a81 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -4177,7 +4177,7 @@
>   # Since: 4.0
>   ##
>   { 'command': 'x-blockdev-reopen',
> -  'data': 'BlockdevOptions', 'boxed': true }
> +  'data': { 'options': ['BlockdevOptions'] } }

Do we also want to drop x- prefix?

>   
>   ##
>   # @blockdev-del:
> diff --git a/include/block/block.h b/include/block/block.h
> index 6dd687a69e..fe4a220da9 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -372,6 +372,7 @@ BlockDriverState *bdrv_new_open_driver(BlockDriver *drv, const char *node_name,
>   BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
>                                       BlockDriverState *bs, QDict *options,
>                                       bool keep_old_opts);
> +void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue);
>   int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp);
>   int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
>                                 Error **errp);
> diff --git a/block.c b/block.c
> index 19b62da4af..b4fef2308f 100644
> --- a/block.c
> +++ b/block.c
> @@ -3933,6 +3933,17 @@ BlockReopenQueue *bdrv_reopen_queue(BlockReopenQueue *bs_queue,
>                                      NULL, 0, keep_old_opts);
>   }
>   
> +void bdrv_reopen_queue_free(BlockReopenQueue *bs_queue)
> +{
> +    if (bs_queue) {
> +        BlockReopenQueueEntry *bs_entry, *next;
> +        QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
> +            g_free(bs_entry);
> +        }
> +        g_free(bs_queue);
> +    }
> +}
> +
>   /*
>    * Reopen multiple BlockDriverStates atomically & transactionally.
>    *
> @@ -4024,10 +4035,7 @@ abort:
>       }
>   
>   cleanup:
> -    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
> -        g_free(bs_entry);
> -    }
> -    g_free(bs_queue);
> +    bdrv_reopen_queue_free(bs_queue);

this may be a separate patch

>   
>       return ret;
>   }
> diff --git a/blockdev.c b/blockdev.c
> index 098a05709d..6b688c0f73 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -3528,38 +3528,16 @@ fail:
>       visit_free(v);
>   }
>   
> -void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
> +void qmp_x_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
>   {
> -    BlockDriverState *bs;
> -    QObject *obj;
> -    Visitor *v = qobject_output_visitor_new(&obj);
> -    BlockReopenQueue *queue;
> -    QDict *qdict;
> -
> -    /* Check for the selected node name */
> -    if (!options->has_node_name) {
> -        error_setg(errp, "Node name not specified");
> -        goto fail;
> -    }
> -
> -    bs = bdrv_find_node(options->node_name);
> -    if (!bs) {
> -        error_setg(errp, "Cannot find node named '%s'", options->node_name);
> -        goto fail;
> -    }
> -
> -    /* Put all options in a QDict and flatten it */
> -    visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> -    visit_complete(v, &obj);
> -    qdict = qobject_to(QDict, obj);
> -
> -    qdict_flatten(qdict);
> -
> -    /* Perform the reopen operation */
> +    BlockReopenQueue *queue = NULL;
> +    GSList *aio_ctxs = NULL;
> +    GSList *visitors = NULL;
> +    GSList *drained = NULL;
>       BdrvNextIterator it;
> -    GSList *aio_ctxs = NULL, *ctx;
>       BlockDriverState *it_bs;
>   
> +    /* Acquire all AIO contexts */
>       for (it_bs = bdrv_first(&it); it_bs; it_bs = bdrv_next(&it)) {
>           AioContext *aio_context = bdrv_get_aio_context(it_bs);
>   
> @@ -3569,19 +3547,50 @@ void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
>           }
>       }
>   
> -    bdrv_subtree_drained_begin(bs);
> -    queue = bdrv_reopen_queue(NULL, bs, qdict, false);
> +    /* Add each one of the BDS that we want to reopen to the queue */
> +    for (; reopen_list != NULL; reopen_list = reopen_list->next) {
> +        BlockdevOptions *options = reopen_list->value;
> +        QDict *qdict;
> +        Visitor *v;
> +        BlockDriverState *bs;
> +        QObject *obj;
> +
> +        /* Check for the selected node name */
> +        if (!options->has_node_name) {
> +            error_setg(errp, "Node name not specified");
> +            goto fail;
> +        }
> +
> +        bs = bdrv_find_node(options->node_name);
> +        if (!bs) {
> +            error_setg(errp, "Cannot find node named '%s'", options->node_name);
> +            goto fail;
> +        }
> +
> +        v = qobject_output_visitor_new(&obj);
> +        visitors = g_slist_prepend(visitors, v);
> +
> +        /* Put all options in a QDict and flatten it */
> +        visit_type_BlockdevOptions(v, NULL, &options, &error_abort);
> +        visit_complete(v, &obj);
> +        qdict = qobject_to(QDict, obj);
> +
> +        qdict_flatten(qdict);
> +
> +        bdrv_subtree_drained_begin(bs);
> +        queue = bdrv_reopen_queue(queue, bs, qdict, false);
> +        drained = g_slist_prepend(drained, bs);
> +    }
> +
> +    /* Perform the reopen operation */
>       bdrv_reopen_multiple(queue, errp);
> -    bdrv_subtree_drained_end(bs);
> -
> -    for (ctx = aio_ctxs; ctx != NULL; ctx = ctx->next) {
> -        AioContext *aio_context = ctx->data;
> -        aio_context_release(aio_context);
> -    }
> -    g_slist_free(aio_ctxs);
> +    queue = NULL;
>   
>   fail:
> -    visit_free(v);
> +    bdrv_reopen_queue_free(queue);
> +    g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
> +    g_slist_free_full(aio_ctxs, (GDestroyNotify) aio_context_release);
> +    g_slist_free_full(visitors, (GDestroyNotify) visit_free);

Probably you can use g_autoslist() for defining these lists to get automatic cleanup.

>   }
>   
>   void qmp_blockdev_del(const char *node_name, Error **errp)
> diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
> index 988f986144..5271f9541f 100755
> --- a/tests/qemu-iotests/155
> +++ b/tests/qemu-iotests/155
> @@ -260,9 +260,12 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
>               result = self.vm.qmp('blockdev-add', node_name="backing",
>                                    driver="null-co")
>               self.assert_qmp(result, 'return', {})
> -            result = self.vm.qmp('x-blockdev-reopen', node_name="target",
> -                                 driver=iotests.imgfmt, file="target-file",
> -                                 backing="backing")
> +            result = self.vm.qmp('x-blockdev-reopen', options = [{
> +                                     'node-name': "target",
> +                                     'driver': iotests.imgfmt,
> +                                     'file': "target-file",
> +                                     'backing': "backing"
> +                                 }])
>               self.assert_qmp(result, 'return', {})
>   
>   class TestBlockdevMirrorReopenIothread(TestBlockdevMirrorReopen):
> diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
> index fb56a769b4..32db5086e1 100755
> --- a/tests/qemu-iotests/165
> +++ b/tests/qemu-iotests/165
> @@ -136,7 +136,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
>           assert sha256_1 == self.getSha256()
>   
>           # Reopen to RW
> -        result = self.vm.qmp('x-blockdev-reopen', **{
> +        result = self.vm.qmp('x-blockdev-reopen', options = [{
>               'node-name': 'node0',
>               'driver': iotests.imgfmt,
>               'file': {
> @@ -144,7 +144,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
>                   'filename': disk
>               },
>               'read-only': False
> -        })
> +        }])
>           self.assert_qmp(result, 'return', {})
>   
>           # Check that bitmap is reopened to RW and we can write to it.
> diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
> index bad6911f0c..850c9f070b 100755
> --- a/tests/qemu-iotests/245
> +++ b/tests/qemu-iotests/245
> @@ -84,8 +84,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>                            "Expected output of %d qemu-io commands, found %d" %
>                            (found, self.total_io_cmds))
>   
> -    # Run x-blockdev-reopen with 'opts' but applying 'newopts'
> -    # on top of it. The original 'opts' dict is unmodified
> +    # Run x-blockdev-reopen on a list of block devices
> +    def reopenMultiple(self, opts, errmsg = None):
> +        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, options = opts)
> +        if errmsg:
> +            self.assert_qmp(result, 'error/class', 'GenericError')
> +            self.assert_qmp(result, 'error/desc', errmsg)
> +        else:
> +            self.assert_qmp(result, 'return', {})
> +
> +    # Run x-blockdev-reopen on a single block device (specified by
> +    # 'opts') but applying 'newopts' on top of it. The original 'opts'
> +    # dict is unmodified
>       def reopen(self, opts, newopts = {}, errmsg = None):
>           opts = copy.deepcopy(opts)
>   
> @@ -100,12 +110,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>                   subdict = opts[prefix]
>               subdict[key] = value
>   
> -        result = self.vm.qmp('x-blockdev-reopen', conv_keys = False, **opts)
> -        if errmsg:
> -            self.assert_qmp(result, 'error/class', 'GenericError')
> -            self.assert_qmp(result, 'error/desc', errmsg)
> -        else:
> -            self.assert_qmp(result, 'return', {})
> +        self.reopenMultiple([ opts ], errmsg)
>   
>   
>       # Run query-named-block-nodes and return the specified entry
> @@ -141,10 +146,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           # We cannot change any of these
>           self.reopen(opts, {'node-name': 'not-found'}, "Cannot find node named 'not-found'")
>           self.reopen(opts, {'node-name': ''}, "Cannot find node named ''")
> -        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'node-name', expected: string")
> +        self.reopen(opts, {'node-name': None}, "Invalid parameter type for 'options[0].node-name', expected: string")
>           self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
>           self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
> -        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
> +        self.reopen(opts, {'driver': None}, "Invalid parameter type for 'options[0].driver', expected: string")
>           self.reopen(opts, {'file': 'not-found'}, "Cannot find device= nor node_name=not-found")
>           self.reopen(opts, {'file': ''}, "Cannot find device= nor node_name=")
>           self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
> @@ -153,7 +158,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           self.reopen(opts, {'file.filename': hd_path[1]}, "Cannot change the option 'filename'")
>           self.reopen(opts, {'file.aio': 'native'}, "Cannot change the option 'aio'")
>           self.reopen(opts, {'file.locking': 'off'}, "Cannot change the option 'locking'")
> -        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'file.filename', expected: string")
> +        self.reopen(opts, {'file.filename': None}, "Invalid parameter type for 'options[0].file.filename', expected: string")
>   
>           # node-name is optional in BlockdevOptions, but x-blockdev-reopen needs it
>           del opts['node-name']
> diff --git a/tests/qemu-iotests/248 b/tests/qemu-iotests/248
> index 18ba03467e..2b43853183 100755
> --- a/tests/qemu-iotests/248
> +++ b/tests/qemu-iotests/248
> @@ -62,7 +62,7 @@ vm.get_qmp_events()
>   
>   del blockdev_opts['file']['size']
>   vm.qmp_log('x-blockdev-reopen', filters=[filter_qmp_testfiles],
> -           **blockdev_opts)
> +           options = [ blockdev_opts ])
>   
>   vm.qmp_log('block-job-resume', device='drive0')
>   vm.event_wait('JOB_STATUS_CHANGE', timeout=1.0,
> diff --git a/tests/qemu-iotests/248.out b/tests/qemu-iotests/248.out
> index 369b25bf26..893f625347 100644
> --- a/tests/qemu-iotests/248.out
> +++ b/tests/qemu-iotests/248.out
> @@ -2,7 +2,7 @@
>   {"return": {}}
>   {"execute": "blockdev-mirror", "arguments": {"device": "drive0", "on-target-error": "enospc", "sync": "full", "target": "target"}}
>   {"return": {}}
> -{"execute": "x-blockdev-reopen", "arguments": {"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}}
> +{"execute": "x-blockdev-reopen", "arguments": {"options": [{"driver": "qcow2", "file": {"driver": "raw", "file": {"driver": "file", "filename": "TEST_DIR/PID-target"}}, "node-name": "target"}]}}
>   {"return": {}}
>   {"execute": "block-job-resume", "arguments": {"device": "drive0"}}
>   {"return": {}}
> diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
> index d535946b5f..4efdb35b91 100644
> --- a/tests/qemu-iotests/298
> +++ b/tests/qemu-iotests/298
> @@ -98,7 +98,7 @@ class TestPreallocateFilter(TestPreallocateBase):
>           self.check_big()
>   
>       def test_reopen_opts(self):
> -        result = self.vm.qmp('x-blockdev-reopen', **{
> +        result = self.vm.qmp('x-blockdev-reopen', options = [{
>               'node-name': 'disk',
>               'driver': iotests.imgfmt,
>               'file': {
> @@ -112,7 +112,7 @@ class TestPreallocateFilter(TestPreallocateBase):
>                       'filename': disk
>                   }
>               }
> -        })
> +        }])
>           self.assert_qmp(result, 'return', {})
>   
>           self.vm.hmp_qemu_io('drive0', 'write 0 1M')
> 


-- 
Best regards,
Vladimir

