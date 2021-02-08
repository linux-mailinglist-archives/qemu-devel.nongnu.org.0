Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1474F313DA2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:35:41 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BNs-0006VH-1Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l95Mv-0006mN-DR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:10:17 -0500
Received: from mail-eopbgr10118.outbound.protection.outlook.com
 ([40.107.1.118]:14464 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1l95Mr-0000Ui-B3
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:10:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnkLbwG+dB+wE6uXC+2tCJ4T5stdNsejTsJuoh7Z/jQCW2iZ16T4by0FNkc9+fgk3iHL6vBRZUuIg8ZpL6j04LPj9mwNKFwKir0AhyF1iOqOTJ2h3hq7TfEtY+0NUWZes93MXWLOSpPWJASWQND7rXf64J68wyt13rUvP3EQjIO9XpBE8hz0nsjhjOY5YzaB1cv/+x5lyL6SeGtgvOVtFA+Ygp5Bz7U3V1VYWPu2Bf6buQY3PB9UAjpe4WaD4HNwa0TyfFLLaFHkrI4FxE0TaX2r0w/G9t0LBYDuoKqJjaKL+YKjK18HLuaYgW0cTVxTfGwrqPg1X4xd3cgzXM6r8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WNx+lj69W1vXMCtaemJLGAXQPcp3yLlkY5IRWtGs+E=;
 b=LPxQ0Fqo3fKoDQXGN5AaajA08ilLrsZQheOzv9bNTGPW+g6ia1ugNi38NE6RBeoQ7pq3UcpjuCtiT2bP5lv+e3bAOIGDLVOgvQw1k6HEHurC++++0HwUE1OONq2DnhNKgGcakh57zt15TPlxKcW27x1b3CYtrxkHZZHR1JMjMtypACbfFjqg0bbw0IrhEIlICiDZB6ymJSoLuhbCxpfcz19sq4mAW05z2EJGJ16U2jeFrS2bPiwiIIm2ywtAXVgut+J2QGg1wGYyX0gmpy/zMII73ztg/tF7s0IHI7E3oUAZ2brJCYCBR0HOBKkshMTflLwet/rv/N97a0bmG76Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3WNx+lj69W1vXMCtaemJLGAXQPcp3yLlkY5IRWtGs+E=;
 b=LC2lcZ7JZUl6mAyBEfmToTThsu6TDlQ8lSjj9ACgJpATZb95X21J9Mw4LP4km9iYThr/IdqhtHlgPnowoCaqabo6F6lAr4HX3+vI/mtpNNS/9Ov94ld1de4R2nOyEKFG5sAuosbSWiANIzeu8Li8YMvj1AA4U6fkS+P4A9/4SMY=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB3843.eurprd08.prod.outlook.com (2603:10a6:208:fb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Mon, 8 Feb
 2021 11:55:06 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 11:55:06 +0000
Subject: Re: [PATCH v14 0/5] UFFD write-tracking migration/snapshots
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
References: <20210129101407.103458-1-andrey.gruzdev@virtuozzo.com>
 <20210204150140.GC24147@work-vm> <20210204165320.GA4276@work-vm>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <9f220263-f12b-2104-125f-228ed1f9f0d3@virtuozzo.com>
Date: Mon, 8 Feb 2021 14:55:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210204165320.GA4276@work-vm>
Content-Type: multipart/alternative;
 boundary="------------88AC3F295AC8F58048A6732B"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Mon, 8 Feb 2021 11:55:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d72b303-42d0-494c-410d-08d8cc28607d
X-MS-TrafficTypeDiagnostic: AM0PR08MB3843:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB384377A12E031108AD13BF039F8F9@AM0PR08MB3843.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QXA5F45wDwz5il6YxPjOyYt2ibKrKJRkUTANgCWfDN+Ch0ZoKJg8x2DASsw0iudb900Uo58XGJFHKfSXDKjKjK/HkRaDIiG5BtvJURDdTEpY/TxQmne6pqTr2S21jQsG40m/TqCjN8ytx/o/ZkQj/2zV4XaXMitAVKNqzqJ6WAwtcSUBkFo5mLmRHf0pNQT79aY/N9w/s6+WXOvBiG668i41aL4N3LLn+yxNE+w+0NclHO1Xj222HeAPzGLUYbxfqPjMFdn8neb0jM91W1zND6d62LPMTq3Yq4FXlX92ZrMDgd5pjgbWkyeFeU3egoO4O6UVWUzkF4KpiHrApkZMQLB2XPNThKcjumXjSFmT5XNX44WRZRkmlLyQIJebXxVC5Qr1SJuvJAgfWkonjeFFaApinbhOXVop1JTDKo0zW32JYsTp8jzH/3PuMWMGf2K4cU2ktg7rO0x7Kc2hK0UXWKTuN6cr/0Ecty5X/rhSv62IoMWUjImy/j3DS+ueiRokmYKKkEDs54BYj3lbhyOcQ86unN9KrfBmoJ42+It8bi3vSRYzns906EhZjRxKZmHRAIyQOC8TnvFUfRd14pdgx3sZcB0+Wrg9v5PdKDYELFUcoziyPGQ6KtKtQQklCcoH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39840400004)(396003)(26005)(4326008)(31696002)(6486002)(16576012)(36756003)(8676002)(5660300002)(186003)(33964004)(66946007)(54906003)(52116002)(86362001)(2616005)(316002)(478600001)(66556008)(44832011)(66476007)(956004)(2906002)(16526019)(31686004)(53546011)(30864003)(83380400001)(8936002)(107886003)(6916009)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGZxa3dUUzVwd2FVSUZpdkFRSytTeW9nQVJvc1M3ZUV1blpLeVJQQjRTNmt1?=
 =?utf-8?B?bVkyVlBsaU1vdytHN205ZDQ3dzdFZWYyR1kzYktoVlVHWmdHbmZUcGwyYmJa?=
 =?utf-8?B?bDl4UmVPQng0c0kxaThUTGNZbWtvTUo4SmxaMnF6VWs2SVVXQTFtUE1QaDFs?=
 =?utf-8?B?Q3NsU0YxV0pnVTRrVktwNUt4SkFtZVZCN2EzOWxuM0hzdU80RFZpQ290N1JK?=
 =?utf-8?B?YW9icTVHRGpvR2FzVTlTcFhLMk1OR3RFYyt2MlZZRjd2Z3hGeXpNUk9UMnJt?=
 =?utf-8?B?S21DR09nS2E4QzdWcFlibDExTmVRdnBHUm5EdHNRenhFOU1aUVZkelFld1g4?=
 =?utf-8?B?VnZ5ZEoya3JJTXdzYTVLdVVRSE9oT3hKb0h5dkd1cXQ4bzVNdGdsSGhlVjgv?=
 =?utf-8?B?MS84S2szMjNXaEdYNHIyMXJPY01RMkQyMkpYdjlrWHlRSzNSL2JuMUh4MWVQ?=
 =?utf-8?B?Z1JHZEs0bWgvSGtobEt3NHBFbk5qVlpWTzZjT1FadnAvN1VjUGN0V1JsTisz?=
 =?utf-8?B?RDhIMVlwbVZXMHRBYm52Tmh0TFlOUjFmNWVXTlFWdXdlMjZ2SE9oenJsQ0pr?=
 =?utf-8?B?bVdZa2RiSHpPUzhxNkRySmFRalFZQTdzVURNMXMvODRzdE9YbjIwdFlLUkZS?=
 =?utf-8?B?M3NYOW1IdGFvdVh0TCt3Smg1TUhEY2EvRkRzWG5iR01yajZpUlFrWmZzSHhJ?=
 =?utf-8?B?QndnVTBzZ1RUTzVua2VpYTBmdW1Ub2dZV2xrdHhYVEtNUWFuK05tZnBjanIw?=
 =?utf-8?B?S0IzN1RvUDR6b1BqKzBIc1lLaG5NNWNDQ1ZJeW9QeTNSK3V3NEZpTE9WRnBx?=
 =?utf-8?B?dDdRbFFkYXVTV0I2WGs1RklEVFlqRFVLalZaaEUrcGRFakZsSWJlK3V5UzN2?=
 =?utf-8?B?dml4VnVpSEMvTVYveHdyZWNHQmFxNCtCcmxyYjQ0dEFsQWpnY0hCc3ZWbC8r?=
 =?utf-8?B?M1h2djFIQTRXc0RhVVdyWDNFc1ljbGxtSmVmOWFUNEVyd2lzT01uTndmdHht?=
 =?utf-8?B?N3Z2bzJsMnNiRHlad2RCcHhPeWxhTXFmQk9HQ0xxM1BTNHpaTGdZczhCaVVw?=
 =?utf-8?B?L1BVOHJhUGFVZXE0OWdSbWJjRFRWU2VXdEJ5QjByblZ6b3V4OW45WTd5Y1Jp?=
 =?utf-8?B?RU85MjhIc0xkdG1vVDd1TlZBeUJZa1F6VHdDajdvc2JRQjVkM0lyaFZPMnkx?=
 =?utf-8?B?QzZrSXdFdzAyTis0dmlXRVVlK2FzVEd2dGxxNnZMaVJXbnZRV3R5a1gzZUFW?=
 =?utf-8?B?MitiK1hWelBnNzdQSDIrcHpCck5vSzU4ZFhkVk5zNDlhWVdMWVluOU5lbXF1?=
 =?utf-8?B?NnpCajNFMy9NWGJ2d3ZmYW1LUkFQR0pseHFCay9CbENvRXlmem45RTRsdjZE?=
 =?utf-8?B?SVkwQldpTlJ6VzAzVXNVQm9GcVdNQVg4b1N3VHpoU0VnN3VZVGt2TDlXeUNq?=
 =?utf-8?B?eUpiMzcycU5CeVVPNkFjSFZiaXZ1Rnd3K1lMSWRWNUpCbElMYUMxZlg3M0Y5?=
 =?utf-8?B?OUJiYlk2a01OdVpCekdMN0NGaUY3bndraVkxcHFKLzNSRWNWQ3p6d1k0UFZq?=
 =?utf-8?B?WmZERXkyWmNQVHZCSmdyT0MwUDdPZEpPeTQwckM1NytJSWN5ampxUGlGdXhR?=
 =?utf-8?B?bkxOL0lhZm1id3lzSVJSK3ZJeVdiWEthMzR5d2NUNmU1S2VOTmNuT0pCem5k?=
 =?utf-8?B?YXJveUdSZ0phbnE4M00va3hmRnMrZlB5dFA5QkJBMkdKdTh0dGtpRVdvcFR2?=
 =?utf-8?Q?C4rCMKL3gvFINTVw5gz1EiYknc4ekVuPfKRmyzh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d72b303-42d0-494c-410d-08d8cc28607d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 11:55:06.4593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fm1JHmJN+TeDIwubdTCex4iEm2v1sh7lmm87wDk78rwYq1bLXXoaHnmKwb9rGtsmaiCr3BYRz67+/cWN9dqt7ci8erj1r1v85aoePcQAu+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3843
Received-SPF: pass client-ip=40.107.1.118;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_NONE=-0.0001,
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

--------------88AC3F295AC8F58048A6732B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.2021 19:53, Dr. David Alan Gilbert wrote:
> * Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
>> * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>>
>>> Currently the only way to make (external) live VM snapshot is using existing
>>> dirty page logging migration mechanism. The main problem is that it tends to
>>> produce a lot of page duplicates while running VM goes on updating already
>>> saved pages. That leads to the fact that vmstate image size is commonly several
>>> times bigger then non-zero part of virtual machine's RSS. Time required to
>>> converge RAM migration and the size of snapshot image severely depend on the
>>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>>> creation time and huge image size.
>>>
>>> This series propose a way to solve the aforementioned problems. This is done
>>> by using different RAM migration mechanism based on UFFD write protection
>>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>>> guest RAM content using write-protection and iteratively release protection
>>> for memory ranges that have already been saved to the migration stream.
>>> At the same time we read in pending UFFD write fault events and save those
>>> pages out-of-order with higher priority.
>> Queued
>>
> Andrey:
>    I've fixed up some 32bit build casts in the pull.
> Please check them.
>
> Dave

Dave, thanks for fixes, ok with them.

Andrey

>>> How to use:
>>> 1. Enable write-tracking migration capability
>>>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability
>>>     background-snapshot on
>>>
>>> 2. Start the external migration to a file
>>>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>>>
>>> 3. Wait for the migration finish and check that the migration has completed.
>>> state.
>>>
>>>
>>> Changes v13->v14:
>>>
>>> * 1. Removed unneeded '#ifdef CONFIG_LINUX' from [PATCH 1/5] where #ifdef'ed
>>> *    code was originally introduced. In v13 removed #ifdef's appeared to be
>>> *    a diff in [PATCH 4/5] on top of previous patches.
>>>
>>> Changes v12->v13:
>>>
>>> * 1. Fixed codestyle problem for checkpatch.
>>>
>>> Changes v11->v12:
>>>
>>> * 1. Consolidated UFFD-related code under single #if defined(__linux__).
>>> * 2. Abandoned use of pre/post hooks in ram_find_and_save_block() in favour
>>> *    of more compact code fragment in ram_save_host_page().
>>> * 3. Refactored/simplified eBPF code in userfaultfd-wrlat.py script.
>>>
>>> Changes v10->v11:
>>>
>>> * 1. Updated commit messages.
>>>
>>> Changes v9->v10:
>>>
>>> * 1. Fixed commit message for [PATCH v9 1/5].
>>>
>>> Changes v8->v9:
>>>
>>> * 1. Fixed wrong cover letter subject.
>>>
>>> Changes v7->v8:
>>>
>>> * 1. Fixed coding style problems to pass checkpatch.
>>>
>>> Changes v6->v7:
>>>
>>> * 1. Fixed background snapshot on suspended guest: call qemu_system_wakeup_request()
>>> *    before stopping VM to make runstate transition valid.
>>> * 2. Disabled dirty page logging and log syn when 'background-snapshot' is enabled.
>>> * 3. Introduced 'userfaultfd-wrlat.py' script to analyze UFFD write fault latencies.
>>>
>>> Changes v5->v6:
>>>
>>> * 1. Consider possible hot pluggin/unpluggin of memory device - don't use static
>>> *    for write-tracking support level in migrate_query_write_tracking(), check
>>> *    each time when one tries to enable 'background-snapshot' capability.
>>>
>>> Changes v4->v5:
>>>
>>> * 1. Refactored util/userfaultfd.c code to support features required by postcopy.
>>> * 2. Introduced checks for host kernel and guest memory backend compatibility
>>> *    to 'background-snapshot' branch in migrate_caps_check().
>>> * 3. Switched to using trace_xxx instead of info_report()/error_report() for
>>> *    cases when error message must be hidden (probing UFFD-IO) or info may be
>>> *    really littering output if goes to stderr.
>>> * 4  Added RCU_READ_LOCK_GUARDs to the code dealing with RAM block list.
>>> * 5. Added memory_region_ref() for each RAM block being wr-protected.
>>> * 6. Reused qemu_ram_block_from_host() instead of custom RAM block lookup routine.
>>> * 7. Refused from using specific hwaddr/ram_addr_t in favour of void */uint64_t.
>>> * 8. Currently dropped 'linear-scan-rate-limiting' patch. The reason is that
>>> *    that choosen criteria for high-latency fault detection (i.e. timestamp of
>>> *    UFFD event fetch) is not representative enough for this task.
>>> *    At the moment it looks somehow like premature optimization effort.
>>> * 8. Dropped some unnecessary/unused code.
>>>
>>> Andrey Gruzdev (5):
>>>    migration: introduce 'background-snapshot' migration capability
>>>    migration: introduce UFFD-WP low-level interface helpers
>>>    migration: support UFFD write fault processing in ram_save_iterate()
>>>    migration: implementation of background snapshot thread
>>>    migration: introduce 'userfaultfd-wrlat.py' script
>>>
>>>   include/exec/memory.h        |   8 +
>>>   include/qemu/userfaultfd.h   |  35 ++++
>>>   migration/migration.c        | 357 ++++++++++++++++++++++++++++++++++-
>>>   migration/migration.h        |   4 +
>>>   migration/ram.c              | 303 ++++++++++++++++++++++++++++-
>>>   migration/ram.h              |   6 +
>>>   migration/savevm.c           |   1 -
>>>   migration/savevm.h           |   2 +
>>>   migration/trace-events       |   2 +
>>>   qapi/migration.json          |   7 +-
>>>   scripts/userfaultfd-wrlat.py | 122 ++++++++++++
>>>   util/meson.build             |   1 +
>>>   util/trace-events            |   9 +
>>>   util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
>>>   14 files changed, 1190 insertions(+), 12 deletions(-)
>>>   create mode 100644 include/qemu/userfaultfd.h
>>>   create mode 100755 scripts/userfaultfd-wrlat.py
>>>   create mode 100644 util/userfaultfd.c
>>>
>>> -- 
>>> 2.25.1
>>>
>>>
>> -- 
>> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>>
>>

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------88AC3F295AC8F58048A6732B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04.02.2021 19:53, Dr. David Alan
      Gilbert wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210204165320.GA4276@work-vm">
      <pre class="moz-quote-pre" wrap="">* Dr. David Alan Gilbert (<a class="moz-txt-link-abbreviated" href="mailto:dgilbert@redhat.com">dgilbert@redhat.com</a>) wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">* Andrey Gruzdev (<a class="moz-txt-link-abbreviated" href="mailto:andrey.gruzdev@virtuozzo.com">andrey.gruzdev@virtuozzo.com</a>) wrote:
</pre>
        <blockquote type="cite">
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
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Queued

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Andrey:
  I've fixed up some 32bit build casts in the pull.
Please check them.

Dave
</pre>
    </blockquote>
    <pre>Dave, thanks for fixes, ok with them.

Andrey
</pre>
    <blockquote type="cite" cite="mid:20210204165320.GA4276@work-vm">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate_set_capability
   background-snapshot on

2. Start the external migration to a file
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate exec:'cat &gt; ./vm_state'

3. Wait for the migration finish and check that the migration has completed.
state.


Changes v13-&gt;v14:

* 1. Removed unneeded '#ifdef CONFIG_LINUX' from [PATCH 1/5] where #ifdef'ed
*    code was originally introduced. In v13 removed #ifdef's appeared to be
*    a diff in [PATCH 4/5] on top of previous patches.

Changes v12-&gt;v13:

* 1. Fixed codestyle problem for checkpatch.

Changes v11-&gt;v12:

* 1. Consolidated UFFD-related code under single #if defined(__linux__).
* 2. Abandoned use of pre/post hooks in ram_find_and_save_block() in favour
*    of more compact code fragment in ram_save_host_page().
* 3. Refactored/simplified eBPF code in userfaultfd-wrlat.py script.

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
 migration/migration.c        | 357 ++++++++++++++++++++++++++++++++++-
 migration/migration.h        |   4 +
 migration/ram.c              | 303 ++++++++++++++++++++++++++++-
 migration/ram.h              |   6 +
 migration/savevm.c           |   1 -
 migration/savevm.h           |   2 +
 migration/trace-events       |   2 +
 qapi/migration.json          |   7 +-
 scripts/userfaultfd-wrlat.py | 122 ++++++++++++
 util/meson.build             |   1 +
 util/trace-events            |   9 +
 util/userfaultfd.c           | 345 +++++++++++++++++++++++++++++++++
 14 files changed, 1190 insertions(+), 12 deletions(-)
 create mode 100644 include/qemu/userfaultfd.h
 create mode 100755 scripts/userfaultfd-wrlat.py
 create mode 100644 util/userfaultfd.c

-- 
2.25.1


</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">-- 
Dr. David Alan Gilbert / <a class="moz-txt-link-abbreviated" href="mailto:dgilbert@redhat.com">dgilbert@redhat.com</a> / Manchester, UK


</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------88AC3F295AC8F58048A6732B--

