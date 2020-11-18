Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C042B83F6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:40:03 +0100 (CET)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSN7-0005Lp-Jo
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfSJR-0003jd-Bj; Wed, 18 Nov 2020 13:36:14 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:33181 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfSJK-0004CJ-1S; Wed, 18 Nov 2020 13:36:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLNZHoh0b8jgBtZSISN4gM+kvBQtBdsXkGt+wD9xIpYBVROBnpsx2/Q73GpKIkc9q4xAtI2p3TNuUoFh3M022ydxYT6qNNyBFuQylG45xdeSyL5UUg9NjVRNKA0/iGju+8YUxjxU8ZL/etC0q6TGV1Ll3F7NasQCwj/JcyHltZ7sYiAAyV7UC+TGCXkq/+osgz1GV50v6H0FbpuGWbdnYS8A2Jxcrm42W6Asxuy0mS0attvm1II7QD9dwe9CcDUoS/34txqn9zk0gKymlbgSA93iU+zsb2Bhbw5ksaIU4QAhK8AMam+Yrg9oq/7i3qL+hmMcargA3xwfYW9yWrqa9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYNCtqNPcciYpP5h6xQMpSivW+oedMH9uVpBzn4V+vs=;
 b=Qfp44xRhdl1OMMWByB4X2wkucXkXtzwiup/zNpDF7ZlNdye/jqJT7FXm64mWe3pJM9T7nxlyJdTIsp5TNQOa8CvO9Khb3u+FkNuE4RoLZyl1xARCl0/qXxrGEzDvfPJ0CU4bBaFhxZxtHFQdGGkyEMBv1LRiBVt71LmXUCPf9NrbbAj4Z5WhTWSlxPhy0uOr5dlYI7knQkJCxOqoEj8JfHW2FAa/1ZUvjUZJptJ0bn+VTDWMrz0lWOcVvtX1Z/I9x86u/19tsf2DKotFRDJFGS+9e9H7yqaN5tBzlLqtqRXeuUdgNyT9RICXMDxQS4xk3HF7BM6PeGeu8F4da7IhKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYNCtqNPcciYpP5h6xQMpSivW+oedMH9uVpBzn4V+vs=;
 b=Zsykn3lkSH68WfKuB0j/pw/TIUw3x40YtjTUgIpKiinvWZvDSYvd6JWW+31YIuExhUViuSQDDkHSc3j/oZ+HVDnEUxQBRhjKS+XFnJP+VTNOE63Z2sGrEAdH/uHyFf+lIQc8x+VaRdcW2xybCbiMh3e7Y/VPBA0t+HpOpTG8NAM=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 18:36:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Wed, 18 Nov 2020
 18:36:02 +0000
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, den@openvz.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
 <0954b696-7aa3-b593-2095-10b677a322c1@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <f63b6efd-32d3-df59-eba4-8207ef92c9cf@virtuozzo.com>
Date: Wed, 18 Nov 2020 21:36:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
In-Reply-To: <0954b696-7aa3-b593-2095-10b677a322c1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.112]
X-ClientProxiedBy: AM4PR0101CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.112) by
 AM4PR0101CA0051.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 18:36:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f519fad7-ece8-46b0-1a1d-08d88bf0ccf3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309846E69898DBF3329302EC1E10@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9JIjkshX1vpoKLfmZEFtf/cDIqefNoRyqqoy9mCANkD9S+RV4G4jXk7FkozmMnzh88tAXr3oRiw7aVZk1GtIn589Wge6CSQGO2xyE+j6S9ycgUkXNE+cHmK+vwftSc1uwKlnD8ShAjIaAG8yUew9rB1BMoiynPMl9cJf/EAXiOKVzyIe5wZm2G97NM8jDz3ZC8XDGsyt6FGsvfivYj4cC4PfZT55IOC2RlBz1L3716udPUlcKF9i61hh0aJmfBRbBME+qAxmb7tinM5hJ7IIpwwU0N9e2zsVgv13oruEFH1+Fut4MuBVYq1+91uRMJ59MdAk92pTOAfGvb/LOyduW20Ak7pnjsdOHefDEy7G1czcffYQu8MXFHn8FYHUszc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(376002)(39840400004)(8676002)(478600001)(6486002)(186003)(5660300002)(31686004)(66946007)(16526019)(83380400001)(36756003)(31696002)(66556008)(956004)(16576012)(316002)(2616005)(26005)(86362001)(8936002)(66476007)(4326008)(53546011)(2906002)(52116002)(107886003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: JFlB8DaN5Vk2uB5xLd03QjMGBIucPABpTcljCOK9ejuCYgDRO9wtWynJ5d7tkRXOhSF90j2NvoHP+XRnWh7SXeQhAuEceGb3FQl0p3zhXs6AyHlBMfJVJLjlef+PnOOu54AuzJFANdZow2EuK/M2fKSYBTbDKidQp4jIa2qmODaIAmEChYhkZY5pfDwGeZhVxfFe+Hdzx5pquGgh9HWvvMN9DZHG+HVfzNWqOl0zZjg7BVF7e0mCFV2GjE4dV7D4VJkxeH8B6AXHQzIpHMhajdhQ/Kx7og3n7spDlnITUO6KqkMPaiIdCiB1xBjgspEQBvopOYoG0ir9DsAjBX+RQiTbN3Cf58kGyVvbP8nYmSpwN0ckGhHSqd9BdI56NkyFoYcz8AzObWgVT4yLJ8DxQJQxfDxzp937B0HFfDSorZB6+J63bmOR8QCGi4O/8GJWHT7SoUw2LpTHWw1/scUmHXjvoMVNqjPw6cKUtB/WAXfQKwxDTBrEeTZiKQrWcZ5OWEUD4jUFUhCW4JQz/O6NOnBgvBrIEyjV0c6J4aQLpq4uWuTJ3AMM4nl3OQTRMV3jPHV8r3AHRYrJ7eps3pZwvHjzrO8nA5XhFjGt3dw4kwbuuKlEySuEZntf8tfroQ3W4J7ASSjj1YfZCn2CsnLFsg==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f519fad7-ece8-46b0-1a1d-08d88bf0ccf3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 18:36:02.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YTCbwcJghcMFw+LNHhrHYqIpFG36LaEQo1hpo3VcQIcZPB8PrS41fAKvEp9efahHbi5PDJfnn8xyt64rS/7ceZggZUsbxx+x/ZHHRcXgCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 13:36:03
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

18.11.2020 21:19, Eric Blake wrote:
> On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
>>
>> The problem
>>
>> Assume we have mirror job with nbd target node with enabled reconnect.
>> Connection failed. So, all current requests to nbd node are waiting for
>> nbd driver to reconnect. And they will wait for reconnect-delay time
>> specified in nbd blockdev options. This timeout may be long enough, for
>> example, we in Virtuozzo use 300 seconds by default.
>>
>> So, if at this moment user tries to cancel the job, job will wait for
>> its in-flight requests to finish up to 300 seconds. From the user point
>> of view, cancelling the job takes a long time. Bad.
>>
>> Solution
>>
>> Let's just cancel "waiting for reconnect in in-flight request coroutines"
>> on mirror (and backup) cancel. Welcome the series below.
> 
> Given that we're past -rc2, I think this is enough on the 'new feature'
> side to defer into 6.0 rather than trying to claim as a bug-fix needed
> for 5.2-rc3.

Of course.

> 
> That said, the summary does make it sound like a worthwhile thing to add.
> 


-- 
Best regards,
Vladimir

