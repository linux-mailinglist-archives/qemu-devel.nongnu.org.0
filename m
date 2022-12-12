Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ECD649E9A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 13:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hpT-0006JB-Ae; Mon, 12 Dec 2022 07:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p4hpD-0006Cr-SZ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:22:29 -0500
Received: from mail-am6eur05on20720.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::720]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p4hp2-0007yp-H4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:22:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgU8NOmG844KVsluBtoTAc2SEnSNCZ5R9d8nHpzWpgTzQ1gB3dmsYUxWOkIFgxJ4C1auFeTPDenL6myBOA/4ZS89qJK6gDhmq9yiEG86DyfimZ24gOSjgdxuXmiQG8q5w4o/SciIiX5cOyUipXkE1OgyZlp/3s3WquDB73tc6zlGO1QZR97xcVBTS1QIBQB74lKjebSJLAEGp2c9Hi+dLKZ881ZsnzR6x/VxC6+xpbl9vfd2FqxpVOxJkCmbEqiGQHnyOFu0pzIzPsk5kfXc5a+bd0LHhi++WVFrwVvKG3GJGSEyAVAB1YYOk3fnvaIXaYkF2esGXWTAK3UJUjSm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PXowseSApGj4a3Qr6SoXAcR/8+EsjXUp40JE3PEPm8=;
 b=W9XO7+tGtxqN2m/YpL2tdRUogm2QzsuhFDT8J7He7aqKXhtHn4lOxGOFgXiNzN7krAlTJ2e8W+NvuvwGdq53bSvtA14kBzGm/EYxk0gv8079ptPDDUrrSknRZ7gf6zMuKwD0cEsruMN+WnL7tY1WG3HuG7VCKEO8hw4pxxfgrJcnfAOC+HpmULa/xskMJVXfubwX09iJCnBhAT2dH/LnqsqlYhbqG0vNQndReYiDZm610Te2r8ghuXZa9xYy/gJY5ew43GDt8ZDXsQ1YZRBAda5DBIi7zdw0WjWdV3DIC9OjMJeH34UfRgOSY8WZI2yAh1xbdnxIXWUbaAvbTNar9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PXowseSApGj4a3Qr6SoXAcR/8+EsjXUp40JE3PEPm8=;
 b=Hkw+al33rTo6Zhqt7wxmuzzmXtjjU4m2rZJMCCPH8sNf4AVV61U2qGHslx6H6vr21bwBYlDV5u7rMGPBlzcei9yNbziX4mkcg8vhrC1pHKFCxfLPWDFrqau5xVcLUZ5lM/DGwaokRwBtWlvq96YBOFMuyVjgarCxg5OWz2gvG2rBu05SbQHyvn5UKfv3Yo0fTbD7uUDpLMLZKOz9Gzka3Ayx8e6XW5onDyA6135o3gPNDJb6EKHmLhmqF4J/NdOlYpjuJ4HugWui/xgNNfuYJnjQsQ0x4Q6GBvhkZIwpG082Pk21SZVKWRV3834BQjxwiDtmXLybOCIGhrNCd8Z0EQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by GV1PR08MB8283.eurprd08.prod.outlook.com (2603:10a6:150:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 12:17:09 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156%3]) with mapi id 15.20.5924.008; Mon, 12 Dec 2022
 12:17:08 +0000
Message-ID: <a0d15083-c257-6170-a3c7-2baf1ec58a9a@virtuozzo.com>
Date: Mon, 12 Dec 2022 14:18:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/2] qga: improve "syslog" domain logging
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, marcandre.lureau@gmail.com,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <20221129173809.544174-1-andrey.drobyshev@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::19)
 To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|GV1PR08MB8283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf0e58b-af27-4835-c569-08dadc3ac9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C7nwSrjIf1QXv5ePzjvwYOIpapTsmqfHQyS8Oqlp4ld8h3buH3DXN5iJw8hhxfyjkFLP8htRP0f93MHa8X28VEiRETsPOFdk0wr0veePNOEIHRVrlEmwiVtgWPo6hgX3KcKmHhU8db6cWAxm4NzMR54bUhSE2OYD4oIljIlZR0crmFjJhU8dX8iQRrTPXoiwqcONT18742IZ4AewdnaFqX3/USOBQiD17bBuXeuYo+VyQjXMlcfLR4dINeeCapfh6fmivzu3zFVXKTQ2MpIXuvRqZHPzWQLNPBWStQ+pji5N0B8Z8QZBllNwp5yWjJg7hlUFa+oMAsHEua1VtPnP5TaelmV0KzjpTo11lfr0bqDvcga64TIyPoc8DPwXtenFqO+nncBLwl9f9FglFoAh/EejVMZHoJ542TNme2iV3+G4fwxvi0Q2l9QracFzsHLt1dXqmiDV9fhmrOkdc5nTl5vdM94SrAOBqiTvK2T2nXGtA17EkGFm7gdyKFVMYrQdlN+cuUzU6J9KCGi1cQd2U3FaSjSLkDDFJxYJPw5Btwc6G4eTMNJpzehnL8U1prQMV+auNtwbwb5e9YKsHO4jLzRTDgAnAq4X5XpwNd9Q9FH/lwhOZUAY3yNCNpQS1JVJfNPi/K7CHQXMK1NnKJqechA48EZiyjZY9h2Mit6zwNbWaQXrcYXY25ac9mVpaE8qe0jrye9W+KVTPlHuK1dRg4PqoUh5m5YQSo1w11SYE+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39850400004)(136003)(366004)(396003)(451199015)(2906002)(38100700002)(4744005)(44832011)(186003)(8936002)(86362001)(4326008)(66946007)(31696002)(66476007)(8676002)(66556008)(6512007)(41300700001)(26005)(2616005)(5660300002)(36756003)(53546011)(54906003)(6916009)(31686004)(6666004)(6486002)(6506007)(316002)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBCWElpZEVqZHl1RGs0WERrOXI0Q2hzdnYxUHIzcVJ0OEpyRnBZK0RxejRR?=
 =?utf-8?B?V0Ivd0doZ21MVWtiaENxVlV5VHpaTENSRkVkT29QcUFLbFR3QXBZOGcvOEFx?=
 =?utf-8?B?bzYxS3RIVTRHaXZuY3BBalUxSHpRc1BjUFVSWk1MUVVpaXVxdCtDTHBqTko0?=
 =?utf-8?B?NmNVTFU3U0M4dUFxUW5ZUmdzUGlxeVVSWEFUSTVSWlBxZVJKVG4wOTlmVkpM?=
 =?utf-8?B?cGU0TlVCalk1VlJ0d3lNT3VuYXhrcFhRQ0NqcUVnbWdNdnRLemxNQjZkMVBn?=
 =?utf-8?B?TXIzM0dsYVJRaHVibW1YUW8yWldUbVB2dEhDTkVid2NtbzI1ZEsvcXhzSldS?=
 =?utf-8?B?RWNkQTFMYk1SMHQ2N0N0TzN3YUJrejdVenJpVEdaOTJ1WnFuckZEOTFSaVQr?=
 =?utf-8?B?eG5lZE1zaEYwR3I5TWRhV3cxU2Zqb1JESUhFQmk2YWt5b0xwSEl1anRlTm10?=
 =?utf-8?B?WmVXbGhseGNya3FrTE5jOElCUEloaU95d1lUNUlUNTA4SzhIK3JpeEhtNHNk?=
 =?utf-8?B?MXFjaU9BTGRQOEJGR2xNRHUyNUNKdHE0azVKSzY1RXNuMWJmcFpIWVJQY0cw?=
 =?utf-8?B?Mmt5REpaRnF4TTh2M29MVXJoWnZMWURZK3ZBYzMxQzczM0JlWmVqRGQ3Nkty?=
 =?utf-8?B?ZVJpMTVHWTFGYXZmM0tYN0c2cWJtSlRHczFJMnlaYldUUzlNbzY5K2dPbW1J?=
 =?utf-8?B?S0RVZkYzK0paTHF4UDRoUGpVYnZ1SFkxV1daS0pDdUI4SjhMUCtYRG1PSXA0?=
 =?utf-8?B?QXdCOHNHdDVmcXFuWWExc1hlMXFJNkZFRHhGY3psRkdOZ01CaTZDWDRWSVVK?=
 =?utf-8?B?RDVQdmxwbU1ON3N0ZWFjZDdIZjF6aUxBKzIwVGk1bTBhTm9saUErUVd2QUdx?=
 =?utf-8?B?L1V0RnYyVVdkVjExd1BncE9KSisweVZlV2pXNUthbk5Id2h5R3F4aHlWb2hJ?=
 =?utf-8?B?ckdFejdENjdML2F0c0Nrb2hDeGl3Y2FXbVNtQnlZNm1UOVRjSzBaN05GUDUr?=
 =?utf-8?B?c0s5cjBTTmF1Z0VzK0dTR1RxNzRDZm56SmtZNGl0WGJFUU92MW82aS9xd2hV?=
 =?utf-8?B?WDFnSTM5cUNzNUNWcExiVzRmTUU3L0ZTQXdzTWx5NFpOSXBlZXMrajlwdWxz?=
 =?utf-8?B?Mkg0WTY1MDdOMVN2SG5aR3AwM1VvcndQTmVzRndHOFFPNyt5cGVnTkRGV1Ny?=
 =?utf-8?B?NmNzZzRsTFJBcjEwNzJnN1l0WlBIUENUVE45R1ZNM1F2MjVQak0yWGZ0VWVF?=
 =?utf-8?B?TkpwRWdoUEY1NkRBa2gvYlJEQ0RUS1lBYWsyb1RNUHMzb1AwRTJoZnV6WWhJ?=
 =?utf-8?B?SEI4UWc1UkJkbi9PdktEMmxOOUVKZENiRjZxcHE3eVhITHR5ZGpWK1U2dWY4?=
 =?utf-8?B?VEZHUkNLdUJVa3ZxTUFHNTdJTENWYmhWSThheFl4bVVtM3YvRzNtbjNVQTN1?=
 =?utf-8?B?L2EzbjlOQTdnV2k5eGRRN0I4ZlE1cS9mMFFzTDI5VTJiWjZXL1lvMXZ2TVIr?=
 =?utf-8?B?a0h0UmZzeU1acDRSQ0hEWEw4MS95dlovZHp5TTB4VVNnRWttWThISURsWDVW?=
 =?utf-8?B?NkZOdXJaOGU2dlBSWExSZ3pxR21JY0dqOEZMREttWUxuMHZkSTR1cXp4YkVM?=
 =?utf-8?B?ZmR0TXJIOUxjOXJZT2pBY0JZRDdKK0FYdXliSzIyM3gxdktwMVJiVEhReGgr?=
 =?utf-8?B?WXJ5YjdIeDBsRTAyaTZPUTRjN0JmWkd4dzdqVDdhZlM0Rzd1M2tVUzkxOG1k?=
 =?utf-8?B?NG9KZUVkTmozampJK2lBVlZWK2h1V2pzcTc4UjNxNkZSaWRUS1RBRHZiNzVB?=
 =?utf-8?B?MVZqRU5UeHAwT05iMHQ5VldsSWFEY21KTWNVZUg2bG1HaTUydjllNWJPc0Mx?=
 =?utf-8?B?SGR2aU1ia2V3T28vU29DUjNXNEpVRllRdXk2MVVIbW9XaVRCTEFpUjhXQUR3?=
 =?utf-8?B?VkYzb1dJNk5UcFIrRmMrcW5VbDRBTTROY0VYWVcrczNoSy9wWmp1TmsyVThZ?=
 =?utf-8?B?d0JDNmkwajNLVThycG9HLzV5VVZGWGNGU1FTVDhDTytNT0I2cFZ3bkRUN2Nr?=
 =?utf-8?B?d2NkRHNmdVFCd04zMGdtR1FLeFVJbHBCMm5aa1dubW10TzQ4bWhZbElRcEtR?=
 =?utf-8?B?QkJ5ZHN2dm5EakYrb0hncnFUVlR1MTk5L1pVdmY1RE0wM2hELytNUjJDWWxJ?=
 =?utf-8?B?NUE9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf0e58b-af27-4835-c569-08dadc3ac9d0
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 12:17:08.7680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4yxXFYBqbHdQ7OSa+PIJIhxfPjuq1YFFzNeECMvGuF/7pjCmZ+xCfRPQH8z/O2WRfcA3uRDr1pggdpRaQ4v/hnbygq9faRW3p8YgnPz3U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8283
Received-SPF: pass client-ip=2a01:111:f400:7e1b::720;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/29/22 19:38, Andrey Drobyshev wrote:
> These patches extend QGA logging interface, primarily under Windows
> guests.  They enable QGA to write to Windows event log, much like
> syslog() on *nix.  In addition we get rid of hardcoded log level used by
> ga_log().
> 
> v2:
> * Close event_log handle when doing cleanup_agent()
> * Fix switch cases indentation as reported by scripts/checkpatch.pl
> 
> Andrey Drobyshev (2):
>   qga-win: add logging to Windows event log
>   qga: map GLib log levels to system levels
> 
>  configure                 |  3 +++
>  qga/installer/qemu-ga.wxs |  5 ++++
>  qga/main.c                | 50 +++++++++++++++++++++++++++++++++++----
>  qga/meson.build           | 19 ++++++++++++++-
>  qga/messages-win32.mc     |  9 +++++++
>  5 files changed, 81 insertions(+), 5 deletions(-)
>  create mode 100644 qga/messages-win32.mc
> 

Could you please clarify the status of these patches?

