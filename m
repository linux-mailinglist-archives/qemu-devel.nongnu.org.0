Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A438CA74
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:55:25 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7Ui-0000JC-Tg
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7Sl-0006uY-Mw; Fri, 21 May 2021 11:53:23 -0400
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:51684 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lk7Sh-0003Yg-FP; Fri, 21 May 2021 11:53:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMqpI5WgWlRh/IIZ9ccNXpadyMx56I26ACYPJB+UiXVlz3khb2AWlxbqwz9q6oFjN1GM00KGbSuMdVVVZv/NFRJwq2MwnSyKdRPyoLzqC+ZTZvVJDpSPNuMhDuW5bun8fECK+BllWDzMcKU06l18EZf+rHVONPSurQQ73NI3GUWmxiaYDCIRotNyl2ZeAmazS8HwJNElEsb3+7Vh6xLzFUGtZlm6OnedSI+oE4w/p2LVsUwPDfTYfgmLE0klJ/S/1nQugKoSUVd/pLgVb3FKcB/gQi3Hrqz8ccy8vz6a/gIgkF4n3s8bz7nMdcHmGhDD0NLk3G0JWJkov+kMXWPN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hb+KkYU0qPhF3Ss8elCd+PzsU/8zBXopRGA4BxQyPo=;
 b=J1bO+1tagW4byrRSDxiIG7r7AdFLkDjafMUhMxOCuyyscq9/mGCkyr+am5EYGHtj8Rn4WhAmCl95opVnwqG0FiBcFSfcMuNvdnVNmQlXgnOLJsphn+MhQRYrD/YK+aROA3ZQwp6f7mqvxSjQtlGfOp2ENe6P84EMwRcTiamD2E5T/UUGKosJQEsalRHJQf8W+LpEQZOMIRgg/4IqIeao/ObZebNQMzQDPTNoJx1rZn3LStlrGaZaVlX+ClHNY4XBq9boM9br6BTGLwqQzHtLTwi4nKB6t6BON8+rH6xlLQebIJIRF9GQ4uH5evfHHIpmOE5xYF2eCp15y8mGUkM7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hb+KkYU0qPhF3Ss8elCd+PzsU/8zBXopRGA4BxQyPo=;
 b=p63EImuAtoa1aU4WG4ArJJQkRJ6esRy6RhDRB/jH1jhOpRqxmycRfnvpbBt2iOv/mDsgiTpP7lm8RIgU3gsmwpyFYzY8VO8yoIydrznz/Cld7Ene2tbjKCN1Ggd3QyDmPvvrefMqcAM+jzJO2BV33lLSNpe/9B+W5gI7SpiETo4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5031.eurprd08.prod.outlook.com (2603:10a6:20b:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 21 May
 2021 15:53:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 15:53:15 +0000
Subject: Re: [PATCH v2 6/7] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-7-eesposit@redhat.com>
 <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
 <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <afe16059-0270-769e-9ce5-3b86803b034e@virtuozzo.com>
Date: Fri, 21 May 2021 18:53:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.197]
X-ClientProxiedBy: PR3P193CA0051.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.197) by
 PR3P193CA0051.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.26 via Frontend Transport; Fri, 21 May 2021 15:53:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33298c03-a2c7-40b1-2352-08d91c708b9b
X-MS-TrafficTypeDiagnostic: AM6PR08MB5031:
X-Microsoft-Antispam-PRVS: <AM6PR08MB503189DAA571A82F6DF4B1BDC1299@AM6PR08MB5031.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqgubHiCjtKBcRgsWp0eRkIaE+Me4gk64aBZDI+H6l4zG5Ih+9N8wR6UPf4lTMwFpTdowicfYcLkYDLklV/ksmC0hTMCKgRz+PRosX0FXZ9J1HE2ddwTNGn3nI79/TRj6BNLPReUNHTxmCyDlqwV1M963Nn8CPj93E7huTSO5k7xefdDwNY995kHKxXXGiRDlmwu3ZVmUa3hEUJ3XuNi73bxfPdFu00QPgeN95lziMNfPKO1hefPSkmG9WUDSGKBcs7dzNMNcjWyBDBtxCQPbU2+KsNiCFndEqZ1OEy9RMgtSyafcdLUt9v/jot4SM1zkCaxc7ExDuVURYuVanxDiF/vGNDSS/KgGR6WPsFI/HZYazysl9QHve6xukE0Q4CJbBoyrOulywd7aWQN2DkzLffj+tuYIhCjBcTZTBalk74W+kAUiSSMqsm+5cjzI9a0fnFhaFYBk9hrJYAjSMOTEoO6ivYEIx26JTA4fZbLKuq5U3tXNLu6GHlFkd1eqLocLM778jglMIlsE8rL2jPDkQnGV1RO+WJnKjdDd3XkPanvvWD8Vx6o3C4WB2QB4V+JS6sxkN/EPXeTehLuL4kpPpVkUySj7BmVzmTbEGnqq/ecOHdXhzMQel0GJlUANG5Rbw+Yh2BAcT9R+mcaAc1CzW9lgfoM8M2CVfpr7Zt7pr23rtXoYtOP//d17/gWa/iBLbm1zotEiMAVEfrFkyjmYjkJjxY/vRLpiLXykk8DriiQOGjMp6KyrBsSgRQcFI65
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(136003)(346002)(39830400003)(36756003)(31696002)(4326008)(16576012)(478600001)(8676002)(186003)(83380400001)(6486002)(54906003)(31686004)(316002)(16526019)(110136005)(2616005)(66946007)(2906002)(86362001)(38350700002)(66476007)(66556008)(26005)(5660300002)(38100700002)(956004)(52116002)(4744005)(53546011)(8936002)(142923001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OHpqNnN4SC9tdDZIdDRPT3EyWGNVNzF1VmRObE1wQkluWWwzTnNlbmJTSGZ6?=
 =?utf-8?B?Rk1aLzFjUXlDcnVUT1NQTTQzL3luZXRqWCtmTzJYU01RSWxDZ2ExcXdZY090?=
 =?utf-8?B?OW4xWjc4dG1jSVRIRFZKZXJwR2k1bmVWbVNWWVdrdjFxQklPSXNTcjRDNFY0?=
 =?utf-8?B?MDBzMWkzY1JTYmlyaGRzRFFqSE5oUVpiMFpKZ3VnYWlHRGZMaDhLRXFETkJV?=
 =?utf-8?B?aFFoMi9Pek9jMklXRjNoS3pCZzB5OUxGRm5jOEQ0QUVKUnN0d2hPOUlhWGpa?=
 =?utf-8?B?cmQ4UHV2VzMzMTdLaU9XQ0hQRVhlenJsbmdnRUlDcmVyYm5RLzF1bXZqdjhB?=
 =?utf-8?B?SHl2NGR5OW5DUWJGdDh0TDd6Q1AydUtaZllEV3luMWp3RUxKMXBtd1BiVXVW?=
 =?utf-8?B?UHUza2RjSUtBSGJPaFhSOEM1RlBkeHVWU1U1ejljMzNCT1czQkdySHlEeFdI?=
 =?utf-8?B?dlEreFpnTGJYeVAwQitOWkROeHdhOGRGeTJkQVZEUXgvc1NFT3d6OThqZTFt?=
 =?utf-8?B?YXJyNmY5RCtWVmVIazY1a090NHJtdVQ4RU1TWFY3N3c3Q3FIc3NtMUJicE0x?=
 =?utf-8?B?OU12Yng1TnJRVE5kTUhaUzVnbW5USFB4OVE3dWV3Tk1RamllVHRpaUw1UDhL?=
 =?utf-8?B?Um9xQXBWOWVYcEtuUHJYbEtkWndtYXVvcnJ2SVFNM1BOeTQ0L2RhR1JtSTBy?=
 =?utf-8?B?L1p4dDIvSlB3cHNYUWk2bDh4ckRlYyt4MExLR2xnbTR3d2hPZy9CdVZtclR4?=
 =?utf-8?B?SnZ6Mk9jbWo0NHRtRldhN0l2ZG1BOVE4RXNOQ255anpQaS9WdmpEWC83OGZQ?=
 =?utf-8?B?QUtKZWVFeWpLSHAxamxONit0ZFJMUEZFbWJHZjNLWXdoRmxFdjhreWlES1A3?=
 =?utf-8?B?Tmd2OWtILzFZRVlBTURpRUEvZWpzUGRJMGo4S0lTcGZNcHBnTUxqRXhjamJL?=
 =?utf-8?B?NUxTVkxvaGFjZ0lxT0VFaW02ZjFCb3pDeHlHUXphKzVwcld0NG9CbkpLYW9x?=
 =?utf-8?B?dlNFRWdZSENXUVhUNkE0cTdVanBkdWtVMmlRajJzQk9iMEo0azZhMHF2UFNL?=
 =?utf-8?B?YTUvc1RJb0pQUXRKRnJ4MFdMY2k3cXBKOE5vZm45U0V2eVRVdS9Jb291RjBY?=
 =?utf-8?B?VzE3K1kvS0thMzZzQ1VNbE13NEFzNUJpajF2UEY2RkdlYis1RWRpOURGcmNU?=
 =?utf-8?B?TjBXb1FFUDIrY2IrN285RjAxUExWOWRUbEd1OG1vOHpFR1p1V2NJeUFLcDJ0?=
 =?utf-8?B?eVJYREQvWDNrU3QremowYWtOWndUZHBGSDdkZ3ZkSVJhZzVFTGh0dzlhMmdP?=
 =?utf-8?B?RHp3a00vZ2c0a3hKOHZQZnB1Tk5qWU9WZSs3bGt3YVhEOTJVM05KN2JSVmNS?=
 =?utf-8?B?YUpCeTBFMThrQ3lTOEI1YVh1RUZxbmRTWEhqc2w3NGo3VVNPK1NuNnNPNnV1?=
 =?utf-8?B?dnNkZjdRNGtnZGYxczB6b1g2cEkxSUVXNm05aEsvd0FZOFhmS2tERy9lYUhk?=
 =?utf-8?B?dmxtM0dMRkNhNWtSR2ZwU0thakF4QVBkbER5SnU4S01uUURGSmh0R3FqcURQ?=
 =?utf-8?B?STRSS2FHK0pNeTdlMVlvVURuNFFLVUoyRHR2cFFTMldac2ZsbmphSGtaU01P?=
 =?utf-8?B?Y2ZScHNYYXVZcGdmSU9uc0c4ZTYxYmJzOVltTStkU1Bjb0g2NG01WEV3dUg0?=
 =?utf-8?B?WGFYRnFEazhGV0JQNEpCaWtVSHJId3N1QTdBN04vYjI4RWdSc1ZkejYvRnFM?=
 =?utf-8?Q?+u28teNhG05Va7kml4zUTytC+lkMdlQTPjQcvg8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33298c03-a2c7-40b1-2352-08d91c708b9b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 15:53:15.5483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncKI6/XsrJ8mPlFicBBNTUD99bj1Ah0cxww/5tAPi4+NtlFG8zWNILVc62pvqr0/j8lddBaYRWECTEnGqOUR/eFba/aeVbPgbW7qlI5OS8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031
Received-SPF: pass client-ip=40.107.7.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

21.05.2021 18:02, Paolo Bonzini wrote:
> On 20/05/21 17:34, Vladimir Sementsov-Ogievskiy wrote:
>>
>>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>>> fields are written by block_copy_dirty_clusters before .finished is true.
>>
>> As I already said, please, can we live with one mutex for now? finished, ret, error_is_read, all these variables are changing rarely. I doubt that performance is improved by these atomic operations. But complexity of the architecture increases exponentially.
> 
> The problem is that these are used outside coroutines.

Hmm. I think, if some bit of block-copy is not in a coroutine yet, it's simple to move it to coroutine

> load-acquire/store-release is the simplest way to handle a "finished" flag really.
> 
> Paolo
> 


-- 
Best regards,
Vladimir

