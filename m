Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719033C2022
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 09:42:09 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1l9D-0000im-WD
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 03:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1l8M-0008FP-GC; Fri, 09 Jul 2021 03:41:14 -0400
Received: from mail-eopbgr40110.outbound.protection.outlook.com
 ([40.107.4.110]:52707 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m1l8F-0003Ai-40; Fri, 09 Jul 2021 03:41:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpGPVQ0qxlRfx9la0zbsXmEX24hb/ZLqUrTjn2TTdyBbXmlEuVgTu9JrBvmC2bZrogWI209DRLRnmoerabfufhB/hurvwx9zc6PYr0UhTIgPwhdziHur+0e8JKZ2z4LEizq2/QbrCfPe/MuVyHX2Uze524vVbHb17YmdAH3t87rv6PYCqawUFwqroQWRckut8KMZymQML8/RN9kdL/mxQab0YVCMbfjGu6633ltGEDYt6fWgndghhXkAscOjgqTTo+2NKEP7jxz6xs48FUUKUmdsO+WbYcl0GWkonqN+m+6yrEIh0Y8fAK8QqXomdWBXcOuvPpoRi7+HdGrJRoX/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIs5gPFvGN/UsouO/RCjNZyt3ZXE/34YAx6iP6tfaPw=;
 b=CWoBiMHv9o0gA/Ff3QVZzrZZNgwja6lRfIGHSASl+jmz6pgYPtRjpFwHVNHr+d9NyV0jF2nl0RomaFkiMIfBVq8hwKnFhiEel2oECLyPaUnJaBFBXb8NdJZp/WZtcxuypUUxDqCo6bFjb7vnJX+uFOkE+SeZ/Auqszt2m1Fj3JIweSmfaGrAaSrr3zN/Wg7En4BQfjUIK1UqqL9zTNStwp1NceWLG6GZ8h8imGsI9ep3vMP4Ksq1gH11kFSTk9OG38QH6CxKgwOmYNrOPLUJAELe5FkfTvpibraryuT6HKG7KEevamj6DF3sq2gxvbLDkI7XNshziiTTy/pmx8B3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIs5gPFvGN/UsouO/RCjNZyt3ZXE/34YAx6iP6tfaPw=;
 b=GjE55I3G/OHRsfFZHVOZvWtHWwcdtbJzVdeyTq1dlk6S6G+eYPlSMzqeN4ToFd28KOL2bqD9mO5Cs7+pKL6cTbuY3RjsZSAB8K4HNuLbb/v9JXLIKNKPl35WA8Ty/mC+cDN1C/aHtq5aX4oGtJCDP7WzOpZ1ni0YVpt056imbHE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3896.eurprd08.prod.outlook.com (2603:10a6:20b:83::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 9 Jul
 2021 07:41:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Fri, 9 Jul 2021
 07:41:03 +0000
Subject: Re: [PATCH v3 3/4] replication: Properly attach children
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: qemu-block <qemu-block@nongnu.org>, Wen Congyang
 <wencongyang2@huawei.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <cover.1625680555.git.lukasstraub2@web.de>
 <c50f2ea294e2f08f7fc85f29182105ed944e9e7b.1625680555.git.lukasstraub2@web.de>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <69849af0-5dc5-9784-44c5-e383b944fc7a@virtuozzo.com>
Date: Fri, 9 Jul 2021 10:41:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <c50f2ea294e2f08f7fc85f29182105ed944e9e7b.1625680555.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR09CA0084.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.215) by
 HE1PR09CA0084.eurprd09.prod.outlook.com (2603:10a6:7:3d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 07:41:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d12975a3-8b4d-4e65-05ce-08d942ace78f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3896:
X-Microsoft-Antispam-PRVS: <AM6PR08MB389677FEDAF3B5926DC1B493C1189@AM6PR08MB3896.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VmfxHAsiASWcaqwzdX99ySP3WuwdILiZ/kBEpzoSWweXytgXLtkvtj4gac7cha4yFX49kFaDaW6VUOirFIQ8wMJaqvhgt32x0dCvw+N4vdKsPKi01mdar9Ghoxe3sBYd6dV3mvn0MghPFpyq6amy6geFgSXd4Nu4iMDsvp16KArY1yRchxXvqiOSjn5GkE3vJRHqQWhF6cqDiSsTpvRzRZG3m93KoZmVvKWJoH0ewZOCj8nJcV6PHMH4oThbki3C9Dg+QLOd4cXfWBu/DWReIiUrE3IuXsUvPJ5/k1hsfB3EK4QCHCJsFC/g+QO6d1P7M3R5B98s9TB8cvq4H34Z0XtN7c0eLvujvvSQ0vFNLaNVxTpc7sY2nx5WHnkRYJPEoafLxqj8ZX0YkCnEhe4D87hB4+iv193z2KTJ9Md3/AernIYXTfpSsPP51WOHw5dSJdzoJSF4B4mjexrVvMuIQ+v7ekBmI7iW6LDMLSvVOoWRkz0Roekks9eLajM3vS6wppzVDgvc0nFbXw4oTR3VHiaF75CMbBQi1L68lAxcJ8Hh1Y+/vnXtvdbV7RaNKvbJusuJGVnqGD56CJdT6H1WCbjJqoe2H6s8k4zdyh12vRJTWbOVh/W3cR4w9XZLCK4Fq+YWZCOXeIkLeOKRyYKnEOkLup3bjSe51dVNoGhD8PYdtWUt+8me+l1PdDFgbPoF0O3ts1qJMBIbR2cj4xqWekPsRjIWkYqM4LZtixv9CUZP5I2iFm6YgrkPF5eh2pQyCS/z4yi7QXPFtvD5zE87Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(346002)(396003)(366004)(136003)(52116002)(36756003)(66946007)(66476007)(316002)(8676002)(66556008)(2906002)(8936002)(4326008)(83380400001)(956004)(38100700002)(38350700002)(6486002)(31686004)(2616005)(31696002)(186003)(5660300002)(54906003)(26005)(478600001)(110136005)(86362001)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?KnwR3f6St86TeeLqSsNTF5RaCqZ/C05N8c4Z6KstWMcG5aFm6iViWEhK?=
 =?Windows-1252?Q?ZQdElzeIu7vOS2o6tCTSOoC4O6VjEpnvD8y58UswBX0d84mu8zqxcWRy?=
 =?Windows-1252?Q?8enPA/AN4ymRM6aSJz4L1okc8EwO6e1mhcp4iXaV7Q7PawQ4+wEnag/8?=
 =?Windows-1252?Q?HVqYRWmc5HviZ4+hfNQJ6/toYqIt+9sHDt79VXPdt/1XX2ikAo5PVfFZ?=
 =?Windows-1252?Q?8sVCusy9oDWQe7fB9zDGiP0u0zbpt4dgSVa5SFDVTF+c3wdlwfkGvVLb?=
 =?Windows-1252?Q?daEMEwZCmT1N5u6cf5Kmzu9pK+v7Y10irKRjisd0OGtSzvCwXWJzzF2S?=
 =?Windows-1252?Q?Y3MFA4fRetD1v7k3p4I0Ud8rkwMEPmqD9I5cGmEDiomXKX/a4ivbDo92?=
 =?Windows-1252?Q?ofSBLVoyQnJSYi6JTwFMNgkOBE9/Jh216Tc2Mti7uUlaIUehWoIACTBE?=
 =?Windows-1252?Q?m/+H81l8pnWifXzjXV8575OvY4ult3p+FYIhUw6uo50IS3KHao/8TX+7?=
 =?Windows-1252?Q?AVYqKHiBrYFRklXbmtYZBn8YgBUSaCvSh7NsIBjTjO5vFc49Xvo27tV0?=
 =?Windows-1252?Q?Mnr0ikKObqz+lc99zYQoh0ps9p/EtsAkulABdqmZDNSQXhVMowhEA66Z?=
 =?Windows-1252?Q?bwhdmbE2zpST9NUcFo5E/rOAkS0k3viUETGhan4YfEzD+9h8h6xQAYFa?=
 =?Windows-1252?Q?MT5E11bqK1LzwSVHGzFVPXlzuNlglEaRymqoLSnK8d2Bo3/IJyA3VGXN?=
 =?Windows-1252?Q?25Qm4WtVBNJUkXgp2FGsrnap4b8z3/7w1ZO3i+Mt81VZ4KLKUHLbGWe7?=
 =?Windows-1252?Q?OwOCIui4HD7vYp0lkdx0d9khSRmMZ+kmSxEoFlnvThZj6HgJUO1a7mkh?=
 =?Windows-1252?Q?IUIt9lC39gOFC1BMUtDEaIkX3A77pLYB37swBhnQUDp9aoMuxNMKJz6V?=
 =?Windows-1252?Q?iCilt/lNSNayzXl1IhXHD6OKyBOjF6L4NSgm4h5SEfblT0jy9Q1Pe1Bi?=
 =?Windows-1252?Q?ptdLIh7I+GHAYGyrjsEtYDIe2S4xKgG5P4cZoQ8dRpQoIArp0lW9ZlIt?=
 =?Windows-1252?Q?LqSvXXm2MofocEDSYkK0lKiKUsrBniCO8XrBJ/xlrUs26wMjglc5Zw4U?=
 =?Windows-1252?Q?FoMDLWA2diG70ATXPDKRWXyZFC24XoytkMwdgUwsfAGQitlt/nc6TjL5?=
 =?Windows-1252?Q?bfEIksopb7snf2/oyJVlCvWWchj/JFBVlHuYTvXgkUUh+ReGvxUzqY/7?=
 =?Windows-1252?Q?6119Di7TD2hRck8kiBbb+FCOoZHVYZ2tqdBoqh/RFnP5HtWtGEFkfuGZ?=
 =?Windows-1252?Q?SJ2BmNSs33NRbiBmaIJtLgnU1G8yo5k5o1/qNtwWs4JbYxrUXwfL8seq?=
 =?Windows-1252?Q?wzf7Zi9TQoOpFUBXQKAcJCztnWZA95p5mjZRNO55jl63Xvu3vl+slIvU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d12975a3-8b4d-4e65-05ce-08d942ace78f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 07:41:03.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzj63pcZlWIeGtWQIOsidiW+Oix6Lmim8RzLldye0Q7tXUK7bD1/w/crOhQUw9wysQZpo4X3wvoXEqKqNDrEW6L9vLBNvdP+qXJaE/DGCdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3896
Received-SPF: pass client-ip=40.107.4.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

07.07.2021 21:15, Lukas Straub wrote:
> The replication driver needs access to the children block-nodes of
> it's child so it can issue bdrv_make_empty() and bdrv_co_pwritev()
> to manage the replication. However, it does this by directly copying
> the BdrvChilds, which is wrong.
> 
> Fix this by properly attaching the block-nodes with
> bdrv_attach_child() and requesting the required permissions.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   block/replication.c | 30 +++++++++++++++++++++++++++---
>   1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/block/replication.c b/block/replication.c
> index 74adf30f54..c0d4a6c264 100644
> --- a/block/replication.c
> +++ b/block/replication.c
> @@ -165,7 +165,12 @@ static void replication_child_perm(BlockDriverState *bs, BdrvChild *c,
>                                      uint64_t perm, uint64_t shared,
>                                      uint64_t *nperm, uint64_t *nshared)
>   {
> -    *nperm = BLK_PERM_CONSISTENT_READ;
> +    if (role & BDRV_CHILD_PRIMARY) {
> +        *nperm = BLK_PERM_CONSISTENT_READ;
> +    } else {
> +        *nperm = 0;
> +    }
> +
>       if ((bs->open_flags & (BDRV_O_INACTIVE | BDRV_O_RDWR)) == BDRV_O_RDWR) {
>           *nperm |= BLK_PERM_WRITE;
>       }
> @@ -552,8 +557,25 @@ static void replication_start(ReplicationState *rs, ReplicationMode mode,
>               return;
>           }
> 
> -        s->hidden_disk = hidden_disk;
> -        s->secondary_disk = secondary_disk;
> +        bdrv_ref(hidden_disk->bs);
> +        s->hidden_disk = bdrv_attach_child(bs, hidden_disk->bs, "hidden disk",
> +                                           &child_of_bds, BDRV_CHILD_DATA,
> +                                           &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            aio_context_release(aio_context);
> +            return;
> +        }
> +
> +        bdrv_ref(secondary_disk->bs);
> +        s->secondary_disk = bdrv_attach_child(bs, secondary_disk->bs,
> +                                              "secondary disk", &child_of_bds,
> +                                              BDRV_CHILD_DATA, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            aio_context_release(aio_context);
> +            return;
> +        }

Now looking at this I can say that design is a bit strange:

If these children are children of replication state, we probably want something like bdrv_root_attach_child(), and not attach children to the active disk but to the state itself (like block-job children).. But than we'll need new class of bdrv children (child_of_replication?) and that obviously not worth the complexity..

So, we want new children to be children of our filter driver. Than, we probably should create them in repliction_open(), together with bs->file..

Still, it should work as is I think:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


> 
>           /* start backup job now */
>           error_setg(&s->blocker,
> @@ -659,7 +681,9 @@ static void replication_done(void *opaque, int ret)
>       if (ret == 0) {
>           s->stage = BLOCK_REPLICATION_DONE;
> 
> +        bdrv_unref_child(bs, s->secondary_disk);
>           s->secondary_disk = NULL;
> +        bdrv_unref_child(bs, s->hidden_disk);
>           s->hidden_disk = NULL;
>           s->error = 0;
>       } else {
> --
> 2.20.1
> 


-- 
Best regards,
Vladimir

