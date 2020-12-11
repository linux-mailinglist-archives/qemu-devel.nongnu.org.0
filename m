Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D52D7693
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:31:19 +0100 (CET)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniVx-0000dG-S6
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kniT6-0008Db-3g
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:28:20 -0500
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110]:64000 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kniT1-0005qP-TD
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:28:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTYLHxiing38t5vFHjm5EluOLYH8OhPkuD4McicBfra2ZqTx1oP4BhkyXALZZOuCdbzK3iX8Xwya0G4EHJYQ/nYuGlNtA+IN1/0Lkt0JS5ECmeIimvWGHe6sTvL6o50dj8DXPlaLwAhPqEJtQ8dm+TETuhe/+9r0yB8FSFIx3LBB5ceQzy94xCm8NFn32foXT0ruT2HlBj0Mz0CO3TXYVfTOmqOeBweH7vQKuqV62uTr8+PE815L4AEoRB6ENQlOvNA4kuaUcmiK0lf1AsBALxQvSELPv+Eo2M/jizd/Fccz05t5h9ouar9/ezCnWaYpoqiq9rw7DqYU/ob2/rIgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2O4psY9HPyxVBoDMMODInq8dWSl3Fu32QwXKZqT+zI=;
 b=hZ3Uz0V2rQ78RwMr9re+79RgxIxtzW71e9ZMGNiddJfUD57nJTp4/3bouXDmdDJ3Hn4fr7aWYPjSPorwiScrRe9+RxKSjveKu08X0yxefc6Ljp3upYml3lqFJ2Gb+w/GHKyIqsBZfBu3rNzg6C6PO9XbivEU9Wko5//fMInHT6m3S2xzKYvVkVaN7llfCWGV3Ko0Z81lM+aq7KFYzRdGuZtT5Foo4BM6Tu+frd5n5/uXe+no2zkrtGDrP3xHLHwSHwVPHMnmJxy9RFNTmXwipqXV0lfmlzvYLS55oR4RRIDD0wQThPrAV6R7VV1PZ20rzGMKo53hpwz8wr55VCt0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2O4psY9HPyxVBoDMMODInq8dWSl3Fu32QwXKZqT+zI=;
 b=BQW1sJBfV5yGDep0984s1YbTn1ARxaDeiTknCTuNL/hPDve1+sf2K+wJBIjI8RSeXc8nIULDbfgryuB4pYqPkg2t29Omdz3XKc/mba7v8TrdGChqFQFT3kme88cVqJai+eBCYCYHq4pY0OXRUpzKQ4w528ghFZsGmplwY1/FflA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR0802MB2607.eurprd08.prod.outlook.com
 (2603:10a6:800:b9::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 13:13:05 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3632.026; Fri, 11 Dec
 2020 13:13:05 +0000
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
To: qemu-devel@nongnu.org
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
Date: Fri, 11 Dec 2020 16:13:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------CAE1678FB7B7AC0E90103B3B"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM9P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::30) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM9P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 13:13:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07126300-3384-4e86-6dc8-08d89dd67f53
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2607C4162DF5B0044D53A0219FCA0@VI1PR0802MB2607.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QUfHz4IRU1TrEpifkxQL6x3Ft+JAg+J8HYVhkBEwVDuaSqztBY4g8O++J9C+3EbgR1cKsr7iWY7VKzd1v/LWf8ousBkSV8RUSTiZXiStB2vZ8e0fdnlMeyGinuB4TRXTRqmWf2Uvqj4jykKKrBJsI+29zbHk4HVpxhZpUau6hrrGhgrMa4FHR0qaNyjJs+WBp0WPECSqsHuRZp9SHXG14PfNMGvMHWMnezmrMHDCrTfzy0FB5Bp2yRtiHIfpvXTcq7+ApKq5RG1USMOcjwaxo8r0vi4VQ4UFOfvA/yvM3KPrwd80RfQ6yOiNpv7JBkKvikz6G5cXulB1fUHRJpjdWRxwFkUaWpLo+alQTJk5AQBwm55/fVcUiWEqU2S1WMuLGl7NsoFVD0ckqMnSbAJgxQb7OCzJS3YAgRejO7Fp+ZRS56in4udrV+J0xY197UBU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(136003)(396003)(346002)(366004)(52116002)(16576012)(54906003)(6486002)(53546011)(66946007)(2906002)(86362001)(66556008)(4326008)(33964004)(66476007)(31696002)(186003)(316002)(26005)(16526019)(31686004)(44832011)(8676002)(5660300002)(2616005)(956004)(83380400001)(478600001)(6916009)(36756003)(30864003)(8936002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGs5OHpZcWF3dzYvMVZEMHMwb1I1V3Q0WFVEOXplcGhKTTlYNVJrenBIT1ZJ?=
 =?utf-8?B?SDU0dmp0aEhKeXJZNW8rYU53azZjZVZuamJLbm50d0JWbWxJVUJzTDFGeHcv?=
 =?utf-8?B?MFM1T3g3ejE2b2p3dEVFNkcvTkx0ZnlDdlRXWWpxeVNzazZtUWFWbTd1Z0NI?=
 =?utf-8?B?NmhYbzVpVlp6WXNQMW94d3ZuRU9OUzdIZE85cko2ZWJvQ09PcGIrU2xyTEti?=
 =?utf-8?B?a0N0d0laeG50Y0FoZmhKRzJ1RGtWb2RNY3lxRjFSSm9idlhwYzBabGtJZE94?=
 =?utf-8?B?cEVzanFmMTNrUE8vVUpCQWZ1TUlnd0NvZnVJYmNNdGhCZlppa0xtc1I5b3Uy?=
 =?utf-8?B?TVl3TUZSa2dvU09BQ1lhL3NEMTFlTnF4L0tOcFdPUXFrbVNxQzNRVkFwOGNJ?=
 =?utf-8?B?Si81QVlpYzJaVlpGWGRBNHkvVzNJbUdtZWhEQjVBKzlsc1lvaGZ1TGUrUUJh?=
 =?utf-8?B?Y2lqL1hWU0hGNEdqbTZXeXR1TlhwL2tpdmcrblBTaGtuTitIMThROVE5cFV3?=
 =?utf-8?B?RjdUajliSjVPcFc2S2pzNUNQT3Rib2RMbGZIdDdhenFBbHVTT3BSVUU3NU5w?=
 =?utf-8?B?dGNpaXdnYk1TZkk0SDFBQ3VCcS9ENzZKZU4zc0ZlcnJnZURKdWsrWlFHN0py?=
 =?utf-8?B?QTFqd04xMCtuL0V4d3Bka0t4VW8vcUcwUjZZRWhoT0lSQis3STlHeERHMEps?=
 =?utf-8?B?dnIxR1dVUCtDYnNHQy82ekUvVkVCSFVUVjhtV2VqckFQOTgyMUQxK1JNRmVq?=
 =?utf-8?B?M3ZBdlpSdTUvRUl2WWI1dURkMW52czZaejd5OFdwWDM2Q1JzNEtwMjFtTzcv?=
 =?utf-8?B?cytLcnZ5Z1dvekRrZktEWXRCQU9VTzlMaU9mWll5NS9Nb3FkQWoxUVJSa0o5?=
 =?utf-8?B?TFZkZXNybks5VzU0RXNqUmt0NnpJV2pDb1VvN3N0dHFJQm04ejlKQm03VWFF?=
 =?utf-8?B?UkhwRXk0NE5zcG1OV01ZSGRBRGpycDArbUtEN05jUUdhc2ZYQmNHczBVS1J3?=
 =?utf-8?B?MXBXRHBRcGFIcXFvRDhOUzRCdlNNa05leGZ2cG1tcmE1M04wT0htdVJxYU9N?=
 =?utf-8?B?dnFLYVJzN1ZIVXlJS29hQUc2eEFBdGsvV3RtL25Ld2QrbmtnWktrTmhxbkxE?=
 =?utf-8?B?WW9ndWFPWG9SdzIvUTMxaXJxdklIbjNqTU4zRitmMU9ZZy9QVnF2Q2hNZ2Ra?=
 =?utf-8?B?THEzdmJLcGx1cS81Tzh6MStMU0tDdUl2aHpWZktLOFVGVjhvUlJ0UlVpYTUy?=
 =?utf-8?B?c0ZsS0FuKzBaS0lSM09WMUc3VDZjbThRZmNFQWx1eGpaSGVvNy9sakw4eUdP?=
 =?utf-8?Q?9lSTYtRfRFUVOeFPUJltFSI5Oqz6iJ6qti?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 13:13:05.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 07126300-3384-4e86-6dc8-08d89dd67f53
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUq3G4ML/lOgDuZWP/qBOksr4x+xwWree0KYwsFzTClB3xUpzSi8hxWFbiIFKZDjBxMWIvl8udf3LLLK2Eg8lD1MQQZwa5CgWaKIGYbKLcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2607
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------CAE1678FB7B7AC0E90103B3B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.12.2020 13:08, Andrey Gruzdev wrote:
> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>
> Currently the only way to make (external) live VM snapshot is using existing
> dirty page logging migration mechanism. The main problem is that it tends to
> produce a lot of page duplicates while running VM goes on updating already
> saved pages. That leads to the fact that vmstate image size is commonly several
> times bigger then non-zero part of virtual machine's RSS. Time required to
> converge RAM migration and the size of snapshot image severely depend on the
> guest memory write rate, sometimes resulting in unacceptably long snapshot
> creation time and huge image size.
>
> This series propose a way to solve the aforementioned problems. This is done
> by using different RAM migration mechanism based on UFFD write protection
> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
> guest RAM content using write-protection and iteratively release protection
> for memory ranges that have already been saved to the migration stream.
> At the same time we read in pending UFFD write fault events and save those
> pages out-of-order with higher priority.
>
> How to use:
> 1. Enable write-tracking migration capability
>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
> track-writes-ram on
>
> 2. Start the external migration to a file
>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>
> 3. Wait for the migration finish and check that the migration has completed.
> state.
>
> Changes v4->v5:
>
> * 1. Refactored util/userfaultfd.c code to support features required by postcopy.
> * 2. Introduced checks for host kernel and guest memory backend compatibility
> *    to 'background-snapshot' branch in migrate_caps_check().
> * 3. Switched to using trace_xxx instead of info_report()/error_report() for
> *    cases when error message must be hidden (probing UFFD-IO) or info may be
> *    really littering output if goes to stderr.
> * 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
> * 5. Added memory_region_ref() for each RAM block being wr-protected.
> * 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
> * 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
> * 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
> *    that choosen criteria for high-latency fault detection (i.e. timestamp of
> *    UFFD event fetch) is not representative enough for this task.
> *    At the moment it looks somehow like premature optimization effort.
> * 8. Dropped some unnecessary/unused code.
>
> Changes v5->v6:
>
> * 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
> *    for write-tracking support level in migrate_query_write_tracking(), check
> *    each time when one tries to enable 'background-snapshot' capability.
>
> Andrey Gruzdev (4):
>    migration: introduce 'background-snapshot' migration capability
>    migration: introduce UFFD-WP low-level interface helpers
>    migration: support UFFD write fault processing in ram_save_iterate()
>    migration: implementation of background snapshot thread
>
>   include/exec/memory.h      |   8 +
>   include/qemu/userfaultfd.h |  35 ++++
>   migration/migration.c      | 357 ++++++++++++++++++++++++++++++++++++-
>   migration/migration.h      |   4 +
>   migration/ram.c            | 270 ++++++++++++++++++++++++++++
>   migration/ram.h            |   6 +
>   migration/savevm.c         |   1 -
>   migration/savevm.h         |   2 +
>   migration/trace-events     |   2 +
>   qapi/migration.json        |   7 +-
>   util/meson.build           |   1 +
>   util/trace-events          |   9 +
>   util/userfaultfd.c         | 345 +++++++++++++++++++++++++++++++++++
>   13 files changed, 1043 insertions(+), 4 deletions(-)
>   create mode 100644 include/qemu/userfaultfd.h
>   create mode 100644 util/userfaultfd.c
>
I've also made wr-fault resolution latency measurements, for the case when migration
stream is dumped to a file in cached mode.. Should approximately match saving to the
file fd directly though I used 'migrate exec:<>' using a hand-written tool.

VM config is 6 vCPUs + 16GB RAM, qcow2 image on Seagate 7200.11 series 1.5TB HDD,
snapshot goes to the same disk. Guest is Windows 10.

The test scenario is playing full-HD youtube video in Firefox while saving snapshot.

Latency measurement begin/end points are fs/userfaultfd.c:handle_userfault() and
mm/userfaultfd.c:mwriteprotect_range(), respectively. For any faulting page, the
oldest wr-fault timestamp is accounted.

The whole time to take snapshot was ~30secs, file size is around 3GB.
So far seems to be not a very bad picture.. However 16-255msecs range is worrying
me a bit, seems it causes audio backend buffer underflows sometimes.


      msecs               : count     distribution
          0 -> 1          : 111755   |****************************************|
          2 -> 3          : 52       |                                        |
          4 -> 7          : 105      |                                        |
          8 -> 15         : 428      |                                        |
         16 -> 31         : 335      |                                        |
         32 -> 63         : 4        |                                        |
         64 -> 127        : 8        |                                        |
        128 -> 255        : 5        |                                        |

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------CAE1678FB7B7AC0E90103B3B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 09.12.2020 13:08, Andrey Gruzdev
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201209100811.190316-1-andrey.gruzdev@virtuozzo.com">
      <pre class="moz-quote-pre" wrap="">This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.

Currently the only way to make (external) live VM snapshot is using existing
dirty page logging migration mechanism. The main problem is that it tends to
produce a lot of page duplicates while running VM goes on updating already
saved pages. That leads to the fact that vmstate image size is commonly several
times bigger then non-zero part of virtual machine's RSS. Time required to
converge RAM migration and the size of snapshot image severely depend on the
guest memory write rate, sometimes resulting in unacceptably long snapshot
creation time and huge image size.

This series propose a way to solve the aforementioned problems. This is done
by using different RAM migration mechanism based on UFFD write protection
management introduced in v5.7 kernel. The migration strategy is to 'freeze'
guest RAM content using write-protection and iteratively release protection
for memory ranges that have already been saved to the migration stream.
At the same time we read in pending UFFD write fault events and save those
pages out-of-order with higher priority.

How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate_set_capability.
track-writes-ram on

2. Start the external migration to a file
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate exec:'cat &gt; ./vm_state'

3. Wait for the migration finish and check that the migration has completed.
state.

Changes v4-&gt;v5:

* 1. Refactored util/userfaultfd.c code to support features required by postcopy.
* 2. Introduced checks for host kernel and guest memory backend compatibility
*    to 'background-snapshot' branch in migrate_caps_check().
* 3. Switched to using trace_xxx instead of info_report()/error_report() for
*    cases when error message must be hidden (probing UFFD-IO) or info may be
*    really littering output if goes to stderr.
* 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
* 5. Added memory_region_ref() for each RAM block being wr-protected.
* 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
* 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
* 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
*    that choosen criteria for high-latency fault detection (i.e. timestamp of
*    UFFD event fetch) is not representative enough for this task.
*    At the moment it looks somehow like premature optimization effort.
* 8. Dropped some unnecessary/unused code.

Changes v5-&gt;v6:

* 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
*    for write-tracking support level in migrate_query_write_tracking(), check
*    each time when one tries to enable 'background-snapshot' capability.

Andrey Gruzdev (4):
  migration: introduce 'background-snapshot' migration capability
  migration: introduce UFFD-WP low-level interface helpers
  migration: support UFFD write fault processing in ram_save_iterate()
  migration: implementation of background snapshot thread

 include/exec/memory.h      |   8 +
 include/qemu/userfaultfd.h |  35 ++++
 migration/migration.c      | 357 ++++++++++++++++++++++++++++++++++++-
 migration/migration.h      |   4 +
 migration/ram.c            | 270 ++++++++++++++++++++++++++++
 migration/ram.h            |   6 +
 migration/savevm.c         |   1 -
 migration/savevm.h         |   2 +
 migration/trace-events     |   2 +
 qapi/migration.json        |   7 +-
 util/meson.build           |   1 +
 util/trace-events          |   9 +
 util/userfaultfd.c         | 345 +++++++++++++++++++++++++++++++++++
 13 files changed, 1043 insertions(+), 4 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100644 util/userfaultfd.c

</pre>
    </blockquote>
    <pre>I've also made wr-fault resolution latency measurements, for the case when migration
stream is dumped to a file in cached mode.. Should approximately match saving to the
file fd directly though I used 'migrate exec:&lt;&gt;' using a hand-written tool.

VM config is 6 vCPUs + 16GB RAM, qcow2 image on Seagate 7200.11 series 1.5TB HDD,
snapshot goes to the same disk. Guest is Windows 10.

The test scenario is playing full-HD youtube video in Firefox while saving snapshot.

Latency measurement begin/end points are fs/userfaultfd.c:handle_userfault() and
mm/userfaultfd.c:mwriteprotect_range(), respectively. For any faulting page, the 
oldest wr-fault timestamp is accounted.

The whole time to take snapshot was ~30secs, file size is around 3GB.
So far seems to be not a very bad picture.. However 16-255msecs range is worrying 
me a bit, seems it causes audio backend buffer underflows sometimes.


     msecs               : count     distribution
         0 -&gt; 1          : 111755   |****************************************|
         2 -&gt; 3          : 52       |                                        |
         4 -&gt; 7          : 105      |                                        |
         8 -&gt; 15         : 428      |                                        |
        16 -&gt; 31         : 335      |                                        |
        32 -&gt; 63         : 4        |                                        |
        64 -&gt; 127        : 8        |                                        |
       128 -&gt; 255        : 5        |                                        |

</pre>
    <pre class="moz-signature" cols="72">
-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------CAE1678FB7B7AC0E90103B3B--

