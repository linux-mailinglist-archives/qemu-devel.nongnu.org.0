Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59193407CD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 15:26:51 +0100 (CET)
Received: from localhost ([::1]:54186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMtbu-0000xW-EA
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 10:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMtaS-0000Rs-6g; Thu, 18 Mar 2021 10:25:20 -0400
Received: from mail-vi1eur05on2134.outbound.protection.outlook.com
 ([40.107.21.134]:52033 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMtaN-0001s0-Gs; Thu, 18 Mar 2021 10:25:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgoMhXS9SQZyTLaq4B38VF8N9AQz8/I6Stm8JmWgaXRuUXua4Kp0Y7hVf/eLVaMWno+7VV9Lj0lJv0Utais1p4MN9ypvUluFb7Ay4M9P5h170xsZLSH7rVuU6LbIvOobMFyfCJ1r2yIGaD1+dVtzta9Ltm83x3HFFO9PFEdbcIeOsdlMVB9t3gvpZ6AlTm2KOiM0G9CJjmQLhjOY3vvcCwO8jVLW1/uZ8EPSo62ii396A5viNL2fJDjmKHDPpmC56RB1Bud7hb1baVrlyoV9GJ7X7+6EtmFFZus6t9QBFgPhwv86glaRD+B9uJ0jb6lmwd+fdPu4h4Pgcx6BBjeTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gxGtSbVy6lM4xBdokfgQGNwkbrnbFs6e8f2On/7V0M=;
 b=hUPK8olQPDMyPdg3iuSffzlDlTYUhzKOj7Rv4rjVNreFzAS9B7DA/Q+MG8QLuiEguk2hXnCqTfjQkz3KvqHHmBFZ/PP2a0RRgHHiqghHzOixy8j1wTipnr19aFLJM3ajPgc+TX9swS1fkiPf+euhRjI0tbz68GkksN6NqR14HT+LsZFAzTF/XGYZ3wLgMjV5eis9oFg9yizqEd/nsk5A6ugPDPItaFqcidMgPav37zV7MKJU91UmVMzOaVESI6mxzeYfEPUey0XI6irKERxDZnDMRO47/nzSZaPH1YRz/bqF6vs4dRVx/Hqi65zi517DkyQp42dczhrYaHFWwW9m7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gxGtSbVy6lM4xBdokfgQGNwkbrnbFs6e8f2On/7V0M=;
 b=ijgzO2kSau3MSNkBE/yB1QpskmBDig7dGGU5c2mqp1n/BlIRr6B0rOegs2dCAmiX9o/S0T39gy0oiKCB2MNxhMHjbfz/DzzEzVL5N5HbavS7gM3mjaihl5xx5KZGrA3+g3ywImCw9YM7A60LxJ7Rzt5b04z++vNI8Lc1r0BmT0o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Thu, 18 Mar
 2021 14:25:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 14:25:10 +0000
Subject: Re: [PATCH v4 2/6] block: Allow changing bs->file on reopen
To: Alberto Garcia <berto@igalia.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <cover.1616000692.git.berto@igalia.com>
 <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1a4ca40e-5924-4bef-d8b7-6a6b3eac32f5@virtuozzo.com>
Date: Thu, 18 Mar 2021 17:25:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <31ccb1061199ee11bf9879f6c60608a19b83263d.1616000692.git.berto@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 14:25:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f44d2682-7aeb-477e-705a-08d8ea19a304
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280CDD9E4164A29DC6053ACC1699@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GvWDpYrO58Rgr9vaIoAbW22Ev3yabeAcwf/LaehNWCU3HokxETanxRRxqhzPMcR+ecmhQufRgJrZWESjBTFdezcLqDmX88WWgQq7yF19fjSFoXTUeC2WjKGjxU/ZMgCO+p6/2qSHdKx5aG+nXpUCUGVBhOvC/t767ofq4++K6Afjp7IiaZmD9MgWOyznJOjPzjm5w0JOLZzdl1eUBq6fLMD2/jnOWOQo6+wZypAajh02idMz2lxlOcB9sih28Nr/4pskFgOMTnp52625IJDuMEKFaiSebx514KIBs7mAuDN1hxARGBi2m7EcznDbHeP3kKJgiAGM+RITci2VLPcmb6PLrvcfBzpV3iJRnLh+i5E66Dnd/tat97I1N0fwuKOjNIA80f5rK94NBYSHWp+vvWHQLsc9yNAMGdnX3wifqTVbghe5xxBC8tOWyQtCVsrw30qBIuAloRF9dFgyG1h8MhY1hVofm34QPKt76IeXK5Ew0FivlPCxo2zP4hiJ0KdZUUJ1sQFcO3sMbsVoUi/Tn2dj275QIG50vloVyHeq9AJYsnbhd5d17bHonuCUVFI7mvXBnLuV0LFhERBuZisGYJBWTlmK4a4+3wybYJNwhJCc/3mjqCgSU8N4eo1ZfVh3Gdr6HKQOt5P4YyYR2u6f3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(376002)(396003)(136003)(2616005)(54906003)(956004)(52116002)(478600001)(66476007)(66946007)(6486002)(38100700001)(186003)(66556008)(316002)(5660300002)(31686004)(4326008)(8936002)(8676002)(26005)(31696002)(16526019)(83380400001)(2906002)(36756003)(86362001)(30864003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmZJUmM0cFFlWkI0VVYxdXB5WlVPYWNtVFdraWlUZlNxcnRwdVFvVVN0ODNQ?=
 =?utf-8?B?QUV3R1Yyc0cyTE5wRHBpTHhTRmplRWZ5bjFaQmU3WWt3UXZiaFRIMTFORnVC?=
 =?utf-8?B?cjRLZmt6a1VUcTRlcDM2K2w5TjcvN2RMWlFiWE15NVFIU2dDL1ZNQXRLV21J?=
 =?utf-8?B?Nlh4VGNEaE81aENtWWtwS2Nnazk3NFNWL2I4bjcrU282ZmlOSy9XVFU0RzBM?=
 =?utf-8?B?dkFvVHExdVJNLzFjb2ovS3loMjViVFFDWGswcG9jdUtUT04zYk0yZFVIM3BL?=
 =?utf-8?B?T3NuRGJYZXdYVlNhTG5sZExaYW1OMUMyYmhEaGs2MTR2Nm93Tkw2dFNvZXVT?=
 =?utf-8?B?ZFpCdWZMQm15ejBCSCtiM3JZaFZndjNCWW8wQU1uOGc5Y3hnVlRLclUxaERp?=
 =?utf-8?B?TVFJelZWWjl1SjFSemRlMkgvVkZWazRjTHo1ejZTbHI0WjNVU1NudElRd1hC?=
 =?utf-8?B?VTFpMHF0a1lnYTZHS2VDQnFwcXkwU1pCNUdlM1A3OW9OUUhqOUhOejFtU1Q0?=
 =?utf-8?B?b1NUbEVKSTgvMk96ZlBpQlNNbkhQY21PVG5KZDFaa1lmdGxjaDBkcTRZd1JH?=
 =?utf-8?B?aC9yT1A1TlhsRDJVQnFLQnVpUXNZOG4yamZTSGRhZ0YrVFVyV3R5L2RrT0po?=
 =?utf-8?B?ZjFvQWFxNzhDK3FLZjMxTEtock9RcUlCaFJQbVVDSE9XYW8vemhSZjFIVmZm?=
 =?utf-8?B?dmU2OU93L0cyYnV4MzF5OG5GOUNPc0cvOHEzSW1QcW9UMGlQbklXdGJvb1Za?=
 =?utf-8?B?ZEFkNS9sdGZBQUFzckkrTXprSnlLYWs5SzViS1ozaVhTeDZoV2ltTUVqaTA5?=
 =?utf-8?B?azJGYmgzNWRpK3JVVjE5STM1RkNsNDl1YkxoK2FDbWVGMXNtcnRVcURoSis0?=
 =?utf-8?B?d21kaWFVL3IyUVZFZS9zMm9EZ1FCNkRYWkt4QURGOGVITG1YSEVYMDNaTWJz?=
 =?utf-8?B?Tnphdi9BWDdsQXV4U1dGRG9wQW1rWGtCSFYwNVd6ZHY1MGNFM0pHOGkxa001?=
 =?utf-8?B?S0xMa0RKU09kYVlNa3VDTWFvd0htTWV2L1Y0d3l6T2plSTdkRkZ2NmlwMVE1?=
 =?utf-8?B?WHF4cGZMSDBmcnJYdVJxSy9YOHR1YXhmQTc5cjFtcVBQRXRTRmJBKzZnMEpY?=
 =?utf-8?B?bjB0NmRZWmE0N295N210YUVzaUU1UW1xVjJwZXdsc2Y5c1BRMUhkUHdVTUp5?=
 =?utf-8?B?NURGY045cEhVMzI1RjJ0cnVSVkdwbXRkOE9hZDBnQUcrcEJIQStmUGowbUxs?=
 =?utf-8?B?NlljUG1DeDk2MGlTcElXSkIyQ0JSWjJmQnM1RUpYc1FJblNxc2ZwNldHaWJP?=
 =?utf-8?B?VlRjaFl3eFg2OGF5elc4ZW4xbEFCdXZ3THN2dk5GSkJaZDg4QzljQWtQaW1C?=
 =?utf-8?B?YzhJM3lmZlFBaEVxUzU3V0xtUWNCYm94Rk4yN240OWlKVEVEc1JNK0tkT1JR?=
 =?utf-8?B?MEZUeEZtbzhEbGhKbndkTlBPU3ZKVHMvWGk1MXVEQjRmNVRDK3RHYnYreDA3?=
 =?utf-8?B?L2JkQVUxL2F6REd4N1Y0N0RVd3VZQzQ4b21YViszdnRQQlc4clN2YjhESDFw?=
 =?utf-8?B?OU1nZ2NOUjNTTmIzclJGOGtZalYzeWhrLytOYXRpSkdpd0M0aElreUlKbEtm?=
 =?utf-8?B?VEtCdVZZbElXWEFpTk8zWXkvcHRJcGg3V01CV1hhUW0zbmcwU1VlbS84N2xw?=
 =?utf-8?B?Nm5jcmhERHpUTHVLU2RSZ2FnKy95alVPZUc3RlU0UUFvV1hOQ1VZQm00ZTNi?=
 =?utf-8?Q?GYwy+9tBWnGymjLPZE7P8+EaThzLGC9gDOWpYtm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44d2682-7aeb-477e-705a-08d8ea19a304
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 14:25:10.5642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpKSlAUJvCc8SJWkuw6gWQh+f+1yVMlPE1p/FnfDLb8FpYKvnFb2SgzSJIH9CqK+tm9yA7XpeKJlMIUAv7uRTfSzmvClGBcqQbfBG7Zfp7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.21.134;
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

17.03.2021 20:15, Alberto Garcia wrote:
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

In general patch looks OK for me, some comments below.

> ---
>   include/block/block.h  |   1 +
>   block.c                | 119 ++++++++++++++++++++++++++---------------
>   tests/qemu-iotests/245 |   9 ++--
>   3 files changed, 81 insertions(+), 48 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index 5eb1e4cab9..e2732a0187 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -209,6 +209,7 @@ typedef struct BDRVReopenState {
>       bool backing_missing;
>       bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
>       BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
> +    BlockDriverState *old_file_bs;    /* keep pointer for permissions update */
>       QDict *options;
>       QDict *explicit_options;
>       void *opaque;
> diff --git a/block.c b/block.c
> index 764cdbec7d..8ff0afd77b 100644
> --- a/block.c
> +++ b/block.c
> @@ -98,7 +98,7 @@ static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
>   
>   static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>                                  BlockReopenQueue *queue,
> -                               Transaction *set_backings_tran, Error **errp);
> +                               Transaction *tran, Error **errp);

I'd not call it just "tran" to not interfere with transaction actions. Of course, reopen should be finally refactored to work cleanly on Transaction API, but that is not done yet. And here we pass a transaction pointer only to keep children modification.. So, let's make it change_child_tran, or something like this.

>   static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
>   static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
>   
> @@ -4049,6 +4049,10 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
>               refresh_list = bdrv_topological_dfs(refresh_list, found,
>                                                   state->old_backing_bs);
>           }
> +        if (state->old_file_bs) {
> +            refresh_list = bdrv_topological_dfs(refresh_list, found,
> +                                                state->old_file_bs);
> +        }
>       }
>   
>       /*
> @@ -4161,65 +4165,77 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
>    *
>    * Return 0 on success, otherwise return < 0 and set @errp.
>    */
> -static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
> -                                     Transaction *set_backings_tran,
> -                                     Error **errp)
> +static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
> +                                             bool parse_file, Transaction *tran,
> +                                             Error **errp)
>   {
>       BlockDriverState *bs = reopen_state->bs;
> -    BlockDriverState *overlay_bs, *below_bs, *new_backing_bs;
> +    BlockDriverState *overlay_bs, *below_bs, *new_child_bs;
> +    BdrvChild *child = parse_file ? bs->file : bs->backing;
>       QObject *value;
>       const char *str;
>   
> -    value = qdict_get(reopen_state->options, "backing");
> +    value = qdict_get(reopen_state->options, parse_file ? "file" : "backing");
>       if (value == NULL) {
>           return 0;
>       }
>   
>       switch (qobject_type(value)) {
>       case QTYPE_QNULL:
> -        new_backing_bs = NULL;
> +        assert(!parse_file); /* The 'file' option does not allow a null value */
> +        new_child_bs = NULL;
>           break;
>       case QTYPE_QSTRING:
>           str = qstring_get_str(qobject_to(QString, value));
> -        new_backing_bs = bdrv_lookup_bs(NULL, str, errp);
> -        if (new_backing_bs == NULL) {
> +        new_child_bs = bdrv_lookup_bs(NULL, str, errp);
> +        if (new_child_bs == NULL) {
>               return -EINVAL;
> -        } else if (bdrv_recurse_has_child(new_backing_bs, bs)) {
> -            error_setg(errp, "Making '%s' a backing file of '%s' "
> -                       "would create a cycle", str, bs->node_name);
> +        } else if (bdrv_recurse_has_child(new_child_bs, bs)) {
> +            error_setg(errp, "Making '%s' a %s of '%s' would create a cycle",
> +                       str, parse_file ? "file" : "backing file",

maybe s/"file"/"file child"/

> +                       bs->node_name);
>               return -EINVAL;
>           }
>           break;
>       default:
> -        /* 'backing' does not allow any other data type */
> +        /* The options QDict has been flattened, so 'backing' and 'file'
> +         * do not allow any other data type here. */

checkpatch should complain that you didn't fix style of the comment...

>           g_assert_not_reached();
>       }
>   
> -    /*
> -     * Check AioContext compatibility so that the bdrv_set_backing_hd() call in
> -     * bdrv_reopen_commit() won't fail.
> -     */
> -    if (new_backing_bs) {
> -        if (!bdrv_reopen_can_attach(bs, bs->backing, new_backing_bs, errp)) {
> +    /* If 'file' points to the current child then there's nothing to do */
> +    if (child_bs(child) == new_child_bs) {
> +        return 0;
> +    }
> +
> +    /* Check AioContext compatibility */
> +    if (new_child_bs) {
> +        if (!bdrv_reopen_can_attach(bs, child, new_child_bs, errp)) {
>               return -EINVAL;
>           }
>       }
>   
> -    /*
> -     * Ensure that @bs can really handle backing files, because we are
> -     * about to give it one (or swap the existing one)
> -     */
> -    if (bs->drv->is_filter) {
> -        /* Filters always have a file or a backing child */
> -        if (!bs->backing) {
> -            error_setg(errp, "'%s' is a %s filter node that does not support a "
> -                       "backing child", bs->node_name, bs->drv->format_name);
> +    if (parse_file) {
> +        assert(child && child->bs);

I'm not sure, that we can't get children without a bs at some point.. And we have so many checks about it in the code. Probably we can drop them all? But I don't want to care to much. If this assertion fires, we'll fix a bug.

> +    } else {
> +        /*
> +         * Ensure that @bs can really handle backing files, because we are
> +         * about to give it one (or swap the existing one)
> +         */
> +        if (bs->drv->is_filter) {
> +            /* Filters always have a file or a backing child */

Probably we can assert bs->backing, as otherwise backing option should be unsupported [preexisting, not about this patch]

> +            if (!bs->backing) {
> +                error_setg(errp, "'%s' is a %s filter node "
> +                           "that does not support a backing child",
> +                           bs->node_name, bs->drv->format_name);
> +                return -EINVAL;
> +            }
> +        } else if (!bs->drv->supports_backing) {

Probably we can assert bs->drv->supports_backing, as otherwise backing option should be unsupported [preexisting, not about this patch]

> +            error_setg(errp, "Driver '%s' of node '%s' "
> +                       "does not support backing files",
> +                       bs->drv->format_name, bs->node_name);
>               return -EINVAL;
>           }
> -    } else if (!bs->drv->supports_backing) {
> -        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
> -                   "files", bs->drv->format_name, bs->node_name);
> -        return -EINVAL;
>       }
>   
>       /*
> @@ -4238,13 +4254,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>       }
>   
>       /* If we want to replace the backing file we need some extra checks */

You didn't update the comment.

> -    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
> +    if (new_child_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
>           int ret;
>   
>           /* Check for implicit nodes between bs and its backing file */
>           if (bs != overlay_bs) {
> -            error_setg(errp, "Cannot change backing link if '%s' has "
> -                       "an implicit backing file", bs->node_name);
> +            error_setg(errp, "Cannot change %s link if '%s' has an implicit "
> +                       "child", parse_file ? "file" : "backing", bs->node_name);
>               return -EPERM;
>           }
>           /*
> @@ -4256,16 +4272,24 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>            * with bs->drv->supports_backing == true.
>            */
>           if (bdrv_is_backing_chain_frozen(overlay_bs,
> -                                         child_bs(overlay_bs->backing), errp))
> +                                         bdrv_filter_or_cow_bs(overlay_bs),
> +                                         errp))
>           {
>               return -EPERM;
>           }
> -        reopen_state->replace_backing_bs = true;
> -        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
> -        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
> -                                      errp);
> -        if (ret < 0) {
> -            return ret;
> +        if (parse_file) {
> +            /* Store the old file bs, we'll need to refresh its permissions */
> +            reopen_state->old_file_bs = bs->file->bs;
> +
> +            /* And finally replace the child */
> +            bdrv_replace_child(bs->file, new_child_bs, tran);

I think that actually, we need also to update inherits_from and do refresh_limits like in bdrv_set_backing_noperm().

Probably, bdrv_replace_child should do it. Probably not (there are still a lot of things to refactor in block.c :)..

Hm. Also, using blockdev-reopen probably means that we are in a blockdev word, so we should not care about inherits_from here.

But at least calling bdrv_refresh_limits(bs, tran, NULL) will not hurt. (or we can check an error code and honestly return it as well).


Also, you don't create reopen_state->replace_file_bs, like for backing.. On bdrv_reopen_comnmit replace_backing_bs is used to remove corresponding options.. Shouldn't we do the same with file options?

> +        } else {
> +            reopen_state->replace_backing_bs = true;
> +            reopen_state->old_backing_bs = child_bs(bs->backing);
> +            ret = bdrv_set_backing_noperm(bs, new_child_bs, tran, errp);
> +            if (ret < 0) {
> +                return ret;
> +            }
>           }
>       }
>   
> @@ -4291,7 +4315,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
>    */
>   static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>                                  BlockReopenQueue *queue,
> -                               Transaction *set_backings_tran, Error **errp)
> +                               Transaction *tran, Error **errp)
>   {
>       int ret = -1;
>       int old_flags;
> @@ -4411,12 +4435,19 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
>        * either a reference to an existing node (using its node name)
>        * or NULL to simply detach the current backing file.
>        */
> -    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
> +    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false, tran, errp);
>       if (ret < 0) {
>           goto error;
>       }
>       qdict_del(reopen_state->options, "backing");
>   
> +    /* Allow changing the 'file' option. In this case NULL is not allowed */
> +    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true, tran, errp);
> +    if (ret < 0) {
> +        goto error;
> +    }
> +    qdict_del(reopen_state->options, "file");
> +
>       /* Options that are not handled are only okay if they are unchanged
>        * compared to the old state. It is expected that some options are only
>        * used for the initial open, but not reopen (e.g. filename) */
> diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
> index fc5297e268..a4d0b10e9d 100755
> --- a/tests/qemu-iotests/245
> +++ b/tests/qemu-iotests/245
> @@ -146,8 +146,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           self.reopen(opts, {'driver': 'raw'}, "Cannot change the option 'driver'")
>           self.reopen(opts, {'driver': ''}, "Invalid parameter ''")
>           self.reopen(opts, {'driver': None}, "Invalid parameter type for 'driver', expected: string")
> -        self.reopen(opts, {'file': 'not-found'}, "Cannot change the option 'file'")
> -        self.reopen(opts, {'file': ''}, "Cannot change the option 'file'")
> +        self.reopen(opts, {'file': 'not-found'}, "Cannot find device='' nor node-name='not-found'")

Interesting that error-message say about device='', not 'not-found'...

> +        self.reopen(opts, {'file': ''}, "Cannot find device='' nor node-name=''")
>           self.reopen(opts, {'file': None}, "Invalid parameter type for 'file', expected: BlockdevRef")
>           self.reopen(opts, {'file.node-name': 'newname'}, "Cannot change the option 'node-name'")
>           self.reopen(opts, {'file.driver': 'host_device'}, "Cannot change the option 'driver'")
> @@ -455,7 +455,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>           # More illegal operations
>           self.reopen(opts[2], {'backing': 'hd1'},
>                       "Making 'hd1' a backing file of 'hd2' would create a cycle")
> -        self.reopen(opts[2], {'file': 'hd0-file'}, "Cannot change the option 'file'")
> +        self.reopen(opts[2], {'file': 'hd0-file'},
> +                    "Conflicts with use by hd2 as 'file', which does not allow 'write, resize' on hd0-file")
>   
>           result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
>           self.assert_qmp(result, 'error/class', 'GenericError')
> @@ -969,7 +970,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
>   
>           # We can't remove hd1 while the commit job is ongoing
>           opts['backing'] = None
> -        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit backing file")
> +        self.reopen(opts, {}, "Cannot change backing link if 'hd0' has an implicit child")
>   
>           # hd2 <- hd0
>           self.vm.run_job('commit0', auto_finalize = False, auto_dismiss = True)
> 

-- 
Best regards,
Vladimir

