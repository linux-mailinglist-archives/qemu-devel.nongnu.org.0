Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD47368FA2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 11:44:44 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsMd-00012S-K3
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 05:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZsLn-0000Vp-Si; Fri, 23 Apr 2021 05:43:52 -0400
Received: from mail-eopbgr50124.outbound.protection.outlook.com
 ([40.107.5.124]:35726 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZsLk-0000Rm-Ny; Fri, 23 Apr 2021 05:43:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fa7YN0k8JMtNCrzXY8bT3gPKf3Gs+6kqgprlZRLmVItPWFXCc1bphw/A5/yFsQ18dNXzWCL+OVxlhjbPqd20rgy4R+kBCsJ7uMjUjZz7+zW0jXksovCERDXstA2Usc+fwEswVKVglp9gXohQwZSwDYxw9J+erN0WuJ8dgoPLlrHIcS7YhDI1/Aq7IvqDvcAFVW0DlPofHHmAxz8rrYcOYdASDbjgGwakaTIeU/YRnOvf1PS+EbXpRUiK15mYdB9sCXUN3q1DJUcZItBxnr9jKBatD+6Mqyh5MF5OCN4tiWnsULSkmegJjHyb5hAFosy+O9GupFTFE4OZLikResBQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOhHRyAKu1A9k/kx7tIvi+XqhZK2LBB95YZ3o3C4GXM=;
 b=Cn1dgTpra8DfqQiEqS/cTCRSe/nUYZ4XMbJ/toGVSeq4YJ1HZWFCDX6xwigzOzpIJvkG7aZm6YfjzIaOQvj2KAXtISBZLodAmkqVi/j3LQooTCwLld95N1slgZGudqeV3nlFdP1v8OaqLJb2Zplfc1bps/VHfY79AlBrDSRu+UekFN3TfIyrVzOoQFC9crjhIGww3G4H+S1kdfr5exIpDBCg0R97aLpbSHYt9Fo6xze9koyzQmNeQ21T+t8IqmqIMzUB/Uj1tcB0CAN2lb9QxHB4JZf0pZXx/J6guveWmmnrrV22DI3VXpxGEcfwKkMAXYpd7Edi4e8fHjmjQh+JcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOhHRyAKu1A9k/kx7tIvi+XqhZK2LBB95YZ3o3C4GXM=;
 b=MxMByt2A0+IoqXyEG8X08RjiXqJbTJI+VNNSVPysbeZUbY+qIDu8EZDbTIa9hU6WkGWOZ4hC+3HQHuZ/dmFryEK0Yh9wnpWqiJ6VUNpHT/mZygRCCH0mBDzLe3ly58UK2yp3LzUD8Xwdns+6iotBdGblISqKTyn/KH4ErUOZUWQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5080.eurprd08.prod.outlook.com (2603:10a6:20b:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Fri, 23 Apr
 2021 09:43:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 09:43:42 +0000
Subject: Re: [PATCH v2 1/2] block: Add BDRV_O_NO_SHARE for blk_new_open()
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20210422164344.283389-1-kwolf@redhat.com>
 <20210422164344.283389-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <23f7a203-8b94-4bde-a06d-3ade7924eddf@virtuozzo.com>
Date: Fri, 23 Apr 2021 12:43:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <20210422164344.283389-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: PR3P191CA0052.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.222) by
 PR3P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Fri, 23 Apr 2021 09:43:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dbfbe57-6699-490f-45ec-08d9063c477a
X-MS-TrafficTypeDiagnostic: AM6PR08MB5080:
X-Microsoft-Antispam-PRVS: <AM6PR08MB5080CBE3486B1CF06EEF8135C1459@AM6PR08MB5080.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jtE6LjoRNYdwqnzWGx2sK9nBivgtmc4Q3KsD1MkFg5KUS+svaZk0RNfGfSaFGIEMz/vUJFbTQtU7+k4NS97OVWLro8r8Jg+D4/TAlzjicf4W9VJiXW2V+LBqflMQ6Fjt6xV3Soo9E8Rgd4O1NCMD87aOGnYN/LW3bvrWSKwu7jMrj8cnly4TxxwTotOyTXB95Nph3cR7Bq2OqOFMT1oPQDi/zpQwXyZjrpNi5VZ4LvJi/BmNVMOV/DL/3BK33fBw/ejVPBiltxbBew6eUbL+KmYIW/qh2jffWL5pBTqiQEfQlXo3fgs7WmpqMLs8Fzm+GlUuPwWhjo+UHfuFuhprdUGjmbukut5poWN9n/GTcZCXmU6DeTetVGnr/1VkyWS0L5s1hNsn8qvgk3H1iD/VAjXX/7ERUNWPbdHXWFO8SBtCkOJcQtmS+0R/aIiyCnZcph4VtZLP/CWeojeut4NA8kg177WojjOSgiB5gODsAbjxMiKTIixkDZNtHWgeDr9+KzJULo297cpUlBLwsNLXQQ/I9MvVxlpprC8OJ7ZXQGc8bou/chv4Y/z/8Zyw+OR5kpndpHEq/cyGPAmygwMevqHIFs4s/b4DopeEEXylVRLqf+732qkyi6OQURycddo8WBaKdXcUPbExJa273QCI6BFv9DSXtY2GCsnpChnrGquscX7Wq+eCveQMg2oRUZ1tk7giGTMJCfqdYY0Xzff0CaQw91LI9jU2eqTxqDw0vqE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(366004)(376002)(136003)(396003)(6486002)(8676002)(36756003)(5660300002)(16576012)(31686004)(83380400001)(4326008)(31696002)(956004)(2616005)(66476007)(26005)(38100700002)(186003)(66556008)(2906002)(16526019)(38350700002)(66946007)(86362001)(478600001)(52116002)(316002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U2hiQ0ZHNmpHcDQxZ0s5WkZDbU1VTmNnNFdNOUtQRFZIbEZGcUpNQ0ZsdUhR?=
 =?utf-8?B?ZVAyWm1xbldnZWxnK1dqZFhHOHAwREEyQStHQ0NCaklNUU1mdHN2am9sN0dP?=
 =?utf-8?B?b1BuRDVmaUVXS0tCSnkvRW1XOHZ6ejBXTDFyQ2d4VUV1TWxyaWxEY1VJTGdH?=
 =?utf-8?B?UEo0OHdkS3AxL3VjR2lxUzh1SGRBMGhhRm92UEc4MnEzdFVGaU9Nb0hmUUpJ?=
 =?utf-8?B?elVpOExUWkd2QWpIUVhsOC9KZU5keElQa0Q2TXlaWm9TRjFLVlpnUDl6M3NE?=
 =?utf-8?B?TVc5bFFCaEVFYVBvdGNIWld5Uzg3OVpWM21QdU1xbjBDRGRaaWJkVDBoVlBv?=
 =?utf-8?B?QnFNOGY3c0NLU0ljTDR2eDNxa0dQeGhzeE44UFA2TCtsekR2L3FDMjl0WVVB?=
 =?utf-8?B?THVtbitsU2l5MTFXT0NOWUhiWFZNY1NNN3NSQXJRY2FoR1Q2aVR4RWNWQVBK?=
 =?utf-8?B?b3VML1dDWmc4eXA3Z2xzTzBBR2VuNFViQ3FvY1JQNzZHOVRsWGhZbHpnQVVn?=
 =?utf-8?B?WXkzRjFXRFpkYS8rUklJY1dCc3BLeGhYRXAreFAzY3JxaUd5SS9GbFk1c0xy?=
 =?utf-8?B?ZkpDb0pBMEhNNzRBc1BYRVVoUjFpNHR0NGU4bnJtdVVsTitxRnVRdE5EcFds?=
 =?utf-8?B?VUxTR3hzVVlPZVBsZWZNcHFnTFB0Q1RrdWVRdmF3OTBpUnRiL0FXTkVUcmZS?=
 =?utf-8?B?R2p3NXpvY3MyWjNTK3YzNThwL0U3WEd6dWRkUzJmdHZJWmhCZVB6Y3hicHFn?=
 =?utf-8?B?Q2wxeGx4clpVOW5razRIOGVjYjFsKzNEQkI2dStYWW5URzNwTXVGQ3NTdHhu?=
 =?utf-8?B?NDgzRDN3VG1MTzZEdFpxZzUweWdWUEg3VHZQaDJ3R3JwV2Evb01BNVc4QVJS?=
 =?utf-8?B?QkxHYjJkSVQyOWdyY2hmSDQ4dEp6Uy9jRmUyemhyVGxOY1VUamF1UnBXQUVM?=
 =?utf-8?B?T0l2M3VZNEJSVkZGekVmR1NSSGVzUTJiNUE0V1IyY2tZTmIxclkxcjZHaGRI?=
 =?utf-8?B?dHBIYnNscEJCdG5PbzdpRkZCdWtSdHVOR3dMV091NXVDVjRuaUVWNERsRlB1?=
 =?utf-8?B?SS93VzN2VEtsMFdwM0hPL1N5OUhmZnh6Q1l5MHM3Q1hGRGRJQWVmamRFSUlR?=
 =?utf-8?B?NXNnYnZOQlRzZGpPaXN6em4vaTMrMThkT1dndTlLdnF1RVBNT3YyNGpUaU92?=
 =?utf-8?B?N0wzK0w1UG50cU9vdGN3a21POG84TmI4aG5iY0s3dEl2aExjUG9KRWdZRFZE?=
 =?utf-8?B?bFQzdDNlU0RWL2NyVVhweHlOUEVnM25Oa0lQcGJjWU5SeEVyejdiM2ZMWVhM?=
 =?utf-8?B?TG9LaHNSNER1Qzg0d1VYTEJDZnNmQnhCMmNLTTdYZmtDb1FJY3dnN2U4a3ov?=
 =?utf-8?B?akRmQzZZMTBRMXBzUytiR0FjaVc3QjFsUGpqOElVSktLZllIQ00ydnQ3Q0tQ?=
 =?utf-8?B?SHdnWnB4ZlFhRDYzdUJIbmhkMDV6RDRSRVZVNTJjeTVncjgyd3VpYlo3VFMv?=
 =?utf-8?B?ZUlZeUY5OFhZVnJNVWxOSElvMHN1Q3FPaTVmZG1Uekg1UHVYdHRDcXppcjBV?=
 =?utf-8?B?YXUzZld1Yjl3elAyRytoTmhKMXcwS2NmcXVQNTROV0p4TnpUUHJXNVNjQnRY?=
 =?utf-8?B?aW1VaTBrUFN6SDRod3lEay9hSEJrY3Y3QXRUeXlETUdMbFNjK1NHM3QvV0pZ?=
 =?utf-8?B?eTN3dUM3V0gwTklWQmlJN2JWanN5OUp5Y2dYMmI2S3lQeW5VaTBHdnpGQUkz?=
 =?utf-8?Q?gy+BdW0no2qrGcbsRYxxjoCA9MH4PeRFnfcKbMY?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbfbe57-6699-490f-45ec-08d9063c477a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:43:42.0747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4Y2X6Z5l7dIskY48khqcqLELWlPA9J7xQSDcImY2QpsTHumcZr2R1xOdzXo7ZnaPJiwAZr0yzzs4OMavbIrdemfGji5ZJmMwcEDev+DaRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5080
Received-SPF: pass client-ip=40.107.5.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

22.04.2021 19:43, Kevin Wolf wrote:
> Normally, blk_new_open() just shares all permissions. This was fine
> originally when permissions only protected against uses in the same
> process because no other part of the code would actually get to access
> the block nodes opened with blk_new_open(). However, since we use it for
> file locking now, unsharing permissions becomes desirable.
> 
> Add a new BDRV_O_NO_SHARE flag that is used in blk_new_open() to unshare
> any permissions that can be unshared.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block.h |  1 +
>   block/block-backend.c | 19 +++++++++++++------
>   2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/include/block/block.h b/include/block/block.h
> index b3f6e509d4..735db05a39 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h
> @@ -101,6 +101,7 @@ typedef struct HDGeometry {
>       uint32_t cylinders;
>   } HDGeometry;
>   
> +#define BDRV_O_NO_SHARE    0x0001 /* don't share permissons */
>   #define BDRV_O_RDWR        0x0002
>   #define BDRV_O_RESIZE      0x0004 /* request permission for resizing the node */
>   #define BDRV_O_SNAPSHOT    0x0008 /* open the file read only and save writes in a snapshot */
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 413af51f3b..61a10ea860 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -398,15 +398,19 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
>       BlockBackend *blk;
>       BlockDriverState *bs;
>       uint64_t perm = 0;
> +    uint64_t shared = BLK_PERM_ALL;
>   
> -    /* blk_new_open() is mainly used in .bdrv_create implementations and the
> -     * tools where sharing isn't a concern because the BDS stays private, so we
> -     * just request permission according to the flags.
> +    /*
> +     * blk_new_open() is mainly used in .bdrv_create implementations and the
> +     * tools where sharing isn't a major concern because the BDS stays private
> +     * and the file is generally not supposed to be used by a second process,
> +     * so we just request permission according to the flags.
>        *
>        * The exceptions are xen_disk and blockdev_init(); in these cases, the
>        * caller of blk_new_open() doesn't make use of the permissions, but they
>        * shouldn't hurt either. We can still share everything here because the
> -     * guest devices will add their own blockers if they can't share. */
> +     * guest devices will add their own blockers if they can't share.
> +     */

Probably old comment "We can still share everything" is a bit in conflict with commit message (and new logic).

>       if ((flags & BDRV_O_NO_IO) == 0) {
>           perm |= BLK_PERM_CONSISTENT_READ;
>           if (flags & BDRV_O_RDWR) {
> @@ -416,8 +420,11 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
>       if (flags & BDRV_O_RESIZE) {
>           perm |= BLK_PERM_RESIZE;
>       }
> +    if (flags & BDRV_O_NO_SHARE) {
> +        shared = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
> +    }
>   
> -    blk = blk_new(qemu_get_aio_context(), perm, BLK_PERM_ALL);
> +    blk = blk_new(qemu_get_aio_context(), perm, shared);
>       bs = bdrv_open(filename, reference, options, flags, errp);
>       if (!bs) {
>           blk_unref(blk);
> @@ -426,7 +433,7 @@ BlockBackend *blk_new_open(const char *filename, const char *reference,
>   
>       blk->root = bdrv_root_attach_child(bs, "root", &child_root,
>                                          BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> -                                       blk->ctx, perm, BLK_PERM_ALL, blk, errp);
> +                                       blk->ctx, perm, shared, blk, errp);
>       if (!blk->root) {
>           blk_unref(blk);
>           return NULL;
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

