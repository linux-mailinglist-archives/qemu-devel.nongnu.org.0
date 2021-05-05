Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637F373610
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:08:15 +0200 (CEST)
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCZq-0007Fz-Hx
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCXp-0006C7-In; Wed, 05 May 2021 04:06:09 -0400
Received: from mail-db8eur05on2130.outbound.protection.outlook.com
 ([40.107.20.130]:19329 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCXj-0002aj-2e; Wed, 05 May 2021 04:06:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1/musCugUzgtKo6Ze7xxnquCT/Agd/K30p7SxS3To1Yzd6rQC4qL3PJJ5UWUIv0zitYlWPTzc3G2OlsxIhrN4xiQa0clId3WNSpNRRn7ADUAo/QwAMBCqKyZqZ3hVRuyI8YQk08nJD7VQ3E+iWpp4gqINVlW4jbi4Vromzgi1VDHOVxGuIwp+zOaTdtYhqrUJXpmJGW3jBmokB997W3rpnh++lYePai1wV5e4fqcTRM+RFsTKq3lfnKOXn0k3PGbbvjNZfbpOLSH3s1wIJWS+q2QKkk+hjOHYPQHYqk7+TsO/mQ4TmaPKJv7JXM/WFH/miIO4uT3p3BLj1LOipH0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC2LrG6+y+yqT83vbg9TLFuuJL3DTD7DBVn34ryniUk=;
 b=MZMYxbDyPWDuG+O53n4GbYtC7XHdF+sRy3uBcnHqMtmNGyb/sM+hKU8AFQC9O00xi0wn6mOQLRCL6pmwIKyaiXM0FegoG2lJMXeUmLCEgeMrm01zcCbSHIVe8GRzbX4Wh1Z2Z6e8H18dmvzx/FY0kSKMrrg5VFYahVu3T+XU8XDUNNwBnqG6WnQWe51H6G2SUTbiSnrQ/EGQJ63ysbQ6dpDQa6CtlduqTN6e/0E/1DuU23T+b/ZyaMLhL4otxsqi1C5tCLGpJ3xS8Sw/QJxnonoyqm8ciWxKTxhkG6md8UwHz5RpOXF2FRKlXZrFa0iML98LEghpkJHC4QRimqQG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC2LrG6+y+yqT83vbg9TLFuuJL3DTD7DBVn34ryniUk=;
 b=im3vUd6WVvaQDOund2ZibnTmsTJxJwaOS2+ZdOVS3aKHcVXw9P8Tm6UdVm7TgDz5P9VyKq2iwTMzQEGMX3tRIY7i/QbMuavb0Gymqeg3KHTyGpOghaAoZKzasTUl25cQlK6aXmh9w6vXT0YmPvuT3FycWglqWjqgY+GuqYjd8So=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6948.eurprd08.prod.outlook.com (2603:10a6:20b:347::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 5 May
 2021 08:05:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 08:05:56 +0000
Subject: Re: Prevent compiler warning on block.c
To: Miroslav Rezanina <mrezanin@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-block@nongnu.org
References: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <62c90da0-b2f9-7068-e84f-c13bb1527191@virtuozzo.com>
Date: Wed, 5 May 2021 11:05:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <1162368493.17178530.1620201543649.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR2P264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::33)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR2P264CA0021.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 5 May 2021 08:05:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cabf2bfa-dbc9-4ca3-9323-08d90f9c9c87
X-MS-TrafficTypeDiagnostic: AS8PR08MB6948:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6948D6AA6D01729FB52CA413C1599@AS8PR08MB6948.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:245;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xs/u/wzGLtUFMEYawKJ/JB683B2/KrSIZlA+mgqw1J0sEc+m3BmhQlATGz7ZIrKKGdDsN9MvBcuN1mYhccPnfsS6pgWQYTpfVdpa1mrIgws/JNhhwYbOl8kNrcOc8O8AKVH0b3wN1n7vInNvKc33Ek6mZplEvBT8Bsu4c5duAjMQKhxv0H/aI6LMFi6TQirKOIdJW+GTaBro5M7fp7OWjROev0wxd7HQU/loJipBIskF2rbij70EWptGEPtqxFPLP+MuGU7B7wxBvQxKRjIYa9MmNZMzvfkVvLyw6Gws9JMGoE+HvPZgq421NDxQesHlE2Ytpo/YSMV1R2ySiCFmydRwzMpjbWO9UMUiqzDVpgwHoXmZ+uUVjYQ0L8SYeE/5E7wnPnalSrjapMDK8YLu5B3DwTLRZ/dEOvJzqOiuIm4jv/5hkzyMbBe01r7ADNA2r3ufbLq8hdbogDK1b2grARvJccXKy8EF6w2s/NKuv9CHUN5w2/mEXha0mC3YxsQyz4XSfx3zhmGgDNM8CkLnaNMZ8EIxX3bj1kh/sABnRiWuVoNiz9oD9REDB8yIEgfjI13QKV8PtquWKcoM7tZ0+Ehg8aU5cKoV8BN+SrOgaOyELCEpVHYw/NbZQ6dI9XT+oZFM4yfrmgBz8g8ZHalxjcb9e8dom5fU615fXo6I4Pd/lshQVyW2xl/HDcv2Yl02aotH9Uastdmto1Ji/ajJuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(36756003)(6486002)(31686004)(8936002)(110136005)(5660300002)(31696002)(186003)(8676002)(2616005)(478600001)(86362001)(66476007)(66556008)(16576012)(956004)(2906002)(38100700002)(26005)(38350700002)(83380400001)(52116002)(4326008)(66946007)(316002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUliSVVTaDEwOXVOcTBVZ3ZlMFVldFVvK2VRZkpzSldBd2k0alRvUXIvOGlW?=
 =?utf-8?B?WGRNQ0lHWjBsMjdveXdTY1h6dHNoU0hGWDBSVi9vWlVEYUdaZlNiRktqRHlt?=
 =?utf-8?B?OUVleHhDYlhvQXRPdXcybjZ1MXlvcVEzcU1CMG5vV1ZwU0JWUGdNNFJONDVu?=
 =?utf-8?B?UG1RblNKMy9XNmFOZ1VrbUFBQ1hiWm14a0hCUitIamovdDlnc3VLYnk5ZThD?=
 =?utf-8?B?YXJXK2lvL09YK0dKT0JTVTJiVFU2NFhPNTIyc0NKcTVRZWpKRlR1dzhBV1I2?=
 =?utf-8?B?VncvTytLVmhkY1pvbVBZS2dzdzNFSXkrZExidzdYeWw4aitnQlZTZmhlU21x?=
 =?utf-8?B?Y3ZRTDZkOUJQVFhGdXUxaUJrdjc0K1F3SUxoelV5blVDeTFKRTgyZFZwSytO?=
 =?utf-8?B?WVM5ZHlDY0VsYzlTZlgvTzJsVHAvYS9mRkZOdW5LSE5pY2pHSDBvdVh6cGZw?=
 =?utf-8?B?emtCUXRKQnhkWjcwaFZPaFNnQ3JGanB3djhpajJ0Z28zZnhwWEZZdjAxTXRM?=
 =?utf-8?B?VkdvRUlRbHVvZ3FUWGhWb1lFNkFSN2FPNTk4WDFMcXFORFlCaUFKSkVCenZC?=
 =?utf-8?B?V1NoamR4TzI4L3hEL0swK2QwSjE3Z3A5ZGovVUJkNXdLSkdEeU1aNW5FWkh3?=
 =?utf-8?B?QmI4cjVGenk5WGwrV3BKSlBhc084eGcyS3dVWDMzTHBGU0RLek11aVJhbEs4?=
 =?utf-8?B?TnYraVlqa3lwejFjbk00MW1wK2FQamUvZ1o4Ti9PcXVzWFBReC9YVjV1akZr?=
 =?utf-8?B?QUVtb3NGUDZMdFlpVDdrcENRRFRMcTEyVTRRdkFUdWhNV2hDdFdOV0MyS01W?=
 =?utf-8?B?Uis2UDZZTmUvVDZYM0tEc1IwNXhhYmFpN3hYMitUdkllS1M5OHhIQzVJY1JF?=
 =?utf-8?B?eUdxZUZqVy9ROXdvTDNMUWlvM3BNK1JLNG90bWdWY1d3aHhKVDBiVlRiOTdL?=
 =?utf-8?B?SzlVZXVNNmNUaUx2SHNJVDdFd1Vod0NxRHEyeDNiQ1l4VS9CVXNzbStwckxq?=
 =?utf-8?B?cnc2Vm9XR0lGSHE5RXlLbFZ4alBIN0dmNWhKL3c3VXZiaURlbXNtaU1CTDU0?=
 =?utf-8?B?cU11SEF3RlBMZ3RqeXBwckt5U09NUjUwdnN1amdrK3o1VDB4bHFsOVNaRjFN?=
 =?utf-8?B?Y0g2OVNLWWFZWFFBWFR3Y1V5bVBDMkJKbHovc1NrMG4rODBOd1h2MlhpVTFB?=
 =?utf-8?B?QW00b0pOS0FDeDhTUnV1OGFpRUhLMW5VOE9CL0xzaTJUamhkdnUxZDRkNlhG?=
 =?utf-8?B?b3UrSXB4MkZMTzVrRHBWMGNTMU1EUEZjYmFkYjNTc042OU15VXA1bnpuSmV0?=
 =?utf-8?B?SG52OXRVRXViWjRoeHFTa2NRWVlQWU5QNmhUNHExUlIyWHp2UEhXZmp1azF3?=
 =?utf-8?B?b2xiRitmT1dlTWt0eVEveU9Qc1dQSyt2Mjd3UXFzcFJYWlRPaWo5N1dnaDk2?=
 =?utf-8?B?UlRVaFB0bGxjU0owQ3F1aE4zNHJqZy83UmRWSDFybGJMNTNtRURtOW1BTXJT?=
 =?utf-8?B?L3JGR1FkVTdibHB5cE1kaXRHNVRxZmdsZjM2d1AwbHlaSkVrZGNoNXZKZ3J2?=
 =?utf-8?B?TW9oMURkQjFndkxQcjJGUnlwRStRU09hQWUreU83Qk9wc1VHQzBETnF0MUV1?=
 =?utf-8?B?elYrbCtKNFN6Nlg3a1YrUGVmM1IrWCswZ2g2dnNyRElGaVFOYmU1bWRnRDlX?=
 =?utf-8?B?T2VBNlAzOWpkd0tCVnhlNkZGVEo2bjBYYW5RTGxOMkFQcUl1ellsWjBwS2hv?=
 =?utf-8?Q?IgVWYal9JNOdXBslrzP0hk0gXZaR32yXfDZZpYK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabf2bfa-dbc9-4ca3-9323-08d90f9c9c87
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 08:05:56.5957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yvvuieUdFFmbNNw+7/YFJVx6xGAjEe8dbMK3IZqxgZH0M2SL7dT/c8SQPEWr9hyXP4nMJFM/eFTU6Iu0elLjH1GUqZWAmZEk8Zoyc+TmRzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6948
Received-SPF: pass client-ip=40.107.20.130;
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

05.05.2021 10:59, Miroslav Rezanina wrote:
> Commit 3108a15cf (block: introduce bdrv_drop_filter()) introduced uninitialized
> variable to_cow_parent in bdrv_replace_node_common function that is used only when
> detach_subchain is true. It is used in two places. First if block properly initialize
> the variable and second block use it.
> 
> However, compiler treats this two blocks as two independent cases so it thinks first
> block can fail test and second one pass (although both use same condition). This cause
> warning that variable can be uninitialized in second block.
> 
> To prevent this warning, initialize the variable with NULL.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
> diff --git a/block.c b/block.c
> index 874c22c43e..3ca27bd2d9 100644
> --- a/block.c
> +++ b/block.c
> @@ -4851,7 +4851,7 @@ static int bdrv_replace_node_common(BlockDriverState *from,
>       Transaction *tran = tran_new();
>       g_autoptr(GHashTable) found = NULL;
>       g_autoptr(GSList) refresh_list = NULL;
> -    BlockDriverState *to_cow_parent;
> +    BlockDriverState *to_cow_parent = NULL;

May be

+    BlockDriverState *to_cow_parent = NULL; /* Silence compiler warning */

>       int ret;
> 
>       if (detach_subchain) {
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

