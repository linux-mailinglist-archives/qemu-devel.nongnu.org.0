Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F092D32D03F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 10:57:40 +0100 (CET)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHkjk-0002ZU-2f
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 04:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHkiV-00022G-Ay; Thu, 04 Mar 2021 04:56:23 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:12622 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1lHkiT-0000kZ-0z; Thu, 04 Mar 2021 04:56:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XA6hB1kFO5TbAOrNl61o8x/fcouD6ucOKnaaLMVJl2gn6hmwvQhN+gpr5tJ97sKTL6U5mvdoBYczRYUHWhIQ8jXvV2llruQmMUPfWg7oHrzxDfYV2FMcwhPoCXnkT30hBK2n0gX7QRogKiG2OjhF/7gYIJR40rBIQKLHBcc4VGYV5eW7/Yl13/DrpB4WsUQhFpi3iCY4C9xe6bOhl8Q6fdXdVZzGo/tLDVo4XvNhprP1ioLhIA5MG8xsXQnQEsSXdGJw9j3Bua7aAG9Xcb8KbXaU16WbZ2jqMQRELvktQpJ6PiU8YG3/kv5gxOzgf0c5BjpjM3QPpDwc5egdy+5AjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWX48w1IkhRwaCDpEaQNM6c+/al/DkrDG7m/nm548wM=;
 b=QGG5rkiJVuZaTlMfM8sVARFgYlvxBOG/7RaBIUTQK4rJ+emeNcaeQF9i6MAagadhW4Rr9Rv44ct/oOLnQZTbvFFMs1bKiMNybhyDGXg0OJ6QSlkhkc/QpGG4yeCCP4O1FgkBxzGd+pncdK6pE7qJP2u/AZrsAqoNlcguSV/+pFZrpc5cKBpubsRWZ8J+nGKolCVReNxaShKUswkd9CRQn9X9Ux4iRPW/f94W5ou5hgxkR8W0ZbkM277MD64zogJhN+3oXZbiAOeHuXc/JXXBdcnzgMmKdGjGLSJWaasGMU7qhX+/FxCgS6lWHhYuIbnW35TAEgsBeOfYZA5lTYbdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none header.from=openvz.org;
 dkim=pass header.d=openvz.org; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=openvz.org;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWX48w1IkhRwaCDpEaQNM6c+/al/DkrDG7m/nm548wM=;
 b=RK7gi/65QTxtRRJxjEJM4OY3J1ig6Z1FLWcRCJ5fsDW3K039K6J9yES2x0xEMkM0hXsdQuuuazuT8zJN1NOTfwLI5/QQQzDj0WjOiE2SWuqSh9kDgXCkCeivUQDEXfF0hyXd8002JAfMOeU4Xklsoh49ZnGAP4k4Uuc9wrP7p9Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=openvz.org;
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com (2603:10a6:20b:8d::30)
 by AM6PR08MB3543.eurprd08.prod.outlook.com (2603:10a6:20b:48::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 09:56:16 +0000
Received: from AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb]) by AM6PR08MB4214.eurprd08.prod.outlook.com
 ([fe80::b583:d143:8b9a:83fb%6]) with mapi id 15.20.3868.031; Thu, 4 Mar 2021
 09:56:16 +0000
Subject: Re: [PATCH v2 7/6] MAINTAINERS: update parallels block driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
 <20210304095151.19358-1-vsementsov@virtuozzo.com>
From: "Denis V. Lunev" <den@openvz.org>
Message-ID: <6057058d-0407-3248-9942-c0dc83255d07@openvz.org>
Date: Thu, 4 Mar 2021 12:56:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210304095151.19358-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [31.148.204.195]
X-ClientProxiedBy: HE1PR05CA0280.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::32) To AM6PR08MB4214.eurprd08.prod.outlook.com
 (2603:10a6:20b:8d::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.81] (31.148.204.195) by
 HE1PR05CA0280.eurprd05.prod.outlook.com (2603:10a6:3:fc::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 09:56:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70bfd729-4d6a-4d3f-0784-08d8def3c081
X-MS-TrafficTypeDiagnostic: AM6PR08MB3543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3543C58754C9914F0BAE7562B6979@AM6PR08MB3543.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfZ79xjpUHTckFUJ0rAcovCXk8f6OJpafJN0917m3cosOF9NokaOykWSJwMZxfWfC2z807KQnBcxB86hmfWbMMyxZeDR6KPBSe+DIidEt+wXax0pvV3NtJijM9pIFLw82t9m1oCD7/esr/97q3MOvgK6Ifh2ct0ZsY91gyuNT2GInQt6Oo+p+B0SHLEeNzFOh1AM+kAumdUpiuFXAmR6CS7qQCWJNaKZ4Ey6tPuE4f+cPSMHj8zHPvU27iD76nIdfM0NWvsOkndm2icro9M60uu6B1fb2SeZa8f30S7JY1jJSIHngOHzqNiCuHa+qOjNXtmm4yU1ifdTXWOc54M8N8nQ8bHHKQrZ8TQUBBqD187vrec06VoZoXqGudqOoaAZaYvgv5FjfzysfmR+kVLXkgeMiXh/Owxwj8df+O7X7TSZu8DkMXZe18j4/HMWtNotO1HDjw1zVXdLQ+4KAO1LIlNhDE8XhUuHkVSpgA5B0bFTVS3qT21/Gt7SBD4NiwdFq65O9i2cRrJGENvpwqS2DtUDUVS+YDUS4nROPGxqlwvOrr2HQW/PmdzXxu2N5gMMVwPtkcoglS0yj+bRCsrSdMPQAQXpNcXx9aYnGBRpH8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB4214.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39840400004)(136003)(376002)(366004)(16576012)(316002)(5660300002)(2906002)(4326008)(478600001)(83170400001)(83380400001)(4744005)(36756003)(42882007)(31696002)(2616005)(66946007)(52116002)(26005)(66476007)(66556008)(956004)(8676002)(31686004)(8936002)(6666004)(186003)(53546011)(16526019)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmdqYTVuNmJ5aUd2b2IyLzhYNDVzUVV4L1hva0pkaUpqWlgrWDgrVExTMGxC?=
 =?utf-8?B?TGJDaU5kN2pDbUpra3RzcXlsM0JQR0FDbmVCaE9UVy9iNVVqak5GTDVSR09i?=
 =?utf-8?B?M1lNY1dzODJONVJQd0x1bnJIS3YvbkI0VTdKUk84RTFjZTg2cDRueWhJN0t4?=
 =?utf-8?B?UVV0UFRGeHpveTYrUC85MkZBZmFDQUV1RGtZM3RBYkdYUFhBb1FFeEZZdFZr?=
 =?utf-8?B?ZmdkT29oYmJLWTdRRGdId0ZrcURCZmNBQnc5TWVLSkxmVU5iS1lTa0tTOWhs?=
 =?utf-8?B?SFdHanBFL1hKWUdNSjVUZlpYbUczVUM4QW5oRnBDaXVWR0tWdDJheXNjSEtP?=
 =?utf-8?B?dlJLZW8vYkVqYTlhN2pwSmdmTTVrcGxObFhtSmNNNGgzQUpNeDFVQWh4YitS?=
 =?utf-8?B?bDRTMFlEUjVuTTZEdmE4TDBqblhKS2dtbXYrRFpUZ2lVcElPNFF6bjNsdjFH?=
 =?utf-8?B?ckxmenJ2bUlycnROUk1GK3ovaWhrSGh1ME9NRG1rS3puRlNaZmhDbFlNUkMx?=
 =?utf-8?B?cmFrVlpsaFJKVmRMd1dDcEVjeTU1b2hzUS83dEg5amdrWDJsamhndVFBVXEr?=
 =?utf-8?B?VCtHa0ZCbHZrRzJKRkpwTmptaGVtcUtybndBclNCcWhtRDg0VmdHYklKckNC?=
 =?utf-8?B?ZlpXVnRzUGNlRVl5SXF0RmFVWFBxZWFNVDd2aEZmZ21IWlVISmIzNDU1TjlW?=
 =?utf-8?B?aUFTaEU4WVpDRmZOYnJnZFd6dVNRVXlXWWliNVNsNEppaEd6U2NMRnIwVFEr?=
 =?utf-8?B?bDY5eEVQczA4bXB0bjFsc0svMVJiVnk3bW9YcUxvcGVFc0ZQNXRvSVVwcndG?=
 =?utf-8?B?bVErUHFjZDZWYkRkM3MvWUg1cWRCUWFTQ3VOSmhyendvUTh3RHdrb3pkMGRR?=
 =?utf-8?B?K2VnVWR3SHUrT0xWZ2ZYOFhDUllNVnNMMDd4M3F4YmlPWGR1N3lFZjFEMTgw?=
 =?utf-8?B?eVV0WW9JZTN0OHk5V0I3dytIbkpzenRBVmpLa2JsWW4wNFlPVzR3SnU5WFpT?=
 =?utf-8?B?SDVZZDlLSU5iU3ZsR3Y3Y3ZGTGloSHUxaC85aFdKQkhPS0dGVnlNQVhHL09o?=
 =?utf-8?B?eVNIVENIUlRPYVNjaDVwbmtVV2Y2TXI4MGt5a3FWeFl5M3Boa3NZRnNHMFpv?=
 =?utf-8?B?Mk1TdS85bTN4NkdRS3VIUEFWbFpRSkhnZUxtOW5Uc3YwL2JCN2Z2YnhVdXlE?=
 =?utf-8?B?QUFHQmhPakE4WW1CSVdrT3ZLU1VlbkY0a0VYdEJQeWVvK0hXT2ZrTzhyZ2hh?=
 =?utf-8?B?RktPeldJUUlJdEJWVUFtS2JSeVVjMTdpUTVJRWdyMHZHb0YwWDhyWTc5U3d5?=
 =?utf-8?B?S2lhVFRxRXZNM0NVN0JwRFdPTkk5SGFvak9SK3BNNVB3QVY3ZkwxUEVucnZB?=
 =?utf-8?B?akJnUUREWUVsOXRlRCtOUFo3VFFvK1NiZHIrbEFGMnpNOURvK0pnRUxZbmxi?=
 =?utf-8?B?Zk1hQUU2UFRIRlJCeHhiRXRQSm01akZveUpqZ3FkeGtkT3VpNThlNEVTS05Q?=
 =?utf-8?B?Sld4c1RXOHlOLy9XMlRLQlltV0JNTVRkdXhnc2Rtc0dkbWh5Y2kxcVI3N012?=
 =?utf-8?B?M3R3Nm50RGhJTTdqLzhQY2lzdUU5ei9wd0prVTlnOUxhZXZoTTRDdE50OTBC?=
 =?utf-8?B?NVlmaFduVDJvV280SnpLUjRXbUxVTzdwU1FIN1AvVDd3SlU5UGtiRUdueWRQ?=
 =?utf-8?B?SWxXVXlzLytpUnRRYVVOM2VXMXZJRUEycFRjY0U5T1RnMWsxVGlRWCtZVmha?=
 =?utf-8?Q?eFLJjABFia3noPttOlHxXyOKrS3y6IA8xtoMnrD?=
X-OriginatorOrg: openvz.org
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bfd729-4d6a-4d3f-0784-08d8def3c081
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4214.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 09:56:16.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c5B7xs+g1+4xMer5licBgZujAazZtFe5NwZO4AA0Mk/gbGNkTH6Iyopq+BZz7uagern3yCt/NTtKLTEkIZnnYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3543
Received-SPF: pass client-ip=40.107.6.116; envelope-from=den@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 12:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> Add new parallels-ext.c and myself as co-maintainer.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b2aa18e1f..92ba1fce5e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3117,9 +3117,11 @@ F: block/dmg.c
>  parallels
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  M: Denis V. Lunev <den@openvz.org>
> +M: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>  L: qemu-block@nongnu.org
>  S: Supported
>  F: block/parallels.c
> +F: block/parallels-ext.c
>  F: docs/interop/parallels.txt
>  
>  qed
Reviewed-by: Denis V. Lunev <den@openvz.org>

