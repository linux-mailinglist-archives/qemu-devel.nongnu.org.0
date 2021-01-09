Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730032EFEE9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 11:13:04 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyBF1-0007sx-GV
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 05:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBDc-0006n3-20; Sat, 09 Jan 2021 05:11:36 -0500
Received: from mail-he1eur04on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::702]:43073
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyBDa-0001Pr-Ev; Sat, 09 Jan 2021 05:11:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyrPgaQX2F1fsW5onggtrDnIsBtVFNQ4aa3VaXQx9v6hI9s62czrIzBe9DbIYo9YoB1o4iMUkbKUw7AESubkIGwrJPEs1rOw5+DRMyqsSbR3jP2Q87GP4HVQYTXg97kxi69Rrk36n/W82j2AU4VVLobm9t94QlnwGYEY7aDGPSWhTsAFiiiIEIpUezSYq/GgiceK95HchuQjsQ06S8YZ1aErMj7KD3DFFL/SLd6xI99iwRTF+BdB2B1ZJiK7VOY8Z5CV57/QqIl5aleAIggMIb3CKiOnH0WGn3UFu34a63pNiWR1sKwBikbNvCu0QgCSzi9IkTo1DPWbsSSysg7P9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D15Gh5GYS8QQtFzZ9sWl2qCFX0CuSL0LoYqH+O19kY=;
 b=OtNYtewDq7p8iaETInnQPhBLLTdJ9vjUB/KKQwYltRHq5m3xgDw4r9yZMlYHm5o6W6oxTLkYQpWAciLkZ/IdeXrxLlV3qRO+Qh+6JVusYm1pZnjiJnOF9MyQYRiJ6rR0yb3jJUCFnqOqI/Mqrw0ihT+agC8qwxGiVHzEEUpWp+nLrZHnd1MScCWg2nFArudNUiU/YtgV0cuogCg0k6oO9J0sBTZ4+ijiq+gHpPZdKmGoigSkkg99a5eAFipKiife9OOA+bRxgQkkRM1yvWV6gVLfM7Y8QvFP43iqWpuSxM9/y9pMyrSxwq4DlbIkWQEBYaTZRfY9kNS8tOTNystQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D15Gh5GYS8QQtFzZ9sWl2qCFX0CuSL0LoYqH+O19kY=;
 b=GSDzgau9cWOWZsYAeNIJA5dw5OQXQZWQBwttPCxKNBs0XiWrESUy/KUQZMbPymrqZ/iNgdQavL5BmsduR2RvNeqGha4Rtl7K/J6i6vyGuBxqholfcv6TYEhoplmDzFXCSX/hFh40qeMf+K2mCIqdxW2S/vGK5VjssV6qoXBhj+U=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 10:11:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 10:11:31 +0000
Subject: Re: [PATCH v2 for-6.0 0/8] nbd reconnect on open
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
 <ef7643d2-14bf-f503-89c2-48ebe7bfd020@virtuozzo.com>
Message-ID: <75e4c4ae-cd5e-554c-1f5e-d0eda178b736@virtuozzo.com>
Date: Sat, 9 Jan 2021 13:11:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <ef7643d2-14bf-f503-89c2-48ebe7bfd020@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM9P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM9P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 10:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76432f17-8ce1-4d52-d415-08d8b486ef9a
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6280AE753D14542A03AFCCE0C1AD0@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rj9XoIjByXzKvkG79DwQavZ8k4+u2GK/XwxhY4VeaNH+D6+oVDfffesmG1aC17YYOIsJ7ZuGxJCF8U/tpgGWjEPSEFARuOuAOXdJKWqw4AcI2+5dO4A/vh3K7PCvQonhz+4cqcj9cgoXG69mcfLKxpBSmQkhOqnH5lKWisbW9YWkbF87+sbBFE36I98WCPjBmIcxgaBj1d8hE3jhCqA1meBDt//XkOl5nG38EmBUwAnxLIs7PMZFogNtIh/P4w2xC6sEgiWF0WDxW6E0TxCwbEIGzm6zidFhRwtrZOnSrS/IpQ+cUXv1Fu9nfoSPT22qYkN7o2EpqOl/27hfbLX9K/hZyfK9KXu8SCLG4w1/0ax/1NEogrH/5BfRapfPDS1tM/iyWh9gS8hBhUXn/1nF9nxgcFIFaU+k0mikMVmrWdu4KcEeWMpEg9zGFTR1O09syXilFURS6qS0n2MKITx9pErTV2lnSAnTJK5MgronR3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39840400004)(6486002)(83380400001)(86362001)(16576012)(36756003)(478600001)(316002)(5660300002)(31696002)(31686004)(66556008)(2906002)(66946007)(107886003)(6916009)(8936002)(52116002)(2616005)(66476007)(956004)(8676002)(4326008)(26005)(16526019)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVJRT2lLSkVEc1hFQlRYVFNsRzcvVm9QaFQrcEw4K2Jybi9FdjhBd1NXdE9F?=
 =?utf-8?B?Z2VIOW1jMnBiRWZsZ1ZFaTBlUitoZEthVmpwY1RBdXJuNHQxR1oycFlPTlV5?=
 =?utf-8?B?eE00VEt2eW9jemZzVDJLdjNDOFN6a0swemtsZG9jVzJnc0xZR0pyaGtWU2NK?=
 =?utf-8?B?RjFiYjhaTWNkOTdGVVJETjI0WnBTL205WW1mVWovakxJc1pXbzFWWUI1OEYr?=
 =?utf-8?B?d3dCSWcrajJCK0M3anJpSDJRQ2dSTnR3YVF1YjRMZ09sb3ltcEwwYzlBaDVY?=
 =?utf-8?B?YUdnNkZXRnBTZzh2UDcyK3hKcy93MjVXc0FSMWtCUWNvaHlqUVhYbnRobDFG?=
 =?utf-8?B?UG5KL1pPTzhkVEZpUktyNUFRbVB3bi8vbk9xSGtBdkdrdnBGUHJyQ3lxemgv?=
 =?utf-8?B?VjlNY0xhVTJJeE5XNHpwb1RRdW1ZSUhCWWVoSE5qRUcyalNpaXkzaFNJSnc1?=
 =?utf-8?B?YzlPUWZFbTFtYnJQZC9YMXIrVGwxWWRNUFJYdUJhSTQ4emJ5OFhjK1lmazVH?=
 =?utf-8?B?KzVtOEZvK1F3Nmx5RzZxM3d4VXUyc0h1VHpGVnJudXVjNHN6Y29uMmxUZFBs?=
 =?utf-8?B?Q29uVUJnZllON05OYm9ZZ1pLMUJFOS9OWkg0VE9Ca2h0L3g5RE1EREtVc1h4?=
 =?utf-8?B?b3VpSUIzNWQ5NlhlOC95M0toSjJKS1Z0V3pTMzlKUnduT2ZqcmxPQWE4MFRL?=
 =?utf-8?B?cHRjREhQT2ZPNHFYYUZySGdUL2hrbkpMc25mZ2ZKUUJ3Y0pDU0NFY28wMjhh?=
 =?utf-8?B?TExiUlRGb0FNbVZDZ3k2V0RsQXBtYlBsZDhwbEZ0UXE2c3Q3U2QvZ2FtODVy?=
 =?utf-8?B?SjRVdUF2NWlJYzNTcFAwYTk3clVNRlI0b3JrRDdzdHdPOHZVNDZocUh1TmZj?=
 =?utf-8?B?ZFVNRDZHaHNVV3N2UkFBakVHQlEzbFhISU4wZWpubVo3VWEwU2JUdXFqbU0v?=
 =?utf-8?B?YWp3SFk3NkJONWdWRGtuODk0RHFzM2ZIaGF1MkV5K080N0laTHJNb2pEdWRL?=
 =?utf-8?B?MjNtd3ViL1dZTlAwejlTS0UzTklBVWU2a216VnYyK2NES2dpNGovaW1DdXlC?=
 =?utf-8?B?UWdPVEtjMjdQWmlFbU1NaXpTTmlBUzFNaWpMbkpRV0VPZWpqSDJPRnhrY25a?=
 =?utf-8?B?Z0dXU1dzMHpzdnlpVUVJQ1duL1lheVJkYzg0cGFVTUMveDIvTlh3cmx2VGtU?=
 =?utf-8?B?d2xOeVFEeWpnbE5GYjk2RE5WTGtjVFZBN29Bd2hlbDFXTEpKQ1JnZ3J3TVpN?=
 =?utf-8?B?ZzJpdmI1a0s5R3d5Tkg4NUxrdlVpelFNUjBqa0pzclB3YytONE96eXhuUkR3?=
 =?utf-8?Q?Smlqnwmkep4HeFgefttmW6kL1bqWV4Bs7u?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 10:11:31.0876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 76432f17-8ce1-4d52-d415-08d8b486ef9a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7wpyYLNHddZLM4c50t8l5uxm5fxjCYXNZ8Ojj6x0EyZAWEa+oECsnk87VAh6Ot5YmpbnYT1gYP+0QH4sv4/MKyzT+OGaKU5h8WpYfsB+QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=2a01:111:f400:fe0d::702;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping ping

18.12.2020 13:57, Vladimir Sementsov-Ogievskiy wrote:
> ping :)
> 
> 30.11.2020 16:40, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all! There is a new feature: reconnect on open. It is useful when
>> start of vm and start of nbd server are not simple to sync.
>>
>> v2: rebase on master.
>> Also, I've discovered that I've sent downstream version of test which
>> doesn't work here. So, the test is rewritten (with appropriate
>> improvements of iotests.py)
>>
>> Vladimir Sementsov-Ogievskiy (8):
>>    block/nbd: move initial connect to coroutine
>>    nbd: allow reconnect on open, with corresponding new options
>>    iotests.py: fix qemu_tool_pipe_and_status()
>>    iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status()
>>    iotests.py: add qemu_tool_popen()
>>    iotests.py: add and use qemu_io_wrap_args()
>>    iotests.py: add qemu_io_popen()
>>    iotests: add 306 to test reconnect on nbd open
>>
>>   block/nbd.c                   | 173 +++++++++++++++++++++++++---------
>>   tests/qemu-iotests/306        |  71 ++++++++++++++
>>   tests/qemu-iotests/306.out    |  11 +++
>>   tests/qemu-iotests/group      |   1 +
>>   tests/qemu-iotests/iotests.py |  56 +++++++----
>>   5 files changed, 246 insertions(+), 66 deletions(-)
>>   create mode 100755 tests/qemu-iotests/306
>>   create mode 100644 tests/qemu-iotests/306.out
>>
> 
> 


-- 
Best regards,
Vladimir

