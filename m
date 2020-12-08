Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4662D2E9D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:50:25 +0100 (CET)
Received: from localhost ([::1]:49846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfFw-0001Vn-D6
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:50:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmfDw-0000HC-1m; Tue, 08 Dec 2020 10:48:20 -0500
Received: from mail-db8eur05on2122.outbound.protection.outlook.com
 ([40.107.20.122]:13312 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kmfDX-0002nE-9h; Tue, 08 Dec 2020 10:48:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqaufufh6syJMMPifaGSBH6uqsLPXrHCfgNi9djI0EqDdMevLgDQyr47NkjOEWeyjzgYxvLkB3L82ZptctWZR8H2QSvuB45Y7UptGJH+NTec4Exv8MZrNmegUs4J7xrSxULPBcmXxvxvIXCCJc3/L7vqDj5pVr2UqMcvRg/jolz6O+pdq+fItwlIkzkBllULwkPk87OQq2VX7BloBQHpJsoFGiGV8QvP8r6KOC0ZU2iZySrIhjta+DoVZnhgdsNOoQWS60REhCJlevHz8xSpIT1yFttw+lshUcAGuO6nxpUJUdkxG1fFCXzlsJblLrrDGffya7oi/OsxmEs8Xp/OeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejIrDnpFU8WsHerVDAlGeu8f/z4SxUmH5QE7nNu1UAE=;
 b=IgT0oFX+6VNWfEX/3YvQG6gXWlpVxfYgOyQw+B+Vs4ToPxWdkzUUC8iKgUJJjRnMXAlCBGlr8spynD4buZ8vHWFO0L7VdpmOrab34Nrew8+JC+m7ScgjgtAXWdy4j7Yjvj79B4WzQJxqtlHKIsjMAaaqIhlltr2OnA5DuEKGTbsVExwO7yCqOWy9q1Uwgh5A7nOmma9TJAktAzXEfzKXmJ3E/kZg0hfgcRIhSxwEtEFiYNwwn+XSj5ll5G8iWnEdEXTKmwEhn35m0Wh0xAzZ/yqNVM+v3bZvpDsTvGJzZLHBrcslv8NhwPFxVItIytO+LgRDhl3AybEkyGQ0Y730pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejIrDnpFU8WsHerVDAlGeu8f/z4SxUmH5QE7nNu1UAE=;
 b=UW/hUyJHqPWdsbimpD9wh2Y0uVGTeFG9JKN6HVMallJs0rmjiw8RkH6ynsjazpAwY8ZAHrVVoxHQWYIkTO2MUQv9DEiG/w7VkhprTQ6rpujzS3zNdge4qviHJR3Hlf3yhtceaYI0iTcCwQ5ANdDhqRNU7uLuemfAS0L9FcQxS7k=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com (2603:10a6:803:137::19)
 by VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 15:47:50 +0000
Received: from VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179]) by VI1PR08MB5503.eurprd08.prod.outlook.com
 ([fe80::44c9:5ac7:5302:7179%4]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 15:47:50 +0000
Subject: Re: [PATCH v3 2/2] block: qcow2: remove the created file on
 initialization error
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20201208142159.492489-1-mlevitsk@redhat.com>
 <20201208142159.492489-3-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <87338c70-225e-d238-3a68-acd811716aba@virtuozzo.com>
Date: Tue, 8 Dec 2020 18:47:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201208142159.492489-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::39) To VI1PR08MB5503.eurprd08.prod.outlook.com
 (2603:10a6:803:137::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 15:47:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0169906-c962-44d9-aca0-08d89b909e00
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1854:
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1854C013341F101498D70311C1CD0@VI1PR0801MB1854.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDFMyCOUbgPLQmFG2DU4O79ZgsPlK2KomOz9tIJ4E+kSSaPD1rxVGLwWmSnQT57URa2UNpfNQh4C1JyvXJ1XKgMd+k4AWDnALCIu2tidtPVmZiCYAVhSNlzBNBxOT/0mqz1fkmJxVMJAZ0wzxktIHDWbvSusTfMvAuSjkUh4zOcPfTizseQHZarZbmdGZrlqPupXed5mGEWLvb6FXKAP9LKLyHSSE7u6QwGeeI6Rvx+vWuAn8A1e6w4qY3MB7+ntM/hX3a4ip9H9iinsqiLLGmE9UmfmqaN94zdrL7ZtEF+xcPW4iOteQmrnl37t8is3ihcNXzRnhnnsF1Pqigr6l3e6icEF7jrIo+dWrpkTG+GSgP/A8zNzV97EPDH9i0Aa9jCmtKiY3QV9kvOM9sR2NVc4x+lUSUteINQcY7ViaAGl51fSyxjcvkTyE46/c/xf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB5503.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(16576012)(16526019)(66476007)(186003)(26005)(508600001)(956004)(5660300002)(31696002)(66946007)(34490700003)(54906003)(4326008)(66556008)(2906002)(6486002)(83380400001)(2616005)(8676002)(86362001)(52116002)(31686004)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGZBeFFBdHF5cDBYRmUwYjNJalgxVFg1aEtiTzdKRG1HaG05SGdwa0pZajhI?=
 =?utf-8?B?RG04R1JWUnRqZUNPc2hjenNKMERwV3BkZ3YzUTh4dTRFTHRjYXA1bVZoc0dt?=
 =?utf-8?B?YUREYUlZSE1xb29JUnozNGZpQmZ6b0VwWTlXQ3ZkRFJhaTlBWWE2NS84cFE5?=
 =?utf-8?B?cWRUdWZQZzVLQkdQQXJLa0t1VFkrMUN4TWxRL2VkTGtYTU93MjQ0MVpXL0t4?=
 =?utf-8?B?RUI3emZVWkRraGwzRTRTSWhVU1RMQXZpR21CelJtM1g3TVdvVFhES3hDRzlP?=
 =?utf-8?B?eHZITnpVbldaTHBKUG9HQ3UzcjM4Q0JncmtjZkVQU1dkaDNJRTREQWN2ZVRw?=
 =?utf-8?B?V25HQUFmb0FkZkRQVnhKNUlmTU95SGU5dGNSNm0vbk5zaUJ6dHR3YkRGSFZw?=
 =?utf-8?B?M05jQk0xbFFCSGs4d1JEUGRtdVRLQzljN1VSbjlzYUdpN0RkOE9ZVEpSdy8x?=
 =?utf-8?B?UGlSQXJqVkxDZGl3TU1FN1pSY0pONjdMRnpTRDJCM0VpeExOYWVQZXFSVEVV?=
 =?utf-8?B?cTJyTEwrZWQzOEhqOHZKSWFRbE5EZ2paVW1XdDVjSmlPRDNBWlFsdUk5bDg4?=
 =?utf-8?B?T2RwNVo2aTUyNzFteFVEbWtPbDJBdWx1NUNoS04vU09XMUcwUjcwK0VFcldr?=
 =?utf-8?B?OXNWM1A1L2JiKzNtcW1HOGxaOXdJa1U5MCtUaWRRbXVLc3F3VmRhS2lIVzhv?=
 =?utf-8?B?akFGVDlkT0VJWVdzKzNUNFNkK25waG9GTWFxOVV6SlRUZ3BpNlprSjZreklZ?=
 =?utf-8?B?MUdBc2hHMmVyTUtZdENmVGszZWY0K1g5cUJiZTNrd05hTmNaekN4T3dNNDRo?=
 =?utf-8?B?VVhRYnJ2WHJvYkduZEdTUW9VWkp1TEllaFpqeGx6WTJUV0NCWXFvZU9tcVFm?=
 =?utf-8?B?ZitFY2pVRlZyby9BcGdmbGNUVXkzd2l6Q2ZUSStnNnNadGtmRVFhWUE5Z3BY?=
 =?utf-8?B?S3U4QWx5UnAxVlZMbkk0N2JObkRSK213K3ZUcDFQZnFqMEY4N2FGa0NlQWFM?=
 =?utf-8?B?MGNlUGJaeUN3ZHZDbURsOWZTNFd3blpXQjdsTjMxQ3VBQmRDWmFkWi9LZnF3?=
 =?utf-8?B?QkRpVXVBdGNoY0pVSGlUR2JuWlpxY3JKSEJ4VCtzcTZSTGRKc2pJVFJWNTdI?=
 =?utf-8?B?SXdkMjdvSjhPR1Rubk50Z25lWFNQQU55UUFva0EydUU4TXFLdWtqV1dCdm9v?=
 =?utf-8?B?YWMzWm8xbHhKN0kzR3RyT2g3WmRVc1Q1TU4zVnRVemUwQ2RUNVZlckQ5R2tl?=
 =?utf-8?B?dDBCejEwZG1CY2dPcVE2ZXg4a1htMFFmbzhDTzJKRTZyL1EzYXJ5SnBlVkI5?=
 =?utf-8?Q?knHpY5CBEtaH90Q92pQKgRzlXs3568GeSZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB5503.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 15:47:50.0718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b0169906-c962-44d9-aca0-08d89b909e00
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBRuMLtKhBxc3F6N0HCXGgiWrBKSRC3/qIY7nnNvYsMQlR6TeQ3yOtppGEElKK37sDoEMsO44WD0TMKBics9mVp+1E5r0ZzjYftxwVJOrQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
Received-SPF: pass client-ip=40.107.20.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

08.12.2020 17:21, Maxim Levitsky wrote:
> If the qcow initialization fails, we should remove the file if it was
> already created, to avoid leaving stale files around.
> 
> We already do this for luks raw images.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>   block/qcow2.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index 3a90ef2786..3bc2096b72 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -3848,6 +3848,19 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
>       /* Create the qcow2 image (format layer) */
>       ret = qcow2_co_create(create_options, errp);
>       if (ret < 0) {
> +
> +        Error *local_delete_err = NULL;
> +        int r_del = bdrv_co_delete_file(bs, &local_delete_err);
> +        /*
> +         * ENOTSUP will happen if the block driver doesn't support
> +         * the 'bdrv_co_delete_file' interface. This is a predictable
> +         * scenario and shouldn't be reported back to the user.
> +         */
> +        if ((r_del < 0) && (r_del != -ENOTSUP)) {
> +            error_report_err(local_delete_err);
> +        } else {
> +            error_free(local_delete_err);
> +        }
>           goto finish;
>       }
>   
> 

Hi!

As I understand, qcow2_co_create is a new interface and qcow2_co_create_opts() is old, and now works as a wrapper on qcow2_co_create.

I think it's better to do the cleanup in qcow2_co_create, to bring the feature both to new and old interface in the same way.


-- 
Best regards,
Vladimir

