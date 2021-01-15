Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D302F77F7
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 12:51:28 +0100 (CET)
Received: from localhost ([::1]:51534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0NdX-0007Hi-AI
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 06:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l0Nc0-0006RG-6W
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:49:52 -0500
Received: from mail-eopbgr10121.outbound.protection.outlook.com
 ([40.107.1.121]:27044 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l0Nbw-0004Y9-Jz
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 06:49:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntWuaBG8gsmHHcK5j88yZF08YwbUJ9g9hlgNUVLduTAQVHPWnQ+DxdFsfVXPcNVaBicIajMkTjoqgAn7Jt0n80V3qfjibUsMwgIwX5iFNZ32uMT0wIIgFoH+KM5sPyv08fVfbMblO+WkL/NCBtDWzLy4laF4d5Ayie8s3YyBJi+zWg4K/Tzff1qySwO/X8YB/2uJaAUMEpFC/vsSWzSJfHMzpjPKU/lvTuYItoOsNPtxRXcQ40ZRiG/FDK68zm2PUtaZyAOEsfuPdz0PvMiJXQR/vdmFenqTG0cZ0xvaqJFz+7+UEr2uMh+kVJbO6UYeFgR5S+LWytveEgkUhXFyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FByFj2U2BBSryPqjfQwIzsLh6Kr38HWW0V8j7c+ATFk=;
 b=P8Ew+a3hSLFk6u559GWVWHmy7GqbqhInzP6SzG8ChfTndx0klgOsCshmILJZx7rDZpfwrvvfzN7wk2tHRpf01fqFmMge8gKkHqTF8572uEjU5qFM4n9sSKTqwpmfSA1D2MVV1Lm8w0FMfGw8aJ7HQ0Cql1aSJcEoSwSaJSGjqkS1at01Z0mux3pxnECEZCGWdPPOghgvySr2TeG4KwCxzHhssQpbnhqYN4/zXFBisyUDezchbbQ4HLOdqS538o/7P9XJZwgr5oHoIFYra9wwttB77IkEnMjUHGibOMZwOYk1nTLIZ9FfePbH8VmyBRknxNBHFDeAvxRJobin4MrcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FByFj2U2BBSryPqjfQwIzsLh6Kr38HWW0V8j7c+ATFk=;
 b=PZGNrnU0KVahdDXi3lRETB8j5VDClyb/2gJke5yrS3tN9h66lijh5qiUERi+6kcfpPlBdGAMVSzXIfuERc3GehQdbWRGxKtAWh+rqh2dXKWBDDqmC8Md2sE/XB8vc4AVpI24sy/7/PMb9/+/bPv1ebDu/YU/KwoifRlVMnotAb8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3362.eurprd08.prod.outlook.com (2603:10a6:208:dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 11:34:43 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::c0d3:5f7b:232a:b951]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::c0d3:5f7b:232a:b951%5]) with mapi id 15.20.3763.012; Fri, 15 Jan 2021
 11:34:43 +0000
Subject: Re: [PATCH v11 0/5] UFFD write-tracking migration/snapshots
To: qemu-devel@nongnu.org
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <b3ca934d-0c24-d940-2df1-2583502ccefb@virtuozzo.com>
Date: Fri, 15 Jan 2021 14:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------CBF47FD975533E35B99196EA"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0106.eurprd03.prod.outlook.com
 (2603:10a6:208:69::47) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:208:69::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 11:34:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cf61663-b1d6-411e-84de-08d8b9498d60
X-MS-TrafficTypeDiagnostic: AM0PR08MB3362:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB336202DD7C6011B5FCA79D3C9FA70@AM0PR08MB3362.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6Ih/XCHIisjcslbXXa52Ss8wVnRSHfsJH87/WztSg5z2h1PaJoOggr8nvz5GgzcXW3XWTej9YLxVLY3Sq194cgMp9OxVquHSkCBPuiZK4lNJHKwPZhz8ZcnqDIfnJz7P/XzoBzx/twwlMY9kA9WCw/N9+0VEhHH/aDdBMISXRdMnThVB67KvrwA1h9YjhCvnnG2y5GazH/DyFEsDXZ3qJ6CoPUIkm1PBi/dLNS2wm21xVrQTARUoz1U0k+zs1Rob64DPM5r8DCdlpVLiPip9cET7embYiqI1FRuFeH1wENruYANNpuS1/wuOMbLGj5yMVaIKzlPxvHCUlfbftmGJ8BLl6OJOhKL3q/VpFHzcRuoF1IzgsTinWZ92xsvKt9CnLtKsPJI8/yfJn1L7vo+736oN5h8VmlgHTKXQPk7r/ISam9DqXvXHvIFD9ZvzwqRjhzHMeVygSpg1uMjOO5XB5SiHgOZUv9VtLvH+uXotjC3m95ncXqxhPkOKwGGAqHl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(346002)(366004)(6486002)(53546011)(186003)(44832011)(2616005)(66946007)(2906002)(316002)(8676002)(31696002)(4326008)(16576012)(31686004)(26005)(16526019)(6916009)(33964004)(36756003)(54906003)(8936002)(66556008)(86362001)(83380400001)(478600001)(5660300002)(66476007)(956004)(52116002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Rk8zekR1QnpJMWNLSEtlK1lLQkl1cGU2VFMrRUNzRFNWQnVlOTNaaGJRdzNX?=
 =?utf-8?B?c3NOYjcyZGRDNHdZL2dWSWNrUVp4NWN2bHNJLzdmVnErT3lzVWpqUE5HanhB?=
 =?utf-8?B?UVp5cjh0ZE0zMy81cXp4WDhHQWgrSzZXNWxBdXlUYUp6OVdKRnI3RTFxTnpC?=
 =?utf-8?B?L0xvV21zMjRnWU5SeFJoR3NoMVRLRUgzdEhvMUU2L2NYcVRUNmQ1SFhNejk2?=
 =?utf-8?B?Mk9ydm1lNk1DVWxqUUV6RWZnMHUyOXpEaWcvQVBWd0ZtZEg2RE85TGk1RUF4?=
 =?utf-8?B?RDh4emNIRzQwMDI1YUhqRGN6SFNVVEFGNm5SS3RObGp5RlJBSWhxM3FMODZn?=
 =?utf-8?B?Tjc2cG8vNm0wOXVzV3k5d01uQTVLZkh6OXFTSFAvbGlqejJhWU1LUFRPUGZy?=
 =?utf-8?B?VzlOZjQ5ejA2amlzZkxxeTZSUFRJS1RsMnZlSFd6TDRaM1BkQlNPZ21xbUU0?=
 =?utf-8?B?U3BCRUZyV1JnNy8rOUJxNmF3Y1B2L3NXMjhhZjQ1NTlpbldwaCtNbUwvN3pF?=
 =?utf-8?B?ajNLaWhLUTVLQ3R0VnZWWU9OUXROZCs3Qm9oQXNaWUF0QTlMVjV0ODNnRXY4?=
 =?utf-8?B?aVhrSzJicFRXZ0lBQUp0c2ZLaDdydndXdWhaRlFsMXZZTGxGYVZPT3VWNzFX?=
 =?utf-8?B?d21TSjB5UUtyNDdZSGY1NXFyUGd1NVdnL3BMZWdQL2hML0orU2VreUFQZVgy?=
 =?utf-8?B?Z0FtL2FPZ3V1RmhmWlJIbzM0dFlZSURyS0J1dWJCRVRadE40c2ZYU0Vjc3Bw?=
 =?utf-8?B?MmFaSmJxdlFuMSs2T3hkQm5haFF3ZG5NU1VGU1RBcFEwdzJiNGI4QmJYNkZw?=
 =?utf-8?B?WWhhekJ4TFo0MDloOVFsOVBXS24xdHpQcGE1VHlqQU1JVklsOEZQNUVMOU1S?=
 =?utf-8?B?TnliWGN4L0NKNjk1NDRiTEk2NHhEZ2U5Y0VoOHBNRlZDSWxRZzdzRmxvcURq?=
 =?utf-8?B?YzJNZHhqd1NsRzgzcXdkYzZUTjFhNUJiK0xsY2xpOTdlcjhFMDBKbzVwMXA0?=
 =?utf-8?B?TURwaUVVUnRuWkEyY0pIcjdLUEl3YitMSXQvTmhkQUpKUXJGM0FreHlGOHRO?=
 =?utf-8?B?UkY2WEtVT093NTduYVR3SVJnNExhbjJPdUtjN0g2WUJUVWZaVUNoTmNvSmo4?=
 =?utf-8?B?QnoyY0lUZ3I5QXJSMVlBOUVpbU9DclkvTUIwNEZzalB3ZHRLUXVLTjZJVVd4?=
 =?utf-8?B?S24wREEwMzVxbHErdGN1Nmt6Z0d3enFNdGl1cDVlLzBVQUU2VmxxNmFUU1pi?=
 =?utf-8?B?VzRNWjRGS05DbC9YZzRBOG8rVHhFVXdpUlY1dlZzSmtRbUROUkFMdUFIbTNa?=
 =?utf-8?Q?8PUlDh0Wlz70s=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf61663-b1d6-411e-84de-08d8b9498d60
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:34:42.9728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoQyAjRVN+QCcoLngiNtvoIPYaCreP9nQ9oNK+48IXm68LHDS4qbAe1GMS7pYMnk+0zZRSoxrVq4QsYMvaWbroc9KttEsNpyM17RzBa799c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3362
Received-SPF: pass client-ip=40.107.1.121;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------CBF47FD975533E35B99196EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Ping

On 06.01.2021 18:21, Andrey Gruzdev wrote:

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
>
> Changes v10->v11:
>
> * 1. Updated commit messages.
>
> Changes v9->v10:
>
> * 1. Fixed commit message for [PATCH v9 1/5].
>
> Changes v8->v9:
>
> * 1. Fixed wrong cover letter subject.
>
> Changes v7->v8:
>
> * 1. Fixed coding style problems to pass checkpatch.
>
> Changes v6->v7:
>
> * 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
> *    before stopping VM to make runstate transition valid.
> * 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
> * 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.
>
> Changes v5->v6:
>
> * 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
> *    for write-tracking support level in migrate_query_write_tracking(), check
> *    each time when one tries to enable 'background-snapshot' capability.
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
> Andrey Gruzdev (5):
>    migration: introduce 'background-snapshot' migration capability
>    migration: introduce UFFD-WP low-level interface helpers
>    migration: support UFFD write fault processing in ram_save_iterate()
>    migration: implementation of background snapshot thread
>    migration: introduce 'userfaultfd-wrlat.py' script
>
>   include/exec/memory.h        |   8 +
>   include/qemu/userfaultfd.h   |  35 ++++
>   migration/migration.c        | 365 ++++++++++++++++++++++++++++++++++-
>   migration/migration.h        |   4 +
>   migration/ram.c              | 288 ++++++++++++++++++++++++++-
>   migration/ram.h              |   6 +
>   migration/savevm.c           |   1 -
>   migration/savevm.h           |   2 +
>   migration/trace-events       |   2 +
>   qapi/migration.json          |   7 +-
>   scripts/userfaultfd-wrlat.py | 148 ++++++++++++++
>   util/meson.build             |   1 +
>   util/trace-events            |   9 +
>   util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
>   14 files changed, 1211 insertions(+), 10 deletions(-)
>   create mode 100644 include/qemu/userfaultfd.h
>   create mode 100755 scripts/userfaultfd-wrlat.py
>   create mode 100644 util/userfaultfd.c
>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------CBF47FD975533E35B99196EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">
      <pre>Ping
</pre>
    </div>
    <div class="moz-cite-prefix">
      <pre>On 06.01.2021 18:21, Andrey Gruzdev wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20210106152120.31279-1-andrey.gruzdev@virtuozzo.com">
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


Changes v10-&gt;v11:

* 1. Updated commit messages.

Changes v9-&gt;v10:

* 1. Fixed commit message for [PATCH v9 1/5].

Changes v8-&gt;v9:

* 1. Fixed wrong cover letter subject.

Changes v7-&gt;v8:

* 1. Fixed coding style problems to pass checkpatch.

Changes v6-&gt;v7:

* 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
*    before stopping VM to make runstate transition valid.
* 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
* 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.

Changes v5-&gt;v6:

* 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
*    for write-tracking support level in migrate_query_write_tracking(), check
*    each time when one tries to enable 'background-snapshot' capability.

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

Andrey Gruzdev (5):
  migration: introduce 'background-snapshot' migration capability
  migration: introduce UFFD-WP low-level interface helpers
  migration: support UFFD write fault processing in ram_save_iterate()
  migration: implementation of background snapshot thread
  migration: introduce 'userfaultfd-wrlat.py' script

 include/exec/memory.h        |   8 +
 include/qemu/userfaultfd.h   |  35 ++++
 migration/migration.c        | 365 ++++++++++++++++++++++++++++++++++-
 migration/migration.h        |   4 +
 migration/ram.c              | 288 ++++++++++++++++++++++++++-
 migration/ram.h              |   6 +
 migration/savevm.c           |   1 -
 migration/savevm.h           |   2 +
 migration/trace-events       |   2 +
 qapi/migration.json          |   7 +-
 scripts/userfaultfd-wrlat.py | 148 ++++++++++++++
 util/meson.build             |   1 +
 util/trace-events            |   9 +
 util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
 14 files changed, 1211 insertions(+), 10 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100755 scripts/userfaultfd-wrlat.py
 create mode 100644 util/userfaultfd.c

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------CBF47FD975533E35B99196EA--

