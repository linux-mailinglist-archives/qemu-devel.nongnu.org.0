Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68632DFD93
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:31:12 +0100 (CET)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN9U-0004rM-11
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krMXl-0004rb-Im
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:52:14 -0500
Received: from mail-am6eur05on2107.outbound.protection.outlook.com
 ([40.107.22.107]:53520 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krMXh-0001o0-NG
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:52:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqWXX0b702/RYhue2yS5T2Uir/XkeydOueLo/TrtQ08Z7H194C6GvFxiUO/GT6mzq7wS0U4l/wrkZxOR7I4vZMoYUZ+pOjq3iOLddlI2nd2R6eY1NANrYa/NLbK3Ek87TZ/pRa7X/tp/aIbJ8U8z9DE6TC5uO3+E9gkW+7WvPfDdWlv+umO+EAKH27R+WSjufrhZaFKwwNTfrf7kukWIT2HhqPzczMa8B95wWyN7C5iRIbigwutAmLQK+aujuzyeqTBzxZ5jqrvVAK2HBaeVb9Kl+GRgt7OxjBI5rddve4pvI0V0HgmugAEhdvXhw/ooktmJATM3TV0/xgVFtI0+7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLR/IOuj6rjFet4Vbfr8GL/klPCQmR0FPf6kGtw8+G8=;
 b=LSWp/BawGuBHmg+WYwHfHpxIGxuy0z0d3ul2brxOR+3QNl13XYFikjMiZs0vFCrm/UiH3CkuDwxvrqU9cS5rzZ0lbLLFsfH/5UP6TteFDV5Ask8c3t3fr2+/q4e+DsoK1DU1q0S9oSR+rxmT8/Hmx+bfM+4uetNpcADoMvZg6hc7oUHUScMZMlB1VUbnPelK6fOdbIhuvguCjyCIM7Ocn/K5g+zM4DclH8LShbd4RxybTmX9nimo/DVs1tPFCd7wP5tGAfwGe36ac6atll7a1e9w1oDBm/PajLHcl42olkQQANkuw7oekodpqP0CN2RwgIteTTnAieetNqPLY7TcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLR/IOuj6rjFet4Vbfr8GL/klPCQmR0FPf6kGtw8+G8=;
 b=cXQjmXHMPrwvPgST3KKuqHwRARIXhHkEAVQEJ0wWm8LU67I8QDgRfvAlVaXohQ+JdgrivKRTpxvebx0QGR27TLA+/SttljPvsMiZCxl5D95gwX0EN69RuKeuCZNWRFhl4ymU64Ji7zuqOBvOOgoGto+XB4PKIW+ffsbB0HNkERE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3533.eurprd08.prod.outlook.com
 (2603:10a6:803:84::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 14:52:06 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3676.033; Mon, 21 Dec
 2020 14:52:06 +0000
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
To: qemu-devel@nongnu.org
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <d171b275-eb3e-eaef-4650-84ecd3466f0d@virtuozzo.com>
Date: Mon, 21 Dec 2020 17:52:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------D4E19A7AB99A335639600CB6"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::39) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0P190CA0029.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.28 via Frontend Transport; Mon, 21 Dec 2020 14:52:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8100bdd9-f45b-4850-3578-08d8a5bffc2d
X-MS-TrafficTypeDiagnostic: VI1PR08MB3533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB35336C67F168C8BE45B1D6319FC00@VI1PR08MB3533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1sD5aImvO8SdOuYW4y3lYo8fJwhNwWSr7It79Jf64R1PfD/CgIZ2ZluPPQyTg5KN+RMqbsIvICKM+nC5Qx5f3W8Ncerql1S8O+VqMIt4jpZnT0NPP8koayL6SGZmgioaHlC2hT9gMFqamG4rIEeXEP8q5tI27TskQnioB0xyJkPqM438+g/VZBDpxu5XeFca+E7Jgqng+1Zpy+JW5I/hnCtk4liFy8DMEoB45k8Fr38GngDer7XBbPldbrflLNBdMbuyHYhTI1xdL+rSOcJErPF8iKMSk7OkHW9FA5QplEfFo17bcm7FK2Q+Esd0imGr8QkT1yEdpK8kQOY1ydf77wd2plbI3KSO2w+hlcd+JgrrBjkKB1c01kIIfLwvZDrA7UdQ8mZYljkez+EYlemBFpOAS/7D71FTkaUkQUBE0Z8Q6EEelBa0jJ/SenJvvQi3g1kCaehAiGKqtC5yYKLoV4DmxOt+ufLKSWtEnxUmNTJ1iP+pMiqTzu6Cnlkwwonh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39830400003)(66946007)(66476007)(83380400001)(52116002)(66556008)(6486002)(31696002)(53546011)(33964004)(478600001)(31686004)(44832011)(5660300002)(8936002)(86362001)(6916009)(16526019)(16576012)(36756003)(316002)(956004)(54906003)(186003)(26005)(2906002)(2616005)(4326008)(8676002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?REVFRWR1TGlCVjdFWVBOS1hsWjlhNTNvR2lBTGd1NkszTGdzNlNCVEhEQW12?=
 =?utf-8?B?OEdsdXVMSStFUnVYdDF0Q0h2a2VzdWJpWW1ndjc2YW1OcW9ZejNCRCtFT3dt?=
 =?utf-8?B?MHJwWDlVeHlvazcwWlRMeEgxWHExeEZPTXNUWE9OZ0ZBN3pWWVoyYnhIMml5?=
 =?utf-8?B?OFdicjlhSVpDNVZXbjhOWmFUVFNVeTFJSTlzS3JkTG93STYwaTBPZzVQZ1VQ?=
 =?utf-8?B?T0xFMzV5ditWNFJFWU1GOVg1NE5wbkpzWEZjaWhDNFNwWHAwOU1KSzJ3TlM1?=
 =?utf-8?B?emErWG5sQyt1M1FLM2k2SjZsRFN2MGRUbkFMNUJ4bk9Qa3VHOVp6RzFMZHR1?=
 =?utf-8?B?eG5iMllhUFNzSU1IYStrc0hFWFI0dXIvd2I4eEhRV1loOUxJeDV1ZHlnajY0?=
 =?utf-8?B?NmxpZ01FNW9KQWFvaHQxMXJCa29vUmtJemp3RWs0dWg0R0QxVGhwNE1qVnMz?=
 =?utf-8?B?NmJJdXZGbmY2ckZBUDBvMUdVZS9tcldOQ2dTWHp5RThxeWtvNWVYdEp0NEN5?=
 =?utf-8?B?VlZwWkErVW8xeXk2ZjAvTUgwbERnYnRMUVVnb1Q2RkgxSXc2MXhoSGJLVmty?=
 =?utf-8?B?M2o3L3FYYXJwcEtqeG5WYll6NFJQZFZwbGpoNm5oSFd2S1BJS3R2cmdMcitT?=
 =?utf-8?B?MzdDZTZKNUdSeks5Ym1PdU9zYWV2VjlHN25idkh6RGVIUDF6RWJXTUcxZGR6?=
 =?utf-8?B?RnBidjNTYzhzL0tKd28yVDVYbGZIbTlLWldtamlLeWhUVjcreThjVUdLS29q?=
 =?utf-8?B?K0FLNEd4WWpzaWs1OGFiOWdnM052cE5yQW9oL3dWQUtPQTd1Y1czL0FiV2Fa?=
 =?utf-8?B?eVRBT2RNNGNzMTJaR2Vmd0Y2TEwyS2VaNGxGaXdZaUo4YmtIZmt6ZHVZWkRT?=
 =?utf-8?B?OE5TakVkTUR3YnprM2xVbmptUVRpeVl3bFgvL0pQbmtETFdTeGhwWDB1WTlv?=
 =?utf-8?B?V25QRm4rcGVOZ3ZQNEkvc3pyL1lCWVIrcHFmY2ZOWmsxdGtCV0VKVmo0ZUpC?=
 =?utf-8?B?YytaSytvZ3cySG5zNFdVTGxDYmxPa0UrcDJJUXdlRkQrOHZOZGcrL0d0RlRK?=
 =?utf-8?B?cjZuaktZVytxZTlQcmdyQmU5aGNnNGV0REsrT1pJbndIRTdUOUJuMTFhQTdn?=
 =?utf-8?B?WTZ5amNELzVHRWVJMzJhV1NWRVc0blNxNnh4NHR5M1k1YXJOOFVldWk1UXVD?=
 =?utf-8?B?UmRsVnFSOURLbmhXRGNScTBYZ1l2RW0yRkg1bTJtWEZ6RDJPb015T2JGdEcx?=
 =?utf-8?B?N0FWcXcvNjl4UHZsbHlIZXc3WnJZTFhCVThuOEMwZUVIMW5rTUpLRDhxaGpX?=
 =?utf-8?Q?WFr4HIZ4X9ENM=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 14:52:05.9943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 8100bdd9-f45b-4850-3578-08d8a5bffc2d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kILPjg+kEL0TQd3h0iKkmSGeA4J8OyBf9VCj1+a+mLSA//0P10Frfogkx9f/ciyIx4LtEzaBVmvPjd4hOc6xKrTjkUDk9gHNdVG+PNp5nng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3533
Received-SPF: pass client-ip=40.107.22.107;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001,
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

--------------D4E19A7AB99A335639600CB6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.12.2020 19:57, Andrey Gruzdev wrote:

Ping

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
> Changes v9->v10:
>
> * 1. Fixed commit message for [PATCH v9 1/5].
>
> Changes v8->v9
>
> * 1. Fixed wrong cover letter subject.
>
> Changes v7->v8
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


--------------D4E19A7AB99A335639600CB6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17.12.2020 19:57, Andrey Gruzdev
      wrote:</div>
    <div class="moz-cite-prefix">
      <pre>Ping

</pre>
    </div>
    <blockquote type="cite" cite="mid:20201217165712.369061-1-andrey.gruzdev@virtuozzo.com">
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


Changes v9-&gt;v10:

* 1. Fixed commit message for [PATCH v9 1/5].

Changes v8-&gt;v9

* 1. Fixed wrong cover letter subject.

Changes v7-&gt;v8

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

--------------D4E19A7AB99A335639600CB6--

