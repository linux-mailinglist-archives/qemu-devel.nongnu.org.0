Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1C62C111B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 17:57:40 +0100 (CET)
Received: from localhost ([::1]:39566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khF9n-0005VD-KS
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 11:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khF7z-0004Wi-Ch; Mon, 23 Nov 2020 11:55:47 -0500
Received: from mail-am6eur05on2093.outbound.protection.outlook.com
 ([40.107.22.93]:7648 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1khF7w-0002HB-FL; Mon, 23 Nov 2020 11:55:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a02le8s66mKzD7ZFVtNATl8pact1crBvt0SxBuLGNvxVwFgo3TmLmoiONNQh25k5zC7ZpDNH+17Dz5NT4ts16H3ojnGGOh2W3ssLghvD8tMqPRPG7LKdcvDJY9YfjQ7PnjSnH6G6wkkrKwyJzO+/qX4tAEcbu0LsugFASGAHxotGnd4iAImYnThvp42ZmoDOE5Xpog041Vubiu94sVbECBzIkUwLi8D7KAZOcCfJOHOA52jHg+Fo8RoiR0lx3kZcTI92E+EK4zd0f7fSps3FLeBymntEV1LhxTdhJZEZ9kcVJAUk/JK9r8qP0pt9GD2GoqpFEd861hjuREHIW99+Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msq2cPLHSwp4JhB28fwtrS5gUHUt7zUKP/pqwds/A9A=;
 b=Vhb3I1ttDVGl6UERuetHkgJPO3UI1iybkq+FTpUHl7hGAypIDXAsD7YdhMVJveILioa0x3ilik7PLiw6dNz1fdARVdKnS6HgFQ+2ff5q6PQ0K1iS6PvBdVWqMHKWTwgdSue8L7+zWeJid2zviYcVAH+dc1Mii3k7BoK6bFIm5qWbazZgf2Vhw+qWeq2ocFMVj2UECjHufhLcVwIUDJVwv+PFm/WDuuz7i8F73KNO8rL+DGilYN51IPeoAN/2xJ+9lrV/jAz63TUnEoqOwFS0Yj4X7TinCHWVnWZn48aiPc7cdqZ0YCjEvOXb5sEW00e19ScfOOtW57qc+V5fOSVudQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msq2cPLHSwp4JhB28fwtrS5gUHUt7zUKP/pqwds/A9A=;
 b=nvd5zpTH9trkzHyRxVBnObB5sFAqyVq9btxLFX35XVFNDP7zTHjSRHt8KwpkyHblAGd9k6PigMWgjOTXD1c1zLyCeaw4/AoSZiKhF4s/i1bam/0ViLjLdKMT3iVS3Ej2g+tSH2LrPGh3VmfRPkguOghzytjN6nvC4C3B3o1BBPo=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0802MB2217.eurprd08.prod.outlook.com (2603:10a6:3:c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 16:55:39 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3589.030; Mon, 23 Nov
 2020 16:55:39 +0000
Subject: Re: [PATCH v2 0/2] Increase amount of data for monitor to read
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com
References: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Message-ID: <c10a3cab-e9ae-ddd2-f719-8a0db77160f8@virtuozzo.com>
Date: Mon, 23 Nov 2020 19:55:36 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <1606146274-246154-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM9P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::7) To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM9P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 16:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06e9f0be-5e53-4501-151f-08d88fd09b10
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2217:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2217D07FF1142A3DE2235E11F4FC0@HE1PR0802MB2217.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oPY9S3Y/nrwcrJL0Wp8OHJCdVU7gnD9W9VU3vwXFLBCUSa7SCGL20wHjqIgosGRd6EdbhliyW4SNEXvAeh9L0Wjwcx25yAaKRs1HYO9DyL0xkz70VpiQ5WGxtiSdu8SARjeGucz4sHj62zfy5y6BaVKApY+g9RkBHXjqfVYhTqUKB6A8WcB8JYYCEFXj4P1lLkaGBZrDV7nVtpRoYbwfenL6CuvAO5L7EZHaxuDFmv1qUf3HNnK7H2WORx1MQD0a1QZkjhYtwddqvdPz98v6O09sc4Cdu/hDhk2/Wpm6lDAygQktQ1vAdthCqKLRdRaiQ7jP7f/XwhEBv57kEQYMRN6zcBlPHc0YbHaNw4x2rVT2/1Xo8uIcwulM0DnfAjsMC2Kq0j/+tiV8IGCtH8B/6+BBhNSJZlFhNjWkvrJCvHROgiwbuhmKnOh4Obwu9jM6xBjZbl+fldetCdYzniRPeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(396003)(346002)(366004)(6916009)(186003)(83380400001)(44832011)(52116002)(16526019)(6512007)(4326008)(26005)(86362001)(956004)(2616005)(6506007)(53546011)(8936002)(107886003)(316002)(966005)(478600001)(66476007)(6486002)(36756003)(31686004)(8676002)(2906002)(5660300002)(31696002)(66946007)(66556008)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: lLuET++W/x9SyDYS+FMGRAA/34D1VSVOEAz8FvSi8lpW/KjUdC4UOvA1OeZHvlPH/vZZ2UPvAUJ4MFo8MqVLOHPLJQAZF171/r21D8IERrti7EaId2u9klB/YcdnE9GR0VvnKT8kbN63kBO7G2UtOqUAwHS4Tik6fjqfJ1Sx6eyoJlLVW2TRBlnpXP0l0ksMywg5Ke622PxiJZfvDZGZZ1y8JKHbetTWuKjdiGQ7kuPNBRI5hZ5c87rwOio/kN8E6c0abKJrLSwkqeag/w+KcwX+We75xt2TCHomn4VkeRB5osviozdihSHzTwJRSD3sB5IUe4SScsxnC+isBos5WHtGdvJTl/a5o2/w2RZyPqYn7xwYzDShHIa2O0Q2rtuP0XzcVSgihJXNFLk/ciPAi0cd18btVp363TQ/5Oa9gwAYe5AYMxPHbTf/0AuyEXzsOxCKVFsBoat/WLK3vS/ddNoTOrtmvmwD4J4F4HSeWkJajkJ1Vbiy1c/AX55fsfHln4ziMGTMugngt2gpUoxIIn2Ldkk1EgGEi+X1iZEQvmxQj5UFuSf8dxKup1KgSJMhMQEZO3d5KydKmwuOxoiMFj99RTNt0cGhd7cMgTxEshT0EnGcF1QAOgtQ38K7tQgO3neznlHfMcYjWVJmn/Jx1w80VkpN5xFA8EfEFYAFiTI1E1Wz1aaqRyssp8dxCaeC+VBg7mhZw5OAC4isUSJy42DlSLddrY4wKgJV9Q3iZfQ7duWL5rdxlARrjrmu8OY1UY1Blruu9QG8mh7fuxHNm3dSgcaeZjwvjPM7p7lUcBEmRY1+2Q65HVD1O6CQbyPs0wLRHMdo08Y33/XfjbKkcBPJHUnV04+CbH1Dw1OZrTYxFgQGaiA41HjOXN6KwuXtYsJrR7Zrq145vttbxUBCrA==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06e9f0be-5e53-4501-151f-08d88fd09b10
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 16:55:39.2966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcVg67/nVTyNT+pjfsbciE52T6Fa5YZt1uvssaziY7HxRZdpfxY8iDij8gU/u+SIBOECIsd/BGgDCWJjZU47xGO+jCUSL2yVPkqWHBIxugI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2217
Received-SPF: pass client-ip=40.107.22.93;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


The Vladimir's modified test case

$ time (echo "{ 'execute': 'qmp_capabilities' }"; for i in {1..10000}; 
do echo "{ 'execute': 'query-block-jobs' } {"execute":"query-status"} { 
'execute': 'query-block-jobs' } {"execute":"query-status"}"; done; echo 
"{ 'execute': 'quit' }" ) | ./build/qemu-system-x86_64 -qmp stdio > 
/dev/null

shows the following performance

on master:
real	0m5.188s
user	0m5.310s
sys	0m2.539s

after the patch applied:
real	0m2.227s
user	0m2.483s
sys	0m0.480s

Andrey

