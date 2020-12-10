Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9722D5846
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 11:34:40 +0100 (CET)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knJHT-0006EV-MO
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 05:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJBl-000215-V0; Thu, 10 Dec 2020 05:28:45 -0500
Received: from mail-am6eur05on2127.outbound.protection.outlook.com
 ([40.107.22.127]:56160 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knJBf-0004Z9-Oj; Thu, 10 Dec 2020 05:28:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrnj8Ma9mk2YmMgjC7M8ToCIbAcRaSmnkZ50JGUQZ5QOCP/ylIp+EN4jmm85WoZSG9ikVH/lfvGeqorMzIDU72AtDb4lVbDBrF1xaSkkRU8mnkXINKTuwocV4BHrF0yl9ErpZqDhncRBSceMiEmaiNNg5mHXoXISZ8vQVxLIsaociZFCtjEKM4Xa5aIcnjZjsC0Evtmoo6Q7WUezHa5crhefXut+dOgtDO+nUO36gKsT4kz1f+RUHPb32XBlpmiEHbbs+boqOTG3BorE7Zyx9O5romXJ0hyHZ6dB23thSG/ODVMVa6Sa0pvuMIqTW9SFncWxh8PvylSUC90gFlvKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtBWzg4CwgoIJeAS0tjM89I1KhHVW/o73qDzRZ8Ett8=;
 b=g54PkrJhmpDrGzyVU0RS5VWOXXYRzIW+NmEa/hcyR4PFUyAPqyC91bkjygtmdzh6wI0d4FafELp0e4k2A4PWs06zDYRWnJyHa17qGEOkGAld6t3dHZoB9RR4F85Q0fKgbay2uB4xwtm3PHzlPlWEnGHWeWpW1K6/uVj6/cz/ChY1LV94JGPdLVuCpKe4tmuFkIbDXNlcdr9tRJBh31VWnXxZzBAHyD4yA9YAFI5frBX58TrQcc/NTyfvoE4b27K694oDJ/x+HxSGus+5fAJ4HHCs2aH4QV1uvtyaF7ZPZqkr0/waIVLBcHRPRrM9ZQ8CvYj7Uw+clbSJGKD+PGpaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtBWzg4CwgoIJeAS0tjM89I1KhHVW/o73qDzRZ8Ett8=;
 b=DNevUaUjlhIpnBjOGf9sATT/hEuX6ciMyd4rhtbBjsmld+KGiwf3ssodTHCaBEBg435z36b+ZP78vw+dcbaN6TyKWmKNdwIjx+P205YpUPyrnxPADgfW4ZDZqzP0l1AYaKCIgPle2ZUg9OhWWeBxpPbQbuspeOADYtNQgSoZlUE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 10:28:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.012; Thu, 10 Dec 2020
 10:28:30 +0000
Subject: Re: [PATCH v5 1/4] crypto: luks: Fix tiny memory leak
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201209203326.879381-1-mlevitsk@redhat.com>
 <20201209203326.879381-2-mlevitsk@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f656133b-4849-1a65-3329-00afe91fb9ea@virtuozzo.com>
Date: Thu, 10 Dec 2020 13:28:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201209203326.879381-2-mlevitsk@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR03CA0091.eurprd03.prod.outlook.com
 (2603:10a6:208:69::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR03CA0091.eurprd03.prod.outlook.com (2603:10a6:208:69::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 10:28:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dc6cc53-15a8-46d4-39d1-08d89cf656be
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-Microsoft-Antispam-PRVS: <AS8PR08MB621692A1C054F75B6D8B804DC1CB0@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 677Y/LFiL9P8QgeA7TJNqgUoclJI2gVgq/3AAuujAWR7Kg0Si4s/2Rrvtb6z5oWvN08tQOf9CCImYh+VJocgzq88I21wI/yFaViauY7AAViLeNzxhH1sib0puxbWKuWSEf47Ewjw87KCE6HciKUvKd75NTFzNgTdKz0HsJdL5YVau2fXYeXPbj7+xwT6VZPSuGVLNA3Sno+ongRphSI2YhTFKeF5STAh0T3KgqJX78lKGe2Dninhhk7xCsNawEaPVv9EGgw0+XkzQCw7/NQsa/q8Ap7K1F7Ahkq7tk51fBJoUo+0EmO95ZjXeCdqqtzSQVZ7eihXruXXjLKdCGLb8vEqPMjoEBTmx7fE+CqABdx2Zl2mv/L+DEiFAN3jH3uCsbG07/dgstqmkOO25VudMqA0nOYX3C1wm3F5j7pO7bQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(376002)(366004)(136003)(396003)(2616005)(956004)(86362001)(8676002)(31696002)(66556008)(478600001)(66946007)(316002)(16576012)(31686004)(66476007)(54906003)(2906002)(186003)(83380400001)(16526019)(52116002)(8936002)(26005)(5660300002)(4326008)(6486002)(6666004)(36756003)(4744005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVM3STlWdy9QRE1JM3lrVXU1ZnJ0QUFFc05wNExvSVBiUUNvakMyRWowblhE?=
 =?utf-8?B?dVN5OVE0S1VtNWRZcHlvb0VIcFROakp6QXI5dzNmMWhYUDdqSGdiWGxlY2w0?=
 =?utf-8?B?RFZwWkNJWDQ5b0hDSy9YZlFycUY1Z0p4M2NtM3NzdDJPUVo4YUdBUm45OURS?=
 =?utf-8?B?ZEtkenZQcUkvTlJXMVBsL04vMXJpU0MzYndIMTFQYTdGSkRnWUFXZ1QxR3dP?=
 =?utf-8?B?Vmd2NVFHMFFmcjUyQkVxTDhsVmZvczY3TmtWSWE5L1hTYWc1R3BPM0FyaEho?=
 =?utf-8?B?cUJ3ZjJjMW13cEFGQlJFSXJtd3hweHNZZFdCaUxwQ1RBY3lPUVBtME43akcr?=
 =?utf-8?B?Z3N0Y0FzWDVPNlk5NFFFV2QzQitiVVRoT2NOVmNPL3dLNklPWlZ1cFVBeTNk?=
 =?utf-8?B?WjNVZlMrN0EyYkFKWndKZ2h0T2dLOFJhQmlvUVZDQWk5Zk5tUnBoVzBMcGpB?=
 =?utf-8?B?VURqMkRCWGJTOXdncDU3b2VYUCt4d3V3UUxENmYzcHdmcE15eHNRNTQwdEd1?=
 =?utf-8?B?NVVKbTlueFJxbzhXKzFjOUFzZmgwcmlESWh1RHJRN3ltWjM2bnEyT25Ta2to?=
 =?utf-8?B?L0hNSThZNDBXa280R0lhaUVhTmpGZWNLS083ejdwdm8rbXBETHcwVW9oVExK?=
 =?utf-8?B?VGpiRHUydzIwWnZ6WE1Td09NbE9tN292cEtPSTBNSitoOUY0UWUxcGUxdkRL?=
 =?utf-8?B?NXl4dURGbmx3dEpjWlQxYlM4b3NVcVVaWk9iZXVSOEFsU2ROeE53UmZJSGVU?=
 =?utf-8?B?WWp1cFRSakFPVlhuUlgwK3g1dUFqYUxXRFFIK3NRZzc2cnFTdDJLd2lWMGxZ?=
 =?utf-8?B?N1FDcXBXTDZ1M3FWWHRYZ2c5ZjdsbUtUNmE4Mktzdi9OS2Vub0VNMFVTN3E0?=
 =?utf-8?B?ZUlwa1dMbjNrd0VZeTRXYVVxcFFuRXNuamlzdm5TUVU5NmRMaTVLV2NYL2py?=
 =?utf-8?B?L2tRTldkcjhpWVh5WXNaSzJGVCsxSVFsQlIvWUZ4QTkvZTdpSVBFVjFDRXlu?=
 =?utf-8?B?TFJTTkE4K0lFQ3lNNURaS2xGNUFCdklua2pydXRBZ0NvT0dOSVk4Qkg2SE9I?=
 =?utf-8?B?cEFnUjhDK3NsVXVtVGVtNFNwcTNNRWRuNUR3a3p2RWdkWWJ0VHcycnNGLzhF?=
 =?utf-8?B?VWJkQVZMdkRkbFE3MVdZUEpyYVBZdENwR1ZOSUMrNzl6OHZyNlQ5SFhJM0Rs?=
 =?utf-8?B?emFhNmRRRm45aTVPbjdJMXhzK21Ua3pONkhUcFpTWjE0cnhUc2lKWE5xRy9r?=
 =?utf-8?B?dUVpZllpbHEyZXoxbHZpOGJqQUhwS2tiSTA0N3hOVzRnSlUzRkdGbGtzWVVB?=
 =?utf-8?Q?Jopi9N8AjDLu32GOWqgoQ0JWv9+99JUGDG?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 10:28:30.2736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dc6cc53-15a8-46d4-39d1-08d89cf656be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlER8uKy1WPbKq0DKw/vX/cEp8gi8HU8aMBX3E9iYsn40IzJ2lXhrWCS3WRgu51qTMahF0hejYV5qB9G4uWDXhv6d1aI9KLNk/dhevREP7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.22.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

09.12.2020 23:33, Maxim Levitsky wrote:
> When the underlying block device doesn't support the
> bdrv_co_delete_file interface, an 'Error' object was leaked.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   block/crypto.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/block/crypto.c b/block/crypto.c
> index aef5a5721a..b3a5275132 100644
> --- a/block/crypto.c
> +++ b/block/crypto.c
> @@ -735,6 +735,8 @@ fail:
>            */
>           if ((r_del < 0) && (r_del != -ENOTSUP)) {
>               error_report_err(local_delete_err);
> +        } else {
> +            error_free(local_delete_err);
>           }
>       }
>   
> 


-- 
Best regards,
Vladimir

