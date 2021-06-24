Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122BF3B2C60
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:23:53 +0200 (CEST)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMWW-0007zr-5O
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMV9-0005lN-3S; Thu, 24 Jun 2021 06:22:27 -0400
Received: from mail-eopbgr150127.outbound.protection.outlook.com
 ([40.107.15.127]:47598 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwMV6-0000js-CE; Thu, 24 Jun 2021 06:22:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j5K5Bj9yh24qdd5Mv/J7mB9LgnfRHwj0GMlRfZvlSwgbNsUf4xIbZdNz0xhNOdTALF0ptubpWez6pX7ZVlyqlNp2yXi76fTNmHSxgG6cp2yholSvtHOm7lK4bohS7Jk5iy4aLkUXCGspP/IrzGzt8SJo4mRLfbY0z0RQ/Ea6FS1Mfwzk3esbJoXrrABiyyh9Lle3hDeckf14tc9AH6rnAMR7z7rmYnZn0sJiEQ3hFfaUShPS9eTUgM0TpUuABAwDubIDNLHPpcVGdb650LgOkWMc+9fQwNGRTj+dkZd8RlKPB2C0cBAPicUjECuHiDj0IU7hDIJpSUrFj4hNCR2wCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrzdeWDbt+yD+INGdcV9nk4HsDNryUKOertKt/x1eeQ=;
 b=MI/WOVhyLbWMVr1zZApetLyqHFdzYHQn2SFwwsMJtBB2zq8pCO93K8iWh2aHICcqVbYq87nzJlIL8aOWhuEDy8tGe/oa9zggLKAA1wcTlMTeCUPIIS0uehC4+YQVi49k2OmmASOYvgdN1o5+3TlPhURLTZts8eoLnaGzZjxU1wuPauZX82Rd+g+AlZJX/I4axb5y3TGGGnC60B9+72sj4x2ix8cvTB7Qjo8COv46FU0wYh2FCZjRAHIGPizTm2zWnb71KUHY/saY+JzVWgmxliegWWttZzeajBxiU0oYCdcjkZsPokZgHzGIHrHPboMoDx7HVO+mQ/xCpufkEH48Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrzdeWDbt+yD+INGdcV9nk4HsDNryUKOertKt/x1eeQ=;
 b=n6WIC2pMI5nhtN4HXhfryFYss6GGjGH+o3Oo50gybhUQH2ABv9b5MNzKNN7KFGmycFS9h21C4pr66KJwm6iiWeh7Sdh/kA5vlaXafnj2kqX0GCwCyQOJPlJUo7I2xYpieFY+4U8u8E7TfQM5bntWfel34UtN8y45fhTiy5EYnH4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Thu, 24 Jun
 2021 10:22:20 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 10:22:19 +0000
Subject: Re: [PATCH v2 1/2] block/export: Conditionally ignore set-context
 error
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20210624083825.29224-1-mreitz@redhat.com>
 <20210624083825.29224-2-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <68d18058-8145-64ff-34c1-558b40b0ebb7@virtuozzo.com>
Date: Thu, 24 Jun 2021 13:22:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210624083825.29224-2-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: AM0PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 AM0PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:208:3e::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 10:22:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 076b4c83-72c0-4e23-0cdc-08d936f9f2c5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4167:
X-Microsoft-Antispam-PRVS: <AM6PR08MB41675E14B2BE9677601266F6C1079@AM6PR08MB4167.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vjd3YEOOnkQ6EMIeZKldgUTwWsKW+LrMrVSbYUL9h7gJmdfLXQAdd55ZW2PwfJ0IR1qSmNtGKHHplJih7KD38P38iYSFW8CiXYa0XuQs9sHOiTZhGtP9eFErCuXMF+KHx9RtOYgecxIUREiYWhpn0NPXrYQDmV2coKYpgGDllJtc2y/RKzs8U5go+b7+FM1jHraj0480WO1/R24AqiVE566AxRHIyq3Ejs1I4QLbWs4Y62Q8aU3286WljXVYyBNuOMC62AjCq9vbyPno1oDn3FFr/8XMSN7d3zG4Wm5c7lW+dWhQmC9JnmR8az855Tl7IrqIStvC7Y7Fqe+VWg5Z01iEDlPgfswcIJKQWocoQfDp5TCI7Uur4+QeDeSfM1gkmjtYaG5LcJvreWz9fveEDaTABiIk84qYSA3/7p4rPDNteFNO7wQIu7RBdQcR0nQevgBKEcCLq1LKZrq07ZCLwgJOp9APv7KsdM/FalNySqmBz87/7PVQZEv8mp9EFf1t57RWn7y6AZRfexx+RMOgcAxEPz9fioJT+uposzjClXsGJXQED9f1ZDCFIz3ckI6/MvttuUfEXfptLopW/D4VberQijs61k+o+nDy27LCJ5zLbC+g6bOZ+hMtfWZFddcIvgXSyvTdZ7MaS5LMA97t0hvrKAGGf9yBTepclzVOB58mw+ZGU3MYU5Eb2aL2WXAEqcf4+gijdel4DhYxWoeJPKM4H1Vv5jfNcrkKi7JkjJg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(346002)(376002)(396003)(366004)(478600001)(66476007)(4744005)(66946007)(66556008)(31686004)(83380400001)(316002)(36756003)(5660300002)(38350700002)(38100700002)(16576012)(86362001)(956004)(31696002)(186003)(2906002)(8936002)(2616005)(26005)(8676002)(6486002)(4326008)(16526019)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzg0dUZvRGVvaDRCWHNXWXNSckQzYkFzMVJBZjFCMUhGQUJ2TVNXd1BOTyt0?=
 =?utf-8?B?R2hBM2hRandSOGoxY0VSVzdVREhZc3JzVlVXb3FuWHUzT2JkcTZIUGFtSGw4?=
 =?utf-8?B?MU5MV2pxc1dvQjVHcERYSGJVTFNGUDdTUDBFMm1OZWFOM1doZS9LeEVJMjEz?=
 =?utf-8?B?RG5VODMrRUJwRHdSR00rbjVhZ2RVanFLdnBydGxBelM2Nm4vTUYrcVp6Z1lv?=
 =?utf-8?B?Y1ZLTXlQY1l1OTNuT0cxamE5ZFZEMURxSHVoSVVDdm9SbGNvcUlQektNZElG?=
 =?utf-8?B?WjMzcllvc216MmRXL0E1WXN4a0RMNGxVcjlodmwwN3NweWFqZ1M1amV0WHVy?=
 =?utf-8?B?YkJrUTEwaHpMbnlkT3BMcTQwUXNBdlJyaUFjRGl4R2poNEwxNDhKd3JEeldr?=
 =?utf-8?B?UWhHVi9rMnY0YTJrUHRSUmZ1Si9OTUhsMElmYTdSbEkyZk9PVU1NQVR3RDVN?=
 =?utf-8?B?aXYyZ29JaVlxbFNZQkdGdjVPZ1hFWEhPZkRFdmRYWWdXK2s2QnhFK2ZRNXRN?=
 =?utf-8?B?cTY2dTk2b05tRUJoaFFBeW9Kc0FYNDhaTjZQZEorZzg4UjE4bzdQOXNRejRB?=
 =?utf-8?B?eCtjWm50RzdMRzNoS0hyRm03RzdlVlVvTU8vUi9xZy9aMFdvcFhtUXFkdDd1?=
 =?utf-8?B?aVAzRGRiWEoxcG51VDNKQ3pGT054SzlGN0VPYjVJWEFDTnBvZE1FbUdRR1ps?=
 =?utf-8?B?UE1yTEw0WnNxcEdDWTNMbjBaUHh6RS91NFAxTFY0c1BTWWNLRnNUblNkampI?=
 =?utf-8?B?cnZJcWxGY2diZURsVFk3U0dNeSsweWJiQ0wvcHlPQ2NhMk9qWEtvNzVvRzE3?=
 =?utf-8?B?RnVrNFFZb0lrempSS3hQaTZRSGswY2pQOGN6YTN2eTJ3YndPZ05IMHU5d3Yr?=
 =?utf-8?B?V2s0enV1NFM4VVBjWFBIU2RTamdaUjVhVzd3M2RIK3F2UXd4NEFZS1BMMmha?=
 =?utf-8?B?ek9MMVMzajBnaWxDcC93SGhqeTZaRGtkTWhpOTQxMTNHaWYxcis5L1NCd29K?=
 =?utf-8?B?ZnRhRGliOWRhQlBZbjF3OGtxQXdVTVhGNmhQcU9lU2ozeEEwbjFVcXg5VWFi?=
 =?utf-8?B?eEpSREhpa0ZnWk1HVERHeDhMUDEvY0JKVmRGS1JuY0NJUVRZZzJaT0NJUWFh?=
 =?utf-8?B?VnI3dVlxVWpDU05wWVhId1BUd2hmZE02M0NCdGtwQnZNVHlRSUo1Yld4M2ZY?=
 =?utf-8?B?VWZOQURVYmYxSXBxMy8yeE9hRHpnbnYyZ2lLTWRSV3BqRzlyQW9xTkVYYmsy?=
 =?utf-8?B?ejA1WW0xdXYyZUxKVzQrbDkzK2VqcjhsNUpVZ2Naanp4RlJnaUNZT1RnVjhG?=
 =?utf-8?B?LzVXL2NnbVNidDdLQ3ljZTQ1bnpJaXJHSWNCYVNRa1BlREpHeWw4WU1jZDRX?=
 =?utf-8?B?KzMxNlJxK1daSnZabEVTSmpCNHZ1RFpyUDEyR0NiN1JOdXN4NitDelF0bjgw?=
 =?utf-8?B?eTVGMnhHOWM3enZvMWZuWGxnRXBSVlU3Q0hTb3A1Y2wrUWI4MmtJVGRtNW5E?=
 =?utf-8?B?S3QyTmRlWUdaRXdKVkw4NzYxODZwUDU4R2pvZ2l3YWN2OGp5WEVBZ3pHcFk3?=
 =?utf-8?B?MEhSNXdMak1QSUlnT0tPZFlLaUJma1FKbVN5aFZjK29DTVBnVkxDaFY4TTVx?=
 =?utf-8?B?MEZvUGRVRlFTVjV1eW5lTnI0dk12NjZZNFAzUnlob1Ruczg0Z3JkcUh1MEIz?=
 =?utf-8?B?di9kZWt2S1I4RHpST0hmRVZqMmowSXJTRy9BS1laWGxORUVSNWh3TU9DL3M2?=
 =?utf-8?Q?bYwL0mu/HwsUM5pEJjd2ZjoG/TctTVa00GbTxQO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076b4c83-72c0-4e23-0cdc-08d936f9f2c5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 10:22:19.8477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTMsx5NeKp5pLveVgKH8D6b0KujsEkTFMmlXtTVjFCjNH6S1Zaqa6EDO/g35EtJZegbc2pMNWu2cyhHhxIqUfmeaYJO6z6BjIgBDIByLLMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
Received-SPF: pass client-ip=40.107.15.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

24.06.2021 11:38, Max Reitz wrote:
> When invoking block-export-add with some iothread and
> fixed-iothread=false, and changing the node's iothread fails, the error
> is supposed to be ignored.
> 
> However, it is still stored in *errp, which is wrong.  If a second error
> occurs, the "*errp must be NULL" assertion in error_setv() fails:
> 
>    qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
>    `*errp == NULL' failed.
> 
> So if fixed-iothread=false, we should ignore the error by passing NULL
> to bdrv_try_set_aio_context().
> 
> Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
>         ("block/export: add iothread and fixed-iothread options")
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

