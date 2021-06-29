Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E623B6FFB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 11:16:31 +0200 (CEST)
Received: from localhost ([::1]:56176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly9r3-00021L-Tv
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 05:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly9pX-0001DZ-LP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:14:56 -0400
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com
 ([40.107.21.104]:64608 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ly9pV-00022h-6c
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 05:14:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMvSKYRh5x0PXr3tApz79sFFU07xjR7rjJ+ezXyFL7XWeJWD6NhalEhHfwgTSkpsIMnHVOGzxDbqmQCd2SViskHa64JBfrnP7aqJZ3/FC0f8pW7cloXOt3q5FlrOptL9m/sSiuofEGpmAzj1/y40yuxW2iRpUn/KvsAOAhZa4MieEEW6cdtG9WFJ0Ox6hZGJ8iZ8FDLwCd/c1FxWbv7ilMH2HymNQdrI25WnPJ8JCUNM4XdYDTxQBt2wbRKnbFpIFbwaaBv3iPnFnr4WCTsclWqrIALonwLnrusdTaXzDmy9Ed+avNR3tnMfdNkwvawAanlUBeHCKDVa+ccgFY6TLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/cwFJwgAZEUWZ8ucvlQnhQCBWAaPLbJKbCmoQX4lhI=;
 b=YUaSDN4HUIdY/xA9Qp5WPU0fgwZNlDyurFJ4ExKt+Ju1tKPlW0QjOI3ZeWsRuk6guZuHywnW6ixhh53/iSi5E3WkS+yjf/3w2//o64aKwdrkztcPteFdGcMDjXlamdDOhXOB0covook9hW98V5BV+UoVWkHfKZabQ/3RPmOj58zBjsxV4yqEsyiShwSh1asrpC07sYJaYK7bM5hcPRVXzCoby8Isau2FCOfeGkUvNZS+JAdYg3ShGdODcaAJpQuakkwNlB2rtqdoSEWa9oM3dX5dfRJU3PYr3IpelPftCerVJ/RpXHOrWh6TqPnaQowX5YVX3Kfown19B8ox/NLD2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/cwFJwgAZEUWZ8ucvlQnhQCBWAaPLbJKbCmoQX4lhI=;
 b=rA+ZdIqLv3rhrJO4R5oQlbbh76cwlSWHjermTRwsH9z6huburf2gm+qN5IVjlWVBKTmb1wXsR++yV4DD/AgwAQroecYJTeMMtSJ9iJnvrZ5fKmHI2PUkzJJoPurqKx5RLwQVHAhP1eP4fcRG2hqAM4RvLG9fQWCgahZ/TGfrpOQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6945.eurprd08.prod.outlook.com (2603:10a6:20b:344::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 09:14:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 09:14:48 +0000
Subject: Re: [PATCH 0/2] monitor: Shutdown fixes
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com
References: <20210212172028.288825-1-kwolf@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <5249a722-453c-1bf7-fa0e-4210405546d6@virtuozzo.com>
Date: Tue, 29 Jun 2021 12:14:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210212172028.288825-1-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 09:14:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 757cb005-dc7c-47a7-d878-08d93ade5830
X-MS-TrafficTypeDiagnostic: AS8PR08MB6945:
X-Microsoft-Antispam-PRVS: <AS8PR08MB69450A435DBCCE467ACE8FF6C1029@AS8PR08MB6945.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M+iI3E/qBoFoOF3ZT5C05SY4HJKOx63Uwi6TTcaNRhYv+TE3Y5qOH33nBh6tBFRMbiA3rcav887pb1WDQNPtnqz0tQiq0HiyjYmfSzOwAFDoBIuGsR6L7ywG7fyqkktuE7Nl5+lT2N8sIlXdDUP9QfV03Sebw1RypWxK1r1omr9LLfax5FF8XUFTHCwssfM9pj4fGD2emCtGZvr+jDsHFB6SqAeOFZ0V9HjRPjXowxvxcZ9ZyuR2VQCjBhaSBkqN36uaWwaBgJTVfUPgSJuopjwgwx4ogvF+wH7JARkaSz8AnMgl6uPOT0nvzjcM5r/Asl7IgcyatCdwNtqGUVN+TPm2yd3Ky50QMsMKKIlzwBHQnt4vLl364IPmF0/AL0uYRCLFL9XAznjLJ7XfqWaqW695l1RC7WBiKNk0y0zf1rAzl8ZS3BaB66R4mnWyJYmkAG6Rva5bI7t0kjq+T23+hW4q+E9ZBFv564vfukf+hy466yPIZn3aqQV7PSqOi9mdVgs+4W1mKA9m4wmA/7xK/V9rw37mhVUEHQhfwCy1A8yYvo/e5BtjUBMMfZI3sQuZEhdgkCpZw+RK+6QAW35PVgdaCPPoqBRgD0sgmRgGBkxu1bh9Gu43RdeUArP1Y72UWOjrfa71amosDOvadFyjPHbfOEwclrGCpWGTo5XmJUpMT1WYFSUJies5H9flM7nfDT/tyowaqlvWPuQ8pUF5xlr15PQyAEPMDvNT1KwQNor3I3v3mo4sN3svwstMxXB5/4Fu1ndEv+EpfQzhasDqqHJBlTBVHQ6Zm85Y39YzkngZtnfn3IgELXV+wrc7cdziczXNTZ4eFUbv4B75JlIZrlApZGJhffnNPXm6DiFNn1up12DiPuaCM1gnZJ+jU1sqNaDyTDvClO+VOVXd2RSWwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(366004)(136003)(39840400004)(186003)(38350700002)(38100700002)(4326008)(16576012)(316002)(31696002)(86362001)(2906002)(36756003)(16526019)(31686004)(52116002)(6486002)(83380400001)(26005)(956004)(66946007)(5660300002)(478600001)(966005)(8936002)(66556008)(8676002)(2616005)(4744005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJjZU1DalNHZlRrNllmeEYvWHlIRmhhYlh3MU5iUTJHKytIekRJMVJCQ3Bq?=
 =?utf-8?B?VEZhTitIbVNqWWhQaGt0YUxZVXUxK3U4QnVMcU1zNldDelJWdUN0L1pFM0t6?=
 =?utf-8?B?MytpdW1ueUgrV2lmZTRLekRWSjNtUmh4ckFveWhOc3dvbndYVlVCcngvRzlS?=
 =?utf-8?B?bzJ0dmVVTmFHUDNwdWZ3RzVkNGNpRGNOSDVwaldUdjFTWE1Hb0pPV3ZyVFkz?=
 =?utf-8?B?bVkraXFjWDd0b2xaTU1aZE1tSG5NSTJ5QkNyaGwzWm15N04rQXM0QzFXOGtp?=
 =?utf-8?B?VlpqdkF6MG4zbmhVa2dXaHh1ZFlYQmxzRGdyMUtWOFdFZnNVazdQcWM2bmND?=
 =?utf-8?B?N3U3Q2l5OWhiTzdVQWtualROUndXVldrSVE4ZTd0Z0Q5MllER1BoYWU4bWhQ?=
 =?utf-8?B?cTAzZUxML1RUT1ZuWW5Qc2YzVnU3WjV0L29sMTBWMzJHUEtvblNrSkpEb3lQ?=
 =?utf-8?B?SlAyMXpYWmY3TWh6Y2RjUGlpcW0zT2c2R1hueVZxcXV6Vkl3am9MQUduK2ds?=
 =?utf-8?B?Vk5DZCtTOGw3amxwa0xOQUZwOVl2bDhTcDFiZ2pKZE5uTk9YSnB5eEgzQVM0?=
 =?utf-8?B?cFY3ekJSandndlpuT2ttd1lBM08yRjVNdXEycGdxa2d0V2oxWWFpV2k1YU9G?=
 =?utf-8?B?ZkIrUmg0RXBNMldnSWx4b25zYS95RTA4S2loOC85b0g3bENvV25sWG8xZkh0?=
 =?utf-8?B?bGFoTmhqTU1yd2lqMlFpcGlQdlhvam5obmJzTmNyQkNqVWwyZXhLOGZnY2dR?=
 =?utf-8?B?cERWSC93WHhMMXRJWTNlQXNJVThWMHF5L3IwSThOU2hZaG16THVmOHZHSFJJ?=
 =?utf-8?B?aEFPSE1UbTdhcktTeVl6ZWlTelBDT0VNejVweWo3dFZTVldKUFZZUXhMT1hE?=
 =?utf-8?B?alo3ZHlKZzVhang4ZXFWY05wbUN6ZldQelc3VWk3Nks3aysvMDJSdDZTNGVZ?=
 =?utf-8?B?dHh4L2FNWWlQNUtZU0cyTFJxN091Q1hyY0RPR2xpMmx2Q3RVTlNLRjhJUXhl?=
 =?utf-8?B?dmVrbzlPNkh2aVpjQ2UvN2MxeGRQWDV2MUxHNEx5c1l4anJkN2pOaVF0V2hn?=
 =?utf-8?B?V1Y2SUlqV05hNU1qYmgvTll2R0hLbkJMbld0cC94ZUlSRFZnTTllb0JFNm53?=
 =?utf-8?B?Q0xKR3pseTVvWG5nT2xENjRNR3RyV0ZEVjlrWW5HYzB0NWFjQ2twYVZlTWVt?=
 =?utf-8?B?RGhNUEI3V041MkcwcnBsRUgyRE1kaXo0VWVIdEFYaXFzWTNUUTNlWHNDTmdh?=
 =?utf-8?B?YkZhNGxoQ1BCSlJzbGY3QWIyaGNTcHJSNHQvYm4vOUFYNW82VTZBVmxqT1lM?=
 =?utf-8?B?TndYQ0pEbGx6bmxkUk15eDFZSXN0cGowOHFvYlkwRVNhSjdWYXVUOVd2SlA5?=
 =?utf-8?B?WThVVnpjSGVmRFlqTWJFWVpNb0lWTmpXbjF1ejd0SW43SEtQNVEwa3pxcklk?=
 =?utf-8?B?b0o3NEJCM0hQY1oycGFmQ1VxMzFWUFVZTWtIR2ZHSG1qS3Z5YXNhbERLRGw3?=
 =?utf-8?B?cFFnZksxTW5yRzVzOE81bTgxUS9jTWJST2RVb2daeHVTai9lSGNSc2drMVVT?=
 =?utf-8?B?UDFENDdyQmxwTE1MTEN3Z2pJeGNzYWliM2xaTDZUMit5MHRKang5a2hPaGF0?=
 =?utf-8?B?MVlLQU1veTlJYUlCR1h3R0FHTDJ3dzNQVjhMcG9CS2JtdUMzYzNFZldqVkNG?=
 =?utf-8?B?bnJteWxVN3RnTkZMVWloSXJHdjBRam5CTVVyckpXZ0pwQmhCNXNRaHhyT1Q4?=
 =?utf-8?Q?SrVXp0Pf1AJP9cyZ/HhKeXMydWPQ88iWirQL2j5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757cb005-dc7c-47a7-d878-08d93ade5830
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 09:14:48.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDLBmUvMdr7y3B4gHHBHbVcoVM3Pf6Btsx3QH4/gUBC3Xgsb+BaUkfN8JoUDgHHMCIOpk7Ve2r1OO/0GAt9v1urDsSN5jMNm2v6lkYIX5T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6945
Received-SPF: pass client-ip=40.107.21.104;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

12.02.2021 20:20, Kevin Wolf wrote:
> This fixes the bug(s) that Markus reported here:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07719.html
> 
> Kevin Wolf (2):
>    monitor: Fix assertion failure on shutdown
>    monitor/qmp: Stop processing requests when shutdown is requested
> 
>   monitor/monitor.c | 25 +++++++++++++++----------
>   monitor/qmp.c     |  5 +++++
>   2 files changed, 20 insertions(+), 10 deletions(-)
> 


Hi!

Now we faced this bug after rebasing Virtuozzo qemu package onto qemu-kvm-5.2.0-16.module+el8.4.0+10806+b7d97207.src.rpm

So, I'm backporting these patches.

This probably should go to stable and/or to further Rhel packages.

-- 
Best regards,
Vladimir

