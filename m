Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395902C9A43
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:58:54 +0100 (CET)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1Uq-00041N-NE
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kk1TX-0003Fn-Uo
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:57:31 -0500
Received: from mail-eopbgr30093.outbound.protection.outlook.com
 ([40.107.3.93]:50708 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kk1TU-0002lR-If
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:57:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by+4hXLK9PqpGQIAjHNLGTI7grFlAVQnNg5VCAc1BoLaMA7ZAzm99SnhhgMS+CNUens/5NA99D6MDFuukQtVDbwGCIw8CR+CTVR0hoipSU2kpsuj9mwlZEI3bqQnAhmRK+PhX0ue6kWuiZwodZ9YCfy8BNSeX/LGkxopoQATzlQ4d9Xq8UuAkKkLgbk+IccRNXnsBHL+TaOaqKdGbX+9/niYsFc2+Sx6maTrEWE/iKOIXgbPBl/QH7CNQiU0/RAr7g1Z5y42muJ/cXTKoN7xZHOFIvGsa4R9Zt1xzB9p6oda2cZaxp3OPcrTvXZCe+Q3I/kvrDE/nUPKB7DH6RaLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woPIzx9M11DyQjR2es9U3bZN0RIoqEl41/qKD/ZdvyA=;
 b=L7QfLEnSL2hLAP5rHdehYXoSWZcaXHk9znGOi43klx69YmjTj+af6LzmpkEQTY6CQO5OgUjAn8qlhOe9lLQnIMCgbtn+cWlqNAiMo1tdTlVtXF5TEwMk5duFjfnivxOB2QPE7G/++IWD0F1Yok3qJGbq2y/iVbHu2AC5JmFGUgxIKIqMBvsU0Oct1guSMNDMd0cn1nUUEzROfDDyYqBd3fyMlMIyrbL4nG+JheR7zND8kFZM/OVr+cVZRxpgovS5SnRDkQMnBOHpQB+CH//Nec+GNFW5PgOXRwMsWE9a+O6deE/SiNN0qF+rtkh9V6qdHeF4cpXV6ZbKymfTG9ZspA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woPIzx9M11DyQjR2es9U3bZN0RIoqEl41/qKD/ZdvyA=;
 b=LUPW/mzphK8Eps0n1e7Tqp5zZxdzWUSO5z00ehLqb/9cQuCYJSpKNH77VXWZzgjNIPlbsYbw49yYlQNsc4mgwiGGG4Nn6cOlrynDc5UnYVXHM9xGwpHl3tcK4JsKIm03MQ5BqPIS0cXgOER7OBjbY9SWrjj/GV33rMwkTKwnIa8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2512.eurprd08.prod.outlook.com
 (2603:10a6:800:b0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Tue, 1 Dec
 2020 08:42:20 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 08:42:20 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201201070820.GO105758@angien.pipo.sk>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <f9c53596-912a-0b52-adfe-68afff8799dc@virtuozzo.com>
Date: Tue, 1 Dec 2020 11:42:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201201070820.GO105758@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM9P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::24) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM9P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 08:42:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d602e35-2ca7-4268-5639-08d895d5042a
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2512:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2512C02C891955A5FF86AD5B9FF40@VI1PR0802MB2512.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: poPiEYX7VVP+S4sqx3lEWo75SBhPVxzoBQl+xWO8jYWdlUSJTHHnMEBcAE6IOlIzjVNXVUYFIaEZGu5UbNw1+q9bAUCnR5FFcjHYuKXVNu0F7hmdoW9FRkhRNiUHwjK/tPQJlZNsSfCtlY62Nx6h0OzXUPb3VlDHMkdK+EvOBQomKkq8jzrVj2OVk8Nfm2SdJQZ9Je6inJwPzEF1cfrZdgSvjUyTOsRSnthWjjacA0lpcPSuaYn9cbWGKubZnkrXpMqh718CYovsGGjDxMTmKyMttNoLZ8qzSq+p9FHD4rLEu9Dw4pWWAEqlufw86B6GlP7AfOguNl1YSE1ZMNXb8788pRd1xAqJhmd/7stV3qtSiVDgBck2nut7Tl54HuESy2Y4VHqGasZTkfT7BGOnIcvg4qW9w18nm/fFT1GQ8h8utaKH5w4EM2aVBiHbfoF6rrqO0m0xR/7Ah3VGV1twjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(366004)(376002)(136003)(66476007)(186003)(2906002)(54906003)(8676002)(4326008)(86362001)(26005)(316002)(16526019)(66556008)(36756003)(966005)(31686004)(66946007)(5660300002)(31696002)(8936002)(16576012)(6486002)(44832011)(53546011)(52116002)(83380400001)(6916009)(956004)(2616005)(478600001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K1RLR1YyRVMrTTVodWZXbXBEKzVqL0N2UVordzNIQTB6ZUdCTTVKam5uQlFt?=
 =?utf-8?B?QjErTi96bUhMUzEvT2VlMld4cDNyTWpNNmgzdTJIZElSKzdYK0ZlUFZrSEhC?=
 =?utf-8?B?UFRNWVRVNXlMdUFvajVpMm1tcDkrdkpKTmxGbXYxcnNPTGpDK2RINCszSzdp?=
 =?utf-8?B?QlpvL1BYNkR0eVpYSUFDTUxoeDFEcXRHTHA2cUNzWkFhT0pxeTBLY3NqNGs1?=
 =?utf-8?B?WnRpRmc0UEwzYXNVVHJST2pXM25tQTlqck5kdkZmVUd3NXRJbzZ2blY0aFd5?=
 =?utf-8?B?cUZqejd6K1hibURISHZrdXAxbllhd0RyVlRJSyt0WEh4ZTZqZUU4VkpERFEy?=
 =?utf-8?B?d1l5R2liSHEwTkp5bUlGd0VaUDgvcEFMQjYzTm1oTzZvUUgyOXVOY044bEIr?=
 =?utf-8?B?cFplWDltdVltT3lBV3hvTEliVzVxNytkMjVpN2lzWk9ZUHdQQXg2RkdaMHRu?=
 =?utf-8?B?ampuRlpMOGhwVTZnZ082b3A0UFA5U2lVVDdJbW1mekQxV3dkbUJ6TXhISnpk?=
 =?utf-8?B?eUcvSUk0djNMdVlsVkJZNmtSZ1Fsdi9KV2hySG5Qc1BsTVpNaTdtKzg3MlU2?=
 =?utf-8?B?NHpoakFaT01pQzNkNDhuSUVMM1NhdTNDMG9DRUhIZXV0UWo3all0WHN1YU9z?=
 =?utf-8?B?VE5xaC8rVjRKelJYNVlrS096OHd6dmVmMnBOejNxdHNOWHdCSzNBUkc4RnQy?=
 =?utf-8?B?dXh3cEJqVFBMeXlCUFM0UlVJd2J0c0dpbjRDV09WbTgrWGRmT2ZJMVAyWG81?=
 =?utf-8?B?QjAvbnQ3bzFJVkZjSllXSFpOb01qaDJaSDRhZDdXNlBZRjJZY3VleHgyL0VJ?=
 =?utf-8?B?L2swU1ZMVlliVzVub1E1YVhqTzEvZ2NyS2hWSnNRMkFVQm5vZFdJUWppdi9N?=
 =?utf-8?B?SVV2aFhGdFFkWEdKRFdIU3ZnNThQVnMyTkJ6MXpYSEYvcEIzWFlxa0xGZzZH?=
 =?utf-8?B?U2dlVlNjMEROYXIzelcxQUwrT2lzSWpqYjlBZXdHbTB6TW1xM1BNb0ZBZm5h?=
 =?utf-8?B?MENRWkxSbXc1YzJsZlN2MFFpbXBmMlladUR6R0NBQUtXeVF2bklLd3RNOFNJ?=
 =?utf-8?B?WVdoQ3RVY1NzL3M5RHVkSVUzcWlqWGdnUnZGcUQ2aHdMdTBRbVVIYnhXL3lm?=
 =?utf-8?B?QmgraXd4U2hOa0V2TkJ0OHJlcklwRW8yczhyZHhyVWIwczBOTlQzQUEzV1RV?=
 =?utf-8?B?SUJ2aEZuM25NZXRVaDFUT2tjbkZTSHdYOXVpa2swOE5EZ3poODd0Zkx2eE91?=
 =?utf-8?B?NFZqZDQ5WU1CU1VZRHJQaDVZWWlveWJYSWE0bERnNE5CQXk2LzBKU094YzNY?=
 =?utf-8?Q?rgHJzmpUecbGY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d602e35-2ca7-4268-5639-08d895d5042a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 08:42:20.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfVumgglk+159Lp98PwPEIuVYX/C8KuWp5sxqknfPAsTLt8UwTPB8goao/OF4je3VZAVLtjVqWesdWiopUcXdMx6U1K84zCkuvUlygAkPSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2512
Received-SPF: pass client-ip=40.107.3.93;
 envelope-from=andrey.gruzdev@virtuozzo.com;
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

On 01.12.2020 10:08, Peter Krempa wrote:
> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
> 
> Hi,
> 
> I gave this a try when attempting to implement the libvirt code for this
> feature. I've ran into a problem of migration failing right away. The
> VM's cpus were running at that point.
> 
> QEMU logged the following to stdout/err:
> 
> 2020-12-01T06:50:42.334062Z qemu-system-x86_64: uffd_register_memory() failed: start=7f2007fff000 len=33554432000 mode=2 errno=22
> 2020-12-01T06:50:42.334072Z qemu-system-x86_64: ram_write_tracking_start() failed: restoring initial memory state
> 2020-12-01T06:50:42.334074Z qemu-system-x86_64: uffd_protect_memory() failed: start=7f2007fff000 len=33554432000 mode=0 errno=2
> 2020-12-01T06:50:42.334076Z qemu-system-x86_64: uffd_unregister_memory() failed: start=7f2007fff000 len=33554432000 errno=22
> 
> 
> The migration was started by the following QMP conversation:
> 
> 
> QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate-set-capabilities","arguments":{"capabilities":[{"capability":"xbzrle","state":false},{"capability":"auto-converge","state":false},{"capability":"rdma-pin-all","state":false},{"capability":"postcopy-ram","state":false},{"capability":"compress","state":false},{"capability":"pause-before-switchover","state":false},{"capability":"late-block-activate","state":false},{"capability":"multifd","state":false},{"capability":"background-snapshot","state":true}]},"id":"libvirt-14"}
> 
> QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-14"}
> 
> QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate-set-parameters","arguments":{"max-bandwidth":9223372036853727232},"id":"libvirt-15"}
> 
> QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-15"}
> 
> QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"getfd","arguments":{"fdname":"migrate"},"id":"libvirt-16"}
> 
> QEMU_MONITOR_IO_SEND_FD: mon=0x7fff9c20c610 fd=44 ret=72 errno=0
> QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-16"}
> 
> QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"migrate","arguments":{"detach":true,"blk":false,"inc":false,"uri":"fd:migrate"},"id":"libvirt-17"}
> 
> QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 962424}, "event": "MIGRATION", "data": {"status": "setup"}}
> QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {}, "id": "libvirt-17"}
> QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966306}, "event": "MIGRATION_PASS", "data": {"pass": 1}}
> QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966355}, "event": "MIGRATION", "data": {"status": "active"}}
> QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 966488}, "event": "STOP"}
> QEMU_MONITOR_RECV_EVENT: mon=0x7fff9c20c610 event={"timestamp": {"seconds": 1606805733, "microseconds": 970326}, "event": "MIGRATION", "data": {"status": "failed"}}
> 
> QEMU_MONITOR_IO_WRITE: mon=0x7fff9c20c610 buf={"execute":"query-migrate","id":"libvirt-18"}
> 
> QEMU_MONITOR_RECV_REPLY: mon=0x7fff9c20c610 reply={"return": {"status": "failed"}, "id": "libvirt-18"}
> qemuMigrationJobCheckStatus:1685 : operation failed: snapshot job: unexpectedly failed
> 
>   $ uname -r
> 5.8.18-300.fc33.x86_64
> 
> 
> created by libvirt with the following patchset applied:
> 
> https://gitlab.com/pipo.sk/libvirt/-/commits/background-snapshot
> 
> git fetch https://gitlab.com/pipo.sk/libvirt.git background-snapshot
> 
> Start the snapshot via:
> 
> virsh snapshot-create-as --memspec /tmp/snap.mem --diskspec sdb,snapshot=no --diskspec sda,snapshot=no --no-metadata upstream
> 
> Note you can omit --diskspec if you have a diskless VM.
> 
> The patches are VERY work in progress as I need to figure out the proper
> sequencing to ensure a consistent snapshot.
> 
> Note that in cases when qemu can't guarantee that the
> background_snapshot feature will work it should not advertise it. We
> need a way to check whether it's possible to use it, so we can replace
> the existing --live flag with it rather than adding a new one and
> shifting the problem of checking whether the feature works to the user.
> 

Hi,

May be you are using hugetlbfs as memory backend?

I totally agree that we need somehow check that kernel and VM memory 
backend support the feature before one can enable the capability.
Need to think about that..

Thanks,

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

