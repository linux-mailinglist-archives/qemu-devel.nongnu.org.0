Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D4398440
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 10:35:34 +0200 (CEST)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loMLd-0001mx-Ae
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 04:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loMKh-0000yE-I1; Wed, 02 Jun 2021 04:34:35 -0400
Received: from mail-eopbgr140132.outbound.protection.outlook.com
 ([40.107.14.132]:2177 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loMKc-0007Lq-49; Wed, 02 Jun 2021 04:34:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPPKWUKXiO0c5hBeCULnA7g3xP+VqXNcVd2z7NZh3o+jVzOdOhtb2GVs5J5QFZvW+FPREwaT3xsYjdrYZju/ZcGarFYFxzP1KO2SgucZ3WfXktT7NuiI7GpzcqmVflz4gW/OvoshCspOOCRxK5PHqrDnHO5fSW61ZXCnMWNPUFUvXDrNyKAYIWTsJ1ExJxc/tYnPo0pVG0OlwHSy0xqx4AlS0Zti5wQ3K9TcPfwBGWEcyGMwcjzQId4xiiw7sSM7Vtuxk7yZ4FvGntBSb+SMzl9rfle4LaPyiamNVonGMdA+qNMgwg8o75k2tmRx4l+QQ5H57Etvu3Me4sR6+qJgyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hviy+xUZMvGtNu01nsRx8GgfYNlj2B4Ytait5I76ZRw=;
 b=PDWkvV+p6C3nJGyjXk8UFritbwk4H3lpUy+Sltrt3DDZewpH3k/BeD/D4Cl2u9t7Bc9X397I3GF6a22UtM1kA9VNUgGgihZQcSPZT1HrR5CrmQ2kXdUJUwuaKpFvT6Z1cVDp28XmjNKTHgHmEq0SflBzq05idXoLO7PCzQnD0dD74dGRiRLe1UyKrjUeKryPZR8kvZYrTzM7qKkLhP54SjlpTD1RfSsZSC38+LCRQaEWwSjGZIWXcr+HhGuSrm8zti2HmZrZuK9IrwTEPMFEh/+rO66OiFw9i/sxgpeaCrctV90ACX4tZaUwykdvTPysD1qHWauUL52NmRxJnZMhuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hviy+xUZMvGtNu01nsRx8GgfYNlj2B4Ytait5I76ZRw=;
 b=vqxDGR2s9d3t56c/yGYA0SYHCF8P+ncze8IqTjww+hhlGPRKUZ/FC+I3Rmy+zXsEwVKo9nrsttTKAQl+QEEYDMWU3vjGfxa6ZZMocyzX9fyrTN/RLWn87dr3iY7VnzdfXV9YD/xgqy7MFnGghRp3D5YynGDN/yqSuxpRAIpBnHU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 08:34:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 08:34:25 +0000
Subject: Re: [PATCH v2 1/2] block-backend: add drained_poll
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 Nir Soffer <nsoffer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>
References: <20210602060552.17433-1-slp@redhat.com>
 <20210602060552.17433-2-slp@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <06d2586e-824d-2b21-2ff8-8675396109be@virtuozzo.com>
Date: Wed, 2 Jun 2021 11:34:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210602060552.17433-2-slp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: AM3PR05CA0146.eurprd05.prod.outlook.com
 (2603:10a6:207:3::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 AM3PR05CA0146.eurprd05.prod.outlook.com (2603:10a6:207:3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20 via Frontend Transport; Wed, 2 Jun 2021 08:34:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b94ca417-16d9-4fd0-cabc-08d925a13a86
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-Microsoft-Antispam-PRVS: <AM6PR08MB49516BA4A8B0BA8E443E11A5C13D9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bDlgY27QaiizUrV2iVGQQi9i0eJTIDcPNokL9MtccS1XNtsv6NSi4gVaFAxDmASYIziUuBxzyAcu1O0tRMDcnDFg8PtbyMGtSYpp0qzqyGXrLjgFHTALNSiObUxdVyPn+UD0EXQzUOxhaY22vLXXs76RyXnrPM9kL6XH5rjrkLFC94FXSNHkIUIMsm0tXJ8WetHfhBpZjaNSt8GhYixb63up4OSd5omPDXZwR5513D0k2ztD7MCNZNwkmAUvZyll7hODFfYIbGF7erpt/g8N65XVYG1O0vKugBmVIP7Du9MTKIPPi3OD2elMWPSr9TUViHmhyHE5VO43aN9n19KKCz6Fke8+8/+i54IAySdgv9kC0/l4tvBbsumkedYWKtT8+gDFFL+EAuh3whEVRf66NfrKnf1APmGrSywNPdajo/I+tQkFMEw/xcPw4mvFAl+qFkmTQj6Dgyg83FDQLp93/9/bVeIDcWMDQFfs8IGQLAji+mq6lPLFvrVF/IoX/tm6+GJ2OtxpmrsLpXiife4pvsmCCWXeqDKWijesfGmDrfWqcgyA80U+I1HedOGDrmqkJ5JnFTrzEudGP1/7L2gx2lp5NGAYq0YNq6TS0ruh2zu7okLjehyXAj+Ol1lvx620dt2FK1zhgI4zEXN12vXdArrly89MOu/xGc6QzchjOaSODYm+pWfJ9HoX+EmPeiSoZt88SRQAHgzLerVLd6FCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39840400004)(366004)(346002)(5660300002)(38100700002)(38350700002)(16526019)(186003)(86362001)(316002)(31686004)(6486002)(31696002)(2616005)(66476007)(478600001)(8936002)(4326008)(4744005)(54906003)(16576012)(956004)(26005)(52116002)(2906002)(8676002)(83380400001)(66946007)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzVhZzZ4UGJKSUMreFpuNlc3NVdrRHVxZW9LWnRaSUk1Ui8rNldCb0xhVytP?=
 =?utf-8?B?TkpHTW1qdUNxTm9aWTh1cnkzZ080Q0doSUc2d1EvUG0vWkdGcXBUc0FEN0FC?=
 =?utf-8?B?SE9abW5FdzNrL25XcjBwOVNOTDFBUXZBZ25ULy9qTGFvR2dPUEdLZER0UXZm?=
 =?utf-8?B?NTdySGpEWWExOExsSm1OcjJlczRlVjA0NDdPaDlReHpRR2ZhVUpMU1AxT3p1?=
 =?utf-8?B?MksrU1VqL0w1dUlwZlh4aUlhRVJHdTRSRVIrQkpCT08rRm10ZEtmR2VQdnBZ?=
 =?utf-8?B?S3h6T1NTRUlNMFhoZVB6ejUvK2s4MWlpbkNKMXFSTnVHd1hVdzMrdzJpVSsv?=
 =?utf-8?B?UjdiOXhnTjBQWXg2U1lPbFZxTU1WTEpqNG11RnR6bzYxc3hpQVBieWQ3M215?=
 =?utf-8?B?NmtrSTdYY0ZtNmdyZkZqU1hHMHJWRGdXcmErMFc3ZktRSzdrS0dsdXJOdllO?=
 =?utf-8?B?NnF0Nm5idDlSYU1QMWM2WUt4VkdGL2xJRjB1UXVBZWFxRVQveGVNbjJ2RUlS?=
 =?utf-8?B?ZnpDMERKMEU0NUVtOFVwUzBQY2VxOGZkcWZaVS9scVNwcVpQTkFRK2xnSlps?=
 =?utf-8?B?SG1uK0JHVCtySlJKMFNQMUIzaFgrTWIwRnBvcFZNdWY1VlFWUmhpQnRWa0NV?=
 =?utf-8?B?amFoUlBGODBzUlMwK0h6UjlPTWNrRW9QdndXZHFwQi9zV2dzNzFKT3crUFRu?=
 =?utf-8?B?NlNBUkowMUlYd2x2YlVUeURtK3BBL1E1ZytVOXhERlFmcUpPc3lBZGRyb2RC?=
 =?utf-8?B?K1BwT1V2aWROdFdlcGdJTXFkV3o2WjJhVEtiNUpVbmRIRTc5N1puMkl4SUEr?=
 =?utf-8?B?cTk2dmtZdlJxenovSks5WkxWYTN4dk5LYjVDSUY1M0hZOUNJSXFySnR5SWpr?=
 =?utf-8?B?RFdGMStZT3BodittemJWTWdlYkUvVFU0cEZMc1RFbytEYjFWZGphTjlsRVkv?=
 =?utf-8?B?aWtkaW9xb2hzaXIvdkxaMWFLMWJYTW5PbjByM2hOZkFaUlEwKzM4WUxHTytL?=
 =?utf-8?B?V2NvSzdVWkk0YjlsbFkvRmNiVmNwdmNiRVNHQW1vWjhqWnhUWkhBNjJsQStF?=
 =?utf-8?B?Yzl0b0FvQVd4bG9LbjEraGhvNVZtYk5iZ2ZZZUpWbTlvU1h3bnRqWS9EVUxC?=
 =?utf-8?B?Qll5Tk5YdXVqSTFrSWpyaE03NkduSnNXcldYZTAzQ3dOWFhEOVpIeFZ4cmpu?=
 =?utf-8?B?VXp3bldtcXBKOXdVTHJuRXFUWHJqNzRDT2xPaFU0Z0RwcE10dlU5N3J2cmo1?=
 =?utf-8?B?elZ0V1NRdVhBdmlvVTd4bURncG85eTV5Rm9SV0cyemVEWnJUcGJCUnJLV1Vi?=
 =?utf-8?B?aDEvaGhXajJxWFFDOWpnMncwcE9OemhFM3orbHNIZ0s1WlljSFk4cmVsL3h6?=
 =?utf-8?B?T2ZPejE0WUNhTUUrZGg2ZjhoM1hBaVRVT3BxYTVsaVE5bGFUem5RVHA5anYr?=
 =?utf-8?B?TXlUVzBIQk5OOVZYd3NQbkxwUWZydldXWUM3MlJQSnR4TFo5OWVISVJZMnJC?=
 =?utf-8?B?NGVZbG91bkdOVFlleGhzemNLTzJHekRnMWxHMGdaT0pXV1k0OUh5aTdrbW56?=
 =?utf-8?B?UGJNNGZGV2krZnV0TmNOZDVUV0lTUDJXWCtLcFhKU0JRcXlIb0EzQUkvc2xC?=
 =?utf-8?B?UFNUWGJ1QmRDejBoTFgveXJSVWw4eGVKZEw2eERNNkY2clpvaTZ0dVRPdjB2?=
 =?utf-8?B?ZTZrdFVTeGRFcmtPKzJ3V3B2UjhUdGUrQW13VTlJWDEwbmhVOXRyWG5DNDk0?=
 =?utf-8?Q?DUPKyUxfeZ/wDsi9N7frnlgWWl/vn6M1GfLaQ6t?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b94ca417-16d9-4fd0-cabc-08d925a13a86
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 08:34:25.6150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZiPQUR1/cwkHRgb1F4xuXkEPBR3BH5GhLZYMDuUOYNAlEUDi9DhF9gJ9vudCdj4PxMuOBApQXTgY2RKOYKMFQZvLcoPLh50I6XwYFibBnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.14.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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

02.06.2021 09:05, Sergio Lopez wrote:
> Allow block backends to poll their devices/users to check if they have
> been quiesced when entering a drained section.
> 
> This will be used in the next patch to wait for the NBD server to be
> completely quiesced.
> 
> Suggested-by: Kevin Wolf<kwolf@redhat.com>
> Reviewed-by: Kevin Wolf<kwolf@redhat.com>
> Reviewed-by: Eric Blake<eblake@redhat.com>
> Signed-off-by: Sergio Lopez<slp@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

