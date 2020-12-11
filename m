Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC772D75F1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:47:47 +0100 (CET)
Received: from localhost ([::1]:54722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhpq-0001WK-9L
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knhoN-0000xN-5h; Fri, 11 Dec 2020 07:46:15 -0500
Received: from mail-eopbgr80120.outbound.protection.outlook.com
 ([40.107.8.120]:37150 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knhoE-0007gE-Uk; Fri, 11 Dec 2020 07:46:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdySoh3jynvqMceSd4vaGmph5VjNjNdR3KApxqK/owhOe98KFP9wuAhQZhISRnbfEBkAN/QGB3CpxFfexBgB57M3bzDx9PQ0/dEyFjbTljwo4ScZ9kEapAty3cO4j/aQ65KfJiEb72twGo54yhJMD+KWEATs3MugsChCaA00MHq8Y+1hUdWVXFlA83KZ05p9vdHYnHLK8HPjekpCF5HaFWK1T3+mXYe86ymRVwtAFkznLaL0ULVQlatk96YIWVUk1Tj5aCrUkSSXSuodZHMyyOUClLmgLFvVNdDJ4OaVydGi3QrAgUePeVfNfU5P8gDrWCrEHR3f+OaHHPlRObxooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mvla4UmbMaivf9wqA/5RJPJkGnz00GabEGomShjvY8=;
 b=iw+vv54lDkdYEGAkGQF0m/nRFL1A0LCdUjtR3KnAWI87szM/jVk6m92sksQggmLaXsRAk6tGVqJjpWVRl1bpthFiczmzAqPF9U+PcWe++WlJCN8dO125IvPIrV1tz4m2k3sCQWyr7x1TqnWkNAOijQl9fQg7ORq5ikfPFThGZck57ac2OEhSKydSr0EqnG+DdTb0UraJ2++fQovd9x5hcNVTDy+VTy0RvMA6jjYbyT2sOhQSpkZ2hnbcdCf4A6rLy203Ox6vtXfdrucnelfkYtjBvS1SIkkcAVhUJhVMQqY+s6FqeseT4nq7TtDiV7+BCreK4yPHyEz5haVUq2mgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mvla4UmbMaivf9wqA/5RJPJkGnz00GabEGomShjvY8=;
 b=DHMZNnGs0aC4hbMmERJVeUnKFWalXcl81r0haa12HHMxSYE29UMz7jGKcJPro5PuKwOZ8vjqauguWA6nLTPcrc0ygJZape1qFq7eA1xYYyVIjkWRB8/iT7fDO2qEdueFfqnWdTRNAOUePUPCHvJ/TZ3biNN+4UUDqdXkbvYx4js=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 11 Dec
 2020 12:46:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 12:46:00 +0000
Subject: Re: RFC: don't store backing filename in qcow2 image
To: Peter Krempa <pkrempa@redhat.com>
References: <20581556-6550-e0f7-aca9-6b4034821f6c@virtuozzo.com>
 <20201211094404.GI2986915@angien.pipo.sk>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <ceb9c073-cc50-c92e-78f3-fd261c48c53a@virtuozzo.com>
Date: Fri, 11 Dec 2020 15:45:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <20201211094404.GI2986915@angien.pipo.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0103.eurprd04.prod.outlook.com
 (2603:10a6:208:be::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM0PR04CA0103.eurprd04.prod.outlook.com (2603:10a6:208:be::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 12:45:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee67c5e7-b5fc-46e4-3a9a-08d89dd2b693
X-MS-TrafficTypeDiagnostic: AM6PR08MB5256:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB525614DBFECCB62198F6007BC1CA0@AM6PR08MB5256.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97D+jvq/cIc5shTjQhplQEkE7A4XiUWSI25o6/gGBG41T+DM8c1dE+qWWEjFez/rnrPocHXYJulaTjStu6q0vEy0yzJ61khqSK8JqkxD38oXaNKdoJFgregIfRb8NNqXSZpeyPxR78ZztoG3o5l2I6ZwVN+bofC8FMAdqcuVrodXBaoXj3NQNywgIJNHa40w8QXyAs0NMPV7evXGIW3SxhElCKm0FkHROhnvB+/uUCwY1Hge9Tw0s1LqI3l20hFEP4KeurHv6LHczwvaCEItZVJRLi5W+bS26k0cQH1TEBtQ90YUEfb78sEx0FVJK5NpdUWbR2EGpu+Ho8nJNF6nHionWwwUiNl7UfeJX6wklG+sBGvbQKv10mOHaJ6Le+ZvJCBBckOxFziid1vW767UrlE9PKUryQglEl8wyLmAXaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39840400004)(396003)(136003)(16526019)(66476007)(54906003)(16576012)(31686004)(66556008)(6486002)(86362001)(186003)(316002)(52116002)(478600001)(31696002)(8936002)(36756003)(2616005)(956004)(2906002)(53546011)(66946007)(5660300002)(8676002)(4326008)(26005)(6916009)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R2hrR2MyMDlYT3p6SnVJd0gxZjFKaUVnSjFCVUlndzI2VFY3bGdnUlA5MFp4?=
 =?utf-8?B?cERyUHZCNXVsdlB3Y3hxdWNFUnVBeWhvQ1BaV2hNOW11bzRXNm1oZzdFdnJX?=
 =?utf-8?B?S3ZsK3FzNDA3N1pKTVlOS0NONTlHcEtscnBCT1NiTHFZazFKYWxpcERJQzkx?=
 =?utf-8?B?bGhIbFZMa0lnTUdRK1lybVdQU2tpTUQ0VWdvL0FPWWdyMVdteGpDenF2OGpJ?=
 =?utf-8?B?RExWZ1drbk8zOTVhRWF1OHA3cUkyRkVkMGQveUNFbWM5SHhQZjBRY1ZRbkQ4?=
 =?utf-8?B?TUpCMEkzMHpEMk1RdzNWME1qZHFGVld2VEZMUEF2cVdxVzQ4WjlZWEpidHlJ?=
 =?utf-8?B?ZG9GYm5QTGhqYWFieXBRWlpSV0FmbmgrMStVcU8wK245Q29iaEtMckdoOFBs?=
 =?utf-8?B?OHJYTUNuaDZyaFJ2NTlHQnF3RkF1c25LUHpaT1doZ29XSnNEL0JOTkRjS1VQ?=
 =?utf-8?B?U2Z0UGk5TDN3QlJOd2MzeTRoWTdDdWxMWXd1UUQvYXJDdWJDQkNkK2RDWmd3?=
 =?utf-8?B?OUwzcUlKOUk3bThJVkRucE1HaG5jQ1F3dUVIMGhWZGNkbEtlK2dQdnlCemI4?=
 =?utf-8?B?RSt4QkJ2dFJRMndBbGpHbG9VbTdWSTF5SGtFZGdqa2UrZDUxOW5lUC85cXRJ?=
 =?utf-8?B?TXFOWkxiWGx4VWN3N2lpVWVzY1lXSE9NZkNXczBxYkpNcWF0WXlFbjJrbG1s?=
 =?utf-8?B?dHAwMUJvMjh6RStWa3FlRzdhYzNlZDFJNmVzaFYyVDB6VTNWTHRubTMrcWNK?=
 =?utf-8?B?V3RYcXhyT09iL2UvZVNjbjBKQkFLa1p0VkVySlZZY3l6WCtMN1MzZVVSbXhh?=
 =?utf-8?B?VDVhdGl0QjErWlN3dTdrLytyZ0hIeXpRbFVCdHFNSWdvM1dWSFhLYm00dnRt?=
 =?utf-8?B?dEtKbm51K09xRnl2RXVCUGFKODFPUlpOWE9GMzNCL0h5ank1NnNpOGU3VEUx?=
 =?utf-8?B?MjFwZ2RSZkdYaGloN0I4azVIYlpRT08wT1k3SEhOdFloZEhZYlB4OGJxRmpR?=
 =?utf-8?B?YXBEL0tkZ05heE42ZWZVY3hrUnVIUm9aWFdtTTN0UkR6UWQrVFQ4bE9uVWZK?=
 =?utf-8?B?OW8yNStyV3h0ZnVwMldBRkswbXVUcVd2dDViVWkzUFY5VUNxVnBLRW5tcFZi?=
 =?utf-8?B?dzlLemhkbWYzUFV4bmlVa3ZBTkRJcFd6YlV6N0xIdmkwdlUvdk9LZXowZm5r?=
 =?utf-8?B?Ky9hajNDY1c3SUZlTkVZNjlzYlcrM3FTenhZWTJGSGYrU1JOaUR5aVE5MGVK?=
 =?utf-8?B?cEpsZFRQSjBrc3NhNElhNEQyNHBrU2YrU0NVTDQ1WDhBWk9XYzdFZDFPQ0Rl?=
 =?utf-8?Q?PwUu5qu2EORTM4uoDTsHE74YsNsvwKdM0R?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 12:46:00.3216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: ee67c5e7-b5fc-46e4-3a9a-08d89dd2b693
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Uxnrws3cVj0OUPTgM63Ko8qj/o3caW7Nxa7M84FQDzHPKmg9bSna4jE09ixeq/jg1Ux6LAtCF1t51wCwGODkH/YvdZeEPZwjapAMIs3+gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5256
Received-SPF: pass client-ip=40.107.8.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu block <qemu-block@nongnu.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Nikolay Shirokovskiy <nshirokovskiy@virtuozzo.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

11.12.2020 12:44, Peter Krempa wrote:
> On Thu, Dec 10, 2020 at 17:26:52 +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Hi all!
> 
> Hi,
> 
>>
>> I have an idea, that not storing backing filename in qcow2 image at all may be a good thing. I'll give some reasons and want to know what do you think about it.
>>
>> 1. Libvirt has to manage and keep in mind backing chains anyway.
>>
>> This means, that storing this information in qcow2 header is a source of bugs when we update it in one place but failed/forget to update in another. Of course, Libvirt is not the only user of qemu.. But we are moving to "blockdev" anyway, when management tool should control all node-names at least. It would be strange to not control the relations between images in the same time.
> 
> At the same time many users depend on this. If you move in images from
> another host, you'd have to remember the dependencies/order.
> 
>> 2. backing file name specified in qcow2 metadata doesn't relate to any other thing, and nothing rely on it.
>>
>> 3. calculating and updating backing file name in Qemu is a headache:
>>     - with some options specified or with filters we risk to write json filenames into qcow2 metadata, which is almost never what user wants. Also, json may exceed the qcow2 limitation of backing_file_size to be <= 1023
> 
> As long as it works (libvirt and qemu have parsers for json:) I don't
> think the user cares.
> 
>>     - updating it in transactional way for read-only image during reopen, when another transactional permission update is ongoing is difficult (who know, how to do it?) (remember recent d669ed6ab02849 "block: make bdrv_drop_intermediate() less wrong")
>>
>> 4. Moving qcow2 files to another directory is a problem: you should care to update backing file names in all dependent qcow2 images.
> 
> Or alternatively use relative names.
> 
>> So, what about moving libvirt (at least) to not rely on backing file name stored in qcow2 image? Backing chain then should be in xml? Is it hard or not? Finally, will it make the code simpler, or more difficult?
>>
>>
>> Then, if the idea is good in general, what to do on Qemu part? If we want to finally get rid of problem code (see [3.]) we should deprecate something.. Just deprecate support for qcow2 images with backing file specified, requiring user always specify backing chain by hand? I don't see anything that should be changed in qcow2 format itself: no reason to add some kind of restricted bits, etc..
> 
> I think this will create headaches for many users. Libvirt does support
> specification of the chain manually, but doesn't mandate it.
> 
> It's also a fairly recent addition to libvirt so I doubt that any other
> project which uses libvirt only for a part of the functionality (such as
> oVirt or openstack) picked up the full specification of chain in the
> XML. The problem here is that libvirt isn't used for the whole knowledge
> state here. Rather projects like oVirt feed us a new XML every single
> time. This means that they'd need to start keeping the chain info
> internally too.
> 
> Rather they currently rely on our detection code and the proper setting
> of paths in the image, and thus removing it would be a rather serious
> regression in behaviour, which would be visible beyond libvirt without
> any way for us to make it opaque to higher levels.
> 

Thanks for explanation.

Hmm, yes, it sounds like we'll never drop support for filename-based backing chain. And if we can't drop the support, no reason to deprecate it.

-- 
Best regards,
Vladimir

