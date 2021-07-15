Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B8C3CA3AE
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 19:14:51 +0200 (CEST)
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m44wk-0005Qr-4L
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 13:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m44vn-0004Bw-Me; Thu, 15 Jul 2021 13:13:52 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:45966 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m44vk-0007zb-VN; Thu, 15 Jul 2021 13:13:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0D0aMyfPljDBjWKlT2w/8wu7na6NdDUsUI7MRdhk0cT+d3iwOat5Jel4cOOlMmnThdmsZSX1zGFuzog/oCK9LhmM6tUMecY90/K4rfIlLkTs+8KSN2XaXy2P5REotqwMvf3JNtsVPH/LVL23dGO6uwMpQankwrhbbOn32zx17xF/h0Sd+mIb35C4hLwZqvOkbkliDxW6h3ZKVf01NQl2STVssWU5kKTKsLtiHIx/kwQTMhoBDobT0f62AFcIbtU5J+LkKeIpkwPytQEJoxIy6QQFYPY5RGnu1zb0OK5Hnc/aDkcIzb27cteeaubkIP/3/hsrs5Vf2zf4UQ3miwPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llCG92RpEQIu89WMWs443G5W0qlIkt0t0PoehKukaIE=;
 b=UcnwHngTGhL0/Sk0jUY0dGCtobsCScVugGNWajAjQF+PC2OeSJCBuBpe+uQVuPB5Xg2m+JG35ix8w0AaR+g+8g2cf4+kmHjp89CbxhGDurGyEcUwYlaUf2VBNYet1a93UASwQ61jK4iMEh1WD+Ph3gQK2/5DdY7fcn/UibnLHCqF+aFQI265VViz6H3AJiXgNyi9oMDXnoiOxadqIGLGhIG5e7gVABOuIz01kpN0XhslNiD03HO69D6njsRfGcJjEAmpS0XPsvPJefmDgG/JNoZ6kHIp9anC8grSSQZjnj0Z1UJ3PVqsoMZQo+aLcXWUJETGVim50rsMjdvzos6AOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llCG92RpEQIu89WMWs443G5W0qlIkt0t0PoehKukaIE=;
 b=AWhZEu6En2kqLaThe5pTxgiOMVQxlTJ2wIFOnmHoU0ZWLwTxDaBTVCTVtFx3o2pLE7ukvBZCcmY5oFTDSVGsPt6Jla8e+KRthb6G090CKvniyVHO57CjzJDarmHMOr+1e5UL0taC1YAyq/m/zN+cs+zJYEVoJsZ3AHzdcr/6Gr8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4279.eurprd08.prod.outlook.com (2603:10a6:20b:bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Thu, 15 Jul
 2021 17:13:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 17:13:41 +0000
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
To: Nir Soffer <nsoffer@redhat.com>
Cc: qemu-block <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 den@openvz.org, Daniel Berrange <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
 <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <a18fd577-7f23-2e4f-0833-1ac13310313d@virtuozzo.com>
Date: Thu, 15 Jul 2021 20:13:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR05CA0117.eurprd05.prod.outlook.com
 (2603:10a6:207:2::19) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.193) by
 AM3PR05CA0117.eurprd05.prod.outlook.com (2603:10a6:207:2::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Thu, 15 Jul 2021 17:13:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae728a7c-dbd4-4484-e2c8-08d947b3e4f5
X-MS-TrafficTypeDiagnostic: AM6PR08MB4279:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB42797F58875716447F20AF1DC1129@AM6PR08MB4279.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNro55fHWYzSAVqA19SU6xVkRadlzj8h4df/j4pPUbwBqdJSQhE9EUzEXGSo1Ps7HdTJgpSbKJcvy/TgJ2DKBJrWasvSy1VRwmnGaDllVEr/PSDbDDBZlrTmuRCVWhnf/kYzsM+NUHInRwcAbJJcRsdSHxHWKzrqY0B4n+g4dc9gO1AltO51rQmEOGgSgZ6eNobkO/7M/AMqrM+5kdHZcbYV2YHQbLB/IF/ePIVRJqBpbh7OPeXEt4jOQ1DXsR6uaJbnK3+WCxNOg/mQyQ9/CZYe/qA8tpglL1snO0bwAR5ozeXnPQS+h40vUS1pNJYqQwz8fsti45GO6enBfIDzJlrvl7uF48ooIdvAahlPnF3LPSTRWCllp34DPtNDpl8AJxDviDMIsFrokGORbt7JQNDs7iEXxPS7gZEz3BNJetT8gfBpmold5xIA2Wn8/kGlbttLqhE8KmpYct/wPPURaRsOb28DNyZTcORsw1b80B0YQ1ZadujauvMp8rMHwoeNPpQ7XpJ7M4HJabXvdsq31wRFCP9+hODaLg8XKKJfJCMguz9GMYHB1E6vtlOhj/Ja8u0H1bZk1xi4yxN9MUvOUmKfjd3k4YTA8VFwDMIigjTp7F6MzsyoW+GKvU8c8o19qsfJ+HAzkcEYZGR14evFatl47leptoiXQasyL06Giu3rPSYfz8vHhd2QG1Hw6Ti7TKuj66z/7eB+z1xjAoXuOQyjeG4/IOyxsARbJYWOPfNHdIgAZUWsoCQEcapbLMwJbMveh4Gs9yEiB0JFPek00w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(83380400001)(86362001)(4326008)(31696002)(26005)(53546011)(52116002)(186003)(8676002)(8936002)(54906003)(16576012)(6486002)(66476007)(66556008)(66946007)(31686004)(5660300002)(2906002)(956004)(2616005)(36756003)(38350700002)(38100700002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXF6QkRjeHIvNzBhRURUOWVFb3hDeFF6ZGtaZWxSQXhMc1NRb3VvWHA1T25m?=
 =?utf-8?B?bmxnZU5LdFdoS3ZBUFFoMjBjejBSeGQyWnluUnhFUEVyRVJ6NXBzZGpremVF?=
 =?utf-8?B?MDJXKzFoUWZpenBad3NXL0tZTkYzVXlpU1NIWFZrRUQ0dVZmTWVPNEZtTXVB?=
 =?utf-8?B?RDQ3TFpWYVRBb0pFcDBYanY1eFQwczBKYWZ6Q0lGVlZGQURJYjBsdkhaVnlu?=
 =?utf-8?B?eWdaRklYZktQcUtGSElyd2hCdlNyYjgwQlh0UVdGQ1dSdTRJaitHY25MNnFn?=
 =?utf-8?B?dzVaRDFacVV6bnArMWZia0d4N0U1Q2RTak9VS21oaVZOZEpPbkxJa3JDckxn?=
 =?utf-8?B?U2lXL1ZTYVQrUFhzWHRCNmt1ZU01ZGloZ0FUc0ZIcFhlU1ZkUHVPZ2lQMVBD?=
 =?utf-8?B?U2k1NHE3WFBrYzBsaU9wQ0FDOFdwcmJlTjAvTUVOOXhZLzN1amdQUkdENXN5?=
 =?utf-8?B?bFpqcFJsWm1mRVkzWFpBY0lJbnNFTlZIR3ZIbXFsQXgxWllrUXVnZXFRamxY?=
 =?utf-8?B?NzkxSTdxdjgrMUtWdittT0lPQzNDdjBxNXVNc1JHUi9vU253TktWVUlFYWZY?=
 =?utf-8?B?TkVLT2hGeldBd1IrOENJWXUwNmlFbWdIUDNKK2grQWtMN292YjZ3Z0U2TkNY?=
 =?utf-8?B?bmI0V3V5MHpheFRJUm1Sa3dBMTNyZTJEaFdVK3lwbGpFanlXSEFWaVl2N1Fr?=
 =?utf-8?B?VkwxNlA0MmhLY09NeTJibkpzOEtKK2NGVGduV1pQSnIzVlc5WkJzaCtCSC9q?=
 =?utf-8?B?eWxwTEhoeEVHb0ZwMnB3T0xZYzg2VVRpQWtOME53bk5NaEJKYlRSMzZhUndm?=
 =?utf-8?B?cXpDcHdmLzhjb2FsZ0xERHQ3T1A2MkR5dU9nNXp1SG1XQ1dUdHpBZ09iZVRF?=
 =?utf-8?B?QzV5em5pUVFxVTg1cEt1OVV0ZFlUOTEyZjBTeDZaZnZ3N3pIc3F3UFUwNlpR?=
 =?utf-8?B?SmZNU2M0RGR4ZzlYQnRldTFNODRzNFBaZ1Fkc2d4Kzh3ZzB6ei9mc0FOQnlj?=
 =?utf-8?B?dG56QWYyTmJhTlE0aThIa1RwNDA1QVF0VXpaOVcySStaV2FTaldpbnhRWmta?=
 =?utf-8?B?TWRHRmZFOVpOWFlKR2xrSWJ2N21SRXhPMkFPREY5Z0JIYUluaWJtT05ZOU9Q?=
 =?utf-8?B?OWpkcnFud3hIV2VVS3JoTnI2VmdObmVzWERBZmlCN1RTRWpXQ2VpeHlvbUNT?=
 =?utf-8?B?RTZJMEhrekFvMEFKTTA2djFueGcrbjVYa1pwZER4M21BV3duQ3Y3b2NhRldG?=
 =?utf-8?B?dnMvS0t6UWgxQ2xDUEx3eHV4eXdGcVFmVDVsWlkvaTR0Vi9jYWFWOWk1WWxS?=
 =?utf-8?B?VGcvd1dSa3ZiN1h3emhOWUp3TzR3dlZrWE03MmpEUlFkc00rVmpGUHBkQWw4?=
 =?utf-8?B?VUN2Q2RVQktUNkRNdDk1VVlFcTlRZndYRURpTy94eHlKLzFUbExEMm1USUE4?=
 =?utf-8?B?TXJDVzY2bmlUaWw3OG9hTWt1T1UxOTVPQWR6QmF5T2RTN29tRUpBMm5KR3g0?=
 =?utf-8?B?TStZQ2poanJZUFlLUnlTcVZZdTNvZmJlckpVczBXQ2gzL3FyYWhFUjZjdkNy?=
 =?utf-8?B?N1BHY1NkeStTTVExUVhBSHFwMnlZUGRsd2p4dGJBOHd3bzVyOWl6N3FIak9H?=
 =?utf-8?B?czFLaFF5S1VCYk5kVVlLUHQwSCtCSCtZMmZCK2h1dWtlbS9VUDJOckNXY2ts?=
 =?utf-8?B?cmNxbXhwQWtYcG1seEk5SEJjQU9xMUhtL0EzQmtyaTBETTJXQXFxNW5YYkpO?=
 =?utf-8?Q?Cmd0u+J0KWVHFXmCAVibt+H+ymTI7tLvQXpcQwt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae728a7c-dbd4-4484-e2c8-08d947b3e4f5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 17:13:41.7425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZU1BAlL0vAeOpSsEff9xiUsxs9/O9JevjxqILAnmmSJ1+Jx8tWtCWN8Q3BYqpVg4wgLkDbGhFYv9tiN+UZGCY5fLDLAZMTho2D38LvDjl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4279
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

03.07.2021 17:50, Nir Soffer wrote:
> On Sat, Jul 3, 2021 at 4:51 PM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:

[..]

>> +
>> +Important notice: Qemu may fallback to POSIX file locks only if OFD locks
>> +unavailable. Other programs should behave similarly: use POSIX file locks
>> +only if OFD locks unavailable and if you are OK with drawbacks of POSIX
>> +file locks (for example, they are lost on close() of any file descriptor
>> +for that file).
> 
> Worth an example.

Hmm.. Copying here the whole #ifdef and probing logic around these locks from Qemu is too much..

I can't imagine what small and short could be added here.

Actually I think, OFD is old enough so we shouldn't care too much about older kernels without it. Let's just rewrite paragraph to something like this:

Don't use POSIX locks, they are known to be unsafe. Qemu uses OFD, so to be compatible, use OFD locks. Qemu may use POSIX locks when OFD is not available in the system. Other programs are not recommended to open images on such old systems if there is a risk of parallel access to the same image.


Related question, are POSIX locks somehow compatible with OFD locks? If one program use OFD and the other use POSIX locks on the same file.. Will it work or not?

> 
>> +
>> +Image locking examples
>> +~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +Read-only, allow others to write
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[..]

>> +RW, allow others to read only
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> +
>> +We want to read and write, and don't want others to modify the image.
>> +So, let's lock bytes 100, 101, 201. Operation is as follows:
>> +
>> +1. rd-lock bytes 100 (read), 101 (write), 201 (don't allow others to write)
>> +
>> +.. highlight:: c
>> +
>> +    for byte in (100, 101, 201) {
> 
> Using python syntax here is a little bit confusing.

Agree, as everything other is C..

Will change to something like

int offsets[] = {100, 101, 201}, *off, *end = offsets + 3;

for (off = offsets; off < end; off++) {


> 
>> +        struct flock fl = {
>> +            .l_whence = SEEK_SET,
>> +            .l_start  = byte,
>> +            .l_len    = 1,
>> +            .l_type   = F_RDLCK,
>> +        };
>> +        ret = fcntl(fd, F_OFD_SETLK, &fl);
>> +        if (ret == -1) {
>> +            /* Error */
>> +        }
>> +    }
>> +

[..]

> 
> Having this is great even if the locking protocol is not made public.
> 

Thanks!


-- 
Best regards,
Vladimir

