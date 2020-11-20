Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9782BAF99
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:07:55 +0100 (CET)
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8x0-0004j5-JS
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg8oA-0003YL-FH
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:58:47 -0500
Received: from mail-vi1eur05on2091.outbound.protection.outlook.com
 ([40.107.21.91]:37286 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg8o6-0007YI-C3
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:58:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcCcInf7R7iYtKYd30JiGUktWYp9oxtotuIzOHNx9+jnr+bEY8b9Iy2LylEvyHyGDqqWoH22L04rNKOALTtFaSGctfFOMhGmSgA+pjG6OS+2R18BX/n7AK0bkZpri8OiD1TWhAzIwEdh5B0L+qkYdaadT+g2u59lML1Zt+UC+ibT1rTfi0+A8za6p2tN7yQbOi7u4XtmXFjh0Tl2km2eeTk57opaaF1ZR0PE6oHj3Bt7lRBS1Gj51TgkBzWyk1DMrKAYJVWHtv7R6j6nQQfTXZNuCSufKb2OiRbkiRCgSb9rO7JSRB/L6Asp7RcVyLxDKbrLhZ1pZXl619Scj9f/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N+rGJdWCUksYy0c0Y3KdK2p3LEcXWVVlbh5YrVwa3s=;
 b=CdZZHmSIiyIJRVhxF2qAN/hGjbJ9kGuytj08zjBS2QG7hYy6FmGnsmkdIr+0yGVilAvYUN6ZEeXHb5ZWEl+EYDVQ6t2XWuDIMIEshCc+bhbgdRkACcRoq9C/38Gsz3tAnXrSY21stlI2dVs5cOjsa9RPvgTCZesOXzLM99C43fHKvzYBWcMYB3JstSqazowda50cuRlHTeXGbhehCyG1eitcZ0vYugrynNs3+AEZ9x8kP9JZU/sj/M1lW5nkQt6ZeT20UehALGJxaYASyGOjrP7ByR3syVK/PxkIdZp/7a4jiLZUlQHnr8q4Sg+JxC/Ryoa7L/8wCGyXAb7IOcCxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N+rGJdWCUksYy0c0Y3KdK2p3LEcXWVVlbh5YrVwa3s=;
 b=RxiepTge+mgYUbb2k0SQvsNXcdkjSo6CAPobC9Ko5UHuHxBYCKmq8FFF4JCmHQxYrI664iRSpGkny/yoMYn+GpGR6ZbGEnRbUqB/olNRi/lIoBCS/6m8SXLIJU3VvMUdN3gncMA620C0aKEwBNcuP0E3VYMExBGyiu2ewlLZibk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB4304.eurprd08.prod.outlook.com
 (2603:10a6:803:f2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 15:43:36 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 15:43:36 +0000
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
 <20201119183902.GC6538@xz-x1>
 <8eb862a9-90d3-e3ea-5bdf-50287ce2226f@virtuozzo.com>
 <20201120150124.GD32525@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <68d02b8b-0335-9b8f-bc0a-2f3d51d7e316@virtuozzo.com>
Date: Fri, 20 Nov 2020 18:43:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201120150124.GD32525@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR01CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::47) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR01CA0106.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 15:43:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 648e4f2c-74fc-4dda-0342-08d88d6b0b02
X-MS-TrafficTypeDiagnostic: VI1PR08MB4304:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB430453AB7F802C4D7C9F93B69FFF0@VI1PR08MB4304.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2hWBklkg9SQj6D8OllZsygPFapuAOsZ6QrfR8BFoJx0j3MZxDKLy4k7flgP4NpZiPZkmOZT6mLHEpPFmh+3h8Hx535n7XOgD51+Vk6SWKWHNGb9OtRwipRCZ9IXjIkqNTkKP5VyfcQGBb5zoKgfPzJnJ/4Ec/hz2Iw5YePwc4ixp+a6ZnaWTICIN/520LRMgO6/7N8KZBNjydJKmKACkjrO8mCSUATn/9JDkauFjFiqF3wfUEXGRfOeaz0jAfBGtZyrkjNloEWENCr2fm27MuIdN6AvyzxEh4pLc4D2Nb9w8kas+YTkSnJlNiZpI5dZor3DY85kRAZFzXVuEFs0x1zsZgwNLHapR73h2QiW11ZfW2YLaA3BKDZPZ5Pm4xfe7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(2906002)(186003)(86362001)(52116002)(66556008)(8676002)(66476007)(31696002)(66946007)(8936002)(498600001)(16576012)(6916009)(83380400001)(2616005)(36756003)(16526019)(31686004)(26005)(54906003)(4326008)(6486002)(5660300002)(53546011)(956004)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 1hUBh1s0zrd/wjXU+q0R3JaUDI12dJsV1PyNI6aX9dNWWfKLjMSwbj6YS9cKVgwqfvpo/FNpAdQ3VSlKyo/0ndwDJYApe7JpXcJjh9U3kwlUHWMzKYHwyN/7KSF14jGrhXLKMW8PB0Y3F4QZp5aWbU19zf77rv/3W/h+zoAdK5og3GVcTQL0g2C3rfITr7g70MJUOCtWWozhNd3Cjz0K8KYaJ5as5tiV37uRlsTs9ZkJh1Ry/1og8ghF6xAR5wvRMeXfaZB4YEUnL6BWqZqdhnEA480egPwZ4mmE2b5kQ6vramFIh0Aawh2q2XBloMnYHABheR/VyEJhrKR25Ao+vQfbnrpSXO+F/CAia9E6ckE5uhLxZNxOsLoKU/mRaTiLdLRF4SMI1b+SfX3NvHcApcKxELTVBitM47Yx3gwvaA+XoxvgwuK0LuArSnq2JYYsiPHq07RhodiynYskZ8vp0CMsN7yxBjN/qr0+gPPqdVr1lKL/QwrxZU5tQenBQl8RMHz4EYr1fSAZWAaNX68JDR+gFcUbQ1uMUN2Pjdk39btqMXmjjcGLjh9FFoXnn+E+K/C2gtr1C9980rTMzGvL/3wp/tU4V8aFUzSrojV9BsZnlXPIbFIfdq0bspNmllFK0ELJHfFEpJi5AB5bUkh4ObUjwrTgPOlAWh0lWk2XyCmRgt1UqHxrqbn40Z55fRsBZa1CJ14kvj879TF8JHh+uI9l8fUN4nszMsb6hRcWEQPtl1ouhJ39Ht5Ax0jG1kdztMa49ngAuBqXzEW82m95zk0MYNsm91wwsjuhSPkP1L68CmI4awU8rIyEhK5/W/pk72LUVvCtGGAUg8GUx0i6AeQtMQB4l6V20ZulbhXI8QUMdxTplHkNCtMpg/4eggGlZx8nDuV7+fOwOETuT4BdSw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648e4f2c-74fc-4dda-0342-08d88d6b0b02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 15:43:36.1212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fc35gRcAreTJLpmlKyxxWNGv3G6FMnTIQUeG6ACMYFQ7saGG81GEoEVhfCgaD5tDuWUhyZY6ZpKLk7I0C6l7MnHMr/4XQkFTJibTRgO2mAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4304
Received-SPF: pass client-ip=40.107.21.91;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

On 20.11.2020 18:01, Peter Xu wrote:
> On Fri, Nov 20, 2020 at 02:04:46PM +0300, Andrey Gruzdev wrote:
>>>> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
>>>> +        /* Nothing to do with read-only and MMIO-writable regions */
>>>> +        if (bs->mr->readonly || bs->mr->rom_device) {
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        /* Register block memory with UFFD to track writes */
>>>> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
>>>> +                bs->max_length, false, true)) {
>>>> +            goto fail;
>>>> +        }
>>>> +        /* Apply UFFD write protection to the block memory range */
>>>> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
>>>> +                bs->max_length, true)) {
>>>
>>> Here logically we need to undo the previous register first, however userfaultfd
>>> will auto-clean these when close(fd), so it's ok.  However still better to
>>> unwind the protection of pages, I think.  So...
>>>
>>
>> It should auto-clean, but as an additional safety measure - yes.
> 
> I'm afraid it will only clean up the registers, but not the page table updates;
> at least that should be what we do now in the kernel. I'm not sure whether we
> should always force the kernel to unprotect those when close(). The problem is
> the registered range is normally quite large while the wr-protect range can be
> very small (page-based), so that could take a lot of time, which can be
> unnecessary, since the userspace is the one that knows the best on which range
> was protected.
> 
> Indeed I can't think if anything really bad even if not unprotect the pages as
> you do right now - what will happen is that the wr-protected pages will have
> UFFD_WP set and PAGE_RW cleared in the page tables even after the close(fd).
> It means after the snapshot got cancelled those wr-protected pages could still
> trigger page fault again when being written, though since it's not covered by
> uffd-wp protected vmas, it'll become a "normal cow" fault, and the write bit
> will be recovered.  However the UFFD_WP bit in the page tables could got
> leftover there...  So maybe it's still best to unprotect from userspace.
> 
> There's an idea that maybe we can auto-remove the UFFD_WP bit in kernel when
> cow happens for a page, but that's definitely out of topic (and we must make
> sure things like "enforced cow for read-only get_user_pages() won't happen
> again").  No hard to do that in userspace, anyways.
> 

Oh, I've got the point. Sure, I need to add un-protect to cleanup code.
Thanks for clarification of details on kernel implementation!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

