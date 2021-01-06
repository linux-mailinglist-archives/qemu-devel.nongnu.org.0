Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040ED2EC09A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:42:56 +0100 (CET)
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAxa-0008Vx-QD
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:42:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kxAq9-0001iP-P3
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:35:15 -0500
Received: from mail-eopbgr30136.outbound.protection.outlook.com
 ([40.107.3.136]:14656 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kxAq4-0005ZS-MS
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:35:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPg5kxE2wpbvoQXNUPXSN5/aJK6b0Lp7TY/6KGPqeCLf6H1VUGqK/NG4Mcy2aD/L73vL5GqXO2C2WFeJEYSC0/pc756KoPpqIDEYkvml37C5C53Oyv9Rn5lAsP50jsWXuzkXsDVMMBQeoToqUQUpI0OFLOIr/7DedJJRl//ffYOhXH+Lvg3jRW94OHjkNEtmqNOlaPsXgpU6DDAjq838I8WA/nrFceZQDZvv3C+tRAon8w9H9uFsCJGvMv0FnLudqkSCFK3BcV2wKZbkSa2BwkPxfeAfui3esWeqmMcxLp8OqbMhrK17CjO8KfUQQ6T8sceOPi0+iGMEcJUlCxNsZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYAHfDTu64nTvu8Xbw8X4a04pg7dZiV+m9cvsQfuDdc=;
 b=hE/506zbVMd+LtjXk0LtyLkjDQR+M2lWGunca3loV8DytPonCyqss2+RVxtwbnlcPVO1ImNr3F9F1zhvkPfAHe6o1M5++GkkDCfhkLlaq+5UPWcW+SLkGy1HsTZZegDm9e2WSX6r8pu4BfZjGXdVeNW3u+lqjAjUvzlgvMAaL1xsJMCvqNfOi6N2laXqjrf4NhJmIgwiKo+0m0MUt3+8YSqYRX1qhLc1k727dOg5+btyIOP2xpGQ43g5kOXyQW2nxDaBEEYIOuy2++UgFqGBf6u9REiJMczjtoNKA5DkRG+qzXunDfw1LwOiDfFOGZejrOPjQTouTuVkiX6TLBfvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYAHfDTu64nTvu8Xbw8X4a04pg7dZiV+m9cvsQfuDdc=;
 b=tM+aVZopfnOUegEhM71IywHSvRYKt2oQ/whsCcArMpkkyey+G3tXQda3mDPbOFQ9a1UmG1sjzpAGmho685argvJ1X5fW0WuzKPUfbPYhfsBwOfdXKMzAWgrV4oBwEaO0Uaea80iZNvfM8YWjbW+zxg9MhXD+dWBHtJ1SvP8ADus=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM4PR0802MB2369.eurprd08.prod.outlook.com (2603:10a6:200:65::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 15:20:01 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::c0d3:5f7b:232a:b951]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::c0d3:5f7b:232a:b951%5]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 15:20:01 +0000
Subject: Re: [PATCH v10 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
References: <20201217165712.369061-1-andrey.gruzdev@virtuozzo.com>
 <20210105193658.GE149908@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <f0ca585d-8494-f8fa-6b1b-2ddd817141a5@virtuozzo.com>
Date: Wed, 6 Jan 2021 18:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210105193658.GE149908@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------2B4CFAA0CD729A20B8E2B64E"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM4PR0302CA0003.eurprd03.prod.outlook.com
 (2603:10a6:205:2::16) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM4PR0302CA0003.eurprd03.prod.outlook.com (2603:10a6:205:2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Wed, 6 Jan 2021 15:20:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca42ce7f-aa2d-4f85-9d1a-08d8b256897e
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2369:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2369B0E896E0042502821E029FD00@AM4PR0802MB2369.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +r4/U6g33t4CaXofyRV4voCYe/CwNUFKlr1Sr40HsFLZ3B45uL7Lc1FXa0REqidm0VUWjz9XcoxYXKxe2glekYrIPJMjrnhVq8AwEvTjZJpHANd1+pGADjikXzDI5O6AS0671iueKuWzvZxMQDR/U8t9ymz44i6zhFhNnZbsU0tDdpynA2vdVBD5AbSu0kbWzPpQaDu308+jvqXIyY+PvSBYrvt8HdESqwANXc+BCCcaG2ZsN7+I3o4D1e9iOc+T00nZ4qlQby2rE3ggJgQxwXow7XlZVpJNqAZoZT9oi23h/m6mwtXdNI/GB+3A1aLZ7NvP8WYjNftJuT8yJCsGGAYJRsKh4gBJaD9hhY3GwszHIGwpzYdTufKysiVsaIlS3XE+FiaZUzu0c7u/ClXfQgx81RGCyrUL4qAwoa5jxuGdcLooNH/vHwTZA6TGywAXA2w6Cx4uDMmWf+ohbW2/zL9K0jf9aPF0l+uCAKt2MaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(2906002)(16526019)(66946007)(36756003)(5660300002)(186003)(8676002)(83380400001)(33964004)(31686004)(4326008)(53546011)(16576012)(316002)(52116002)(31696002)(54906003)(86362001)(66476007)(478600001)(110136005)(8936002)(2616005)(66556008)(6486002)(44832011)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHNSemNUK2RzVXo1OE5TbENTc25LVlM2RlhGUVhrbmRHWjJmS3htalMzMjZF?=
 =?utf-8?B?dEhYU0xxaXJYWUxycG1IZUNJa0E1ZE40YVUxZE9UdkxUYnd3cFdkNHF4cGNz?=
 =?utf-8?B?aGJxbnRsd2lzMW5PeDE5bmtydjQvZWY1dXFncncwZm9zaTlnbklRTzVEYUVh?=
 =?utf-8?B?RE1DNVZGVFFCbGUzdWppMzJHUE1nUnp1d0lyMGlBRDgwRE94ZHU5Rld1c1JJ?=
 =?utf-8?B?R3R3YzBxaURiOEc0NjhBNjhMVGpveUZPdnFzMFJDM3VQbWJyZHAyT25XRmJx?=
 =?utf-8?B?NHA2T2NBUytza2dQYlQ0UGNiTERzdE1CbDZmNU9YMTRoanc1ZWFLa1h5YnZC?=
 =?utf-8?B?aFU4TDJ4N3MzSzlsUlpQdjVYdThvVjlIRVYxM2lTWGpjbE0xbDlycTJuTFly?=
 =?utf-8?B?U0tmVFhpM2hHS3dWYloyQVFDQTUzM1ZsYmZpb2ViRDEvQXRySklqN3NFenE5?=
 =?utf-8?B?N1hOVmpYUklGcmdwRC9SMTYzSDJHaUdGeHdHc1dyNFpDL3JoOW94VUNiSnhE?=
 =?utf-8?B?cTlOUVZlazlhcit5VXRhei81cXR6dFJtcEFnZ1BMbFRVZktCUWZmUFE3NWtk?=
 =?utf-8?B?UTc1c0VaQ1YxSnorc0FoWlU2ZU9LYTlGUXZQamdBU1hJMm9SMlZWc0pOc1Uw?=
 =?utf-8?B?QVlHdjFJUG1KdUgvNzZkZGNRb1RzcHlyeENtRzJzdm4wUy9Jem1ZMWV2bGFj?=
 =?utf-8?B?b2YrRGRtK3NkMVAzWlhDT1paZWFhZnJlLzNqTHJmMHZIam5xUFN2UndPajZx?=
 =?utf-8?B?MWRjNHNEZ0FpT3RzS0xSTEYvOGtMajNKV3k1NDlDZ2xDeTBVOG00T29vTEM0?=
 =?utf-8?B?WEFDcHlpMTVTSXRFLytHMnVqTU5BNTZHS3FOSU1LKy83RUxFMk0rMVBQUlFS?=
 =?utf-8?B?Vk82N3RnN3VhT0cvSm9ldE9WRFZsVjBiSldyN25YMzlsM0h0Z1ZkTmh6NEhQ?=
 =?utf-8?B?YVJsUmo3UjFuM0tXZGZQdnFSNTdBZ21RMU5RNi9Sb1MycG1zMy83eDlYOE15?=
 =?utf-8?B?TjJoSkVibTFiQ05QMEZ1b0hveW5WUkJVM2NjOFVJZmUzam56clBtUWo5eStD?=
 =?utf-8?B?ZXRtZXd1Mmhkc1lRTkRqVWpROU9YNlJFcllZRlNDeit2MXZyYnhtT3lhVU9U?=
 =?utf-8?B?Q2hqMlRTcW84b0lTUEg4MGtXb0JZMC96TU5Yc0k0SmdjclJ1eVpxeW1pZGlY?=
 =?utf-8?B?VDQ3NjZTUmlTR1krM0lGZTFoNWhtTEZVM2V5T3lXT2lNVjJra0gwTmV2SHQ0?=
 =?utf-8?B?YkJNSktPTHpuVkhSalpNemRzMm9YRFRiNWhNWkFMK05PUVppYmg2NmRlaGRk?=
 =?utf-8?Q?nJbYF/Ow8RCjg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 15:20:01.5373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ca42ce7f-aa2d-4f85-9d1a-08d8b256897e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84lbw8VfmUY4o6HgF9sNyPiuve/pJcPdKBqF13j5zV/EViY0fQU1sW8sKGNS4PCvx3zos8iAU/XJWy3ZWxfqXC9gyL+oWrauz7W7TlK3/CM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2369
Received-SPF: pass client-ip=40.107.3.136;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------2B4CFAA0CD729A20B8E2B64E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.01.2021 22:36, Peter Xu wrote:
> On Thu, Dec 17, 2020 at 07:57:07PM +0300, Andrey Gruzdev wrote:
>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>
>> Currently the only way to make (external) live VM snapshot is using existing
>> dirty page logging migration mechanism. The main problem is that it tends to
>> produce a lot of page duplicates while running VM goes on updating already
>> saved pages. That leads to the fact that vmstate image size is commonly several
>> times bigger then non-zero part of virtual machine's RSS. Time required to
>> converge RAM migration and the size of snapshot image severely depend on the
>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>> creation time and huge image size.
>>
>> This series propose a way to solve the aforementioned problems. This is done
>> by using different RAM migration mechanism based on UFFD write protection
>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>> guest RAM content using write-protection and iteratively release protection
>> for memory ranges that have already been saved to the migration stream.
>> At the same time we read in pending UFFD write fault events and save those
>> pages out-of-order with higher priority.
>>
>> How to use:
>> 1. Enable write-tracking migration capability
>>     virsh qemu-monitor-command <domain> --hmp migrate_set_capability.
>> track-writes-ram on
>>
>> 2. Start the external migration to a file
>>     virsh qemu-monitor-command <domain> --hmp migrate exec:'cat > ./vm_state'
>>
>> 3. Wait for the migration finish and check that the migration has completed.
>> state.
> For the rest patches:
>
> Acked-by: Peter Xu <peterx@redhat.com>
>
> Dave, considering the live snapshot series has been dangling for quite some
> time upstream (starting from Denis's work), do you have plan to review/merge it
> in the near future?
>
> I believe there're still quite a few things missing, but imho most of them
> should be doable on top too.
>
> Thanks!
>
Thanks, Peter!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------2B4CFAA0CD729A20B8E2B64E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 05.01.2021 22:36, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105193658.GE149908@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Thu, Dec 17, 2020 at 07:57:07PM +0300, Andrey Gruzdev wrote:
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

How to use:
1. Enable write-tracking migration capability
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate_set_capability.
track-writes-ram on

2. Start the external migration to a file
   virsh qemu-monitor-command &lt;domain&gt; --hmp migrate exec:'cat &gt; ./vm_state'

3. Wait for the migration finish and check that the migration has completed.
state.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
For the rest patches:

Acked-by: Peter Xu <a class="moz-txt-link-rfc2396E" href="mailto:peterx@redhat.com">&lt;peterx@redhat.com&gt;</a>

Dave, considering the live snapshot series has been dangling for quite some
time upstream (starting from Denis's work), do you have plan to review/merge it
in the near future?

I believe there're still quite a few things missing, but imho most of them
should be doable on top too.

Thanks!

</pre>
    </blockquote>
    <pre>Thanks, Peter!
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------2B4CFAA0CD729A20B8E2B64E--

