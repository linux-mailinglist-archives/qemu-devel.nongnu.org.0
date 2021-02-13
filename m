Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83F831AAAA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 10:50:55 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lArZl-0001UI-Af
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 04:50:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lArYF-0000vw-AW
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 04:49:19 -0500
Received: from mail-eopbgr60137.outbound.protection.outlook.com
 ([40.107.6.137]:18216 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lArYC-0003T6-AO
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 04:49:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEWQgnFhIgpd247e7LEYUEsbJdUBn/wBAHIHpyokRKXpef+R4sjC4Gn8m1YwhwQCPohLdnVH/fXQcLGw96MGon4Jiiv95GmOGRrimRvzb5BEeHHQ6lo0b8FL17GCvNDteciPfILIOq6h1LhWvt2kiy7FqvrnTzMMQZ5ch5TOuysDmccKvy4Sr4DdZ4Ottu7X8XfzWKfw49SZqXG4zu9CsU1rNuynumsPwbraovrp+Amw1qp9I6RqOeCdk36SP3nXThd7dIspYe6mYC+rHQD5Rd3aB1fzOjFush+yDF338R3AzqyDGas+kDDpDho5tvUT4bJqwzvOUad0eheQEosSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkLXamy5rttHRgbPS1lnoePC9zTz0TzgGO4CuMH56Qg=;
 b=DLw1qZo9X3d/rHkrgd0krtWgBLKYhHyBagpiH5Yv2B5J79uYj4YPVzqy+/6/z/qIwJNdDeJS4X5WGOCPb7ojtkLEVENRzIodNrpczY2n9M73/Lqmjkx10L05p3VPNTtS0VHwTm9bPi5D7vfnQce+T81pyCP0LSZyTBHZEH3SN/nFhS7uIpH/DWqx668PjOhSEK6MkPanZVyJ6KwmwVjNnMFPuvoyXDO4626I/xyuKEQdk53C1KcAc7ghY2kiEg/Noj+iVsxF5kRDWnCRc9OYJFzY4+soTg3Jd9v5C3IHBrMgybU+uvm4eRQGxlfh9j3eXQffpi24HcD/g8YPhCKUZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkLXamy5rttHRgbPS1lnoePC9zTz0TzgGO4CuMH56Qg=;
 b=FBfR/c/sU+n8o9JQUlJ2nxvVsvBVVXn88KL3CXL8Hojxo2qI+0uw61UabmMmAbxnIbE/7LyEZYOY65lYwupvMpq4MqFjckxL8/ioOw+nqeWDR6uUknsft8RFzUnp2K2Cv6EX/kwTONiyGA6F6eYeFUVotieyiUVY7HIqdENF+o8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB6403.eurprd08.prod.outlook.com (2603:10a6:20b:355::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Sat, 13 Feb
 2021 09:34:09 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3846.029; Sat, 13 Feb 2021
 09:34:09 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
Date: Sat, 13 Feb 2021 12:34:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210212161125.GH157159@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------0C3AEA454C79B6EFC15AF8A2"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM4PR0101CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::16) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM4PR0101CA0048.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Sat, 13 Feb 2021 09:34:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2b870a1-7d72-4e77-ac6e-08d8d00283c2
X-MS-TrafficTypeDiagnostic: AM8PR08MB6403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB640334AA21AAFAC73AFC67629F8A9@AM8PR08MB6403.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUwJtzmR8A4Ch4o2mSo7IM5FMQW8LNKhWm3q7Jbxh7Ll4aDAa+PensocsUXx1dT7vKPnik9X3+z4GSb90oWBX6CO4MSQ215vE7tpPYjN+ZMirwYw56RWDyKjSefbuBdbs9Z/zwffhc7BPc5+6Q6zJUdepQRVPBezONw9R9HfDW6EbqUgH23ZXytMFA5aNWtVuiz1TdjJMkBPHqcLeoM66tmTiwki0ZAKF6VyPeWztSihUeXctNVHga3pYS87xAGMFCFW0PHCoSV84+xuzy9m7Eby1zWwK6L3XHgsGdFwOt3+Kd06et66r2kfl3YZDYClkxNRB7vnKEaE9b6fYhq90/NVb6PcXzE8koLr2I0mZ+tUlScRivijIMCAJQ50h+hh4HEvnCqUplWMv4AwaJSflsVEXofz3LUzaOIAlb2w3HfcY0FPrU6cPjtA+IalXbjzw2As6IAld77RTV207PRw7KimmBAmG6iYDG+NAZitGmSQN/XXsWaK07QFAgV99SyPfYIGnF+zvfLAY0JZfsIn5I+tkhgsGYRa9nZhpnI3NSlhAWDKoFdUaSTnG2LYrzccKjHb78XCCAZEtSfT/NtVVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(376002)(346002)(136003)(53546011)(2906002)(8676002)(8936002)(31686004)(26005)(5660300002)(2616005)(956004)(6486002)(186003)(36756003)(31696002)(16526019)(86362001)(52116002)(44832011)(33964004)(4326008)(478600001)(316002)(83380400001)(16576012)(66946007)(66556008)(110136005)(66476007)(54906003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXlqYmtDYW9TVmZXTlJ2QkxhSUs0bytjVHZTU3VYakJwaXlhakErYTI0cjFL?=
 =?utf-8?B?eXBYb01oQVd1YkRCWmR6T3hzM2RscHlwRURSVlFnelRvTWl1enFmQzJQd0J2?=
 =?utf-8?B?WVZMcFUvSmQxVFh2dDdveFR1ZW5ZMjQyaExzNU5KYjlDTnUwOG1qaGRNK0Ji?=
 =?utf-8?B?bVoyL2dmeUlFWVFzZ0M4T0lwUFM2UGRpcUN0UjhGMWhHRmtFT2NYR3Z0Q0dW?=
 =?utf-8?B?b2NNajlhVXp1VTZVRU5jaHUyTURncGN5WWJCdStscXdHOU1pQnBiMk9ublNP?=
 =?utf-8?B?RFZnTUlMTGUyTHZoaXN5Z2dlbWJWeDBYbmJNRUg5S01sL0Nma0kzelBQRm16?=
 =?utf-8?B?emdUWnFGUWtvT0UrZ3NHcnM5cEcraTRSVVFIRmRmNUxFQ3V6UVdkd0J6RjBy?=
 =?utf-8?B?cnVZaktvL1FEVWFMaHhPN3RNWDNtclh6VmVSRDVremFUaEZpaDF2YnhHSWtG?=
 =?utf-8?B?SjI2THBHK2w1azVrMVhkRUVhT1N6aDM0VkVkY1U1RFVzS25kTkVhdUFGUlJ1?=
 =?utf-8?B?OUxqSm5PZTFIYTVPTUYvMDc1NDVMdGN1ZHpjSDY3c3NqRkRsOUdXejFtekNr?=
 =?utf-8?B?QTFiVExCZERxQXhjQzRvVHhoWGh2cWFhS3dOcFlGUldLaWtMbnZ0ZmZFYnJv?=
 =?utf-8?B?UE00Rno2a09lYTlEcUhKZ1dDVEh2cmYyZDVkN1FEVXZESWcwSkgwUk0vYUE2?=
 =?utf-8?B?WllKYk1SWmZHZUxHZjdFbFEyTDdobkxycC9VWmVyTjJYelJzcSsxd29rYlo0?=
 =?utf-8?B?M2Q3ZEVBNjhlMTZuSk9zUlNnT09lVnI0UEVudU8zZWFseEpqQkFhd2tXSXdR?=
 =?utf-8?B?bFVTL3BDQmNTZXdVdjVpcUR3V3BMdjA4aEk5c2RIMGFqbE9waytvRVVMbXls?=
 =?utf-8?B?d2JxQndheDhVV0Vrb0hFSVV2RlJJenovemJLT0QxbXRoTVNaamJva1FBRGJS?=
 =?utf-8?B?bmJWSmp0WEw1UUlmdHVYZGJIZVk0SUs3dlZkZXZoVEtYdVhaSU1pNFVEL25u?=
 =?utf-8?B?ekZocFRQTEJpelMyU0Z5bk43eHF5eXIycHhNUHFzUC90ZE9IYzJsOHk5NUk4?=
 =?utf-8?B?WnFjNlpqemVDclIrbFlYTW90aTU5Q1dZeURPUC9mdUtRN1lYeEUraFFDNjl4?=
 =?utf-8?B?Ynh2WkpOVUdqc2M5eUlaZG5iOSt4UloxZVlYNkdHZnNFK3ZjR2ZIUFBWanZM?=
 =?utf-8?B?d3htbTVZL2xZZ0FUT3JMV2FiT1VSNHNqdlhvR1J0ZitkYzFRRzE0dm85eXdL?=
 =?utf-8?B?dVNQaGljaE10bm43REJ4VG4yRkIxc25YcURhVWtTd3FyYkRwRHdzajVrcnB0?=
 =?utf-8?B?RUpyOWFuM3RSemdGWnd6MVNuakE0M1ZZMVRQRTAyN25KQUlaU2NjZndWOGV0?=
 =?utf-8?B?amFmVWRKYzNScTYrTHFGbzFGdmkwRlZ5SkpsWmZFbXo2OXpTc0lwYWNmRXFy?=
 =?utf-8?B?a0pXa045VVdHcXpXbis0YllaQmRBSXRBY1dnZWlWWEdqUWtiODhDbHBhaWpX?=
 =?utf-8?B?QXdtNjg1U1BXVHV6RnI2K1g5MjlLWGNZVDZyRkNLT3VNVlJaeU8zRGk4U1U5?=
 =?utf-8?B?S3BOZ3BRa20yaXJ0b3pmekhmLzVyVURwYjRRWFA0cTBlZ3NXdmxJYnFEdG9L?=
 =?utf-8?B?cTFlU3p4Yi9RZWcvNUM3c3VkbkNCSmpTM0EyblFRL3pZYmNHL1BRQ2JiVUda?=
 =?utf-8?B?KzFxTURzdEFGYXBScEI1dFRiRXdlbkxpT0FmTGYzYUVJM3VnL3krSmQ4WWxk?=
 =?utf-8?Q?r5iAIhZimnWRXLWr3KLDelyKllkl6Aj+iUOI03g?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b870a1-7d72-4e77-ac6e-08d8d00283c2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2021 09:34:09.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1GEdEfuZfkGRNmeGBtCTXM3YyhbvWtUTnvOXcI+Ln3JqxT4UHG3j10DIpU/p17iFL5NClRuXkPgwJWEPMNZ6LzA2uY3EJiMALCjtriPKXVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6403
Received-SPF: pass client-ip=40.107.6.137;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------0C3AEA454C79B6EFC15AF8A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12.02.2021 19:11, Peter Xu wrote:
> On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
>> On 12.02.21 04:06, Peter Xu wrote:
>>> On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
>>>> The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
>>> I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
>>> I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
>> Yes, some distros seem to enable init_on_alloc instead. Looking at the
>> introducing commit 6471384af2a6 ("mm: security: introduce init_on_alloc=1
>> and init_on_free=1 boot options") there are security use cases and it might
>> become important with memory tagging.
>>
>> Note that in Linux, there was also the option to poison pages with 0,
>> removed via f289041ed4cf ("mm, page_poison: remove
>> CONFIG_PAGE_POISONING_ZERO"), available in some kernels that supported free
>> page reporting.
>>
>> It got removed and use cases got told to use init_on_free.

I think we talk about init_on_free()/init_on_alloc() on guest side, right?
Still can't get how it relates to host's unpopulated pages..
  
Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
These 'trash' pages in migration stream are like never written physical memory pages, they are really
not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
page is full of garbage.

Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
I think no. Or we need a good example how it can be potentially exploited.

The only issue that I see is madvise(MADV_DONTNEED) for RAM blocks during snapshotting. And free page reporting
or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(MADV_DONTNEED) on
hypervisor side. No matter which guest functionality can induce it.

>>> impact should be small, I think.  I thought about it, but indeed I didn't see a
>>> good way to fix this if without fixing the zero page copy for live snapshot.
>> We should really document this (unexpected) behavior of snapshotting.
>> Otherwise, the next feature comes around that relies on pages that were
>> discarded to remain zeroed (I even have one in mind ;) ) and forgets to
>> disable snapshots.
> Agreed.  I'll see whether Andrey would have any idea to workaround this, or
> further comment.  Or I can draft a patch to document this next week (or unless
> Andrey would beat me to it :).
>
Really better to document this specific behaviour but also clarify that the saved state remains
consistent and secure, off course if you agree with my arguments.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------0C3AEA454C79B6EFC15AF8A2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12.02.2021 19:11, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210212161125.GH157159@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Fri, Feb 12, 2021 at 09:52:52AM +0100, David Hildenbrand wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 12.02.21 04:06, Peter Xu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Feb 11, 2021 at 10:09:58PM +0100, David Hildenbrand wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The issue is when the discard happened before starting the snapshot. Write-protection won‘t work and the zeroed content won‘t be retained in the snapshot.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I see what you mean now, and iiuc it will only be a problem if init_on_free=1.
I think CONFIG_INIT_ON_FREE_DEFAULT_ON should be off for most distros, so the
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, some distros seem to enable init_on_alloc instead. Looking at the
introducing commit 6471384af2a6 (&quot;mm: security: introduce init_on_alloc=1
and init_on_free=1 boot options&quot;) there are security use cases and it might
become important with memory tagging.

Note that in Linux, there was also the option to poison pages with 0,
removed via f289041ed4cf (&quot;mm, page_poison: remove
CONFIG_PAGE_POISONING_ZERO&quot;), available in some kernels that supported free
page reporting.

It got removed and use cases got told to use init_on_free.
</pre>
      </blockquote>
    </blockquote>
    <pre>I think we talk about init_on_free()/init_on_alloc() on guest side, right?
Still can't get how it relates to host's unpopulated pages..
 
Try to look from hardware side. Untouched SDRAM in hardware is required to contain zeroes somehow? No.
These 'trash' pages in migration stream are like never written physical memory pages, they are really
not needed in snapshot but they don't do any harm as well as there's no harm in that never-written physical
page is full of garbage.

Do these 'trash' pages in snapshot contain sensitive information not allowed to be accessed by the same VM?
I think no. Or we need a good example how it can be potentially exploited.

The only issue that I see is madvise(<span style="color: rgb(80, 32, 0);">MADV_DONTNEED</span>) for RAM blocks during snapshotting. And free page reporting
or memory balloon is secondary - the point is that UFFD_WP snapshot is incompatible with madvise(<span style="color: rgb(80, 32, 0);">MADV_DONTNEED</span>) on
hypervisor side. No matter which guest functionality can induce it.
</pre>
    <blockquote type="cite" cite="mid:20210212161125.GH157159@xz-x1">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">impact should be small, I think.  I thought about it, but indeed I didn't see a
good way to fix this if without fixing the zero page copy for live snapshot.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We should really document this (unexpected) behavior of snapshotting.
Otherwise, the next feature comes around that relies on pages that were
discarded to remain zeroed (I even have one in mind ;) ) and forgets to
disable snapshots.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Agreed.  I'll see whether Andrey would have any idea to workaround this, or
further comment.  Or I can draft a patch to document this next week (or unless
Andrey would beat me to it :).

</pre>
    </blockquote>
    <pre>Really better to document this specific behaviour but also clarify that the saved state remains
consistent and secure, off course if you agree with my arguments.

</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------0C3AEA454C79B6EFC15AF8A2--

