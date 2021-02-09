Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 316AB314B0E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:09:58 +0100 (CET)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9P1x-0003C1-5o
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:09:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9NaC-0008Lv-SU; Tue, 09 Feb 2021 02:37:13 -0500
Received: from mail-eopbgr70112.outbound.protection.outlook.com
 ([40.107.7.112]:36590 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l9Na9-0007k9-R5; Tue, 09 Feb 2021 02:37:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7B9hP+yDIjhjwsfWkWs5nhM0UzvwDRlpWl/nqI9l//FMkv99FWJX+UGK7dJWPQX6JVtf+pbe93CBlagOkOcTcqYLT0fXedZknbMrLx85et7tAPARlbXrIOqmsLCbKg6vzhC1GIpxvVQIGqqPk2QT9Rc7/vCz5uxIozuZlXrYt7HY2SSEle/8kXvx8pLTyM6kAgfTqz6JHX690RWBqDxB6bA6R49Vp1Q0CUaKlXZvXI+n/Xs/7m/EJsLFvjS6fhD6l2SROEmChLy+wFL8SYk59/7zneX1/IXa9cX8lscDlpbmgd2GEQPIZjvTzhpfs9878z6x7KGXIsj7Fukqo6unA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vpSzrzTZqU4Cs7oNlya/nYshyoTN2c30QL9OPXVjfs=;
 b=PPvQBevB7K+vP5Ymof1a0HrTViUxNTY4qJYcPj3OrlkfO4aGQgB4mIBAwxX/zUMbl4p0rrGMMJrefuvs3LTidd8jVwA2Ox9ZCzN/XgtfX9YhJcENjvxJ1CCL3WfNp71DGesR9LA0/91Zo/JiQ87jjua0eh3eZ7ZoYhC759wja5sncUooWon8IH8UHZL5uWVHRkOKFStbBMuLbcQ9IOwYGUnlZJsTbFwpcXgU+6uEaOTLNW4HUff71NbR+WmkqYzTkPNCcYmmDNCW9IqWoSohuID3KuyLKzbwCYaIBlA387+fvR+5nyaPzt0IW7+OXF048TmswE+bTRQirSTZ/QfRPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vpSzrzTZqU4Cs7oNlya/nYshyoTN2c30QL9OPXVjfs=;
 b=L3GK8bThnuXKaCGPRuvVCjSCkMr37tQFFbV5+gMs4hG6PrbLyy4SFFx603Ubh+v7OQvey7wb0EhGnKAMOPO8wUg2qbDvMrv6F2k6KZ10gXLUUZBY6IAlNZ8u3AAFeIu7WQxmfqs9h3b8pCoDW5XdywQFWuEIIXAnON/HI+6d5oQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4722.eurprd08.prod.outlook.com (2603:10a6:20b:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 07:37:06 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 07:37:06 +0000
Subject: Re: [RFC PATCH v2 1/4] block: Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1612809837.git.berto@igalia.com>
 <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7752042e-c4ed-e940-c050-f78a6bd520ff@virtuozzo.com>
Date: Tue, 9 Feb 2021 10:37:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <670613fb7829ae2bf1329fca2e13bd51bd357024.1612809837.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: AM0PR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 AM0PR01CA0086.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Tue, 9 Feb 2021 07:37:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 855ef670-1899-4591-a7b1-08d8cccd8024
X-MS-TrafficTypeDiagnostic: AM6PR08MB4722:
X-Microsoft-Antispam-PRVS: <AM6PR08MB472245CBD16E2294C8DAF605C18E9@AM6PR08MB4722.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyTtjJq1498Jl5c/dsBiYVXRUG4kxf7ct+pI/UQ5woeIeOdexaZDA84SkmRP47E5xaq/Omql16LZJK253YKEdnalCTkrN5grYl4N6aKXfGPWkfU2zWVgScfHE46IPkPb2hDoC1sdbwh+BmvY6Wmx+tYjrWJ1vMC4XrVvsAphLGG/Ns8IYUGsqwEtf0LsbZ1DZp8JR8UUIcJiQ7JpGYhVWUwxWE9/oQEoVm6k9fUi3UFMJPWpU6Z4LmUEPKR6MRAU3pxbNXGpz3AzC3rkln3/wn2n7WvTGbXNxeagBRgSihqZHD0/9L4lIMklW/37QZH44gPS1MO8W8tx2cqBp67LFwT2XVtpw1EgWKHAaPONcJ6cidynH09JlTrqmqocs96I3f645aaF25Mp3NIl6JTgZzroCW5jHegFlIxV+xKa8b3VheUl92lKIk/o/c7leZg6uNM9rxTvXu8pHjrwzzgYdO9Z5CfejcOPMZmDHXXB1Gvr+MBKAyQc/i48SnaUl6M0FIVEdXr711zgfTMkdq49rzbOLGUYzP0od5FceXXccf5aXKTqzRHOnNB8J5CCoTXmhYyOZyYm+wIbgxqqqA/wqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39830400003)(366004)(31696002)(66476007)(66946007)(36756003)(52116002)(16526019)(186003)(5660300002)(2616005)(66556008)(6486002)(31686004)(26005)(8936002)(956004)(54906003)(478600001)(16576012)(86362001)(316002)(83380400001)(8676002)(2906002)(4326008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YzlZMlFaRUI0UlN3NTlPYWtGODExMDdqQ1lMcGxYZDIvTTFRR3p0cEI2NUNr?=
 =?utf-8?B?NloyUnRCajdBWEtWOE1BcnorWWkyeVd5c1NvWmdGeE02RDM0SGgwVWZ0MDY3?=
 =?utf-8?B?a1ZSVWdCbWpXYjdmK1E5eGRIdXEvNmZwLzhuV05PckhZRC9YRkFvaXMvNnJh?=
 =?utf-8?B?Y29pcloyV1RCa1BWNUhUcmNvWWtPZk9HeWs5WWhKbnVmZjZGM2crSXdJRWhl?=
 =?utf-8?B?cEdsYWl4YnU2NFc3UjY3WGluVE96dllqTHdFTUtuT1NYeGRtWlo5WVFTaER1?=
 =?utf-8?B?SmpXSVB6VlVkVlpZQTVGSk1telg3MFFodFYwVWxmSmRzOFFkeUxXRjlDVEth?=
 =?utf-8?B?bnhLM3lwTk9DOC9YbE9KTTN2UTU1cklNS3M1SXdxdHdCVVRrblFuci9Rc2Nw?=
 =?utf-8?B?N2p6ZGxTRDNudHRZNzBUaTkxZUFOaGFZWG5OY2lOdDI4YzF2M2djRWJxTnpP?=
 =?utf-8?B?MnVjeU4vbldoM1U4QzR1TFlpRGhRUEFMdHhhYkwvU3NwT1lpOGpNTGRjbTR1?=
 =?utf-8?B?T1UzRkJPZkRmQlVzdVZLQ3B3N3k0alBLZXhHT1NzNkllMW9qRjRoekxGd1NE?=
 =?utf-8?B?VGN2Y3pYUE01Wk01Y2xkT0Q2bGV1bmpXN3kwUi9JdnAvaEtFOVhCYmRSeDNu?=
 =?utf-8?B?NlhEQm9WVHlObWIrc0ZMZllZYTMrakNwMlpJL0dveHNzRWhlbW5yejVPM1lH?=
 =?utf-8?B?bkFTTzVtZE9Md3hiTU5uWjJFcHVRWXlYMHJMeFdMbHdGVG5wcDhndjlybis0?=
 =?utf-8?B?VnhLeTk3SHlnOTR1Y01uWDQvWktsVnA1UmRYZmZaMDN3bUxVV2tZcmJQSUt6?=
 =?utf-8?B?U2VLV1pxQWZSMzEyZnY1amlYb3JQWmVSMUFPMUpvSFovRjAxLytoUmh6TnNL?=
 =?utf-8?B?QS9KNmpuaTgvQldMQkhobjdQczRheFhBUTAxSXo2SnkxcXBnNVdqWEJuMWc0?=
 =?utf-8?B?RHMvT2VMTVVteGpWT0VyN1ZNSGhIU2hBMUlnTU1tUzRZLzBkSkluR2c4VGpo?=
 =?utf-8?B?UnlLVnY2eUt3Qm0wQ1RzQlN4WUhnUHdQUlgrTGhvTWJQVUJyK1ZVc25ibkNz?=
 =?utf-8?B?YUcveTFWVVB3YnJxOElPQ2E1d2FZMkxZVW94eUlKNzFsZXRqVjhoN1BNVDNX?=
 =?utf-8?B?RWJLbmtyQkJQcWI2TC93a3BLd3A0YlFOS0NRNFRPS2FlaVd3OUZmaTJZY0Z4?=
 =?utf-8?B?YlowOW9PTGVNZHhXR01UNjd1Q0xBclVRU3VUeHRmRVhTVkJLeUloN2ZHTDNQ?=
 =?utf-8?B?T3lMdFRTN2JQZmpITkZORElwdndhc3p3em5vd2pSWkd0dlAycDhNeWM5ME5l?=
 =?utf-8?B?aHJNVlJQUjFmY3NDRk1CdERWenJBSENyYVhmMmNzRytQN1k1bFZ6MUU2bUJH?=
 =?utf-8?B?dWgwTDFGUFBrSmIvSEplRTMzdSsrYlhKZ1JGd2ozdUtnd3ROZXNGMUF1bVRV?=
 =?utf-8?B?UTBvWnhnbUJlcyt4d1l5OXVsY2gwbjZ3N1hJbkNEN2gvK2VzQTFuOWlvMHB1?=
 =?utf-8?B?Wk9OOG1tZnNKdVE5Vkh5Nm90Q0d3U0k5S3JTNUpGL2QxelhpME9IZVg4eDJT?=
 =?utf-8?B?SUFoME4yd2ZvOVpsWUFZM3NMTkJ4ZlZqdTR2MlI3aWhUMnd6dFNKTjBhMDR3?=
 =?utf-8?B?R0VBdFhiTHAvVW9GZ2FpVUhETHUvYzBtait3VnFWVm9TOHAzQU5oWlVJdnkx?=
 =?utf-8?B?ZU5yajNnSFJQVDFJUElQZUhrL3d0QXk5K044RGVSeUdLMW44aDNxeFRUREkr?=
 =?utf-8?Q?gtn8h1GQ3TYwjSLc3au+SGcTjV4T07gACjlBs+Q?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855ef670-1899-4591-a7b1-08d8cccd8024
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 07:37:06.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJy4++qXyQ5q+Ljbm4qFEwmpmlFyB5WjjIbucztHif70rn2CpSXU9mYC5mjZ3WdZVhrJsXLkw072poqc2dZw8+JiciqjQkSzV3DzW35oKW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4722
Received-SPF: pass client-ip=40.107.7.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
>   block.c                | 65 ++++++++++++++++++++++++++++++++++++++++++
>   tests/qemu-iotests/245 |  7 +++--
>   3 files changed, 70 insertions(+), 3 deletions(-)
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
> index 576b145cbf..19b62da4af 100644
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
> @@ -4196,6 +4200,61 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
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
> +
> +    /* If 'file' points to the current child then there's nothing to do */
> +    if (bs->file->bs == new_file_bs) {
> +        return 0;
> +    }
> +
> +    if (bs->file->frozen) {
> +        error_setg(errp, "Cannot change the 'file' link of '%s' "
> +                   "from '%s' to '%s'", bs->node_name,
> +                   bs->file->bs->node_name, new_file_bs->node_name);
> +        return -EPERM;
> +    }
> +
> +    /* Check AioContext compatibility */
> +    if (!bdrv_reopen_can_attach(bs, bs->file, new_file_bs, errp)) {
> +        return -EINVAL;
> +    }
> +
> +    /* Store the old file bs because we'll need to refresh its permissions */
> +    reopen_state->old_file_bs = bs->file->bs;
> +
> +    /* And finally replace the child */
> +    bdrv_replace_child(bs->file, new_file_bs, tran);
> +
> +    return 0;
> +}

The function mostly do the same that bdrv_reopen_parse_backing().. I don't think that they
should really differ. Probably it should be one function.
At least, they should work absolutely the same way for backing-child
based and file-child based filters. And you lose bdrv_is_backing_chain_frozen() check

> +
>   /*
>    * Prepares a BlockDriverState for reopen. All changes are staged in the
>    * 'opaque' field of the BDRVReopenState, which is used and allocated by
> @@ -4347,6 +4406,12 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
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

