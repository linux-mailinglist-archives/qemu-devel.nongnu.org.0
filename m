Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0553242F1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:11:59 +0100 (CET)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExhe-00060O-PV
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExWX-0004qr-FT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:00:33 -0500
Received: from mail-eopbgr150115.outbound.protection.outlook.com
 ([40.107.15.115]:13443 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExWP-0007nl-Na
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 12:00:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ch06jjwQ5q26DYrQVhEGHoQlzFJyh4IgjztwNH6nmYo5F4gMFAQ331rLFpfxto0mD3E0oEpFSPJTSMDVhVmqE9ViGNzzfPjx+Ce8Oz4nwWYTCnwhz9wqUj5srPS3bP0BSSch602mZAYY3I7tbKEl+SulgU9U9gYDPdlvSKBeVSoyMN+uiE/MNM72j3fbXN8NsdTuHCoaWg9FfirG7gUu938eA09ry5v3xUVeL3C/Kb+Ypc9y3OGGr+ZOoagbsXhci81qQLp8vYMpIoIc3Hn6rQfTjOXCmHotQErCQij49zEDbArRzfrLWnAUduY3rMfxfhhWZ5Hsp/oSTlII/RDflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSHtQeOpcKED5ppctoIdWEwI/VzsvtYP51xIYKUQ+Xo=;
 b=bp/+xyNPnToegZqem6IdH/ltVUTh2Aebp3TDmAbw6aw1cfGpJfVNAyOEtIdJrM3sFBUj66pCEmN/3a2SOAg0HNY2wQZ/mGEMU5kyZR8RYKxUrXp4U8gLoUcMIJ8cYg5u4QQw5EQDdEGWbloSjIl1o6pDHHyf81/kjhYtswAwxttMnXy+DycxLtdz5aM88DBc8D0W6yzbjMoujaN0+ZjU+9BHEwdSlOevmkyOMYgTmgJ2TkUPxPenHl4ecfHVmpkOImarNejWFq8wilAlt8Cb7vocyJvWXTFo0SPrvxBu1Nw24eTwVfcdiW7Fx6c91TvwvN48KR01QD6xINXuD9BP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSHtQeOpcKED5ppctoIdWEwI/VzsvtYP51xIYKUQ+Xo=;
 b=qrmHJzQcABjXrkCGqLZN7e2y4UYxI62ZTpgnQIrznSfNseyhjhK4M7BjobI0PWrfmX7Y4C/Hbq2tDNfTNpP7soisVg9Wa0CqVm0v32aoh8WiUbEZGNUxvXp2h7TVqgyKirmzXKLG+dM16jQ4A/TAsKUHe5vHz3bEhalKq9NPZyY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4434.eurprd08.prod.outlook.com (2603:10a6:208:143::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 17:00:18 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 17:00:18 +0000
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
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
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
 <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
 <20210219205052.GK6669@xz-x1>
 <d5abc500-a7b2-cf25-db88-b6d4284b910f@virtuozzo.com>
 <6bb24cdb-3f0e-6924-2891-5bf695267615@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <510ea9fc-63ae-b444-4971-caa9b397ef75@virtuozzo.com>
Date: Wed, 24 Feb 2021 20:00:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <6bb24cdb-3f0e-6924-2891-5bf695267615@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM9P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::23) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 24 Feb 2021 17:00:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40769b91-745e-479e-17bb-08d8d8e5aa23
X-MS-TrafficTypeDiagnostic: AM0PR08MB4434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4434FEB1137AFA0C226AFFE69F9F9@AM0PR08MB4434.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3wztBnNIR4U1aMv18VNFIHe1dtZ7kNcj6kY2UuX3uL/nPXYfgs5h9+8lYKOqu7zsYk9JXXKePgdoGvWwWYwWY7/3nRVUfEibtmC6O9cMreay+E3zIRY/wtuXsHG4gJ0svXQmnxpc3Jql92ollPcBTbqZ4Mj25KCfHtJYmNMP4/NcvweCAe9jUGtf/4n44uE03OihaDLvy/XOgodo0K/8iUbERdGzjUDiVtlhdN4XF6RS+YtoOH3uepFXXicvJ7eiQ0XkBHEW/cAaDVzKi7OIGxwGmYq6E/z+9gEFGVmF4HmPmnGO1qxeycTT3T1b+DOj4mHKWQh2FzMiJqamkAaLD816SbO5+mDitrPmbBz157+77x0gEnXtVqOvFE26iLS1C4Lp1W374UkNRDdT5mbVJkxAPDJnKPTek6beXwFpr3bZqN0drZS8Xa/iU3EbpCAV66zRlKUS8qbQnBS12ii0Rben8RqRfHahFIoRhA9UUWkKNRBu5THiPg1LzMSw3My4YCmyHHgJSkyurLKmXjslEL+ktZA6J/tpW4SUxQFiSdzaDq6C0Of7l22DeDqGq2Ug7KVnRCpJMVYm2EMnCUgH8ljWIDUL2LeuLy4BU3hOt8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(366004)(136003)(396003)(346002)(376002)(5660300002)(53546011)(956004)(4326008)(66946007)(31686004)(16526019)(8936002)(110136005)(16576012)(316002)(8676002)(6486002)(26005)(2616005)(86362001)(2906002)(83380400001)(54906003)(31696002)(66556008)(478600001)(52116002)(36756003)(44832011)(66476007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXJBTEFKaFNIR0FHSjFHNzJZSkxLQmhzcUt3bkJ4M2U1ejNMTmQ4dHNyNlpF?=
 =?utf-8?B?eFp1V3NvelJnMlZqSmEyL2ZHUmlhN25BRlQ2QndWdWtoZ2FVOG1GZjhwUy95?=
 =?utf-8?B?SlQyNkQ5dng1U0xSV05VdU9lU3AxeW5qRjRuanFITlZqb3JqY2YwTnh0TVA5?=
 =?utf-8?B?OGFMOTRGaW5JUjBZM2QyY0FpU3lsTG1yZzl6Y0Q5emE2TXgxT2xkbjdHSHph?=
 =?utf-8?B?YUpGenBDbExvcEdWSTIrV2pyU3MyVkx5QllOT1pkU1BQcG1YNFFHRHBMWGtZ?=
 =?utf-8?B?V0tIdEo5aER4VEFxRStyZlBVR0dNd2E4amhwc1BrSVBqWUt2eXhNWlZPQmpX?=
 =?utf-8?B?SVFTQlRRWEl0RXZrOXZsMzF1TnVQbkNmN1VHdyt5OGprZ0VJUzZMcWxWcWdv?=
 =?utf-8?B?YVAwbm1QWkdpQ3JROElQcEdoUzNvdjNPSXZWTzZGbkN0QUQvWlYwZHYzdXpN?=
 =?utf-8?B?Skhzd1BCQ1ErdDdWUGhDcGRqbDRQVjlmU0NmbVo1VkFnaXVwRzhRSi9VNmdH?=
 =?utf-8?B?VFpwT3pxdzVJdkRnc3dKUGpXN3VrVzkvMm1HZS85SDFSRXdlWi9DTEU1YmtG?=
 =?utf-8?B?cGhybS9RRlRBTzdXYlFHMWM2M0hDTU90end5Rkt2bk93d00wTkxMd1ZFUXlp?=
 =?utf-8?B?S2V4bnI0bGRHckFWSDcycVo4a3FwRmdscGtUVG5vdlBjUyt2UXZSVFVmUFFQ?=
 =?utf-8?B?L25WSWpVTDZ3U1dXVlRBenNBWVAzOU54dlQ4STZvREVZZnBwcWtkYXQ0Ly9v?=
 =?utf-8?B?eHhsOWpiT1lobm5xdnNFZDJBRVRkZkNZRGdJQWdqMGpRNnp5R1lRRFdCeXFV?=
 =?utf-8?B?ZjhLY2RSdXFQM2FsRGtIbE04aHE3RWpKT1lXcHdKSm9nTWFYRFZtc3VmQ1JE?=
 =?utf-8?B?UmU1RVlkczlyOWM3SVBVWGIzTFNTdll6NkpFQnBFRWlXd0FzVGRVVUs0QU5G?=
 =?utf-8?B?eWdreFc0a200d0JNUWF2M0VyNnJlSExRSjVJV2tESG13VzBYbFNlOVZURzR2?=
 =?utf-8?B?anQrdk0zRCtuL0xaK3Vkd05CVE10VThDMW9JUFBZNVBmM3NMdDFOS3hlOUl0?=
 =?utf-8?B?QllRS1Q5a0hmdDIySjZiSHFEdWxEbUZGL0ZKbURVTDBkbyswbzh0MEdmRTRC?=
 =?utf-8?B?KzNrV3hCc01rRjVjelBteCtOMXdkR3BadEFhNTYrSDNBQUtqQWZZT1g4Nk9L?=
 =?utf-8?B?Q0dBbkN3aVVjcjlpSForNHcvdE0rWExIalFsRGhoTWN6eTcyektIRDVXV2w0?=
 =?utf-8?B?dHVYRHJkR0o3N3I2YUN2ZDNNc1J4QWx6VnJEdFRjd2Q1MFhiRzIyZERWenpu?=
 =?utf-8?B?TC9kcmZxeVBSdmtkZDYyN3h5dnJmR2lwQjQ4UTBmS01SZTFiU2xzdWNpRE9x?=
 =?utf-8?B?NWtlc002Skg0bjNkR0EyLzdNL3VUOXRVRzF0R0NScGppaDgvalV1TFRPaGtX?=
 =?utf-8?B?WkU3c1NEZ3RFbDQrZXJtd1dHd2JyVUFqSmFCbVV3Z3JJSHcrcVFYY0t6R3B0?=
 =?utf-8?B?OWFTZDRtMXFmVnB3WVhjY001UUh0Ri9tKzlBaHAwQmVaZmdSSmJMUEJNUjRD?=
 =?utf-8?B?dG5yN1hRZEg0cVdrQkRrL0J6OVBsY3lwWmVwa0xtNnhORVZxYWtkK1o4QzVq?=
 =?utf-8?B?ZHVDdlVMYnFIazV5TXpFNGpWZHNjZ2hHZFZlZmZ4RVV5alFVSGRkU2J6bVZG?=
 =?utf-8?B?V003dy9lVklzazB6aGVNVG5pM3dUQUgvTG9MaDN0aEpjbENtVHZ0N201QVla?=
 =?utf-8?Q?CBvUtvWB5kKDOg+lEvxx6gat6wGMVPT27pLJT6n?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40769b91-745e-479e-17bb-08d8d8e5aa23
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 17:00:18.7431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJkQjwQLY4qzB7DOyjHtcmK+p46Hc/hRSRjk6owWDOGOII9ntTO3kLTm2G2+++Yp4GOOmrIjinMq/5XvOPh+QaefIuiw+pM8y96lNTHC7gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4434
Received-SPF: pass client-ip=40.107.15.115;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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

On 24.02.2021 19:54, David Hildenbrand wrote:
>>>> Anyhow I'm quite sure that adding global MISSING handler for 
>>>> snapshotting
>>>> is too heavy and not really needed.
>>> UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  
>>> There'll
>>> definitely be overhead, but it may not be that huge as imagined.  
>>> Live snapshot
>>> is great in that we have point-in-time image of guest without 
>>> stopping the
>>> guest, so taking slightly longer time won't be a huge loss to us too.
>>>
>>> Actually we can also think of other ways to work around it. One way 
>>> is we can
>>> pre-fault all guest pages before wr-protect.  Note that we don't 
>>> need to write
>>> to the guest page because read would suffice, since uffd-wp would 
>>> also work
>>> with zero pfn.  It's just that this workaround won't help on saving 
>>> snapshot
>>> disk space, but it seems working.  It would be great if you have other
>>> workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.
>>>
>>> Thanks,
>>>
>> Just to add: one of the good options is too keep track of 
>> virtio-baloon discarded pages and
>> pre-fault them before migration starts. What do you think?
>
> Just pre-fault everything and inhibit the balloon. That should work.
>
Yep.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


