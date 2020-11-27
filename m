Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262BA2C60C6
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 09:23:17 +0100 (CET)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiZ2B-00011i-NO
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 03:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiZ0o-00009E-Fl
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 03:21:50 -0500
Received: from mail-am6eur05on2102.outbound.protection.outlook.com
 ([40.107.22.102]:6464 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiZ0l-0005qx-7o
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 03:21:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiXkJbqiLpzh4oncNImUAk/uC4K6XfqfhUdfpYH4RG/UIwyjk8+EVynngjMYhr+RqtfWMzSASl8XkqApQ6zzNHzH2BF4GVBzpanPfxkz+YQqrOVUFGEixLcEu4aJWZCQkKsoZnt3Rny0YuGj726htHCD3v/qFlyKPgAbjKyDIX8LprcvbbtAkME8QRwqDaCQjPc+6dtTPC9YX+6+QXqs57dq9wN3VkjuBrHwRDAdcyIaG3W8AklL2SI9E4+PHAlEYDulEwqHEcfrPiweJ6Adm5hy5QFIL2DdqbzW6M+p0zfWDFSaqrJzJ8vL3Hs/m8tvqRBgJ6CuIvCyN67odvpyng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GuafUh1+AzFs36LYquBz1tXoiW6qH0zN8KrZf3pU78=;
 b=RpuF+Uvxpooxr6wbSCJlH1S9wb9aK7xFvalKlm/OqmlDOM3eOEgnLpn83HMNClTx9W43i/CP032p84NRZvu9vBylp2tsgGDD90mb2cjRmZNKOL1+E9Y8kYDlf2oAksz+pHJENunqVdaK5Khtvu9FkwvM+MCoYL2hO8hEnoJDMfOQdkurKhBYgm+nP40UT+ixFhDhaEU24IsBWumUrAkuOgQV34UZ0Lg4jfpwekZrWc4QqyMWF57Q8izqDpNkscgTtfh8Jv/cANZHnxJF7EBvng4aamMyTTaO5EzyvvrAhVM7nHS71v3T4vesuQQoK2RI7P4e5nqs36Q8FVvSbtxZ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GuafUh1+AzFs36LYquBz1tXoiW6qH0zN8KrZf3pU78=;
 b=DlKSJmD/n38Z/vZRHdUq6C0ocYM6nvKRYLBNAw6bw2Xei8AeVDSxdEtWWbY8M/VLnNcZ8tmiSda5XiScTt14p850/0g6j/ixVcnJAm54ey0e3ovaORtWF80A168dxU2s/MFh5wsf6OBr+2rc+ZUg1zaKUNB+vqwUQOJfAwZEkug=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3325.eurprd08.prod.outlook.com
 (2603:10a6:803:3e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Fri, 27 Nov
 2020 08:21:42 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.032; Fri, 27 Nov 2020
 08:21:42 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Krempa <pkrempa@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126154751.GH2366@angien.pipo.sk>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
Date: Fri, 27 Nov 2020 11:21:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201126154751.GH2366@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM3PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:207::28)
 To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM3PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:207::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 08:21:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39cc5091-f9c5-487f-b5f6-08d892ad7842
X-MS-TrafficTypeDiagnostic: VI1PR08MB3325:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB33251C37727D5B355DBEDB219FF80@VI1PR08MB3325.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G0w0l3g9nikTw0O8zPjhNApX8NjzIwIJ0rPglKlZ1bN4z5RSPqvjUknbO6ArthQ1cJgZqbPOkQyYkXk6Pt6YtgRf8n5cUeEeJdPweR3wf5s8wdg+ECs/XvsBGCItztK+USouk2zATi5D71CoTDyGKOooGsIlUHnyVsGtAXIfcstZ5maaIxv/FJZ0HcUN6K6qnBs33SMkKNJl/Ng3Da0FGs8cSdoYri/dpuqV7o/u79t/sJAkKber8GX2zBNY64fNQfIEsNr+U6w6knqUBHU37QLAi5Zhh+Po2uhkqMX6YG3WfsPwvOfLjiGWGfAtcl9V8u5QotA/eT/Y+n3hbzm7oDtw9hEYVJGyAeMsnNT77ZMn1/BhHpJg7tQWdsHSIyrM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(376002)(366004)(136003)(346002)(26005)(6916009)(5660300002)(31686004)(36756003)(316002)(83380400001)(2906002)(478600001)(54906003)(44832011)(16576012)(31696002)(66556008)(956004)(86362001)(8676002)(66946007)(186003)(2616005)(52116002)(66476007)(8936002)(53546011)(4326008)(16526019)(6486002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTc5TTFmK3QwdGRtYkNZOWo5d0o2MHVGZVE4WEozRURyV3MzT0ZOaEdqSEEr?=
 =?utf-8?B?SkM3TmJoT3AyczRjZUxITCtQblVhZXRFai90MDJhazhTOFZiZng5VEN3SUVI?=
 =?utf-8?B?akkrWFRXdS9DNW1SYnpvY0p5WG9teUFUUis5V2d6SjhPdFYwbHlvZER5ZVBy?=
 =?utf-8?B?NWxQaWtMVkFRU0xLL284SFFXUDRsa1dTQ0tGOE5XaEt6MUtyRXBRK3hnMHhl?=
 =?utf-8?B?WElQWWZNRDl5T0RTaTdoNkQxTGFCK0dOaWdyaTZ5NkJmeXluUDdCd0dSRVlw?=
 =?utf-8?B?TGhuMVF4QlpoaGhtQnNyNm1QM1RBeWVxY3FlWkV3dmtOZ3poTityVkNiZG9C?=
 =?utf-8?B?ZWQzemRiQmJhcytIcjl1RHZHSTFXTmFoQlJBaVkzOUl3S3dHc1QzUW0yOUtK?=
 =?utf-8?B?TmsxMUFXYXJTU2FEV3h3aStkODJaOFVzNFJKS0tiMVhCbVh5WlN5RjhqcTF3?=
 =?utf-8?B?WEYzQXNRUmo2cmp0STdmRGJ3dTBSN1ZSTzMwNVZrT1M3bzdTV0graUhGcDFB?=
 =?utf-8?B?aE95V0U1OUhTVXltaU1aMkNaMEd6NGVGVTgvbmpZeEVacjBRSklaTjZEL25H?=
 =?utf-8?B?cS9rU29CVXNaM1FTbVBYQmVHMWF5QUtRYmQxcnE0OHVYaUdtMjZZSk1pM0h5?=
 =?utf-8?B?czdVK2Y2aFo5NFMwN0NRVGtMcTVPc1VFTys0c2ptVWpKMFBkdFdSNVJsVDg4?=
 =?utf-8?B?NnRXS1BuVXNJS1orQkNYVG9hTUx1QmdIZ3FQMFNyK3cwSWtOVkRPT21YdWdj?=
 =?utf-8?B?RHFaV2tBcGd0N2FyRTZNYk15TWtZcFNwMUplcDNYcWRBK3RQbUgxL2Npbncy?=
 =?utf-8?B?Y1dHZk1tQTRzT3BhUnpxd3lueEI3dllZcDkvSTdJai9UblhYRVdwWlVvUnRJ?=
 =?utf-8?B?OVlJUzk5TUgvU09kYkU2MXdCMkJkUG45eVFVb0kzaVVUcFY3RlVOQjNmVVYx?=
 =?utf-8?B?QmZtaHVhc2tzUkx4VWVBTzZtRDNkUkdWVnFnamZDMVJwcjhwNklKeS9pSThk?=
 =?utf-8?B?a0xCZGEwemx5L1BWV2dtNHJqd1JDMDNCRkpyeDlhcHZlb3YvMFJuMmtVR2dM?=
 =?utf-8?B?ajJxQmgweGdLbzBuTEdRQkY4eGxIUnlxaG5HaWhhaWZvbnQwYzVoaVlOTHN3?=
 =?utf-8?B?SFk5a1hTaGM4aHN4bitDNzdsSUpvemNETmNrUWdRczRRYUpjUkFucXduNXpQ?=
 =?utf-8?B?UnNneFRiYVVVYVE1MEhTdFkwM0ZVUmNnT1drVFpVMnd5dmtnZkVKVi9FTEFT?=
 =?utf-8?B?MHY3ek52dmw1dllUYmliMk9vY1ZGbndXK1JqMi9pZnAwU205RWlmNkwzNW5k?=
 =?utf-8?Q?CQ2qBNDybqRXA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cc5091-f9c5-487f-b5f6-08d892ad7842
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 08:21:42.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFzoqFcJMcKczUyRQDeGVu/B9bgFR8URgQ+XBrq+bFjbmVV1tsgqASQEwCSQba6V92TPBmSw/UaW3RsyYl2knQVsHSubfqFQMEmKYwe5Xw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3325
Received-SPF: pass client-ip=40.107.22.102;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.11.2020 18:47, Peter Krempa wrote:
> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
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
> 
> This sounds amazing! Based on your description I assume that the final
> memory image contains state image from the beginning of the migration.
> 
> This would make it desirable for the 'migrate' qmp command to be used as
> part of a 'transaction' qmp command so that we can do an instant disk
> and memory snapshot without any extraneous pausing of the VM.
> 
> I'll have a look at using this mechanism in libvirt natively.
> 

Correct, the final image contains state at the beginning of migration.

So far, if I'm not missing something about libvirt, for external 
snapshot creation it performs a sequence like that: 
migrate(fd)->transaction(blockdev-snapshot-all)->cont.

So, in case 'background-snapshot' capability is enabled, the sequence 
would change to:
stop->transaction(blockdev-snapshot-all)->migrate(fd).
With background snapshot migration it will finish with VM running so 
there's not need to 'cont' here.

Thanks, I'd appreciate a lot if you look how to integrate the new 
mechanism to libvirt!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

