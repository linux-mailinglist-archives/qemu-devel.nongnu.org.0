Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF9318FC0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:22:01 +0100 (CET)
Received: from localhost ([::1]:43240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEjA-0001Ke-Hn
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:22:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAEh9-0000Gn-Ry
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:19:55 -0500
Received: from mail-eopbgr80114.outbound.protection.outlook.com
 ([40.107.8.114]:12556 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lAEh6-0004VH-Ao
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:19:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G4QQF4SfkUV/wWyN3B/mM7pO8XgmT3rY1b7LEiOamZjm/HSw58jkSSLVPBFL5G/XxJoMyNXsBIF5wwTjZWX91RkjD9vj+HekNt//bijDTuw6ITb5CzHLeZTSYixMKydrl4sZRVq5xOR+2OeUwVTF4nbNqd1MbaDhCNQJ3XpWH0fy50nyp70T6hlw+eld2ibXyqg/B3yEmY13BzyV8gO34VFAiZJ1W6qQhtlA+Ebb/ELY3OJbFDdnCsUMFFVA3pCM/2J8kcUpkmFKj7M0pyihIolZIYgS7NQlkofjh4nDJmsLXWIE2H6c3D6YnMy3q3K72HyA0uUWXniYv428SsMI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QeB4QOjVxDr4r0R6tfqgU85ssBggOfC57Im9gopcV8=;
 b=dU8EbsYHkqVrjrxTBalzGkEjfvjOAyqDP8V3J96CAn2oJ+4WN8gu+u0aaf57lGvXSFY0oONBKGUstR/isXLquHB0aMoO59ooAesdifUiUNVG6vIe7+9AEEm7L0GfKBOAm+nIzidr0aAFpK00rQK0z4cLYN4I1Bou2JpWB5SGGCAPPeW5mJUTZUm+kOfUSeV/RGqTuOkSLV2p5pGT/boS7SSQNVOZbinFsgTOupaEp4It88FZFZOb0zfbZwcZRZXVhOrOjtbiov0FfxWFfS1tQ1fdhk3x/XwkX/RCDKOGS4G3Zscp3kkWHCZvnwe6wtdfCpONbhkz6ItkL2/CCNwSTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QeB4QOjVxDr4r0R6tfqgU85ssBggOfC57Im9gopcV8=;
 b=PVXzYbs+2j9TLabl08swdhtoTCpNJVVLs1JXQh5xpHkItcPcVvdik0PhWERFYC1Py3qpA2nNE+BdBAqNnmVkNR3z1cPjh3bogQ5U1Zd3LeCcee5yQGfnnXvRGwKGVDlQe7SI+b/BI3xZnAb86RBFh4Cq23r40EyOX8zO86gQGOs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com (2603:10a6:20b:47::32)
 by AS8PR08MB5958.eurprd08.prod.outlook.com (2603:10a6:20b:299::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 16:19:48 +0000
Received: from AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119]) by AM6PR08MB3366.eurprd08.prod.outlook.com
 ([fe80::981a:7a52:b412:d119%3]) with mapi id 15.20.3825.030; Thu, 11 Feb 2021
 16:19:48 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu
 <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
References: <20210121152458.193248-1-andrey.gruzdev@virtuozzo.com>
 <a88cb0b2-86a1-04b4-3ed1-d032850040df@redhat.com>
 <5d01402e-273a-53cf-b78b-b4b7f50340bc@virtuozzo.com>
 <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <d7dcfbf8-8f33-065b-47a9-802952732218@virtuozzo.com>
Date: Thu, 11 Feb 2021 19:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0e155a86-6cae-8ce4-676c-a06ee87b6f43@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM8P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::19) To AM6PR08MB3366.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM8P191CA0014.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.27 via Frontend Transport; Thu, 11 Feb 2021 16:19:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 652431fd-0dbf-44e4-acb1-08d8cea8da2d
X-MS-TrafficTypeDiagnostic: AS8PR08MB5958:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB59587E90DB343F891808A7079F8C9@AS8PR08MB5958.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q6Si/t7pnRnzx1IlSyngdBB+T1UwWEAw4AIst31Bi6k+piVDrXFWIkTlz2d4WC4Ezg3sB77ZETOrhbx6/rRGtQQlu1lkRHltOgQlIujeltfJ17UJm7wP4tZr6y1SC3M00CjG3rBIAvxg9qlo8sD44K/CPacBj4stA2AlPA0/vRT8cYLXsWeZ2us7UhzJszHgK5OTIKTV9Z6ficOFGdWDnB/mmRLWvHBefANpS9wl0Dem11w2NwUkHIHqXOAUo5get6rknPqe0VQFItugwHkRX56Oa3nmjpjG1MRiCKTa0x1MrH72rfcahXL9r+bQln2izxwzkdNpY7wwcawEkSCmJ+GdVLn3CbbIwvJWJlCaA2u/bbk1hU4wYhFHhevS3WM+l/k1e8dIj365ih40pMkRPOrA8cUESs41t6pqgN/R3bwvGfx6O7ioD42HWkGDmloWNfe/igB/iKA9LTOFdGQDDSjBQVC6mIxnPBHBbFWju3lSW9BjellY/ORhB/P7o8lbP8DhEUqezkeEjzLcDYY8jQSZ2v2e6rlzA6cwFeJXS4pEOrwgoeftZ2566MD8q5rAR3EGN3/h4xlY91rEgGjIyr/taL7bhkyGlTxXOp131Ns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR08MB3366.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39830400003)(16526019)(8676002)(186003)(66946007)(66476007)(4326008)(2616005)(86362001)(316002)(31686004)(16576012)(8936002)(54906003)(31696002)(6486002)(26005)(66556008)(44832011)(36756003)(5660300002)(478600001)(107886003)(53546011)(956004)(52116002)(2906002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHdFZWpUUFFZaVFmUXlPTmUrQWZzdnl1V05OaG1xeEQ3UC9SYXlkK0hqdS83?=
 =?utf-8?B?UDdiR0xGMGZVd1RZTzRzbXVYQWgwTjlxRHBuQUVFMDZySExESXlUNXNZTWFG?=
 =?utf-8?B?dkdySjd3MUQ2enR3c0NDZTg2c2Vvb3BKYUR1QlNveXE2OUg5TXZ5SEhhVnRn?=
 =?utf-8?B?YmV4b2hlVnZVbTFEU0NYY3JXeEtMN2JSWXlFajF5NisvZlg4aGVVUW5hSXFC?=
 =?utf-8?B?S3ZKOE5ESk1MWlcrcm45WVU2MXVQditvcklGWmg5NFZWRllRMkJVRGNjMDNV?=
 =?utf-8?B?akx1cHF2ZmVHdk1NY3FEN1U0MWdUQXV3MDhVcjdoa0tldVJXdEczV3ZmV2Z6?=
 =?utf-8?B?R2Vsa3VvcXdKd1JIMVd2ZDFyNUVJRVo2NzhhTVg4VDhEY2hzMW4xVTRkZnBT?=
 =?utf-8?B?eFE0akRsdC8wLzhHb2E2SjZRMW1VY2FRN0pPVnVCNEhXTytmaFEwNUkxSDVK?=
 =?utf-8?B?b0w0Z2dNbzRxNmlYRzE0Rkd5ZjdRS0srYUNPc2F4WklhZFpLV2tadDdwV2lL?=
 =?utf-8?B?WkZzRlowaVh1T1hLeXpERnd3Z0U2dENJTTZ0K3cwMVY1aUh1c3p1cW5xZXBa?=
 =?utf-8?B?SmQvM3dadkNxQTNuREpSRjZ2SFJxS3pyZ0tGVU1YcnVYQ3FMMmQ3REE0Q25o?=
 =?utf-8?B?QlhwVW12Sk13cG43V01la3dnWGxrR3hSeDZyWXJsbTlxYU9CWlZYTytlcFAr?=
 =?utf-8?B?Tm50NHByR0ozdTZFVHlsV0w1T0ozdXpxdWV0b0hnUmVBR1BOWDZSalNtcVNv?=
 =?utf-8?B?NUN6WkluOTFNZjlPVmJIbHEwMEdaWTAwOGQxSWNjU0F6Zi9NdkJPY0hKVE1N?=
 =?utf-8?B?VWQ4bTBGVjBrOWRGaEVzQlVHMUpYWU56d0tUQUJ5Q2h1cFFWZjRraExHTGdE?=
 =?utf-8?B?dFhPVlN4blQrZENSNnNXYk92UkJsZHFna1paN2lVdDZHYUt5SmJjMW1JeU1y?=
 =?utf-8?B?YTRmYmZWRHpNb3VTUGEwaE1VeloyUkREbnRUbjZvNHhuQ3VnVWJhMzZxT2Y0?=
 =?utf-8?B?aWRYVFhCNGtreXcvVkQvWjc2WXduQy9pNXdwZ2lGcG1nRUFzS0tOUGE2aVBL?=
 =?utf-8?B?dmJkT0R2L1RxR1Z2aURONVdWcDhPNGtPcmVJR2RGVWNQMmc4bW9EUmlOVzVO?=
 =?utf-8?B?T3EzS0dZZjRCbmF0K0VkWko1Z0p0SG1rM1A5b3kwdWl6RlNaV1ZUZ21MWEQ1?=
 =?utf-8?B?Zk56WkpKRlNMaFhyTVlrR1d5WkJ6cGRPeGVwNDJBVE1SYlp0d2lXakxJbVZT?=
 =?utf-8?B?d3hEc0I3bndoUjYvWXh4alUzSE9sQXNSMnhVY3JPQUhYNHVkSEpXbEZFNVd4?=
 =?utf-8?B?UTVpTTZoSHF2Qlp6VmFvVlp4VjN3L2VLOURjOWIyaTZySWluWUtBZVR5bE5r?=
 =?utf-8?B?WUdSdzNmcTlvQmNCcjRrK0RaNEtuOVdHc1ZCVHNEUVcrL09KMEx3SlMyRDR0?=
 =?utf-8?B?SjZyN1hCajkzUjVRT1JOYXprRXlTWUtvZVkyOEJGZTRNd2xiazg3NkNUTjdr?=
 =?utf-8?B?UFplZDNEZFpJSGVWd0dSVnpQbEFYOGdIR3lwVHVaUDVMU0I5dU8yb3l6M3Zw?=
 =?utf-8?B?ODRtakhDRXNITVVBS0NSS1ZrOGpwNXFsbnkwUmdtZW9ISGtDaUM4RUxDWkFV?=
 =?utf-8?B?NDhxOTIvL2F4T3l1dUJnTVczclVObmNvNGE0ckR0NFdoTVpDL1M4cGZDbnp2?=
 =?utf-8?B?Vk5BbTEvbkgrTng3WXRVUWdIRGs0V2Zsc1g2WVJQQ25uQ01PZUVFaGNsSTl2?=
 =?utf-8?Q?HrpgIDM5cIdGBk5bgrcATa8yQkMXQoIJTnCT8wJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652431fd-0dbf-44e4-acb1-08d8cea8da2d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB3366.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 16:19:48.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r65nz7VJG4D232wfCeD2v/z3IvUoyA45C+kMBCh815bXIOwV2XYseR6wrD7F2qC9vhnMd/mnYw1C9MBTpt6ZoOjt/I0vfWnkqRLW9OOstmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5958
Received-SPF: pass client-ip=40.107.8.114;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7,
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

On 09.02.2021 22:06, David Hildenbrand wrote:
>>> Hi,
>>>
>>> just stumbled over this, quick question:
>>>
>>> I recently played with UFFD_WP and notices that write protection is
>>> only effective on pages/ranges that have already pages populated (IOW:
>>> !pte_none() in the kernel).
>>>
>>> In case memory was never populated (or was discarded using e.g.,
>>> madvice(DONTNEED)), write-protection will be skipped silently and you
>>> won't get WP events for applicable pages.
>>>
>>> So if someone writes to a yet unpoupulated page ("zero"), you won't
>>> get WP events.
>>>
>>> I can spot that you do a single uffd_change_protection() on the whole
>>> RAMBlock.
>>>
>>> How are you handling that scenario, or why don't you have to handle
>>> that scenario?
>>>
>> Hi David,
>>
>> I really wonder if such a problem exists.. If we are talking about a
>
> I immediately ran into this issue with my simplest test cases. :)
>
>> write to an unpopulated page, we should get first page fault on
>> non-present page and populate it with protection bits from respective 
>> vma.
>> For UFFD_WP vma's  page will be populated non-writable. So we'll get
>> another page fault on present but read-only page and go to 
>> handle_userfault.
>
> See the attached test program. Triggers for me on 5.11.0-rc6+ and 
> 5.9.13-200.fc33
>
> gcc -lpthread uffdio_wp.c -o uffdio_wp
> ./uffdio_wp
> WP did not fire
>
> Uncomment the placement of the zeropage just before registering to 
> make the WP actually trigger. If there is no PTE, there is nothing to 
> protect.
>
>
> And it makes sense: How should the fault handler know which ranges you 
> wp-ed, if there is no place to store that information (the PTEs!). The 
> VMA cannot tell that story, it only knows that someone registered 
> UFFD_WP to selectively wp some parts.
>
> You might have to register also for MISSING faults and place zero pages.
>
Looked at the kernel code, agree that we miss WP events for unpopulated 
pages, UFFD_WP softbit won't be set in this case. But it doesn't make 
saved snapshot inconsistent or introduce security issues. The only side 
effect is that we may save updated page instead of zeroed, just 
increasing snapshot size. However this guest-physical page has never 
been touched from the point of view of saved vCPU/device state and is 
not a concern.

Often (at least on desktop Windows guests) only a small part of RAM has 
ever been allocated by guest. Migration code needs to read each 
guest-physical page, so we'll have a lot of additional UFFD events, much 
more MISSING events then WP-faults.

And the main problem is that adding MISSING handler is impossible in 
current single-threaded snapshot code. We'll get an immediate deadlock 
on iterative page read.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


