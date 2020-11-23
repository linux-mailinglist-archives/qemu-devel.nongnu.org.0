Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2AA2C11A5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 18:15:16 +0100 (CET)
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khFQp-0001sp-Dm
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 12:15:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khFPi-0001Lg-Rm; Mon, 23 Nov 2020 12:14:06 -0500
Received: from mail-eopbgr30119.outbound.protection.outlook.com
 ([40.107.3.119]:7742 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khFPf-0005mW-Dv; Mon, 23 Nov 2020 12:14:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUgsRAEBy9VGfLUfbHsS9KBxpTI7jVHRGNEkYH5u9hQ6ofq5F3JIADIfzJUTEVpotJ6E+GedaTx0ABmyT7Djv318KWJdAHbF5soXeOrj7fAKXnyY2tU/esSHfliWHZ+luD0cLBaELW5kJoIRYpTo/DT0dMGCqLCifTBJOLN1NsQy76Pl10umyahyNfhAUy1TBDDi/e47EQWfU+p3khb7YK7MICgH5jRvCc5Utxm56ktGW10hwPLSI0sw4xu8LZuJs15lC7lv9lB1XFhHz0zJvphxifoyvqHvO5D89o2JdwrZzdiPrAEHMFAdhiRYHsngszsT/N1wMRLDqwUjaHyT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/Dz8NQQykbEzP9Z2KDWbpI4vYo6HZFxiHtc/0DvVY=;
 b=bYCpu/scpdFCUeDDOOObnlVKZpCya9VdZ48lS4d7SD7aDTPr/pc8wggBKHPo+qHOSBEJXApNxbDiZxuIk3I+yPHRIIIX75uGhqdXXoQmJkS770ME99m8KXVmXpiVlF8OJjpRG+y1VS0qM75AVXVCD13PhxYVqbEx3Hwuw4TyvsTXWbQ00WwFGhzvdOb+qVDPXhxSYdYz1O0YlGarKVBThBXGoLwvlPcju6EB5kEJFK8EwYdtXxvHIrngY4km1bxIwf9B708x4e5DtxJ6adGf/vE3QrmuLRnsI50dtyVhRActQ7sfhD3ggB3LqzuTJFBEyxCLPK7GpEb/FIq3CfzDQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QS/Dz8NQQykbEzP9Z2KDWbpI4vYo6HZFxiHtc/0DvVY=;
 b=Sa/jX6Qbj9reLVN6Zk1KP5rBLvZYCVM0U2GCooTH94JZzgbV+tB8gdBPIMbcr4oGZsRuWvNy/M/b+cRb3ZrutAxkVk7iVrV8k/5nfmvWiSV8eb/4ItWYnLzvEq3DWig+wludRtiD+dvPWtPmOWzHPsCGhczIRFBUnAiR9rGh5ck=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0801MB1644.eurprd08.prod.outlook.com (2603:10a6:3:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.30; Mon, 23 Nov
 2020 17:13:59 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3589.030; Mon, 23 Nov
 2020 17:13:59 +0000
Subject: Re: [PATCH v2 0/2] Increase amount of data for monitor to read
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <1dc583c5-3728-cc7a-0d8c-7a84440c3cc3@virtuozzo.com>
Date: Mon, 23 Nov 2020 20:13:56 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM0PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:208:122::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Mon, 23 Nov 2020 17:13:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef63f82a-3dfb-40d8-c18b-08d88fd32ac0
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1644:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1644298A31F2BE08D26A712DF4FC0@HE1PR0801MB1644.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PF/gWhENO4WwDtbPpQJFmw/gdmr7oMiB8xXPJuvyCWxxw+vYqtWLDI6dxx9lck81N5k9yBwfiPCq2vqQD1/baxAdlBzbdH8yc8wTsjS9VQJK9orf6Evc2A0xpU2I3VbMf7X9Lw8lCvYU2/Wj9cjDVigFHVOtWdSm6Vo3DXpw+fns3h3lP8UReuOqQRqRWAR/6gZE8Sc2pTPqt6g/FoygYpY0DvDwyhRGgDXFCVJ0jbGZACsOqsx9HOS/P2xQUND5AnzSU06I/dum0iZijecIIiM15oFj2DgbrkQ0FRElBsx5C2XLCZ0o5jSTYmwTqyIgy4yC1gV7mnB8qLCnXX8kB8ZpejjXu2KFiH00WOqfaZDHkripwTxVd49i1KQvCXsfRUQf68WLom1XSkDT7gWY5JKVJEQB401PUafjtxkX3OXqcPUZYoPmqnuOgO93cTCwf+FK1MIJ6vntkHIbMv0Iuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(396003)(39840400004)(316002)(6512007)(5660300002)(44832011)(107886003)(31686004)(6486002)(8676002)(8936002)(16526019)(186003)(26005)(52116002)(966005)(53546011)(6506007)(478600001)(4326008)(6916009)(2906002)(956004)(2616005)(83380400001)(66946007)(86362001)(66476007)(66556008)(36756003)(31696002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: ilE5q/Rg51fUHyBviggE2UD80w1fWO9y/jbtyjCenS3X1M/Hvd1Ni2PlNxEBsybmcw6K3brq/lWA+/hoQOY0HKb/g7t5/fhZB2fPgvB99Kf6jsOtlU7IaFrHEE6WMfD48+T5HiLfNeHIBbGGIyFip9NBAkfNzzP747qisBP+yA5+Xt1hhiogLlSgsnyFPZkf/fsB1+3gA+yqhxIJEziWTsP/2jAdCJJdzS8bZwJMdVUz0/ep6Cays1eLxgnRu19bZrXopkpsCGukk0oZvONZelNWsA8Sw0kMD3MP6z/SdK/L5HEdxi50n79wbhNh+Q17XtvEUoyJiWL+iazS/HWNZp2iQ9WSCVAVMfVvRnz4jXdHMkzftuVEXjDW3rpooYpwCF1dSdFtVTx2eXAoQijf3tEc3LFNShIGYwV2cSmaPDHlesPTE4L58yADeyxwyIgUUdxmawzvxLweJJLVNtKEhL+SX9lFSSlRGnEce9Z4iWqXKXRZ1x9qM/eTAgpML6EE8GnlylLE4EC9cfae4o/3i3IWopQimvOWg8kjip9S7NUvJxAACgCb/PZjLIq1A8o9QElIMuKsWUbqcNC2qgwyv4qngEBOw48uT3o2Yc6IvVEzrspTzKWP2/Ts6RU01Jp1w13Kh68JuXjGWQX1kbj2kowEjFDO1CpuMzZJI9BAJ+faeqXjCR+FFAXvgGItPzBhgA8HBbFDSDCBw27eXSNEzAwbKJqNBl83PiDWIDgYk+wuwd4Vaad4FmXrJIZrryGMMlvyMKHMxorJiSeiQSo29j5QNQ9JudKo7LIkkbu+Ul+YRfxteyPKLSuZEBNTOQHVI+ctRP9ADo6GuhUMaC9bkWnIo5+x9IwOCzv7zqVp8uS2/FB/sfj2djQS6hw9t9GOpsFJlyRvrc7vm204e5hBRw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef63f82a-3dfb-40d8-c18b-08d88fd32ac0
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 17:13:59.2821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyIuOjkcauRmODb8/yMb57jWTjpqJzuLqt2yui1aw8vBjMyxRcJVFowFPxD9WB3o7ktRh2nraKTNSgEGNeL6zwtNfNaag5XKHgmMrjNBa9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1644
Received-SPF: pass client-ip=40.107.3.119;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

On 23.11.2020 18:44, Andrey Shinkevich wrote:
> The subject was discussed here:
> https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg00206.html
> 
> This series is a solution for the issue with QMP monitor buffered input.
> A JSON little parser is introduced to separate QMP commands read from the
> input buffer so that incoming requests do not overwhelm the monitor queue.
> A side effect raised in the test #247 was managed in the first patch.
> It may be considered as a workaround. Any sane fix suggested will be
> appreciated.
> 
> Note:
> This series goes after the Vladimir's one:
> '[PATCH v3 00/25] backup performance: block_status + async"'
> To make the test #129 passed, the following patch should be applied first:
> '[PATCH v3 01/25] iotests: 129 don't check backup "busy"'.
> 
> v2:
>    02: The static JSONthrottle object was made a member of the Chardev structure.
>        The fd_chr_read functions were merged.
>        The monitor thread synchronization was added to protect the input queue
>        from overflow.
> 
> Andrey Shinkevich (2):
>    iotests: add another bash sleep command to 247
>    monitor: increase amount of data for monitor to read
> 
>   chardev/char-fd.c          | 35 +++++++++++++++++++++++++++++++++--
>   chardev/char-socket.c      | 42 +++++++++++++++++++++++++++++++++++++++---
>   chardev/char.c             | 41 +++++++++++++++++++++++++++++++++++++++++
>   include/chardev/char.h     | 15 +++++++++++++++
>   monitor/monitor.c          |  2 +-
>   tests/qemu-iotests/247     |  2 ++
>   tests/qemu-iotests/247.out |  1 +
>   7 files changed, 132 insertions(+), 6 deletions(-)
> 

...and with the extended number of QMP commands

time (echo "{ 'execute': 'qmp_capabilities' }"; for i in {1..10000}; do 
echo "{ 'execute': 'query-block-jobs' } {"execute":"query-status"} { 
'execute': 'query-block-jobs' } {"execute":"query-status"} { 'execute': 
'query-block-jobs' } {"execute":"query-status"} { 'execute': 
'query-block-jobs' } {"execute":"query-status"}"; done; echo "{ 
'execute': 'quit' }" ) | ./build/qemu-system-x86_64 -qmp stdio > /dev/null

on master:
real	0m10.112s
user	0m10.168s
sys	0m4.793s

after the patch applied:
real	0m4.140s
user	0m4.079s
sys	0m0.785s

Andrey

