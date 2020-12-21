Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E892DFC22
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:01:49 +0100 (CET)
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKou-00082h-Hd
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:01:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krKn1-00072m-S1
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:59:51 -0500
Received: from mail-am6eur05on2126.outbound.protection.outlook.com
 ([40.107.22.126]:27382 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1krKmx-0004Rv-PK
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:59:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K65k7SII26pSJF0YfG3iGt2HSWqY79mY7+LYWpHhOk1fm4aYxDd4n8pWKAeot6cCfjzNyWMuf17WtanLYN0Q1+QJTQp18/CaD8jSJRT63NFcA+BvXpzgnHvMgqkF28JiSa06Y2RPB59LEgDNongFOHyD8qZU96WgltOaCCiSYVBUK+Vgq7EH7HmVcjjnHAu9AlL7CCdru7o34GSQnDesixUrNkCsIMgjRsj4dsTsQEyCLhzul7Bh1QszVlkL55JUQ6MuKFTJ84YX+JuAIzwyCY/uKzNpT8/D3DYN6TiNcSEFqOn3Jje9s829WwdfR3CFb8J0BMbCBhnrilAIUaSu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0cLERi9RuS9v8vqmH/EiYi6A3vwEn0FRNFCOHosx5U=;
 b=X5R1E++pbxEZUhuduXWSuiBioNegHwlot0sOLgQ5u62XsEMNQJdra4qAO7rTWK0KsGuhCeEfi2CWiKV9NIK/huL5d3Gj8herdhUloSs/zVQy+CRTDgFFpBqrtyLMxdNBq1ludrRtYu+o6EXqsE+kbNasbxD2/V0HIx1JswRnjPaK85mAqzeLesatLaeOmDHRTa7PYB9j5HzLse0KNy2gm4l5+JCYqmPEWaF+xb7iViG+zKEJ8TPZeRxC0/wgdP7AVqEmZrfgyNmnl6vCyP1YeSOhs9tGjQSsH/jJc2r3ibFjpyaZQ1qOQhvhwcu4WgVkuI+DlSVVVp+H2Vw+7XqOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0cLERi9RuS9v8vqmH/EiYi6A3vwEn0FRNFCOHosx5U=;
 b=vWqtDpQ5qz3V7V7COZR1DtvXgQG9RooY/KBi04UdBbqYZT4KYss+7O0I0T5ycqTrp9d2CWl0RfyKT/5NEwp1UimR+GXsUHMzOagfNZhuX79b3exCrU4T/fTcclnjha406nj+F4Kx+g3uglHcnBFUwg+JWW8MlQaKibXVyf0+h3g=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VE1PR08MB5039.eurprd08.prod.outlook.com
 (2603:10a6:803:115::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Mon, 21 Dec
 2020 12:44:41 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3676.033; Mon, 21 Dec
 2020 12:44:41 +0000
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
To: qemu-devel@nongnu.org
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <594af923-f960-5e8c-ec14-ef43d8ede8c9@virtuozzo.com>
Date: Mon, 21 Dec 2020 15:44:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
Content-Type: multipart/alternative;
 boundary="------------A30AD1B0CFA8E60EB6FDEE00"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46)
 To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0069.eurprd03.prod.outlook.com (2603:10a6:208::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Mon, 21 Dec 2020 12:44:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 856d340e-d4de-4f63-09dd-08d8a5ae2fc6
X-MS-TrafficTypeDiagnostic: VE1PR08MB5039:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR08MB5039B12856604553BBB90DE09FC00@VE1PR08MB5039.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yyfTAMai7B2f3S/keHE0LEEutSNIi8Wje51memvRsf65AbfBsypUMk0ZMo3uCme0KSbQjUu9ImCkDdijM1uCtrSXpVXj9PD4PttFJ9R/B7/D+xJwZcCX8kVQT2qG52aFOj4A/pWKoNMm+R1Zz/aGnzouBNRIiNha+vNhHGGYc2vW5710cDUwzgxXzyLwOip3NXG7oj7QEGIKsvRWFA9DRW+YPh9VAC24K9uzPktV/+Rc4OdAGFgbHJXV0KQ1apAM9D1Q9AQXwMXC0NWfmhEEp4lotXnAxYp9c7OG+dtZpT3UOEJOT7aKdWkOK8qU24Ht1tDjKi6gkqnpcEBrk4XcwWz5E4LmSOWqSNJUKERCUZzRyJ/H/EikQAHDnnU4AZ46Rym87Ko0ojl7pIprMWgAKdWFpz98IcBNXcLnD+Fo7o7Yr+YGenLmZucSo5Wbr53l+/Kf/uc5v9/Un4n4gKT2C8Q0x25VcfD4tapE2wqT3zKl+ywqakEkPOpKMnN9f1+2RH5XSPtKqBITuLlCAjaV9zqTR1ayc3iRExYmnhoV44sSshJNJM46+27DD0FYKeOnXWDryXGpEMh611x9YKO/2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39840400004)(376002)(136003)(166002)(83380400001)(8936002)(186003)(36756003)(4326008)(52116002)(44832011)(31686004)(86362001)(6916009)(2906002)(956004)(2616005)(66476007)(316002)(5660300002)(31696002)(966005)(66946007)(66556008)(16576012)(33964004)(6486002)(478600001)(16526019)(8676002)(26005)(53546011)(54906003)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eS9mN2djZTA1YXlxMTlOT1lUS2xIMUxuUEhOakJCcGs0eDBXellGSmVZOFRF?=
 =?utf-8?B?YXVrNEhCRU8rZ0tpK3BFdURkeU9CUE1zZkFjUXVWaEJHaGZCS1pxNzdBRE0z?=
 =?utf-8?B?a3Fqem12dFQrSmcxbHlSazArYzBXR0taYVlPN2ZaYnZZcW1YSzA1UllrUmNT?=
 =?utf-8?B?UllZenduS21LdWhqQ05RbkhPVzFWTGdpd0c2ZVA3dTB1eXVrQXN1WGFpZXdD?=
 =?utf-8?B?RlFoSUNhS3A1YmdBUW9qRHBoYVZmY3Vab1BCMVI5WjNocXBaeGJ0Z2xVYUZ1?=
 =?utf-8?B?WDZIZmRXM3hpQkIxVmpEWThQaW5oZjVyVlhhNFlkUjJtU0pKL1d5T1Rnck1r?=
 =?utf-8?B?dnlLWmtIcTRMT3l1c0hrVnNPYnJra3R6Q2xyNlZsMmRndUxxa2M4TndScHh5?=
 =?utf-8?B?TWduc1dFTkJKMGFQR0c2SmVTZkFWQ0I0cnQwZWlraCs0UmJJZVlyZ2ZDNGI0?=
 =?utf-8?B?cmhiK2FwYzVmeDF6UEJKa3o3U2xESzBhbTVlSnRoZy94L2tMRlVrV3dSRVND?=
 =?utf-8?B?L25YaStKQzU0cUxHOTBRMFY1WXZnS3hOUDFRS0lMb0FKYWNBVWhSOEptWlVx?=
 =?utf-8?B?OXRZMW5WNHVLZTJ3RUxBUmwzb2U2bE0zVU5ublpSMkFnaUhDRHcyTjFPcFhP?=
 =?utf-8?B?R3hkamtFbE9MRHJ2c2dpeHdSc3l6Z2tud1JXdUhIQXJXSW5vdTRkSUJmbG8y?=
 =?utf-8?B?TFU0UCs5MkRKd0JQUy9NaDdRbzZQVXVqaWVGN01uVzArTVJNUDhWNGtrUmkz?=
 =?utf-8?B?YVVoeDBlL3hGaStoMzNESEpQV0xSbmR0THRPd0tsamd2aDQ3bjU1MGFVNTR3?=
 =?utf-8?B?N3lWUlFYRmoraVhaUm41cVM0OEt1ajBiNnUzcmY1V29iTk5xekYyVS8xZzJF?=
 =?utf-8?B?ZnhyTW8rTFpFMlJ1MXkwQWl3UTVaZzd6cUwwVkRUL1UrYXhJWlZFL3pYWkpU?=
 =?utf-8?B?TUJYeElodUJIdGFWaXZRVWNqcHpTR1JneDZZSDloTFdZaFBrVU5pUksyaG1T?=
 =?utf-8?B?QU44UUp0eno1enEzV3RTNkNCL1dqR040azA5cFRhU3Bsa29nb0hMRGFudmNj?=
 =?utf-8?B?V2dNS3NuNjNLWTl6ZWVOQlV4RmRvbmFPNlNpYVdIMDZMNFFmMDBudnZWQUlD?=
 =?utf-8?B?bExjWVlqY1I3TDFFS0hyRGJiOFlDVWFiWEh0ZE1nQjBQQ1hnM1RiTXZiN3cv?=
 =?utf-8?B?MXNvMWJLQXpRb3I1S1ZTQVYwVnA0aTM0RWpaTzlUelRYT0pEWW0xSGpnTEx4?=
 =?utf-8?B?cVk3SnZ3RTFwT3B2NklCeFo3N0pMR05QSjhjRWlQWWoweHZ5ZEMvNC9aSEVO?=
 =?utf-8?Q?Qr3kAJLN+ta3k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2020 12:44:41.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 856d340e-d4de-4f63-09dd-08d8a5ae2fc6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6+MP8sWG4FmT4C1z97FvCm3Z5yzGDlGCcM4O4H7KHHHt69mB0sZG0QILLDjpZxdXtpLDXxWhKmZREkSzHxm4q4f0tgraTP0UJFgQGRzY64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5039
Received-SPF: pass client-ip=40.107.22.126;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_LOW=-0.7,
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

--------------A30AD1B0CFA8E60EB6FDEE00
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.12.2020 19:57, Andrey Gruzdev wrote:
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
Hi Peter,

I have a question about the Wiki page you've created https://wiki.qemu.org/ToDo/LiveMigration#Features.
May we also add to that page/have access rights?

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------A30AD1B0CFA8E60EB6FDEE00
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 17.12.2020 19:57, Andrey Gruzdev
      wrote:<br>
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
    <pre>Hi Peter,

I have a question about the Wiki page you've created <a class="moz-txt-link-freetext" href="https://wiki.qemu.org/ToDo/LiveMigration#Features">https://wiki.qemu.org/ToDo/LiveMigration#Features</a>.
May we also add to that page/have access rights?
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------A30AD1B0CFA8E60EB6FDEE00--

