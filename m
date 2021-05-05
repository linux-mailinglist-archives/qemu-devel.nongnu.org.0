Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF412373504
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 08:39:12 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leBBf-0006zG-Si
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 02:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leB98-0005iT-Qj; Wed, 05 May 2021 02:36:35 -0400
Received: from mail-eopbgr50100.outbound.protection.outlook.com
 ([40.107.5.100]:64892 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leB96-0000IQ-R5; Wed, 05 May 2021 02:36:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtML5XYc+x5oXE/hMJq5LXYfxxoZyGo/LOkjLdYXw2YIIVBiUyccEgji++FzsNMS+XavBJX4MwkrkLbPGaEPD7qk4NzpEyQPy0TUgj8mr1UV/9qh7aZS/dzobqu8FOpcPk2p1hm+MAdSGtkxos63txrQRAubsepyby8mU9UuT/ZKT8ZypsR1fediR3Cd6buVVbK4qu/QoyrWWKE9yd/5aAlX7m9SvuEEmQpaYjCfxz5JNMPqAw8hh0LGNIxY/Pop6AaHKJdVFoOCkPKQGSmJX4eyiwEezMSrNtFQs3xSvIpvqobFPb9r6D01NQl8kQ3ZM3zGbr3G+YPwk5Cs62HP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCGv1JSZH5m+hCJ0aw1uGXFB0j6+a7iVzTJjzwUL/a4=;
 b=W6rV5C33eZ27xwoBVzl4RVCI951L7vWSjaQ/Si6nY22SnOKNquu4UrjydKefmnMYILIT58XxdwXbQu8M65qfL7KqJw6odOeyyIgVCR3N6qf0+Esgoy6taSKq9LDl2k0sNqYhD6yWqkTgTGIcJjtZcP0r8Z0WYwFt34zM4tkx28gghExU7KXBUmu1/tAlUr8lwu/paiQ7yJGbXtl1mzHPwlsE2KEFHbum950tIrOeRLOKCVJr8qqZkxObUP7gUxJ4gR1Rl1EEZsb3psbhsfmKX7v56MdRrWzw3gHvirxMydSyDhrOwIjo+Tucuo07w6DAN4kOFs2eu+kYqKMw9485XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCGv1JSZH5m+hCJ0aw1uGXFB0j6+a7iVzTJjzwUL/a4=;
 b=f5+KlhoegrK/EYrjfnfM8ozu0cd863Yxb1lQqVkv1FhhCqDtLBUqgahfapMR6/oLVeHDnStug+MkOg9qoU0f57tqL+fmQH8bmnCGnnsG7rEB2xCYVq7LzMxrZ0iz8vdghMjp4PK7tbdnuZ9oXQAT16Rlj5xpOSFhyYqzajrUxCQ=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.43; Wed, 5 May
 2021 06:36:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 06:36:28 +0000
Subject: Re: [PATCH 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org, ktkhai@virtuozzo.com
References: <20210504152023.322862-1-vsementsov@virtuozzo.com>
 <20210504152023.322862-11-vsementsov@virtuozzo.com>
 <c09753f0-b26a-3fb9-2591-68d46122d1c4@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3ce36fb2-d4c3-9197-0224-7c69bca5ead4@virtuozzo.com>
Date: Wed, 5 May 2021 09:36:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <c09753f0-b26a-3fb9-2591-68d46122d1c4@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Wed, 5 May 2021 06:36:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebec5a7c-a42e-42eb-6c56-08d90f901cd0
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19712434D888283F107A3890C1599@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 90tymovppYvXGaHLe/ucpKDXriGKSRpvW8jRAxk8SLAD6TdXJ66dPyI4Rvr7V92IS67uGdP7rGCiljL0Gvhcvg3P6m/9xrnITow0SK3uWVLiIg29rkirzw9nLsfKPLOpCvigeLPakhERE5ux000nJaTPKrqGb+KzC6XXBOMv/HWVGrvQxHZjDduK9WJ2jC77wfJJr6KtlkCRCC/pJN7D3AlY4eOPN2kAi8LxNEs1N0WRVxvvlTHf1UbU3gfzEQ4+r27FVdsKcWi4faA9v4kiVph+lLy0pDeJiys3Q/NIKdKJL0su/3K0jaVKz1SI/+tLqfRgNYNlqvIYuTNiztRdi3ovEMb+Ixx4qo+8eavx4yEltbFq1VYpGJB24b0Pi38Ul/2av7IGcVp3Xo1iFtpKYEP6v/pLW2wBIDVJCmxoUTcDXDL31m2s13wWWWRLKtzI0ekyw99S5aul64uPp4XlIa8wBDuAdzNHHNeKx9nbiii9UDPS3L8r1Y6xZADNzECwHLGFsx98vHv3ioH4ElkJ8gKix7GCaFMFyh2yE0fvGbStXTgUzFkvXrQth/RJ9gZlEsrBmr+wQLjlFyO2ZandQpaefLP7FV39vj/0b6WDqRyPQEOyI1a4zX4KW7y3zfq05SO/8C0vbOuwMCGX8pnVo3HRvljW3K9WDMQZoDGOcMcOsxQm4qCOM1ZIkBguiTRfKMcFIScsQ235CB92kHwFXH7b3oJv0t/6RqHcCIFDGOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39830400003)(86362001)(38100700002)(2906002)(52116002)(31696002)(107886003)(16526019)(186003)(956004)(316002)(4326008)(53546011)(478600001)(16576012)(6486002)(26005)(2616005)(8936002)(31686004)(4744005)(66476007)(66556008)(66946007)(36756003)(5660300002)(83380400001)(8676002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0pRQ0hocVRYNExHaGQwOC9xN2RvcTRSZEZ3QW9OMnY2bFh4VmE1VTVvTW1P?=
 =?utf-8?B?U2NGR2dEY1pmdnM2TnFpNCtBQVdOcGV4ZytRZjhLSElGU3E4MlFNUlFlZ014?=
 =?utf-8?B?UXhKa0lHd0JDS1E1dHpvQ2dJQ1Y3a08vdEV6bGJmTHBKcUQ3VGVKb2MxK3dl?=
 =?utf-8?B?RmRDWlF5V2ppM0hDZ0FaNHRYM3RHZll1eGJFL3Z5b1ZPQXZiYm1sYTQzajJ0?=
 =?utf-8?B?TnRRa1lJQ21Bdkg1WlVLOW9ZK3pHZERXRUlYLzBPY3JYWUxpS2dSMXgrcXhX?=
 =?utf-8?B?VlRDbU5wdGErbzBiZVpRekQ1dHJHZEVBNW9aYjYyKzRqNDJESG4rcTlqZ1N0?=
 =?utf-8?B?OXkvNGRKejc5Wm5ZREFhWW42VlppZmM4N3d4VUZvaTZaSERwWVFKcHI1YTdk?=
 =?utf-8?B?M2xYYWpsUm5aTGhyL3FaelhDS1JMVWFSOTJBVSt2Mm5JRG9CQzAxdEd6YUJ0?=
 =?utf-8?B?SWFoNGRvWmN0TXMzZ1pBclQ0MmRRMDBWeUZZNUNOaktWcGZIWDNEaXVQQ0Nl?=
 =?utf-8?B?M1gyVDhFQ0ZSbno4d3dLdnpXN3VLZm8yNnliM2I2VlZkUE5HYjh6Mlk1VGJ6?=
 =?utf-8?B?Vys5aDRhV2NFcGdHenFaQWdyUklIUGVrdFZuSE16OUhjSFdmQjhkUkloRWR0?=
 =?utf-8?B?Y3p3SHZ0V2lnZFJ6UUtjM3IyeWV4TGpSRUlYV254VTJqSDlaUmoxNGQ4QVhw?=
 =?utf-8?B?bGd1dE1tMGU4aGJhMmRQcGorNThBNitHaytGYmc5MTVQbEp1Ykw5REluM3Rh?=
 =?utf-8?B?a20zR3A0Y1dXMTUvRTBGVlNDMzAwc2M0UHk0eng4NThpRGxZQUd3ZU04dFhU?=
 =?utf-8?B?WEs2K2J0NEsrQWo2alFVZzh0a2FDRUxHVjlWdVdXcHltT2FIU003TkVjWlNU?=
 =?utf-8?B?eEJ6S25hQWQyRG4zM2tQaHk1bGU5TXhCQWdETjRQRzN6aDJBZTFZMXByMVFV?=
 =?utf-8?B?bHNmQ3hjdUdsMnZJYkV5a0E5bENRZXBhR0x0dTY4Kzdac0RXRzExVXR1WFd6?=
 =?utf-8?B?dlo5L1pSUFN2WlhteW1KYjdVNUJLTk1VT0I1QXVUWStnTXpKdXBmQkZVK1lp?=
 =?utf-8?B?bjhwaW05K3pacDhFbmhzdVZwdUk0R1pqaEluUXFHVGhYOWVrM3UwSTRrWlk3?=
 =?utf-8?B?ZVhwY2hRNkhWR056ME1TRjhoKzZzcXg3Nk1nVzVrZG9GMmtkajBkZFFCSFFo?=
 =?utf-8?B?amJZUU14bG8xdmdpdGxwbXFhNXhFY0ZWVG5Gbkk1RVhKbEV3TDdYSkZKS2lu?=
 =?utf-8?B?cTlNRmtnOFJUbHUvZGYvU1JZRGF5cDBkNWVxWmVtUngvZ05FT0w2QVl0b0dJ?=
 =?utf-8?B?TFhsbHhnK05UeHh3Z1JOM1JVVHZwTk9GZUJrMVFEa29jbHF0c1ZaRnpFL3Ri?=
 =?utf-8?B?d3dWMU12OThiK25tbXlrUTk1a2ZCMDF3OVU3SWpWVm4zSzhwQ05LcTI4YlVu?=
 =?utf-8?B?N1VVQkhxdmZoNmxRVDYreTVvUEJRS09JTDhhOVpPMHNtemozUFhVekRaNXVV?=
 =?utf-8?B?M2pzMVFDck5hcTQzVkRtYnNSWmdpRXcwR0wrUDQ3bzRvSG1WdE51dU9EV3RY?=
 =?utf-8?B?bXNKanY2ZnpJSXZDNmF3WDVydnZiQ1BsL1V6Y0RQd2k2TjNVZ0cxcWxaR3Zt?=
 =?utf-8?B?S1VEM3FMUkhybEtrSzBrTWJYTzQyNzhYNndTeGNTUjdtOG54SlhwbmpBSTg5?=
 =?utf-8?B?dGdZZEl6eHFFZVliRnhUUWFwcVIzam5vOXFrcXNydW9wR01FS0N6T2pwbUdL?=
 =?utf-8?Q?pRz1Xf0ofatLkJp/xK8lMqpTgU+5NLOiXFLRC9r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebec5a7c-a42e-42eb-6c56-08d90f901cd0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 06:36:28.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0TJu2jDMo9McwVdnrrHfZnDJWtGFMQNlOvmR9NllGkHgryoaez9qbxScP0sCbozwfxcUxPn10BbhV3Arf+Re7uRnuEFABqYXLIJV+oD03Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.5.100;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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

04.05.2021 22:54, Eric Blake wrote:
> On 5/4/21 10:20 AM, Vladimir Sementsov-Ogievskiy wrote:
>> Split checking for reserved bits out of aligned offset check.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/qcow2.h          |  1 +
>>   block/qcow2-refcount.c | 10 +++++++++-
>>   2 files changed, 10 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

Thanks a lot for reviewing!

-- 
Best regards,
Vladimir

