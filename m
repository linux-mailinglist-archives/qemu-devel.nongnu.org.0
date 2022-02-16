Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326BD4B8F98
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:44:55 +0100 (CET)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOMI-0006gv-8P
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKOEo-0007VJ-40; Wed, 16 Feb 2022 12:37:10 -0500
Received: from [2a01:111:f400:fe07::70e] (port=58541
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKOEj-0007ta-Kr; Wed, 16 Feb 2022 12:37:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfiDfjDUJR7hiOGZ39MrHjggmMIO1HsLRDfZC7cdC1xMR6CNJoCDKL1NA+PKjPsRBGsXerdid5ygD5KfZVMy8liNKaJz/GJsEpPCSz7CgRHNcJvAxshfQap2GJLAC4/4EMn2M1Ggsw5tW2B6J2Ifgz56i/xd3XtkqVBTFQ6NbvkBWKzqPShgEcKS4RQ+wvy6YZlLjyecO7xPSdpxFHPEMJO5c4MVmzQGWpYQWw9/3AbvlpWnFLaDYJBW7OBYrbr7vzp8bXqQt2ysRnAVTYMm3JJl+PObHeASe8SWeevanEEyeBsFaYmgilMmSloULJfU9swWIsHgplfrqXRCqFvOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMcJlQPfVRIXDEesLuion3ppHCi0y0MbSPSy+kGbf7M=;
 b=ajaYKC1vllhSDuMO88oIUTNPn7cXEpHkgU8vpg4s5JGcvm6uSwC9LBDIOMFYYXG0aZQFrzawGQ7hltyEEpvM74dU/1f5zJNLiOjv31xSeDUPnL+ycGEDCtJLgEEQceWozDu4B0aD3u8Qvo90ePVaN5wVIHsku+PG4PxXyuBn13xnTpicmhUVSdYnlzda5t/P1vmmgNRIdtY+LR7KG9+Tr+E8WpDmNVkIkU7o9LWVJKcMZYXw4cIfHTEgHNr/QHSxlAL6sOZNGiRKQS8t+Gs929sFhPJy5r1gw+NQmPaGKQv498fyvdO2G4ybZRxnB9kQmtw3O9zWTB3TALe/SfTRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMcJlQPfVRIXDEesLuion3ppHCi0y0MbSPSy+kGbf7M=;
 b=gosSJ8wwAxA2Pg/tNAbaejst2mwZK84YZzLhu1Ux6p22dRDFecDjEKNO/btxdQpdUpsbU9r0IH8psVCsi5dqf6EvHV2BNIu+cLb0JXZwPOc9cnICk7ggXGW0FVyu0zW9FOHxQU+zwtf4rrEN8P31GpwNXwk9C0WcGXpcPXPBYmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB7215.eurprd08.prod.outlook.com (2603:10a6:20b:413::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 17:37:01 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 17:37:01 +0000
Message-ID: <750f391a-6847-40d2-6b77-d9bf726f7ab5@virtuozzo.com>
Date: Wed, 16 Feb 2022 20:36:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] nbd/server: Allow MULTI_CONN for shared writable
 exports
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Richard Jones <rjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220215171838.2651387-1-eblake@redhat.com>
 <CAMRbyyvdBWMB9bzpkUUMO+SZj6PN8Xy0kJnvqLhB2W6vw+5iWQ@mail.gmail.com>
 <20220215232414.g4l4qoqiqyjvnweg@redhat.com>
 <a36660ff-c7d6-9bd1-bea8-dc0a10b74329@virtuozzo.com>
 <CAMRbyysF6p=_Hdj-b6jdAVqfpQHqjGQ4V_=GfQmAxiPPwHyt0Q@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <CAMRbyysF6p=_Hdj-b6jdAVqfpQHqjGQ4V_=GfQmAxiPPwHyt0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::11) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88ad8175-ae21-4ddc-6009-08d9f172ef24
X-MS-TrafficTypeDiagnostic: AM9PR08MB7215:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB721592590EC45A41B09A0453C1359@AM9PR08MB7215.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VRetkaYGdyKdKIfxRPk1Lb7LKiIcm0aT/f7983SYPlxYVn1IvvVaeCpjMk+0S32GOkg6pUZuuIuSkM/ZUhHVCXdbSwPnYQRfCPusNS5Lg8h9Y2BAhUXrXFBHYYNn6QmT/aa415+FugSUZJHE7l6WT5xp+KVRjvfZWzqgDwzqA67gnF59P1Cwt8HQb89K9Ukm01HrthKTvKAQOWSXD26Oj2O19hDKAMmOcVsAgZYOECv+S5EH8M0u4EI2qo40wVpHXBxNST4W5JCPS6A4YH+PgevjyvzB5ConxEB3sn9KtlpErUoHSxsD5HDV6QNEZ+v9I6mGKy2e6gSqLGbP1rFdgOCACDP2EHG/7ymcS8Yuuxvk5rBMW0MQa8vIp27iI4EOVFCaz3ECkEddnqgVmYKsp+JWE3MEzzo3sS8dMH07lX37j/P3xH8UGHFGeY9qrpnWYTSYRTwVzCk+egA7WYXw6MQZ0fJv2hg0/VXwp0RFGTgHk4J0IF1CCoU81LhTi03yaEm6/1CXVdeE7FPQQVmMnl+aiHpWh9CIBk9hdLKYCccMjtxKNPMUhf59HqIUvWISnRn449WZ0wcpIES86BVajpKUHB1pgQSlmzy7kKmcdgJXNbJAWUQfUy4BM1B4LYkUl8uAJn9ZxSrCY//pAH4phOGUfGZfJ4b+dftyNEs3+fgtaoevbJ49O2/3mYIptizgqMuh+53qoeRxHz24T65VHfgJsD7961ymUG3Du4jdSMwWOgbBXuc0TxMB3tBhSafVVnYPpaxpTT4GBRbhVo3gUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6512007)(6506007)(6666004)(4326008)(36756003)(508600001)(53546011)(83380400001)(316002)(30864003)(5660300002)(2906002)(8936002)(66556008)(66476007)(31696002)(26005)(186003)(66946007)(54906003)(6486002)(38350700002)(2616005)(6916009)(86362001)(31686004)(8676002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dml6RmI4VlBpMDZKTy9Ba096OVVRcEx5YkNKKzU2L3pEY01zZCs3cVNKSnkw?=
 =?utf-8?B?SEpEMEZxYUxtRks1cmx3VHlxS21vQnByOW1RUzFCVGRycHBLMURWcDlTUDJQ?=
 =?utf-8?B?MENjMUdmTmtUZVRhbllJV2xrbHRIVGdxNVZqVWo3dGFPdCtkSFIwSnY2SDFN?=
 =?utf-8?B?SmpnV041NVNQd1NDWllLcFF3c2JCSWZsdEZmZUNFVnJlZkVEMDllQVlHUHoy?=
 =?utf-8?B?NEpQYzlWVmVFSWphN0RjRE9KR0tXTWRST0E1bWNDbWUvUlQxZldxSU9iRE9G?=
 =?utf-8?B?QzFEL0lYdE1HTXZrcUdsclc0Z1Q5c3RDT0Rsc1NEejhMSHpWa3Q5dURxMGc5?=
 =?utf-8?B?MmE5bHkxU0JKdCtRM1Zobk5OdWJjVjF0R3ZpREZwZ21GQlNFbzE1RldURlU3?=
 =?utf-8?B?T3V1VmVrdDdFOCt0eGx6ZTlKRjkvSEtPbExXSEJPWHFraUlQdytRTDV3em4v?=
 =?utf-8?B?MStpVTdRVVVTNDg3aGVDMm9HYTM5R0Zwd21Sa2IzaUxSYTRiNGFZOUN1aGU5?=
 =?utf-8?B?bjEwZmgvcFkzeDcvemt5M3gwUy9CbUVsN29VMEhPTmhCTzd1M0JmVDU1NktB?=
 =?utf-8?B?emJ5S1I1cmFIdFRNU1luMUlOMUpBTnVHVmlIOEFvblhyQzB1UTBham1DWUlD?=
 =?utf-8?B?Wldyd3c5emtONWVFY1F4K3VXaWlsb2J4OHNYZXA1SkJFUFpGVVphK2JUYkdX?=
 =?utf-8?B?VXJaRmtuNmlYSjFmeXJOU1I1ZGpIY0NldkNXQzM3K2lHbi9hVXZJRmRaT2lR?=
 =?utf-8?B?QmVwT0Vhb2tibUpVN3JMTW9UaWk4OURUNUI2RHpXQWNBemVWWU0vVVNEOFox?=
 =?utf-8?B?bWFoK2IxZkZ2RlBSeWJRT3hmWUdNVWtsdTFlOGlUdElvRmJ6dHg4dlA3RGlR?=
 =?utf-8?B?aWppUDlUSnhtTWVaMDhLMUlraDkxTFdDYzFwRitrSExrT25MeEVZTmpRSEpX?=
 =?utf-8?B?YkJ2VXYzNERiRTNhbWVNeGRjSkZOU3VWV2IzeGFtWGJVTllxQ1JUQWd0K3BD?=
 =?utf-8?B?SmhFcG9JVDViSUVyZ0VnRnRHcWdFNnFnQ1VmRGV6bVZ2YmlxekFMM3NiTzhu?=
 =?utf-8?B?K2N5NDY3WmdTdllZb3cxcm9KZ29XaGJwYkJRdnRrcG93NFluS0ZzamRUbm1F?=
 =?utf-8?B?VFJETkIwbEovT1Y1SlF3QXVPc0NLT3lGQzZvbGpCK0hLWXJJRTF4UlVsVzV3?=
 =?utf-8?B?Sld2WE5uUHhhYkpKTUp0cStzOVQrQ0tadEd1Zms0RVdxT3FnWUxJUENOSk85?=
 =?utf-8?B?NU9EbVJ5ZnAxM3RCVUtiQnI1MVZUaytEZlQ3Wk0wbWNZNXNCbmNjcVprM3Jv?=
 =?utf-8?B?OUgvcG4rdlRxMWk2T2g5ZDRpT1IzKzlzUlRUUDFTdlg4cHNnQlJpTVh3Tk9n?=
 =?utf-8?B?Wm0wN3JEbWNnaVc5V0Z6WHoyV3JQOFJaTzBHOERpK2NMd0VlSGlHY2pwZ25D?=
 =?utf-8?B?VG1yc2hzVDd1cjdUTWtLSFJDd0IvbHpEdDZEaDVvWmFJWUdPVWlUYkp3aGw4?=
 =?utf-8?B?YmVJSFhEUktyREZBNmo5UGRRdEpEeGhtV1Y4U1p4QmQrOXRzZVlKU2N2NDJ3?=
 =?utf-8?B?ci9JSlBQNUZpTUtqUmNtVXlBdGlXVk01RzdDU2FBK3VOVlF4c2RDV0g4ZThk?=
 =?utf-8?B?cG1mMHV3eG1EdHR5eWFiTExIbkVzQ0N1SHlic254UTRNZEJPN2N1QmJxUnMv?=
 =?utf-8?B?YWl5VGZhd2E2QVJCbmVEamJVOFhlUVJkd0d6V0V6TFh2SkorcGZvY29XdkRv?=
 =?utf-8?B?Sjl3Z1Jvc0NIOVAxWit5UzFwQU5jcXVIcWtEc2hWZEwreHlYMVFYMjFxY0pL?=
 =?utf-8?B?YW9EVWp2QWE0elg3a1ljRDczWVB2ZTVkckhaWE5FSDNveTlDdVVmNDFXOWM3?=
 =?utf-8?B?MjN3RjlTSld0aVVNeHBwVU1CQ1FiZXVLSUhQOXJmUzgybEdSTCtzd0tGQm0v?=
 =?utf-8?B?dFlOeEc2OGVTWTgrbzdUS09ELzBvbnphVE4xNmNKV2xpclB2cjd0d2Y1WlBH?=
 =?utf-8?B?OHZMbXdWYWsxaTNoYVIybTZCNVNaV3lvSk0zSkkxd3hYZGlZSDdJUEFYOGtD?=
 =?utf-8?B?WmlBNU9qcGFLZ2M5OFhYcDgzWXZPQUdmaGJ3YmIzODNtQkVoZ2JtZ29WR0p2?=
 =?utf-8?B?Tkl3cDZpRjNaRGZnUTV2N2dkdjhzdXFucWxHb2xrRUw2bXQxRXZHWXl1dmdH?=
 =?utf-8?B?YmxmYXgrak81TlpqR3NQTGdjM2VlUk9hRTRmZnpDRjUrR0dHM0hQRWZQNVBS?=
 =?utf-8?B?dnphaHhGZElLSXppSkp2cG5GdFlBPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ad8175-ae21-4ddc-6009-08d9f172ef24
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 17:37:00.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NUa4eVjE7QXab1XsMCtsdCxsib7thUytoPEKh9oaqAoq3qm9ie+c0l5IELfHRaPXer46rgvS4E+H6BE2SzEdgh683d8iSTfPsFW9BH1CUkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7215
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe07::70e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe07::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

16.02.2022 20:14, Nir Soffer wrote:
> On Wed, Feb 16, 2022 at 10:08 AM Vladimir Sementsov-Ogievskiy
> <vsementsov@virtuozzo.com> wrote:
>>
>> 16.02.2022 02:24, Eric Blake wrote:
>>> On Tue, Feb 15, 2022 at 09:23:36PM +0200, Nir Soffer wrote:
>>>> On Tue, Feb 15, 2022 at 7:22 PM Eric Blake <eblake@redhat.com> wrote:
>>>>
>>>>> According to the NBD spec, a server advertising
>>>>> NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
>>>>> not see any cache inconsistencies: when properly separated by a single
>>>>> flush, actions performed by one client will be visible to another
>>>>> client, regardless of which client did the flush.  We satisfy these
>>>>> conditions in qemu when our block layer is backed by the local
>>>>> filesystem (by virtue of the semantics of fdatasync(), and the fact
>>>>> that qemu itself is not buffering writes beyond flushes).  It is
>>>>> harder to state whether we satisfy these conditions for network-based
>>>>> protocols, so the safest course of action is to allow users to opt-in
>>>>> to advertising multi-conn.  We may later tweak defaults to advertise
>>>>> by default when the block layer can confirm that the underlying
>>>>> protocol driver is cache consistent between multiple writers, but for
>>>>> now, this at least allows savvy users (such as virt-v2v or nbdcopy) to
>>>>> explicitly start qemu-nbd or qemu-storage-daemon with multi-conn
>>>>> advertisement in a known-safe setup where the client end can then
>>>>> benefit from parallel clients.
>>>>>
>>>>
>>>> It makes sense, and will be used by oVirt. Actually we are already using
>>>> multiple connections for writing about 2 years, based on your promise
>>>> that if every client writes to district  areas this is safe.
>>>
>>> I presume s/district/distinct/, but yes, I'm glad we're finally trying
>>> to make the code match existing practice ;)
>>>
>>>>> +++ b/docs/tools/qemu-nbd.rst
>>>>> @@ -139,8 +139,7 @@ driver options if ``--image-opts`` is specified.
>>>>>    .. option:: -e, --shared=NUM
>>>>>
>>>>>      Allow up to *NUM* clients to share the device (default
>>>>> -  ``1``), 0 for unlimited. Safe for readers, but for now,
>>>>> -  consistency is not guaranteed between multiple writers.
>>>>> +  ``1``), 0 for unlimited.
>>>>>
>>>>
>>>> Removing the note means that now consistency is guaranteed between
>>>> multiple writers, no?
>>>>
>>>> Or maybe we want to mention here that consistency depends on the protocol
>>>> and users can opt in, or refer to the section where this is discussed?
>>>
>>> Yeah, a link to the QAPI docs where multi-conn is documented might be
>>> nice, except I'm not sure the best way to do that in our sphinx
>>> documentation setup.
>>>
>>>>> +##
>>>>> +# @NbdExportMultiConn:
>>>>> +#
>>>>> +# Possible settings for advertising NBD multiple client support.
>>>>> +#
>>>>> +# @off: Do not advertise multiple clients.
>>>>> +#
>>>>> +# @on: Allow multiple clients (for writable clients, this is only safe
>>>>> +#      if the underlying BDS is cache-consistent, such as when backed
>>>>> +#      by the raw file driver); ignored if the NBD server was set up
>>>>> +#      with max-connections of 1.
>>>>> +#
>>>>> +# @auto: Behaves like @off if the export is writable, and @on if the
>>>>> +#        export is read-only.
>>>>> +#
>>>>> +# Since: 7.0
>>>>> +##
>>>>> +{ 'enum': 'NbdExportMultiConn',
>>>>> +  'data': ['off', 'on', 'auto'] }
>>>>>
>>>>
>>>> Are we going to have --multi-con=(on|off|auto)?
>>>
>>> Oh. The QMP command (which is immediately visible through
>>> nbd-server-add/block-storage-add to qemu and qemu-storage-daemon)
>>> gains "multi-conn":"on", but you may be right that qemu-nbd would want
>>> a command line option (either that, or we accellerate our plans that
>>> qsd should replace qemu-nbd).
>>>
>>>>> +++ b/blockdev-nbd.c
>>>>> @@ -44,6 +44,11 @@ bool nbd_server_is_running(void)
>>>>>        return nbd_server || is_qemu_nbd;
>>>>>    }
>>>>>
>>>>> +int nbd_server_max_connections(void)
>>>>> +{
>>>>> +    return nbd_server ? nbd_server->max_connections : -1;
>>>>> +}
>>>>>
>>>>
>>>> -1 is a little bit strange for a limit, maybe 1 is a better default when
>>>> we nbd_server == NULL? When can this happen?
>>>
>>> In qemu, if you haven't used the QMP command 'nbd-server-start' yet.
>>> In qemu-nbd, always (per the nbd_server_is_running function just
>>> above).  My iotest only covered the qemu/qsd side, not the qemu-nbd
>>> side, so it looks like I need a v3...
>>>
>>>>> +++ b/nbd/server.c
>>>
>>>>> +    /*
>>>>> +     * Determine whether to advertise multi-conn.  Default is auto,
>>>>> +     * which resolves to on for read-only and off for writable.  But
>>>>> +     * if the server has max-connections 1, that forces the flag off.
>>>>>
>>>>
>>>> Looks good, this can be enabled automatically based on the driver
>>>> if we want, so users using auto will can upgrade to multi-con automatically.
>>>
>>> Yes, that's part of why I made it a tri-state with a default of 'auto'.
>>>
>>>>
>>>>
>>>>> +     */
>>>>> +    if (!arg->has_multi_conn) {
>>>>> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_AUTO;
>>>>> +    }
>>>>> +    if (nbd_server_max_connections() == 1) {
>>>>
>>>> +        arg->multi_conn = NBD_EXPORT_MULTI_CONN_OFF;
>>>>> +    }
>>>>
>>>> +    if (arg->multi_conn == NBD_EXPORT_MULTI_CONN_AUTO) {
>>>>> +        multi_conn = readonly;
>>>>> +    } else {
>>>>> +        multi_conn = arg->multi_conn == NBD_EXPORT_MULTI_CONN_ON;
>>>>> +    }
>>>>>
>>>>
>>>> This part is a little bit confusing - we do:
>>>> - initialize args->multi_con if it has not value
>>>> - set the temporary multi_con based now initialized args->multi_con
>>>>
>>>> I think it will be nicer to separate arguments parsing, so there is no need
>>>> to initialize it here or have arg->has_multi_conn, but I did not check how
>>>> other arguments are handled.
>>>
>>> arg->has_multi_conn is fallout from the fact that our QAPI must remain
>>> back-compat. If it is false, the user did not pass "multi-conn":...,
>>> so we want the default value of "auto".  Once we've established the
>>> default, then we force multi-conn off if we know we are limited to one
>>> client (although as you pointed out, nbd_server_max_connections()
>>> needs to be tested with qemu-nbd).  Then, it's easier to resolve the
>>> tri-state enum variable into the bool of what we actually advertise to
>>> the NBD client.
>>>
>>>>> +++ b/tests/qemu-iotests/tests/nbd-multiconn
>>>>> @@ -0,0 +1,188 @@
>>>>> +#!/usr/bin/env bash
>>>>> +# group: rw auto quick
>>>>> +#
>>>>> +# Test that qemu-nbd MULTI_CONN works
>>>>> +#
>>>>> +echo
>>>>> +echo "=== Initial image setup ==="
>>>>> +echo
>>>>> +
>>>>> +_make_test_img 4M
>>>>> +$QEMU_IO -c 'w -P 1 0 2M' -c 'w -P 2 2M 2M' "$TEST_IMG" | _filter_qemu_io
>>>>> +_launch_qemu 2> >(_filter_nbd)
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"qmp_capabilities"}' "return"
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
>>>>> +  "arguments":{"driver":"qcow2", "node-name":"n",
>>>>> +    "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
>>>
>>> I'm not the best at writing python iotests; I welcome a language
>>> translation of this aspect.
>>
>>
>>
>> Let me try:)
> 
> Thanks! This is much nicer and will be easier to maintain.
> 
>>
>>
>> #!/usr/bin/env python3
>>
>> import os
>> import iotests
>> import nbd
>> from iotests import qemu_img_create, qemu_io_silent
>>
>>
>> disk = os.path.join(iotests.test_dir, 'disk')
>> size = '4M'
>> nbd_sock = os.path.join(iotests.test_dir, 'nbd_sock')
>> nbd_uri = 'nbd+unix:///{}?socket=' + nbd_sock
>>
>>
>> class TestNbdMulticonn(iotests.QMPTestCase):
>>       def setUp(self):
>>           assert qemu_img_create('-f', iotests.imgfmt, disk, size) == 0
>>           assert qemu_io_silent('-c', 'w -P 1 0 2M',
>>                                 '-c', 'w -P 2 2M 2M', disk) == 0
>>
>>           self.vm = iotests.VM()
>>           self.vm.launch()
>>           result = self.vm.qmp('blockdev-add', {
>>               'driver': 'qcow2',
>>               'node-name': 'n',
>>               'file': {'driver': 'file', 'filename': disk}
>>           })
>>           self.assert_qmp(result, 'return', {})
>>
>>       def tearDown(self):
>>           self.vm.shutdown()
>>           os.remove(disk)
>>           os.remove(nbd_sock)
>>
>>       def server_start(self, max_connections=None):
>>           args = {
>>               'addr': {
>>                   'type': 'unix',
>>                   'data': {'path': nbd_sock}
>>               }
>>           }
>>           if max_connections is not None:
>>               args['max-connections'] = max_connections
>>
>>           result = self.vm.qmp('nbd-server-start', args)
>>           self.assert_qmp(result, 'return', {})
>>
>>       def export_add(self, name, writable=None, multi_conn=None):
>>           args = {
>>               'type': 'nbd',
>>               'id': name,
>>               'node-name': 'n',
>>               'name': name,
>>           }
>>           if writable is not None:
>>               args['writable'] = writable
>>           if multi_conn is not None:
>>               args['multi-conn'] = multi_conn
>>
>>           result = self.vm.qmp('block-export-add', args)
>>           self.assert_qmp(result, 'return', {})
>>
>>       def check_multi_conn(self, export_name, multi_conn):
>>           cl = nbd.NBD()
>>           cl.connect_uri(nbd_uri.format(export_name))
>>           self.assertEqual(cl.can_multi_conn(), multi_conn)
>>           cl.shutdown()
> 
> The test will be more clear and the code more reusable if the helper
> was doing only connect/disconnect.
> 
> @contextmanager
> def open_nbd(nbd_uri, export_name):
>       h = nbd.NBD()
>       h.connect_uri(nbd_uri.format(export_name))
>       try:
>           yield h
>       finally:
>           h.shutdown()
> 
> Any test that need nbd handle can do:
> 
>      with open_nbd(nbd_uri, export_name) as h:
>          use the handle...
> 
> Good example when we can use this is the block status cache test,
> using complicated qemu-img commands instead of opening
> a client and calling block_status a few times.
> 
> And this also cleans up at the end of the test so failure
> will not affect the next test.
> 
> The helper can live in the iotest module instead of inventing it for
> every new test.

Yes that sounds good.

> 
>>
>>       def test_default_settings(self):
>>           self.server_start()
>>           self.export_add('r'))
>>           self.export_add('w', writable=True)
>>           self.check_multi_conn('r', True)
>>           self.check_multi_conn('w', False)
> 
> With the helper suggested, this test will be:
> 
>      with open_nbd(nbd_uri, "r") as h:
>          self.assertTrue(h.can_multi_conn())
> 
>      with open_nbd(nbd_uri, "w") as h:
>          self.assertFalse(h.can_multi_conn())
> 
> Now you don't need to check what check_multicon() is doing when
> reading the tests, and it is very clear what open_nbd() does based
> on the name and usage as context manager.

Agree

> 
>>
>>       def test_multiconn_option(self):
>>           self.server_start()
>>           self.export_add('r', multi_conn='off')
>>           self.export_add('w', writable=True, multi_conn='on')
> 
> It will be more natural to use:
> 
>      self.start_server()
>      self.add_export(...)
> 
> In C the other way is more natural because you don't have namespaces
> or classes.
> 
>>           self.check_multi_conn('r', False)
>>           self.check_multi_conn('w', True)
> 
> And I think you agree since you did not use:
> 
>      self.multi_con_check(...)
> 

Yes)

>>
>>       def test_limited_connections(self):
>>           self.server_start(max_connections=1)
>>           self.export_add('r', multi_conn='on')
>>           self.export_add('w', writable=True, multi_conn='on')
>>           self.check_multi_conn('r', False)
>>           self.check_multi_conn('w', False)
>>
>>       def test_parallel_writes(self):
>>           self.server_start()
>>           self.export_add('w', writable=True, multi_conn='on')
>>
>>           clients = [nbd.NBD() for _ in range(3)]
>>           for c in clients:
>>               c.connect_uri(nbd_uri.format('w'))
>>               assert c.can_multi_conn()
>>
>>           buf1 = clients[0].pread(1024 * 1024, 0)
>>           self.assertEqual(buf1, b"\x01" * 1024 * 1024)
>>
>>           buf2 = b"\x03" * 1024 * 1024
>>           clients[1].pwrite(buf2, 0)
>>           clients[2].flush()
>>           buf1 = clients[0].pread(1024 * 1024, 0)
>>
>>           self.assertEqual(buf1, buf2)
>>
>>           for i in range(3):
>>               clients[i].shutdown()
>>
>>
>> if __name__ == '__main__':
>>       iotests.main(supported_fmts=['qcow2'])
>>
>>> But the shell code for
>>> _launch_qemu/_send_qemu_cmd was already pretty nice for setting up a
>>> long-running background qemu process where I can pass in QMP commands
>>> at will, then interact from other processes.
>>>
>>>>> +export nbd_unix_socket
>>>>> +
>>>>> +echo
>>>>> +echo "=== Default nbd server settings ==="
>>>>> +echo
>>>>> +# Default allows for unlimited connections, readonly images advertise
>>>>> +# multi-conn, and writable images do not
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
>>>>> +  "arguments":{"addr":{"type":"unix",
>>>>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>>>> +  "arguments":{"type":"nbd", "id":"r", "node-name":"n",
>>>>> +    "name":"r"}}' "return"
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>>>> +    "name":"w", "writable":true}}' "return"
>>>>> +nbdsh -u "nbd+unix:///r?socket=$nbd_unix_socket" -c '
>>>>> +assert h.can_multi_conn()
>>>>> +h.shutdown()
>>>>> +print("nbdsh passed")'
>>>>> +nbdsh -u "nbd+unix:///w?socket=$nbd_unix_socket" -c '
>>>>> +assert not h.can_multi_conn()
>>>>> +h.shutdown()
>>>>> +print("nbdsh passed")'
>>>>>
>>>>
>>>> Mixing of shell and python is very confusing. Wouldn't it be much cleaner
>>>> to write the test in python?
>>>
>>> Here, nbdsh -c 'python snippet' is used as a shell command line
>>> parameter.  Writing python code to call out to a system() command
>>> where one of the arguments to that command is a python script snippet
>>> is going to be just as annoying as writing it in bash.
>>>
>>>>> +echo
>>>>> +echo "=== Demonstrate parallel writers ==="
>>>>> +echo
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-start",
>>>>> +  "arguments":{"addr":{"type":"unix",
>>>>> +    "data":{"path":"'"$nbd_unix_socket"'"}}}}' "return"
>>>>> +_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
>>>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>>>> +    "name":"", "multi-conn":"on", "writable":true}}' "return"
>>>>> +
>>>>> +nbdsh -c '
>>>>> +import os
>>>>> +sock = os.getenv("nbd_unix_socket")
>>>>> +h = []
>>>>> +
>>>>> +for i in range(3):
>>>>> +  h.append(nbd.NBD())
>>>>> +  h[i].connect_unix(sock)
>>>>> +  assert h[i].can_multi_conn()
>>>>>
>>>>
>>>> This is somewhat C in python, maybe:
>>>>
>>>>       handles = [nbd.NBD() for _ in range(3)]
>>>>
>>>>       for h in handles:
>>>>           h.connect_unix(sock)
>>>>           assert h.can_multi_con()
>>>>
>>>> Since assert will abort the test, and we don't handle
>>>> exceptions, failure will not shutdown the connections
>>>> but it should not matter for the purpose of a test.
>>>
>>> As I said, I'm open to python suggestions :)  I like your approach.
>>>
>>>>
>>>>
>>>>> +
>>>>> +buf1 = h[0].pread(1024 * 1024, 0)
>>>>> +if buf1 != b"\x01" * 1024 * 1024:
>>>>> +  print("Unexpected initial read")
>>>>>
>>>>
>>>> Not clear when we initialize the buffer to \x01 - is this the qemu-io above?
>>>
>>> Yes, when the qcow2 file was initially created.
>>>
>>>>
>>>>
>>>>> +buf2 = b"\x03" * 1024 * 1024
>>>>> +h[1].pwrite(buf2, 0)
>>>>> +h[2].flush()
>>>>> +buf1 = h[0].pread(1024 * 1024, 0)
>>>>> +if buf1 == buf2:
>>>>> +  print("Flush appears to be consistent across connections")
>>>>>
>>>>
>>>> buf1 was the initial content, buf2 is the new content, but now we override
>>>> but1 to check that the right was flushed. It will be be better to use
>>>> different
>>>> names like inittial_data, updated_data, current_data.
>>>
>>> Can do.
>>>
>>>>
>>>> This block is the most important part of the test, showing that we can write
>>>> in one connection, flush in the second, and read the written block in the
>>>> third.
>>>> Maybe add a comment about this? I think it will help someone else trying
>>>> to understand what this part is trying to test.
>>>
>>> Can do.
>>>
>>>>> +{"execute":"block-export-add",
>>>>> +  "arguments":{"type":"nbd", "id":"w", "node-name":"n",
>>>>> +    "name":"", "multi-conn":"on", "writable":true}}
>>>>> +{"return": {}}
>>>>> +Flush appears to be consistent across connections
>>>>> +{"execute":"block-export-del",
>>>>> +  "arguments":{"id":"w"}}
>>>>> +{"return": {}}
>>>>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>>>>> "event": "BLOCK_EXPORT_DELETED", "data": {"id": "w"}}
>>>>> +{"execute":"nbd-server-stop"}
>>>>> +{"return": {}}
>>>>> +{"execute":"quit"}
>>>>> +{"return": {}}
>>>>> +{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
>>>>> "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
>>>>>
>>>>
>>>> Nothing about the contents here says anything about the actual test
>>>> except the "Flush appears..." line.
>>>
>>> Yeah, it's a lot of QMP debugging (to show what commands were run in
>>> setting up the server), and less verbose in the nbdsh side.  Do I need
>>> to add more output during the nbdsh that uses multiple connections?
>>>
>>>>
>>>>
>>>>> +*** done
>>>>> --
>>>>> 2.35.1
>>>>>
>>>>
>>>> Looks good, feel free to ignore the style comments and suggestion to rewrite
>>>> the test in python.
>>>
>>> The style comments are nice, the rewriting is going to be harder for
>>> me (but I'll accept help).  At any rate, getting qemu-nbd to be
>>> feature-compatible may require a v3 anyway.
>>>
>>
>>
>> --
>> Best regards,
>> Vladimir
>>
> 


-- 
Best regards,
Vladimir

