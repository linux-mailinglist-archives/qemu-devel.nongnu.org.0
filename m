Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30D396898
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 21:58:39 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lno3b-0004xP-1x
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 15:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lno2M-0003jT-NM; Mon, 31 May 2021 15:57:23 -0400
Received: from mail-eopbgr60100.outbound.protection.outlook.com
 ([40.107.6.100]:61664 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lno2J-0002kG-QT; Mon, 31 May 2021 15:57:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nku9kFByHpkA8gMuDXIp7dDKBcyAjNFcqYVDDy0mj1RE3avaeEaE3NmKsTR2+bY6iXVYEMkJktANbBM5b9qgvFbvpJKMhvF5+RJ89xi1l2S7kIFE/bAvR9lUPQvoxpOK7kwSCBtx1AWgOQn1/YQ4++4XfvQQFLrGLVWv7wS0rmjAwQ6rpyPSBI4yTxYilgt4YAU/sEoMO1s0V3b57bTjrAbBRvfXj3JaNt3WP7PIXBxkQpdP5eQWvpj64zNtgfTNL6CfiaMP/aUIP41Qo4RuuHnd50QgPE8Lk+T0zDbk+BpJLNA2QzsYBSEtqRuYIpvxAzwMGh1iQky/XYPh46g5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziqR7QLemlHrWalkULjoz/oPh/ioLltQwGHnX8CGfS0=;
 b=A0OdALW3FUZEPL1FD6x7bMEDD3vRQwRLsTc310hdBUMK2g0dAK5+rNToJ3up7TAcsQSE0pLMHV+Vpc+8xcSntknHu5H3NMilhDRfop4/MkhBOkF+CEs9Fau1ZuBRtsIn1ZACCb7xSLlON9pVd2b890oe2o4EmYkvvitA9H3LVNM4NNSFxfLCvbiHXzGsXzL8X/9fNqRN5HLzPVezkcUL7Moe4w19yy3CacMCBJGai5pBWzOv+clnBEWCuhWawXAysD+Ar0Q63GphCAklenh6Ui2PVzirauir7ltCMXOx043jUP8nkSxU1QQ1XyiIIWCm0eG7Dbx1Uo8y0FtH4RdueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziqR7QLemlHrWalkULjoz/oPh/ioLltQwGHnX8CGfS0=;
 b=E6QJQYBZC55HdUr/D3baRK5VOpGkepFEr1lZfRMw4Q3vYJ8Q/4JsXE/Qt4i8tO8SUCzxNnK9IzBLtYBtl4loEuyBJKWgne8Hu+MxnCeu09YNFIFC2fEUN82TL9m5sJ/6pi9ium6DSmFPhZEL7cUWyFW/mjNowhfFGlW49HV2FAU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Mon, 31 May
 2021 19:57:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 19:57:16 +0000
Subject: Re: [PATCH v3 3/5] blkdebug: track all actions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-4-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1a6c4bcd-1630-01a1-c015-05dc34779c7b@virtuozzo.com>
Date: Mon, 31 May 2021 22:57:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210517145049.55268-4-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: AM0P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 AM0P190CA0017.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 19:57:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b28d159-17bf-451d-7691-08d9246e4a6d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447C6D4B5EBB9AE82AB1A47C13F9@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KF+Sm+iFkpGnH0MW3ZAbitYQ63NDPsdOk3ozJqTPD6zba1T1Ng4/B6eidp5q9WHTBKuJYWn5gytAc7fghAGKg0tYHaEjoxG9JzGw6rPcS70cOoxA9oL99EBK71EzdkuzeqTMdtq3d2h4OpPP61i0s38wLxH4ExWqM5uE2uIJzWwSS/+WoJJ8XPqsznMw9gVAzRwP5/ypWiIC/cES1CB44w0+Di1oK6SWVn1lunEZhqhfQ/+UFNMSsEHnYs/QrMbdqA+VNX5JeBNGvfFpvN+fybe1DTEc7HH7zLSmhSQBH8g4V4e5AxQK89ctqXIi6KXVVg6jRXP2U/Z2sLZisNDxGzPqcEOdVJw3zq3pQjOQkKUN7Dl3iukSvMx4NWB5plJcHKD2uE93fRq9jzs0u8WxiZ8lUHhxx69gMJFnCfymbEgzMYaTEzHfoNzVRReEzUpZ6I6xteLAdBdvlJXlXDCJS/BsuTPhrz5DEGv5XMs6AgD8vd8xmqYtpsJhCnH8lsyBDo3LdS++JfCaA+8q+qPRFM+akbk8/z7MVGPP5grHJCtGJJbHFC/h5jWYPD4CIPpnl9zdRikagfC0qFHEJDBDVokzqXWGSCSvx4yYDoPjj5YoYzActDzHgHjh0s7YCPJnIzcAFu5CXc5IsullRQ9vay0phKll5LsC+51+WdLrwUBXa7oGLRKuzcH0jeEiFzhsk7CYWxge3bZfiEez8uXUuA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39840400004)(52116002)(5660300002)(16576012)(4744005)(2906002)(478600001)(26005)(8936002)(4326008)(31696002)(38100700002)(16526019)(186003)(6486002)(38350700002)(31686004)(956004)(66556008)(86362001)(66946007)(66476007)(8676002)(316002)(36756003)(54906003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTJjLzdBSnVQZXlCdms1SUxUQ1luc2VMOGdOeXZUOFoyd0FVQVNobVh2VWU3?=
 =?utf-8?B?WUMvUVpIMjkrQ3NQQzc1TU1vakd5WDFSd09COFlrdVV1ZGU4bVhYVFludUNU?=
 =?utf-8?B?RDNTYThlWkI3MUsrazROZERZRDEyZTE1cmw1b1R6ZWZURlUyME5zblBJRFBl?=
 =?utf-8?B?SDJEZXNuci9kalRSRS9ydlFZS0xkVnF6cWliYm5FNFN3YitSOE41cFF6WkNP?=
 =?utf-8?B?aXVLUmhkVXM3dDBkcFlUZDJabjNMU2lpTDQreDVtSC80QXd1VGtJZUZWay9O?=
 =?utf-8?B?QWNhYmlLbFhZdVJ1YjRQSWRmNnBVQmFINThiUW1Hd0F4R3RmRW1mckM4b2FW?=
 =?utf-8?B?L0ZOTENjQlMzMWVWY0Joc2VZZkhXOUhIbDg1R1NUdDYxQW84K0tmbkJuSTFw?=
 =?utf-8?B?OE5kbGw3M2ptaVhDdGlSOThrQkRROG5ybkFMNUdIU0E5SDVSM2ZxMzdCYzlv?=
 =?utf-8?B?cUZTTEJHS0taTjRrVnZ1eGVBcUFuc2ZuUU16Vm1pcVhIMUlqN3dlNmVqaFhz?=
 =?utf-8?B?bDQxUGFBa3FGRnhCeVJjQ29hWkkzQmpyZW9XaDZFQXlmdWt0NkZmaFJWQm9W?=
 =?utf-8?B?TVNBMjBYU09tajdaQjhaK3ZwSFZadWxwL202eFVnOGk1S3Z6Qm5CQkJCMmlt?=
 =?utf-8?B?WnlxaWp0aGdKVTl2dTFpMk14Q2V6ai8rTG5reTdGNHN0VkhYWlBGMWhyd1o4?=
 =?utf-8?B?S1hIVU1hdEJpbmcwbFhnS2RTWDQ0Ui80TVM4ZVZHWWZ1V2RJSTh4RDJkaHA1?=
 =?utf-8?B?RTR4YXp2TTJ2VkNsN0FoTWs5TnRuYzNsaHc3RUlxM1hrTDNGTHB3bllHMlV6?=
 =?utf-8?B?NUFrcGN1UE5FQVY2QThnMThDQ2xZR3l3SGkrM1lsWHNEc2Z5T1BJc2RDOEx4?=
 =?utf-8?B?RWRnV3BieFVlV0U3T1NXUXVkRU91RjBSWmo1RWV5akg4dW5jbEtYT0trNUFy?=
 =?utf-8?B?QWdOZFNnY3hIcWs0OUJnQk5oa2JFbTdVOW1qQnh2NGVGSGVkUVZQdVdTV2VF?=
 =?utf-8?B?RXQ1Q1FaU1Y5OVhjZG91N01FdkFFUWNqaE5UYjlzZ0tmQmswbkM1OUNkaUI5?=
 =?utf-8?B?aXVlSEd4WlBiVmZ2YlV2Q25ZNTk4QzYvU1pLK3FqeGxuRXk5UFlsajJ4SHFE?=
 =?utf-8?B?T2ROcDk1WWNGUFJPUnUvS3JpMnk0OUlvUXZBMGFrRDF4am56U010U09tRCtm?=
 =?utf-8?B?cUt6b1dtVUZmZ2pld1VQTlUzTmFndHdZZXZZY0d5dWhPM0pTL09JV1Q2ZFZu?=
 =?utf-8?B?ajFtNmZzK3hrdVg0MytKLzNaREVyK3VqazBlMWprK2FHWHFUUFJxTTJQSDA3?=
 =?utf-8?B?OTAwaVRVSDNqb3o5WmhJU1dWT00vZTVNampjYzdibi85dWg5ZGt6bDZaL055?=
 =?utf-8?B?alB5V211bFZlSVp3OWFYOVl4SEdQUmtCVm9ibGx2LzR5Wk5ZNmI4SXEvY242?=
 =?utf-8?B?RC9FUmFVeDUxR01QYkRxTk1pRWFMZWFmSG1oakFxN3RCRFhIdnN6YUcrWUVT?=
 =?utf-8?B?TlB2bm0zWmloak1UbXZRblBUV3JTK3J2WXlJK3E2SjlDNGg2UTBHQTFLRjFU?=
 =?utf-8?B?REhZN2VDM3RWVWdYUExQU2cxejhpUWhJNHdiY2N4VW9YZWQ2NDQyZGtNdTht?=
 =?utf-8?B?aGhQeXh1YlY1RGZORzgrajNmOHVicE9yblpHdzM2dmg3R0JNc0hnNjFGM3BZ?=
 =?utf-8?B?VG5GSFJJd0xTUXYzbG5aT3Q2NTRTRkIxcEZEanhERXgySXUvd0JnVmt4Vk0z?=
 =?utf-8?Q?sBB3dEH7nGy127VLHXNsCUbur3rgR0UP7pBL5TF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b28d159-17bf-451d-7691-08d9246e4a6d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 19:57:16.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Ybz1oEzTKLsumMsB/WN2LWYyhxMGiCQ8n11xwBoy08xxTZQPpDAtWUUZukCOao4FA6W9uYyCLlTlPGA6cS2t8+jJJ7MGwYpYHEkWdSuIGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7,
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

17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
> Add a counter for each action that a rule can trigger.
> This is mainly used to keep track of how many coroutine_yield()
> we need to perform after processing all rules in the list.
> 
> Co-developed-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

