Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589623FEB55
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:30:57 +0200 (CEST)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLj3f-0005BF-UF
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLj1k-0004L8-PT; Thu, 02 Sep 2021 05:28:56 -0400
Received: from mail-am6eur05on2099.outbound.protection.outlook.com
 ([40.107.22.99]:22305 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLj1h-0006nm-UM; Thu, 02 Sep 2021 05:28:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdzfVlmCtLatfGtHUOhxfNd3dz+/mA7a1SC4oSleDfR/fPZdf0pe7b07cYS5coVn/Y16gAsMyiiXXTeudRN/6zciIRc6kdDoPOZjlpUlwAVMYyCrhL6eyVUVI6vr8ihWzgqXtBwW1nvFUnGpPimRDxtuVq4SaduBlN9e3RIQAB/SlKzSDkmlv5DvIjA9NlfSz7ORXCQSUGph7zOOE6WC24YTJHyZwkT/6ovxK6RPwb2wmsbjIO5b+byTDc7mVVqJ1Pf1yTUkIQrLoXOk0zfd7SVcLpkhb/3ichgXV8OLVs+rbUDbKTz8HZiNqu8h7/KUbR+ghMbnbIZwCoTPff+rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=E7kkx5ezq0KuXiUiqmHPc7ewZEBQkIHaElc7ejx7g00=;
 b=Ey1aqlxBwr/i6gg9w4nD5+b4czzuN+1Erj3Pi3GT4n4wNmRoHW4xEboHWgTZ3yNZYdSXmkn5IB9rtHVwGP9nOVq7phpZdbMAiR174DoGQQdSDGOV93Jaw/J8qNKDMg/InV3vEPjwDo6DEKOFPTKDAOuLBFk1UI8cdFoQYK44Jwl757FCAb0eGbTn1x4n7yDjXU0xYephLcqOQvY6y1Qfo24/GmHHZnN+dIgc+eJ4/Y5+OC/6ScDqC1e3cZo9pd5yW8jb/ZIN9C2RobM9YeS70GnTZkdQc9uGkWVJx97U9LvBWDcYe8NL1fTFSISoJn/npclQm7B+TAEtL8BnfF0HpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E7kkx5ezq0KuXiUiqmHPc7ewZEBQkIHaElc7ejx7g00=;
 b=gRACNBXU71258lhkL868gms+CZ1HfJRB2ZE7RxziLXaqKSM10/3d54zUcmFEWd5npZROVvtMZOxw8p8CDkw9vk/9lYFLLgOLeE7ygdHluRJC+O1/FwMUsVu2ExtCH55nfkxOsJ8ZsDRS/rIddnNJeXY+DNVOv8w4oW6DJItwlH0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 09:28:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 09:28:50 +0000
Subject: Re: [PATCH RFC 0/8] blockdev-replace
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 nshirokovskiy@virtuozzo.com, yur@virtuozzo.com, dim@virtuozzo.com,
 igor@virtuozzo.com, pkrempa@redhat.com, libvir-list@redhat.com,
 stefanha@redhat.com
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <96926fb9-0d5b-a7fb-87b1-764073d46521@virtuozzo.com>
Date: Thu, 2 Sep 2021 12:28:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 AM8P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 09:28:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 666a4024-7b7b-4bb4-8564-08d96df4125c
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5335DC6CE4850EA3C8FD9AC4C1CE9@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 26D8Ut8vux0LV7IV2ffki85Is2iKp54s3COMZpdIOhZBnnS2nk9WEltIcUN348lgZiWI5usQ1fYka/3fo/6gzjZLIK1w82VUIzf61ZRcKWpEuw4gCalMxszm5V+GxH51Gjc1LRfwXz80h/I7oPlHdB/+Ji5+EMERIFTvsQZ7nB5c+rpWgmdmXkH+9NMybjmJ9YK44Cz024F3uu5HqANX14A1j+OU898y99I4mCLuxlkqbT6VzoY53T3tAvVNRFnCzKo1N3GGmNdrtloYRWCFp4JGwKhdccCIm7EbGPkrB2VuGw+V7Fv6upwuUm9pLx2hg2qWmsIzH/kJLGIv67C+vgLXPoBvEhdSYs0HflOQAZrZEZRr444UxdRHQ9qcDHMIo0l7KFweLB+GpM9wNFYDxRs58dRsjgjrdRb9P4q25/nta6ySTldga5MNFqBeQsPo5wnCt7myZMYtjDou6p5R2990pxtb8ntmB68l3Fpm3DoWRwL9YDH1Nw/1kG+sZIIrpny9gt0/ZULJQV88S8pVfZBQB49ntt/tnXxPJ1cGI6dxcjw3sUxBH3oYKRVEUrFUXeb+HTORBxlPaln0xdqIy6fP54L27d4rBISbuC1deoDax5yZ/8oQNXSAEoN+V9A5ZH3YvBWVj2NV6GpgPXP9uUW186+4iyWlZ5q0DhH54bDSw3i1Y5rNr5srJGZS3Gix4hL4AxV8uNOFf5sn9y4OejnIF66uLBb8wwwuexfLibLGbz2bju5eZdZBx9j0mCit44xLSpjegmHmMsawcEgpHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(31696002)(2906002)(6486002)(86362001)(36756003)(66476007)(66946007)(8676002)(66556008)(26005)(6916009)(2616005)(956004)(7416002)(316002)(5660300002)(52116002)(16576012)(8936002)(83380400001)(4326008)(31686004)(478600001)(186003)(38350700002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVZsK05LN2laNTJtQW9LMWRoSlVKaU91MWJKVkgxblIvTkxSK09sOElzSHpJ?=
 =?utf-8?B?UmhVR2tMUS91U1VBY3drb0hzV1FlNXNIYjVramxJeUV5RlQ4ZDB4Tml2U3hY?=
 =?utf-8?B?QiszMkthSjBNU2pVTFg4Y2I5bUtHRGxOM2hpNWppQlVSLzQwZGlIT2ppVkox?=
 =?utf-8?B?V2FBYnpYRWpJVk5oeFdmR1RPQUpxTjR0SGZ3eUljSzhNMzcyTUpEVXhscUxD?=
 =?utf-8?B?SU9yTTEzV3ZSSTl4ZCt3aXh0ZDNnNjdxWkFKSDdHd0ZESXQ3ays0YTZ5bUFr?=
 =?utf-8?B?ZFFpRDkvRGZuVmhodkJZNDhKVkdNNDZtRjRiajJCRVJ2d1Zzb3dvd1E5TGtY?=
 =?utf-8?B?dm1XSWRZY3NIdWd0VkZBM3VlWS8yVUJIZXRqSnZuU001WVUzVXBLR0FVM0Z0?=
 =?utf-8?B?RldlK1hGRDFSaS9WVjVWR3VlZzBIZHNhaE1KOXBzeElpVTd0MmIrcU1tU1Nn?=
 =?utf-8?B?MjI5UVhIL1lOVGxaZ3RwblVlTHJYUDhoZ05wMWUwNHRiTWhWb0NtL2tVTk41?=
 =?utf-8?B?RGFQQXBMRmNGOGJQck1MVGpIbE9YUytoelJPMjdJWTVWdkNUNXNubER5d2NE?=
 =?utf-8?B?THZOcm5idG54WDlXQUpyeTdTeXBFNzdlWU9palRsT1NFNGt2MzZsZi9Nb2s0?=
 =?utf-8?B?bU1rNlAxcWg1Zm1aeU9ZR3l1L1hRZlVlTk94MmhKNHE5M1ZrNjkwUVNxNHJo?=
 =?utf-8?B?dnRIRXFMbElsQ0c2Ty9MbmhMb0lJSkVGYXNHREVpd0dQdkFsYXRwdFphYVdB?=
 =?utf-8?B?TjFCZzVuVDk0Qm93b0RjWmQ1dzllOG80TURScTdvUFYvdW5ZakJPKzk3SHFz?=
 =?utf-8?B?RjREV2xxTmZIMEdKWXEzMEx5UDJrUGxHZitTZFNBT01wQ2dDSmxaT1BQd1hE?=
 =?utf-8?B?cytCVlc5OTZHb2UzaWxqM0RwY0E5Z04xNVV1NE5nVmdwQzlGZEFrcFhzekJ1?=
 =?utf-8?B?aWdCYWNRV2lHaUxWK29EbUFUNE5aeXpLb20xV1VtbmNQZW1jakdoNVlPaG4w?=
 =?utf-8?B?d0VnK2RrSTRndGgyaW44MVVrSVRtR011dHR3OUhzMU1NaUttR0RBSjFWOGxJ?=
 =?utf-8?B?aTA2UDRiNlV1NlBKc21GVmMrdmNYN1hTNDhPQ1lSQlpRUTJXMEFFTFhRazVL?=
 =?utf-8?B?NkhuN1pJeHQ4aUhQaEhIYzlYYVpidnJYMWRXOXgrM05uNC9URFkxZWxDQk9R?=
 =?utf-8?B?RlZBbDh5b1dGQUtaTzg2SHA1TXl2N2xRcE5CbGZ6OGJzN3dMOWdpT255YmtF?=
 =?utf-8?B?SE11L2twUy9Oa3dNa3JONnM1L1pQazFXT0w3M3Y4V0RBZkJXTG9yL1FqaGpS?=
 =?utf-8?B?ZlczM3lWNjdidWhVbStTckF2Q3J1eWZBZWd5clJUN3dIamJsOHRZYXI5S3Ay?=
 =?utf-8?B?UlduelduNHlUTTJLRzdzS2NkbzZycVpaTjlBZnBBKzF6aE5MNmszV3RDa3VE?=
 =?utf-8?B?VW5SRmw4c29oODlUdTRpcXFBRHZVcUR4ajhOV2g2ZlNVTHcvOE54cEZSWjZQ?=
 =?utf-8?B?UTZyL2t3Mzh0QXluZ3lGR0tUTmdkWmI5WFJCZGFnMEZoamcvVmYzZ3hvOVBI?=
 =?utf-8?B?LzJFWldmemJQbXlBWk56cW9MR2VXT21VeXJRc0E5QXF6QjJRMHVWa2tSTFNW?=
 =?utf-8?B?aTdpMFYreVlROXE3WTV4RHBUVGx5RHZxWDR5cGc4RGF3RjZRSVRZcjlsNXRw?=
 =?utf-8?B?UWQ1UkNTL0xwYkJiTDkzQ1pSeGlnSUFNb1ZLZ0w4ekpnaVJVeWh4UWswSXBH?=
 =?utf-8?Q?neuiBo4mykPn1ZQrZe0jQ/pmYOmlDWHBXQwddlJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666a4024-7b7b-4bb4-8564-08d96df4125c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:28:49.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tBgNtyt5GxP40rjp4mEbVt2F/06/joF7RAAx8Q+QNXPszMlSnsZVBkMk1hoYkM4+czEwrY5ifSh83mFZvYoHU5VhQVBxvGqOtRjTn0HCQG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Received-SPF: pass client-ip=40.107.22.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_NONE=-0.0001,
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

ping

02.08.2021 21:54, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> As a continuation of "Qemu block filter insertion/removal API"
> discussion, here is my proposal of blockdev-replace.
> 
> The realization allows:
> 
> - replace children of different parents: BDS, block devices, block
>    exports
> 
> - automatically replace all parents of specific BDS, excluding creating
>    loops (like bdrv_replace_node())
> 
> - do several replacements in one transaction
> 
> It's an untested draft, so you may go to patch 8, to look at QAPI
> addition.
> 
> Vladimir Sementsov-Ogievskiy (8):
>    block-backend: blk_root(): drop const specifier on return type
>    block: add BlockParentClass class
>    block: realize BlockParentClass for BlockDriverState
>    block/export: realize BlockParentClass functionality
>    qdev: improve find_device_state() to distinguish simple not found case
>    qdev: realize BlockParentClass
>    block: improve bdrv_replace_node_noperm()
>    qapi: add blockdev-replace command
> 
>   qapi/block-core.json           |  78 ++++++++++++++++
>   include/block/block-parent.h   |  32 +++++++
>   include/sysemu/block-backend.h |   2 +-
>   block.c                        | 158 ++++++++++++++++++++++++++++++++-
>   block/block-backend.c          |   2 +-
>   block/block-parent.c           |  66 ++++++++++++++
>   block/export/export.c          |  44 +++++++++
>   softmmu/qdev-monitor.c         |  90 +++++++++++++++----
>   block/meson.build              |   1 +
>   9 files changed, 453 insertions(+), 20 deletions(-)
>   create mode 100644 include/block/block-parent.h
>   create mode 100644 block/block-parent.c
> 


-- 
Best regards,
Vladimir

