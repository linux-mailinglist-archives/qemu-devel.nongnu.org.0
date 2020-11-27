Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2431A2C6AAF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:36:27 +0100 (CET)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihfV-00048p-Og
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiheB-0003fQ-KQ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:35:03 -0500
Received: from mail-eopbgr70103.outbound.protection.outlook.com
 ([40.107.7.103]:7334 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kihe7-0004GW-TY
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:35:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W87yKvPn4k8JhmkfJvFVwDWgfo00zbrUoDFk5sf1aOH4in1bNT7udTMuYP/Y6JApTwFTLDle+bIptFGFZPGKIHxwJmoUBS7L0DIg6OL/DEZ91hcyMg67W1p2K2MQ+P+EdfPBaprOf5CURVOVjsgXEZEX7U6kTlC0mODJ9BvPi1vHjy5hvQOllReaUXY1qMzSfSL46BD/51AQRVjT9p5e1Mfs3EXjE27gg2dsdSbvCzVAZY80bgPqjjopeCMmjIwacWTTw5zygxxTfNK5iB+0ClXtiIvyT0Tde1WplDww1RAegtJczrcnWpOykYHAArzKA+fQ75DJ4Y5peu8uXzxueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8muizrTk/HVscSKUVYYjxjKnbqu73GX+KG3hxAG502E=;
 b=JG/AiWnblSEz2uN09hMykRKL7a7l6CgSoP3zRJvtRjovraZObrNvjRiKPtZ7wS0u2mWWMZP0tWB2Qn2vLVesi9H0X7V4bMLLr3m8Wh+K4DzA44rJW7lg4lpYQj18tmv1leSgveUz/T8FeWriQZF3AWQ0NTJlPZwlpIaaXpCh7Honm8chwQVf+uOj0qqOzyphmwux/3crjjHoyzXnaoPzkYRek17GFdiSOuymoDVmyVyejzQI5mVQ9LMBtjzaJWiMNo2/IXUOO8iAzPMU08be4iGUBEFk4rgBAZulZQ+luDUL+lei+jq6hjOLN9jBvVKcQUVMuyPBuX23/0S/F6vyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8muizrTk/HVscSKUVYYjxjKnbqu73GX+KG3hxAG502E=;
 b=o6Z1koHb6lQdRwkAGg92lzziaN3ual2tZ8/ymw7P7aHxKbG64gZuhNT0Bqb4XzNnD4skxIULlkA9jjZ+Y7RiAS0fNzN11LeKlD4x/0O91Ft4I5wx5nwI6CENucm6bX0fblCMUisXqrJgAI3BEZX31duebYvO89QRmDx2U/iTz20=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3182.eurprd08.prod.outlook.com
 (2603:10a6:803:46::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Fri, 27 Nov
 2020 17:19:51 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.032; Fri, 27 Nov 2020
 17:19:50 +0000
Subject: Re: [PATCH v4 0/6] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126154751.GH2366@angien.pipo.sk>
 <673bec91-31cb-5533-b223-8725948e2189@virtuozzo.com>
 <20201127094911.GI2366@angien.pipo.sk>
 <23cbb153-9260-3357-04ba-94da7da8c0d2@virtuozzo.com>
 <20201127154546.GC6573@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <fc644069-fdca-6917-8b32-8816b8912eda@virtuozzo.com>
Date: Fri, 27 Nov 2020 20:19:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201127154546.GC6573@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM8P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::9) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Fri, 27 Nov 2020 17:19:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d97a8f03-a074-47fd-58ed-08d892f8a5fa
X-MS-TrafficTypeDiagnostic: VI1PR08MB3182:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3182F89F20360B3640BA5D5A9FF80@VI1PR08MB3182.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+hqkRHSFogPF7lBRHenW42klNbUHk9SHlBL4qubIBjNDrWyytfWg2dzdBx6cF2x80e3fkVDFcDiHMTqGMqVXbl8U13DfOsA6TwcIaeIoxYohRHJWp5AlQiq+vwbvcpi/W+mZro4llj9WjC9KBYRyB//E7qApSK7ucWthhk0otQtE/tctx7Uv3JWsM7R1a3WYgekI57QYsLk4xUgrtSJQmGvv7NSUZAgnlTVQiP2Z5uoZW6orBqR9cYqu+rZG8DVIX1cet+So5dQnO5JwijCej5TLYgXe6KwxyCPqg6PKw3iXVsB/gzErcKX2xUbjrFQyXGLXc/qY/AMbyzuYNP6Fi22MYsaEkK77I1pbodbdcgn18lr+ISKSqPQMTOzvOFE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(6486002)(44832011)(2616005)(31696002)(6916009)(36756003)(956004)(83380400001)(52116002)(478600001)(5660300002)(86362001)(66556008)(26005)(4326008)(66946007)(66476007)(54906003)(16576012)(53546011)(8676002)(8936002)(316002)(186003)(31686004)(16526019)(2906002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NmRJVk1HTHI0cGtselVpUDFXa1BWcHM3dmsxRm52R240YWpNbE43bDBnRU95?=
 =?utf-8?B?Y21WRWIxZjNzeGZCbHdOck9uS2diaVR2ZU5lTVZHTklqMTZ5amdlcWpHbVJB?=
 =?utf-8?B?eTgrUXZndTJEYXA1QXBaU21OSTAyNVM2cU1Yd0NTbDVZTXhzY0gwTzB4RGwv?=
 =?utf-8?B?ZUZ6OGpXRStxeUtmTURUMS9DZmFFSm92UHdRYnd5cFFuRVFmZ1ZoQ1gyajhN?=
 =?utf-8?B?V1pQcGZ0dmZTcmYxUDRjdnpYQnExNURTNjFJdk9iUlJCcDFJSlI2aTdmdzda?=
 =?utf-8?B?WWIzVkxzYXVIM0F3SWxYY294c1dZR1BFRFV2VlZrVmZFb05jY05DK1JCUEZw?=
 =?utf-8?B?aFBrc1VBUWpVZ2NESk5Zcm5zNEwwTTlSaUxPRUh3VmZnTnBrRDlnRzhmQU1m?=
 =?utf-8?B?K2gyWCtadnJSY29NMFNId05jYkhmVHNyemUwdXhxc1JMMGY3YUQ2RnZuMzdO?=
 =?utf-8?B?QVk0c044Z0lLNkFIVGF0SzlLanZta3ZjL3pseG1oQ21XTGl4ejJ2QXlIS2NM?=
 =?utf-8?B?ZXVvelJDV0RadUY0R01NYXF4czZtYnZyY2dGNUF3Ky9KV0F4MWhEOE5aSkF6?=
 =?utf-8?B?R0JQVC9YTlNiMmFyUEZWNys3ejNPaSs2OW9wMWh0SGlJTFFBcVphcmpSU1ow?=
 =?utf-8?B?K09GNmJZU0dpOVJRYlZ2TXo0Q01PVVltc29ic1dLdXpaM2JENllkRjdNM3Fa?=
 =?utf-8?B?VHd3MEVreWFFWmRmM202NVc2UmZ6VGV3eUU0ZDlxL1RzZUVBVmsvN3ZUclBU?=
 =?utf-8?B?REVHUTc1V2FIazVncXpxV0NzQXdXRVNxOUNzczJuUzFWV3JZczd6d3Zpb2Vm?=
 =?utf-8?B?bDlZeTJxZ2tNcGUvY2NDVUtZNFhDQ1hPNVA3Y3Z3L2poRklFM3cyNVF5c3Ra?=
 =?utf-8?B?bW1CZHhFZ3BjMms1VjNYS0pDL2pxdUJPeC9sTFZlMEgxVnN2VXV5ZUZFYWI4?=
 =?utf-8?B?K1FkTmltdVpTYm1jMDhIQ0ZVa3VOWndmeUltU2VEaFRZckd0UGdLbko1OGRT?=
 =?utf-8?B?YjNKcUJtUnBGSENrOCtrN1BWVndFcnFNblFMU0pUbmZ3dFBnMkt2aWhYWnRJ?=
 =?utf-8?B?SmRFajZkWmtjTnRpNk50aVVTS1I3V0lHd09ZcGNKOTRFOS8xdmV0VndvNE9U?=
 =?utf-8?B?dUFOc2JVRXY0RjJNMFBDZUFVd0xUQjdKeW15Y0FqVkpONXl1THU1Sk5DOGFN?=
 =?utf-8?B?MXp6MEJsOFE1aFQxaW5vMHV5TEpjYWJEWXhxdmdlR01SV1lib0lnVHU1TDZh?=
 =?utf-8?B?WXhOM0tPREFtZkFoa0IzckhBVjNndFJjOFc0UmE4eWFGTWNUdzhkbXJFRWM3?=
 =?utf-8?Q?yviJHXT31JAWI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97a8f03-a074-47fd-58ed-08d892f8a5fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 17:19:50.8506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LHeB3U5NDW9wLqbuQiRhiNFop91YCiEI9kl4CUil0RkrSE7sEAP/o9R4nVJeQ783x+xJN95CrzICClhpNyG6xEp6TgeEVPck5g09raoB24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3182
Received-SPF: pass client-ip=40.107.7.103;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

On 27.11.2020 18:45, Peter Xu wrote:
> On Fri, Nov 27, 2020 at 01:00:48PM +0300, Andrey Gruzdev wrote:
>> On 27.11.2020 12:49, Peter Krempa wrote:
>>> On Fri, Nov 27, 2020 at 11:21:39 +0300, Andrey Gruzdev wrote:
>>>> On 26.11.2020 18:47, Peter Krempa wrote:
>>>>> On Thu, Nov 26, 2020 at 18:17:28 +0300, Andrey Gruzdev via wrote:
>>>>>> This patch series is a kind of 'rethinking' of Denis Plotnikov's ideas he's
>>>>>> implemented in his series '[PATCH v0 0/4] migration: add background snapshot'.
>>>>>>
>>>>>> Currently the only way to make (external) live VM snapshot is using existing
>>>>>> dirty page logging migration mechanism. The main problem is that it tends to
>>>>>> produce a lot of page duplicates while running VM goes on updating already
>>>>>> saved pages. That leads to the fact that vmstate image size is commonly several
>>>>>> times bigger then non-zero part of virtual machine's RSS. Time required to
>>>>>> converge RAM migration and the size of snapshot image severely depend on the
>>>>>> guest memory write rate, sometimes resulting in unacceptably long snapshot
>>>>>> creation time and huge image size.
>>>>>>
>>>>>> This series propose a way to solve the aforementioned problems. This is done
>>>>>> by using different RAM migration mechanism based on UFFD write protection
>>>>>> management introduced in v5.7 kernel. The migration strategy is to 'freeze'
>>>>>> guest RAM content using write-protection and iteratively release protection
>>>>>> for memory ranges that have already been saved to the migration stream.
>>>>>> At the same time we read in pending UFFD write fault events and save those
>>>>>> pages out-of-order with higher priority.
>>>>>
>>>>> This sounds amazing! Based on your description I assume that the final
>>>>> memory image contains state image from the beginning of the migration.
>>>>>
>>>>> This would make it desirable for the 'migrate' qmp command to be used as
>>>>> part of a 'transaction' qmp command so that we can do an instant disk
>>>>> and memory snapshot without any extraneous pausing of the VM.
>>>>>
>>>>> I'll have a look at using this mechanism in libvirt natively.
>>>>>
>>>>
>>>> Correct, the final image contains state at the beginning of migration.
>>>>
>>>> So far, if I'm not missing something about libvirt, for external snapshot
>>>> creation it performs a sequence like that:
>>>> migrate(fd)->transaction(blockdev-snapshot-all)->cont.
>>>>
>>>> So, in case 'background-snapshot' capability is enabled, the sequence would
>>>> change to:
>>>> stop->transaction(blockdev-snapshot-all)->migrate(fd).
>>>> With background snapshot migration it will finish with VM running so there's
>>>> not need to 'cont' here.
>>>
>>> Yes, that's correct.
>>>
>>> The reason I've suggested that 'migrate' being part of a 'transaction'
>>> is that it would remove the need to stop it for the disk snapshot part.
>>>
>>
>> Hmm, I believe stopping VM for a short time is unavoidable to keep saved
>> device state consistent with blockdev snapshot base.. May be I've missed
>> something but it seems logical.
> 
> I guess PeterK meant an explicit stop vm command, rather than the stop in this
> series that should be undetectable from the guest.  It would be definitely
> great if PeterK could quickly follow up with this on libvirt. :)
> 

Sorry if I misunderstood, sure it would be great if PeterK is really 
interested to follow up with this feature!

> One overall comment (before go into details) is that please remember to start
> using "migration: " prefixes in patch subjects from the next version.
> 

Yes, I really missed it everywhere :)

> Thanks,
> 


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

