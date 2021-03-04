Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A79432D048
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 11:01:03 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkn0-0003jJ-5g
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 05:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHkkz-0003Ca-0u; Thu, 04 Mar 2021 04:58:57 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com
 ([40.107.6.139]:49257 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lHkkx-0001ve-9m; Thu, 04 Mar 2021 04:58:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1zXm61Ld4FOuNpS+KEasSuGzUIW91f5BmkJnZ1s1JkxKURqXIBvfeH4G3seA+g2QLMVAOpFtLXvL1fvmPq1Md7drT7ri7V94GTGbN7CtHh+qOpdL8J5txrX3HJ44MzHW6zqqgs9V/o+vvneUF0gcl39Wr9Qbbcj+yHdER4x7KSVpw7w8sQQrHl1cXmkYRCUIETxx8pmafxj517rgBlXLUbEkJhtmtIumXJgrzS9ThPMmn9fYuT9auzer0uK/yhyPe9xbt5VlFB9vN/hqGLyvfemmDpB/o2ZlT6OLgSflahNySE3xRYOtn7x0SxdnBrP0eNnY/cH5dJ9Af2ZmVz9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3l+BbLTzt76+18hwohHolso1rB7srPPFUj5G3ZIb38=;
 b=BtEqBxGL6nTEHXnnSrXUZUe+zFZOrK0NluDBrLMtzMq2gIXUPPvEpnFh3yCTRaQl3oxdFMXDtnQtKv5BpnbaqETnVzwf84oQUp5sdOoSB0B1Y7XxcP/pPOTKul8z3/9lpySK7AuCfUD15QD3VCvoli3u2iHKLAV45WGoITfiOMIrfGva5eoP+X5HP8sR165+PKPI9uADksv1d4pEy8PFpUdf1N6LNds7CxpBJbmK7zMA7ZlCmq6pxsriE9jjduQwp6RoSy3UrLICdX4b9GmWV8hSQEOjmFAXp8lMCqVlugMBAXGWdYmjX1c+7edDJi+slZ3vbh5+v0Eci9WwDIExgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3l+BbLTzt76+18hwohHolso1rB7srPPFUj5G3ZIb38=;
 b=Y9Z5FWGj47TueqkEHDfK+yE/7r150cDl28NC78k9u3IBDh70h4h7l2EHmbNQghD4fe4NSGUKkOzf4C4Wsg4BQkXmlgLaPFEye+eegWwOPsvXsfyMnDjfj7xtxSLgVZGFIdla2Kze0ZtHQM1Ubxo6thsXxusfsFQQhPSwnjWxMUM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4851.eurprd08.prod.outlook.com (2603:10a6:20b:c9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.24; Thu, 4 Mar
 2021 09:58:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.021; Thu, 4 Mar 2021
 09:58:52 +0000
Subject: Re: [PATCH v2 7/6] MAINTAINERS: update parallels block driver
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, eblake@redhat.com
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210304095151.19358-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c5463f61-b9ee-bbc3-bd26-312e352f546a@virtuozzo.com>
Date: Thu, 4 Mar 2021 12:58:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304095151.19358-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.246]
X-ClientProxiedBy: AM0PR02CA0220.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.246) by
 AM0PR02CA0220.eurprd02.prod.outlook.com (2603:10a6:20b:28f::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Thu, 4 Mar 2021 09:58:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440ec3be-7469-4d22-7cc5-08d8def41d88
X-MS-TrafficTypeDiagnostic: AM6PR08MB4851:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4851BCA77C6A38E5E0A89776C1979@AM6PR08MB4851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnOx5WVQ6+NKFgM84E9L2LTDek8DnEjkXrtIp62/y28VNuYrY7nEc9geQMZFDE1FS6xsgmhi1fhdMpuxHtws6zmGU8gVOsqaDTf87c6m/Nl+jCwLHzI9fguRpdZYCfo0WaNJEUQpvw27/vaRrY2NHhFRBmjez3iVOAiyxdRj8FTRijhmnqviZmRjLYvTSJb/T0MqvcmrRWV021CP8KhTOiJACkHXOEoKN/J37QNQ6Z5Sn+xM+h+U4e28vfDow1Jhk/PDFKApYP9pB6ZbTuDWgoSPw6/WtgbTotFh964zDysArLlcFxykbbklVPSHnRtbckUnWyooNALUAqRcrCFjo9ibiB2MD2U/eOGAQablEb5HDczfYys5I/9Bq2TGatMmMVt6MMzxgsWamos/GtX+4L4M4kmsepQvVnCTdyXUu/LHOo9F4lTDPKj3mpN9bVKKXr/pQNbyuR8vY406+oBXtjyUmHHZJJMdBp5QTNkbLSyHwo4l7fcdyuCQWQVug6jQ4tDybP90ZLcfriQ6iLDhhRZpx4kEW0QkpUQ0eYsHC+HaSwN2vlWIpVfRI5MpgvluAarSRdTxxDzXyCOvBQpsTdSwFljptsnD420iTkeZk14+R9CKwDFt7LAlwb/h+sBtfrScFQsSyTrLvhUL5OSJjIEXwZZwMgWo8rNMlT4o/vEIwfrnv3wiVv1uHxJOAHND
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39840400004)(6486002)(478600001)(52116002)(16576012)(316002)(5660300002)(2616005)(956004)(16526019)(31696002)(966005)(4326008)(8936002)(26005)(66946007)(66476007)(66556008)(2906002)(8676002)(31686004)(86362001)(83380400001)(6916009)(186003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzBDQ1ZuUFdoWnJSNDZvOGhrcCtDNkxzaWVabVl1aWhRdVZJNnRpMzZ4TXZp?=
 =?utf-8?B?YXVVTTBxc0FxS0U1VmF0MmdnLzZKV3RqWWEzTUdoRHZENVgwdytuZ0VlRFFh?=
 =?utf-8?B?WUtZaGpHZ1NzRlhabEYzaU1VZDZiRVZDRHRocGMrQXBlcks2VHNqQ0xRdXNC?=
 =?utf-8?B?c0lkd0JZV3dBTjlTQnBtVG1OcXhrMWcrSHB0U3JDSXpWNUJZWlNDKy9jMlQy?=
 =?utf-8?B?UHFwZjdjVVljZTROdWNYS2dvN1FyYzF6cERPMGNMeGdaQnorQk80UjNQVHV2?=
 =?utf-8?B?RWVMaGJPU2lpaW83UFMvY0tnUFFqQ0k0cENWZlBYT08zMlR5eU1zR3FZV0Yx?=
 =?utf-8?B?b3BiRmVrWXI3V2xvekNZVkdYb0RGb0lXVmNvM1JpVlRLY3JBby9LMWY4Z0dv?=
 =?utf-8?B?N0diUWhDcXh6ZjAvbmk2dG5jamRJQUxVQnpKTlFBVUt0dlJTVGJBWGVtcFJ1?=
 =?utf-8?B?SE1uSGJMZ0dnTCttYXFjR2ZUcEVqREs2bDB1VDRTdUVyZjlpKzY1S1JkRVpQ?=
 =?utf-8?B?UWx3SElJTjYrQVVZeXRwYjBBYnJ0REFnMnloSVVsU25ocXpjcU5VN3BQbHlu?=
 =?utf-8?B?VG1sdy8rWEZVeGdDWTM0M3RWTTZQSURZS1UrelMraVA2Zk81WVEyRGRzMmdw?=
 =?utf-8?B?WHhkZm5FMTZ4Q01Na3ZST2N6WWNYMEdZTmErUFdwbURGS0FVMTdLMEp3T2tr?=
 =?utf-8?B?MUpCVCtTSGdRM0lYT0dDUy8yMDJXdXJyY0dMV0wveTNmcTlTd0lGT0hNUHVL?=
 =?utf-8?B?OXdwSERwdExtblc2ZnBpWDR6Q3ZnalpsTERXdlNyY3NuTW9IdDYwc1JHMXdm?=
 =?utf-8?B?L05xZXRETXZQSzhtNzAwUGpueWNFSGdaWDR0aFJ2TEZ3Ui9RNkdXZEI3TFFV?=
 =?utf-8?B?OHFtaXphdXd5cVo5NU10a2NtZkZFWEQ5MGg0bXRuNGg5QW9XcktQM3k1djl3?=
 =?utf-8?B?SzkyVkFrN29heEFHUFdkNTJOT1JLZUdIeWxaR0dVU1UxemxUa2lZREtQVTFr?=
 =?utf-8?B?dW90N25hYWl2UE9RZ3R1Q1p5RllMcjlTdGZLcm5tVXRtUFluY05rSjFPa0hY?=
 =?utf-8?B?a1lwQ3I0dXdJNFFxRUJNdjNJczZ1a3VoL2NhT29lNVVIQm43RGNzaWNtTFJV?=
 =?utf-8?B?c3hUNTVqcEtsTlVSZVplR0tQM2JFd2RXTXhGa3pKQnIwVDUwOE1rcTIrYzM0?=
 =?utf-8?B?bnE0V3JwajlOWDBLYWdiV3JZNzI5Q1EvLy9xVVNGbkVSVjFpaU5kdGp2VzBh?=
 =?utf-8?B?RjJjNG9nOGNqMmRWRFdnN0FhWGFLUitHb2ZKYTNKaDIwQ2IzTjdOd2lhcHVE?=
 =?utf-8?B?Z2xCOGVNcjd5dVpwSWoxSTVWMUcxZE5DK2Z0aHJqeldYZUVxUW5rOXdQNEp5?=
 =?utf-8?B?NFBKcmUwYTFCOE90RHlleUhiVy9uRHc0NHp0bVNVYzdselBTL1U1MTdhaDZw?=
 =?utf-8?B?bTJYMDBsZXhlNTdsNWR1aTdSWXg3OS9zS2t0a0hHWWRsQmdRWGxWTDFvbDVP?=
 =?utf-8?B?WFpwdnowbzFXT3U5REhZcUYvendyODI4Rm1sL3VZS0dnVTJya09GN1VYZm40?=
 =?utf-8?B?cS95S3g2OWFadWZ5RXVZdVhRNmJWbjFBc0lUWmIxV09yeHJCOSs3UE1IcTJl?=
 =?utf-8?B?UTFmUkttM0dTR0cyeVA5ZW5ETzVlMElyWTBNNkp3QjlRUCtOQUd4QXBpNUFs?=
 =?utf-8?B?VTJvc1hwOUdObllsNkxOVU8vNWhINWpIZlNsandqTFVsVU5HUS9xRkZzbmt4?=
 =?utf-8?Q?NvPqu415syD+mtNIVc60Mdkyh6VVJHN835/L1bG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440ec3be-7469-4d22-7cc5-08d8def41d88
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 09:58:52.2577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TsIGLWZJpIPe5fXVXd3bEw14dwKctuNffTRvJdzW/T31waphWZJQ2KbC/xqfzYZ6NZH3sdxX6E2BNlUHasgSqwwmGl2k4fOi5O6OrG3C9lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4851
Received-SPF: pass client-ip=40.107.6.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

04.03.2021 12:51, Vladimir Sementsov-Ogievskiy wrote:
> Add new parallels-ext.c and myself as co-maintainer.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..92ba1fce5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3117,9 +3117,11 @@ F: block/dmg.c
>   parallels
>   M: Stefan Hajnoczi <stefanha@redhat.com>
>   M: Denis V. Lunev <den@openvz.org>
> +M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>   L: qemu-block@nongnu.org
>   S: Supported
>   F: block/parallels.c
> +F: block/parallels-ext.c
>   F: docs/interop/parallels.txt
>   
>   qed
> 


squash-in:

diff --git a/MAINTAINERS b/MAINTAINERS
index 92ba1fce5e..6d6480e1b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3123,6 +3123,7 @@ S: Supported
  F: block/parallels.c
  F: block/parallels-ext.c
  F: docs/interop/parallels.txt
+T: git https://src.openvz.org/scm/~vsementsov/qemu.git parallels
  
  qed
  M: Stefan Hajnoczi <stefanha@redhat.com>



-- 
Best regards,
Vladimir

