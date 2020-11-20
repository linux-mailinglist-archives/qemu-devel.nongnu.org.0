Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F5F2BA8CB
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:14:34 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4N7-0000qS-1C
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4M3-0000Oq-8p
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:13:27 -0500
Received: from mail-vi1eur05on2139.outbound.protection.outlook.com
 ([40.107.21.139]:5761 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kg4M0-0001ys-2I
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:13:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSJyYNVGSEF1HgzDQuugmOgjdl3i4BHpxkLgDjuVmfHYSObxWD8rH9DNJjYl+wWafIKopbnTXyEgaYLCGnXKZMG2LoCBT8TzRrJ68+986le14YHVYnhB+c2NXauTgDXCPvZtClte0n8dYSKsyn9hXbjSgYTeMbpFyBqzm9lx1eqTT6kLQ15S11cFoBAX3Y1T9S4Gub9/iZHA9+aVAJnb7BzdFk8w6FfopcsJbipIdpy0fKlS3/6aIYul6uq72D9AU1GJwXZcx0hX7pq8gstsq4jA+GvU3GlSITTYFupoU2zrJIVzBUO/+RW43yEzSXJXmPLLerEED1dQ6J+cdI/nfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XO+Rk2mVb6DxZLFzrWfqqiMX7kaqPLngWbJ7XQrAOM=;
 b=lZbbwPcSSupYSLTTZbCrCDpltmpPyBkYbIsdqqWTJLpaopZcnhTtVu/tAMn8hcvTjz0vxoNXffVpQABtj4fKqG9If4Enqp0njolIkvivpj20CzeJ7r17eH8O0TG3XDa07H96DNww/a2PQvToDGBYDBYvsGgez/E04zGy93WhpXzoGe9jMAA+PdGBVZGNb0Q3PZ9KL1qq72a7126aKa5l6IYlLHXJkBJv+LoBW+X4nTig0ugiBSpAFicUTFPyVUobHHtwaf91xVYf5r03dEGz2mJT3sRP8SjH6/J60K9orKa2p/Sse1PLjP8IWXy7zV+Gek/X9N6fEhf80Il1eezNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XO+Rk2mVb6DxZLFzrWfqqiMX7kaqPLngWbJ7XQrAOM=;
 b=kRtH2jCbPddS3iuTnh0lQr7bBYCU/ItKPlD5ExGqQl19wJABdVCIXSz88R0zsXONqdDVU/EHBkZNMXYKPPOyH1Pt4Nr457yg60sZjjJ+CJmgpZVSN10MukWgXKwcZ/9ZRZWWqOl+G80zte1IG4TWq1ylGNxyihr0oCp3aaXTg7U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB3486.eurprd08.prod.outlook.com
 (2603:10a6:803:8a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 11:13:19 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::8d6a:734c:e4a2:8543%7]) with mapi id 15.20.3589.020; Fri, 20 Nov 2020
 11:13:19 +0000
Subject: Re: [PATCH v3 5/7] implementation of vm_start() BH
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-6-andrey.gruzdev@virtuozzo.com>
 <20201119184624.GD6538@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <ff13c919-6c47-93a0-cff9-f4867e7cc108@virtuozzo.com>
Date: Fri, 20 Nov 2020 14:13:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119184624.GD6538@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0085.eurprd03.prod.outlook.com
 (2603:10a6:208:69::26) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0085.eurprd03.prod.outlook.com (2603:10a6:208:69::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 11:13:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52912d5c-9711-4eb1-66b0-08d88d454916
X-MS-TrafficTypeDiagnostic: VI1PR08MB3486:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3486E14195D8C804543A8CCC9FFF0@VI1PR08MB3486.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2XjC4Eqs2sN1EzzRPN/BUuDzkIrYF3X/ap1if2o35ujf9PCJft/ivcKfg5U4U9OJsp1LAerVJuyMoYDWgovrPpPBExBqewzqJgMqi/cID04m+Opl38Nep2oMo+w9rXdzevQD9A9jkMLG6CUo5b6Rnar8FjJ8oGTppz5ZV8hTkO76ZKg2f4ig5xU5QVYTlqC6Eo3hl5aMpLlKVkjZheum9XEMzBPsuybPM23gufLiyCDbqBDalylcb3F48cd9iWYlIj1JDF/TP1c6MO3nENZ6Wgy08H4jbDTNpNJmYF1yAbiyR9INqhUTY8PAIt+Z8PRcNRBKgMk8OeFnMmXeZgdybOpfr4fkYTvgMO4WMDJ6jGcL25hiF9tF59n+n9P2tcs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(366004)(136003)(346002)(376002)(956004)(2616005)(6916009)(8936002)(8676002)(54906003)(86362001)(44832011)(4326008)(31696002)(83380400001)(66476007)(53546011)(26005)(36756003)(16526019)(5660300002)(31686004)(6486002)(52116002)(186003)(16576012)(66556008)(478600001)(66946007)(2906002)(316002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 5pv+NLt+tSKYA7vPTU2iZOZUtu783NnrAPYuoynwm/Qq4E3+hI477hqLDriTD4iSye5pp3z4xbGdngQ6Xns+kSVXNuPDTc0VsOU3V7qUT0ublICMt5IVIO3jT0/rPdiGH6WWazmZfFah+iOlKbBdmBy30hYNUerkxikg6jdbi2ujiJofj3Gr4Jjq8ZPXY3gHJx2yByEUDm21Wr0/cECyGQv4Oz/ZTi78fr4XAs7OSNaRcTuBEfAVqGSiZJRs56Oj7dOYSPiz+05I8CL2OWUo7U3nPQJnu1fJjEPBYXaf0lRFlGHNxos+0l9IasNBze/xdxHUwTWEsmaYVcltZvSNKK1gUs13JJ/Btj0l7eG9WSnpbBpMjx+h5LV1JJr0U4U2ASLO25cNHQBat86QR1msaQpZPhxEL5jwNEm4adPYvXVA4VgWja/QG1OFYtjZGdp+6eBt/+PWQj7dASCdXPyb6RJ0lL7xOI05gbyUtgxxQapLufRLFbWjVhPKuQJKtOM3NVV8D48shCdOcRAZNElA7CtSv1qKeo9/qWrRzKRe98cn0+neL8hkegHYADZRPzmrWbtwToBmydRH3Q4OBux/sn1uvJTxdp1+tBUYXoz0h9J3DDCBlOnu4u4uEU0r85pLacqvFt2KvZSmiXUT6969EQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52912d5c-9711-4eb1-66b0-08d88d454916
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 11:13:19.4418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2it84iMYsPolmImZcypSYixaU8hLHxtVGV0JxytXD3pDlO53IumB5WDvivvU11YLRDXpOBzAWP1IR6k0GJ0sjv1mYOuDrgIlW6aS4Ktg2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3486
Received-SPF: pass client-ip=40.107.21.139;
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

On 19.11.2020 21:46, Peter Xu wrote:
> On Thu, Nov 19, 2020 at 03:59:38PM +0300, Andrey Gruzdev wrote:
>> To avoid saving updated versions of memory pages we need
>> to start tracking RAM writes before we resume operation of
>> vCPUs. This sequence is especially critical for virtio device
>> backends whos VQs are mapped to main memory and accessed
>> directly not using MMIO callbacks.
>>
>> One problem is that vm_start() routine makes calls state
>> change notifier callbacks directly from itself. Virtio drivers
>> do some stuff with syncing/flusing VQs in its notifier routines.
>> Since we poll UFFD and process faults on the same thread, that
>> leads to the situation when the thread locks in vm_start()
>> if we try to call it from the migration thread.
> 
> There's a nice comment in previous patch about this before the bottom half
> created, thanks, that's helpful.  Though IMHO this patch can directly be
> squashed into previous one, since it's confusing with the comment there but
> without doing anything about it.
> 

Yes, agree, better to squash this small commit.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com

