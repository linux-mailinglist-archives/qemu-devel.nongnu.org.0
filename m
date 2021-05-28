Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB02394515
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 17:31:06 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmeRz-00065W-JK
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 11:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmeQe-0005PA-AX; Fri, 28 May 2021 11:29:40 -0400
Received: from mail-he1eur04on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::72e]:26247
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmeQZ-0003TU-SY; Fri, 28 May 2021 11:29:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RXVZ1NWTCJC9X03od34ag7YSAT5yMrpbt/Yhx/GyKlvHnx5ksG+qVtR1CdxtIx7cuWTrf1Xo+nIcTgw7gr+TBn7xFILILZmA79Gus7CDoy8bCYunPlVO7psXqTn6xwBfE/MRt69f9sjCCQhhGv0RMlBN5lqgLRaOmOa0FKxPe/iZXtfq8r7dTi+E3Ntc4Quk5HQ3c1P0kKqx55r9/V8vneFKZDH4pIub9T4DDL/kiyHDt1RtLWixqc1IcNDJNd2xPw8gGrjqR+QXhjyeFcNPG6kT8RJUaQhmFCZ3kgMnHBxnZ66mw63iHULLAspytw4J1cPf8LqdjFcc5kiC0ERPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCzGJoUPSDNs5i6DSv7NJNS5ZwwAvh/0jP2rK71anJI=;
 b=IufR23n6BUxFx2Z3X1T1OhWcxkWvwT21FDqW/o+GWJf/AZCod9kesCTbo18PEL0cxCjGwuZqBBdyc71tpxcdWRla8o4XyJcBlrEpU45ifgZZrJOpzFW49pAg2zi3pfJ2/2yaZZxUb6yTlcFLEvnKRFNkktr7R2rtSmDPdai3bwxDQaFLMgewzsv5NWzz7oMm3zjRbXc3gQtb39svWJNzFUqjWXpilx9Z8nTK4I5hCwAq3xjgfaDjmalWghgisAoOrF2eui0d3UuBee5SEyjxl+Qg3ZcBm+41uCzb5YRfCFQ7Svbss622DTvErtk3envrfiCuWH38Wq3GE5bmj0APYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCzGJoUPSDNs5i6DSv7NJNS5ZwwAvh/0jP2rK71anJI=;
 b=FOUCV8X4wprATe4Awe0TLihzUkAho6dSBtxaCg7y5vJ6Gpo14WWOlyb3QpANP38INdNTyrvLhYTlQW3Djy/8tuQQOITmp1IvcDLUsJX4bz7FK5DVPMF6aheeCSvFw+rgekbQx7KH2BEpppltPpWd/qJgnopjF/EnybxghOg3TrI=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1649.eurprd08.prod.outlook.com (2603:10a6:203:38::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Fri, 28 May
 2021 15:29:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 15:29:31 +0000
Subject: Re: [PATCH v2 08/33] block/backup: drop support for copy_range
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 den@openvz.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-9-vsementsov@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c54a78a1-1276-e5f7-2fe1-e7348116b83b@virtuozzo.com>
Date: Fri, 28 May 2021 18:29:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520142205.607501-9-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR3P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR3P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.21 via Frontend Transport; Fri, 28 May 2021 15:29:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9267e84a-cda6-4078-d738-08d921ed63bc
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1649:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1649BB0A261DB9C38A0C64E7C1229@AM5PR0801MB1649.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jag2tpEGkwmS2G2I01RwEupW5dvRebQfdD6kk55QN3EeHrvjGjCdXKu0VZGmMMgXnzZK5JY92qtx5fO5nE7GorO27GyLzeMXwFwpjtDIJN2TgXFJaTXYRWFmkqPMQYsQVMlWIV7X5U5Tm/4JC2IWGKeQ083sTMA+MSFSbD2mlYv1jMQqvLCXx0ekSnpgBfns2//kyX0KlhotumA25KB9hCcMQIbm7AcuyBZyVqAQiCCBcfCdmmLk25401O08nAJtJZxZWl4oBPvn/U215xIA3Je+lYEk8DQpDiFVIEtamUwB8AoHqZF9TRY9epk9W0PQY8qxYSVcONplDzeYECj+T/ePM5QojRVpT8En5AltVzrm7UI5aspl5emUFZdVDVc/o++4ixz89u5uMMTDf0VSORbbLro2p0Eowd1Ud7sDI9F71Go8KDXwf6VMMSJ5yvdufoQZoCHAU3YUhWHGXqReqOQLjROmZ3eOc7jg3/G8kSSX8mX0WmNKPKxQdKtJ+mQF9ikpD/Q44Psj43PyZCrFzwnl8ucI1q3zl1wtN76wlTKatQmp/j4A9Da2nLyMA89kqtQUfeK2Ef86CEHddRH5oNLN8X3wXTjVAtmZGQHc5YpdpzfhAxuBsYQCPjJ9LkTlrlc32nvaVZCduXKRIsIzXTUAGYBaBjE1Gik2UAryK+4UOVIfPFUcnawVXpBHMJAyMFA3ZMcqu2BUnQnq0Vaq8Mr99Ns/+jIpgfvuy1+fmoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(346002)(136003)(39840400004)(83380400001)(38100700002)(38350700002)(186003)(956004)(2616005)(5660300002)(66476007)(16526019)(36756003)(107886003)(31686004)(6916009)(7416002)(4326008)(6486002)(478600001)(2906002)(8676002)(316002)(26005)(52116002)(16576012)(86362001)(31696002)(66556008)(66946007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L0FnYmlFbm1ORElBK2tVbVhBTjNJNVdjUk40MUl3K1FSTmprME5SZXFodElT?=
 =?utf-8?B?eHBWT3pYcWZMVVg2UDlJeldOTmhFSTZCS2ovTmFRbWY0dnUxdFh5OVIwV2F0?=
 =?utf-8?B?U2VUUGxONXZmYU5ybWFhb3lMRmswNFd3NDRwaWtVczFBeWRUU0g5UHdSYjBt?=
 =?utf-8?B?L09iTm1ObzAwaWdISnl1L25BdjRkaGk4bDExbTc1VURiT015S3gvbk9zWnlV?=
 =?utf-8?B?bnFzL2V6L3BoSXBXKzhFdVJHaGZGek5zbjhtSzdNWG1HbTZlMVp3VURXYzEr?=
 =?utf-8?B?VTVudEtTbHNFa3k4ZkJPcXlmN3ZNdlp5WTFOQ001Tkw2Zmh2U0pPdEZhaGRp?=
 =?utf-8?B?QUtUNExtb2lnNVY3N0M3cXN4bEI5S1hQd3o5YmIzc09nUW04S2hIeDBmV0Nu?=
 =?utf-8?B?Y0R5aEZOMndBZzZlczJQYXU2SGdabXQ1dFB4Z0EvbzBmNW03Z3crUmhqZjB5?=
 =?utf-8?B?Q2VWNWl3M0NWYitMY3kzR2lGSDJJOU53NlBNcDE1MFJvOHhnMUVtMzJtSE1w?=
 =?utf-8?B?UEY1UUtDVzN1R3RkS1VScjI3cFFkdFhFK2lVWU8wZC95VmZMRnZwdUhyK1JD?=
 =?utf-8?B?UEZENWZUS0pxb0hHR2NtRERpMlN1aEpxQ29Lb1NFVFUvY1JOUXNhbTdHS1Jj?=
 =?utf-8?B?dkxTaDlDMndZaDkzNWhITTNpNjNDdDBhZjZHNktRNGVVUThNejR0NWU5amhi?=
 =?utf-8?B?U3ByMENUWXM4K01HeTAvdHFuVlpCN0trSldWNnBJcDNCNlR2Y3BnL1BOdXVU?=
 =?utf-8?B?RHVoR09BZzFlWU0vbW0vOE9EU1lkS01qejJNaXo5UWJlUThsSUwvUFZTY0Nw?=
 =?utf-8?B?dWNHMXFCR1duYUU5b0pkNFRLS1liR3FaMnZwaVprMUFlZVR5bFBRSGpNWDc0?=
 =?utf-8?B?S3lEVGM3VGRmcXM5NksvNzdBVjBsSG93RDFaVnVLbkQ1bXlwRXBXVXFvQ1hr?=
 =?utf-8?B?bWR6eXJrOURQb3JVa0w2eHU1b2g2dnhhUEt4aVRwWVpYT2FPcDUxdWMvZHV5?=
 =?utf-8?B?VXpCejFjSW9RZlpPcjZnSDlCcktiU096RC9LSXZ6NlJlMFcvWHJvL0UvNXRu?=
 =?utf-8?B?dzVyWUhjbmp6RHRhQTJyZUNWVUQyNlFUd1JJKzR5b2ZlYmUrNDMvSnZqRmwx?=
 =?utf-8?B?NVQrdkI5bFZxWm5zSnhZRXByRlNZSVcwYWhMYXc4ZjNwZGFnSU85REI2bHF6?=
 =?utf-8?B?WVRINHI5VVBSK2dJTW4xNHRha0dGVlpaUzZYT3FuYlkvbU8zczVLMm41Mko2?=
 =?utf-8?B?aERRTnFZSm13bnUxNGVHZGdXdWhTRlZ2R0ZjMS9pUGFDL0pnRm9rZ1c1ZWtW?=
 =?utf-8?B?L0loV3NNSGlTUmwzdFlUK3pDcnBHdkhQMEx2Z3pqaTczNEk4M2pFaVJXOGFY?=
 =?utf-8?B?S2RpcUgrQ2xBVlZtemZKcG0zczdsc2l4Qm5TSlEwcHVtWTE1Tm1WeWp4V2Qw?=
 =?utf-8?B?NGtGZ2dlYkhBL2JxVlhWQkIydEJmaDVramUwMytCTHFrNzZhajNlR1FBOVI1?=
 =?utf-8?B?ZWhDSDRoenllWWQvQ2FKbnFHdERlWXVGUk5zVUg1bExrVmMrUGRwWW1VZ2N3?=
 =?utf-8?B?N3dRdDQ4Q01FUFR6RGlRQTdqSW1sRWhnaXBQT21nRDdrL0k1TUdJN2dCRVdF?=
 =?utf-8?B?Uzdsb3FXUzRIV0FXQkJvVVRTam15V0RVN1VWM0t6ZFczSGNoUFU4bXg2UWZu?=
 =?utf-8?B?b05pU0hVQmRBZzlZbHgzNmRUL21vOVpUTXdGMmFpVmkyUCt6aU9nVXRYOFMr?=
 =?utf-8?Q?Fu48oEdt8CyN/JlGKd05mDdovPu4Hfe3Y1A30cA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9267e84a-cda6-4078-d738-08d921ed63bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 15:29:31.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9uPJAlR0gI0EYi1N+ZRbMT3vtOq2boUVtygAe6G5GzqVxa0uuoxphvxrg3BIoVkKTP/pC9YXxZmAmdsRV99IaMGtiHUj/8/3HcfGRE4Sf6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1649
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

20.05.2021 17:21, Vladimir Sementsov-Ogievskiy wrote:
> copy_range is not a default behavior since 6a30f663d4c0b3c, and it's
> now available only though x-perf experimantal argument, so it's OK to
> drop it.
> 
> Even when backup is used to copy disk to same filesystem, and
> filesystem supports zero-copy copy_range, copy_range is probably not
> what we want for backup: backup has good property of making a copy of
> active disk, with no impact to active disk itself (unlike creating a
> snapshot). And if copy_range instead of copying data adds fs-level
> references, and on next guest write COW operation occurs, it's seems
> most possible, that new block will be allocated for original vm disk,
> not for backup disk. Thus, fragmentation of original disk will
> increase.
> 
> We can simply add support back on demand. Now we want to publish
> copy-before-write filter, and instead of thinking how to pass
> use-copy-range argument to block-copy (create x-block-copy parameter
> for new public filter driver, or may be set it by hand after filter
> node creation?), instead of this let's just drop copy-range support in
> backup for now.
> 
> After this patch copy-range support in block-copy becomes unused. Let's
> keep it for a while, it won't hurt:
> 
> 1. If there would be request for supporting copy_range in backup
>     (and/or in a new public copy-before-write filter), it will be easy
>     to satisfy it.
> 
> 2. Probably, qemu-img convert will reuse block-copy, and qemu-img has
>     option to enable copy-range. qemu-img convert is not a backup, and
>     copy_range may be more reasonable for some cases in context of
>     qemu-img convert.
> 

Actually, I know one case, where copy_range for backup job may be reasonable:

Using backup in push-backup with fleecing scheme in

    [PATCH 0/6] push backup with fleecing

Of-course, no real sense in using push-backup-with-fleecing scheme with both temp image and final backup target being on the same file system (no benefit of fleecing, we can use simple backup without temporary image).

But we absolutely don't care about fragmentation of temp disk.

Still, it doesn't make sense, as temp-image and real-backup-target should not be on same file-system..

Could it be some distributed filesystem, where it still make sense to call copy_range? Theoretically could.


Another thought: I'm going also to implement RAM-cache driver, to optimize push-backup-with-fleecing scheme. I'll need a way to copy data from RAM-cache node to final-target. I can implement copy_range for RAM-cache, and this will allow to not create extra buffer, but use the buffer that is already allocated and own by RAM-cache.. Still, this behavior is obviously good, it should work automatically, no reason to make it optional..


Hmm, so what should be summarized:

- Actually, block-copy does copy_range. So, probably it's good to change the copy_range() function in qemu to fallback to read+write..

And about copy_range itself, what we want:

1. We want to control does it influence fragmentation of source disk. When copying from temporary image we don't care. But when source of block-copy is active disk in we do care to not influence how original disk lay in filesystem. Probably, we even want an option for copy_range() syscall to control this thing.

2. We want to be efficient with copy_size, ie size of chunks to copy. We even have existing issue in block-copy: write-zero is limited to BLOCK_COPY_MAX_BUFFER which is obviously inefficient.

For copy-size we should have some good defaults or automatic detection logic..

For copy_range fragmentation..

If we have some internal copy_range-like optimizations like zero-copy from RAM-cache node, or maybe copy compressed data from one qcow2 node to another without decompression, it should be done anyway, it shouldn't be set by user option. Still, for file-posix, we don't know, does underlying filesystem copy_range() implementation lead to fragmentation or not. And we don't know is user OK with it or not. So we need an option.. So, it's probably better to keep x-perm.copy-range for now, until we don't have a good idea on interface.

-- 
Best regards,
Vladimir

