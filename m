Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD202DE1AC
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:00:05 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDUR-0007wi-0h
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqDST-0005Xe-UP; Fri, 18 Dec 2020 05:58:05 -0500
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:16992 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kqDSN-0001P4-Uf; Fri, 18 Dec 2020 05:58:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzpDzLl1p+dquTbg53fPay0R6pkkh29nayUOSfXQqO4jWHtTuDtyWxixmHVBXQCBpFZyxOWY7YeVe3CzKU2OSvePIX6AAgKCl8IlY++0AC/2GAl2tGeFDQ/UWYRYVNt9QXP6GiBPHR3ZDQAKPNOiHvVCiOEGM5DKN9s6E7iTAxgSXuIv0gH4Z4zRBGN+uhdOk7txpCYo7gjxMbuis85mjQtkPRa9qW2WsbXKWhlfVARcZ1AqnkuyZLTjD/48F2bvq8KYn1/cUhqFx3rOXx4dbyH+O95Anu4hHKxYxD+EvuDa5tIADPzhSzbvGjLRjDiTTJeh9xNJudypa2It57ZhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lH+cSf0UGuSuzVkCXAejuurxoY26iOICH+jY/dj4gs=;
 b=HT8y9EtFliSV1V1tQVN0BpL+As0zDG0pHVpTznbyZdMN37uiD/s5JlCYHcTneHBxz65Bui/+n2jZOpv0Hzr9ImPJ7EFIpO1IF2+wUwHgpcCwHyV7BqfmNocRTEIi1JMH3grVDstQKPU/EViBmhLPau97oPKVi5jCdtLT6kvBNrqptfInGQoKp3APjTYydmWmo7bu5VZS8vqk4sDOUA67bOl7z0BEFns+97hkUg9HPM75V56r52lwgXHvjBp4cEu5Tzba1P9NYi+FyPOrMqMQdP0d7JJHyYdlFPMPH/+Zbcx/owUjCf10XBT+sdIeQK2M69ke5kXngl3LJsZf7hybBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lH+cSf0UGuSuzVkCXAejuurxoY26iOICH+jY/dj4gs=;
 b=soIrGmW4ar2i+ch2hVLtlkokQj5ZQIBq7gKlBtf1tWMdgKk3VRQVElMdoJ/uztzX98DpIe5rAQ4s+Xeo4z1QvDopGqsbtYiyerT8tnQtvZnAMr/vCtTDILRTJkGQ8J207wRJ6uNv3G1U0eblQMbWnDbRm0+qg0ef9lHuUtkVI9M=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1651.eurprd08.prod.outlook.com (2603:10a6:203:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 10:57:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.026; Fri, 18 Dec 2020
 10:57:51 +0000
Subject: Re: [PATCH v2 for-6.0 0/8] nbd reconnect on open
To: qemu-block@nongnu.org
References: <20201130134024.19212-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ef7643d2-14bf-f503-89c2-48ebe7bfd020@virtuozzo.com>
Date: Fri, 18 Dec 2020 13:57:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201130134024.19212-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM0PR06CA0140.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::45) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM0PR06CA0140.eurprd06.prod.outlook.com (2603:10a6:208:ab::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 18 Dec 2020 10:57:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642bf676-16c2-4aee-4e48-08d8a343c383
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1651B52355AC8341BB3F53F5C1C30@AM5PR0801MB1651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SnNStH6KIUBu7HIlTA7a5RsiMip6VCwmnSYv+lJCaZoWdkzkWQFh7+4d+LH7UDJ8ChrmAXjjt+hrYwYZOXqCvzZ6L9B35kRaKaB0ZTunRpExMHLTbV10s9zhSNaAUYoV4ZsCJqtmgvTr4/C0xEDDzW3RnBZg6IzZEJYs2te7ZTtZw5SYRvM2RPx1BcZXRgV8MbK2QaNH9kPOqTHO7k1y82tYkTW8jxrEs8JTEaR96DQ/k3ZhKeQ4SHPN3VHO74W4Euo20pYDmuTIKXRUHO4pWGPAUHMiSf/lQzPPRxjzIB+Xl3tNsqc6CIExQcbIBoZ7bbXXpxD2eMxXCNQHwFToDOFBQIDtn2M6ZWxIazVcC+qtouSkN99STFRxNYNACnE3TAJJs5g4tQ6b4nLcyZ2jqKDFyHBZuLH5fuRRBRAHknM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39840400004)(6486002)(66556008)(956004)(36756003)(8936002)(2616005)(31696002)(4326008)(2906002)(86362001)(16526019)(31686004)(6916009)(5660300002)(66946007)(52116002)(186003)(316002)(107886003)(16576012)(66476007)(478600001)(8676002)(26005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QW9CdE5HM0pUdVFNWTRNSGJnSGFjdWhxcDBRTUdIYUhGK2RMNEphVVFtRUF3?=
 =?utf-8?B?bGZ6VzdzMXJPYjhpMTFJRnpjVjcyNzZyYmQrcWtaTmh6Z216eXl5cXI2Rkxl?=
 =?utf-8?B?NFN2THB1b1RzM05LckJuR0d4QmJ6aDVEL1JhSzZ2VmVNM0c0Wmt6NGFxeDNF?=
 =?utf-8?B?UTN0RGN2QWtDOGh3Y1VTcHJWZnhZVElJaHEwdFVuZjAva0NEdDVPREtwYjJ1?=
 =?utf-8?B?T3QxRUZFM1NWN3BaY3cxZGdma2dqbDdqZDlERHp3ZW9KbERTSkQwbTdJNlpH?=
 =?utf-8?B?b0wyQk12eExMOE02aW9TTUZWc3BFM1B6WDgwb1JIVTNRWWFERzNJYkRoSnNv?=
 =?utf-8?B?UG80NTVGSWZnMzlNbkh5Q3NsMzhGa0Z5MGFOMURod3F2L1kvK0FwTDFFbHcr?=
 =?utf-8?B?eUo1V1MyY3Y1Rjg5NWRrSU05SkV6YzlLUGZiK1Q0T3ppMEhHS1VTNVFpYzli?=
 =?utf-8?B?eXU2RHdIdlRUYnJxQ3ZZNDgvekt4SHA1cE5pRnNnTW5lSXh2SSs0bVZLZlli?=
 =?utf-8?B?bUhxcWhYbk1vNytGMmJJTE4rRm5jZ0tEdUgwTUJ1WmVOd1RzSWxjODB1VFdp?=
 =?utf-8?B?K1F1U0RkdXZ3OElEQ3FQcHNpVDhYOGFZVmhKZGc3Z3lBdzJYY1V2RElnVU91?=
 =?utf-8?B?U0FodDRHTWordWc0d2VpOE1URkl3TFZVcnV5cFN4b29MSEhCWE9mOCswMEdY?=
 =?utf-8?B?L0dLUUduemVhd2xoc04zV1JmblZ4S3cwcUNSVmpQY1VEUUUzUElrQkkySHZo?=
 =?utf-8?B?UllINXZyMTIzTUhuL0dDTGtDUlQxVXJwL0JnQndvdVFqTkhDOVpscXd5MnNX?=
 =?utf-8?B?T0ZrblVKZmFHNnpQSTRjd0p0bmk4bEVrWWNVTjJYeGNsR082Q1ArQWRnanNS?=
 =?utf-8?B?TUtCZVBEdWpLdWw3d1psay9VSW9tS1NuNkg1S04yaVFyNWdWc0diT0ZSQ2F6?=
 =?utf-8?B?eVFRNW9KNkR6MWFtUmNXZXJuRW1BTFU2ODRIOXlKMkRVSFk5eVBEWkI0cFRS?=
 =?utf-8?B?eHFxNG9VSm56NHBPRUF1V2N0WWwwUlcxajhhWHBuWTEySEdkYnVsSXd3UzRq?=
 =?utf-8?B?ZTdVdHpiQkVibERVRy8walc0S000Wkp2VEk0M25ucHF4NVN4M2RGZlZrY0Ir?=
 =?utf-8?B?SE9nc29uT2MwVkRGTlRxWXpDaU1wdHpVQkFibzRWYk8rVEJuSHdSdlJVa3Z0?=
 =?utf-8?B?TUg3L2lpRDcrMmdzc3VXMGF3NVYwSEpJcHJTTk15YmlJQm00ZURuRFNWNG5x?=
 =?utf-8?B?NkNydTBEcjFtQUx1WWFCQ0lWbkdBUnNrTVU1dGRlNUI5cldmYWlFUWRuMjlk?=
 =?utf-8?Q?aFX95PkFPYUO6K+/vIJZH6jJkCYdXp7bWQ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:57:50.9760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 642bf676-16c2-4aee-4e48-08d8a343c383
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 578ozN+5nMTrFrvVW4b5A2ybwEiQXYpC22I4oyEnwVptD3muC9CbT8qjaLmPQdmRb161cmu7FRi2ypjb7+sX7xHzIJGggv1OyvgDMaxieTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1651
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_SPF_HELO=1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

ping :)

30.11.2020 16:40, Vladimir Sementsov-Ogievskiy wrote:
> Hi all! There is a new feature: reconnect on open. It is useful when
> start of vm and start of nbd server are not simple to sync.
> 
> v2: rebase on master.
> Also, I've discovered that I've sent downstream version of test which
> doesn't work here. So, the test is rewritten (with appropriate
> improvements of iotests.py)
> 
> Vladimir Sementsov-Ogievskiy (8):
>    block/nbd: move initial connect to coroutine
>    nbd: allow reconnect on open, with corresponding new options
>    iotests.py: fix qemu_tool_pipe_and_status()
>    iotests.py: qemu_io(): reuse qemu_tool_pipe_and_status()
>    iotests.py: add qemu_tool_popen()
>    iotests.py: add and use qemu_io_wrap_args()
>    iotests.py: add qemu_io_popen()
>    iotests: add 306 to test reconnect on nbd open
> 
>   block/nbd.c                   | 173 +++++++++++++++++++++++++---------
>   tests/qemu-iotests/306        |  71 ++++++++++++++
>   tests/qemu-iotests/306.out    |  11 +++
>   tests/qemu-iotests/group      |   1 +
>   tests/qemu-iotests/iotests.py |  56 +++++++----
>   5 files changed, 246 insertions(+), 66 deletions(-)
>   create mode 100755 tests/qemu-iotests/306
>   create mode 100644 tests/qemu-iotests/306.out
> 


-- 
Best regards,
Vladimir

