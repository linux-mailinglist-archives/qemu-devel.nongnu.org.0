Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9062F5446
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 21:47:00 +0100 (CET)
Received: from localhost ([::1]:36618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzn2h-0002ng-Ab
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 15:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzn1R-00021j-7I; Wed, 13 Jan 2021 15:45:41 -0500
Received: from mail-eopbgr80092.outbound.protection.outlook.com
 ([40.107.8.92]:29813 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kzn1N-00060b-AB; Wed, 13 Jan 2021 15:45:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYG8qeQ8AdQ6c+Zn+gZUTyKtKldvosBIcKPQdL1sBmwrpKXu6iQ7sdb1L1szz8AxssVCUNAAkcpFthBiYbXnwv9BG3Y3/ca7zw1BkJJyUWnnmAdin6wARVFbRKff5go3MCd134qpsg96jNPnFgz0YmI2rD2IISoEzhSetw0vJrwNAJ75PAZHOSBUWLsX2Cc15HfR3k3ZESv3poJTINahgo9p5SEbl9TSAm0qf8HZk+LxWVSskReotOsy4xJ55gQk9qKY6mkgsXADG7Rl7P8g9tQMR5THJqyPznt+recsm9uRfYkTqj0H3ACRIsdkCoLgxRzvjyXqG9Cf0fLkFsLxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O9cSOHq/wX4+Eu5Vu+hZtWCUOmqrHdOcCRYvwzLloA=;
 b=YFr9CiWt/Znoltn90WQ1vIOR2N+ODK+XZ+fCERqhAsfpt3mzVudX2kcu3pb5Dh2nnBjop9FBkoZA1HjAAHpys5iwBxi9qWbXIO/g+QKB+MreBMFTcgoqBqVbuBe1i1EzSy77ZhRpGk1mfPBGhC9+AMiEnsTLzXSUqW+SF185IbxQzR1SoUhd9gfK5S78nznqaG6+5uncTp11I2H732TtqDfpWkhT0QFTUdr2L42tT6XU+KFyGBq3ecRUrtdZ+B8dYXCLVBOfmE7eZ71YCYDAu83+ouCgRWa6ywlxbgVo9afNWmhuOxj4nnOVeQnod0lOOxg7D2z8+IbPbDG4kRN1SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0O9cSOHq/wX4+Eu5Vu+hZtWCUOmqrHdOcCRYvwzLloA=;
 b=Ex01oDL07AXEz4+Wlyffxob2bcZyhQa9oo2xV9aZBrcpFRFUF1WQGMTkmi7WrZO7/UEaRYb2EsQdqRjHG41H3NEnE/wWI+KcWc3fQsOIzacSC1HZELkNLRLq/jCT1emUf+BpeN6lV8/xxqtKntBQMBpFaZ+Gamzh/lHQ3GMLO6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 20:45:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.009; Wed, 13 Jan 2021
 20:45:32 +0000
Subject: Re: [PATCH v5] block: report errno when flock fcntl fails
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210113164447.2545785-1-david.edmondson@oracle.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9e147b57-853e-3999-a205-46d73a51715c@virtuozzo.com>
Date: Wed, 13 Jan 2021 23:45:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210113164447.2545785-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.80]
X-ClientProxiedBy: AM0PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::31) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.80) by
 AM0PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:208:d2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Wed, 13 Jan 2021 20:45:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a89e961d-6f6e-4cd6-05ed-08d8b8042bdf
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280A52B56932E976347960FC1A90@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vgodfq4Q03hIxTiKqcAJd+BWZMuEJVPT0HlLvIn2kD89RDiOHiHXzvwJhe1B0FWdMIow+a5keHkgQ+GVvL5CXtatRXlYYpn1tTG4rsbDoyyKr17WQ1RH0l3JmGapuC2LIewtvhlHNGMnQIRMqON/QzCViBAbuuoP980G252K4Olxmg2eKliS4axp74Ebxm62bjGRSFlkgOLrWpNMU9nUmy7bq46k4v07w/eomK68llgjQFLJd9PtIzygn3f0T45fSET97/YkKSPr+VzIvWcr8MipXnaUSWnighCMI9jglBKzv0V+Rt+g3/EPmSPrHoLeGkxgDgaMxjqIvu/4dQdZElH9eSq8Skfd7er7jTduY3cZUIVXYR009OMQrLhDrJVZsZ/qyhCKhLsLCfUF1LaOEYRDfpwAWgpMyPeauBkkJytxfPjC9JhioKzGMCr4S3SLD2/79QadehhM64hLR5Mi7qLGYxgDmWzFvEtpuqeFuHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(376002)(136003)(366004)(346002)(396003)(66946007)(2906002)(66476007)(66556008)(186003)(26005)(478600001)(8676002)(16526019)(31686004)(4326008)(8936002)(31696002)(6486002)(54906003)(86362001)(2616005)(5660300002)(36756003)(83380400001)(16576012)(52116002)(316002)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q2pHZlc0NWNUem5BbDNkUWNSYWVoQjB1dVZDdWlqZFJIMTI2VHdmNjlhUXVH?=
 =?utf-8?B?Zm5sMFdoUTJkbDQwVXNmTkx0WTNDbmxFZFo1Z1RpMldyMFFlMVJ1Q2w5OUdm?=
 =?utf-8?B?S05MYWJVZlREYWdOM1lwSnRRY2M0Vm1NTHlsbnpLY2oxeVZ0OGZxS1R5L3ZI?=
 =?utf-8?B?am9aRHFYSkc0YXJSQnFSUkNNZFFvNHhPcTB1MTYxaU5Edzd5WUJZSysrRVRD?=
 =?utf-8?B?NUhOYzZEYkdNZFUvcUhBNUNHS3pjVGhRNHN1V09vVTdsYnNkUUltWEVTVG5F?=
 =?utf-8?B?RHMzVWlkREF1VmVtdE1FT09jZXJtM25lbUZ5c1lHZ0pnYzdoTDhTTUZJVHll?=
 =?utf-8?B?REJyZkdBSWo3WjVJVWkxQ2VVb1RORXg2K3B1bzVuRFU3dlA2RjlnQ204YmI1?=
 =?utf-8?B?clIyQ1FzeXN6N28yaldTNVBkSXdtNEdVeVUwQ2U4a0dpcklEbDhRU3ZUcTRn?=
 =?utf-8?B?UG94bHpHaE00cEpDZjVWdVB0Z3lwU3lXMjQ3MHNWZkZneFdtYVhUMHZSbkpx?=
 =?utf-8?B?d0Z0RlkyRUltVEJyNllPMC9FSW04VkZwQlZRYVdqYUUwaUZXc2FOL1VBc0pS?=
 =?utf-8?B?WVBjMTAvNWk0OEJHNlRuMmZRQ1FGZGJ5T1U4eEU3elc1NTB0UkYxSEQvRTVJ?=
 =?utf-8?B?MnJpMEVESXhnbkJOdFZGK1llZ0w3a2JtbjFBaTlxdEpNelcwQjI5OEprZjBm?=
 =?utf-8?B?V0dJYlpTWUpxMmY5YUdvNGhQOEMrOFJ2YmIrMllMdDRNWWxZai9pRW9IVTVG?=
 =?utf-8?B?eXhRWEVuc1NieU5uMzdmaStzMUU3UkcxRlZnRUJPU2pOL3lZUHR4NGJ5citW?=
 =?utf-8?B?M0kvM0JDazlMdU1wZ3V3OTBBWG9FeldmTGJZdTUwRnBsVHZrS1ZHbDgvV1E1?=
 =?utf-8?B?L3BTUzNrUlg0RTZtNTV4em1qZGxrVjZQUlRIamU5anZCc0E2Vk5rTEtHS0hH?=
 =?utf-8?B?eDdTTENoQ2M4NWdGMVpwTTZ3Um5YSzFVRitVVzQ4bG93dktvSXRGRWJJejF0?=
 =?utf-8?B?Y2lFVEpoaHorN29rUDBOeDFSUCtJMjVmMnVoRkFlUGhXY3JqVXFWR2xVK0Fr?=
 =?utf-8?B?ZFpBVUcxNnlPSDJzUHFqc2tYdWRyZitPSy9OemdjSHoxQ2VSa0hrNEU4Z20v?=
 =?utf-8?B?VHFCbW81a1Bjazd4N0d2bEdscmtybEtPZXB1Qm1DYTN3MUVRZzJERGF3MExv?=
 =?utf-8?B?MVBkcFVYSmRVc1RyTVlyVE5VOWFMK0RsSThSNURhYW5sVUpnK0FWckhPWi9o?=
 =?utf-8?B?aUVMUFI3NzYvYi8xM1kranRNUy8rOWRJcDVta0xvVEZYL2RCQVZhT0hzeUxZ?=
 =?utf-8?Q?OVHimugzN3BkqMuBazX6PoFd2nDKuWwx0v?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 20:45:32.7156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a89e961d-6f6e-4cd6-05ed-08d8b8042bdf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plxDEMMB3vSOD1kqSL41gI/TeVlnAo+sbeGOrjp0sOFOEeXZXqk1wJd/LSEI2ikzyjYzzQNmwd3fgdzQwlzVE6kiMSqWKddbOKQxpdGPgeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.8.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

13.01.2021 19:44, David Edmondson wrote:
> When a call to fcntl(2) for the purpose of adding file locks fails
> with an error other than EAGAIN or EACCES, report the error returned
> by fcntl.
> 
> EAGAIN or EACCES are elided as they are considered to be common
> failures, indicating that a conflicting lock is held by another
> process.
> 
> No errors are elided when removing file locks.
> 
> Signed-off-by: David Edmondson<david.edmondson@oracle.com>
> ---
> v3:
> - Remove the now unnecessary updates to the test framework (Max).
> - Elide the error detail for EAGAIN or EACCES when locking (Kevin,
>     sort-of Max).
> - Philippe and Vladimir sent Reviewed-by, but things have changed
>     noticeably, so I didn't add them (dme).
> 
> v4:
> - Really, really remove the unnecessary updates to the test framework.
> 
> v5:
> - Use a macro to avoid duplicating the EAGAIN/EACCES suppression
>    (Vladimir).
> - Fix "lock" -> "unlock" (Vladimir).
> - Comment on not eliding errors for the unlock case (Vladimir).

Thanks!

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

