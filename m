Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA632D2CF2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 15:18:13 +0100 (CET)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmdoi-0007Xz-2M
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 09:18:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmdma-0006PE-DO; Tue, 08 Dec 2020 09:16:00 -0500
Received: from mail-db8eur05on2095.outbound.protection.outlook.com
 ([40.107.20.95]:53825 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmdmK-0002sb-JH; Tue, 08 Dec 2020 09:15:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdA+ZRu3yR6kqL4kH8heuWeYXo0d64XdKPIpsbHdQ+RwhnTlVR8iT2zFYxvXSHHuMc9QSUSiDaGc+TrCqaT+M0gFMA9TN6CEwJERe/hmHBgqa9uFzUyF4AEGcJ1GhgTBRRs0Yd+WLrLhNJ+28uq6df8QANMtJlERxRkyXT/jUOZWE3DUUSTqQQgW3oZJA7h91DnuMzXmMOLTksa56sMpab7kroh7wzCUysXg0GUin603TpVd3fQiuhk9BZUY3rsADlJvF/z8qcP7KPllEffBaTmpPF+b8oUCf6Ma7lJyZEUsg34ZtypgIVgVbxtCJHy+j5QgFlaQUuK+YkaDsTwg9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRJDHV6OI6p6AfqKAD7CY//vKCa4vQdKomi00MFbnCw=;
 b=A71pV1BoUaS3gFKhviPewQUW6DBHGLsLCf089MzTwW7Pu0pzoacPBizjp25d8PHplexZQLA+gqi1KwQ/Bpn3yeL73HvyHmfvRTCx/2YZxo6k58hpwqNpcZ3jhtChRQf2Ed0f3qPyB81D3enw353D4FejMhDuaXaH3/B3mxcrNtp8txiVdfU3MVC7KDH7gSts+FGPvbN1CBVfjf0rXcpTazx1TOViXCOEO11ikXfMvmwwkmMZyGcDF0RoTDlUgg5WwLCGF8opMuIPkrnK8Hs1NxVKQJfeUjHU40yLplrCewdNLBFO7Cg+y/FIOV5VfSostRJ5L+XhmgqxIJQWWaZITQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRJDHV6OI6p6AfqKAD7CY//vKCa4vQdKomi00MFbnCw=;
 b=Gr4qyk2MaP+BQjMNSnxGKlO/LAKGSMPMFx7wbHXR+kOjh2fo9OANwU0jsk3ejUau5kjh2ka+mnSBX0bBVaVgd+L4LgYj7+wy4tKj1PMgMYxqZQDWHXmk7Fl+xDmDFU7cSQ+NJG0pyuC6kiGdmPC6A8vKD53eZaHqpmlp7jJ+0zw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1869.eurprd08.prod.outlook.com (2603:10a6:800:88::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 14:15:39 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 14:15:39 +0000
Subject: Re: [PATCH 1/3] block: Simplify qmp_block_resize() error paths
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, stefanha@redhat.com,
 mreitz@redhat.com
References: <20201203172311.68232-1-kwolf@redhat.com>
 <20201203172311.68232-2-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <68405fb1-59db-f9ee-852b-52a77cc2a2ce@virtuozzo.com>
Date: Tue, 8 Dec 2020 17:15:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201203172311.68232-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31)
 To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR03CA0054.eurprd03.prod.outlook.com (2603:10a6:208::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 8 Dec 2020 14:15:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a6d5d85-6060-4d4d-e489-08d89b83bd90
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1869:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB186957BF6F18332740510368C1CD0@VI1PR0801MB1869.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OYoche1fFbZ4VlNpimVjSAoEM2LUMpM/xRU8csz6Ai8YuEGwGMiRgAI57jeGcjao5F7BIXkAkesP46THZyOV4b0nxJKF2wDG3iz2W7i7H+mu/iqA6UckTR7g7CDT7cWnPmrl8SGn+O9aJN+uwK2A1GfOYYuuR+/eRfb3sbe2VSuwQ4dT+LgO8mR29OYlerZi4lPnrPHfUMJ6KCtqVPP5V4q51OiQr7AAUmzAMUnnHRWrffZbl8BI3GjIyRHGp5V9a+U6TSmDYbElbNikoXv45RAGyu/qLAUQKDO6n9E2knsy61vAfhL1AnIZ5/OG0hDwPkjKZXW8S/2dTn1WOB2qHsiCxUjZZMM0zX0n0Xd1Bzb8apn5lLp+coA94e2Vx35Npvi8BtbtuDWbIZx2gyQGjn16OXWUBBvARPYJ4jKCWKREMN7wZpjWksr8hFytOmER
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(31686004)(86362001)(83380400001)(34490700003)(26005)(2616005)(508600001)(8936002)(31696002)(52116002)(186003)(2906002)(6486002)(66556008)(36756003)(16576012)(66946007)(66476007)(5660300002)(4326008)(16526019)(8676002)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TnhtbDlXa0pYeXdpVi90UFErOXp1V283S0JqbC80L3dlQkdENzBESUVOeHpT?=
 =?utf-8?B?cHB6UE5jTEhLR284TWF6Mllacy9zbWxPblcwc1RIdjJlSmhmWHBPcWNTYmR3?=
 =?utf-8?B?Y0FmdEJ5djZzVUdjbmdybitwQldtY3hzZVh6dXdKM0JsdjA5VHFydnN2WHk5?=
 =?utf-8?B?dFd1RFd2UWR5WENyOHMzeG1TQ29tVlhpU2I3SEtGRmRpcStWQkZtVzFKNmFk?=
 =?utf-8?B?bVRWcng1R0ZuZldOeXNCNkZ3TjFadnVMNDFiNDNzMVVFNGtvS08rc2N2RjhG?=
 =?utf-8?B?cWszS2FqVnluY3hpNXVHSW5hMWIxblBlaXkrZy9SckpYeFJNSWYvK0x6aEFI?=
 =?utf-8?B?TVRtQTlzV2VDQmFvM01uTlFHcE82UEhnL0owa1E2bDV5MG4vUTFhejZmYUVN?=
 =?utf-8?B?dDdDQWJkQTdVV2NjNVd0NHRsUVJpVzhQejdMRFdYejAzR3gxOWdWQkwxMmRz?=
 =?utf-8?B?RXQ4ejNyUER4YytBak9oM1E2YTA2TTk3eVlubXF4NTJzd2tiUzEvTDRnTm1S?=
 =?utf-8?B?NXJMZXltWmoybXc0N2xSR1BHZTZ4R1cxQTJLcWNpbDhCVzZiakc5SEphUjBh?=
 =?utf-8?B?LzhJOUVwOXNOTU95T05BTHNVODRuVDMyeEoxV0tNQ1Bmb2hHUVFWMDVWWkxw?=
 =?utf-8?B?OFYxeHdlT1J2cnRoWisxTUxPSVY3aE55Q3p4TC9JbFh0cTNJNFVJVEpublRE?=
 =?utf-8?B?b0E0RTJhUHVLSTdEWkNsSnZTRzlFd3FwOGFOQ1ZMNnFmbGdhZmtPY1QraW5a?=
 =?utf-8?B?NHhPNU5mcUY2KzZQSkZQM1R1d3RTdVk5SXVLeTJIaS95NWlzc0ExRVNBaGZR?=
 =?utf-8?B?cjdVRW9sWDBPcW9VbWZSNGJnT09RUEQ2MDRXRnJocEVBc25GRTErT2FIK3hX?=
 =?utf-8?B?R2h2RVd2aDNaaVFucFVCUHZieTVCYXZnaWRveW1weStXelFFMi9OM1lOdno2?=
 =?utf-8?B?cUgvNmZkNCswVWw2OVNadjIwdGM1KzhUNlpxR05UaFVTWHUvK2pVNmpHaHh5?=
 =?utf-8?B?dG9GY2pxdkJ5ZktYajMyTFNoRlI2cVg1amw5MW1wZ1ZrR2tsZnZoUWV2WU9s?=
 =?utf-8?B?dmJJTjh3TXlNaEFvQU9pYmpOOE5OcUc2ZzI3R2RWUERMUTYwWjNHZ0lMQmxO?=
 =?utf-8?B?bDg4Nittd1VoWG1wNmF2UlQ5ZDJnbE9LRWE2MTJvdUVLSHlWWHNjY3VPWEFl?=
 =?utf-8?B?eEl5dFBXTVlKV1M0YlBpbjdyUklpL3pob2VURVk5djc4all6UEd6QUtoaHZa?=
 =?utf-8?B?akFLdTlWcVNWdGVBYk84eElTL0tKUVlmNUU0b3JzUk84OHcvRVZrZ2VxWlla?=
 =?utf-8?Q?I9tXJFW33msuzRA1wolJnmZuKaMRpo2eiD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 14:15:39.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6d5d85-6060-4d4d-e489-08d89b83bd90
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui9ytav3lWda+OKv4E0UnLtzyJWbJYFrD/qQRka7EYwqnu2wlv6lBxvThwGtDN0SsffsOZlznD+i44dR9a1fNCwVcpQ6SWXb9Y4Lp4JbZmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1869
Received-SPF: pass client-ip=40.107.20.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

03.12.2020 20:23, Kevin Wolf wrote:
> The only thing that happens after the 'out:' label is blk_unref(blk).
> However, blk = NULL in all of the error cases, so instead of jumping to
> 'out:', we can just return directly.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   blockdev.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/blockdev.c b/blockdev.c
> index fe6fb5dc1d..229d2cce1b 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -2468,17 +2468,17 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
>   
>       if (size < 0) {
>           error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "size", "a >0 size");
> -        goto out;
> +        return;
>       }
>   
>       if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_RESIZE, NULL)) {
>           error_setg(errp, QERR_DEVICE_IN_USE, device);
> -        goto out;
> +        return;
>       }
>   
>       blk = blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
>       if (!blk) {
> -        goto out;
> +        return;
>       }
>   
>       bdrv_drained_begin(bs);
> @@ -2487,7 +2487,6 @@ void coroutine_fn qmp_block_resize(bool has_device, const char *device,
>       bdrv_co_leave(bs, old_ctx);
>       bdrv_drained_end(bs);
>   
> -out:
>       bdrv_co_lock(bs);
>       blk_unref(blk);
>       bdrv_co_unlock(bs);
> 

Initialization of blk to NULL becomes redundant with this patch, so may be dropped too. Anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

