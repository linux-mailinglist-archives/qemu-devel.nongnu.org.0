Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D76B84D2FDE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 14:24:21 +0100 (CET)
Received: from localhost ([::1]:33138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwIe-0003iy-GC
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 08:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nRwFe-0002gs-Vi; Wed, 09 Mar 2022 08:21:15 -0500
Received: from [2a01:111:f400:7e1b::70b] (port=12768
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nRwFZ-0003En-Fu; Wed, 09 Mar 2022 08:21:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ao9ZMwE0iG64RmOpbJoImPhxpXN5E6AVhu+hEyIbtGBMfryYqM84jzg7FVhFcGF5yPgArAGv1TQj2NuHatqQaYtStQKrSKfuu1EYPA9GfTN+urZl4ZRAMv2E2A/vlyHVYrA+SIutpYAI4u4ZoG9uSzNKs+yZJof0BBK6ZZS4SNTFa9nzcgWBrs+VrSEw14owapH6ovZnL7nOpmJHCrbNRNlc4BV3AaYrbf5yrOuzSzBO4sQFZX8RXWL5IiVWsEuMR8/JAbg2+nkphytr+vmZo5pkq0/o0P7//ClBT/HEeukWc9lnMkfduKiHErtG8c31K7bnCNpvFgUpqbYroAbgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGj+t6Hgrm5slj2TyrQmbYlpuAFj1qSyRmU0TkBtt2o=;
 b=aH5UsKcz6lbYcO7yBxczhP6u4qcJtg/Asn8CiKRsPtnq40wSkDY/FHm5dD+PR07qc7QTLYaA9egY0KXogsQUw7/2mh4olLQ9Bq3DG2p+RQzaLzoROZHXE/5DhoIxj88iu8XOKyLHIC8aLh+C5Znnytm7Ijb/apaqrwZlh4I75xFpgw2wlPHwT+Mgw+6Ce6ar2J+VqyHU6x8P8f64L08kuudqd33VYOEN4SOkvQuj+ewjx9OVrKLx/45Cq6ITMHMF7+vrSJ2LakTL594vHwoChL/zrHObSM9xjPgbeBHmIyRe3lXChIOS5fZu7U/y/7oy6BI1wGfAQkOrG4yzP9+Xvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGj+t6Hgrm5slj2TyrQmbYlpuAFj1qSyRmU0TkBtt2o=;
 b=Zh+qv8pOdCPC8VlDMUKMGcYDg9egWminmQeKcszlVDAvM7dbXdXi5NH1FbqMDA3aAAIBEo32RxZEItynd8qKXaCXQHFcaokYoxFxFEbtNPVgrNAPxu3hrP1cBoJH7AjyTNiKxE03DDPoIN++4jJ/KvEPR8zEbsDhgtB15D5eefA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB2944.eurprd08.prod.outlook.com (2603:10a6:802:22::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 13:21:04 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 13:21:04 +0000
Message-ID: <b903228e-c412-a92a-2b3b-e171cfc5755f@virtuozzo.com>
Date: Wed, 9 Mar 2022 16:21:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] block/nbd.c: Fixed IO request coroutine not being
 wakeup when kill NBD server
Content-Language: en-US
To: Rao Lei <lei.rao@intel.com>, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, chen.zhang@intel.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20220309074844.275450-1-lei.rao@intel.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220309074844.275450-1-lei.rao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c87a51d-fea9-4a6f-3a73-08da01cfa968
X-MS-TrafficTypeDiagnostic: VI1PR08MB2944:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB29443E6A0235367D6F472735C10A9@VI1PR08MB2944.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8aqQTevzvO1E88phojRKksUymYMOEbXPD49vzqlKPs3JjMqlztIML5yFUfW8xp8sjRU8DdBW8SDAF6obNTuJvggxxLGnrqMpHwGBu1HBlbuQIh4CaMgvc+w/36I3ZtCq5nK1xfq7EVlwZSB+pwZNCL5l8/qWrh5q/bI2/AwsphR2uJgzShDP4T419uNu/z+GI4bu4JsA/vW6TnWOIfvN0SyPFnomC8D+V/japaaZbNTF4z+FXs+b0Vkd4tbobIhT5fgD8b7KDQvtL0SX5NrtAG1MbD7tQxA7zhQR1MlM2Cuimbm9A/ZDJ/SydR28A4PZaqFkiMmFdT+PwKC4rWELotYvcXPheZMNpvHNeFLWUiOwah5ghNIH36hw2AWjaHYGur1FTS9RUDzJoCMYqyETeK85GLYDyuDWk4piQPheo7u+Hl0ED11dMrzdlmUiQaaI7MIEkFWKeFo+fj8iIaQS+9RA+FTB+UJqFp6e2NqZuGQRF6y8Wf+D5FEyWeDviPM0SyNGNSonLQNZClaJxSQBnDn4r3KW/cZAOQoKe/P7gVfB/CMhK/m3ez2PKKEiIExipliBTdFbUjE4DERC83nB5HUq5ZDB5SwoKDHLWtfj5yRW0j+4m/H61tAlQiYC2m2CajBkS68VnUyULtk64Laq6gvzzFTrUUL1RlyL15fOzqLfGXynNW/8NI4ZIS8FtTk/JemcvpKKZOzAuqLw9eSqtkCU//QIV68bF3mwIquaGlEhMm6qIdpNIt16OnBpnnmoa67ZEuJZlW8TSQslwtt7ag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(26005)(186003)(2906002)(31696002)(2616005)(52116002)(8676002)(4326008)(66946007)(38350700002)(38100700002)(66476007)(66556008)(36756003)(6506007)(6512007)(31686004)(6486002)(316002)(83380400001)(6666004)(508600001)(8936002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnZDeksrWk1xa2NRTTdBL2REcXArSm1RVS9FZk1mTzgzMDJqTUs1M0pTUGFk?=
 =?utf-8?B?MjExZnYxOUs3d042Y0JOV3hGYU5QaEUzYkp0cVhBRU05YTdhamU1OEdOMzdZ?=
 =?utf-8?B?dGtrQm9DSDlUVGt6NDcveFlGNXFyS3VhRGRIU1kyaDdnVTNiSXpxNXNIMVlw?=
 =?utf-8?B?QUlpaGhKcUN0bzQ5eUQvSU1Ld0tqOVFjVHRudUJwY0xWZlJBUW5iV2E4Rmx3?=
 =?utf-8?B?bHR5eE5vVmZOdldiTTNJL2JCemdqL1QxYlhKU1dhTklxV3dseDVxVlZFL2dZ?=
 =?utf-8?B?YWFGR3FRc3g1TnpmTzlmdWp2cUYxRmczdW1vREdKbWtrVWxVVXV0RFZSeHha?=
 =?utf-8?B?WU9KM1ZOVkNCMUU2c1lFdHd4SjFEREhFT3VxVndETnVTQjd2Y0pLWVRjeUtp?=
 =?utf-8?B?aFVJa1FreXpMcjE2SkRxN0N4YnpzdDZZemtEWkpWRndDQ2VjWlg4RGtocTNT?=
 =?utf-8?B?TS9hakl5Rmd2aXJzeDZRTTEyNlZEYytpbWsyMmZpVlhHcHRtaTlRVWhCSkJW?=
 =?utf-8?B?RFFyTFhYOVgzTGFUejRHYkd1Vk1MV01CaG1OR1hJOURHczA2T2RHUFcxVlpo?=
 =?utf-8?B?eFNCRTR6dWh6SFdKUDd0U3FLZ20xZXJJMU9zYVJCQmw0MkJUYWk3VVBmSFR4?=
 =?utf-8?B?RFo3czZFUzVDQkxGOTZHUWdJeVpIVkxGTVhmNHgxNEx6UjNuNk0zSU1ZLzZk?=
 =?utf-8?B?alRMRnNRTmVKemIxRFowWnJKWWxYMGptTVMyeEwxN3FibGtTSzZ0OUxQaWJU?=
 =?utf-8?B?ZEJPdG1rTkJ6UktwZml1SEJSeUl3bG1hWGhXMkxCZTJoL0dkcENwNk9BWTBj?=
 =?utf-8?B?VXN0TzEwVXZ0NmJDL29VTE9VclpjOHQ1bHVLQy9kRkhFTEtyK090RmRIeFZB?=
 =?utf-8?B?THVtYU91NDdTY25maXlZNGhKQTNUOG05VXNtaUM4NTBPTHNMaXFDS1NpNWxC?=
 =?utf-8?B?dHlEM2ZsSTVVaHZSUnErMk9OaDBNV0dyTmx4aGxIYUVwdmkxS1RLMzFtZjFl?=
 =?utf-8?B?bG1mR3F4ako4cUo1STlhK1lUVkFJa1ZraXZpa0ErR1VGSHJPVDdiblorYmdq?=
 =?utf-8?B?cUV5M3Y4S3JYQ1c3RXZueDJSdzgxVGpYT2VSaHM2czR1YzF2cmRyTkYxZUhQ?=
 =?utf-8?B?VWNBeURBSXFjelpiVE95RkV6TVhqKzFacDQ0NEV5ZUp0aFQ2blRXelc5Y2lr?=
 =?utf-8?B?bUVTTG9zemxmbmc5ZUFremF5bElnYUFZV0RiL2JObmNWaG8xbWdycmlwck5o?=
 =?utf-8?B?elNjL1JkVEF2c1I1Y3llZXdDbFlMZzcrakJBalBwSGhpWGZ3NXliWE1uNWxQ?=
 =?utf-8?B?bTlBQktPRFJKSDNVSVNDelF2MjlaY2xTRmJuWUN3RlBPZFVZcENIeWJ1UTBW?=
 =?utf-8?B?bGpEV2l2T2FvQktpZUxtemdCY3g5UUpmTEk3VVRTdDB2a28yUmJWV2tvOWMx?=
 =?utf-8?B?VFh5WjBCTDRZVjF6eGpMR0k0V2Q2bjF1WDVWTTIrYjFnUGx0dExiTEF5UU9q?=
 =?utf-8?B?RVBNdjFKOU1RM2lYdEJyVm9wOU05SGtkWnlyb2tOaWs2UU1nZXJBbjN2dGti?=
 =?utf-8?B?MGkva2ErRGE5MFc2S0lraENwY3JVZ3dqa2l5cjJIYnVvdVhHbGE3QUUwcEtK?=
 =?utf-8?B?NnkveFpEeUtvNkZRRDVZZHpUUHFhNlhGcFBEa25ETC9qTzlvaC8zWFJjR0Iy?=
 =?utf-8?B?Ukx1czR6Q25MU3VXNUJMZFArY2RjU2t2RzdnTVJMNXNjeGVVME1ZQ2ZYVER1?=
 =?utf-8?B?N29Qb0tuRHFKZTYxUGt4c0orazcwcENZWEtiMi9tWEtNU3Y5cDV1a05MdXNW?=
 =?utf-8?B?SXlYQjY3QkEyNmF0RTdFcW9mK0ZrS3hjaFQ5dVpSRWRzelFwcHdFTWtCMS9D?=
 =?utf-8?B?eUhEOEh2THNobzlYRzhJb0dsN2ErVUNYWkNDL0xMbGNOdDk2YStRb2wzbXh4?=
 =?utf-8?B?VUVpWStiVFZ2OWx6L1ZGM2hDL3lkTUxMTzZYdTZBQ1VVeXRCaW9MbWJFWCtP?=
 =?utf-8?B?bHlwc05YUFMzbXpYTGsyZ1lWTkFxUWROV082alFrSTFabFFjdUM1Mm0vTUNy?=
 =?utf-8?B?ak9GRWdNM3FVbGtNYTJaV1NSWlIreVBDSk10cXJpWCs2bzJMaml4WTBsMDZJ?=
 =?utf-8?B?Z0o0Zlppd0NJdmJTVitValYrQzNmNXpOa3h6eXkvdGpMQ04zODIrMGFGSUxI?=
 =?utf-8?B?RUY0YmloRG1qcnpJTmR0dnhoSW1KU0RmeUlUc2k0c0w2SU9SUFdJWW15Vmox?=
 =?utf-8?B?Qm4xbElVWVdEQlVSeEt1QXg1SENBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c87a51d-fea9-4a6f-3a73-08da01cfa968
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 13:21:04.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYpJMC5jNyuqeqf3RepWRql9zCxyfHoeXu1n4/5eMeYPIq+ta53+Jt2p3cNPsf2GT+dIKD0QELiXCuob+rMu7NwEzhApxXlGcC35wWYbk10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2944
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::70b
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::70b;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

09.03.2022 10:48, Rao Lei wrote:
> During the IO stress test, the IO request coroutine has a probability that is
> can't be awakened when the NBD server is killed.
> 
> The GDB stack is as follows:
> (gdb) bt
> 0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
> 1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
> 2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
> 3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
> 4  0x000055575c16eabd in bdrv_do_drained_begin(bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true)at ../block/io.c:474
> 5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
> 6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
> 7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
> 8  0x000055575c12da28 in qmp_x_blockdev_change(parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, no   de=0x0, errp=0x7ffd9dd1dd08) at ../blockdev.c:3676
> 9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c   :1675
> 10 0x000055575c2c6201 in do_qmp_dispatch_bh (opaque=0x7f2ff7b0be30) at ../qapi/qmp-dispatch.c:129
> 11 0x000055575c2ebb1c in aio_bh_call (bh=0x55575dc429c0) at ../util/async.c:141
> 12 0x000055575c2ebc2a in aio_bh_poll (ctx=0x55575dc480f0) at ../util/async.c:169
> 13 0x000055575c2d2d96 in aio_dispatch (ctx=0x55575dc480f0) at ../util/aio-posix.c:415
> 14 0x000055575c2ec07f in aio_ctx_dispatch (source=0x55575dc480f0, callback=0x0, user_data=0x0) at ../util/async.c:311
> 15 0x00007f2ff9e7cfbd in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
> 16 0x000055575c2fd581 in glib_pollfds_poll () at ../util/main-loop.c:232
> 17 0x000055575c2fd5ff in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
> 18 0x000055575c2fd710 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
> 19 0x000055575bfa7588 in qemu_main_loop () at ../softmmu/runstate.c:726
> 20 0x000055575bbee57a in main (argc=60, argv=0x7ffd9dd1e0e8, envp=0x7ffd9dd1e2d0) at ../softmmu/main.c:50
> 
> (gdb) qemu coroutine 0x55575e16aac0
> 0  0x000055575c2ee7dc in qemu_coroutine_switch (from_=0x55575e16aac0, to_=0x7f2ff830fba0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
> 1  0x000055575c2fe2a9 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:195
> 2  0x000055575c2fe93c in qemu_co_queue_wait_impl (queue=0x55575dc46170, lock=0x7f2b32ad9850) at ../util/qemu-coroutine-lock.c:56
> 3  0x000055575c17ddfb in nbd_co_send_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, qiov=0x55575dfc15d8) at ../block/nbd.c:478
> 4  0x000055575c17f931 in nbd_co_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, write_qiov=0x55575dfc15d8) at ../block/nbd.c:1182
> 5  0x000055575c17fe14 in nbd_client_co_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/nbd.c:1284
> 6  0x000055575c170d25 in bdrv_driver_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:1264
> 7  0x000055575c1733b4 in bdrv_aligned_pwritev
>      (child=0x55575dff6890, req=0x7f2b32ad9ad0, offset=403487858688, bytes=4538368, align=1, qiov=0x55575dfc15d8, qiov_offset=0, flags=0) at ../block/io.c:2126
> 8  0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2314
> 9  0x000055575c17391b in bdrv_co_pwritev (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
> 10 0x000055575c1ee506 in replication_co_writev (bs=0x55575e9824f0, sector_num=788062224, remaining_sectors=8864, qiov=0x55575dfc15d8, flags=0)
>      at ../block/replication.c:270
> 11 0x000055575c170eed in bdrv_driver_pwritev (bs=0x55575e9824f0, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:1297
> 12 0x000055575c1733b4 in bdrv_aligned_pwritev
>      (child=0x55575dcea690, req=0x7f2b32ad9e00, offset=403487858688, bytes=4538368, align=512, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2126
> 13 0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
>      at ../block/io.c:2314
> 14 0x000055575c17391b in bdrv_co_pwritev (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
> 15 0x000055575c1aeffa in write_quorum_entry (opaque=0x7f2fddaf8c50) at ../block/quorum.c:699
> 16 0x000055575c2ee4db in coroutine_trampoline (i0=1578543808, i1=21847) at ../util/coroutine-ucontext.c:173
> 17 0x00007f2ff9855660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
> 
> When we do failover in COLO mode, QEMU will hang while it is waiting for
> the in-flight IO. From the call trace, we can see the IO request coroutine
> has yielded in nbd_co_send_request(). When we kill the NBD server, it will never
> be wake up. Actually, when we do IO stress test, it will have a lot of
> requests in free_sema queue. When the NBD server is killed, current
> MAX_NBD_REQUESTS finishes with errors but they wake up at most
> MAX_NBD_REQEUSTS from the queue. So, let's move qemu_co_queue_next out
> to fix this issue.
> 
> Signed-off-by: Lei Rao<lei.rao@intel.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

