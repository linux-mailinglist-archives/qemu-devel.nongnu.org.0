Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014152FF1D4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:27:36 +0100 (CET)
Received: from localhost ([::1]:36530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2dk7-0003rV-1K
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2dYt-0002nS-HX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:15:59 -0500
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131]:40337 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l2dYp-0006XE-9e
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:15:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZd0SLG1IlWWrlcQPjjDikOkZyvk+QZjTD2r/mrQshhGbX9fWKTsHcBayIyshrN0LvePDEkvU29xJ0hukdumX2Y+/KYUnEfVo96i+05VlHbpxSj+veRbrj8wkp7NrFb5dkOr10y/w5gYRO0Wl/k7SCKOY8wrGQRGdYCQVb66S652vGaY0uSQG7qt+mP060oXThe+vAi08I0KRO1ApWldGEes/n9CROX+kjk9xVmrzslTJ0e46Kq62YseKfvvLL/n3QCzllbn5entAp2m6eqbpQGDjjCLS9PW5rFpE2F+mRC0WQdZOqomxS5mn1FNr8PpBMUIl0Tkl0QhcBC08IGTYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcKzfJk1XVEeLEefLJliHQlOWlj63d5T6ANdlEhxDqY=;
 b=EVp61sT/C9CMlw2vSRzXcCdxAOzbKlttJwbjhXHHhf7JTE9bx3peeodRvRXNKSCLduQE3p8Mq9UT1X4AXIYVqigO4YCa74V/73QdkTmpV5kOA82PBiIJzH5oKBa/KRZKpjY6SQULiCgwWUSxxZEDh799j/YxkKAWOzXFck66GFB2EbwlHauVzEqXmdiHjZL0DqKT8OnzdEv9q2yADE3Is82Ry6jppDknEZ28VQ7Oj0FeTY+PxvZ1KSVZkDwY+ET2DpVDZpcWD0O9PoErvQC/rWBrPrlT2NGIpHtxo6SCPWOx5hWHgU2LFb7v9Fw5EBpK/EaWJDPF5nJWxWuUhaL1GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcKzfJk1XVEeLEefLJliHQlOWlj63d5T6ANdlEhxDqY=;
 b=nRPBN8FVsMS6ugVRzh0TRNp0BoAENqQws4mPLw2XhgwG6AtuPuJjJ1JRBQZ9ZbCQ+A1bkjM344YivXNL6h5N0HM2FpkvySxs09Jp6j2p2EBwXtDRxk/K4VgAmD5rcoHMLsVj7oAh8YTKKmI316BE0UG2VqHnNyYRT2nOJNyEw98=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4276.eurprd08.prod.outlook.com (2603:10a6:208:13a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 17:15:51 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 17:15:51 +0000
Subject: Re: [PATCH v11 5/5] migration: introduce 'userfaultfd-wrlat.py' script
To: Peter Xu <peterx@redhat.com>
References: <20210106152120.31279-1-andrey.gruzdev@virtuozzo.com>
 <20210106152120.31279-6-andrey.gruzdev@virtuozzo.com>
 <20210119210122.GA215736@xz-x1>
 <b51af344-856a-cb27-5aa8-c25e6aaf536e@virtuozzo.com>
 <20210121153722.GC260413@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <5c9e3a39-c6d9-e983-3e68-a8cd3f8af53d@virtuozzo.com>
Date: Thu, 21 Jan 2021 20:15:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210121153722.GC260413@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------F9BA0E299D9242BAFC12A204"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:205:1::22) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:205:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.5 via Frontend Transport; Thu, 21 Jan 2021 17:15:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b00266b-af30-4e7c-73b8-08d8be3033e3
X-MS-TrafficTypeDiagnostic: AM0PR08MB4276:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB42760CD4CCB990390AD0003D9FA10@AM0PR08MB4276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ghXrdUL2INpVkHGYHm1W9Q3mGi2kxYABT/glOgkB1OnAKjgvL9V2rMpD0QRWqFB6LItgXqR6QpknNSSmr6MzAL0+Vtz26tNK8Wl3GmSMiK8A5EHU+JnEoXk6W0NxvFZcXPhPmigGu/y4c9I2wQnpXhY9S1Jh56vg5jjyrfCiJv7c63R0uWfzYS+KjIhPstjGPYrKBG00ZgRrzOAgWH6DAhPp8zV8TzEoxApr1c4HypFcHeZ0liOswiq7oT4VBfe5AMmU9ak9PS1vXEHZqDBwDorVoMNlB2C9Cd7AxacBayZBTvybNn3F/irAzqahqdkc9uNiUriOr0sKKoY3Sja8X5fLoNWxMTziFmsWJPbC7sG6MzAiGEVHhEV+LdGjnZMtuYSWFlNskCoKxYCaq9kweYYh6fgI4sSB9OUtrUOMLIT4CkJb24gCM/pyJ73Gd3qXtLq0FtlP8hdwKajLY/lFOMWj6JUi9q2GPi3/DNjwtOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(136003)(376002)(396003)(31686004)(4326008)(86362001)(2906002)(6916009)(8676002)(16576012)(16526019)(36756003)(33964004)(8936002)(316002)(5660300002)(44832011)(956004)(31696002)(52116002)(83380400001)(66556008)(478600001)(6486002)(53546011)(186003)(26005)(66946007)(2616005)(66476007)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RzRqK0p2UWhhWktjRHRyUUxKbVo3Ymdnd1YyMGJkb2wvNnV4YmJXajkyNUxj?=
 =?utf-8?B?eHdMZjFHVURodzlJZUJRdjdZOEw5YlRKeWU2d2lzMEtsbWRUZkdRa0hrZklV?=
 =?utf-8?B?eUxBUDcxMDd5NnFXUy9hQW1uSUI1UUxGb1YvMjBPOHkwK0lRSCs4UldNZVVz?=
 =?utf-8?B?b0ZkZlpKcXJuSUVkcCtPVGF3aUJJNHk0M2xubTFDWHZvMzJORlVZOGl4OFZt?=
 =?utf-8?B?bjhvamlVVXZNZm12TXRqazlhRmhnWWcrbkNlbGFNUDR4emZuRFlCTzJkcGJ6?=
 =?utf-8?B?TlVEL1ZUVndYVlBWcEkyd2dudFJMaTZQVm0rVndyRGFSN25uZEhoNSs5SFR6?=
 =?utf-8?B?UTFyL1JVc3ZqUXV3QWVzTEpsVzFRbHdVeHoxVTVhMW9vSHh1STNiendiYnJ0?=
 =?utf-8?B?MTNMbmNFTUQ3TE1FMDkzaDF4aDZIVEhOWmFSUlMrdXBmOEtvU2ZwU1d2ZU1N?=
 =?utf-8?B?OUh1cXlpSjc4QklYTHV6VE1PQ3RTRzdIY3J5ZHh2TmNRWVNsaUlkQkFSK3M1?=
 =?utf-8?B?N3VPcnN3TnZqTXVsWno3bXhlVm5XcVpoaFJ1bW13ektzUmkrUUxZVmNxa242?=
 =?utf-8?B?QlZMbUdsSENNNktsWkJiRVVJSHgzQWVVRUUycEFzVVVSUU5nM21FMHpzSDR0?=
 =?utf-8?B?VjU2dE5nWitPUlEwSlUrRUhZOWhiUHJtenVCRWtaM0RuMldiOWNGQ04wZTJY?=
 =?utf-8?B?aGtrRDVYZ01kcFhoVnlmTzJMbDIyM2kzWWpUU09MdGkrT04xcVBtWXIwNFVG?=
 =?utf-8?B?M0x1OEZnZlpJVzBQNFdMb2R1d053UkhaWWR5U2VPUGg2MWFjOUJJVzd4NkxO?=
 =?utf-8?B?UTEyQmRqYzcxcStURnV0Mmo5dVhtL2ludUYrZDBCRkpXYUhVbExOOE9HS3Nk?=
 =?utf-8?B?K0NwYTVaNlNqb2NUdFQ0SnBjVDBaZEUwcW4wNjNzayt2SXNXUHFkK3htWGtt?=
 =?utf-8?B?d21SbG9kOXZxRHJrZmVQTGZGcGZiTTZrZ0t6TWRZK0xMdHNOS1NCbElmUUl3?=
 =?utf-8?B?VmFmdXZsTG9zNmhpMG4yU1RiS1d1alR1KzdkTTY4c3J3RjMyNXFHNUJqNDdr?=
 =?utf-8?B?REJpd1ZjbExXc2UyY1JKM3ZiV0hZbUZ5ZkUxc2dheWNNMjlrZ0w1Zm9wM1BG?=
 =?utf-8?B?OUMrTklRblFKYXIwNktKNitBUk5nNEIrNDhFUkk2N2FqNkM4OVV6NXNKc01I?=
 =?utf-8?B?TlRzNGtIZFFKRXJEU1JEU3U0cDhLazZ0S3RaMjhhSHdQZzY2UzB6dUtuOEc4?=
 =?utf-8?B?ZThjS01YaVB3anlVc3I5UHh5K0Eza3BreWRCZ0k5NHNReWpKVHJjenlpUTVG?=
 =?utf-8?Q?6i3cwZR3H57zc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b00266b-af30-4e7c-73b8-08d8be3033e3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 17:15:51.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 916YM3P2BcU76gBJc3cq1athq2F8+jOasUG9K3xSViuTUKxOgDL91b5sK23EN5b4EH+lDCkoNb3+U5h6GulnM4kne+Fi9fUyJajFFaBHQRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4276
Received-SPF: pass client-ip=40.107.8.131;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------F9BA0E299D9242BAFC12A204
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.01.2021 18:37, Peter Xu wrote:
> On Thu, Jan 21, 2021 at 04:12:23PM +0300, Andrey Gruzdev wrote:
>>>> +/* KRETPROBE for handle_userfault(). */
>>>> +int retprobe_handle_userfault(struct pt_regs *ctx)
>>>> +{
>>>> +    u64 pid = (u32) bpf_get_current_pid_tgid();
>>>> +    u64 *addr_p;
>>>> +
>>>> +    /*
>>>> +     * Here we just ignore the return value. In case of spurious wakeup
>>>> +     * or pending signal we'll still get (at least for v5.8.0 kernel)
>>>> +     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
>>>> +     * Anyhow, handle_userfault() would be re-entered if such case happens,
>>>> +     * keeping initial timestamp unchanged for the faulting thread.
>>> AFAIU this comment is not matching what the code does.  But I agree it's not a
>>> big problem because we won't miss any long delays (because the one long delayed
>>> sample will just be split into two or multiple delays, which will still be
>>> reflected in the histogram at last).  Or am I wrong?
>> Mm, not really sure about comment.. I need to read kernel code again.
> Not relevant to kernel; I was only talking about the last sentence where we
> won't "keeping initial timestamp unchanged" but we'll do the statistic anyways.
> Because exactly as you said we'll get VM_FAULT_RETRY unconditionally while we
> won't be able to identify whether the page fault request is resolved or not.
>
Yep, agree. My point is also that trying to get timestamp of real PF resolution is
complicated and not very reasonable since a sequence of softbit and hardbit modifications
to the in-memory paging structures occur, not immediately reflected in particular TLB entry.
But for our statistics this level of accuracy is OK, I think.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------F9BA0E299D9242BAFC12A204
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 21.01.2021 18:37, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210121153722.GC260413@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Thu, Jan 21, 2021 at 04:12:23PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+/* KRETPROBE for handle_userfault(). */
+int retprobe_handle_userfault(struct pt_regs *ctx)
+{
+    u64 pid = (u32) bpf_get_current_pid_tgid();
+    u64 *addr_p;
+
+    /*
+     * Here we just ignore the return value. In case of spurious wakeup
+     * or pending signal we'll still get (at least for v5.8.0 kernel)
+     * VM_FAULT_RETRY or (VM_FAULT_RETRY | VM_FAULT_MAJOR) here.
+     * Anyhow, handle_userfault() would be re-entered if such case happens,
+     * keeping initial timestamp unchanged for the faulting thread.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">AFAIU this comment is not matching what the code does.  But I agree it's not a
big problem because we won't miss any long delays (because the one long delayed
sample will just be split into two or multiple delays, which will still be
reflected in the histogram at last).  Or am I wrong?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Mm, not really sure about comment.. I need to read kernel code again.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Not relevant to kernel; I was only talking about the last sentence where we
won't &quot;keeping initial timestamp unchanged&quot; but we'll do the statistic anyways.
Because exactly as you said we'll get VM_FAULT_RETRY unconditionally while we
won't be able to identify whether the page fault request is resolved or not.

</pre>
    </blockquote>
    <pre>Yep, agree. My point is also that trying to get timestamp of real PF resolution is
complicated and not very reasonable since a sequence of softbit and hardbit modifications
to the in-memory paging structures occur, not immediately reflected in particular TLB entry.
But for our statistics this level of accuracy is OK, I think.
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------F9BA0E299D9242BAFC12A204--

