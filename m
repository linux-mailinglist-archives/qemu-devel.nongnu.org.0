Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528C5308550
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 06:52:52 +0100 (CET)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5MiB-0003Ey-EI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 00:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5MhA-0002jQ-6J; Fri, 29 Jan 2021 00:51:48 -0500
Received: from mail-vi1eur05on2120.outbound.protection.outlook.com
 ([40.107.21.120]:52449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5Mh7-0007QU-U5; Fri, 29 Jan 2021 00:51:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmx8FMJqYPqcZCWuJE2WfUhuFsF98kTnBjbp/Mnltfzrxc9l9vKpLYdYwIowH22WsGG7ZwfiLa2pIvju7iSkKuFn5m6Zw61cLpLsfpGzMjVjRBEh9K0bKxbAhQ38hxXJSMT3Jp6KlFu3UyW9Z1JQETQf1rzyRIOhr5eb/8NUDUTs5DZQNHgwEDcoNJP2c8N1aTE9CYKiTPP4LGFgag61zyfHWrUZ1+9jGFpL5O3Sh1oNeJQJ258Q3m66pat4a3HIjJ68iQZYpQQTjXiqoa7gSdd43HQrt/2gsWTiCA1mImPaigbxDdeFelIdF3VCwu850SfQjgNapGJsPwxScdBStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UThQG4BcYX/Q3ICdAfwwICeZ7+/fMI35KLXukJM7agI=;
 b=SD4q5BKn58gOs7KA4ulUaUoQFYguhB+uFxmjDN/NbGvDXu4C64jz4uLvyfCZH1qrxEHr9jfPAn6mx06fNIn6U1L9pPiywnrp4z16lD/zrqTwWCw/KfYpIW8j+wwKtQGIkuWkMB6WqO3Yhg2Q3BLYHp2WrGYEd7AWOsGlRW9dWmTlVmMN+1gWcSpT8bYrHJYO7ZsUFpiY5xxkYHVULciDgqRKtoVjLDqHFMzmNbbNXuIJjKSmjQhIg1/C7gmB8vgqTESEg0B10d7vokNhwpHfe78T2Hwn4YvifW0buAqFK+KqXgtQb6bzkyXJyOjBi7Wzr2/LCK0xWw3X7KIAPuIaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UThQG4BcYX/Q3ICdAfwwICeZ7+/fMI35KLXukJM7agI=;
 b=v9QSuIG3uGBg+rezSiWfNLZSPPw5DFqT+VlL+ujvRuGxqiELaV6gq1KXv8WrsbxHvZeow8D59uMiWSABmthogp3scD2xCGJGntA4aIGyaq2U7RGwYNkV4HE9V6WFcT1hngjsko9p2w8ZbjbgKrRt7SzBQw0+OhuSfUvkkfBGj7Y=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2611.eurprd08.prod.outlook.com (2603:10a6:203:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 29 Jan
 2021 05:51:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 05:51:41 +0000
Subject: Re: [PATCH 0/3] block/nbd: fix crashers in reconnect while migrating
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7555daaf-1e1b-1ef7-a5d1-24d98a18599d@virtuozzo.com>
Date: Fri, 29 Jan 2021 08:51:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210128201418.607640-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [178.176.77.43]
X-ClientProxiedBy: AM4PR0701CA0033.eurprd07.prod.outlook.com
 (2603:10a6:200:42::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.42.193] (178.176.77.43) by
 AM4PR0701CA0033.eurprd07.prod.outlook.com (2603:10a6:200:42::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend
 Transport; Fri, 29 Jan 2021 05:51:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3aa30d8-afcf-439a-513b-08d8c419f3cd
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2611:
X-Microsoft-Antispam-PRVS: <AM5PR0802MB26114B6803C7A17D55DB95DEC1B99@AM5PR0802MB2611.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l+o6l0HS8zJLzeN4l/zzun52h/PlhU31xUuESDfc2flqvNpkHtcoczHIYDUBNLzBksd/PJbe6niB/FygPqM9wuSL3iCBLIfuj70Fd3ac87WbkUlF0u94FepfaUudwlzjRnGyyqG6WHK8hvUeLdpjuBgTZ1Vy2IdOCapa+refqweRZh2pyTcHnlMHOHNI3E5zdCbbDiCCaGSOnEYGItQKru45CGf4TqlfUvX6GRgALPUpww3R8zpEa9ZtQAcv/e0OAP9ZTTIf8O6TcXV8WQi81oWQhxPzMtCB8+teKpsXUXkFLQjhiP2tUqg7wRrZkTkLNO8XXSO4BLvJ9k0NGCUCczRraZKfPey8YiF1nkycAwtMhj12/hcU91NtU5f6P9dynrZ+jSEpkcGha4yj/siF8lS4pIutTsi8+MYSJoXhLzSBYzn/dge4Exi/AZYROJcUiMHDA8oHxD2SYEaNfGSsVjSqfphe6x+E5hUcj0OykSjzjM0aPQv59osHOek8iOZbDMlYskd73zquvAh+SRHDTqGtQ9/pnm5HBYy3QCEPBakHIClYlAv64wKktUkf7h2dFV0gZweVXayu4uhsVHN/PTnodGOdvnBL0rTNYSvx54E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(136003)(376002)(366004)(2906002)(5660300002)(26005)(52116002)(186003)(54906003)(31686004)(36756003)(6486002)(478600001)(316002)(66556008)(16526019)(16576012)(4326008)(83380400001)(8936002)(8676002)(66476007)(956004)(31696002)(86362001)(66946007)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnFJaHdlYUFlbEdqRFRLc0NGQkRzb0U2RllZcU9WcEtjSUNIUzFNR2s5bEly?=
 =?utf-8?B?ZzYwS2pMSmFTYTBZLzBXLy94M3NRakVHU3dpdHVCY2d3UmMwZHBjQmRiQ1FP?=
 =?utf-8?B?WmdTYXhFTkwvUWdIRE5GRDU0WWdFcTEzYWtXN3hFZCtBYXZHYnQ0NEg1UFJU?=
 =?utf-8?B?djJadjVTa0puNjJ0SnFXM3lQSXk5TnYxTC91Y3dCR1VWeFVVemFQMVF3dmVB?=
 =?utf-8?B?RDVXN2U1b1hhVTJnNVlqY3JFTEJPcmRmSUNTUzdUMnY2V3JxWXRDRnV0QVRS?=
 =?utf-8?B?Ulh0ZThZT296Unh1YmxUVlhMWEVzZEIzWnErM0padUU4ZWExRW9ZUGVaYjVL?=
 =?utf-8?B?ZDdCWHpMWjlWa0k5a2pIRVVXMXJlL010eHIrN04rOGpKUkQwbzB4SVlURWdx?=
 =?utf-8?B?d2RyZG1CbkhHbmR6cHNzNmRDRHFtVC90T1JaS2FGS1JLaXR2NDRJM0xmSSs1?=
 =?utf-8?B?MVZEZnJXelErU3ZCK2lodDBEc2I1WUJEYk1BallON29STEZzYmxsMmFDYnM2?=
 =?utf-8?B?dTE4VHdaS0F1RGswY0xaalJ3SlhvZGdFeEM1R2VrWTA2UUpuZkZFR1BHaDdW?=
 =?utf-8?B?RlF2RXFnVlZLR0MxcWVCdUpqc2NWVVBHWjZIdi9MTUV2eWgzZmxscWRFZkk4?=
 =?utf-8?B?UWNTeStkMkhEZlJsRlVWR05PSmxLa1ZsNWMxNndzUGZuTUk0ZHQvbGZkdlQy?=
 =?utf-8?B?ZDhWY1NFZXJHbWtFZ3R1TXhXK1FCZU52QzBCQW9hKzFaYlpJdGtURFlyUy9T?=
 =?utf-8?B?V3dtTG4veVg4a0xoYXYybUQ3MlREVVBxVUp6blFKc01FYUZYbU5ya29wU2Y2?=
 =?utf-8?B?aGlOYnJCcTM2R3ZSNXA5cmN5TndGVC9Tc2hnZzRiUDFSU3F5Tmx0Ym1ObzNq?=
 =?utf-8?B?WDQ4VzdXM3VLUW5Jc0RJRmMxcUpUL0dZQ1VkWUQ2TUZaT0FFbjFaYjNpbC9o?=
 =?utf-8?B?cWlJbGRZSGJINWt1YTFrY0hUTzNib1l4LzZ3QlI2cmwwT0Z2VzZFOU5qTW4x?=
 =?utf-8?B?SlRaUXAvYWtnUXpZTjZMMXRBVytpK3VYTEovTW9HMmUwZ1NwUEVVT2JXOEtm?=
 =?utf-8?B?bFBTY0MxaEREWlhwS2x2UmtUTGtScDJmOFRlRWNRUzg1cDMvRW02YUVHR1Vr?=
 =?utf-8?B?TzdJOHZrY2FocTdZMkVtMGZ3Z2dFMFJURElxekJBWEhvcHhiODYzREhZeHN5?=
 =?utf-8?B?amxyOEUzZHZPaG4wRHVGQS9IOXhYYzRaZ1NqOE1oU3VISE1HTGFMczh0MmpE?=
 =?utf-8?B?SmxXdHdJOUczTGNHeHJWRkhoY0d0RENRQTBjOGVLRklsRkgrSWRPQUp1QkFk?=
 =?utf-8?B?dHN2UDNBamhNZ1F3bW1SK0YvMExFZTFVTDBQaXdreFc3Y2JLMWhvRE9BaEo2?=
 =?utf-8?B?aUlNa2MxcHlnYzlXM0hmMTFDaDV0RHVSL2ZZQ3VTd2QrT3ErUFVBRnEzekJG?=
 =?utf-8?Q?Cr3jx4GK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3aa30d8-afcf-439a-513b-08d8c419f3cd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 05:51:41.7914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iorLYSp4fVKUoxLXEhCTrQ0vcBxJwEQQygyPq5WrInzHq9h7KAgwiwDAFiC9nYaRWW+ykP/y8Uw3yN12Q5KvaJUXaCEZesyo3yYfH6q6hN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2611
Received-SPF: pass client-ip=40.107.21.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

28.01.2021 23:14, Roman Kagan wrote:
> During the final phase of migration the NBD reconnection logic may
> encounter situations it doesn't expect during regular operation.
> 
> This series addresses some of them that make qemu crash.  They are
> reproducible when a vm with a secondary drive attached via nbd with
> non-zero "reconnect-delay" runs a stress load (fio with big queue depth)
> in the guest on that drive and is migrated (e.g. to a file), while the
> nbd server is SIGKILL-ed and restarted every second.
> 
> See the individual patches for specific crash conditions and more
> detailed explanations.
> 
> Roman Kagan (3):
>    block/nbd: only detach existing iochannel from aio_context
>    block/nbd: only enter connection coroutine if it's present
>    nbd: make nbd_read* return -EIO on error
> 
>   include/block/nbd.h |  7 ++++---
>   block/nbd.c         | 25 +++++++++++++++++--------
>   2 files changed, 21 insertions(+), 11 deletions(-)
> 

Thanks a lot for fixing!

Do you have some reproducer scripts? Could you post them or may be add an iotest?

-- 
Best regards,
Vladimir

