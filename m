Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406963B012A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:18:35 +0200 (CEST)
Received: from localhost ([::1]:47642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdUI-00029d-7j
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdSS-000111-Ve; Tue, 22 Jun 2021 06:16:40 -0400
Received: from mail-db8eur05on2137.outbound.protection.outlook.com
 ([40.107.20.137]:9473 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lvdSO-0005F6-KI; Tue, 22 Jun 2021 06:16:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnEB5Hs7E4Z+VJuEIOpdG61wRv+chH/cH78Mq6nvBm4gXDxNiU48wdhyjtJao1mT+G4rDl5nJz7VX+Xl5zAqFbEFCMzDmlemTedhh4/5WXZFosRbc6OTN4aGUITrcCQaqNezlEYvZDxbAW06PYA8C+8w2XOZaK0e/VXOZ78JKkhRrPQhUPHqYavmP6SCoa8sw+BEP1kAnyGqWK2Zlx9uaOpmffqxBsI5Ng7osGq9EmujwKd/l5XzZV3vuMpIrhTYeiK/ZS2aVyOAwgtIWhurRJqUItGC9KOhgKn6RZEVrF6w42MG0Ufu9+9Sgrk7zbeA3o1hYFVp9/mX8A4bO/QqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpVgo8DnU0QMbLV6/Rda/BYjk/4LdV3hF1BdKN5oA9o=;
 b=UnZgjjfaINDX2+C7x2jQMZ4ir/89fmSTlpI8wVoyWGwtpfCI4Ty57IcfaPUmP2zX13T3uHe1hGT8XFRBLQIIERaxgcOtAHdYXAZSWr7/rCgtEGgXBXSy3pIF+mBEDcXuhaZ8mhJHw62DvEss0DMbigDTnU5ANodw6kjDyOeIlprObDdy6x3Q+D/VFkihb1DGfWz7RGDOFvgGInO8WJ8Q3ay69Zmbhc+PwEyrwwjKzRV4RJC/2u1vVLn3mz1cZ6C/jb13AIaatKZIkqL/oilizjq59Ym9J9GnNVLGTln4mm4HmABPPbcULsVSNRnkrXsAff/9WXUDYuAXi/JFoc5FuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpVgo8DnU0QMbLV6/Rda/BYjk/4LdV3hF1BdKN5oA9o=;
 b=FbVWEHITclnnVdnN+AOAJevySjlPHT4MIWk4hKngkCJBxdV7kuabbNyExfL5pLuOL1j8vAxQVQEBzV3i9hCo8G2NzRTPaaxbKYvCxivnLXOpCGEa0gcWCEz1RtqYWfG9yEA/rbSncUgxU3O4eph9gkAFAYg/rtR43AmS61LJ4bg=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:16:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:16:33 +0000
Subject: Re: [PATCH RFC] meson: add option to use zstd for qcow2 compression
 by default
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 den@openvz.org
References: <20210617195128.66675-1-vsementsov@virtuozzo.com>
 <8d3711a0-2716-3bc5-3710-990042e16c0b@redhat.com>
 <YNC3b3S8tLM47PJn@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <dca75636-dc66-26e6-a3cb-a073cb8d6f0a@virtuozzo.com>
Date: Tue, 22 Jun 2021 13:16:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YNC3b3S8tLM47PJn@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0901CA0066.eurprd09.prod.outlook.com
 (2603:10a6:3:45::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.221) by
 HE1PR0901CA0066.eurprd09.prod.outlook.com (2603:10a6:3:45::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 22 Jun 2021 10:16:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cc19567-a7a7-4350-d579-08d93566cf93
X-MS-TrafficTypeDiagnostic: AS8PR08MB5912:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB591252DCA4ADDD0B7A9103DDC1099@AS8PR08MB5912.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RpwPpW7oAl6/Rx/V1HPA/CKfBaOGo5w9MFtdvo0u6YlxY9MpOlTY4BeFR518xNq3XG0rLlMhZP/S5Tvmw9/UgiGMJ39ZmJi65ymM+ekef7+k+jkfTz+2Dcv9l8WagqSGBedf7XhXH2ldvf45prWS5S2sOp1SnIN46xsh5zrOW9vp4Zj/RbkTKTeoZtquUwY1C4H8bChClaHrqUNV1FwJUrnX2BxCvpe2uVGJ1OsPod8UBDKVY5yAkHLbnjFm7YiDlJSy6FB6oKe8dmdCDbZiXGLx+hqv4QF/XXeTv11cyQWY9XNnMc0NGH7oR6tm1LEtn7Ayf9iI84hVqEaIsFdVlrpW1GmQClYsot91Cyq/4HP80XsIO5K18bxcPUN1ng9xFLy/3uCZFaOQ2HE+FngBY4zWz99c56qeCaHa0nrctgXM1Quwqrc8nlzsblkA1X6jkSrdSrgU+X1+Jr5eQFgqhG0Yy1u3EwWla+EcBPvNrx1zdQsnZIcWslQmx+7PKsyVRVvlWMt9hIvltjHHZnTITKRgK8oly6kzTDQMe4byLbeeU1MMwaCjj74gN2aEIpf24sLJRJnzTR80icNYFwCIp1NoG4qbNZHk/Fcit5bnJJHVmBZSlOS8Aqujc3NCOZu/ITJXPynE/YSId+6Q62ej4FfIjoRfR7PrjFGUHaCVhAlF/WZo7xHycv5agmUgfKz34RLiK44/jTo/MBKjMzXkPpvgodOH6UHoxCMPSVpM09Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(39840400004)(396003)(6486002)(2906002)(316002)(16576012)(5660300002)(478600001)(52116002)(16526019)(31686004)(8676002)(83380400001)(110136005)(36756003)(53546011)(4326008)(38100700002)(107886003)(38350700002)(956004)(66946007)(8936002)(86362001)(186003)(2616005)(26005)(66556008)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RW1JWjNCejFGRUxKZzUyUlZwYmpDdjhJS25qZlV6NUJVZmpSQzUwTzBGNnJu?=
 =?utf-8?B?N25MalZsRWUxQnM2Vk0yZ1Fka1A2bkcxZExqVFJmTXh0Y0JxendvZWpFU3pl?=
 =?utf-8?B?QXE5d2lqbVRlQ3BpT3hDbUtWV0xkNUdKRmNuK3lvUjBiRUVzMjdwUyt6ci9E?=
 =?utf-8?B?Mk4zaHY4alJHVE9uKzVZQStMMEZDam1FaXlOZGhxQnZ0S2I2TXJIK0NYYjZ4?=
 =?utf-8?B?NENZR2w1dXdERWpGNm52SkZocmNFa2NwVTZ3UTZhZ2F1Zm5LTG1tb1F4R2tO?=
 =?utf-8?B?UlBKMkRQb3A1bDdvWlp1WFNQaUdzZkJYd2IwQkM4NVFjTmhyVmNZeldDRWdu?=
 =?utf-8?B?eUJQYjRiVzdMMUJBNWYyZWh1QU1oL1VrNVh0T2ZnUVVJY2NGV1R4U1cwM1VD?=
 =?utf-8?B?VXBTcHlkdkJrRGZuYjRBZ0tVNk5KWW5OSzlEdElDUUZFTVNDamtsbGV2Y0hZ?=
 =?utf-8?B?TW9SQWF6aVplS01ZRWp6Z1dIYzZhdzFUdFVNK0ZNSVBaZ2UxbFZLOGQwSXEr?=
 =?utf-8?B?RVdqc1phSkpvMCtVZk12M2pySTZkUW5TcFA0TWF2WnhiOXNweWgxanZnNDN0?=
 =?utf-8?B?S1VPU1Fzako4Z1p0alpuNFRHa2dJbDlVTUtCRmh2MkdYWFFTY1hOTnVmVUVL?=
 =?utf-8?B?TENDUXQ2UGJiVTlqSTNaVi80bFFkRTQySnFkdGFTZk41VDFOS0RkWEErR3d5?=
 =?utf-8?B?SzRjMTkxZ0ZmaTJTcWgwcnJqVFFWZkk3ejZQcFhFRHJFRjVLZjRuWDJicDYx?=
 =?utf-8?B?ZlJQZUk0L3pWbEU0TkxpdWc2QjBhaHNsQ2V6WU9MNlNVQ09Pd1RDeTF3ODda?=
 =?utf-8?B?cmtjbEsrcjRYalZzNGlOSzJGQWRUcnltTWxLSUQ0SnpwVXJiYjZGM0JmbkxR?=
 =?utf-8?B?dzVYRGRzUkViellxZmdvbGZaWk9JTVFnUVphb0NRTWlXTUVwRGp1QWlmVjJm?=
 =?utf-8?B?K2tLZllSbkFXNFVaK0IwY0t6VjBqQzAxN0dyTGJ0TFVNem0rTjNRMkJnQmpI?=
 =?utf-8?B?N2EwelZaaHFseDJrRGhOOGdPUnpndHZxLzBMdEF5d0cyQlZrVG92VlVwS3dG?=
 =?utf-8?B?a0V0UGl5ZWRhaUUra29iSFNOa1BqZTFpTmVlSmVYYUNoTXMyQ0VJNUVET3Rt?=
 =?utf-8?B?SXJlbHFQemtKNitNbHZnQ0V2Yk5sN2pxVElPVExpSEVEUGhBN0twQ041NzBz?=
 =?utf-8?B?Tjk2Um0vNlU5SnIvWHg4MGtYekhFTWwzSEtuZW9EZjBGVk1sQVI4S1l0b3RW?=
 =?utf-8?B?ckFsekwycnh2ckJjYmNBVjhNNmUwa09yczNRL2V3RTFTc1JTN0NXQUl1QjA1?=
 =?utf-8?B?TTJ5bEd4dFVoQUpOVjZsaklGazlGWDNkbVd5TE5FTlkzRkRJQTdGaENUSGlD?=
 =?utf-8?B?cnJCRjF4bDFJOVdMV205blJad1lMZ3VyczVSdlNOK3J6SzQ5NmlvdEhwV0Yx?=
 =?utf-8?B?dHNjaUlEQmZMbzNvd2g1UjRWaDR6R1hqaXRIaEtCSUsyTDROMnJXNWsyT1E1?=
 =?utf-8?B?YXFmeDR5djZKVzhCS2JwcTVGTTc3d2IxYit0SlEvRVBsNTBlTTkzMnZKR3Zp?=
 =?utf-8?B?YmxJNUNsQjcrOVJlY3lFaElCNGJYN2ZTb1dCOTI1Y3QrcTlqOUxoY1lkNk9W?=
 =?utf-8?B?WmtxQllkNmNBMXErTXdjMjcrSU91NHZPRDJkVFJTbFJhS2FDNDU0ZnA2YlMw?=
 =?utf-8?B?UWJTbFdRSzBoVG5yM2hYSUMvaFFzTG84YkZrTVpJU21IVEdHdGVlY1FMNW5S?=
 =?utf-8?Q?rL8Jl5SNPiAV9Cw785AIbm7sI5UJLRpIxSTT7PO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc19567-a7a7-4350-d579-08d93566cf93
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:16:33.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipgml6i1zSXJEjv1LY/dAvMgS+tewhIIbOSx951KaMzczZOqdnPurHZD6HlhKlavCV4qFVSY/Gupuv/20htDr6LMu4Wk7Ao1CHnS6KHo6Dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912
Received-SPF: pass client-ip=40.107.20.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

21.06.2021 18:59, Kevin Wolf wrote:
> Am 21.06.2021 um 10:22 hat Paolo Bonzini geschrieben:
>> On 17/06/21 21:51, Vladimir Sementsov-Ogievskiy wrote:
>>> So, it's an RFC. I also can split the patch so that refactoring of
>>> qcow2_co_create() go in a separate preparation patch.
>>>
>>> Another RFC question, shouldn't we move to zstd by default in upstream
>>> too?
>>
>> I think backwards-incompatible changes in the past were not handled with
>> build options, but that can be changed.
>>
>> However I would prefer to have an option like
>> --with-qcow2-compression={zstd,zlib}.  Meson supports multiple-choice
>> options, they don't have to use enabled/disabled or (if boolean) true/false.
> 
> Yes, this is more extensible.

Looks good, I'll try. I'm just not familiar with it and followed the pattern of zstd option.

> 
>> Regarding changing the default, that would make images unreadable to QEMU
>> 5.0 and earlier versions.  Does that apply to images that have no compressed
>> clusters?
> 
> I think it does because you could be writing compressed clusters to it
> later.

I'm afraid it does anyway: incompatible feature bit is in use for the feature. Older Qemu will refuse opening image with incompatible bit

> Originally, we had only 'qemu-img convert -c' that could write
> compressed clusters, but today the backup job can write them, too, and
> it doesn't create the image file itself.
> 

More details:

- compression type is specified once, when image is created by qemu-img create Or blockdev-create. At that time incompatible bit is set if zstd is chosen.

- compressed writes are done by
   - qemu-img convert -c
   - backup jobs (blockdev-backup adn drive-backup) when option compress is set to true
   - compress filter (which is available to insert where user wants)

- drive-backup may create target image automatically or use existing image depending on options.

I have a plan to deprecate drive-backup (patches are somewhere in the list and waits for possibility to deprecate union fields in QAPI).

I think preferred way of compression would be compress-filter, and we may want to deprecate compress option of blockdev-backup at some moment.


-- 
Best regards,
Vladimir

