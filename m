Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC9324300
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 18:14:37 +0100 (CET)
Received: from localhost ([::1]:59880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExkC-0000YA-Ov
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 12:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExUi-0003OA-Pv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:36 -0500
Received: from mail-eopbgr20104.outbound.protection.outlook.com
 ([40.107.2.104]:47390 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lExUf-00079L-2t
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:58:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWN/FPqBZxZHusODPzU5ViM/K1VNfqRXul4Uqibk/6vTS4yDqNYMDfL5XtdcxHMdZMuMa4D4/YXZGV5hNt/E12V+6gt25YXavx5jpqoVn8x4BJzybp+RQzPcMT8StE77P1X53qQhImwum8AKKJiNl67rILRP7ybTupD2XWtUrCBJ0JoYwB3esDLhQ9EKjedI25AHE1wc3Coxy6Zm/ont4qwLenTLvE/eqKlEIZ2Qsvq01qIwJhU5ulM5CIshlFk7Yff2rJTV525qCLa/p0HNKRo5wqgm4dkIpwnFpw67r373ZJzUnw0gF8CUV9yA6dey2cdDNgRPiDn0Qg5tD0wu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbFH82maFOLxV4LhBIJ7WcJKdEoibhvRfpRArxlBKbM=;
 b=E63hMzVJs1rzPJYVOlIh/4P+8eY2z81485u3rC5gjB//eqKFbCyqxm2mr2HpXS05EMB/pjIz8+MOpFYuu4ATnKoqzizrkGG7SgiGOlWc0l51LKtN1LyqIJXJwr2lp4asb9VBGEXna6JCzA2nuf7XdxfwCFQ67vSF7rmyp4KD2Sm7vcxnf+Aua2Hv4i7HO+CfFZ/r0R1AzJ54n5KXO/Yg/kWJRpmUtRkpATTnty1qcpZIk9p8rIVpvWa1AD1TmWg+NuttQtVUZgKjrN2SsLRCv3Bf89Gw1fW32rycXTOiHaeNcr2HosPoJq01lquX5Fya9qncHMUWnlb9tkngLO35iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbFH82maFOLxV4LhBIJ7WcJKdEoibhvRfpRArxlBKbM=;
 b=GL74yaejjPoswx2xQKZq21hE9OXMsawPaz0wGVt2dzW7KE8bDw4mN//niC50+D2wQuZNtf2/Zo5LGB2nM6IzDeujnAjbFgh5biGK5bBrV/t66RBTu7ORnjhgoj5b/Qb4LQDEMt3qRojOoZaP4YzuV7B3VQvsgmNlQbBnp3nd0nM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM8PR08MB5651.eurprd08.prod.outlook.com (2603:10a6:20b:1c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 16:43:27 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3890.019; Wed, 24 Feb 2021
 16:43:27 +0000
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Den Lunev <den@openvz.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
 <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
 <20210219205052.GK6669@xz-x1>
Message-ID: <d5abc500-a7b2-cf25-db88-b6d4284b910f@virtuozzo.com>
Date: Wed, 24 Feb 2021 19:43:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210219205052.GK6669@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------9F178A795734153A382198C8"
Content-Language: en-US
X-Originating-IP: [109.252.109.82]
X-ClientProxiedBy: AM4PR07CA0032.eurprd07.prod.outlook.com
 (2603:10a6:205:1::45) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (109.252.109.82) by
 AM4PR07CA0032.eurprd07.prod.outlook.com (2603:10a6:205:1::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.11 via Frontend Transport; Wed, 24 Feb 2021 16:43:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef6f4368-b938-4dd4-bf52-08d8d8e34f3a
X-MS-TrafficTypeDiagnostic: AM8PR08MB5651:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM8PR08MB56517CD63B773AD2F8B57B289F9F9@AM8PR08MB5651.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MUmlgtUGAuP37mV5sntuio3YJUjdFOkWL9aeCQRnZ2a5iE2qiBKOoZHlaUil7o3Z+IiDg9G2rrv2c2a/5fCAwWQmVkzhE9KCESWKrMzyIfJ/mnq/oKPXfT19jDmnW3hQy0AzPIGon7SM7oQqpg3X+IRdx1vcUHJkUKxasaWYBBs9fKv2iNl2UM0JVdSmt7b7JKOk8EWnsBE/WVjvHe4U8+Z/l5hO8VySNRNI1fXhACSHr3tklFPU7gKl1bnd6SXTqYkR+auIxSmUwelqpALTi4wLVR1ogdRjOUp28kozG4gTAt6OqhQ0GDlLydp89d/FaLw+w2ZmIZkdUU6KWrR1jvhhQaWwpt1wwz4gUcVE77dqQ0z5e4nSi2a1oDxvCoKAzq7rDjVXWqnMmvxb+hAjMaNTp7geaFi4TyKZA6gDLo9Jw10EkWy/Uvaz6tjNy88L6qJUGokuUUtYvMlLvI+WUZSWJuGt9Q6onW3R6ZtVygJuTjxW8opoulEj/BMMS+GAs/3Le752mbe0BLrYP+HRIhO8B61h5uBtCKeX5SCamcguxy581mPF4dNphCAamfJT3ZKlDAXq+wRpLt8Erfw3s3DSFla/1Dg+K5SLLod+0uo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(396003)(376002)(136003)(366004)(346002)(31696002)(52116002)(4326008)(31686004)(53546011)(54906003)(2616005)(86362001)(66556008)(6916009)(33964004)(5660300002)(16526019)(956004)(316002)(83380400001)(186003)(478600001)(2906002)(8936002)(6486002)(66476007)(36756003)(8676002)(66946007)(26005)(44832011)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cFVhVzFmOUlrQWx3SnpJY25FQlQybW1HWEJHdTFNS2NQQVBlWk1kdGptcFF1?=
 =?utf-8?B?OHBzYjBhWnJCd3pZMUlrUjFuMWZqRVNuWktJaEp5OGJxVUJyTE5SdmUyeFZ2?=
 =?utf-8?B?Umg2S2FKK3IvME1ydWw0OHQ0RDFKb0hXc3MycnZXZHprOThMaFJJNHlWQ3po?=
 =?utf-8?B?TDRDSlZwanM5a1Y1eG13cU5PaWdLcVM2eThpemd0aEtEbnJ5NE96cXR6YTRr?=
 =?utf-8?B?WlR6Zm12cUNJYXBTc0xvN3RsU3piMzFQcnIrcWhnc1pub3JXNDZQcmVWK243?=
 =?utf-8?B?Y0R0ZURKRXNxNzVMSTF6VzVtVmhXbjhpNzE3SldFZ0RjbmVZRktSL0FUTmFK?=
 =?utf-8?B?VjVPZWRqcWRIWXVFZ2NMNEhPUXM0ckI2SHN3VWM5QVIwZllBLzRWK3BlYURY?=
 =?utf-8?B?UHdZMDRSMFhFRlpHQU9GK052eHdwQ09pMlRXUW5kQ1RnSjZndFFOT3M5bFpR?=
 =?utf-8?B?RVEyc0Q4bStEYjlqelRhNzdyOXN4S0hjajg4VTVPbjRXZE52MzVPbnVybFha?=
 =?utf-8?B?Qnk3ekdHSWhMZkw1ck5sRGU4UkFseHBVcThuQkZqNVF5ZElScFZ5WnRzSGhK?=
 =?utf-8?B?c1RCUzVlb2lnOW1VNnRBMlFONkE0MEFlU1lIN2lIaUFobWVuSXhTMGcvWWsy?=
 =?utf-8?B?QVFyQ0ppTFhVRGpYTGRmYkZtU2IrZHpOZ2RVSEtPUDV3VnVSNnFrdVExeFV4?=
 =?utf-8?B?TGI0bnNBb0RsdUFIU3F2ZHIreGwvVmVuVHNYa3hJOTBsOUY1TzNBblc5eVdI?=
 =?utf-8?B?RzNZTCtybWYwMlJvK1BiZThOaDR6MHhOaUVld1VEcU5wRGxDb0YxdDZnWUlF?=
 =?utf-8?B?bXlwUTRrMGJJcWxkTDA3NHliQ3JkY3JYWFEvM1VKV2NzYlVHRzJqNG12MUl1?=
 =?utf-8?B?SHl2Vm1jTmJhNkZFQTZDbzFYR0VRdHE3RWl2ZzFPOGozSDhaVitUUFBKQ29s?=
 =?utf-8?B?ZFdpY2tEY21kc0hSREpLdGVoQWRYNUY5azhtU0xJUTB4aHFBZG5CNVhnN0Zu?=
 =?utf-8?B?R1NhNVdVZ1pzeml6cUNiMm1XVjVVckpqV3FmN3UydFh2L1JBMG5yeTk5QWht?=
 =?utf-8?B?NjVyR2U5SVBDQW1IOHJlZHFJYndySnF3Sm4vQU1mMlQ4NHMrNE5sL09qSGxQ?=
 =?utf-8?B?VFZtdGE2dTNEWE4vOVpnUWd5ZTB4TlpmNXhScnBhR3RTMTRtdHdMQ0JKd21U?=
 =?utf-8?B?S1BUc29HUUNHT2loK2dRUjVrNzlGNUVRT2VYT05mMStxa0FTMWFXeWFCZlpu?=
 =?utf-8?B?SXgvS0VzSElyTEJiTCtaMlMyZlJrVk5BOFdSNXZHVllBK1pKUi9xQVFSYlpy?=
 =?utf-8?B?UkdBaUlhTGo5TUJxUVI3d2swOEhRT0J0QWdhemlZK3RDeG0xN2ZvOURmenpI?=
 =?utf-8?B?M0xlbFZYN1Z1cjRiMHpxWXVHWWtGbVBld09ZdGpnWFRCWXhlb3BPelI3ZHFR?=
 =?utf-8?B?U2x4aGkxTys3ekh2WFFsMFhHd3VQcnpPZC9sWm1aRS9BSHZWR0ZpelNqYmlZ?=
 =?utf-8?B?cjZOUzRDVUorMkhjelFkS3oxL01HemNBZk9oMmpwQjQwNnh4MzE1VmVuL2ZT?=
 =?utf-8?B?RUFoSEpxMFR2WndMZU5oT1FsUzNyU0hkMjRGMDltdTFUbmpIYnQwTk5JbW9p?=
 =?utf-8?B?ZTJLZnQxbkJ5NWxkRWhlQnh6bDMydU1QaC9Zb0cxRUlNUUhVTWZ1SGNOR3p1?=
 =?utf-8?B?bHZaV2o3TUpnb1NuMkxDMmJJZGhZWjUvU2F4Z2o5ZGVkYWNuZjhJR1lvd2Iy?=
 =?utf-8?Q?aNlAVKTM3yoNnYpSuSsMuzkVt5rIAoUPGsy36ge?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6f4368-b938-4dd4-bf52-08d8d8e34f3a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 16:43:27.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXrRjBS4m6VuvzSfUNhyX7idmEAUYDUKoo5iEtr5aATVZTdREshOeGmtN1lidzz4cTR84gvR8YBQ2J1nzX4gyinntnojuCXYoZi8Y6NWqLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5651
Received-SPF: pass client-ip=40.107.2.104;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------9F178A795734153A382198C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.02.2021 23:50, Peter Xu wrote:
> Andrey,
>
> On Fri, Feb 19, 2021 at 09:57:37AM +0300, Andrey Gruzdev wrote:
>> For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
>> code more to get clear with it.
> Yes it's very tricky on how the error could trigger.
>
> Let's think of below sequence:
>
>    - Start a guest with init_on_free=1 set and also a virtio-balloon device
>
>    - Guest frees a page P and zeroed it (since init_on_free=1). Now P contains
>      all zeros.
>
>    - Virtio-balloon reports this page to host, MADV_DONTNEED sent, then this
>      page is dropped on the host.
>
>    - Start live snapshot, wr-protect all pages (but not including page P because
>      it's currently missing).  Let's call it $SNAPSHOT1.
>
>    - Guest does alloc_page(__GFP_ZERO), accidentally fetching this page P and
>      returned
>
>    - So far, page P is still all zero (which is good!), then guest uses page P
>      and writes data to it (say, now P has data P1 rather than all zeros).
>
>    - Live snapshot saves page P, which content P1 rather than all zeros.
>
>    - Live snapshot completed.  Saved as $SNAPSHOT1.
>
> Then when load snapshot $SNAPSHOT1, we'll have P contains data P1.  After
> snapshot loaded, when guest allocate again with alloc_page(__GFP_ZERO) on this
> page P, since guest kernel "thought" this page is all-zero already so memzero()
> is skipped even if __GFP_ZERO is provided.  Then this page P (with content P1)
> got returned for the alloc_page(__GFP_ZERO) even if __GFP_ZERO set.  That could
> break the caller of alloc_page().

Yep, that's quite clear.

>> Anyhow I'm quite sure that adding global MISSING handler for snapshotting
>> is too heavy and not really needed.
> UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  There'll
> definitely be overhead, but it may not be that huge as imagined.  Live snapshot
> is great in that we have point-in-time image of guest without stopping the
> guest, so taking slightly longer time won't be a huge loss to us too.
>
> Actually we can also think of other ways to work around it.  One way is we can
> pre-fault all guest pages before wr-protect.  Note that we don't need to write
> to the guest page because read would suffice, since uffd-wp would also work
> with zero pfn.  It's just that this workaround won't help on saving snapshot
> disk space, but it seems working.  It would be great if you have other
> workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.
>
> Thanks,
>
Just to add: one of the good options is too keep track of virtio-baloon discarded pages and
pre-fault them before migration starts. What do you think?

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


--------------9F178A795734153A382198C8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 19.02.2021 23:50, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210219205052.GK6669@xz-x1">
      <pre class="moz-quote-pre" wrap="">Andrey,

On Fri, Feb 19, 2021 at 09:57:37AM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">For the discards that happen before snapshot is started, I need to dig into Linux and QEMU virtio-baloon
code more to get clear with it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Yes it's very tricky on how the error could trigger.

Let's think of below sequence:

  - Start a guest with init_on_free=1 set and also a virtio-balloon device

  - Guest frees a page P and zeroed it (since init_on_free=1). Now P contains
    all zeros.

  - Virtio-balloon reports this page to host, MADV_DONTNEED sent, then this
    page is dropped on the host.

  - Start live snapshot, wr-protect all pages (but not including page P because
    it's currently missing).  Let's call it $SNAPSHOT1.

  - Guest does alloc_page(__GFP_ZERO), accidentally fetching this page P and
    returned

  - So far, page P is still all zero (which is good!), then guest uses page P
    and writes data to it (say, now P has data P1 rather than all zeros).

  - Live snapshot saves page P, which content P1 rather than all zeros.

  - Live snapshot completed.  Saved as $SNAPSHOT1.

Then when load snapshot $SNAPSHOT1, we'll have P contains data P1.  After
snapshot loaded, when guest allocate again with alloc_page(__GFP_ZERO) on this
page P, since guest kernel &quot;thought&quot; this page is all-zero already so memzero()
is skipped even if __GFP_ZERO is provided.  Then this page P (with content P1)
got returned for the alloc_page(__GFP_ZERO) even if __GFP_ZERO set.  That could
break the caller of alloc_page().
</pre>
    </blockquote>
    <pre>Yep, that's quite clear.
</pre>
    <blockquote type="cite" cite="mid:20210219205052.GK6669@xz-x1">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Anyhow I'm quite sure that adding global MISSING handler for snapshotting
is too heavy and not really needed.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  There'll
definitely be overhead, but it may not be that huge as imagined.  Live snapshot
is great in that we have point-in-time image of guest without stopping the
guest, so taking slightly longer time won't be a huge loss to us too.

Actually we can also think of other ways to work around it.  One way is we can
pre-fault all guest pages before wr-protect.  Note that we don't need to write
to the guest page because read would suffice, since uffd-wp would also work
with zero pfn.  It's just that this workaround won't help on saving snapshot
disk space, but it seems working.  It would be great if you have other
workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.

Thanks,

</pre>
    </blockquote>
    <pre>Just to add: one of the good options is too keep track of virtio-baloon discarded pages and
pre-fault them before migration starts. What do you think?
</pre>
    <pre class="moz-signature" cols="72">-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                virtuzzo.com</pre>
  </body>
</html>

--------------9F178A795734153A382198C8--

